Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78A942254A
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 12:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339224; cv=none; b=UW9JdXII6Mtdq+Kr9lKZEo+aGmwIHKgkxxY+HR8YSiJpNYSAr0IgXbPsefu9GlYS1PsIqP+G0GYU1ihpD3dkLbKAdDIe/Ro7r4EiYrZBfa+sBA9ZqAJ6o1IEj+xYIPqP/IfuwYpj8M+mKg86TG2HPInpeLyqBVjoXy4IWpm4JNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339224; c=relaxed/simple;
	bh=qWTjPqDLGc6UFeJaIHNML9p3hZ3NmfrLS1LYIRLfcw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwBimG5g2DvXN4V0O2KhFWrQEvhXPlRavOq2B63/m6ODlbf/Z07eE6csQ6niZnJsDoqGYGwpS5/7xnXe3ZCYtcQ907tKbVmPP9Z6YAKWjrbMTqG5h0HFzSRQ/pqdJ1J/aRqP1D3HDxx1S2TXJdafxwdzkzyzaCYzrKewSGxwSAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ozq9EFv4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6hnkwAH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ozq9EFv4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6hnkwAH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxFS4401621
	for <linux-sound@vger.kernel.org>; Mon, 6 Jul 2026 12:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rc55guwUAO7TOCB1xSuJbiUNgYsAUSIwtv+3EK0dT0w=; b=Ozq9EFv4nHOcKDUf
	CqObyb7p6KT4C56FDXh3dGzoMPhZf4ordV+J6wvdxaT1f8bzmvWIUyc07mgkQRmY
	BByd7MA97pMop2XZJkQagSxMjos1eM+C8dxFyrfH+JxISYLZoYEcElZdzj3kH3j+
	in0TMY+Y1w+XAkTZKPfWLogORp0egMHzebFiDQtJakRApCNkEZG2P8xn6qN+CLwT
	zr7Yg6qlFIGB6sQ906nIG1hbgcRRVxskawFnZF60Y7dVCNohP0SKPBDbbD1+ED8w
	GdJRgQjiRs0InRxwkGRajn6oFk3qnDpqfRA2uVHx9ASNYBB1nJkRa1nk2JTXKm6M
	nlfmhg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gretk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 12:00:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6cb57d25so92241985a.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 05:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783339221; x=1783944021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rc55guwUAO7TOCB1xSuJbiUNgYsAUSIwtv+3EK0dT0w=;
        b=R6hnkwAHonvlg8sKMCWsYYNgwuUidYtMtcxZv4y3nLC7Cy7UPN4E4/CyJg4oxGVU8g
         e+MNQDxNZIWxLX7go3NtqrRlC2p+IV7SnAshHITViQ/PsaL+hb47laf3+JZwn95BatAq
         LmvxUfGN+RmxAwcVXFh5Gu8vsSZRvUccGrpXBDqW1JvHY9MifNZ9KCvtHmRBd6VNmoeU
         Dk4wFWCNz8p2ETwYxX6P2FyucgTdwo7pWnxyzbB2az5h6qKu+vZLHK1XgMRf5OobaC6s
         VsAzATifpEofb2lm27Kf6Bk/Lh0B7o8KCjFIqsOAN+zDjSGkC0H7SfK60Vyc0foyqs3p
         Wy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339221; x=1783944021;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rc55guwUAO7TOCB1xSuJbiUNgYsAUSIwtv+3EK0dT0w=;
        b=GGI7vMgnQuBj/HPd08LUXG6DrUgx46xbqPKodR/420Dsfhh1MADrqGo7tWXqT4gvIn
         IvOPpE6WJ8PvezYi5kawc76PUo+xXogTnHiZ/3I/C1o7aEwCK/fZmaA8gYWCOD5IxiYk
         0p4VY7MfoLTH7958zOy4kjh0pPOhospkk8lqjm6fnrePqGHo8ujY7ASE3nQLYeWjUbtD
         FfiHNZ/j98ndYVBKTVCyIhKlMoJgMmabEx/IKqy8d3farIaO0aYHnVG2l02ZHiJkPDul
         G9n+EUMioJlHfQxkGiApbXQ5aweGQc0tn1jioV31t2ycLd90s4nHwYH+gsk74GSR5Ur7
         zfDA==
X-Gm-Message-State: AOJu0Yy7JFVtqQyWTIpz+7EEs/L1aNQW10CqL9fHWnCrjFYwMx6Gl39k
	A+tkM4cRmscrvPTZ2wBzjCH4yfHGjM55X/ja25TDeuK0WfBB5/FirootDj2qVJFjiTyu2EgT9CZ
	eJK+ZcAXExMVj9fIdSyQHpOaiCjV9b3NcuO1lv1aF8cWdnJRvyPKhjjkg6A1/6gxUYQ==
X-Gm-Gg: AfdE7cmK3wEW3jNvogtDgmfaJJD12uXGZ6xlDTItiRVeEuFAJ5G2t6gYTJd08OA0mOX
	6MSIcUM2KmS9rhZbGbe4Bb82FdRMc5fL+bVUdGNN9KeZwkr6fOz4cR+45z+Cpu48rb1RsBlu+5j
	Fcis2T8p/KOuxLFXKCVTkg/rcWwf9sRWUPKyJXhzrv9oh6hUq4/D52hrzOjBMObPRe6wsxRvdZJ
	qg04TXbXYnfMiQ/spzykGvCaCN0kgAeoY2wJdKM07a+uXnMGD2OQNfS234y1VU56JGW/hKo6wij
	bFRCJ6w01mXpi0irlA4HpNdbb48FOjaFtacfIp2tugPLbI3NHo/BXtvOFhSeRG1R9AUX6I2Na4O
	HF/7FxDpQIWNZylYQS+/OwEgMjz7MhWrJKjc=
X-Received: by 2002:a05:620a:4447:b0:92c:b769:ad1f with SMTP id af79cd13be357-92e9a091291mr945875085a.6.1783339220513;
        Mon, 06 Jul 2026 05:00:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4447:b0:92c:b769:ad1f with SMTP id af79cd13be357-92e9a091291mr945865585a.6.1783339219863;
        Mon, 06 Jul 2026 05:00:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6095b7dsm726569366b.19.2026.07.06.05.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:00:18 -0700 (PDT)
Message-ID: <71e04eae-7826-4f51-bd6a-318ea1108c08@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:00:16 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
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
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FF2szai4-YISGkZ-tutf7A127clqFZgc
X-Proofpoint-ORIG-GUID: FF2szai4-YISGkZ-tutf7A127clqFZgc
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4b98d6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1P2StzUqvI1H_hqdaE8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfXxLGGFsDN+nVa
 CJVdK0kTnqkij9a02CDx5k04Tm3PQl2a4vxUWcTwOz/PMDHfmkC026Rr15IEV9c8fvQ5EDSrR08
 kIjtF37fy0fWtkFdJ+7xJsAX+xha/YhLOeE+d4AQViv9WwXbTyDBcc+7O4x0RKA9LsQHC0lXyv8
 2KGaOoXB27zn00JjQOy5pwnNkmf3dTLfrb3MG4IPd5oGWBfg4qo4fpI7em3ipyMMtTGC5V/N3OL
 D8PV/UtwqGrv51bjVmxMBdszGiCPCzk1kK+VSz0sb8kEXUKJetRAX4HqCaJcWiKeTW/rWuYWOum
 4Pkw2uEmR+S9A79GBIBvonY9yyou24P8P3y39VS+oYALl7uQWs0ZVMT+2ftDu2mR8d3DNyHKaQt
 GCLIroHwJiA2CpQAQ4LjTutt+n7Teljjo8p+arSg50GJ6G1i0nuBTAlc9hmDDNgLDLc7+5sWvWP
 gWSgaDkL8nrXZyzo0ig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfX920x+G79xlRq
 11D+mRV9fKJLlHOZ4a2DJ7r6sLsEz3M6Q62qVE9KIs1WHMfRbW2PoMtsP9QL8UetO8UXt3ExyA7
 tuNp9qkAgl3RdS6ppSdGNROFXd7ITJ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060121

On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.
> 
> Inspired by commit from Joel Selvaraj.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +	/* CS35L36, Bottom Speaker */
> +	cs35l36_bottom: audio-codec@40 {
> +		compatible = "cirrus,cs35l36";
> +		reg = <0x40>;
> +		reset-gpios = <&tlmm 112 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Right"; /* Bottom */

One comment's enough (either above the node or here)

[...]

> +	mm1-dai-link {
> +		link-name = "MultiMedia1";
> +
> +		cpu {
> +			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +		};
> +	};
> +
> +	cs35l36-dai-link {
> +		link-name = "Speaker Playback";
> +
> +		cpu {
> +			sound-dai = <&q6afedai QUATERNARY_TDM_RX_0>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&cs35l36_bottom>, <&cs35l36_top>;
> +		};

nit: 'co'dec < 'cp'u < 'p'latform

also 'c's35l36-dai-link < `m`m1-dai-link

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad

