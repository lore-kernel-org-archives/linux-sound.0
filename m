Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9481F2EA723
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 16:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041794; cv=none; b=U62LueFLHj5VfIdhMuKEN1mbISrlETTkPpO36lp8QEHv+2bLHb27NKB5Z+G5qZqpeZ9Ntcfl56HKYHQSXLE057lKPCCHEIAZuO3NWy8bUV411s+z0HZQiY/H5jRHeKxpcdNdcFHR4DRsk5uwnxPoirHWVFtkxZA1Bv9EL6Cz26Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041794; c=relaxed/simple;
	bh=NrGK48K7TQeU1xseYcuZfl/9SljGlDumg0v1gAvyRpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCDAtqDO6vKNdJ6eE7A0Rzr3Zz/dza63oQRC/FTXJGW+BD0NhJAgPUYceTp6tUS7JsTSJnPV6v6WS+GJf/blE43F6tpnKOT5A2Hv/gpReC7PodLLABdI5AkuU55mK9B9mfG8w0sBuceQrbCAeppcwogu+gt0VXtSzKMlC4AvcLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eK0B0BLs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eK0B0BLs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBj1HT007346
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 16:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	shUYCckqGDoPHtxcGMdfXcvC7MVgYdxUw3VFoF/9ZMM=; b=eK0B0BLsvANOWBLf
	r/vOxgOREIkIBPzBFZUhFxEJ4Qo6a6bYSpDwgKvKbA5vBk8orFvplOfypQ+yoLlp
	y9RSkeQkKY0qP7KNBPg7KFpEJfQyic1BkxFxYb5mGEQbB/7L0RSGzD/Zd8ayyngx
	CyM0xn5VH8rNtATrXg4iGMDWIR29SIyZ1oM9NzqcRWPJJK8E4Nw404N8q71QQKsC
	j4OV8a4pVyjCKWjQpomm7PbjOnJ1SOnm3g+tgG1CRhPeS6ZKFtOGXoyIdmgIueV7
	UkIaoZvqzKJLvy0nO1WH2TuHaz+/1Dy4duYKaaLgTOqGqGGwsEzqFIy6dAC/JpC1
	OTGd2Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc60mjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 16:29:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09b74dc4bso45172985a.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 09:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041791; x=1751646591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shUYCckqGDoPHtxcGMdfXcvC7MVgYdxUw3VFoF/9ZMM=;
        b=lHfW6U7PJ+StExT5IbXpg91YJVoGSMKBhA8BJWr3vMX9mZxhfd+dJWQsG599LEAyYD
         EVZC8enMmHU+6tFmG2kyfBcPnpP6ol3JaCdB8RfVsuufuZzAFEJ25N+QqCOhiFC/4wAC
         4TzOZlUSz+CffEyOx4UtoTUTyMkvK1kwZ8D+Hc9SmEySshzXG0nu5840J9hQklFWHOCj
         7YS1jHDL+bGW+6m7+9liCat+y4j/VdMzZX/jtbNzIVBXUo9Gi6fdLUDkKkCMwIso67ab
         4+ec17bTFeS2tmwYXAWRGDWCb06j3XSRTRQ4FXifGX9TS1iPVnLH2p1e1YeOFLzkmxtU
         TPhA==
X-Forwarded-Encrypted: i=1; AJvYcCU3U7cy9qlqBVJ82gLtw8elrqpypwfRg9rU8IcOQy5T9RAz5Tyf6WqXcLwFWZ11MZT9g4Ghb5ebERExeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjwTgKtGek337N2FgOYQh88aabmJz+FYzQsalhGIaeW9wWGOpQ
	5bU4kOJJ4KdP/GmFwRBPidkttjWFhYMxjxgPyvk1Ep0pPylCS7sWxkD1agDbIIYIQhJUXsvDgVw
	j9p0yq1zVPp+ZQAH2J5ArPxPyYCgXoB6jUs+t5SfzOkJOgWqPt4DZnSctJ7gt4Znp8yjhjjJrUQ
	==
X-Gm-Gg: ASbGnct6dCsekHRUMeE/1mEDtUyL4lIZhXmKBW+toGS0slZOblvVnumi2uTj3/Y4NM6
	xH8qjnv8kW3nr4qCmUfAdFvVGAC4azd4zJfTRWgHTvpZ9FXAFwcui9BIuVtV4cZqkRBJRx09Ch4
	2m5tNuVjCVrhkZ2ubp5Gii68vsZLvcpbIaNfCP3pO3OvN5H0P3V27bfcEbNSDY8+OSAhiMvoDTa
	M6IcDFcOJR2ucjZ7w+mO4atFPxEbIRwaL1s/66HXIi2u6MKKdzSCpuy6sW4fVwqj2UzRMMWUtVM
	VmYgFK2Kd3QT1nRS970JtCz41+79pMk8xZWKZO2Eocwqmi2RACpUz5OVwnYU9+g9kQnYC92F1iv
	dzsg=
X-Received: by 2002:a05:620a:8c3:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d44392c133mr190527385a.6.1751041790734;
        Fri, 27 Jun 2025 09:29:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBijy/RXNIZA5o3Zj+gilVydMuaF00wJeZLo0nI0AAKKzcmDXHmPcvX9CZJiPxPp/SwW8UkA==
X-Received: by 2002:a05:620a:8c3:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d44392c133mr190524285a.6.1751041790172;
        Fri, 27 Jun 2025 09:29:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c0160asm147363566b.89.2025.06.27.09.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:29:49 -0700 (PDT)
Message-ID: <e1fe370c-6435-4a84-b7d7-1ce4db4dbfea@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 18:29:46 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] soundwire: bus: add of_sdw_find_device_by_node helper
To: srinivas.kandagatla@oss.qualcomm.com, vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C1_lYFnnYDb2nNI3jsrYBDVEoDpbtZGc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMyBTYWx0ZWRfX2V2JiWZKz+Bk
 vEbEz055adMe13OOwNmKS5FsFuL6FeI3/3AGLlHDUscjHP2PSNiZFku7Jf+mV4NyDpXlI2AEYJe
 krQtMrSc9/sYphvYjNynwegwpNG7CUCQheoTgBr7TQpjCyTfAtmeN6vhRXbIXXellOw2LRsREfw
 hV8sZujs2VHDcbJroyky0gl3aENx+8KfxZl7A6Gaq+s9iT2+JhArTebyvURpskdyelhmRfedOJ1
 jOwGHCU4l0EKSC5tKyee39h7xL7xUlOlUqnAlGz3XVPP0VbomYtK0i0pkgF3VWJ5aGT+raz6L1y
 PS8u5+txHU49r3i31Wcld4WUt2CwBY3reiFLXcGpyKSE8zbHUq9UPalr/JaMXbjkTe0SROE+D8+
 FzQ5h+pQ35BvS06ATA6q+DMnP/PTCr3U2RndyHlJGkC6KF2lh/sVmWfDSpjBuziICqoGEQIe
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685ec700 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wpCz0eZ45CY81w7ywFIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: C1_lYFnnYDb2nNI3jsrYBDVEoDpbtZGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=633 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270133

On 6/27/25 5:51 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> There has been more than 3 instances of this helper in multiple codec
> drivers, it does not make sense to keep duplicating this part of code.
> 
> Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

I think we can do the same with e.g.

sound/soc/sdw_utils/soc_sdw_rt_amp.c
281:            sdw_dev1 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
292:            sdw_dev2 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[1].name);


and make sdw_bus_type private again

Konrad
