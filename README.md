# GPDF2GTIF Installer 

This is the installer for the [GUI GDAL-translate program](https://github.com/DamnGoodCoders/GDAL-CSHARP).

## Contact Info:
- Caleb Gartner
- Thane Wilson
- Joshua Mathews
-- (225)305-7231
-- jfmathews@mavs.coloradomesa.edu

## Client:
Brad Schmidt 
Fire Technology Specialist 
Center of Excellence for Advanced Technology Aerial Firefighting
brad.schmidt@state.co.us
0375 County Road 352 #2065-A
Rifle, CO 81650
www.dfpc.state.co.us

## Contract Link:
https://github.com/DamnGoodCoders/FireMap-Android/blob/master/Signed%20Contract%20CMU%20DFPC.pdf

## Committing instructions:

All features should have their own branch.  These all should be branched from the Development branch.  

Never merge a feature directly into the Master branch.  First, create a pull request to the Development branch, then we will merge the two.  Only merge the Development branch to the Master branch.

If you're creating a feature, call the branch "feature/feature-name."  Same goes with bugfixes: "bug-fix/issue-name."  Reference the issue you are fixing in your commit.

Once we get the ball rolling, we should require everyone to approve pull requests to the development branch, thoroughly reviewing the changes.

## TODO:

- [x] Compile GDAL as a .aar library
- [x] Create Android project with Google Maps and Navbar (This repository)
- [ ] Overlay GeoTiff image on the map using coordinate metadata
- [ ] Convert GeoSpatialPdf to GeoTiff within application
- [ ] Enable user to change and download maps
