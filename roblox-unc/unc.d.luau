export type HttpRequest = {
    Url: string,
    Method: "GET" | "POST" | "PATCH" | "PUT",
    Body: string?,
    Headers: {[string]: string}?,
    Cookies: {[string]: string}?,
}

export type HttpResponse = {
    Body: string,
    StatusCode: number,
    StatusMessage: string,
    Success: boolean,
    Headers: {[string]: string},
}

export type DebugInfo = {
    source: string,
    short_src: string,
    func: () -> (),
    what: string,
    currentline: number,
    name: string,
    nups: number,
    numparams: number,
    is_vararg: number,
}

export type _HookFunction = (...any) -> ...any

-- Drawing API
export type DrawingObject = {
    Visible: boolean,
    ZIndex: number,
    Transparency: number,
    Color: Color3,
    Destroy: () -> ()
}

declare Drawing: {
    new: (type: string) -> DrawingObject,
    Fonts: {UI: number, System: number, Plex: number, Monospace: number}
}
declare cleardrawcache: () -> ()
declare getrenderproperty: (drawing: DrawingObject, property: string) -> any
declare isrenderobj: (object: any) -> boolean
declare setrenderproperty: (drawing: DrawingObject, property: string, value: any) -> ()

-- WebSocket API
export type WebSocket = {
    Send: (message: string) -> (),
    Close: () -> (),
    OnMessage: RBXScriptSignal,
    OnClose: RBXScriptSignal
}

declare WebSocket: {
    connect: (url: string) -> WebSocket
}

-- Cache API
declare cache: {
    invalidate: (object: Instance) -> (),
    iscached: (object: Instance) -> boolean,
    replace: (object: Instance, newObject: Instance) -> ()
}

-- Console API
declare rconsoleclear: () -> ()
declare rconsolecreate: () -> ()
declare rconsoledestroy: () -> ()
declare rconsoleinput: () -> string
declare rconsoleprint: (text: string) -> ()
declare rconsolesettitle: (title: string) -> ()

-- Closures API
declare checkcaller: () -> boolean
declare clonefunction: <T>(func: T) -> T
declare hookfunction: <T>(func: T, hook: (...any) -> ...any) -> T
declare iscclosure: (func: (...any) -> ...any) -> boolean
declare islclosure: (func: (...any) -> ...any) -> boolean
declare isexecutorclosure: (func: (...any) -> ...any) -> boolean

declare loadstring: (source: string) -> (...any)->...any
declare newcclosure: <T>(func: T) -> T
declare replaceclosure: <T>(func: T, hook: (...any) -> ...any) -> T

-- Global Functions
declare messagebox: (text: string, caption: string, flags: number) -> number
declare getgc: () -> {((...any) -> any) | {[any]: any}}
declare getgenv: () -> {[any]: any}
declare getloadedmodules: () -> {Instance}
declare getrenv: () -> {[any]: any}
declare getrunningscripts: () -> {Instance}
declare getscriptbytecode: (script: LocalScript | ModuleScript) -> string
declare getscriptclosure: (script: Instance) -> (...any) -> any
declare getscripthash: (script: Instance) -> string
declare getscripts: () -> {Instance}
declare getsenv: (script: Instance) -> {[string]: any}
declare getthreadidentity: () -> number
declare setthreadidentity: (identity: number) -> ()
declare identifyexecutor: () -> (string, string)
declare lz4compress: (data: string) -> string
declare lz4decompress: (data: string, size: number) -> string
declare queue_on_teleport: (code: string) -> ()
declare request: (options: HttpRequest) -> HttpResponse
declare setclipboard: (text: string) -> ()
declare setfpscap: (fps: number) -> ()
declare getrawmetatable: (object: {[any]: any}) -> {[any]: any}
declare hookmetamethod: (object: {[any]: any}, method: string, hook: _HookFunction) -> () -> ...any
declare getnamecallmethod: () -> string
declare isreadonly: (object: {[any]: any}) -> boolean
declare setrawmetatable: (object: {[any]: any}, metatable: {[any]: any}) -> ()
declare setreadonly: (object: {[any]: any}, readonly: boolean) -> ()
declare cloneref: <t>(object: t) -> t
declare compareinstances: (a: Instance, b: Instance) -> boolean
declare getcallingscript: () -> BaseScript
declare getconnections: (signal: RBXScriptSignal) -> {RBXScriptConnection}
declare getinstances: () -> {Instance}
declare getnilinstances: () -> {Instance}
declare isrbxactive: () -> boolean
declare ismousebuttonpressed: (button: Enum.UserInputType) -> boolean
declare isgameactive: () -> boolean
declare mousesettarget: (filter: (Instance) -> boolean, ignore: {Instance}) -> ()
declare mousegettarget: (filter: (Instance) -> boolean, ignore: {Instance}) -> (Instance, Vector3)
declare mousemoverel: (x: number, y: number) -> ()
declare mouse1click: () -> ()
declare mouse1press: () -> ()
declare mouse1release: () -> ()
declare mouse2click: () -> ()
declare mouse2press: () -> ()
declare mouse2release: () -> ()
declare keyclick: (keycode: Enum.KeyCode) -> ()
declare keypress: (keycode: Enum.KeyCode) -> ()
declare keyrelease: (keycode: Enum.KeyCode) -> ()
declare readfile: (path: string) -> string
declare writefile: (path: string, content: string) -> ()
declare appendfile: (path: string, content: string) -> ()
declare isfile: (path: string) -> boolean
declare isfolder: (path: string) -> boolean
declare makefolder: (path: string) -> ()
declare delfolder: (path: string) -> ()
declare delfile: (path: string) -> ()
declare listfiles: (path: string) -> {string}
declare loadfile: (path: string) -> (() -> any, string?)

-- Debug API
declare debug: {
    getconstant: (func: (() -> ()) | number, index: number) -> any,
    getconstants: (func: (() -> ()) | number) -> {any},
    getinfo: (func: (() -> ()) | number) -> DebugInfo,
    getproto: (func: (() -> ()) | number, index: number, active: boolean?) -> (() -> ()) | {() -> ()},
    getprotos: (func: (() -> ()) | number) -> {() -> ()},
    getstack: (level: number, index: number?) -> any | {any},
    getupvalue: (func: (() -> ()) | number, index: number) -> any,
    getupvalues: (func: (() -> ()) | number) -> {any},
    setconstant: (func: (() -> ()) | number, index: number, value: any) -> (),
    setstack: (level: number, index: number, value: any) -> (),
    setupvalue: (func: (() -> ()) | number, index: number, value: any) -> ()
}

-- Crypt API
declare crypt: {
    base64encode: (data: string) -> string,
    base64decode: (data: string) -> string,
    hash: (algorithm: string, data: string) -> string,
    randombytes: (size: number) -> {number}
}

-- Miscellaneous
declare getreg: () -> {any}
declare identifyclosure: (closure: () -> ()) -> string?
