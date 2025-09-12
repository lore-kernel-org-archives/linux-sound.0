Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65812D062F
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 07:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757662698; cv=none; b=hsxed81SNnaAPDXA4hHXiBzyVPeagk9AX0gWFJZAVEbM9oiWTsEjGEefizTK11lAxsO/v9QxUC5Iw0Rqn4l5UOGz3UNSd6cLlN6AhfPvF25U7Uak0iFFGHHapBEQz//XfZTeVTuWBuF9MSr/oIj30XtmECikzQVjUP7hOs/eFSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757662698; c=relaxed/simple;
	bh=PxSU16uE+Ej2HzCtdrXRq8+sKeMpJU7IORy3bAXH488=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLZ5MIOzbn7l/WUCQkUHswNSqPWTvCID1s5J0ndya/j1IebU4bQLglWoj8XAElkXzwm+B8dRFnN8ru3Gyi5ISVm1k6RZKXhBcD9NsweTmyDtzH3/ozcInpPl4tp2b7s+6BccujnESJBJ9fO71MHVDdispZKqM3rVftb0clVMQDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3YDGEpv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3YDGEpv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C5D4pi002496
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 07:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6LFu0Fh4zfdsz13Tuo1my+OP1x2vo1Q+dpLEWcRgmcg=; b=Z3YDGEpve9wTTVnP
	3c1zqQnKAXKzqGNZXSnJ693OYIyrVZp8NPFtvdrcKyuPALjtGKxx5tBPCkVrMswT
	SzEevKd08SRnmGYzjsP4APYJ1JpbEn03YSQugATr/BB3Dg4K4P0PkzEOLwnrPNXK
	KeHmKQR3pGalKL/a3xA1gADA0CQqQ8MkWDc/XUQ2O1hUuwoBTzRKzlJe3hzCTaM9
	BazOSeb+tChzsZWuDUkW79RPBo97/3T2djMJROXX4EYpHvUmMJzv/qy8YOhxnnpp
	DSFb/bEDvPT4Vhu5HMdmWm6wS9dloeGzGpU+o2MsAaC1GLYjq0TLqyFpageF2cEm
	6bh+Ww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8trcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 07:38:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458345f5dso20624045ad.3
        for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 00:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662693; x=1758267493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6LFu0Fh4zfdsz13Tuo1my+OP1x2vo1Q+dpLEWcRgmcg=;
        b=g+B9SBH6UylK+xPKHZjpXzr3BVjypG//c7pnNR/8FNajTUG9J/6NdqamoqNDlG9hPL
         ML6erdEqzpxdD6dcms3QoJHcTr7qUEDhm9B4NKWCSqdza28hGu71QlF5pZdPBqmSG2I+
         NK4RBuIAjeFj9c8yZRpEs1vO0duhK53iDMEYbp9sTE4A71GloQ5gTlPc0YqLd1Q4LxYM
         YjFRsmUnyjvD1ngG/wEB/goZ5/WMDt5T3w5JlzYpOKVb88aMm+hhRpHuca96cJ6xJZhm
         RmI5JHevkArRnC/I1M/eHpBbLmbrSI8C445EbcbSiVJ7pkyaaizBqhWGlu61JWziPq97
         r5hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlJ5TjghvHY5g/XK0z/9PEDlFIW0kSEA6fUrVRrSO+ftcHtdHoN64bdFaOWlExw0VRLwb9drNZqju9ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjWfVbeAzdkouwhoYrhIHhA6Xdr7KiizHqzipApYgxCg+YPQDn
	tfge8okmzUIiVVfQla2qrM34JdtU0UyuXeU1BFYOGhJLUGVUBIf2GvbDM8I2vAnBa9y0MtbmZQ2
	xKfdtOSH/KFcXfuXXxjbHUx+04pTB3X4iOiyMGzdDoX/GwmDlaJUETdZKcEiFEBiOpg==
X-Gm-Gg: ASbGnctwxJOjrIoxYFTaV8z8c+hPz1Qly1kScpIc+GwwkiiH5KeDI4A325c2VOIolSW
	S96MKtuOnv4EJA48uNQB9w5UTaFjsUjHqQMeBZYOx4T03dZmnCUiO54L2ilgABuWrlgIZXWKyAf
	IQoiIW1U0hcRaWgkBmugBXm3zJzZkjnDYVxGs5x3lZJap/tKdfoiLdYvdHpwnDy9UNhjMLOFq9C
	rXdqTpJ7Qi8CX3g3H3r9vwSdh1fSQqhGGKhWxxCl0pxEs04zFBZgWKiBlbVMIv98v77tG4dY8Ip
	bXEbVzvQZ3mwJIQ7dPlcRaQ6tCzr4tNqLqDLJbxkrMrmc4+QbzEER4TsW1h6LKA+Bmko4cXKj8o
	24A==
X-Received: by 2002:a17:902:cece:b0:248:f653:538f with SMTP id d9443c01a7336-25d25193c98mr24576255ad.27.1757662693032;
        Fri, 12 Sep 2025 00:38:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8mnmJxdmy5GnWW3mwOkJg1f+1p4sXZ2EfwMYb/qI4p3TOyTx6eLJBt84nq1qMYnMbR5hhtQ==
X-Received: by 2002:a17:902:cece:b0:248:f653:538f with SMTP id d9443c01a7336-25d25193c98mr24575825ad.27.1757662692288;
        Fri, 12 Sep 2025 00:38:12 -0700 (PDT)
Received: from [10.218.21.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc5890sm41341715ad.4.2025.09.12.00.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 00:38:11 -0700 (PDT)
Message-ID: <b8a3211b-6d85-4949-9de1-54614dd8d769@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 13:08:06 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS8300 sound
 card
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20250905142647.2566951-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905142647.2566951-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <43090acb-ea36-4015-b14f-78d44d789d42@kernel.org>
 <a9507045-b900-49ee-8841-0f8fd30816ba@kernel.org>
 <abc66798-dc91-4860-b0b4-de39a58b5745@oss.qualcomm.com>
 <a8dcffa4-c578-46d7-8fdf-cd4f5a29a2a6@kernel.org>
 <4c6e7e6b-2ef4-4ea8-8bf2-26c7aa8c94b8@oss.qualcomm.com>
 <ad8fbd0c-4e94-4edd-abb3-84ee9563fac3@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <ad8fbd0c-4e94-4edd-abb3-84ee9563fac3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX5TV2ek84L2ct
 iwJw1oOSN5OJHWCOihHQyNtcbHjUppc8Rdd3av8uDwoFwser5rVQTrLCMYkDN/t22YILzsmZB5W
 jgFCONpKdK/skjm00HpEJquZ9nfgya51WD07BgMG8axrz3kOn8UQP75NMx8msBkihQIfM0raOG5
 W8KG4y3PVg6LCINxhJNPfrATWzX+LoQmu37/Z/Qy1MnzVLESsT9VUYDt4fMOTJiDU8GEKU8Dit1
 vojNN+HD/+hyyLAU2dWhhx5r/cavujpM7trJVgko/063To9pRYQM8USDegu2fFyTs517RNIzo3Y
 MLgnR5hHRDx62sbEHbjErYc1FpeZvU8BMl9znFLKUOyFU7xfFzVYVphI1nnaAIS0QFpqUA+Qzwh
 nQuq3mmU
X-Proofpoint-ORIG-GUID: 2Igh5z_08KPPpBRXF-MSWgV5Fg4f25YT
X-Proofpoint-GUID: 2Igh5z_08KPPpBRXF-MSWgV5Fg4f25YT
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c3cde6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=d966o2na1F7DTwhL2BsA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_02,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031



On 9/10/2025 4:54 PM, Krzysztof Kozlowski wrote:
> On 10/09/2025 13:17, Mohammad Rafi Shaik wrote:
>>>
>>> So this is the same hardware? Then no, we do not rename compatibles.
>>>
>>
>> Agree, the existing compatible is discontinued naming convention,
>> will remove existing qcs8275 and go with qcs8300.
>>
> 
> That would be a rename, so again "no, we do not rename compatibles".
> 
> You are stuck with qcs8275.
> 
ACK,

will drop the Renaming compatible string change.

Instead of renaming the compatible string, will go with the existing 
compatible and fix the driver match data by updating the driver name. 
This approach allows us to continue using the same compatible as 
"qcs8275-sndcard".

will update the driver match data name to QCS8300 to load the correct 
sound topology and ALSA UCM configuration files, which are added under 
the actual SoC QCS8300 directory in linux-firmware.

Thanks & regards,
Rafi.

> Best regards,
> Krzysztof

