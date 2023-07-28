from django import forms
from .models import Post, Comment



class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ['title', 'hook_text','content','head_image','category']

    def __init__(self, *args, **kwargs):
        super(PostForm, self).__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'

class CommentForm(forms.ModelForm):
    content = forms.CharField(widget=forms.Textarea(attrs={
        'cols': 200,
        'rows': 3,
        'style': 'width: 100%'
    }))
    class Meta:
        model = Comment
        fields = ('content',)
    
    def __init__(self, *args, **kwargs):
        super(CommentForm, self).__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'