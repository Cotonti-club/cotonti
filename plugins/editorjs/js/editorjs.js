function editorjs_content_parce() {
    try {
        return JSON.parse($('[editorjs]').val() || '[]')
    } catch (e) {
        return {
            time: Date.now(),
            blocks: [
                {
                    type: 'paragraph',
                    data: {text: $('[editorjs]').val()}
                }
            ],
        };
    }
}

var editor = new EditorJS({
    holder: 'editorjs',
    tools: {
        underline: Underline,
        header: {
            class: Header,
            inlineToolbar: ['link'],
            config: {
                placeholder: 'Header'
            },
            shortcut: 'CMD+SHIFT+H'
        },
        image: {
            class: ImageTool,
            config: {
                endpoints: {
                    byFile: '/?r=editorjs&m=uploadFile', // Your backend file uploader endpoint
                    byUrl: '/?r=editorjs&m=fetchUrl', // Your endpoint that provides uploading by Url
                }
            }
        },
        list: {
            class: List,
            inlineToolbar: true,
            shortcut: 'CMD+SHIFT+L'
        },
        quote: {
            class: Quote,
            inlineToolbar: true,
            config: {
                quotePlaceholder: 'Enter a quote',
                captionPlaceholder: 'Quote\'s author',
            },
            shortcut: 'CMD+SHIFT+O'
        },
        warning: Warning,
        marker: {
            class: Marker,
            shortcut: 'CMD+SHIFT+M'
        },
        delimiter: Delimiter,
        inlineCode: {
            class: InlineCode,
            shortcut: 'CMD+SHIFT+C'
        },
        table: {
            class: Table,
            inlineToolbar: true,
            shortcut: 'CMD+ALT+T'
        },
        embed: {
            class: Embed,
            config: {
                services: {
                    youtube: true,
                    coub: true,
                    codepen: {
                        regex: /https?:\/\/codepen.io\/([^\/\?\&]*)\/pen\/([^\/\?\&]*)/,
                        embedUrl: 'https://codepen.io/<%= remote_id %>?height=300&theme-id=0&default-tab=css,result&embed-version=2',
                        html: "<iframe height='300' scrolling='no' frameborder='no' allowtransparency='true' allowfullscreen='true' style='width: 100%;'></iframe>",
                        height: 300,
                        width: 600,
                        id: (groups) => groups.join('/embed/')
                    }
                }
            }
        },
        raw: {
            class: RawTool,
            shortcut: 'CMD+SHIFT+C'
        },
        code: CodeTool,
    },
    data: editorjs_content_parce(),
    onChange: function () {
        editor.save().then((savedData) => {
            // console.log(savedData)
            $('[editorjs]').val(JSON.stringify(savedData));
        });
    }
});