Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5333358D0
	for <linux-sound@vger.kernel.org>; Mon,  5 Jan 2026 11:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767613831; cv=none; b=fJV8bxqctyirBGLJ7qPBYw2zX1zOEvG11IjIXgruxtk6h1z+AgOjSVkkiFvCHFLiDEwnycdvqA2B6et9A4MDUo4adgnU0UgL261Tz9Z90Hp8XwP+VrQi55K7x3vs+TAtoq2TkW0GecKvMjVNqFB7AqvnMAKghrXh380oGRjpaHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767613831; c=relaxed/simple;
	bh=muuTeBbIyBDyKm6FKYuRjXpWQ04lYTlGdpv92becTqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tmzykXbWLUcYZD9daM56GsOgk8nYTq41+56UOwkWNCEamd9qEyydqYkKr4mymKSvPEhvLPi6xSFxoKqLTM8MR52thXZtI1Mimd82+rLhM22zPn3p3/k35e3okk+6/CIc0YfiZqjbpSc2VxB6CK3wnbT3eFjsEaNO5MfYbmP5agU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCQi/Igp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhQmNfZa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCQi/Igp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhQmNfZa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6055a8QM4032710
	for <linux-sound@vger.kernel.org>; Mon, 5 Jan 2026 11:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/9etPGCa4SzqWsoV7LY8Ps6d593YEnHRfVZx4GbP8=; b=WCQi/IgpN5zMEuUM
	KyTfk6zlk/4XIxg1wJrED+Wd2jKh1wB8Mk8JOxBQdbC1oh4rFLlnCBm6Zw1yxqhp
	hrKDAks0YdWcKdhxtsZVjcO8dByMH2UJ0oaPFoFL7Q/UoM/WxiAZlmA3NeZxbNg6
	WmkkzA2aoU9bw3x5J3GJP6sI1yG4d1N+UTfPiJe22DZbBZVlpCMEWB3WB/qa3Pcn
	Zrud8gCK4OziQeYqB8cK7Gpvnt4lVY2Yyuyo2fJG6f9c++gqgzchHpNb+bwBAqKl
	L37MGBGczf0JZI9/CPFQR+FgCKGQvD5bwXzQ9trQrxHYZxA2uYtd4lTAd3KAxT4u
	jXIKow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg79nh2qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 05 Jan 2026 11:50:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4fc0d0646f9so174802631cf.1
        for <linux-sound@vger.kernel.org>; Mon, 05 Jan 2026 03:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767613828; x=1768218628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gx/9etPGCa4SzqWsoV7LY8Ps6d593YEnHRfVZx4GbP8=;
        b=QhQmNfZamzlIULYcFgBDfrlX3C2y/0MgPwUhAoA36rpDQxhkNp8BhY6EJmJv2fopgj
         XQfU08fMx1LCnjpIsqMHmZwfMnKBzjFFBRzWRoj12NhqwT7jzBY6kQ4yrzVTsakvElZR
         LEgf394xoEr9DDWE5NHMGPDsRB46xFLfUMu4ipI5i5/w2ZW9VE7JClOFPZ47x7/QdPG7
         Z87htaOEQORE2OStPTe9b6llgWVxLxvN+NEH2Ql1aFJIS8GGezd2NxzbBFHdBz1E+Hae
         bHM3JU0zrvIzZoU8gk5PrljwjN29DRkJB5JQBmj6OpIUI2db/2Sox8DAY5K4/fXT7NCB
         qiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767613828; x=1768218628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gx/9etPGCa4SzqWsoV7LY8Ps6d593YEnHRfVZx4GbP8=;
        b=K/CmUtHQOSrqm32phPrUcHJUevpLrIe84EfbWBL1jI9TKi/qITqNFJw54kGhfD3Dm6
         JOER4urHNkMzyESgBeLSZ0NB2c9aBBhr55sLHEMS0Q5zCiLV4GyyDyM1BG2rxJW81OSX
         p42ZMUFvlg+/pFj4pnb37yB9lfDOiknGqDcrUbenEverYf/4MyZl52uKs+H6brBXGbUG
         exSRtcbckZdjCrlCzTbN9SULNJxtRNFHHWjwjNyHNtjtMktW4dZYhqBT0MvGD56WK7w9
         mwKIQnhAR7aZdbpzdEknc+3gfFwdrrVAbQ3b1/jP3kCn2SZL3Rgx7NnZQF2y0zXuJ/+f
         zV7A==
X-Forwarded-Encrypted: i=1; AJvYcCU2fAPNZ6flx7IknF+X0v7u7E4PMMj9MEZLtygAjNRtTeT/0xImKRuJGl2N2fg8oKokaRrJzGgIn317QA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1aPsh9QNbXrDE7NyOGChh+GbQdipPeJ68mCvlRYQ5zf+QcMb9
	XQlcjRy4CxEc+Xr39qenu2acn7LEWpLxf7GzZ0XJsoKuwcktN1IOKDJb6ZxzXUbsaFcTtKJ2OAk
	RTXrFPEdRnrq8XAetfMUI3XvjkHh7cp/pN/otEaBKhufAboTGVljf0C5dm2CksG8vJQ==
X-Gm-Gg: AY/fxX7z4oWi5NcFkSKFoZnclOtAh66wXX2h2W/4Ou3boMSkRJhTaAYR24eBIXOTNfh
	dnKRHYjAvUlEx4bKxdWlBxyExRMbHg1SAQiPbGrwFTXXpxAp//kiztPYpacSrf2a7xg5q8av7OL
	HA9/FEhU8dounEmYW1sxM0JbWa+5mAHgytShlW+dqEMj96j71zJl9+DWmFFWe7MH9s15nKZ/VE5
	irv+3hjQuNiZ1TvM94tLPVKsf9JKucj7MpfCZEg9h6H0CrmHQTwAqMb6bKqicKT/YWDwFDPJ56F
	77zOhCRx/OdvcCYdjQ7jInkG6k5ox/s4IzUjZN4D5bCOPjoRL1/wRlqXNYhT7qN3w/UU/Lc0zv9
	eIngm35EOPMmHBrsSz8k6j5pYWR23REOX7P8A
X-Received: by 2002:a05:622a:59ca:b0:4ed:bad6:9fac with SMTP id d75a77b69052e-4f4abcb884cmr785710051cf.1.1767613828267;
        Mon, 05 Jan 2026 03:50:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEx1A9aA/E+xGjOlrPQDXvaUWW3GDFY5O2eY64f+EsbiwtjCzY8ilAcdmA9GZR85qjfvQGBcQ==
X-Received: by 2002:a05:622a:59ca:b0:4ed:bad6:9fac with SMTP id d75a77b69052e-4f4abcb884cmr785709881cf.1.1767613827856;
        Mon, 05 Jan 2026 03:50:27 -0800 (PST)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4324ea830f3sm99272009f8f.22.2026.01.05.03.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 03:50:27 -0800 (PST)
Message-ID: <4773ae75-fff2-48f3-adfb-ec2a9b99c8d3@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 11:50:26 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ASoC: codecs: wsa88xx: fix codec initialisation
To: Johan Hovold <johan@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260102111413.9605-1-johan@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260102111413.9605-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: scBghe9LTfoOUIkBM0-jPrYYc90vLGP3
X-Proofpoint-ORIG-GUID: scBghe9LTfoOUIkBM0-jPrYYc90vLGP3
X-Authority-Analysis: v=2.4 cv=Y8P1cxeN c=1 sm=1 tr=0 ts=695ba584 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6YKcf-Covs3Lqq6NBLEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwNCBTYWx0ZWRfX1/9bQeHsy1sO
 loxGLe6JLagTb4GmQNasK3ErcEk2lbK4PbRhKEU6I9ajfO6t0P1gqUeiLVGbkfOYaXlueHHDSC5
 U1mnj0zFfZQlIUXKOmnYTO1vy0NYnoRumWIwsDXBx69k5E0Hpr0YHMIQgDseSuHe//vIW4t/1Fw
 nGXEbxIRdbuvMlzKI1dd197W3t0F6yPsykN9PjXt8lPCw75ChktJ+34AvoszPt/kWj9BNBL/Z7J
 VY+K15BnaeHm5Jn+YViHzPVhsbYFgJSoqbRsNfPrVRbSMZwIVa5BSuuzA214W42Pbsv3k4/VVJV
 fx9wFZcPx1ZrQPmoW2Efj9mI6kkV+C5PV4VieSmQ2BPZuUcL3FEi9oE7XUbvY+05wgWXaf5cMpu
 MSo5VN45ZloApDN0u/cXQqSZ4/YWVwEyAkQZ6tEtZxF64DFAxohNSiV6CBj4c0jHZxbj8ACogsV
 Fxn7gttzgbAnyP0HMcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050104



On 1/2/26 11:14 AM, Johan Hovold wrote:
> The soundwire update_status() callback may be called multiple times with
> the same ATTACHED status but initialisation should only be done when
> transitioning from UNATTACHED to ATTACHED.
> 
> This series fixes the Qualcomm wsa88xx codec drivers that do unnecessary
> reinitialisation or potentially fail to initialise at all.
> 
> Included is also a related clean up suppressing a related codec variant
> printk.
> 
> Johan
> 
> 

Thanks Johan for cleaning this up.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

> Johan Hovold (4):
>   ASoC: codecs: wsa883x: fix unnecessary initialisation
>   ASoC: codecs: wsa881x: fix unnecessary initialisation
>   ASoC: codecs: wsa884x: fix codec initialisation
>   ASoC: codecs: wsa883x: suppress variant printk
> 
>  sound/soc/codecs/wsa881x.c |  9 +++++++++
>  sound/soc/codecs/wsa883x.c | 26 ++++++++++++++++++--------
>  sound/soc/codecs/wsa884x.c |  3 +--
>  3 files changed, 28 insertions(+), 10 deletions(-)
> 

