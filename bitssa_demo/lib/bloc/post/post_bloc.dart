import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bitssa_demo/bloc/post/post_event.dart';
import 'package:bitssa_demo/bloc/post/post_state.dart';
import '../../repository/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState>{
    final PostRepository repository;

    PostBloc(this.repository): super(PostLoading());

    @override
    Stream<PostState> mapEventToState(PostEvent event) async*{
        if(event is LandingPost) {
            try {
                yield PostLoading();

                final rsp = await this.repository.currentPost();
                
                yield PostLoaded(rsp);
            } catch (e) {
                yield PostError(e.message);
            }
        } else if (event is UploadPost) {
            try {
                yield PostLoading();

                final rsp = await this.repository.addPost(event.title, event.content, event.user);
                
                yield PostLoaded(rsp);
            } catch (e) {
                yield PostError(e.message);
            }
        } else if (event is DeletePost) {
            try {
                yield PostLoading();

                final rsp = await this.repository.subtractPost(event.idx);

                yield PostLoaded(rsp);
            } catch (e) {
                yield PostError(e.message);
            }
        }
    }
}