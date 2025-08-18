Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C888C310640
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519174; cv=none; b=UO7evw1rSqWBrT7ngtPxMXlzg9JNNN04EZ+QhybtJTVXts1psn7dZX8V3d+UzCcTrIz6gPEVqq1cnVIbz6XtNrUBbVufb8WH0WpW3F4G+lbpZBrXycUk1JjjsDV7HDGR+4uonb307e1S6BwEPta/y5YBTtzDBQG6M47qjaf3Rec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519174; c=relaxed/simple;
	bh=l/Hq9M2tag2Uf2Hwt4nk862X0hV2q6xQBB+TOTBaiCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdkme+XgIhCi//x79L8P89MwJZQK4c2cAEFl+DmuL8rc0pnEqzkqEhTaN3Jds9rVXNhTJdZwO6fr1d3O1F/07s2MtjRiGNsz0aMAcs5Il1NJtI+BtPTVc5cPRJT+KTCJ03mx/9iHdNJIDkOybGdygDDuSyHW83l7f/Te+mCRmPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYuGxOrG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYuGxOrG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8kEwD031360
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/Zk/ptbfC/s0X71iF/TOOzhAZQdu9FozG00nBTib+Q=; b=lYuGxOrGw6KVoj9d
	6wt3DXu/EpGyz1itMgu845RUyfGxJqsDbLju5KAx/ZcrQ3zEvZEK+KCOmkuQ35ns
	XYu00HKVxX5+rMrS7nBKX3nYHmdKQubDLRk7k4CVWX+jYD+T+P+1BGs0ZRsceerm
	iC6/0k/CkR+5QaOd8kjKl2LCYanBQnUMb1Uv38FcNzva9FITphHhg/qk/X/+vNcL
	AezZfIrUK93MMw/8P5fBRc0QdvQqOmruLyxIZ4Eo9ZBKdY22FUpAaUlA06nJ+MtT
	TJREQpbWHOMzlKq9Mvw9DoZX+VKvnXV85eMb1EcWwq4TJU2wJ5azEhOcswZHz09W
	rRs6hw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagvmgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:12:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109affec8so120636581cf.1
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 05:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519171; x=1756123971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/Zk/ptbfC/s0X71iF/TOOzhAZQdu9FozG00nBTib+Q=;
        b=dbkjiuqX9lLl/xiMQgX6dAK2xorfTsCdGuG4S56VZGFSJzxfNja1Imx0QTpNgK8bVb
         Z4Agu+y1TRGKyGbz7+i+e7FmC/FLaLsWZv+0OZ99djou/DgIMdipOCJXKQgaj8FUg3LX
         Ta0wDllqaA15nztUfFYMF4swvhQi5E8rwb5XSHJGZwVnZUDryr9S7CFPPz+cCCasPcFO
         pMKQb37h9EminQqokeKJckDVhK9zY3zTwKU4yCj86T6v7IDRP77KuliaZvZiN4gdfsNc
         1lZ0sLuknRn8yKcuu0tFjTOFoL+XlewwfZWDxj/aSMfOui9M6cJr+LFKXaCDPHLCjVOe
         gJng==
X-Forwarded-Encrypted: i=1; AJvYcCWdTfWWGpsTmZDz1iCUSJny2JqCBiyLuslLVIa9I+XwIhDpnAJfCMMjA5jUDLAuYxJR3p3KacjypS12dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2JgPYKhQk5Y0mbw8G1pD8eSAS47sVbIi7TDgXVocovEui726w
	0yeXz7e2Fe3lkkRDh+0ETLhRs9s+LHrJiqi7aQxJernXFzc+ZXZ21KhCjdKMOZ5eczhWocrMiKh
	SbA4FRDf/XuqGe/T/kTH4WEEDoTKXm77MPqu4HQze6e3oWNhOTemwzcAJCuauOYne4A==
X-Gm-Gg: ASbGncusZJ+Ii+rbMsRnsMpzco8KDbz720klPAcM0Bx+QmMlTOifRf8oglNr5C/GkoR
	GsV5/VdeRtsKMJ/Fm7DiXEKx1T9OEZkdBWVdyLDuVbcMvdu75mhqAFcTOcSLIZaUCrJ4d6zc1rx
	rHeGTMQnUjfRgttdsFeQGaZxr5NwihCxX+bI3KlZ1ajOW5pl0pStE/rL0+SDgOdWQd20gfzSfnB
	/RPjFhC3GAsmRzaxEWi0P7uLFCMl/QA7FFT0JDGnjW7ZPDE9hCGzlqGMnyeF+6V98HwCqZKo/1Z
	/FDqhKmmeBSaNxh2eLhWDMe7UxYYCliPUUBXq/O6ffiMwVDpPfNus04jzD8JYccRiLs=
X-Received: by 2002:ad4:5ec9:0:b0:707:4753:bfa0 with SMTP id 6a1803df08f44-70ba7ae8111mr141335956d6.13.1755519170448;
        Mon, 18 Aug 2025 05:12:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHRFvUfwURz3ewAxMtJStPogLwq4buM+7ktoCYfMhG9uZfyOelR0HnLGAyPJJlNvhRCWmp1A==
X-Received: by 2002:ad4:5ec9:0:b0:707:4753:bfa0 with SMTP id 6a1803df08f44-70ba7ae8111mr141335526d6.13.1755519169817;
        Mon, 18 Aug 2025 05:12:49 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45a1c74876csm170320785e9.14.2025.08.18.05.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 05:12:49 -0700 (PDT)
Message-ID: <9533096c-926c-4251-89e8-84989a9bf0b7@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 13:12:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: qcom: audioreach: add support for SMECNS module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250818112810.1207033-5-srinivas.kandagatla@oss.qualcomm.com>
 <8405b263-08a9-4b8f-ad20-73c8f5865b39@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <8405b263-08a9-4b8f-ad20-73c8f5865b39@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a318c3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=gLwdHoSog2dnRv_T-kIA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: jW7ZhqYA7V4StV9Nm6-E-zD7z0SBQMda
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX1xGfp5D/lsL6
 WM/4lrIEiP8Psx1mdxjGuLt6PcuNznzQVojgxS8XFLaf1Eje/RFyqfM0XplCWVS3v1t1acJE6dr
 4x9iKRiqq0W2LJVyhAFkdj8EIRuGr5clEuBSMJb29dmzTDGu9eOy4bjUsyEKGl3KqwIgtXRSfwt
 72ivTrBHXzyBbMzNx9ve/KxkZX+3lxIJk8Bz5Lhfi9HrTm5iY3F1wDCNcUTer36t1ywwb88piYt
 BdIKBvPuxfFKJBPoK81cjbbRth4uy+sgNa+LHRFO4XyTkxG39vJiQrK04xhTb2YBQy095HNvs9p
 HObpGtJfpS+DzC4nc4enUMijpZjfWfGQDLTw5NghxcrrWwvjcbZr4tVmIaOR5LADhS2E8yg0hTl
 2eWmc6qw
X-Proofpoint-GUID: jW7ZhqYA7V4StV9Nm6-E-zD7z0SBQMda
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024

On 8/18/25 12:58 PM, Krzysztof Kozlowski wrote:
> On 18/08/2025 13:28, srinivas.kandagatla@oss.qualcomm.com wrote:
>>  		rc = audioreach_i2s_set_media_format(graph, module, cfg);
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
>> index 617bda051cf8..2ae6420f4b6a 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.h
>> +++ b/sound/soc/qcom/qdsp6/audioreach.h
>> @@ -30,6 +30,7 @@ struct q6apm_graph;
>>  #define MODULE_ID_MP3_DECODE		0x0700103B
>>  #define MODULE_ID_GAPLESS		0x0700104D
>>  #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
>> +#define MODULE_ID_SMECNS_V2		0x07001031
> 
> Can we keep these sorted by hex?
> 
Let me try that in v2, looks like some of these are not sorted.. I can
sort them and patch it.



--srini
> Best regards,
> Krzysztof

