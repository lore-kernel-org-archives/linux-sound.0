Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC89C3AEF36
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 08:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782289267; cv=none; b=DtGrMe7YDjXKdpJypmDqG8vad60uvhprNQtZIgBa6x77a+gR3BP/Od/OSZUq44Ya17NFrd2vXOSNPHFFLLaBJqA/5cIl9gpgM4VLhf9s56WcrPdJDydy3O9q8CI0jQZbbNNJsaRhG2K9MTPi8AvHm+qu/GrniXUO9KrGhSDKN5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782289267; c=relaxed/simple;
	bh=eqxV8ikdAhRlOKnQYkoOSbqnMWTaUUEpj4RuibxQVBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZGigMgxdFRtiPMCNfe5/lcqunXQwkjmbgCgVmLKRm2YZgHjbG1uaDbo1hZN6iTlDOMPvK9+OcIrqMOX0jFdD4XDFVi+Tztp4gBCg9K08zW3wy2UNiKNYX2L1o+P6x4Pu+xFwMhwNVyiC218S+yy90Y6jR+7iwizsG50PBDRzjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZ8omU2F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HnfM9901; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZ8omU2F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HnfM9901"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5toRG533316
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 08:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7d5+mRjUGGE6pOIVrQtFvgHG26fG/M2q6CZje+VlP6o=; b=XZ8omU2F1nlSabnj
	bCAxzmGa2Kve3Fm467JkVrfNp/88MxcSoX0rWSj7BSsY/syyC1Vc9dS3d+yE449+
	ptwUxqu2BeHaCA/lTxpZTT029SLLWvSGh+eEgfNa0abJZ/HMeQeFW1w679RIW7W1
	LPTjcbYH7KHnqAp1baiL/nQkOJnBBKrcSAJmuDVCfkUFUlqiSB6WuPw/6VlhNFv7
	S45rbxmxXOnI0IR9DC85IqtSHmHROm0bYOxoHe/fgTARg3sZNdAr61w0eWvPpS5S
	4Pe1dlKss+O84benyHEFoonmefcVM44Aqoqm1GjzaGzzKGS4j344kPp+cb6SA3cy
	dnzQsw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f06r31256-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 08:20:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517bdeceb54so1555831cf.2
        for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 01:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782289257; x=1782894057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7d5+mRjUGGE6pOIVrQtFvgHG26fG/M2q6CZje+VlP6o=;
        b=HnfM9901n7cNLvKdIP4KlpKzeDaDpZJ/NstnLCBsk/hilXwUe00Eo4TdzveaXI+1lk
         4AkkBrBKEVjy43La/FhkBX8uHilytNuZepIy7XvNQX5RgeIIzQ+DUfQtjNIJTxsRTLfO
         133sSsnHs7EDzymLlin4SHFu58pvRBwDJzfyHepzNve3qrfSdqL6Jgct1hddOKk6V5ts
         eLZxemIGSSP1saVtUTRzr608fgf+FMbTG7dq/eyNUc19JLInJI6apddT/4SDRuhxdkjZ
         XHX1cct5PijTHI7a3w/95j/XtJkdeR44dDgP7hplNWMmXjbwpiY7KFtxFu2SvItA+9YD
         g2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782289257; x=1782894057;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7d5+mRjUGGE6pOIVrQtFvgHG26fG/M2q6CZje+VlP6o=;
        b=SA5zqXLQ5qJnaVq5Yd+VeVagGhz8CfKt9VaWlXDf7+NT48h5fR1JxEGFv3AIBc/5K1
         9zQYvJcBg+Q4ffNJcTRUua+sT2hpcerJ2ybUDOxuOUAaxdZYXtqlN89eVqeNWgDEMQL3
         l6yQCFMBKMsIPbOkvwJD0g2JbWq4rVH1/GmDfdVZJVk64o8TcBwyg3wTl86QLD20sOpW
         MzOFC9UwUZPaE1c7k4e2u8NqO7B6ZX+eB8yrHHTJRfIRtPqdFeneu22dFbfLtML525uF
         Ah9Dt//Ve6Dk159x+iAvfw9bLC2Mg48fhSMIOEhp7OS4eFIKqXGIM4jRoRSU8GMo4RAp
         xUbg==
X-Gm-Message-State: AOJu0YyvrQ+TzgMka2ld4ZsJCNhMaOwpAy82fai18g6I0QktqfmVxPBc
	Nkgi9QstblxC8whL+/bYgxwNiRpI4R4mog+X3toghKsSJkdCm4s0UUbkhqMvXAzJGi7BkbRPX51
	SNDHktPvtwLqrgL4DK7nHJpI+LcC0S+F62P5js7m+qUrpFFYMAYdCt1W4lGyrZuj8PQ==
X-Gm-Gg: AfdE7cn6JC2noBvoBH6ljnro4ebKtaUfaFWSN9YiR0rIVQhDsCsSCWw2SXFqoVYk/xc
	8eZyzYGILMWQBDl75Iw8PQ1N6HvYXeqKnP9QGGpj5HLXy7BOm457lQr+3CDEUbFexJBmZDUR/oX
	l4O5SqLF0cMd0cspbBzb0DWLlrg3odTwWDtssc0jwljItqAavIP4SYOOI83WVjKdthoOHR77x5C
	IzHHXHxEIKrXDPC7w1GH+euQ4t1rhfsgRpOt0YnQvYZHzdI83HMSBuPfdEYfnEXF45ajkVEcTgn
	1TJK0AtXhOb2ySlmfK1F2IfcSVcse0Xy/EPlWu5k+HB+SsOI2Pdwe9WPwL4RIUdlQD9HEtHwd6u
	tA/qIT67l9FP6Xq/LTMQxmKHJrg+nJwpXhTg=
X-Received: by 2002:a05:622a:85:b0:50d:ec32:b84f with SMTP id d75a77b69052e-519fede4b59mr184248101cf.3.1782289256611;
        Wed, 24 Jun 2026 01:20:56 -0700 (PDT)
X-Received: by 2002:a05:622a:85:b0:50d:ec32:b84f with SMTP id d75a77b69052e-519fede4b59mr184247811cf.3.1782289255987;
        Wed, 24 Jun 2026 01:20:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0ff4c9610bsm279261466b.42.2026.06.24.01.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 01:20:55 -0700 (PDT)
Message-ID: <41118d35-2b3a-4f49-8add-bf501bb93040@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 10:20:52 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616201315.2565115-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2OCBTYWx0ZWRfX0tW4mCxyDL2C
 YesIVNOMkL2VNIA7e4CZx9t8cBU7f0J0zYm00ZVWip1EfSGfRg7me3eCH4pVtCfqM9JgUzoJgit
 scQktnpD4v0O/MDabo24xwNv32PhI4/bNkJxltbx/yVeAYr0cjxz1Yzwj/NeFb/s5eS1dnmFsAK
 WS/s3xZBzJ0y+Dgye7k3vqMO1kgbSRdc0qzpgcDlASy7PADDEv2zip1uwvqK+MhEAqRp8Zzzvgl
 ckS+5q1WsWa+HYrLhmqkGCfwTkJPRpcsHUBdV3uT+Zx5iOx4s71IZ6kpWJyA7oQwLShtSPP87FX
 WtHVp6ndHNseIAsjSSVLP539/dJVoex+vnkCxldnBHfoGU3Drnw1UIOlBPtVQhc6eRWR32kt5Cp
 P4oyGIj40kbK+2cAKKojBKqMI0VGVBPJ5jxDAMsC8WLO/RuldOrHBf7RvWBp60ItMdrJos42zjC
 i+Ap3O0EZZ6Rq1Y3gCQ==
X-Proofpoint-ORIG-GUID: 57rpTgscyDH5AUEumVtTDUucHWvNPJfP
X-Authority-Analysis: v=2.4 cv=ZM7nX37b c=1 sm=1 tr=0 ts=6a3b9369 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-pUKfWG1Qq1qEUPvZNAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 57rpTgscyDH5AUEumVtTDUucHWvNPJfP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2OCBTYWx0ZWRfXzbURj9x2WFO2
 TVRLhU9bg5skEiDNGb05hUZiOWXyGLHmiF0A0m5wkdy1xgLw/+LekN/o2EocRuWYZwTRkrWwBJG
 c5ehuM8xWe2lJfg6vuGXcUReyh7KE90=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240068

On 6/16/26 10:13 PM, Mohammad Rafi Shaik wrote:
> Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
> front-end links to backend codecs.
> 
> Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
> the QAIF block. Keep the node disabled at SoC level; board dts files enable
> and consume it in subsequent patches.
> 
> Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 46 ++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index bc4ad2bcbbec..e58c87fc8cb0 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -2017,6 +2017,52 @@ dispcc: clock-controller@5f00000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		qaif_cpu: audio@a000000 {
> +			compatible = "qcom,shikra-qaif-cpu";
> +			reg = <0x0 0x0a000000 0x0 0x20000>;
> +
> +			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
> +				<&gcc GCC_LPASS_CORE_AXIM_CLK>,

Please align the <s and "s

Konrad
