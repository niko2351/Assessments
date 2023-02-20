import pandas as pd #dependency
import numpy as np #dependency

df_teacher = pd.DataFrame({
    "name": ["Pep Guardiola", "Jurgen Klopp", "Mikel Arteta", "Zinadine Zidane"],
    "married": [True, True, False, True],
    "school": ["Manchester High School", "Liverpool High School", "Arsenal High", np.nan],
})

df_student = pd.DataFrame({
    "teacher": ["Mikel Arteta", "Mikel Arteta", "Pep Guardiola", "Jurgen Klopp", "Jurgen Klopp", "Jurgen Klopp", "Pep Guardiola","Pep Guardiola","Mikel Arteta"],
    "name": ["Bukayo Saka", "Gabriel Martinelli", "Jack Grealish", "Roberto Firmino","Andrew Robertson", "Darwin Nunez", "Ederson Moraes", "Manuel Akanji", "Thomas Partey"],
    "age": [21, 21, 27, 31, 28, 23, 29, 27, 29],
    "height": ['2.1m','2.1m', '2.1m', '2.1m', '2.1m', '2.1m', '2.1m', '2.1m', '2.1m']
})

grpd_student = df_student.groupby("teacher")
tmpDf = []
labels = [ x for x in df_student.columns.to_numpy() if x!="teacher" ]

for i,row in df_teacher.iterrows():
    val={
        "teacher":row["name"],
        "school":row["school"],
        "married":row["married"],
        "Students":[]
    }
    if row["name"] in grpd_student.groups.keys():
        tmp_stu = {}
        for j,n_row in df_student[df_student["teacher"]==row["name"]].iterrows():
            for x in labels:
                tmp_stu[x]=n_row[x]
            val["Students"] = np.append(val["Students"],tmp_stu)
    
    tmpDf = np.append(tmpDf,val)

print(tmpDf)
  