Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944514C753A
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 18:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397062; cv=none; b=XqtPdHLLOm6RN4uQobH5mT0b5tt58M8qJ4nkktq8GKuym7RdG5H5VpapfSiFCO7J4bOYbj3EDxrlo06ue+F/3twF13B4l/N/PhRjYZtv+fiLFCY3A+rcd4Ky8V0dUdaRrmpCRsHZLmbBxR6l8xcD9fVeoIWVSAjnka1BMLPedf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397062; c=relaxed/simple;
	bh=7p1E68LhKBh6yTqP7m6fWj1obK2raK41V5zAFLXEVsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHLBXtgrqgVewzsUYWuleDa4Rnsbvo0dlXUn2fQDr7ALocH8HxASHvLsUh/TjZlbmTWc5eFJR0Y7DhKld+vVpBfONE999IZZj7tcrSASzbsfrVaVnWadIcAs0E1D7u/35XbvHYHw4ke4AwkOjO0zEAI8EtWM415Xy2XxHH3vsQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGEjaKTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZf10HoP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGEjaKTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZf10HoP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697IAoON3847505
	for <linux-sound@vger.kernel.org>; Wed, 7 Oct 2026 18:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=; b=FGEjaKTKiTMns4jc
	ySHa7nijzGtMIzNX1sSiTKtCsnriO7FROVZ3uqr95gbCSh1QEPWJTvdAjroTzvh7
	vYcPaHGJ6Ni6uDM+Kqv0tkvF65ayaBCtGgwTBk9gPPqQX5HrxgEOAVQtIbMNMQMj
	Oo91QuNpT9Dnx1I0182YQ5mOj09u9Wpx0oK/t9LZzDnhtmCbBYnMGadTb8IYul7F
	3Svyd2viG0xYmLfiWAq2CXnj9ztrwoWhjfIZQs/5z909hqEd8GRhoJ5FtXQHXuTv
	PhFEUlCW70YfasD5eZZt+1tvYLBw8YdQm5heGuDGBChfTtry9UsR+gRyN4xv+I4o
	b0OzSQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5tu803sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 18:17:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d62bb27a1so18169559eec.0
        for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 11:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791397060; x=1792001860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=;
        b=OZf10HoPFhHWxcx6leDuuNp3BDdxfW2PbaXkq09XUirW3T3Dvb1ZJ7MTArlnniCJ4D
         cdJZr6GCsXJ3N1hyi5R9+OO/Ar8gt8qw3JovkhzfATlbw5iBuqrb43mCGWWTiOKF9eCM
         0h/x2oowVPD8K3MBowW0zPZZVbnv5oavsvpZLb/zdgRYiVDp9pGJ+dl2SS0KDPCoTZo8
         YpWAVXK3LbovU+MyS4MXH6UtvusQ5LUevaAGweRIhxPTQcVNSfxZRFf/XVwU3CnKaSod
         FnAdzJuei1gSz8+Qjez43FMsvsOIx9M0bpaofE11JXrmfV7J70PKr+8Bu1iGG4ouPT8A
         7tZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397060; x=1792001860;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=;
        b=LFUtG7R/3rzqH0/UV2J/xABvVzPsPoMi2fai7KcmvPxY+OhlhXs12g+5NSy5E1b9qi
         tk+HD8ow9lwVAftc+7FW94VcmVCrIR7cnO30g2XRqQS7DTvTp+WTrM71g1A20A8t/PdD
         ChRR+t3u42x05FT2pBZGMytnBWiPNEhMQad9OsQGRSe/EDfKDk19qWMkOm8Xi2vVYkc8
         XJSKUdxtcfGrWtlKI1zs6OOzunEBqhfTZvtpVugQZhIxrS4TEoxRV5TWU3C3blfFF7ds
         LPThVWnxF7EpJ/GrfgAZmULqQxCuhRINpnK8ceF3wf/Pu03WK+QnkIKAdfhikCS3eawe
         oLmA==
X-Forwarded-Encrypted: i=1; AKwUvBzQsLycHrw4RlygECi4jOE2auFj8/vBBxzij17mYGn9Cu9acaTvCJ6hjyPfALHENgQFP0LG1p/ZARj51g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIe7I+9Jp8Cv8m0RDQ/r0kpFr2ULcBOsk0yRAogjLfTnLkjWeOf
	QoWnwZfg9ylO8k8F7pZxTInK6L3Hs5VlZ1/xXiDTRhGbldKDdV/0Qkksb2UoGzWpvYHdE36LUjJ
	pIzVH4hTKxojWNx1a8vsHn32y0KqWyZDPT8EiFl8stcf3MDPAe1rPGwdUTQsHBJOxTg==
X-Gm-Gg: AYBFou2XtFB4WVGZAfwL6Mm/0PUJ/FJdyGQb5jJY/xxzJp1gV7hwJertrIpEngxLFD5
	afZTvLhFHoSEOO9OeYLllJRidm5YQ/XIF32QIwSeRrwiEoipRhaidpmD+V2yT7sXU86Ip5iAF5j
	RgiccflV5/1Kt9S8FAhgELBDuEGXMcCCX9GPwJo59DFZagNa6TFCbbDxQsU+Wy8SeMoebatfJmH
	73c/dSQ78aiOvBHicTHDf5qwgIJBOf8IGEHVn5c/8rYzK7WIGTHTiScrRZY7V8VieDSigKV6wxG
	oYycvAHs6QgvyEMz1AI5EuRDPpk2esnCYYk8Q5pICwHnbPxrQmk3xeq7FC8xfIbkGDq3QIvNJcc
	MR0Q0a3VY1qGUlY1wIBlgvRm8pe7/
X-Received: by 2002:a05:693c:894f:20b0:351:69e8:d419 with SMTP id 5a478bee46e88-35169e8d438mr1958840eec.22.1791397059755;
        Wed, 07 Oct 2026 11:17:39 -0700 (PDT)
X-Received: by 2002:a05:693c:894f:20b0:351:69e8:d419 with SMTP id 5a478bee46e88-35169e8d438mr1958297eec.22.1791397050030;
        Wed, 07 Oct 2026 11:17:30 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351735e316fsm980093eec.11.2026.10.07.11.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 11:17:29 -0700 (PDT)
Message-ID: <126c4b96-f50a-4ea3-8df3-a7118870a5a0@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 23:47:18 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
To: James Calligeros <jcalligeros99@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, ajay.nandam@oss.qualcomm.com
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -DbVS3ySxULB-qYMbvFTQKhMtd-NCt4I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3MiBTYWx0ZWRfX+cXhNPIBt7Vd
 1OtKlLv1LGghlAARdDchD3OCWeXuePLFqccFKlemrJMoc4RKzZ/bpH5HZX1zMlwJUKIyqsWSinZ
 x8ico+lT4no/pJ6bDY7jvTox7Kj1yfI=
X-Authority-Analysis: v=2.4 cv=H75OUOYi c=1 sm=1 tr=0 ts=6ac68cc4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZXy6yrx+fn+bJIgs5eQ1WQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=UKJZ3Gop6vG71Bmy1WEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3MiBTYWx0ZWRfXxF+bof0Pw5iZ
 uUwcy8ddB8Y4aS9L3R5sgBlzCMN8xobLTqi4YLu2degDLcMFv41kUqmvPLxkth4rFbpm7LtTI+7
 95W3xNYOO1XVQJyG3T/A8eQX79HlQ0B8XG9AjwfDEqOdIvhFO1ahfwn1nA1/LENn668tpQVV3/T
 pZetKnhtNGspQkVrozCFCvh5LOCA6gLRW1VpuFB0Lfom8kX6KtRi1odNo/onIYT7oM5ETXEaSoL
 X49jUwBGX3LCqlwDbWUCf9YP7uI1nAA0OleftHSBW/s0xJGkEUU9u6nmkIhRqE/3LbNVPPpSj8i
 66LfqS+VLUIZxhbOdtQ1xo6zZ+VcQbG3OQvy5Orum1sSBEFu3/UhsKTiZTCe6TYCnq/529udwKf
 IDtbijNRxGcczyzuAKGfKjerqPTkQt4PEdc3RTbr2pp/IFMWJZ1Yz3OtnxWvCulGAakVoHHnUUw
 XS7rB0VYqSfVVpU/oPw==
X-Proofpoint-GUID: -DbVS3ySxULB-qYMbvFTQKhMtd-NCt4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070072



On 10/4/2026 11:33 AM, James Calligeros wrote:
> The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
> and Cirrus CS42L42. Add these nodes and advertise them to the machine
> driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t8103-j274.dts | 67 +++++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
> index 1212852251e0..6121e3a89a0f 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j274.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
> @@ -75,4 +75,71 @@ &i2c2 {
>   	status = "okay";
>   };
>   
> +/* Audio codecs */
> +&i2c1 {
> +	status = "okay";
> +
> +	speaker: codec@31 {
> +		compatible = "ti,tas5770l";
> +		reg = <0x31>;

The binding documents "ti,tas5770l" in 
'Documentation/devicetree/bindings/sound/ti,tas2770.yaml', but I only 
see 'ti,tas2770' in the OF match table in 'sound/soc/codecs/tas2770.c'.

Is the expectation that this node should bind through the TAS2770 
driver? If so, should this either use a generic fallback compatible, for 
example:

compatible = "ti,tas5770l", "ti,tas2770";

or add `ti,tas5770l` to the driver's OF match table?


> +		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		ti,imon-slot-no = <0>;
