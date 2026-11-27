Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769219;
	b=03Sd7n+YsCck81ni14jzx5jca2QjvTxUSPja2D5Wdq3y17R43j+qkEZs2igHWMtFtP9L
	 Pf+szzbVqQtrVOOHv4AGGRQb4VsVtxlHPXrZXCoawSdIFDVVtTLz/7lPKuPhgCjNxg5yV
	 NMa12c9wBFgqJ9Se68d6NXmrPMno4nENaCbMFkofvWej7J/lF+R3qwyb0/ZsNTUOQe7PA
	 aTF/Wo2Abul0g+8fAGkMEzGkEmcsjS39K74m5XLkQ4gvRvPxER8Gf6r13DtRMpN6FtJCY
	 FxZ6IM/RKcWHeTefMUKJ1oXz8GJ4uwlsvzfLHs0517aAy/Jy7+f1M7zs9GX450jfDcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OTHCsXSFBjLFbCqTrojc+ejUH1qFAVGfv0/urI9zmIM=;
	b=MwcaFtRXnRvMTzNMMLtthFQAD7W0U4SR+RWLaUwb1Pc9/NwDqOot7B2cmLv7Q3rAzPRD
	 RAXjg/9vK+oa3EQt5eCJT2zl3+JwGrUemuP8ZVdQ0P/lMOK21qQyCi2XQLOEBvvOOSTeu
	 v9us2npj4xSmq2QWPYMEEkGMTpPndJfyP7TM3w5xdbmmOdrhyIUmOTnAron8zYbrjuza8
	 6eHmm9yTd0dotrKSRCQqarw6kXoAQofbDaKs3oYsRmB7fj01bvn3FvEJR7BtRgN6K5SbX
	 aOYLT6T+yXv68HBQ8dUAxZqZxVwvu6Ae1sx02+TfRyW/heHI5r1Eb2Pz+se1/mfUk0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrV7kvBP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UFVnSEvm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BD5606A31C
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 08:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3BD5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrV7kvBP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UFVnSEvm
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GbDl3983837
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 08:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OTHCsXSFBjLFbCqTrojc+ejUH1qFAVGfv0/urI9zmIM=; b=mrV7kvBP9w1hd477
	3ATRoGsHdZgQo8zRAkW1QXkLcKfPktsCUShcN5r/iPdqAYH8H3GDhHmNlW68bDg5
	iVDtbjXbjVtySFsziNBdLro8A0WyvfTlZfrnXio9uOohgmHcbJANNvP2nJiHEEHb
	E6n2WMpEHfT4HLH0WKF4KUqeaBfXHhqerOUn/pfaNyDv9ySDd8wiPsFA6sPMBSD8
	txc96KEp8IZ1CFefkFb4AsGek2fw2shp8VmPkJr+jmxzS08NHSTdKJZJb8RwJsCJ
	rH2ROxsfEIOQ8UVG/MdUawvu8yErnHyEB92J6JzMOU62v3rRH3SoROGiuH3paPmZ
	0bQIvw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49a43t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 08:46:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so1304611485a.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 00:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769217; x=1796374017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTHCsXSFBjLFbCqTrojc+ejUH1qFAVGfv0/urI9zmIM=;
        b=UFVnSEvmmKNUNLLs3SAY2oTeyYZ3ldCgnIcoRWprgVlCJlyGyX/sMzN96YFHBz3D4v
         EgStGMXTNQyz7Jq4Va8bXcFnut03lkcHw6o6VFbXstfx+yqdt0r1Y1S19rdT17o2NHu+
         LH4iRkvODaM/sEz2g4YsK3Ph6kDtPcmDDnxM07F5TYOs7rm3Nws1FuYVmZMjAy1yAXmQ
         QhgnqGvNJkFc9/GC5FI7e2mGgCo5WUSp80l+/jA60n2Y1rmSWE7NwQ/DIyAWwFTn1zZ0
         WnM4NMbp+5uv8reqxCElNnW3OEo8EqKxtw0YFtWS3Q+eb3eG59ppUQVZF7dRCLx6Iep2
         2N1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769217; x=1796374017;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTHCsXSFBjLFbCqTrojc+ejUH1qFAVGfv0/urI9zmIM=;
        b=ZKuAdDMA+89tVefRKfQcqZL8+tOlyhlBR6GulpEZAkhOt8v6MAyhWxyl4KxTYhhCq8
         ji3R2K42y0cnqyPTjwLHgyxQEMPF8HN3H/evx7GiULW3NNYZDeO/nlyH7867TBxBazwg
         ADmgxEtlPjQiX0RSAQOHueluGL+dl6Qehsdprd34JTGxEHb8CTYUTs9PjKv66+t6Unu6
         f9ayKmovBCVY3PeCjt9U5iwgXyjeHZA+UCjothxdm3IfzHImblP67BDlN0xhW27jqbmk
         Y2dYeOrKCGciwj1RE4z3x3Fl3D4lBg9QuPwy3HILK6ySI179trmxrVGyxthdZAJWNeuD
         H7rQ==
X-Forwarded-Encrypted: i=1; AL+hErF82Wdc/lBvva1GdZ1qZ+AZlxs7DmjVd0Wk/u6IvgYtcs2nn+uiHj+PXdfvoNYORp5FNd17SlQfNHZ51Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+EBteAtK7xqmWQ0dxGCOBfVi089wZKsYi+hNN/UB8eE3SNIbH1
	wsCo/Kb+qYs8xi6WDgmCkXY73cEdfuPtM0WfC2lLk4RWjNg4aehzp5d57V0BHioxaN+b3et7YCj
	dXyfjBZ7/4n1l8K1WSl0H0nlBz2zX3VBJMNKJA+QlYDYojON//sxDXy1fofzQ/tUpoQ==
X-Gm-Gg: AZFdTZfjMSZGHdpH9xmiXdFNHFK5ndCyvsPwJq+k8RHpznzodWeuz04HhbKaSLscfBq
	tkvB/IIpg1T1gCAZjgq8Z/+wrQ0hpUgam/6scWorXQu85/DuuhSDPh+okjQfwV/guZl0spciwG2
	va4Ua/EQeeg1SeJiNYNuvxAb7H474qZX8ZnAEIBFueDy/FxU3kIOiQHN8O27pLdiUiZxohXi6Xq
	8MeJgRg6S/NNAmtC5h7KpUat8/dMIdtBS/8roLNAJzF2N6TqeRodT4JcvJ+hM9gR9Aq+WKB7nz0
	X33Ho52X6xH9sXq4ECmgiagrXYTeLWXqw8RIZIm8upPFBMLDwQ3OqxkL1wPBEJDdbUgPNJAdd1s
	+7EjCg7mKkhBCVKvWT7KxxRvpUh6arp1v2VF1UEdVHaz1zFM9tDv3ssIwA9FcNoGfoZ2RDcyvEW
	hbDQ==
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr4060255585a.49.1795769216980;
        Fri, 27 Nov 2026 00:46:56 -0800 (PST)
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr4060252985a.49.1795769216378;
        Fri, 27 Nov 2026 00:46:56 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm42897480f8f.18.2026.11.27.00.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:46:55 -0800 (PST)
Message-ID: <1f55126a-10c2-4ab8-a7d2-0511d9385733@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 08:46:54 +0000
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
Subject: Re: [PATCH 1/7] arm64: dts: qcom: glymur: add LPASS macros and RX/TX
 SoundWire
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261126183806.172485-2-srinivas.kandagatla@oss.qualcomm.com>
 <sashiko-outbox-236036@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-236036@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f2cJhbrUeyUZreOFyQE0LTC2RXNU7lN1
X-Proofpoint-ORIG-GUID: f2cJhbrUeyUZreOFyQE0LTC2RXNU7lN1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX50yaQYy3F3yE
 paPXHjtf+CpuTwR3DNSX7VeFIgZAavY4a9sAE+b2mR/DoGZzo4NvoHiG+Ri4tNQL+vPbX89FfWv
 Csnr9OMxq51VvRSu6rEIyaI3n1/HFbg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX8ge5fDTeFASu
 m+16mCfjLudir27PhlpUomvJVaJrM9IOF8aAKNN/PThT9EeqyDO+xQhOJgEAQ0ahkFFjLLklhcQ
 8976tGv4pTjUDx5jG9vjxWn/CXYIzwFZiUS37B3ECE5rs7OUXuC7XX8StlmXHHX1IGA7j2ppo8N
 S41yNSgUOXdDVXOFfGYuvbfosWpATdrHw3V1PVDl2huaZAc+urDk3481D3Cxk29KiKX7ysEPglv
 cvveHeMnmMbSVd9jfo5C/uPnLZsmm5vh0APB64XZFW+ek9Xwk0IDONWU1NdhkJvDOs3Mr0ZREw4
 SKQcGagxSWhzb5ZeQruU0zbjh/v0yQ/6+7zaPTgRuOV5jscBRc1ZkkdNXIqP/tQWKI27BOJ/cMR
 HhZofRuSTmhcFm2z7NUQW9/C86qlLfMsaCMHj9Rf6y+Cy6hpI3QkixhwVarsyZoc7SyhlkpU0Fv
 1ailp4hsli3KaHc8yJg==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b094382 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=C1eMqFb1E5RMPDysGHcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

On 11/26/26 6:53 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [High] arm64: dts: qcom: glymur: missing qcom,glymur-lpasscc.h breaks
>   DTB build
> - [High] arm64: dts: qcom: glymur: unmatched lpasscc compatibles defer
>   swr1/swr2
> - [Low] arm64: dts: qcom: glymur: invalid qcom,ports-ch-mask property on
>   swr2
> - [Low] arm64: dts: qcom: glymur: undocumented macro compatibles and
>   node order
> --
> 
> commit b4bcd1d941eb74e432e52172d9eb6873d424ecc0
> Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> arm64: dts: qcom: glymur: add LPASS macros and RX/TX SoundWire
> 
> This commit adds the LPASS RX/TX macro codecs, LPASS audio clock
> controllers, and RX/TX SoundWire controller nodes to glymur.dtsi.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index 165dfa11f17f5..e3bba14bf36c7 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -9,6 +9,7 @@
>>  #include <dt-bindings/clock/qcom,glymur-gcc.h>
>>  #include <dt-bindings/clock/qcom,glymur-gpucc.h>
>>  #include <dt-bindings/clock/qcom,glymur-tcsr.h>
>> +#include <dt-bindings/clock/qcom,glymur-lpasscc.h>
> 
> [Severity: High]
> Does dt-bindings/clock/qcom,glymur-lpasscc.h exist in the tree?  That
> header is missing (LPASS_AUDIO_SWR_RX_CGCR and LPASS_AUDIO_SWR_TX_CGCR are
> defined in dt-bindings/clock/qcom,sc8280xp-lpasscc.h), which breaks the
> DTB build for all Glymur and Mahua boards.  Also, this #include is placed

There is a dependeny of
https://lore.kernel.org/all/20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com/
patches that are acked, I will add that explicity in next version.

> out of alphabetical order after qcom,glymur-tcsr.h.
> 
>> @@ -4669,6 +4670,73 @@ q6prmcc: clock-controller {
>>  			};
>>  		};
>>  
>> +		lpass_rxmacro: codec@6a70000 {
>> +			compatible = "qcom,glymur-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
>> +			reg = <0 0x06a70000 0 0x1000>;
>> +			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&lpass_vamacro>;
>> +			clock-names = "mclk",
>> +				      "macro",
>> +				      "dcodec",
>> +				      "fsgen";
>> +
>> +			#clock-cells = <0>;
>> +			clock-output-names = "mclk";
>> +			#sound-dai-cells = <1>;
>> +		};
>> +
>> +		swr1: soundwire@6a80000 {
>> +			compatible = "qcom,soundwire-v3.1.0";
>> +			reg = <0 0x06a80000 0 0x10000>;
>> +			clocks = <&lpass_rxmacro>;
>> +			clock-names = "iface";
>> +			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
>> +			label = "RX";
>> +
>> +			pinctrl-0 = <&rx_swr_active>;
>> +			pinctrl-names = "default";
>> +
>> +			resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
>> +			reset-names = "swr_audio_cgcr";
>> +
>> +			#address-cells = <2>;
>> +			#size-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		lpass_txmacro: codec@6a90000 {
>> +			compatible = "qcom,glymur-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
>> +			reg = <0 0x06a90000 0 0x1000>;
>> +			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&lpass_vamacro>;
>> +			clock-names = "mclk",
>> +				      "macro",
>> +				      "dcodec",
>> +				      "fsgen";
>> +
>> +			#clock-cells = <0>;
>> +			clock-output-names = "mclk";
>> +			#sound-dai-cells = <1>;
>> +		};
>> +
>> +		lpass_audiocc: clock-controller@6a94000 {
>> +			compatible = "qcom,glymur-lpassaudiocc";
>> +			reg = <0 0x06a94000 0 0x1000>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +		};
>> +
>> +		lpasscc: clock-controller@7680000 {
>> +			compatible = "qcom,glymur-lpasscc";
>> +			reg = <0 0x07680000 0 0x10000>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +		};
> 
> [Severity: High]
> Will lpass_audiocc and lpasscc ever bind to a driver without fallback
> compatibles such as "qcom,sc8280xp-lpassaudiocc" and
> "qcom,sc8280xp-lpasscc"?
> 
> Neither "qcom,glymur-lpassaudiocc" nor "qcom,glymur-lpasscc" is matched by
> drivers/clk/qcom/lpasscc-sc8280xp.c (or documented in
> Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml), so no
> reset controller is registered for either node.  When swr1 and swr2 probe
> with "qcom,soundwire-v3.1.0" (where sw_clk_gate_required is true),
> qcom_swrm_probe() calls devm_reset_control_get_optional_exclusive(dev,
> "swr_audio_cgcr"), and __fwnode_reset_control_get() returns -EPROBE_DEFER
> indefinitely because the resets phandles resolve to unbound provider
> nodes.
> 
>> @@ -4787,6 +4855,38 @@ lpass_vamacro: codec@7660000 {
>>  			#sound-dai-cells = <1>;
>>  		};
>>  
>> +		swr2: soundwire@7630000 {
>> +			compatible = "qcom,soundwire-v3.1.0";
>> +			reg = <0 0x07630000 0 0x10000>;
>> +			interrupts = <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&lpass_txmacro>;
>> +			clock-names = "iface";
>> +			label = "TX";
>> +
>> +			resets = <&lpasscc LPASS_AUDIO_SWR_TX_CGCR>;
>> +			reset-names = "swr_audio_cgcr";
>> +
>> +			pinctrl-0 = <&tx_swr_active>;
>> +			pinctrl-names = "default";
>> +
>> +			qcom,ports-sinterval-low =	/bits/ 8 <0x00 0x01 0x03 0x03 0x00 0x03 0x1f 0x1f 0 0 0 0 0 0>;
>> +			qcom,ports-offset1 =		/bits/ 8 <0x00 0x01 0x02 0x00 0x00 0x00 0x00 0x0b 0 0 0 0 0 0>;
>> +			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00 0xff 0x00 0x00 0x0b 0 0 0 0 0 0>;
>> +			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-hstop =		/bits/ 8 <0xff 0x0f 0xff 0xff 0xff 0x0f 0x0f 0x0f 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0x01 0x07 0x04 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x01 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-lane-control =	/bits/ 8 <0xff 0x01 0x00 0x01 0xff 0x03 0x02 0x02 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-ch-mask =		/bits/ 8 <0xff 0x01 0xff 0xff 0xff 0x03 0x01 0x03 0xff 0xff 0xff 0xff 0xff 0xff>;
> 
> [Severity: Low]
> Is qcom,ports-ch-mask a valid property for qcom,soundwire-v3.1.0?  It is
> not defined in Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
nope, we should remove it, will fix that in next spin.

--srini
> (which sets unevaluatedProperties: false) and is never parsed by

> drivers/soundwire/qcom.c.
> 
>> +
>> +			#address-cells = <2>;
>> +			#size-cells = <0>;
>> +			#sound-dai-cells = <1>;
>> +
>> +			status = "disabled";
>> +		};
> 
> [Severity: Low]
> Are "qcom,glymur-lpass-rx-macro" and "qcom,glymur-lpass-tx-macro"
> documented in Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> and qcom,lpass-tx-macro.yaml?  Neither compatible is in the bindings yet,
> which causes dtbs_check warnings.  Also, under /soc@0, lpasscc
> (clock-controller@7680000) is placed before soundwire@6c80000 and swr2
> (soundwire@7630000) is placed after codec@7660000, out of ascending
> unit-address order.
> 

