Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AA73D890F
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521653; cv=none; b=QVYMv1WU7QzZbbmGRWE9eAypzjMJGU7kXlwJiPaJRiA0seT4EKSbNSViGNu1ZLRDLXD7PJ6aG3ps8ZiuaS06B7eQiGpDF9EFzUf7VaimYmPNyFxxhkQuV2nw5e8txSSgvQjHUZGw4PEZ2jcHO2MrDaTlHB2hHYGb9leeEWBPM18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521653; c=relaxed/simple;
	bh=Raxp4DpOOr//GI7HLC7H3cyBdQc6n1AFESD8hy91W8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KHt39Rw1E1ORMArMdw7z8Fbec4icAEDw8H9BrhelT0tbQr3i+xdwiXeEW2BMbgTFV+p4PieSUDXV/NWHVRPXxYXVkVGCFL0Yo/JE3kCdtIdj2yrNRh5N2tI2W25whggq48ObxTyQ3cdKRaOViHqWdP23G0ZmUfykIaSArI/yX5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJ/nx1lo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLWya0K7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJ/nx1lo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLWya0K7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8HSqX1554659
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 10:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/arv7lUozrv3PHdRh276TBOQ+5XzrDva6kQLT1Bb700=; b=IJ/nx1loYBEaKbOS
	GlVMJ8xc6YYsFf6TYZsiorUuWKDIY13xJAQ9uYwdUMuNcHzhcLkBpL1iqWmbgSHQ
	ucu9dx/VmHTuKbBLpt+OysO1wVRJFgs+4vTNAsx26NXxLOuLyoQTYXvPJpqXNyhk
	Pma9W4MNEmTUpnI9tumuGEeOA3YAS0W307HpkTB90nUW/RCQFEB0czBb1Tc7qqfC
	ZL6Rr0KcT3wNAt28bppJ7/kxcFXer21PK1/d8/BysphJsWLTkY2X+cEHh4IlxcYE
	6tTCZ/snM3ity+cneNOaA5NLG7sM5fcmbK/f22wMADjHQjEUmkT/66CMQIiIl2vA
	GntxgA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4gj7c2uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 10:40:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c4664f75fso694323b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 03:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774521647; x=1775126447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/arv7lUozrv3PHdRh276TBOQ+5XzrDva6kQLT1Bb700=;
        b=gLWya0K7q07wwDwlZwFpl79CG5gKCATw7naT2MCJzbGqJb4BSlfenIqGCkWxeAPUGd
         2FcriZ7KFkU5oZeq59LJXx8igESDB8vSG9BMszEho3px3wKEnpEzduYrrS7suTdnM42T
         wfwxi0IHfMsi8lhtgIO+7GjARf+DHobkH7fEd8RoO370ICKWCT/PpIti87bq/dPNGYoH
         p5RbATb3XNFOMshoulddz6sPaRvQ6iCBMkUK7oHLEReXzru26Ky3VfuPH/tvxY0ayZ7i
         kT/Dt37CS/nu7fcZGEt2rTvGF3NBbiC8Vb+KOja1PSQ7FobUoB043vc0wQiB/2ZIcu+f
         0WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774521647; x=1775126447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/arv7lUozrv3PHdRh276TBOQ+5XzrDva6kQLT1Bb700=;
        b=GnyXelY579bQTUYpl0FF+vJQD8G7rn54ZPkjVL/JhqeaamdaRxax9gMjyEg1q0r3U4
         2lPZWSev/CCcM3btso/Jqv+7bzn5vtVEZX60EiJKUhcj0/ETDVw6+LxKeQuqW/rf1iZe
         IHJaeh7CQghdiYSkg4jzwLJeiy1gmXSgiBu9GD3QCXC9kj9AeFVL+5145o4vUdwYWybu
         omCTvMeEfN14MqXHO3zlTtjIBPxQd0KV4CBSTRylUkLujr8rq2UPudP1L6mYkx9HDQp+
         XOlwuG2v6DA55dSb1Fqr96Go5QSAw2g40pdvLeInTzBwKEcahNTYAEYkZ3fB8mK6Qugc
         ijDA==
X-Forwarded-Encrypted: i=1; AJvYcCX+0i7KT0wLJiL4sOD0T8Qh8RddoU41oAsQP1f5HIsYWmgnQd6Gy546ZnPtyD4gDRcBzYuSxuGIpjvP8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+FKmbJgLAAV5scBRTNzbHF2NnL+vSSWqC1KKjLQJWyv0rllbp
	a3/SQV5Iomxe49jxbJQs6puMlYWcVlF8caG30W4S2INluOHcgpsTkpAjznTnow26D/7Iuh4AdYO
	Zppas4ZmyfgebDBEomKpHPlk66IO46rgnD/AasKN/KUj+ewbz2sJapqiYwbzo8chW4Q==
X-Gm-Gg: ATEYQzyrUctLLDSyXBW34QD26a/YYQio4yXdWY0E12JSSX73zVrvHD+wK4Zf68sy+15
	zcHJ/vnmUoJsMvEe07o1qePWZXdD9nsrnF7FP+xZ+aIwISUIMu+CGEHvyM2C1MrgsAfEI1skP3O
	dGv2YXSlT2OhbNkfzrL9cxroiBvhBxILuZtHKRytQxNM3s1HytbsfeF3Aqo35Imr5QOmHxM1ul/
	xZidU5r+2MSP6CXi3/3ePITLBFHp8AWQJoVpoutkWFVLNvpjr8iHAyJ6pDnfMqwP+kpTF4/CmAa
	QE9MUkt2C3BFTJqMeMGZcFYd6GFQmKvQKyQdrWIaXdAcnKzsqRljKKZ6yutJ5ukrH+r3Dc4i5oo
	b4ssEjS7WRHzKUniVnzjXeMjM4fY5MpjqyQajGM5pqPztv5+g
X-Received: by 2002:a05:6a00:1311:b0:829:95f6:7625 with SMTP id d2e1a72fcca58-82c6dfb855cmr7330101b3a.28.1774521647271;
        Thu, 26 Mar 2026 03:40:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:1311:b0:829:95f6:7625 with SMTP id d2e1a72fcca58-82c6dfb855cmr7330073b3a.28.1774521646765;
        Thu, 26 Mar 2026 03:40:46 -0700 (PDT)
Received: from [10.219.50.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d22c8e8sm2154139b3a.24.2026.03.26.03.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:40:46 -0700 (PDT)
Message-ID: <c7ae56bb-284a-43c9-be17-fc7e61e46845@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 16:10:41 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: qcom: audioreach: explicitly enable speaker
 protection modules
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260325054408.1994556-1-ravi.hothi@oss.qualcomm.com>
 <sf2hegu7qqiq56nftimjpvf2hj4jiti3zxjex75pmcjuoaqkel@4rosfzs5zvcl>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <sf2hegu7qqiq56nftimjpvf2hj4jiti3zxjex75pmcjuoaqkel@4rosfzs5zvcl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M9hA6iws c=1 sm=1 tr=0 ts=69c50d30 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=h1kNtkvBWpyXzFN478EA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3NCBTYWx0ZWRfX9+7j6nCaMQMa
 0+9K4/02fU7T6mg7ONtWMvt5nRl90pOJTS88tjklLDZibD4uOhcjTJzZdY5FsluSZ5G09WJ8EvH
 CyCPjZHF3Ui6/GQcIZcP1H+RA9mp1i4ejPwt3zawBPqUQkiEdEGs/2OugyDttWZwGo8GvtplhmD
 GK6dqkpIMnOq7Ibn+9T+nBnuF1ovrjTTduGDxaX/ZJVP2NadoRhAUmWFmc5m3Ihx/DjiB90LZHZ
 3VFziuq0EldQqASkgi395RfOnnQxhGubi4T53DzD5sS6ya5B54mJ4F/x/R7gcndjNbpJ6qqWZ34
 ShAlCasMlhJIqPO6Din/vLUijFverx7wEj6+rMkJHDWoWK69QdN4r1WvRZT/785J1eD9Df4sUJD
 WCVuSX3/dvPvMcB+llZRv1yXazqRtO7rf/S4XXl92v1hx+A0gDCtBOAj8+L7lVIJ7+kqAwnDBpg
 HPPrlarNi2tOvDSYWZw==
X-Proofpoint-GUID: iFMAVA8-Q-UtmxA9hWEzlyAbbN3z9nfd
X-Proofpoint-ORIG-GUID: iFMAVA8-Q-UtmxA9hWEzlyAbbN3z9nfd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260074



On 3/25/2026 1:00 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 25, 2026 at 11:14:08AM +0530, Ravi Hothi wrote:
>> Speaker protection and VI feedback modules are disabled by default.
>> Explicitly enable them when configuring speaker protection.
>>
>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> 
> Fixes?

ACK, Will add the fixes tag.

Best Regards,
Ravi Hothi

> 
>> ---
>>   sound/soc/qcom/qdsp6/audioreach.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
> 

