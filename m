Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665115;
	b=pxzwFGciK2mIb4MXMw1P14J1ZwbcsnciBiqpHjl+tRViXSGhLGo408Ii0WdKtLEIal4G
	 1YxCVN1ZCxbOb60kSugGTzi8avzhPywev8UfYYSyo9W2Ti1USYgV0N4YPnnKkZU3LpeNP
	 9CmGUvEzEmeAJ+fA3KyDlmwmwT3Pu0snCOQfZSclBextEWPIBTD1/w0BM0ISUzUSEPV+N
	 4VbIjYKxDdouGuvY3vmK3lAr4T0oyPcmZd8R03lhBg9ramUComPsb4TkTTLI+oj1x5iFq
	 A0yZ/iZpvdQJ+tQXwZ/nUsDYOe/573hSTDmmawKxticdVtJacPNrEy/KWjvgFQ1JE6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Awbc1OwBDawvw0PsKGiEj8XSYNQmg3T/IWA4GpaDj7U=;
	b=yhIxxT4gVxSybyR/K1F64HXbZwpgJlNOgcz7n/0n2BkN9JCGjkMU5CYNd5hNzj/gr3f4
	 gBW39kokiSp3wPV2GCsPKOfPJ1fX6t1pUfq/9UqP8Wmqi1m4IqOVZCgjodrWlDiSTgEt0
	 u5htf5ctRQ844BT7CLEyqEq1la8TXSDuV63fIBHgHGRyX63sDjdFK3l4k1Vm5fIjruroZ
	 UBsz41xLPFgWikRdAIT59+gfCoGV9Gsauof5kpVUIguE0izU41fJEk5enWBr2OY5o4lAC
	 I+JniiPVAn/uIsHQMUl8cXMdJLhElVkpey7oAb3v8aU8STUlIXg5hMv8ZImhBsT2+xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JeJvgDE9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiDl1M54;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7547606A31E
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 10:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7547606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JeJvgDE9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiDl1M54
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MATHQ84062455
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 10:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Awbc1OwBDawvw0PsKGiEj8XS
	YNQmg3T/IWA4GpaDj7U=; b=JeJvgDE9s6U4rKR/pH5cLI7hD/uIVCindZ8qA5xc
	jJOiT7VOPN0GQ+VWDhCj6e/88WnNFR1Rl92DvrBAgWlFQBpl73FJNCh0M+okDzpQ
	K1ClcvpDqpIVNTlccpcoiv88nOIS49DEtk/UofgNIhSuFLq1zgZ4E03v7zvaRmg8
	sVm/zSxqR0uJb6kMsB6j3pqekdqR5HxjzO0M4Gz9vRswjJPpdG4vxHLMdG/mc4hf
	5TDfxikWgcmlasdqmZBmAcz74xh89SZyaeyz9qwFbEwwwgCNFhYubFhMJGZAIFQO
	v2z30xxK402n5rp0cITnqovRdUUrET0BsilUcyUC7Qap2g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ca0w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 10:31:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so179088285a.0
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 03:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665113; x=1793269913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Awbc1OwBDawvw0PsKGiEj8XSYNQmg3T/IWA4GpaDj7U=;
        b=JiDl1M54vOyZMyIyAKuImMW56nmaJ9WPKvtjZ4nk4ZpPGpargDu8nJsXHgE0yPIebC
         BP5uti5dX0C7bjI04CUVXGVP+JNrXCmlzQSK8qfNndOeReymFyhtipLmVlfEVcoYc/a+
         gGt3XOkIsYO6LUCJg2gvdFkLjvc5O8acMxCPxiVACTlPr1vg5k/EPktDiPM125LHF9N9
         A+tS1DOJj+YVYmA1TBbMKxiIPK8rNLHVE/6r2jUBGByO2U0ml/zOaKWCkBDoLmaVnWHj
         Df40dgsb3fIWPcqrDvvSC4VI9dguraRrX+9Suu6ARGTPhSnIqFjhT+qNJfxJix0eQ/iT
         o7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665113; x=1793269913;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Awbc1OwBDawvw0PsKGiEj8XSYNQmg3T/IWA4GpaDj7U=;
        b=PsJtKL37mjYnMx5/Ls1g6N8AbsR+pHsfpz29n5gFANP5c3M7AD8Cgbn7UPMde9Edwf
         COSMOMkwED1f1P42P+QYSZd1Sm6wAGgCaQrZieFSZmVNULig14FPa0jMd7gUj0IoOohG
         54CPbtmiEujuWRDIiQGdAZQnw44uFbqY+FTWObxtytmsire3XT8sGdWAhrmZBIYU+qs4
         TA5loS8QH+jpgbR37FmiqRMuOwlynvP+6Fpxf7Ln4DNqYkhPVMZ9RpOgRO10tWAt7jCo
         t4rzvLZY0DmKlLtjiFXmBcDnYWCP85bPYH7l5bhYzEfpvzR/PJzKSJnR/xYdgteUq2it
         YwqA==
X-Forwarded-Encrypted: i=1; AKwUvBwFFwk85ZCUcyH2jl9lfR6CanLVTMgPhZUHtUW7cvzd9WNoa/IQ+iRTju1KJ1qAjbIOM4TmAerml7N+OA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIvfdSsb69mvFefsJCBUXjqcM7/+wvFEuYHGo/A7rkNao1z6MbM
	qZ7VLB6Kj9SRtC/VQ1tG/WBCyr/DNiJQFEkwj4K45ee/LRMIAPB/fiu01/TqJLU0nOiT9bTGtt0
	L0Ny3SWNvLAZJsTYeYSZR0ppyNY+l4UDEv7jWE3cYAwfGH34MOI5jH+fLgGOcIydF8w==
X-Gm-Gg: AYBFou2RYLAOIiYAkHHZ6HXr+1G54R+42xR8Kozn/nMzs/mP010sjsAfpaLMhkWElrQ
	eteSx+u8xyZit+lzi6P6lXp6P7Ko5OYPfVIxmhe1EFqUvQppbUDWRPhplX9fyOGYlz2BW6YZHqX
	S8lI12Ix9dqP++5ajcuqC97w6ZUh3HsVI77ByvheZCD9Oje1+YIB0t+XDMWBbTfrN++GLLWMlvg
	GOvJ2yWF/hMVaooUtx4RelhIHAhv37lguKI0yBHaZv4UBEpH8h7maen42gqwykp+KuRHoIi81JX
	earOiMv/ongZPnNrOJEDtK9G5/1FjgyFOx/FRPhpF4E5dRb/hhFQ0m3KUddIbUuIrxQ5OLrXMiI
	kLN6KZiFzhWsEcjI2m3iZwnBfGDHjnVD0UwCD55ENnCSfo41rM4EfZPOxl2uATKGx/Ph1jTlhcs
	xVoDU8INj8CgEA
X-Received: by 2002:a05:620a:f04:b0:93f:34c9:9259 with SMTP id af79cd13be357-93f57f93a2amr866626485a.50.1792665112668;
        Thu, 22 Oct 2026 03:31:52 -0700 (PDT)
X-Received: by 2002:a05:620a:f04:b0:93f:34c9:9259 with SMTP id af79cd13be357-93f57f93a2amr866623985a.50.1792665112215;
        Thu, 22 Oct 2026 03:31:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f55402csm6899281fa.13.2026.10.22.03.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:31:50 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:31:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Karthik S <karthik.s@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/5] arm64: dts: qcom: shikra-iqs: Add LT9611UXD HDMI
 audio overlay
Message-ID: <b7kzeykjxoiuf2m4klkga7rnvtri5vs6z7qexe2uskrcpsh65s@dpkzcc4ykkiu>
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-3-karthik.s@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022094313.1074873-3-karthik.s@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX7AskMFPcO4FC
 NvscAnAQMKLkB5ftzQXTqP5VX/IHEtGlQuJoSIRsoNBKiEk92gsOF7ZDTTGiI7gxW6nl/1JDc/L
 cgxDPct6qT8GB+4sp0hKaYk+OYrgi7A=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9e619 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hDuEe94TteisESDp3jcA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: nNHYmElsCtmZmNAJ4oHd9VnlkxGpK1aV
X-Proofpoint-ORIG-GUID: nNHYmElsCtmZmNAJ4oHd9VnlkxGpK1aV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfXzbmB+yzZYQ/V
 vq89rgixYpeP1HIduShnJFsPOlBmzVwRKWRs6+aSxCDIPU/eFZrcSYpHnVEfg2+NE8k2V1rivty
 qYbWTjWAvkFbAUypmBVl4wPiGvI5x3sZYs+ud9x+7Gs/b22kXk3nRTI/pB/WQeM3hEi3fDV1GlY
 yFOroLPWo9f/6m2ozG2CV92Fftwe99q/q19Lk5pvv/1JkrZ1lxzE/HuKXiyzxcYMKXWRzJsWWFq
 C0y26Ceo4U9Uc1D4NpunDmdZYmtcLl1JQOZJOXmxUSD+Fad73qhpdPjwgc/JX3n1SYmvYHDlGCC
 GaB2wtBGBj6TeTZ+rVBSQC0pYV2Qw8PvTlsqM+YXUq9MoIsAqB4rCMA8zwIhK0vvd5ESnDK2NST
 18agE+RyBvDofJv4U1xqNL0kD7qWAyMjoTQjrwQJ/SObzUsOJGeZkw1559DzaVOLeIq0dllMqV9
 TZfHj0jBedZUwQBnmiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220041

On Thu, Oct 22, 2026 at 03:13:10PM +0530, Karthik S wrote:
> Add a device tree overlay for Shikra IQS EVK boards that use the
> LT9611UXD HDMI bridge as an I2S audio codec instead of the MAX98091.
> 
> The overlay reconfigures the sound card compatible to
> qcom,shikra-iqs-lt9611uxd-sndcard, overrides the primary I2S playback
> codec to LT9611UXD, disables the capture DAI link, and disables the
> MAX98091 codec node.
> 
> Add a node label to the sound node in shikra-iqs-evk.dts to allow the
> overlay to reference it, and wire up the new composite DTB in the
> Makefile.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  4 +++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts   |  2 +-
>  .../dts/qcom/shikra-iqs-lt9611uxd-evk.dtso    | 36 +++++++++++++++++++
>  3 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-lt9611uxd-evk.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1c86e7e98f55..127c5c345eff 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -339,6 +339,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
> +
> +shikra-iqs-lt9611uxd-evk-dtbs		:= shikra-iqs-evk.dtb shikra-iqs-lt9611uxd-evk.dtbo
> +

What does this overlay mean from the hardware point of view? Is it some
hardware variant that requires reconfiguration by soldering? By changing
the jumper? Can one use max98091 and HDMI audio in parallel?

> +
> +/* Board subtype 0: LT9611UXD as I2S audio codec, no MAX98091 */
> +
> +&lt9611uxd {
> +	#sound-dai-cells = <1>;
> +};

This should be a part of the base DT.

> +
> +&sound {
> +	compatible = "qcom,shikra-iqs-lt9611uxd-sndcard";
> +	model = "shikra-iqs-lt9611uxd-evk";
> +	audio-routing = "VA DMIC0", "vdd-micb",
> +			"VA DMIC1", "vdd-micb",
> +			"VA DMIC2", "vdd-micb",
> +			"VA DMIC3", "vdd-micb";
> +
> +	pri-i2s-playback-dai-link {
> +		codec {
> +			sound-dai = <&lt9611uxd 0>;
> +		};
> +	};
> +
> +	pri-i2s-capture-dai-link {
> +		status = "disabled";
> +	};
> +};
> +
> +&max98091 {
> +	status = "disabled";
> +};

Keep the nodes sorted.

-- 
With best wishes
Dmitry
