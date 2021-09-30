%importing data files,readtable
%explorting data, writeable
%reading formated files, fopen, fclose, textscan
%three common file types (.txt), comma seperated files (.csv)
%excel files(.xls or xlsx)

%% Example: importing a text file (tab-separated)
clear all 
filenm = 'sampledata1.txt';
T= readtable (filenm)

%% example importing a text file (comma seperated)
clear all
filenm = 'sampledata1.csv';
T = readtable (filenm);

%% Example: importing an excel file
clear all
filnm = 'sampledata1.xlsx';
T = readtable (filenm);

%Table data structure with data T in memory
%How to show first ten rows of T table
%Index for first ten rows, and results are shown
%on screen
%first subset of four different columns
%became name of columns 


%Read in text file comma separated, save this new data to file
%% Address the column T.RT

T(1:10,:)
T.RT = T.RT/100
writetable(T, 'sampledata3.xlsx')

%WANT TO EXPORT TABLE, save as writetable

%Read into excel with new changes.

%% Without Readtable command to read in results
% Example: inporting data file using textscan
clear all
filenm = 'sampledata1.txt';
fid = fopen(filenm, 'r');
c = textscan (fid, '%f %f %f %s', 'HeaderLines',1);
fclose(fid);
 
ID = c{1};
Correct = c{2};
RT = c{3};
Stimtype = c{4};

T = table (ID, Correct, RT, Stimtype);
T(1:10,:);

%We are opening for reading, opened for pereameter for reading, 'r'
%fid is the representation to file being opened. 
% c = is importing cell array c, textscan
%textscan arbitrary opening textfiles, number of inputs
% fid , handle of textfile, then we have string of %f , representation of
% format, four columns, floating point numbers
% reading them as represent as numeric data 
% headerlines, and skip first line in reading data
% if you want to convert to table format, can extract various columns
% give first cell array column as ID
%T = four columns combine into one table
