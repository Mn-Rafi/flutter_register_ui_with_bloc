import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/bussiness_logic/bloc/registeruser_bloc.dart';
import 'package:login_app/bussiness_logic/change_icon_cubit/changeicon_cubit.dart';
import 'package:login_app/bussiness_logic/pick_dateofbirth_cubit/pickdateofbirth_cubit.dart';
import 'package:login_app/presentation/helpers/constant_styles.dart';
import 'package:login_app/presentation/helpers/textfield_validator_mixin.dart';
import 'package:login_app/presentation/screens/screen_login.dart';
import 'package:login_app/presentation/widgets/custom_image_card.dart';
import 'package:login_app/presentation/widgets/custom_submit_button.dart';
import 'package:login_app/presentation/widgets/custom_textformfield.dart';

class ScreenRegister extends StatelessWidget {
  ScreenRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PickdateofbirthCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeiconCubit(),
        ),
      ],
      child: Container(
        decoration: kboxdecoration,
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.5),
          body: RegisterScreenBody(),
        ),
      ),
    );
  }
}

class RegisterScreenBody extends StatelessWidget with TextFieldValidatorMixin {
  RegisterScreenBody({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  static TextEditingController dobController = TextEditingController();
  IconData hidePass = Icons.visibility_off;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              hspace1,
              Text(
                'Hello there!',
                style: mainHeaderStyle,
              ),
              Text(
                'Before continue, please register first',
                textAlign: TextAlign.center,
                style: normalTextStyle,
              ),
              hspace1,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: const CustomImageCard(
                  imagePath:
                      'https://raw.githubusercontent.com/Mn-Rafi/my_network_images/master/register_now.png',
                  ratio: 1.5,
                ),
              ),
              hspace1,
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1, vertical: height * 0.01),
                child: CustomTextFormField(
                    iconData: Icons.person,
                    textController: nameController,
                    validator: (val) {
                      return isNameValid(val, 'name');
                    },
                    nextAction: TextInputAction.done,
                    hintText: 'Name',
                    keyBoardType: TextInputType.name),
              ),
              BlocBuilder<PickdateofbirthCubit, PickdateofbirthState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      context.read<PickdateofbirthCubit>().pickDate(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.1, vertical: height * 0.01),
                      child: CustomTextFormField(
                          iconData: Icons.calendar_month,
                          textController: dobController,
                          validator: (val) {
                            return isSelectedDob(val, 'Date of Birth');
                          },
                          isEnabled: false,
                          hintText: 'Date of Birth',
                          keyBoardType: TextInputType.name),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.01, horizontal: width * 0.1),
                child: CustomTextFormField(
                    validator: (val) {
                      return isMobileValid(val);
                    },
                    hintText: 'Mobile number',
                    keyBoardType: TextInputType.number,
                    iconData: Icons.phone,
                    textController: mobileNumberController),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.01, horizontal: width * 0.1),
                child: BlocBuilder<ChangeiconCubit, ChangeiconState>(
                  builder: (context, state) {
                    return CustomTextFormField(
                        suffixAction: () {
                          if (isObscure == true) {
                            isObscure = false;
                            hidePass = Icons.visibility;
                            context.read<ChangeiconCubit>().changeIcon();
                          } else {
                            isObscure = true;
                            hidePass = Icons.visibility_off;
                            context.read<ChangeiconCubit>().changeIcon();
                          }
                        },
                        obscure: isObscure,
                        sufficiconData: hidePass,
                        validator: (val) {
                          return isPasswordValid(val);
                        },
                        nextAction: TextInputAction.done,
                        hintText: 'Password',
                        keyBoardType: TextInputType.name,
                        iconData: Icons.lock,
                        textController: passwordController);
                  },
                ),
              ),
              hspace1,
              BlocConsumer<RegisteruserBloc, RegisteruserState>(
                listener: (context, state) {
                  if (state is UserRegisterSubmittedSuccessState) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenLogin(),
                        ));
                    dobController.text = '';
                  }
                },
                builder: (context, state) {
                  if (state is UserRegisterSubmittedState) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.01),
                      child: const CustomLoadingSubmitButton(
                          text: 'REGISTER NOW', bgColor: Color(0xff5593b7)),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.01),
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<RegisteruserBloc>()
                              .add(UserRegisterSubmittedEvent());
                        }
                      },
                      child: const CustomSubmitButton(
                        bgColor: Color(0xff5593b7),
                        text: 'REGISTER NOW',
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
