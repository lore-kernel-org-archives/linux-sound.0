Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB1930DEBE
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 14:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763993299; cv=none; b=MlyKx3EkbqLyOLnACc/UUepk1BVoTuHkGsjrbRykVFHknOphzVBX657EAJ15HBVkoqXYI6YZGRwulxSMgiqktjVevx8hY1IKJrOIIBNEuHf/oS68onU/j4+kUUSVv+1OsS30DN9ijY7wva99JWcI5rfT90zGDEl1GTG7tspx4d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763993299; c=relaxed/simple;
	bh=7YKZHAFhDcKEqQAk+JIlZdMiyf/pZyD+Q6/FfKHi1Ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iLyg+H7he3As9C+ptcz8deSAPqeTn4LP6YZ6LC8+tVJb6ssURFU0Zr9sHrV+BEHxH4ESZ6srqOknK4wWuHxoINjzitsvsLzC24lU7110M3g5Uicjalma8KPFu/QQroFZRdcYrBl3InBda78T4tbwjzuPTFujd5+P0svxNjp1cV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzzHWQMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K++5FfPm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzzHWQMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K++5FfPm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO81mrU1688024
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 14:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QQ62ZxwkhlLfH9i4OuMkYuxp6Si/5CSoyIHKynyDww=; b=GzzHWQMkOfXzoZ/8
	DWoEejCz4IKvwaydAIsdv63NQBHaFywbDJArjxMWZsS9lPbls2Bb1QqfdfO5/Zyq
	AVbEsZnSKX9Bfr73eWWqfDdLVuDUQEJ+dwgNZDMaeBbabdN6/zW3EXiwd1vJHC5I
	iLEOFb2u5ebwuEZ92psnAIi/HU1jKeiSaKezgSfpAjccKTyXLOGGcUWyEoH7Seoj
	okWEVDKF5ytiiNH339b7Ym4I5x5QLWbJyZjMvBjGTg4y7D3Xo8dS5UfH7tMa4829
	fujmKgTy7L6qgNtYUdRpSjc4iNWeqXTP3Qp+c0iRhzlopmqBK4lR03m79mQGkRqS
	3X2p5w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ama09a7cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 14:08:16 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5dda0c4a160so1769791137.2
        for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 06:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763993296; x=1764598096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6QQ62ZxwkhlLfH9i4OuMkYuxp6Si/5CSoyIHKynyDww=;
        b=K++5FfPmVn3Y205ODNHPLN4VPsDcW4/qnYmyBO2S1JskUgwMYrcf0HIRaH9hvifHxw
         9JhpZD4buiJ2u+Yw5KPqUdOnqLuL6ddmJ9twhMSRTMMQDiZDQVdpvReIdu0ep2MqhKEM
         VCwxqenVzBlnGwKRnDKfAxEOYrURou0f9vFWwWN/ewQPkx/pn5T4Tn5TrTrD4CrSEUTx
         TfFqSokF1RS5oAe4sXP9QyTNCe7XoxNil7QQtgvakRaUL5hEFSPyNW0Kfh2PTRfqDISq
         lziY8RHUJeIjDZKqXntQxcpYXTN1qvtf/AFPuXgDK3Idhb8rQ3ryalEXWcTcpypbc37Q
         YU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763993296; x=1764598096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QQ62ZxwkhlLfH9i4OuMkYuxp6Si/5CSoyIHKynyDww=;
        b=RRiJJW/SfHh+juO479PfLZX9hGpPUo4D2oz75Ywckliw8JOAOuAil1Hw43eY7ZGPva
         tb/6goVQ1luNAejmJ0IUcXpIyG7udBYi/yDPZzccj4accQ1Pcs091Zhp0X4MhQdlzj6K
         3jmX00ywxw4Ej1IGvkipzI6DJzk80dxLwanwSaq3kP0562b0IN8HzwT+qH+wON7lcR73
         bFOhTHWvQe3XXBzZCjvL5x5hwzetymgW0nrh7vGHnvthzhyVFA+oUPynRI++Wb2DzfJn
         KW6fn9d7HitYariSWaHPtI2b2scYBCDYYHzgnVJWLiD4yQCqmVgEWFMPn5eLmP8M5JsA
         RvIw==
X-Forwarded-Encrypted: i=1; AJvYcCXyl6+yEWIU4R3Sk+rztTYskaKbmvlDRQiZwfBld9RrNiX8cG3ifBbceqRhlNq2Nx7IhRbs95hl3rxCpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTaE44QRHTX+KnrsH5qY/YdV74DnJjx6DMILexVR44xuS09BWj
	XPAttZf/9BqhivvfYQdvo1kxbtvK0wmkT+u079AFFIFtA0P75ZiIW+Tw5EFnaK2ZeFnxEUKVAe6
	8KFXFNWoLSZ2mfPtLa27ljxd5oLquBmwjcEgmZQG8FGlTAC++hz5/bAmooaUNtX/YXA==
X-Gm-Gg: ASbGncvkK+YhYK3r3CoCB8j7w+ZjaOAvm6xTPWukOPhOBgrtHA6DkqdkZ1z1E4GkOgq
	DCUEvyl+Tws2nqszu0FEU38xytcMOok8sDqfWHMdeOusH1dIvqB5OuYxsx25mtqsroY7GpHXuIs
	xJRFaH94yfSZ7Wgsssu17GouauPn1I7WEW/O6+AuAQjxvlN1ZnZSDZP5XEc2DffE4MsOXQvaefF
	v6VzmcPMhKqjFO2HmeetAo2VzZB4c0hWlclqiq2+MokkveqXt400vRojDt+MW7eNjaXcjUHzzb7
	N/Daw0zvj6KvxNpTUZpG6taq7HrCz2OUaVfH9vaJODOEc0JAElmT5RBjiKQYuM2mplWi1WwSoKv
	/oRGpF4E1A5DoVUowmHzpspw1utmYF3SeGroQ
X-Received: by 2002:a05:6102:4a8e:b0:5dd:b288:e780 with SMTP id ada2fe7eead31-5e1ddd7f00fmr3607734137.0.1763993295359;
        Mon, 24 Nov 2025 06:08:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSGxyZrv+zVVuTIAB14KcEtZBB1HtvXIDm+s6TM+/QPIcIeW2ctrUgygRBg5RFY9Wlh+bmKw==
X-Received: by 2002:a05:6102:4a8e:b0:5dd:b288:e780 with SMTP id ada2fe7eead31-5e1ddd7f00fmr3607693137.0.1763993294895;
        Mon, 24 Nov 2025 06:08:14 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b7654d73430sm1313476066b.24.2025.11.24.06.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 06:08:14 -0800 (PST)
Message-ID: <2758401b-e9b5-4f10-bb01-0a1fe4e09430@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 14:08:12 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: codecs: wsa884x: remove mute_unmute_on_trigger
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251124064850.15419-1-jonathan@marek.ca>
 <20251124064850.15419-2-jonathan@marek.ca>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251124064850.15419-2-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ajE-oPDt6lw4d2zplOSkoqUbLvU-H9tp
X-Authority-Analysis: v=2.4 cv=PdHyRyhd c=1 sm=1 tr=0 ts=692466d0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=nI1KIoSTlTbwJlcfSIUA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEyMyBTYWx0ZWRfXzUmlaWVXh2sB
 MKJQm48eWCw5xJ4A9Pkdgb7suv8T6OOKI7EJmOC+zKg5e+gtSi7U+EeEUgrXSvtiNHB6s5HIV9i
 moeVwqGLnt2RUrKWex6U7qsfmkfB/+DX/Km27yxtL4R5qD9tGPby8KeE8+FUpgzfxuMYbXNfdkR
 SbuDTGKBTPSEIXdCBXBTPmrKVTeoSFtz0K3Hji0b5tHxSZrqpp6wQ8OJwNfGNb361VYlvENi6UA
 rvHnVBCZizd+LoGWPnEjrE8O++Pzp6EI2j+AdBT8vl/v2YaH9789fTsIPj3Z5jwxSbBoNZzQWWA
 9+G7P+aGGhx/YnSPcVtbc7g0yoFc9j1XlNn9rP0qqF+NuFjgiYR+NBCyICZdGGYTLtbAa2cXD7T
 VFncY0R8k2hfsIcIkS0oeFObQ1ITPQ==
X-Proofpoint-GUID: ajE-oPDt6lw4d2zplOSkoqUbLvU-H9tp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_05,2025-11-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240123



On 11/24/25 6:45 AM, Jonathan Marek wrote:
> trigger is atomic (non-schedulable), and soundwire register writes are not
> safe to run in an atomic context. (bus is locked with a mutex, and qcom
> driver's callback can also sleep if the FIFO is full).
> 
Thanks Jonathan for the patch,

We have nonatomic=1 flag set for all the Qualcomm sound cards, Did you
hit any schedule while atomic bug?



In-fact this change has helped suppress most of the click and pop noises
on laptops, specially with wsa codecs as they accumulate static if the
ports are kept open without sending any data.

--srini


> The important part of fixing the click/pop issue was removing the PA_EN
> writes from the dapm events, AFAICT this flag doesn't help anyway.
> 
> Fixes: 28b0b18d5346 ("ASoC: codec: wsa884x: make use of new mute_unmute_on_trigger flag")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  sound/soc/codecs/wsa884x.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> index 2484d4b8e2d94..0218dfc13bc77 100644
> --- a/sound/soc/codecs/wsa884x.c
> +++ b/sound/soc/codecs/wsa884x.c
> @@ -1840,7 +1840,6 @@ static const struct snd_soc_dai_ops wsa884x_dai_ops = {
>  	.hw_free = wsa884x_hw_free,
>  	.mute_stream = wsa884x_mute_stream,
>  	.set_stream = wsa884x_set_stream,
> -	.mute_unmute_on_trigger = true,
>  };
>  
>  static struct snd_soc_dai_driver wsa884x_dais[] = {

