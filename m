Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3757249EB
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 04:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759982512; cv=none; b=bQVj19A+pEUxeCciZ/XWU2DRo4HS7rYMO79dMrVVqmAmhNOiQC7KewBgZphanbsCk/yZQ5Zg1e9XmR4mTdb1Mzz0B7TXugLT9fq33wat08DQUPRrOsrUjc4aQME2PAhmdlBS1iURocUziDlZhxqSf2nEYIxYOMW+CdMkPd4o1Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759982512; c=relaxed/simple;
	bh=a43a/WOJy8uZXXez1tGKF56g5QwNfcVFfqzFknkXgos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3MUkFrfhRJfpYVz0agFBBVuL7iqM5pv1o+suVQcQatHVq72Nsw7TnMJLBI7dhcI/T9Zg/I0qTKJ02hKaAu/mei1ESiPonitIxRCSCzZ33tjPq2dPsyEjI2bHfgOwRXn4CbHgY5kMBYJaGKulP2YsX+z9gYfm98vAcVMSRfcOSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfH1KhJz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfH1KhJz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5KPM004532
	for <linux-sound@vger.kernel.org>; Thu, 9 Oct 2025 04:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xMzD/1x6I5Sm3TA9hm1nmCUR2NzvzpGDVrWP5NKJhvE=; b=JfH1KhJzxJhL5G1g
	Dui3e2YHuM64f9HyO0f8acVpeOmZzPIWh/rUHLjVw7x8zF8J0d+2eFPXGs7X80g7
	KOOFPeuxYNP6aIQbrcVHw/l2RoxFU1qlAsLo58ac5qtqLHuVmhgetSkIvg4cNHIN
	bFqBX3L/AliwnVNFrkCTEYqhKD5WJYTMNxGj07zUVjGqnE28zI9hDaJ6m6jxE50d
	YzOWb5t3N+yiBUGDJSMBDDqetPl3tww9TCwLLLVGVxMd2Z+rKB6n1FzA5H2nM8b5
	YllpCtBGtiCN4IbSJWNxxZdeIo2xedNkb1BExmRLMVpsN4LNaPD6BTE2/W/6DIkQ
	0cCqTQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ksc99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 09 Oct 2025 04:01:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-78105c10afdso745592b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 21:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759982509; x=1760587309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMzD/1x6I5Sm3TA9hm1nmCUR2NzvzpGDVrWP5NKJhvE=;
        b=YXsc6KdkrV97NvkeNj1PF4QH4FNQzMKq3b6XhvBHghZGmpBm0RkVTr3UFXVtmvRRZZ
         rw24eOxmylOsW+1n9UrrBHUIAzn/rTRFOrvUStuT/7J+tzghYUOqTyaTaClMrL2dvlps
         5AFy8F/yPMRzinoM21hjwBn0EqZtzALqgyV/d/WFTWY3lAcmovk7Fe223u1/VB+au2sk
         0YS3luzkgel4U9u+pI0fSnzJKPHbfKfYaeDnUqUICdP79RIN8HdGQiMRSJjx9XNJjUjj
         yV94b8rtcT9iVYdEOpXRgmQiwnf18r/Rj+SdSks4x/xmcUclC+jObvLbjdxfiXb4Xopu
         uOoA==
X-Gm-Message-State: AOJu0YwlF+0ihwZkn3nYPWzhFCepGgTRInYImnffB0snLSY0bc1xf934
	tYhAJNOCoZCBxp8KfnkK7S8kgb4wil8Nm5dmNQaBKYfhwQtwWUNxow05qG74ea0bla7XdWlvWAg
	U+jaUyHIKr6le6rXytLSFFGJmHmdSJPmKX6varo8pnmECmoELxMcfkNLOXIuHE2ViaA==
X-Gm-Gg: ASbGncsPLK+zOIL97P3+biwzEGF2t3BdDUHVHt+63Z3JccKqNMC6PI51aH06LXt2Ed0
	m1XLMh/b3gXVkXT/pxZ4h555VlqiA9uAeur78SMqVTUkxuh7kxV1GGkg6krP45VMyeKxmkuNAKJ
	ZWFdti9BW7Jh/j4PTTRfLsO6JCCInkG9sCEMl4loZytSXqLqVpFfvrhJ/Te+5RhlBFFGeoYwjko
	JDwQJwNTTrB3X/0O9No5we6cuCEG5Zl3LEMPZ0JId1zKqhP3ryiKADlBMggrrcBtXXrwiWCUEHe
	DrvhtZ7ImIQb8oWWvVfWqjVvCcwLZIgdWRmjB/0LpSM5uIvKPuHqaUHfQO8PKtJE0yJFj8nPTOz
	lmLGjHKtIgr+8zLTdP1kCHKfaY9hMoyg=
X-Received: by 2002:a05:6a00:2e03:b0:781:e9c:2178 with SMTP id d2e1a72fcca58-79387c1ace6mr7086582b3a.31.1759982508933;
        Wed, 08 Oct 2025 21:01:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiVFGjSsBPmIHkzRmXqGgO1LptcNCD4ejfPklbEg0Tc6AH+hGC0RQoErXtmfjEstoRjisSow==
X-Received: by 2002:a05:6a00:2e03:b0:781:e9c:2178 with SMTP id d2e1a72fcca58-79387c1ace6mr7086543b3a.31.1759982508363;
        Wed, 08 Oct 2025 21:01:48 -0700 (PDT)
Received: from [10.133.33.54] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e22ab5absm1322883b3a.64.2025.10.08.21.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 21:01:47 -0700 (PDT)
Message-ID: <93491a16-0585-4c24-8ba5-0e4222efb5da@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 12:01:41 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS615 sound
 card
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20251009023341.27277-1-le.qi@oss.qualcomm.com>
 <20251009023341.27277-2-le.qi@oss.qualcomm.com>
 <c469ad4b-9dc0-4ded-9736-1856e44d21e3@kernel.org>
Content-Language: en-US
From: Le Qi <le.qi@oss.qualcomm.com>
In-Reply-To: <c469ad4b-9dc0-4ded-9736-1856e44d21e3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX8PbCpfoCxica
 lKkEPeMA1kC7E+TMoxiswKuNSdvZXhEYsDKUpSDsJxh8RJ+trUSFp8ef+W28y0UB/TVPbcPZD5W
 I55GY4ERzKJD1P7Q+nRWoG7/agW9yVkbiAHOeCtI1ewkkY7Is0QmpVPcE6/om9EJO1VSKzfIfN9
 oWHQBcxf673bxdvUY2gY8203r+kNG/oIH1V+I/B6w3brLVk2+n1UUSXX7zbbU7YjoNmysIBqPJ6
 acIPqqieIrfEsJVguF+MXVTurlBJEwICPopfGZkFmzmpe6/R2LoD09xOIZXZSrIm7lwNv22Z1RF
 lk0Fo7atfl4G/t8t35Q1D4TI78zHnuefCIb1PGE6eQh7rewM7jlJO2kUm0hXL3rTefiV0z+WA8Y
 pVU0lBeGyGlK8UhA570j8fQDTLdKqA==
X-Proofpoint-GUID: ZlUAsmF0pMdLrC28Xx1kSrKCIKZaDiyn
X-Proofpoint-ORIG-GUID: ZlUAsmF0pMdLrC28Xx1kSrKCIKZaDiyn
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e733ad cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=uooNEMFFsLr74DcxLqcA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=ZXulRonScM0A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/2025 10:47 AM, Krzysztof Kozlowski wrote:
> On 09/10/2025 11:33, leqi wrote:
>> Add bindings for QCS615 sound card, which looks fully
>> compatible with existing SM8250.
>>
>> Signed-off-by: leqi <le.qi@oss.qualcomm.com>
> 
> 
> Just clarifying: is "leqi" your full legal name in latin
> transliteration? It just looks a bit like login name, but of course that
> might be just my western assumptions talking.
> 
> Best regards,
> Krzysztof

Yes "leqi" is my full legal name in latin transliteration.

-- 
Thx and BRs,
leqi
