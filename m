Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435C33A4F32
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 11:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340717; cv=none; b=ojEIrN+Ky3PNh11AnvMSuJPg7z4+6YJJYECmiHJVIU6y0FD55cuhBb4YPbk3axUV3ZSJuoTJGKQs+4Ksz7CH1vAjt167ZSZetDZmFUXoJST3Os5Nys6SHqG64yCIqLxzzawOEUxXt76tcjn/MrDlRnD2Vfe6huwPk05J8DqGEM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340717; c=relaxed/simple;
	bh=77Ja5JfEWVlEtGOIIKJ5V6Bh+vocMCKYJem6FucbPq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HkwAFiLeEuFBXHDJzVubtGl6yc2UQf1z5ZB1NbjMSCmtV3nbsTvCpLqJOW35FRtjJurLPBR8wxemVs70kA/KiOIMhUy5BPXj38PaPvbCqZBuSnteOiFpwWaj6O9DZDwU7UVbMGHqj6UWTaEWGxB5B69toNyeQQ37ZlVnCPNyxWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P042HYFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hLFfJt5i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P042HYFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hLFfJt5i"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6Prgh2654732
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 11:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOlU9oBUGY7JXAsrTXkxg15NJhG+ysmVPbfw96frUYk=; b=P042HYFUgSGZ4pGS
	TDvSia9TOxbsTGyQ9k94R5YBL3ofeF/6w/AbX4r2C8ozidXvczmJeh9FAQijDdC9
	S1YZWicPUdE4+b3Hdvb+ravHQfg6PCFjKDfd2XDM4hG+GluDjcIWry532/Cm/4mC
	nEcvJRTmZkNFOsTzt96bVLyohoygc7WKrj88rLI2naEHCI6mRZ7lINQy29PcT//R
	M4PlqspSi4p6K25lfQrpeVi1fcflVY+jM/WniFU/W9mL1MSWHfKY6lucdzVFLSCU
	f4Yjc56M4DAhqQBhLg4knbX/JbFAHEY0l+lqH1UWn/aaEQmk1Zgf4oqdEn4n/HZi
	6AfqHw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtfuh5hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 11:58:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2d83e7461so111534865ad.3
        for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 04:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340715; x=1776945515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOlU9oBUGY7JXAsrTXkxg15NJhG+ysmVPbfw96frUYk=;
        b=hLFfJt5i7kq9ArckBhuJvR9FumbwJc38X9ivNcVXssEkdg0Ofn8x8TRhjBdd3e86xJ
         D92GXJstyZmN8tiK9i60Y66f4ZCfc1amViKjcOR/zb2Bl3/nkL1Lih3W+k/do62hLJYB
         4xref+Y2tiKIWHnnqRKaIS2AbmFXLI9TwdU6j3ulww+UlWS6PaXsC2IXhFNoeAr80AWl
         BHQf1Qemgad/tmhB6mhj7UCCKEy/6jr2jt7WLIqIUIaJX8D1lIiscaoF7bDPBeUHJJ1Z
         cz/rjDRdsudnhMpu+DsHKAZ04mtEFmAquBLl8Kcc/989qZAj1f6npnYOmuAelg5IGHsr
         J5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340715; x=1776945515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOlU9oBUGY7JXAsrTXkxg15NJhG+ysmVPbfw96frUYk=;
        b=gMsRGGMu4gSkK8LEvhAmFFINDrjwxAwYyHL23A7IDIMT1H3a9Bsm1v4kME+2NFjYKX
         L/ijBb0tDeI6sLhHL7qTuH3/ttX9fZZ7NOWA/AE916obtHc9zttkjpxw38PA9Zt2JFi0
         416DwvMNO1YPrarSoJViFqHZ1j+YJs4PyVhpS11CfkvPSgFU5WEJ3w1L48CQ/t7wXkRF
         cO6dRktMWOPTOfrI1CvI5oMgsWTO5qKTfSqn7Td62WfDWt7n+mxJ2oGI3sUV8Vz8/74S
         xApRbAxVE3X3XiDOyLc4X5I5V5tme1cV5/414Az70OfTqiW3BITW+O1hL6p2/qEgX0T7
         Advw==
X-Forwarded-Encrypted: i=1; AFNElJ/yPPZOGXbmbP2X9abNA9YWPag2BCknoBTc1AqTbJuRUxIourfwwlvJiLLGj4ErzyklSSvIUWgHoJkQmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdTKSNikEbNlGrz4uxthVv48TOAN+K0R1q7bZQOjOe6/+J0Je5
	4vKdBemXOUo5X/f6J9gqZjWbKrkjkmDsxiviA/a3RJtMrDMSVehNkY+i4SZTTpA9Xl2+8lJHtub
	gO5ZdgJOAZ/BIwOiXqnGQh+GBm7wtJoJ+HWmI9UzLBzOJ2SgwSxNDB0WBbOTFVY0dHA==
X-Gm-Gg: AeBDievn+Jisfg/3w78/zRIiiez7DM95EM5/636JWqKap6cpPsmN4n0QxYO74qKaeO9
	ujpqc7jXLfJaBsaVBV2hMvJv31Dt2SRaGrTLAMBAvmkR9D6q+k80thUEZvdsJvqjjVwBvgdm5Kq
	TCBnE0vFBBi8MQsPdaIgACfXZt3wNCJQPcQAVBTnW/DAm8xbBll01VGJTS8mcQibJRPdqI01Bpw
	txcZQnoTGQCN8sYPF8ik2K837A1PqhwzRkq4y/HicHA+ornJe8q5Xumxpc+iYdaf5UJHykHSZul
	CuHFvgjyshVZRsP/HGgZZ3DVMvHfI33pCbyq5lOLWjPUX6iR2RJ+AEdbAQERlfgFzvielHcQlia
	Lpti7TqQ/wXh7Z0uceMYI6kEKaztnWrogxiEl+KUVYMsG6epziw==
X-Received: by 2002:a05:6a21:338d:b0:39f:5f19:7de6 with SMTP id adf61e73a8af0-39fe3c79311mr29135058637.3.1776340714715;
        Thu, 16 Apr 2026 04:58:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:338d:b0:39f:5f19:7de6 with SMTP id adf61e73a8af0-39fe3c79311mr29135022637.3.1776340714227;
        Thu, 16 Apr 2026 04:58:34 -0700 (PDT)
Received: from [10.219.49.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79581c3f7fsm4738041a12.26.2026.04.16.04.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:58:33 -0700 (PDT)
Message-ID: <4fbd6b3f-9aa1-4727-96b0-26a3a4c12c0a@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:28:29 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock
 framework for runtime PM
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        srinivas.kandagatla@oss.qualcomm.com
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
 <20260413121824.375473-3-ajay.nandam@oss.qualcomm.com>
 <c71d2ce2-e6e7-43a7-bfdd-e1cc1008b3b2@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <c71d2ce2-e6e7-43a7-bfdd-e1cc1008b3b2@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Yj0ECLTWcZGzi0F_svO6KWxIaYbjb9hM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExMyBTYWx0ZWRfX/jpKQQYjJjVY
 pi3JapWdCIW/ivs2MvlgztZiC5NlMVuWR6VTUIPbSzJYZbtsDmY8cXQ9nMW0SxKD6iuJK17M06g
 GcKm3EmmhjQ8qFj7sfKmsCENLuDYlBXseO0mcwS+2NfVQCv6lYGecrYyq2pkvQjHHAf1zRMLM6M
 Jpplc2BkAjZYhDF0F7g/YyRtdL0FFlQAqsagBeJeGaIzFHeut85T8x8omkbta5d8TkNf83CG/q2
 +rSpFaJUvI5JlTB8VI3bgB0nMQbc47WJWhN3XJSEMF2vH59wDqcdoVxXXoAk+EHeaZe/yfnwAlV
 3l9VgJ4cznoOqip8V616dGXNfICcjjfrd03cAKNz0/NUtonMvPSPsjz3zFAyUrAbGjiDKE/pxuh
 ETHkuSRX/92B8T/UkPaFQWVUHQHB5A1r6BqCWAv42FBXtEiNh4aCCGqPMjBu95HmwJWAyDPFlIY
 JgEh0cxCX2cQLLXk1Dg==
X-Proofpoint-GUID: Yj0ECLTWcZGzi0F_svO6KWxIaYbjb9hM
X-Authority-Analysis: v=2.4 cv=KrF9H2WN c=1 sm=1 tr=0 ts=69e0ceeb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=sZWIKnCK8wuD0WYQ-OsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160113



On 4/14/2026 5:34 PM, Mark Brown wrote:
> On Mon, Apr 13, 2026 at 05:48:23PM +0530, Ajay Kumar Nandam wrote:
> 
>>   	struct va_macro *va = dev_get_drvdata(dev);
>>   	int ret;
>>   
>> -	ret = clk_prepare_enable(va->mclk);
>> -	if (ret) {
>> -		dev_err(va->dev, "unable to prepare mclk\n");
>> +	ret = pm_clk_resume(dev);
>> +	if (ret)
>>   		return ret;
>> -	}
>> -
>>   
>>   	regcache_cache_only(va->regmap, false);
>> -	regcache_sync(va->regmap);
>>   
>> -	return 0;
>> +	return regcache_sync(va->regmap);
> 
> Same issue here (and the cache only mode needs to be reenabled), and
> likely also in the third patch thouh I didn't check that yet.

ACK, will correct in the next version

Thanks
Ajay Kumar Nandam

