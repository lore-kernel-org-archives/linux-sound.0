Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220B23E5EF5
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 08:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326815; cv=none; b=O6N3rDxuBdWAatHE2pTpXQW0MiZMumDBYrncjqt02xfSRnzTPf6nUN5vz/vWTTl95F8c/uYIz64RhOr16syAwAovb5yMjmQOVnyxaoDEgf+W4HPCsuHZLzfQVXECnFx/tPLdiOuh1U2C9EU9irDB9lh4f5/CZEosioIFCYzPbh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326815; c=relaxed/simple;
	bh=DqM9Vlg2aPZNJnQZQ/VsD7QqBMtacZIbkNCaz+Jkhl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRJGAI+JZSBnJQiVWACYorGX9dRc7dY8T7lOw+aoyCHwAMht+/EPeXNFW1wbcJhM2dKqxhKuHfeZJSNIam2B8nrLW0Th+lDdrVQFplrXzWWTxGB9F6/NWSteeDejjqT3XkOX6yn/8N6EShqYdBWQgLiPv23fIFzN8b3xDnVA2LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qajac89C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxCKVwEf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qajac89C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxCKVwEf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641lsp3594903
	for <linux-sound@vger.kernel.org>; Mon, 6 Jul 2026 08:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o70xj3GpdXezZ5BGktCYKLqzHNkNrH+alBnatmYgxYI=; b=Qajac89CIUayPVvV
	pPzl4yBtgQGpOPBxZYDseQAn/QwNnVLfX3tsct9zjrKkDLurz9d9MNZFMP2fYcZi
	nadTXVu2qYityg1O0IrK8YYGeVv8oDucmTn1MlsX4telnjO1qxYsFkZrJO7rwne5
	cFxIug9ksbnj7Dv47112BinAQrm5mpm0jm2V1PCI+yWGQiCQYTXGsPO8d3ZuJf1h
	TdqD9yvlU+xm0H7lpUdXzAhReFF7yZya2ByTzznYK71MxoXwgMch647CATqABW+6
	W8lWjH2stE52wGDZEw/tXDl3vdVYRbO30cvH5uJZMSpcLzJWEW6QOpVMjnUv6KjB
	xTIxMA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgwmq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 08:33:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c298a1b20so5788671cf.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 01:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326804; x=1783931604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o70xj3GpdXezZ5BGktCYKLqzHNkNrH+alBnatmYgxYI=;
        b=CxCKVwEfSSDXv3ToMDtJ/2F2sLUCEPfWBkRBLUqvbToprTJWS9NYHORY+P9aDDrZ1L
         VJa7r5onnTdWMq0+EuDSBICGy2zoL5X9fE+OS6zjS/8jsZh6xzQRUbMJJvESKUcB/yTG
         0SP5M4cEOyE+WHQnTi6nInGvr+DBmfDwxh84aHV545a920PHk9zOi01xvGK0iFVqUrYO
         5QqTF7MiPx36949tI/XRTHeD5O/CGyMLLLbgT6yDguWtypuApBSEx+lvrroYjrtP2veb
         3C+BdhcOl2y7VJeMuJRFed3QkXEqwj+Dvkpsw55oMfzItL5UPj9PxL67Hq12UT9TNkiG
         Ye+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326804; x=1783931604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o70xj3GpdXezZ5BGktCYKLqzHNkNrH+alBnatmYgxYI=;
        b=a1NsotR9pE6V+FF3/dpPPl/zeEFomP7q1VXSgDS4UuV5Y77bq8eCzcz4gFo/TzGHWl
         HYUAwu2nHPS4QxZR9SOX9u6cyZIEZ2j+gAkGSEz5wtKfgo0M7jGcPzE3bKWiMzaoX1kR
         XmCgPDyTe73zdo98kBEeBwvt/f8vXkqUVNZq2MMzhUApX6RBio5ZaOl0kIDciqSY0Uym
         UpZ/ZNa/hBpL9fBH4bK2Y9swLb3MPLoovWIWq7ZaQi2adxruV9M4aKuINZkn5UXeHaYx
         Ycac4Pp/6zWvSYLovuJfZ0M9TUc25PIJ/RGLo+GOdqctOU5vwBNEVx9nc1BY4WjBBQ7Z
         gOog==
X-Gm-Message-State: AOJu0YzDt5smHLPZV8PnZpfyOz6Fjo4xUUySvl2jGq3/ygGjTY477u0R
	DXaJpapKA8zS2ekXDAmM63O5uf9iseasizpDA000OaV0pQoyQ+9Y8p9BfbHq4BZYiFyrsESphHo
	yh0UnkXJZ8U+zgHlRliCLRhyvzHrLjgml9hd5I+D2kpbTu43aY1Plf3h+HlAs2/8pag==
X-Gm-Gg: AfdE7cmR6g0pjLOk6RjHx2l/ABpt1J9yH3uR3CcLdi4pYO8klrNmf19omiRIWKE/0s2
	S4Q1pJOnuNqsaNxo3kM9Os4prrZF9cu21ltNJotK3GGKvxG7DOZMoD5SlEgm2ht8yYcBzS0Si1e
	GgzRHXLTA4Er6RfxanZ0idQceArGxJQpwZwQPyrlECdvAcKVhp0gxDglMJ4NSYNm1TIVA0cO43Q
	tD+0bYjk64b6IWdBRG4YUcP4doy1fzY77GH6ImrB3CfRzav8y8n63XnzfPhVdkxQc9unSIW67nv
	oSUT5pjbAYRD+S6QB/LX6LhF0IEExPYvVUveVH82d7CjNQtn2BWaikKwy9k2XRudON7WrsRTNd8
	ZijrNQuybVroCbVPqX8wAaOtc3ImFnphmXFU=
X-Received: by 2002:ac8:5e4d:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c4bd94c5bmr87589771cf.2.1783326804129;
        Mon, 06 Jul 2026 01:33:24 -0700 (PDT)
X-Received: by 2002:ac8:5e4d:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c4bd94c5bmr87589201cf.2.1783326802229;
        Mon, 06 Jul 2026 01:33:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628d65dsm692511866b.35.2026.07.06.01.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:33:21 -0700 (PDT)
Message-ID: <15493c41-51ec-47f1-be1f-d211a970e487@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:33:18 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] ASoC: qcom: sdm845: use DSP_A format for TDM
 codec DAIs
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-2-3b66f33859f1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-pixel3-audio-v1-2-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4b6855 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=SQmynSovjKWGrNaXl4IA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: UmAAJe1jYxdBiIaNZ8IKku0lkZ7P5AY3
X-Proofpoint-GUID: UmAAJe1jYxdBiIaNZ8IKku0lkZ7P5AY3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4NSBTYWx0ZWRfXw+2bWkJru0rY
 yKOR0y3lnseQIEEtQFUfPxaVx8IxlBp0DaZtaKFnXkvuYaBEcSc9O3l0+USsVfizTFK65XiOCK5
 UH/xih5nYiwbAGpNHTjhnl1U/wtZcLY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4NSBTYWx0ZWRfX9AjEheNbiNYc
 xJVhLi000uaOWUNSNsyF0pJMVHHEVdd/m4IUCdZCajmCOpC7LOYRXSOKU4I/ikooZeCW3j0Uolr
 Y7zWJ2dy7VV397xJF0dLQ6HZk76vZSXqNSVDNK4BRc1kJ78AWFYfXkwFVPCzQd6GdyOQYsfWp9/
 t0V0o0jyG4vi/kHMgsiBDTLgbw15VjxLQZJAc6jcLfqTwfHlA3x7iRjJCkKimZ0tiqL2hOTsFPu
 GH1g6r+UzqFenIIWbKKw910zLLtpwRyniDTNz0GlDjVEufe7GafqR3jT52aADjIFasyO94+dSu0
 y6/3KOWFpHWjBpa7/6Q9cOn2Pd1jISRlKQvBSw+IKKZ1CYnnSM6QkJbDtg4uo+Fbo88LqQKBlkx
 O67Zoo41FoyK38WhaLUxyqevJ8ySUwtyA/nT+J27Hv71mee3k9XOxZKGMJl9KFkmJO/HW4ybpGO
 /WriaABvdKj/TDoDSoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060085

On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Before the DSP_B only worked because the only close-to-mainline consumer
> cs35l36 codec was patched to map both DSP_A and DSP_B to the same
> hardware register value (asp_fmt = 0), which is inherently DSP_A timing.
> Use the right codec (DSP_A) which works as expected.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Fixes?

Konrad
