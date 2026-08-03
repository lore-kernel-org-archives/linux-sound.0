Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C5C352002
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 16:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773285; cv=none; b=JgAPHY4Qmln/2pbfmyUfq9FJoHjmWO9I55vclyLtRD6Nez1d74qqfspLMLAxcYLcsaoN7ctMiOzC75g2ATWLlFpYMDEJZbXs6ADy2KL2zeqQKzRecD88NXQ3bCzF4+K5cTd6riTlGCTY+SRO1FjyWhnnM5DcE2xnLmWykcvwALo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773285; c=relaxed/simple;
	bh=csla06snuN9VjkN1hGeLOQVUZAqgoCg5t5mWgUC8ARk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jadI/RbWMYQ4A8n6NMJ+jBwo6D8ZCeFXWhFRMRcML9F1QgMNG5m6ckmReGRZ9a8K/KiShLtrezRnSy5pAVT6x2H7KAAwheGEpLLg5+xJGAGNqATYIE/p0iW7epmFXykrXiMrc8rrI1gW/ueziLOoEZsRNq3pBoQ5gq4FQzkcm90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ktXqH+A2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbZNxYRz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ktXqH+A2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbZNxYRz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673EBs1W636302
	for <linux-sound@vger.kernel.org>; Mon, 3 Aug 2026 16:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9I3A374JuaCOS61XrBrM+DV+XqclJ2wjoW+D2U6kWM=; b=ktXqH+A2KwHFkyPk
	zzZPFYHjy7B7r4UTAdealdFTid1pJ7wPECDQd2IaERgYVHPCRzTlkKlf0dOQZ1si
	QNkS18H/h8XWVVKRWE/V8WRd99n5/T3IJQ7mbRvCYuO6T+avEYkjl0KAulEe6XD9
	CWoMIYEy9FmTiL8twRAUlnezxlP5gpmxbcm0FQtOQV46HP3CH/lwDerCQVVCYY5L
	s1VuBd6RmBa45Lc/zs3GoyI/Ssqnyb60kpX5+OQKofX5pTl8o151olwRd83iiwcJ
	sdLLdSUA2LJfXkQ+3mFfQM71fw4dwmgFk4br89tpQV1ZaVg3LWlNjXp1kG89us8X
	Ly/4/Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r2b9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 16:08:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so6260055a91.1
        for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 09:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785773281; x=1786378081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9I3A374JuaCOS61XrBrM+DV+XqclJ2wjoW+D2U6kWM=;
        b=WbZNxYRzGQe/nJ5mIzMkbVU83PYP92AVVzR3rVRIuEVdpKXsClF1ybeaFGMaRrnTB9
         lprk+yyBPrJr5YqFhlGGgJB4XA6L/mXKrWcNI/jzgGmjL7vkqP3bOxj8raYe6Kjp6Myd
         PVDozxm6QeYyYEBP93Ep+UkMajs0RWcNnDZXpj7fsMgy3K0Z4Wa1JTrtGOVscorpc9E8
         pqGpwdGFGLP1xeGzT7fDHk4dRk+csnvjNNeGhwgNeR3OH3R8Wsm5k51Amr8ADVWGk9I7
         hD2dCx7czjVY0Tg2tLFYZIqSgOqpPgnPewMKJ1hRfpllUSPWp8gg0iFqmRYFmL1I6bMB
         g9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773281; x=1786378081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9I3A374JuaCOS61XrBrM+DV+XqclJ2wjoW+D2U6kWM=;
        b=JqBDI2c/UcDoQ7A+sCwZajD6wwQHT1a6IZjKidZeEOQHrq800h4mNIe+Xku7yBcy7b
         +Gjr631cZgPhJuArg+cF9JKLUV/jQT3pEGnpdpA+/9ydUKrJpS1aOP2M0AVNG12eP+Kz
         DvMv8DfJfng2tO68jMpW0u2IsIKJoQiAKbhpGhACvuyP32eD0ooFUb5zTjzGrTIC1yjX
         M8ZYNkh4PorKMtJmzsK21R6mDz2M3pYoVOJMwJpM1PV6ifP8hkGOGSqtSe8BZX9fWZoN
         GJg931j0dYtGj7hvasHyqYARdKWK6mqac7DQnADKu0EVt6HPiYpSi/yj5ujcEN7yS22a
         NyVw==
X-Forwarded-Encrypted: i=1; AHgh+RrFPOevgoZisMgX7i1HFBMWalKDUdrRtMdN9is4lQcVBWfkewsBGdRvrpcoRsDOR5l+VQvQtWI1YVy21w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIIKkImNG9B30e/aN3+IaQdCnflX/r930BbMqjwhxxaT/w43Bd
	1v7vzGOYSAGuVpoVuBYQzBL6Pj86V9pRKLrOdnc4OvKPwoQWf94on7bu1hUTbOy9malpUdNzQxN
	1TeGCUB4Qrf7MhO06G2jOsMz/xzxRu5vjjNw6sjkKlBvLyKYchHeRVtHcWR6JdiEjhQ==
X-Gm-Gg: AR+sD139sUe0xtwmFIXpiSK4Z+zKMM79+X9/SZXImee/F9bOXc2qYDK9/wF9VPHOftD
	TXe02HB8lI3V4YLB961EJSeD+VbWBToKuEs80vpf0hTNzjs4h6+8jZD/xsUF2n+kPQr9w7OWUsa
	pTvzGHYX2sQQizYwApac2Lq/BEFiWNI32ZuqFv9JIzAwoVBS/fDj+fOwbnK/ly95dgZ4Vx6uLi7
	LNsvtUeB/lIW5OelzFTVfnyRLmzegG9itohjKypinjXmCR/i1lo3zcE9zA6sKrHL+wUkOZ3Vrtx
	GaA/BpOd9hwTnT812sMzmEcj2KMSQiWnFMB0MxFYrlsFGSp5wfgsYkp8T/NanCRv3gc1S2HQxlT
	1C309qLDOKV0yC1lU8XFWxLN9vyRWDpguEA==
X-Received: by 2002:a17:90b:3802:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-38fbc0b4707mr9724594a91.0.1785773281282;
        Mon, 03 Aug 2026 09:08:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3802:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-38fbc0b4707mr9724567a91.0.1785773280868;
        Mon, 03 Aug 2026 09:08:00 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab14475asm31387356c88.5.2026.08.03.09.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 09:08:00 -0700 (PDT)
Message-ID: <a8157d05-6196-4f7e-a900-f1f71b26a2c2@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 21:37:54 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
 <20260801054610.4047089-4-prasad.kumpatla@oss.qualcomm.com>
 <20260803141033.GA3231247-robh@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260803141033.GA3231247-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a70bce2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Eipt-u1mmVIaEvtnkvUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: pZLRBchtHwLWBXNCSH05KkGUvSVeZt2P
X-Proofpoint-GUID: pZLRBchtHwLWBXNCSH05KkGUvSVeZt2P
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE0NCBTYWx0ZWRfX6Y3dro7/R4ef
 7mooB3L/VGo/T42ekVia0yeI/6AW9sJOBGoKA4mQ4xCzgH0Fb5Rb6mjyTo58uxHp4XSxVsZCb2Q
 V09MhorcvXx5st0GxpLbW8ybybiUurk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE0NCBTYWx0ZWRfX5dLJXh0ABqcu
 3jvCwiiClaNcKS3sv1yiTxUpKvzut7fALdqTbst0UMnx9pS2FvIJ4uWF3gbvIUsCi3UlXkqygjJ
 3A3WlUbyflOjEd3FD4+ghNGZwdjy5xHP1PD9ohrKlgm5jjCdGTQLPtYE7M+IxwwDWiMPHo0ztRE
 ID0pceHfjhxtsVy2tM06P3NOp1hu4SCSxfueqxOx1UmhNqPOSBOAvTe3dfub20w80lCl9nBi6JS
 4raTsKWMdGofn650ZAtiy20gCz4SplIVxPylxJbWrqoEJU1GOkrFXzsK8utmu64uNqWcOYfPukS
 JzKoT88E/muSyEkK50hYPBt4IL0wwLyYZgz60hypJ8zO2AEdu31gyFMJsq2YAkMCgASA18Pvm1b
 3VGQ0omg7+7s3s1t9vBGl4kydKA0dr851Qgl/xvfwxz0xmKhVFwrsPPBKCTp4SW+iXXPQEheawU
 isXj1Fc7MScVEy0URyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030144


On 8/3/2026 7:40 PM, Rob Herring wrote:
> On Sat, Aug 01, 2026 at 11:16:06AM +0530, Prasad Kumpatla wrote:
>> Add the LPASS Audio IF clock IDs used by newer backend interfaces.
>>
>> Platforms using Audio IF module backends request the interface bit
>> clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
>> header so these clocks can be referenced from device trees.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Missing krzk's ack and comment on the subject.
Hi Rob,

Thanks for catching this. I accidentally missed carrying forward 
Krzysztof's Ack/reviewed-by, as well as the review tags on patches 3, 4, 
and 5. I'll include them in the next revision. Thanks, Prasad

>
>> ---
>>   .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
>>   1 file changed, 29 insertions(+)
