import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_common_demo/navigator_overlay/overlay_simple.dart';
import 'package:flutter_common_demo/network/network_util.dart';
import 'package:flutter_common_demo/network/print.dart';
/// 注册界面
class RegisterPage extends StatefulWidget {
  /// 倒计时的秒数，默认60秒。
  final int? countdown;
  const RegisterPage ({Key? key, this.countdown: 60}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  /// 账号编辑控制器
  final TextEditingController AccountController = TextEditingController();
  var accountNode = FocusNode();

  /// 密码编辑控制器
  final TextEditingController PwdController = TextEditingController();
  /// 密码编辑控制器
  final TextEditingController PwdSubController = TextEditingController();
  /// 用户名
  final TextEditingController EmailController = TextEditingController();

  /// 验证码
  final TextEditingController CodeController = TextEditingController();

  final FocusNode focusNodePhoneCode = FocusNode();
  Timer? _timer;
  int? _seconds;
  String _verifyStr = '获取验证码';

  /// 是否隐藏密码
  bool isShowPassword = false;
  bool? checked = false;

  var timeDown = ValueNotifier(-1);

  @override
  void initState() {
    super.initState();
    int? _seconds = widget.countdown;
    accountNode.addListener(() {
      if(!accountNode.hasFocus){
        var account = AccountController.text ?? "";
        if(account.length < 6 || account.length > 16){
          _accountTipState.value = true;
          return;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset('assets/images/bg_login_header.png', fit: BoxFit.cover, width: double.infinity, height: double.infinity),
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 10, top: 60),
                child: Icon(Icons.arrow_back_ios,color: Color.fromRGBO(48, 214, 194, 3)),
              )
          ),
          Column(
            children: const [
              SizedBox(height:100, width: 690),
              Text(" 注册 ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600,color: Color.fromRGBO(112, 112, 112, 1)),),
            ],
          ),
          Positioned(top: 120,child: registerBody(),)
        ],
      ),
    );



  }

  ///
  Widget registerBody() {
    return Container(
        width: 360,
        padding: const EdgeInsets.only(left: 10.0, top: 30.0),
        decoration: const BoxDecoration(
          //borderRadius: BorderRadius.all(Radius.circular(60)),
          // color: Colors.white,
        ),
        // return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  const SizedBox(height: 26, width: 260),
                  buildAccountInputWidget(AccountController),
                  const SizedBox( height: 8),
                  _buildAccountTip(),
                  const SizedBox( height: 8),
                  buildPasswordInputWidget(PwdController),
                  const SizedBox( height: 8),
                  _buildPasswordTip(),
                  const SizedBox( height: 8),
                  buildPasswordSubInputWidget(PwdSubController),
                  const SizedBox( height: 8),
                  _buildPasswordSubTip(),
                  const SizedBox( height: 8),
                  buildEmailInputWidget(EmailController),
                  const SizedBox( height: 8),
                  _buildEmailTip(),
                  const SizedBox(height: 26,),
                  buildCodeInputWidget(CodeController),
                  // SizedBox(height: 30,),
                  // PrivacyWidget(onChanged: (value) {checked = value;},),
                  const SizedBox(height: 26,),
                  buildRegisterButton(context),

                ],
              ),
            )
          ],
        ));
  }


  final _accountTipState = ValueNotifier(false); //是否展示错误提示
  Widget _buildAccountTip(){
    return Padding(padding: EdgeInsets.only(left: 20),
      child: ValueListenableBuilder<bool>(valueListenable: _accountTipState, builder: (context,value,child){
        return value ?  const Text("用户名格式有误",style: TextStyle(
            fontSize: 12,
            color: Colors.amber
        )) : const Text("请输入6-16位字符",style: TextStyle(
            fontSize: 12,
            color: Colors.grey
        ));
      }),);
  }


  Widget buildAccountInputWidget(TextEditingController controller) {
    return Container(
        width: 320,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0,2),
                blurRadius: 12,
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 20,),
            Image.asset('assets/images/register_person.png',width: 30,height: 30,),
            const SizedBox(width: 10,),
            Expanded(child: TextField(
              focusNode: accountNode,
              controller: controller,
              obscureText : false,
              maxLines: 1,
              onChanged: (value){
                _accountTipState.value = false;
              },
              inputFormatters:[
                LengthLimitingTextInputFormatter(16)
              ],
              decoration: const InputDecoration(
                hintText: '请输入用户名',
                hintStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(fontSize: 16,color: Color.fromRGBO(112, 112, 112, 1)),
              keyboardType: TextInputType.text,
            ))
          ],
        )
    );
  }

  final _passwordTipState = ValueNotifier(false); //是否展示错误提示
  Widget _buildPasswordTip(){
    return Padding(padding: const EdgeInsets.only(left: 20),
      child: ValueListenableBuilder<bool>(valueListenable: _passwordTipState, builder: (context,value,child){
        return value ?  const Text("密码格式错误",style: TextStyle(
            fontSize: 12,
            color: Colors.amber
        )) : const Text("请输入6-16位字符，不包含空格",style: TextStyle(
            fontSize: 12,
            color: Colors.grey
        ));
      }),);
  }

  Widget buildPasswordInputWidget(TextEditingController controller) {
    return Container(
        width: 320,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0,2),
                blurRadius: 12,
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 20,),
            Image.asset('assets/images/icon_lock.png',width: 30,height: 30,),
            const SizedBox(width: 10,),
            Expanded(child: TextField(
              controller: controller,
              obscureText : false,
              maxLines: 1,
              onChanged: (value){
                _passwordSubTipState.value = false;
                _passwordTipState.value = false;
              },
              inputFormatters:[
                LengthLimitingTextInputFormatter(16),
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
              ],
              decoration: const InputDecoration(
                hintText: '请输入登录密码',
                hintStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(fontSize: 16,color: Color.fromRGBO(112, 112, 112, 1)),
              keyboardType: TextInputType.text,
            ))
          ],
        )
    );
  }


  final _passwordSubTipState = ValueNotifier(false); //是否展示错误提示
  Widget _buildPasswordSubTip(){
    return Padding(padding: const EdgeInsets.only(left: 20),
      child: ValueListenableBuilder<bool>(valueListenable: _passwordSubTipState, builder: (context,value,child){
        return value ?  const Text("密码输入有误",style: TextStyle(
            fontSize: 12,
            color: Colors.amber
        )) : const Text("重复输入定义的密码",style: TextStyle(
            fontSize: 12,
            color: Colors.grey
        ));
      }),);
  }
  Widget buildPasswordSubInputWidget(TextEditingController controller) {
    return Container(
        width: 320,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0,2),
                blurRadius: 12,
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 20,),
            Image.asset('assets/images/icon_lock.png',width: 30,height: 30,),
            const SizedBox(width: 10,),
            Expanded(child: TextField(
              controller: controller,
              obscureText : true,
              maxLines: 1,
              onChanged: (value){
                _passwordSubTipState.value = false;
                _passwordTipState.value = false;
              },
              inputFormatters:[
                LengthLimitingTextInputFormatter(16),
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
              ],
              decoration: const InputDecoration(
                hintText: '请确认登录密码',
                hintStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(fontSize: 16,color: Color.fromRGBO(112, 112, 112, 1)),
              keyboardType: TextInputType.text,
            ))
          ],
        )
    );
  }

  final _emailTipState = ValueNotifier(false); //是否展示错误提示
  Widget _buildEmailTip(){
    return Padding(padding: const EdgeInsets.only(left: 20),
      child: ValueListenableBuilder<bool>(valueListenable: _emailTipState, builder: (context,value,child){
        return value ?  const Text("输入手机号/邮箱有误",style: TextStyle(
            fontSize: 12,
            color: Colors.amber
        )) : const Text("输入手机号/邮箱可用于登陆密码找回",style: TextStyle(
            fontSize: 12,
            color: Colors.grey
        ));
      }),);
  }
  Widget buildEmailInputWidget(TextEditingController controller) {
    return Container(
        width: 320,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0,2),
                blurRadius: 12,
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 20,),
            Image.asset('assets/images/icon_phone.png',width: 30,height: 30,),
            const SizedBox(width: 10,),
            Expanded(child: TextField(
              controller: controller,
              obscureText : false,
              maxLines: 1,
              onChanged: (value){
                _emailTipState.value = false;
              },
              inputFormatters:[
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.]')),
              ],
              decoration: const InputDecoration(
                hintText: '请输入手机号/邮箱',
                hintStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(fontSize: 16,color: Color.fromRGBO(112, 112, 112, 1)),
              keyboardType: TextInputType.text,
            ))
          ],
        )
    );
  }

  Widget buildCodeInputWidget(TextEditingController controller) {
    return Container(
        width: 320,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0,2),
                blurRadius: 12,
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 20,),
            Image.asset('assets/images/icon_message.png',width: 30,height: 30,),
            const SizedBox(width: 10,),
            Expanded(child: TextField(
              keyboardType:TextInputType.number,
              controller: controller,
              obscureText : false,
              maxLines: 1,
              onChanged: (value){
                _accountTipState.value = false;
              },
              inputFormatters:[
                LengthLimitingTextInputFormatter(16)
              ],
              decoration: const InputDecoration(
                hintText: '请输入验证码',
                hintStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(fontSize: 16,color: Color.fromRGBO(112, 112, 112, 1)),
            )),
            GestureDetector(
              onTap: (){
                if(timeDown.value == -1){
                  NetWorkUtil.instance.doPost("api/sms/send",params: {
                    "mobile":"18035941086",
                    "event":"register"
                  }).execute();
                  ToastUtil.show(context,"验证码已发送");
                }
                _startTimer();
              },
              child: Container(
                height: 30,
                width: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: ValueListenableBuilder<int>(
                  valueListenable:timeDown,
                  builder: (context,value,child){
                    return Text( timeDown.value == -1 ? "获取验证码":"${value}s",style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white
                    ));
                  },),
              ),
            ),
            const SizedBox(width: 10,),
          ],
        )
    );
  }

  Widget buildRegisterButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45,
        width: 270,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(48, 214, 194, 15)),                //背景颜色
              shape: MaterialStateProperty.all(const StadiumBorder(side: BorderSide(style: BorderStyle.none)))),
          child: const Text(' 注 册 ',  ),
          onPressed: () {
            var account = AccountController.text ?? "";
            if(account.length < 6 || account.length > 16){
              _accountTipState.value = true;
              return;
            }

            var pass = PwdController.text ?? "";
            if(pass.length < 6 || pass.length > 16){
              _passwordTipState.value = true;
              return;
            }

            var subPass = PwdSubController.text ?? "";
            if(subPass.length < 6 || subPass.length > 16 || subPass != pass){
              _passwordSubTipState.value = true;
              return;
            }

            var email = EmailController.text ?? "";
            printMsg("message===${validateEmail(email)}_${validatePhoneNumber(email)}");
            if(!validateEmail(email) && !validatePhoneNumber(email)){
              _emailTipState.value = true;
              return;
            }


            if(!validatePhoneNumber(email)){
              _emailTipState.value = true;
              return;
            }
            NetWorkUtil.instance.doPost("api/user/register",params: {
              "username": AccountController.text,
              "password":PwdController.text,
              "email":validateEmail(email) ? email : "",
              "mobile":validatePhoneNumber(email) ? email : "",
              "code":CodeController.text
            }).execute();

          },
        ),
      ),
    );
  }

  bool validateEmail(String email) {
    final RegExp emailRegExp = RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');
    return emailRegExp.hasMatch(email);
  }

// 验证电话号码
  bool validatePhoneNumber(String phoneNumber) {
    final phoneRegex = RegExp(r'^1[3456789]\d{9}$');
    return phoneRegex.hasMatch(phoneNumber);
  }

  signUP(){
    String account = AccountController.text;
    String pwd = PwdController.text;
    String email = EmailController.text;
    String code = CodeController.text;

    print("$account, $pwd, $email , $code");
  }

  /// 验证码输入框


  /// 启动倒计时的计时器。
  void _startTimer() {
    if(_timer?.isActive ?? false)return;
    timeDown.value = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timeDown.value = timeDown.value-1;
      if(timeDown.value == 0){
        timeDown.value = -1;
        _timer?.cancel();
        _timer = null;
        return;
      }
    });
  } //
  /// 取消倒计时的计时器。
  void _cancelTimer() {
    // 计时器（`Timer`）组件的取消（`cancel`）方法，取消计时器。
    _timer?.cancel();
  }



}

//用户协议和隐私政策
class PrivacyWidget extends StatefulWidget {
  const PrivacyWidget({Key? key, required this.onChanged}) : super(key: key);
  final ValueChanged<bool?> onChanged;

  @override
  _PrivacyWidgetState createState() => _PrivacyWidgetState();
}

class _PrivacyWidgetState extends State<PrivacyWidget> {
  bool? checked = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: checked,
            activeColor: Color.fromRGBO(48, 214, 194, 15),

            onChanged: (value) {
              widget.onChanged(value);
              setState(() {
                checked = value;
              });
            }),
        Text('同意',textAlign: TextAlign.left,textDirection: TextDirection.ltr , style: TextStyle(fontSize: 12, color: Color.fromRGBO(112, 112, 112, 1)),),
        //Text('<服务协议>', style: TextStyle(fontSize: 14.sp, color: Colors.blue),),
        //Text('和', style: TextStyle(fontSize: 14.sp),),
        GestureDetector(
          child:  Text(' <用户协议>  ', style: TextStyle(fontSize: 12, decoration: TextDecoration.underline,),textAlign: TextAlign.left,),
          onTap: () {
            // WebViewPage( );
            // print(context);
            Navigator.pushNamed(context, '/webviewpage');
          },
        ),
        Text('和', style: TextStyle(fontSize: 12, color: Color.fromRGBO(112, 112, 112, 1)),),
        GestureDetector(
          child:  Text(' <隐私政策>  ', style: TextStyle(fontSize: 12,decoration: TextDecoration.underline,),textAlign: TextAlign.left,),
          onTap: () {
            // Navigator.pushNamed(context, '/privacypolicy');
          },
        ),
        Spacer(),
        GestureDetector(
          child:  Text(' 注 册 ', style: TextStyle(fontSize: 14, color: Color.fromRGBO(48, 214, 194, 15),decoration: TextDecoration.underline,),textAlign: TextAlign.right,),
          onTap: () {
            Navigator.pushNamed(context, '/register');
          },
        ),
        Spacer(),
      ],
    );
  }
}

