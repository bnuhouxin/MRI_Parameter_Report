# MRI Parameters Report for Siemens


![](https://img.shields.io/badge/release-v1.0-brightgreen.svg)
![](https://img.shields.io/badge/data-2019/11/29-green.svg)
![](https://img.shields.io/badge/licese-GPLV3.0-blue.svg)
------

## [Introduction:]
**This is a ***[Matlab-based]()*** toolbox to automatically report the MRI scanning parameters information.**

**[Note](): now it only works well for Siemens scan ([3D T1 && Functional Images]()) parameter report.**

Please report any bugs, comments and/or suggestions to: Xin Hou, [houxin195776@mail.bnu.edu.cn]().

## [Installing The Toolbox:]

- **Download and unzip MRI_Parameters_Report.zip**
- **Start Matlab**
- **Add the [MRI_Parameters_Report]() directory to the matlab path (in [*Matlab’s File->Set Path->Add with Subfolders*]() )**
- **Click [Save]() and then [Close]()**

The [MRI_Parameters_Report]() is now at the beginning of the MATLAB search path.
## [Requirements:]

- [**SPM12**](https://www.fil.ion.ucl.ac.uk/spm/software/spm12/)

## [To Start The Toolbox:]

- **On the Matlab command window, type:**
``` matlab
  *>> MRI_Parameters_Report_GUI* 
```

- **If your Matlab version is R2019b, we recommend you use mlapp. To start it, On the Matlab command window, type:** 
``` matlab
  *>> MRI_Parameters_Report* 
```
## [User Guide:]
- **Step1:** Click the pushbutton in the upper right corner to add the [***Raw DCM/IMG Folder***]().

  [**Note**]：The folder you add must be a single one that contains all raw *.dcm/*.img files scanned within a single run. That is, you can select a folder including all the 3D T1 images or a folder including all your functional images during one task/rest scanning run.

- **Step2:** Click the [**Report**]() pushbutton, then a graphical marquee interface pops up, now you need to select file path to store the reported information file ([*.mat]()) that will be produced. 

  Then about one minute later, all the works will be done. The output information will be printed on the GUI interface, and a mat file that contains all the output information will saved to your predefined file path.


<img src="https://uploader.shimo.im/f/cr1OM7G8ROMpSVuR.png!thumbnail" width="500" />
