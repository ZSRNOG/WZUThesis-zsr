# WZUThesis-zsr

温州大学硕士学位论文 LaTeX 模板。模板按温州大学官方 Word 论文模板制作，包含封面、声明页、中英文摘要、目录、图形列表、表格列表、正文、参考文献、致谢和成果页示例。

维护联系邮箱：`zsrnog@yeah.net`

GitHub 仓库：`https://github.com/ZSRNOG/WZUThesis-zsr`

## 特点

- 使用 `XeLaTeX + biber` 编译，适合中文论文。
- 封面信息集中写在 `front/metadata.tex`，日常使用不需要改类文件。
- 图题、表题支持中英文双语标题，并自动写入图形列表和表格列表。
- 参考文献使用 GB/T 7714-2015 样式。
- 示例正文写成模板使用帮助，便于直接照着修改。

## 文件结构

```text
.
├── thesis.tex              # 主入口文件
├── wzu-thesis.cls          # 模板类文件
├── front/
│   ├── metadata.tex        # 封面和论文元数据
│   └── abstract.tex        # 中英文摘要
├── chapters/               # 正文章节
├── back/                   # 致谢、成果等后置材料
├── bib/
│   └── references.bib      # BibTeX 参考文献库
└── figures/                # 图片和封面素材
```

## 快速编译

在模板目录中运行：

```powershell
latexmk -xelatex thesis.tex
```

生成文件为当前目录下的 `thesis.pdf`。

如果不用 `latexmk`，可以手动编译：

```powershell
xelatex thesis.tex
biber thesis
xelatex thesis.tex
xelatex thesis.tex
```

清理辅助文件：

```powershell
latexmk -C thesis.tex
```

## 修改封面信息

封面字段都在 `front/metadata.tex` 中修改，例如：

```tex
\wzusetup{
  classification = {C8},
  udc = {311},
  student-id = {2024260101},
  secret-level = {公开},
  title = {中文论文题目},
  title* = {English Thesis Title},
  author = {作者姓名},
  author* = {Author Name},
  training-type = {全日制专业学位硕士},
  degree-type = {专业型},
  degree = {硕士},
  degree* = {Master},
  major = {应用统计},
  major* = {Applied Statistics},
  research-field = {研究方向},
  advisor = {导师姓名（职称）},
  advisor* = {Advisor Name},
  institute = {学院名称},
  institute* = {School or Institute},
  completion-date = {2026 年 6 月},
  completion-date* = {June 2026}
}
```

封面顶部“温州大学”使用 `figures/wzu-title.png`，校徽使用 `figures/wzu-logo.jpg`。如需替换素材，保持文件名不变即可。

## 摘要与正文

- 中文摘要和英文摘要：修改 `front/abstract.tex`。
- 正文：修改 `chapters/*.tex`。
- 致谢和成果：修改 `back/*.tex`。
- 章节顺序：在 `thesis.tex` 中调整 `\include{...}` 顺序。

## 图表标题

插入图片示例：

```tex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.75\textwidth]{figures/demo-workflow.png}
  \wzubicaption{模板工作流程示意图}{Workflow of the thesis template.}
  \label{fig:workflow}
\end{figure}
```

插入表格示例：

```tex
\begin{table}[htbp]
  \centering
  \wzubicaption{变量说明}{Description of variables.}
  \begin{tabular}{lll}
    \toprule
    变量 & 含义 & 类型 \\
    \midrule
    x & 自变量 & 数值型 \\
    y & 因变量 & 数值型 \\
    \bottomrule
  \end{tabular}
  \label{tab:variables}
\end{table}
```

正文中引用图表建议使用：

```tex
如 \cref{fig:workflow} 所示。
```

## 参考文献

参考文献条目写在 `bib/references.bib` 中，正文用 `\cite{key}` 引用。模板使用 `biblatex-gb7714-2015`，输出格式为 GB/T 7714-2015。

单篇文献引用：

```tex
\cite{lamport1986latex}
```

多篇文献引用：

```tex
\cite{lamport1986latex,gbt7714-2015}
```

BibTeX 条目示例：

```bibtex
@article{demo2026,
  author  = {王一帆 and 赵明},
  title   = {应用统计模型的稳健估计方法},
  journal = {统计研究},
  year    = {2026},
  volume  = {43},
  number  = {6},
  pages   = {1-12}
}

@standard{gbt7714-2015,
  title       = {信息与文献 参考文献著录规则},
  number      = {GB/T 7714--2015},
  institution = {中国国家标准化管理委员会},
  address     = {北京},
  year        = {2015}
}
```

## 国内安装 TeX Live

推荐安装完整 TeX Live，不建议只安装精简版，否则中文字体、参考文献样式或宏包可能缺失。

1. 进入国内镜像站：
   - 清华大学开源软件镜像站：`https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/`
   - 中科大开源软件镜像站：`https://mirrors.ustc.edu.cn/CTAN/systems/texlive/Images/`
2. 下载最新的 `texliveYYYY.iso`，其中 `YYYY` 为年份。
3. Windows 下右键挂载 ISO，运行 `install-tl-windows.bat`。
4. 安装方案选择默认完整安装。
5. 安装完成后打开新的 PowerShell，检查：

```powershell
xelatex --version
biber --version
latexmk --version
```

如果命令找不到，通常是环境变量没有刷新。重启终端或重启电脑后再试。

## 国内安装 TeXstudio

TeXstudio 是常用 LaTeX 编辑器，适合配合 TeX Live 使用。

1. 下载 TeXstudio：
   - 官方网站：`https://www.texstudio.org/`
   - GitHub Releases：`https://github.com/texstudio-org/texstudio/releases`
2. 安装后打开 TeXstudio。
3. 进入 `选项 -> 设置 TeXstudio -> 构建`。
4. 推荐设置：
   - 默认编译器：`XeLaTeX`
   - 默认文献工具：`Biber`
   - 默认构建命令：可选择 `txs:///xelatex | txs:///biber | txs:///xelatex | txs:///xelatex`
5. 打开 `thesis.tex`，点击构建按钮即可编译。

如果中文无法显示或编译失败，先确认 TeXstudio 调用的是 TeX Live 中的 `xelatex.exe`，不是其他旧发行版。

## 常见问题

### 为什么必须用 XeLaTeX？

模板使用 `ctex`、系统中文字体和 `fontspec`，需要 XeLaTeX。不要使用 pdfLaTeX。

### 参考文献没有显示怎么办？

确认至少运行过一次 `biber thesis`。推荐直接运行：

```powershell
latexmk -xelatex thesis.tex
```

### 图形列表和表格列表在哪里打开或关闭？

在 `thesis.tex` 中保留或删除：

```tex
\makewzulistoffigures
\makewzulistoftables
```

### 如何添加额外宏包？

在 `thesis.tex` 导言区添加，例如：

```tex
\usepackage{mhchem}
\usepackage{pgfplots}
```

如果宏包会影响全局版式，再考虑写入 `wzu-thesis.cls`。

## 维护者

维护联系邮箱：`zsrnog@yeah.net`
