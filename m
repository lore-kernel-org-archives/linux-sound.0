Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92A1313293
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 07:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783770; cv=none; b=OUWpkYNOoir7aSy2lbmr9QJPnJL70wv/ii0mbhY5pr41F/JVY0x1AHohuj0Zt6gi5ZfuWjtP9CKk13DtkvgNe2v8vyBP92zfgTrmDii2pwsg7sFOxDqHesOOPFhZopJZaivRAxnhpkTY2qOR59MgkOt/DXsKqeAcCyQDrHbQ8SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783770; c=relaxed/simple;
	bh=rPpR+JEU4AWsArhRXhxivKxue5LAvcS/poaS+MqiOMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0BrAzJyMh+bH7/1+i4xmVLNLmRx1LjI2rKLroWCNm4XXGGtHcCCpDt1VkhN18CQikqlRGJnD0AxmXXHLqTLG48zjXVmTk0mhyZqE2YQcpcizj++iWGyud7zlqH3/zhJHI3cQSL6g/sZXCTWBca5Gad+CqzxfhQ7JwCG0ppLQFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TnWeIOAD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/RCrcPs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnWeIOAD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/RCrcPs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BENFbWu3744091
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 07:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tHTGimBJ2AHe3ljN82VBs+OakJeCRQr7H/RL9HxLvDU=; b=TnWeIOADfBJsxtOY
	6LspDQ+1FBL4d9ZvVo0+WtrOBNpRiEBHNNMzFakvc3bM/jFqlVNEbhzgDTF9mfGB
	llJxfO+C0kHykeC5MgxdyKa9R17RoHtrRU5Qp0rfE/8z+SHulUOoygZteq8yK4rU
	oP+AXSPx+w8zjSvjCh533rMhuv10Hxzm8MxK1G491yzolFJuVll6sARA/Rj7WxcZ
	sr50IBxZoe7wUfwdiVrXewp00/ZyP2mIEW+F9gvo1jkgr/qF5GV8JvGJynuYWgER
	HaUojHzBJW303bUqLAMl8as1oU1YB/+mm3Hku+gVSd9Uj5Aiein7mGZ8NKQVQiK3
	/dZvjg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11a7uhk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 07:29:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f25e494c2so24257885ad.0
        for <linux-sound@vger.kernel.org>; Sun, 14 Dec 2025 23:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765783766; x=1766388566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tHTGimBJ2AHe3ljN82VBs+OakJeCRQr7H/RL9HxLvDU=;
        b=G/RCrcPsuGvcHfiBTcMvcq5FEz+AOy9BdwphPTCrLLwWMP4jF1wrMYff+cNUEbCnag
         JCDXx5472w4z8ZER/ELXc0q8/5DNyT5R3CqTpbXSwwWCzYN2uql2Ig5WtjHkqIrJBNOt
         ogDoQIkGi2cleSZ28BBA5DzpS8Et0eTSmhgxrPY2E8basohmu5BSEB41ovg6D32Bg6+4
         cA6es/8dNEAXNy9kqaBEdY0c79POf5jW+zu/1AUtM+AJfpNnKXMDfpNlfyDMkmN5wSn2
         1HtBJ9NxmKi78W+4NM39DICQyK68278F6IvSsnLU3OgiIfUm4wuNVxot/beEJxF7gjg8
         jgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765783766; x=1766388566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHTGimBJ2AHe3ljN82VBs+OakJeCRQr7H/RL9HxLvDU=;
        b=rlDAc4Kv9y16Pkti4JjcncSh74Kj8Aw2bP23gHw14DnFJaYlVJSS6xfz3Y92uE2ifG
         jje6IQ2M8ZqOGy5rVGTQR+VwzrALvZ0h4EikLxOZg9d/5X8EpQq/Ocn2/epc2EKbWFEt
         fsGpwNsfFFeRlkea0qWSfyM4s0hMaYs1AmaD2F4wb7bPzHahxGJRFPkGcjEsLdPlsFF4
         70yUOn89fzutaau2a4SnUs8gRb/Ibh9XcsQkRfoapBE0hl+bERNH23CGMlrOFgLdtq0c
         cLXFD4tGC7kM+k+MEVgje8TEXiQbNAHa0RFhDGz+Nku9moJKq3exNn1hNe5usA7vYNao
         HDYg==
X-Gm-Message-State: AOJu0YzJxpvCNzgKSAlYSvaHfpQpYT7Mnz69xs/xa5Aqyl1Rsh6x9OGT
	zKlrNwjU1QpijpsXZZZ6HWZNJKhDGRR/HZI74VzDWqJauvSQYwnTna2pJ+4x5tLFiepsnf0eWjk
	DUtVqyjughGhSzEAocHO5LP8+92qW9dRQQT/hbyMD19XFpwXEiXxf9S590LKonafIag==
X-Gm-Gg: AY/fxX76oJMUN+8NuCvw/FptmV8E0yRT1Y/HOEKy6ZrpVfcLQ73D4YQL5HLfzdmobRs
	he204ig7/J7rcA1rlW93s2aWEw7N07gZqkHuQipArtnGjeSKTI88jchgf5BHugeB4Dt21jonYnu
	RLRz3uawg6UFGQOBBxWFFeGI4lRn+6Iw9dkvz5sQU2vAnb/iWq2qdU45ZeGsiw/0K0OopKTVhMt
	ydllQ033WaPYy9kswa4kVcG8iWJ31W4Tjzyem1AfesBkOi7uuG8wAZ+LnGGNHBVLR4LzCanCMOH
	I9vgTpKjXutrlk6wRVcdrrg+ndc0ceF9Px3MtrIbW3XBhNDkVvgSlbEfoPCUv/gdpBgWaVIWVKD
	bcO3GRCFmlfXSLNga80EYpJLdqyL72qCT9FJ0
X-Received: by 2002:a17:902:f786:b0:295:55f:8ebb with SMTP id d9443c01a7336-29f24e9fb9dmr89695785ad.21.1765783766380;
        Sun, 14 Dec 2025 23:29:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjE6vR9hn3zNAd+EEtj9kQeIGPHG2K2FSEfCUMVH0AsQZMVo13EwxnJ2rOJ7vUhPEkmHK2fw==
X-Received: by 2002:a17:902:f786:b0:295:55f:8ebb with SMTP id d9443c01a7336-29f24e9fb9dmr89695635ad.21.1765783765864;
        Sun, 14 Dec 2025 23:29:25 -0800 (PST)
Received: from [10.218.23.240] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36a80sm124266065ad.19.2025.12.14.23.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Dec 2025 23:29:25 -0800 (PST)
Message-ID: <370a9d69-1706-438a-bb36-01a22e5cf540@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 12:59:19 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] ASoC: qcom: q6dsp-lpass-ports: Expand sampling
 rate and PCM format constraints
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>
 <DEUL786WEYBY.3502XZKMTYTN3@linaro.org>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <DEUL786WEYBY.3502XZKMTYTN3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA2MiBTYWx0ZWRfX5GsORgbEJnw4
 CFJ4ufdxFUpAchwgaemSNzerosklioEkCa7Pc7DDEs8bS1QibEGnY+xDOOyNIN5NTMDhZt7j9Ug
 HkfvLO3/XYN12xTBh8JaC2uPWCqlzqEYT13zsv1hjhWTcDSB1IpKaa34HwZLWw0gNQ+RKWMdz+O
 eZOpOZeLRr/emQIKhxDpcnl2zAEdnkFCLW1kfGHJs6niOvJU7Pb4hsKdYfmERz4kVbALRgJF4Dh
 1UqcXO0qsizn/hFZ+gUHh7iW6LnfxifY3x87chmYbWGNKXg3vUCAVSqiUUNiky4hvRaKNC5JZSF
 d+O+3rMsU6EkpjOQHmq1VFHoGLE8VaUdAa9PVxLRCEBoic6mgiO0DKk9TZA1Ut3/TNYDHkyhESx
 bPYaWokFqXJJaaRXByIQwOYhkwU0rw==
X-Proofpoint-ORIG-GUID: YHu9rm6JAe71kgXUDddJQvDEXEJP4Bxc
X-Proofpoint-GUID: YHu9rm6JAe71kgXUDddJQvDEXEJP4Bxc
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=693fb8d7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ZkpuqGqE320risMCgIgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_07,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150062



On 12/10/2025 7:26 PM, Alexey Klimov wrote:
> On Wed Dec 10, 2025 at 6:51 AM GMT, Ravi Hothi wrote:
>> This patch series expands the existing constraints in
>> the q6dsp-lpass-ports driver to improve compatibility
>> and flexibility for audio stream configurations.
>>
>> The first patch extends the supported sampling rates to cover a wider
>> range, from 8000 Hz to 192000 Hz, ensuring better compatibility with
>> diverse audio hardware and allowing more flexible audio stream setups.
>>
>> The second patch adds support for the 32-bit PCM format
>> (SNDRV_PCM_FMTBIT_S32_LE) alongside the existing 16-bit
>> and 24-bit formats, enabling handling of high-resolution
>> audio streams and improving audio quality for supported hardware.
> 
> Is q6dsp-lpass-ports involved in compress offloaded playback on
> existing devices? If yes, then how is it gonna play with
> explicitly setting format/sampling rate to s16le/48k in sndcards drivers?
>


Support for s16le/48k is already available; these patch will expand the 
existing constraint so that customers can use a wider range.

Thanks
Ravi Hothi

> [..]
> 
> Best regards,
> Alexey
