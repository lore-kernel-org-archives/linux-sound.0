Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659331;
	b=Z2sXUOZ5SmKN1IaTspSnlNTClPStfgRObvjMCBA1y+oZ9hctRKBfZzI2+5zHmYKukNGm
	 t1huBbw6oYqXwTAP0dRRCNoD9W/i4jvdI1ArIzEKCkG500P3f6cxNmhtp3j1bCDuNSfmM
	 SbHuuChBBSXv6Ux0Wm6b//OSYFiCF7YFxzWcmoRm3S70hODx/hbvUHhPmuagcWLYG5AoD
	 2kBwShbK8WzCLPAeN9nWQqyLRAbTnFML01mHY2dofdebKkwLRDcZQKY7CGCHrI5lC3rpy
	 g4fVjviUvp69FyAgaE8KcksYQ1YZEXeQRX+Q+Ce3dZOqjhCYc8OG4rP1YpRxlTskLNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=95ScqGGkJRHhlmj15iFmjoUwd+LVxvsQOWPqBlksFMI=;
	b=tO1iH4RnmPvtnB6XK28KOFywG5AGi4kcrKeXvpUIHwty5R2w0fyJK0ZWiAYKyKLPROiU
	 41mRrCAGjNT3tddFGW8ZvnDYXa5wT4r/Fn/2mfOpKCn1J2ualEr/c32KS+aOgLKnglTY8
	 HvVS3bZe+RABzJHYS4SpJT6JOQJikr7aJdfgH6ZCc/94pG9pBN0kq6CPCWl4+oAqM46Eb
	 lPnViDz2Nm9gnD1sFRM1uveGFuLFLGY6MklQkKwgNwpinUie9XR6nBWFbtufFwan9PF2G
	 zZ2BQIAQhPraRxI5RTaCzSBBNXQx/ZxgMVtKbIcg+dRBuLWOLEGJnpHa/pUj9KHov3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oi+Zn+5p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DIobJweU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34997606A31F
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 08:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34997606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oi+Zn+5p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DIobJweU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M708Ua3517415
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 08:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	95ScqGGkJRHhlmj15iFmjoUwd+LVxvsQOWPqBlksFMI=; b=oi+Zn+5pVP1msRsJ
	KOXDTU6yTtwsq2OioVybeBhmJdXxQpp+R9IAb6QjuZBA6prCM5sEE1xtBTWZk3Du
	aBWn1eekJJp2uTGF46zDS51E3N20IqoW5fpmgPgj4DP7wkg9ah5srFaZhEVfzSvE
	/Q9rilRW47+mJFiq6iYP0a9nbrFNfEdbWkd9RNesO+b9Ngjj8B41vcaTcAZ0ofnP
	7yFg0ANGRt14ks5EY9G5MzxcPEfGAfYgk5U0h1OAW/sWykIAyZysvMZjBOQq+Y0N
	Dm6Jp3iTxQ8JD85CgeuYzJat+93BWwU1OXUPQmsWF6dVHfthiTyCMXbY9r9bxJXE
	NuXJTQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bhh6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 08:55:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53635fe2335so2941421cf.3
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 01:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659329; x=1793264129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=95ScqGGkJRHhlmj15iFmjoUwd+LVxvsQOWPqBlksFMI=;
        b=DIobJweUDKDrX8GQWoy4G/w5j5TjUk6/ufpFsGlaahAEdmKrx0gKtDwx0Bh1mejXpd
         FMCs4Z5A75L287TRftxgkRkVtgrH5y42H8X+OPr4LTw59WaSMW/kT1kW8/0HZow4S2Dg
         abG/+wx2fvi/6wsI/VzixJgnXUk+ajkTFpHbg3gYTFdlIz3CNIbXF4u5zoJkMKsvtNvF
         XP4oZ61bbgvVRL0vdQhwzw/ZACxN51aOTDc5UZ/JDTVXO4Uyvvyq0jQdYtJ6SBDVHjQj
         0QlYKhJzl1q7QBOid0dC1BMHhWjLALMohpcCsmCgvmcxr2CcVAsg6aNlEGV4TLrtjB7B
         2QIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659329; x=1793264129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95ScqGGkJRHhlmj15iFmjoUwd+LVxvsQOWPqBlksFMI=;
        b=cKSoluySKJUqG53PmGX5SB0vBRaAsbHh3WN+8vDEpbG86dpu2iZopZgMp7YDP8M+BG
         GJk8b0lexRvO4eTsEYOWJqvgRV4XrfJ0EVoYzRS41gYC4+ZWDMdxSUCz+MOCixfas/NZ
         OaDkzshe0b+AcQkVwqLJIKP7HvhdzHAn1KV+C8ooZ3/85LV01OL6OLMUZdiDv6aOLwde
         a8SWdNmfAK7lJy9d4S9+2gVGNOBV7y41wBs42tgGmQ3aofzJ7LmXO2Iq4RxdAUL1j7Ks
         lzVtynmypIja2N8GaNFA975MN/tdtqgMkt3Fa+RbNLRZTUeNfiZD5NCw0tAF3Qe3QQ2I
         i0xA==
X-Forwarded-Encrypted: i=1; AKwUvBzT0QG0QLNsyyi1YP5I/kGfr44vOYY8EWraww5vCA4QCOpQ23nMIMvlEnM0pJV8agCzV/mjRVIsA5TsDQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLZvlaVnb4Tow6VmUe4CdWSqam8q1rWDH6hmhlbyRN79m27e27+
	t5HPOAKZJNjdWH0yniFPZgDba3e8nq49bvLsMQGTaQFy/6i6/z5ueYzWCvzagqjQU27HCul9c2H
	ulm41HhDj95jN74upA4QD7Q82YWeyKiTqGZWHw5Eo4dlbhhjVMdrTjZ4Uqgwtdj6IJw==
X-Gm-Gg: AYBFou1gwoLjBO1i/c9miWXCsq+IjjNmaMHdg5XmftXKGoI5il4I4S6ImRZC1J66NkF
	RmPf+qSG9p4s4icuBjD15QKKhvB8DufnDL92G+YX2J9dAF29+LI05+iDc6+R4hyBEmXVZJSGOuo
	2rUuhMDdYB7UWl2Nkbl1s1THb+nvMgcWEHJI/fZCgq2eFQLKjH/QNZHwhuQvyDVMtrlkc9tbGDs
	qf3Lrno4HCu87rvSy1etLRq7jp0ujMd/aBoY9K4PzIuY4odwud4BZU8zGhu57+H73/7E+qdFdBQ
	LuyV2ct8r5mRezWv/yjYbhLBIBeYYQnNQx16AEoXSN8hcbaRE+zTCYvjiIGdWlAD6e11h+gALcP
	1Aku9E6SQKo5tAUU+eILfKA==
X-Received: by 2002:a05:622a:e603:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-5369b813497mr58721881cf.5.1792659329349;
        Thu, 22 Oct 2026 01:55:29 -0700 (PDT)
X-Received: by 2002:a05:622a:e603:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-5369b813497mr58721781cf.5.1792659328970;
        Thu, 22 Oct 2026 01:55:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5e2c3esm82701966b.73.2026.10.22.01.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:55:28 -0700 (PDT)
Message-ID: <a6f54a9b-ffee-4a06-9b32-2f2f47ebb19c@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:55:25 +0200
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/8] arm64: dts: qcom: hawi: add LPASS audio subsystem
 nodes
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
 <20260923084627.748920-5-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923084627.748920-5-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXz5r5bKwqSdcS
 LeNrb63vyf+1shQ99UFGyHKR5t/4/0H2oCSSE4T/IMhXGcRE/3eg3J8k9QE4r0iHAbI5k4VJR6/
 SOhjVntTNCiH42iErT4JQA+OnkelrMJunmcOhU90DbO6l1GamJwKHnnj8HwJ0GLnKEe2rhZF+Do
 NE+1syOKhsoz1HfEBdZZYazxKJCnuDZREg57qSlV19Ydz1PYi4sCXcAxWsP6v3QMZU+gCIA4iU5
 2YXjPkjIXm3y/aeqxi9gGhTYKaZBhInDgvhdmS/K90DuKqBZ9e+k+po6EQZhuvGYDwmbugSil5h
 2KsS/UOSAwg34UjmtbIMHk7MqLtND/vCbPXUWSfimu9xmxk/RT6ElTPSUWGTKn/oAMkivVNTBWp
 ekH9+rzxAgfUyUitrnV94e/cJrSeQmcQsUY9oPH03j1R44UASBerO6PXOyHpmn52DvyQMoxXkXc
 WvyOa60VK/q4C/E2dnw==
X-Proofpoint-GUID: P4Pc7OEHD2zKpsEZf-HEYYE4CjjM5ax-
X-Proofpoint-ORIG-GUID: P4Pc7OEHD2zKpsEZf-HEYYE4CjjM5ax-
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9cf82 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ydbIL3bE3U-0NGl9bRkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX+xrWBCRLfTXY
 C/l881JMPEInphZv2k7nNYtug7QTgL2xy3KNpEjqPcasb3kaCnnCcIknMtfjRz95EWZ1FZxU4xE
 HtKp5zW2xmcCvRkVXYQ7R9NyTPzLqF0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035

On 9/23/26 10:46 AM, Prasad Kumpatla wrote:
> Add the Low Power Audio SubSystem (LPASS) device tree infrastructure
> for Hawi to describe the ADSP-based audio pipeline.
> 
> Add the GPR (Generic Packet Router) node with q6apm and q6prm audio
> services, LPASS RX, TX and VA macro codecs, SoundWire controllers,
> VA CSR clock provider, and LPI TLMM pinctrl node required by the audio
> subsystem.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---

[...]

> +		lpass_rxmacro: codec@72c0000 {
> +			compatible = "qcom,hawi-lpass-rx-macro";
> +			reg = <0x0 0x072c0000 0x0 0x1000>;
> +			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6prmcc LPASS_HW_LPR_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&lpass_vamacro>;
> +			clock-names = "mclk", "lpr", "dcodec", "fsgen";

1 entry a line would be perfect, in all cases

Otherwise I think this lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
