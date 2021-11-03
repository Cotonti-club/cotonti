<!-- BEGIN: MAIN -->

<div class="ce-example">
    <div class="ce-example__content _ce-example__content--small">
        <div id="editorjs"></div>

        <div class="uk-button uk-button-primary" id="saveButton">
            editor.save()
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/@editorjs/header@latest"></script><!-- Header -->
<script src="https://cdn.jsdelivr.net/npm/@editorjs/image@latest"></script><!-- Image -->
<script src="https://cdn.jsdelivr.net/npm/@editorjs/delimiter@latest"></script><!-- Delimiter -->
<script src="https://cdn.jsdelivr.net/npm/@editorjs/list@latest"></script><!-- List -->
<script src="https://cdn.jsdelivr.net/npm/@editorjs/checklist@latest"></script><!-- Checklist -->
<script src="https://cdn.jsdelivr.net/npm/@editorjs/quote@latest"></script><!-- Quote -->
<script src="https://cdn.jsdelivr.net/npm/@editorjs/code@latest"></script><!-- Code -->
<script src="https://cdn.jsdelivr.net/npm/@editorjs/embed@latest"></script><!-- Embed -->
<script src="https://cdn.jsdelivr.net/npm/@editorjs/table@latest"></script><!-- Table -->
<script src="https://cdn.jsdelivr.net/npm/@editorjs/link@latest"></script><!-- Link -->
<script src="https://cdn.jsdelivr.net/npm/@editorjs/warning@latest"></script><!-- Warning -->

<script src="https://cdn.jsdelivr.net/npm/@editorjs/marker@latest"></script><!-- Marker -->
<script src="https://cdn.jsdelivr.net/npm/@editorjs/inline-code@latest"></script><!-- Inline Code -->

<!-- Load Editor.js's Core -->
<script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script>

<!-- Initialization -->
<script>

    const saveButton = document.getElementById('saveButton');

    var editor = new EditorJS({
        holder: 'editorjs',
        tools: {
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
                        byFile: 'http://localhost:8008/uploadFile', // Your backend file uploader endpoint
                        byUrl: 'http://localhost:8008/fetchUrl', // Your endpoint that provides uploading by Url
                    }
                }
            },
            list: {
                class: List,
                inlineToolbar: true,
                shortcut: 'CMD+SHIFT+L'
            },
            checklist: {
                class: Checklist,
                inlineToolbar: true,
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
                class:  Marker,
                shortcut: 'CMD+SHIFT+M'
            },
            code: {
                class:  CodeTool,
                shortcut: 'CMD+SHIFT+C'
            },
            delimiter: Delimiter,
            inlineCode: {
                class: InlineCode,
                shortcut: 'CMD+SHIFT+C'
            },
            linkTool: LinkTool,
            embed: Embed,
            table: {
                class: Table,
                inlineToolbar: true,
                shortcut: 'CMD+ALT+T'
            },
        },
        data: {
            blocks: [
                {
                    type: "header",
                    data: {
                        text: "Editor.js",
                        level: 2
                    }
                },
                {
                    type : 'paragraph',
                    data : {
                        text : 'Hey. Meet the new Editor. On this page you can see it in action — try to edit this text. Source code of the page contains the example of connection and configuration.'
                    }
                },
            ]
        },
        onReady: function(){
            saveButton.click();
        },
        onChange: function() {
            console.log('something changed');
        }
    });


    saveButton.addEventListener('click', function () {
        editor.save().then((savedData) => {
            console.log(savedData);
        });
    });
</script>

<!-- END: MAIN -->