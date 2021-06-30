import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bitssa_demo/bloc/post/post_event';
import 'package:bitssa_demo/bloc/post/post_state';

class PostBloc extends Bloc<PostEvent, PostState>{
    final PostRepository repository;

    PostBloc(this.repository): super(Loading());

    @override
    Stream<PostState> mapEventToState(PostEvent event) async*{
        if(event is LandingPost) {
            try {
                yield Loading();

                final rsp = await this.repository.currentPost();
                
                yield Loaded(rsp);
            } catch (e) {
                yield Error(e.message);
            }
        } else if (event is UploadPost) {
            try {
                yield Loading();

                final rsp = await this.repository.addPost();
                
                yield Loaded(rsp);
            } catch (e) {
                yield Error(e.message);
            }
        } else if (event is DeletePost) {
            try {
                yield Loading();

                final rsp = await this.repository.subtractPost();

                yield Loaded(rsp);
            } catch (e) {
                yield Error(e.message);
            }
        }
    }
}