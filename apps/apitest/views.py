from django.shortcuts import render
from rest_framework import viewsets,views,status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from apps.kcauth.authorizations import JWTAuthentication
from .models import Project,Host,Api,ApiRunRecord,Case,CaseArgument,ApiArgument,CaseRunRecord,CaseApiRunRecord
from .serializers import ProjectSerializer,HostSerializer,ApiSerializer,ApiRunRecordSerializer,CaseArgumentSerializer,CaseSerializer,CaseRunRecordSerializer,CaseApiRunRecordSerializer


from . import lhrequest
from utils import dictor

class IndexView(views.APIView):
    def get(self,request):
        project_count =Project.objects.count()
        api_count = Api.objects.count()
        case_count = Case.objects.count()
        api_record_count = ApiRunRecord.objects.count()
        case_record_count = CaseRunRecord.objects.count()

        data={
            'count':{
                'project': project_count,
                'api': api_count,
                'case': case_count,
                'api_record': api_record_count,
                'case_record': case_record_count
            }
        }

        return Response(data)


class ProjectViewSets(viewsets.ModelViewSet):
    queryset = Project.objects.all()
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    serializer_class = ProjectSerializer


class HostViewSets(viewsets.ModelViewSet):
    queryset = Host.objects.all()
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    serializer_class = HostSerializer


class ApiViewSets(viewsets.ModelViewSet):
    queryset = Api.objects.all()
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    serializer_class = ApiSerializer


# 运行请求
class RunApiView(views.APIView):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    def post(self, request, api_id):
        api = Api.objects.get(pk=api_id)
        resp = lhrequest.request(api)
        record = ApiRunRecord.objects.create(
            url=resp.url,
            http_method=resp.request.method,
            return_code=resp.status_code,
            return_content=resp.text,
            data=resp.request.body,
            headers=api.headers,
            api=api,
            user=request.user
        )
        serializer = ApiRunRecordSerializer(record)
        return Response(serializer.data)


class CaseView(views.APIView):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]



    def post(self, request):
        serializer = CaseSerializer(data=request.data)
        if serializer.is_valid():
            name = request.data.get('name')
            arguments = request.data.get('arguments')
            api_list = request.data.get('api_list')
            description = request.data.get('description')
            project_id = request.data.get('project_id')


            #创建用例
            case = Case.objects.create(
                name=name,
                description=description,
                user=request.user,
                project_id=project_id
            )

            #处理用例参数
            if arguments:
                for argument in arguments:
                    CaseArgument.objects.create(
                        name=argument['name'],
                        value=argument['value'],
                        case=case
                    )


            #处理API列表
            if api_list:
                api_list = sorted(api_list,key=lambda x:x['index'])
                for api in api_list:
                    api_model = Api.objects.get(pk=api['id'])
                    case.api_list.add(api_model)
                    api_arguments = api['arguments']
                    if api_arguments:
                        for api_argument in api_arguments:
                            ApiArgument.objects.create(
                                name=api_argument['name'],
                                origin=api_argument['origin'],
                                format=api_argument['format'],
                                api=api_model
                            )

            case.save()
            return Response(CaseSerializer(case).data)
        else:
            print(serializer.errors)
            return Response(status=status.HTTP_400_BAD_REQUEST)


    # 编辑操作
    def put(self,request,case_id):
        serializer = CaseSerializer(data=request.data)
        # 获取元素
        if serializer.is_valid():
            name = request.data.get('name')
            arguments = request.data.get('arguments')
            api_list = request.data.get('api_list')
            description = request.data.get('description')
            # project_id = request.data.get('project_id')

            case = Case.objects.get(pk=case_id)
            case.name = name
            case.description = description


            # 处理用例参数
            if arguments:
                argument_model_list = []
                for argument in arguments:

                    if argument.get(id, 0) == 0:
                        argument_model = CaseArgument.objects.create(
                            name=argument['name'],
                            value=argument['value'],
                            case=case
                        )
                    else:
                        argument_id = argument['id']
                        argument_model = CaseArgument.objects.get(pk=argument_id)
                        argument_model.name = argument['name']
                        argument_model.value = argument['value']
                        argument_model.save()
                    argument_model_list.append(argument_model)
                case.arguments.set(argument_model_list)
            else:
                case.arguments.set([])

            #处理API及其参数
            if api_list:
                api_model_list = []
                for api in api_list:
                    api_model = Api.objects.get(pk=api['id'])
                    api_arguments = api['arguments']

                    # 处理API参数
                    if api_arguments:
                        argument_model_list = []

                        for api_argument in api_arguments:

                            if api_argument.get(id, 0) == 0:
                                argument_model = ApiArgument.objects.create(
                                    name=api_argument['name'],
                                    origin=api_argument['origin'],
                                    format=api_argument['format'],
                                    # case=case
                                )
                            else:
                                argument_id = api_argument['id']
                                argument_model = ApiArgument.objects.get(pk=argument_id)
                                argument_model.name = api_argument['name']
                                argument_model.origin = api_argument['origin']
                                argument_model.format = api_argument['format']
                                argument_model.save()

                            argument_model_list.append(argument_model)
                        # 绑定参数
                        api_model.arguments.set(argument_model_list)
                    else:
                        api_model.arguments.set([])
                    # 处理完API的参数需要重新保存
                    api_model.save()
                    #更改列表
                    api_model_list.append(api_model)

                case.api_list.set(api_model_list)
            else:
                case.api_list.set([])

            #  重新保存用例对象
            case.save()
            return Response(CaseSerializer(case).data)
        else:
            print(serializer.errors)
            return Response(status=status.HTTP_400_BAD_REQUEST)

        # 删除操作
    def delete(self, request, case_id):
        serializer = CaseSerializer(data=request.data)
        # 获取元素
        if serializer:

            case = Case.objects.get(pk=case_id)

            case.delete()
            return Response("删除成功！")
        else:
            print(serializer.errors)
            return Response(status=status.HTTP_400_BAD_REQUEST)


class RunCaseView(views.APIView):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def post(self,request,case_id):
        case = Case.objects.get(pk=case_id)
        case_arguments = CaseArgument.objects.filter(case=case)
        case_record = CaseRunRecord.objects.create(case=case)

        global_arguments = {}
        #添加用例参数
        for case_argument in case_arguments:
            global_arguments[case_argument.name] = case_argument.value

        #运行API以及添加API参数

        api_model_list = case.api_list.all()
        for api_model in api_model_list:
            resp = lhrequest.request(api_model,global_arguments)
            CaseApiRunRecord.objects.create(
                url=resp.url,
                http_method=resp.request.method,
                data=resp.request.body,
                headers=resp.request.headers,
                user=request.user,
                return_code=resp.status_code,
                return_content=resp.text,
                api=api_model,
                case_record=case_record
            )

            #运行API后，看下是否还有参数需要提取
            api_arguments = api_model.arguments.all()
            if api_arguments:
                for api_argument in api_arguments:
                    dictor_data = {}
                    if api_argument.origin == 'HEAD':
                        dictor_data = resp.headers
                    elif api_argument.origin == 'COOKIE':
                        dictor_data = resp.cookies
                    elif api_argument.origin == 'BODY':
                        dictor_data = resp.json()
                    argument_value = dictor.dictor(dictor_data,api_argument.format)
                    global_arguments[api_argument.name] = argument_value
                    #{"token": "xxx"} = > token
        serializer = CaseRunRecordSerializer(case_record)
        return Response(serializer.data)

class RecordView(views.APIView):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    def get(self,request):
        record_type = request.GET.get('type')
        project_id = request.GET.get('project')
        if record_type == 'api':
            records = ApiRunRecord.objects.filter(api__project_id=project_id)
            serializer = ApiRunRecordSerializer(records,many=True)
            return Response(serializer.data)
        else:
            records = CaseRunRecord.objects.filter(case__project_id=project_id)
            serializer = CaseRunRecordSerializer(records,many=True)
            return Response(serializer.data)
