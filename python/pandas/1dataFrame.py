import pandas as pd
import numpy as np

# 2*2짜리 random array 생성
np.random.seed(0)
arr = np.random.randint(10, size=(2,2))
print(arr)

dfa = pd.DataFrame(arr,copy=False)
dfb = pd.DataFrame(arr,copy=True)
arr[0,0]=100
print(dfa)
print(dfb)

print("=== dictionary로 생성 ============")
data = {
    "2015": [9904312,3448737,2890451, 2466052],
    "2010": [9631482,3393191,2632035, 2431774],
    "2005": [9762546,3512547,2517680, 2456016],
    "2000": [9853972,3655437,2466338, 2473990],
    "지역": ["수도권","경상권","수도권","경상권"],
    "2010-1015 증가율": [0.0283, 0.0163, 0.0982, 0.0141]
}
dfc=pd.DataFrame(data=data)
print(dfc)
print("======== index columns 설정 =============")
columns = ["지역","2015","2010","2005","2000","2010-2015 증가율"]
index = ["서울","부산","인천","대구"]
df = pd.DataFrame(data, index=index, columns=columns)
print(df)
print(df.values)
print(df.columns,"\n",df.index)
df.index.name="city"
df.columns.name="year"
print(df)
print("====== axis change ==================")
print(df.T)
print("========= data update ==========================")
df["2010-2015 증가율"] = df["2010-2015 증가율"] * 100
print(df)
print("=========== data insert ===============================")
df["2005-2010 증가율"] = ((df["2010"] - df["2005"]) / df["2005"] * 100).round(2)
print(df)
print("========== data delete ======================================")
del df["2010-2015 증가율"]
print(df)
#column indexing
print(">>>>>>>>>>>>>>>>>>>>column indexing<<<<<<<<<<<<<<<")
print( df["지역"] )
print( df[["2010","2015"]] )
print( type(df[["2010"]]) )
print( type(df["2010"]) )
#print( df[0] ) #key error
df2 = pd.DataFrame(np.arange(12).reshape(3,4))
print( df2 )
print( df2[2] )
print( df2[[1,2]] )
#row indexing(slicing 필수)
print(">>>>>>>>>>>>>>>>>>>>row indexing")
print( df[:2]) #처음부터 인덱싱 2번까지 뽑아내는 것
print( df["서울":"부산"] )
#individual data indexing
print( df["2015"]["서울"] )

print(df.dtypes)
print(df.axes)
print(df.ndim)
print(df.size)
print(df.shape)
print(df.keys)
print(df.get('2015'))