Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCCF342C93
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 11:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757070332; cv=none; b=oGT3e34VimGFY9XYoCumyXSBn2MyTljsz2KzVhp70bGT3OlaKflHgWsUgf4BQ5pjmoqKpRk/0orG54rZ5BvyRi18LgqK9j3MRQZNjtrnJ1oRXDZkU47Nk2Ob4PheOgiFupenfJNm89ZHE5CiVG891i7/FBoPbfCASE8VadUfNE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757070332; c=relaxed/simple;
	bh=E+z0OzvLmJ/8onuEFCaHusvgVI2q7XxN8zJfDiwSrx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eD3TY38+6oO6GetNNO+G6NR4OnlG6JcIXg6uY5yKP8QgCSGmmPovnH0bLKRHvIu3Hl+jfUYPIR5VCLi8VZOr+mZWT7qt95cMVQPmFz/B86TB7VuN1eMbr486gg8tte8gAnglQtpSdrt+v7dVAq1LHxB2dLsmrafHvSZ5Hic18rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gUMM5u6c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gUMM5u6c"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856Wg8t032203
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 11:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RCOkVoSgMv1L0VMNcsjOUXK9ZbBvTQO7jnuAMGFDWS4=; b=gUMM5u6caqUD9mVB
	V9qJX3Q58JsMqoFsYNLMc5HTrscb+ZsnsGw4+mGCM+gbbTRrtVbzB18Ri3kq0WnD
	ltDM3tlWsyHjJ8+FlyIVzCV4kYruOheUwrC0ER7am2akLW9OxJHbx1Pa/cOsytXA
	24Cb8dBLSfx21t/MxrQ4YnMh2TcOEbnhZaYh2fIxscHjFvIpS90B0dXJGPpedPJK
	ZUhQNhL5a/V8F7+Rj8Wd65nfkEBWQ4u6Y4MzVrFkjgAwOtiBW9I2q89tzAvkE2Eb
	CTDjFDfk2r3SjseK22S/6ZkZrqhgM4zQruh3v4Az9YQIctbLe3x2TJl4+XtjTjSG
	GMNPTw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpk1bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 11:05:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24e04a4f706so5000665ad.2
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 04:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757070328; x=1757675128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCOkVoSgMv1L0VMNcsjOUXK9ZbBvTQO7jnuAMGFDWS4=;
        b=CqzvtkHgMv/aSG4mr7BO4H2BbvZCea+829LPT4yCDgpSS3FbY82MrmvMMh/iIyA8dT
         Xa4IhzxU1j5wiKdJFXS/XH4r6H4YnoT4zJJqgiM5W+l8ibcsuDw1FUvaQoclMJPz4zK5
         oNMGr1a2cBR3l26/CcHkl/zb7f3Rf3oseQAif2Fd3BCGfU15uG/UnpoZqsZKcfmzpplL
         pvK5rBKZlBXnehm1V8ai0NB95PSP7SlAhzW8oY+00qm4DIgkRKLguURNAxpIYlYpKMTa
         vS4PdpdlZGEaDdIE12zdH+cSj9iGBKE02vvQY+p5IF0pi4R/9rOAwqndNp2PrIo4WMww
         UViA==
X-Gm-Message-State: AOJu0YxeR9fjlbayGYUYfQLmo2QVrzlQnNAaj3Njh/tmsy7P7aHM17PU
	97KwyTjCmbf2NdYnbZuS5XBuCFBSwyhKrd3FfE0kfbeSPmKY1wpP9k/ktzOmzlk+SFgpWu7QqER
	R1ImCtersmT61fUfLuSN7S0L0RxjcigcPBIpmEi8/hsH8rz+Iw4dbxc+XFncJ6rq58Q==
X-Gm-Gg: ASbGncvhAEnhO8M1m9OMngTv8OEu7KRrR4SZLbp17erUO08rX1aloNAhRF8veOWcTVo
	cRyD1cpJWewsGYjgAjAzxRrCnuu0VkiZO+ICAKc6hECJxp6mK8rz7rHZs/2amFsp3+dxz+oh3fI
	l0tdKtuQyOTnPhjm6b9VfEF0424Rt9Kn05rxVAVkyGmhbX5yl1PbBi2b5zY4a8kQQLS/CtPGe6C
	qvHML9q9DGzP/2YmhjwXiX8Dr+0UWwUcxn1UKnO2HMpq7rS1Kn3CBVkuSe+ookxBq6lRiEGB59x
	/9MSZRCEV+8W7dZ7F/ECd8F3nQcJMYPz6Dwoffo1oT/PL02RI/Aqdz+d0syjB1Y/u4yCjcQ+dMV
	Aw6k=
X-Received: by 2002:a17:903:28c:b0:248:811e:f873 with SMTP id d9443c01a7336-24944ab8f4bmr302867205ad.36.1757070327628;
        Fri, 05 Sep 2025 04:05:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaBaEQj2/Ott7YevOzR0H8alV8LqIEopwPPE34mLhhoSdImcC6vNQ/KnXjEeJsTk2psflJDQ==
X-Received: by 2002:a17:903:28c:b0:248:811e:f873 with SMTP id d9443c01a7336-24944ab8f4bmr302866665ad.36.1757070327142;
        Fri, 05 Sep 2025 04:05:27 -0700 (PDT)
Received: from [10.219.49.245] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccbc8a453sm40592945ad.0.2025.09.05.04.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 04:05:26 -0700 (PDT)
Message-ID: <0b560cc3-1735-4605-a34d-7f2413fda609@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 16:35:21 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ASoC: qcom: audioreach: Fix lpaif_type
 configuration for the I2S interface
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905104020.2463473-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <a9eae2e3-0e75-4ffb-9de1-3b8a9bce86a6@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <a9eae2e3-0e75-4ffb-9de1-3b8a9bce86a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h2IXAnsPSuYxKgVEhgs4mNoueYuwr1c2
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bac3f9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ROh5OEer_01NpF1xJywA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: h2IXAnsPSuYxKgVEhgs4mNoueYuwr1c2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXx7XZfHDlWY/D
 hhCKeYsMLrRHVJvWVMBGTV/OLzzacrvNMBXSwDsFqHAuOJDXzhBQumzyibPpgTuTlKqKsBizctp
 a4YjZS+bhijeV/xMCHE8Tc4hvl718N9lNX+2fQwtSerSOynAmX7BLmuZf3UH8Xz4Gr1Ax16MC5h
 TQ5j99TkpIIrbNDPhLLhI/OzUK50s586YTs/sSf3JrtoPrm5SzJ+x2XXq8V+G8cr+NcLoUnayb/
 tzaa0I+Lo/+XswVBlr5DeHwVdXfsrPViiP3tLNK8hg1ChsY7tRhIK6wZCXqCDY11dByMnXSawXt
 kHjyBH5QRHuU5+uDZo6RsTI2K64gB+A42X20L+2Cxr6ndpMBHQ6ioMqViSEBRoni+7VuQ25xSkF
 2pahxfMc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001



On 9/5/2025 4:16 PM, Srinivas Kandagatla wrote:
> On 9/5/25 11:40 AM, Mohammad Rafi Shaik wrote:
>> Fix missing lpaif_type configuration for the I2S interface.
>> The proper lpaif interface type required to allow DSP to vote
>> appropriate clock setting for I2S interface.
>>
>> Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")
> 
> CC stable tag is missing.
> 

Ack, Will add the stable tag in next post.

Thanks & Regards,
Rafi.

> --srini
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/qdsp6/audioreach.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
>> index bbfd51db8797..be21d5f6af8a 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.c
>> +++ b/sound/soc/qcom/qdsp6/audioreach.c
>> @@ -995,6 +995,7 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
>>   	param_data->param_id = PARAM_ID_I2S_INTF_CFG;
>>   	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
>>   
>> +	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
>>   	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
>>   	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
>>   
> 


