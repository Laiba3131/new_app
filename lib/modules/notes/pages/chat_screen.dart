import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import '../../../generated/assets.dart';

class Message {
  final String text;
  final bool isMe;
  final String time;

  Message({required this.text, required this.isMe, required this.time});
}

class ChatScreen extends StatefulWidget {
  final String name;
  final String username;
  final String profileImage;

  const ChatScreen({
    Key? key,
    required this.name,
    required this.username,
    required this.profileImage,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Message> messages = [
    Message(
        text: "We haven't talked in so long girl", isMe: true, time: "12:30"),
    Message(text: "Hey, how are you doing?", isMe: false, time: "12:31"),
    Message(
        text: "I'm doing amazing. You must be pretty busy now as days?",
        isMe: true,
        time: "12:32"),
    Message(text: "Girl, yes Im busy all the time", isMe: false, time: "12:33"),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
bool isBlocked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            _buildProfileSection(),
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: messages.length,
                itemBuilder: (context, index) =>
                    _buildMessageBubble(messages[index]),
              ),
            ),
            _buildInputField(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!message.isMe) ...[
              CircleAvatar(
                radius: 23,
                backgroundImage: AssetImage(widget.profileImage),
              ),
              const SizedBox(width: 8),
            ],
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              decoration: BoxDecoration(
                color: message.isMe
                    ? const Color(0xFF4e90e6)
                    : const Color(0xFFEFEFEF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                message.text,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: message.isMe ? AppColors.white : AppColors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFEFEFEF),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Image.asset(
                    Assets.emojiIcon,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'When are you free?',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        hintStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                        fillColor: Color(0xFFEFEFEF),
                        filled: true,
                      ),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              if (_messageController.text.trim().isNotEmpty) {
                setState(() {
                  messages.add(Message(
                    text: _messageController.text,
                    isMe: true,
                    time: "now",
                  ));
                  _messageController.clear();
                });
              }
            },
            child: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  Assets.sendMsg,
                  width: 18,
                  height: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Stack(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(widget.profileImage),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '@${widget.username}',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Spacer(),
          PrimaryButton(
            onPressed: () {
              setState(() {
                isBlocked = !isBlocked;
              });
            },
            title: isBlocked ? 'Blocked' : 'Block',
            width: 85,
            height: 36,
            borderRadius: 11,
            backgroundColor:isBlocked?AppColors.white: AppColors.red,
            titleColor: isBlocked ? AppColors.black : AppColors.white,
            hMargin: 0,
            bborderColor: isBlocked ? AppColors.red : AppColors.red,
            shadowColor: AppColors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(widget.profileImage),
          ),
          const SizedBox(height: 12),
          Text(
            widget.name,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.black,
              fontSize: 29,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            widget.name,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.textGrey,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          h1,
          PrimaryButton(
            onPressed: () {},
            title: 'View profile',
            backgroundColor: AppColors.white,
            borderRadius: 11,
            height: 36,
            width: 125,
            shadowColor: AppColors.transparent,
            bborderColor: AppColors.black,
            titleColor: AppColors.black,
          ),
        ],
      ),
    );
  }
}
