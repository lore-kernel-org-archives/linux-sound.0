Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAA7481A91
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 09:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451776; cv=none; b=umngtT3QrZHpCxOYwITLWVTm+jZgWLOyjDigPlcX/OydS3BILR/WmtFO8XhbgrvK12sZNFEmnVDREtHiT13hbG1jOh4gEVYgdjIfC3/WXkP+yG5wliO9BNqkFMg7NTWrCd1spczcM7jplWpjN+ZuTwhKeDIs7aYK2M0C6iR9eOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451776; c=relaxed/simple;
	bh=1o0m0qm/3wEfMh2Dfbs0Oz1kXCVOudS0M1hkMoN9am4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYO/MBLRSlD0MQjQkS1EugHY+6wAfpD5ImP5vysaoJqhWi2sWuKyONI6OgyIyG1bIj4xE0tAPy+xbNBk/Z065UyLj4GU7f9tVXSMtkIO091Z3dlRdbR00HHuvRAwQbxWAVv2tfT+rH4AMi1p008h86n8HRUrjYHPAMMcejxfqMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffMQqqlr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6E/Ydsz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffMQqqlr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6E/Ydsz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K3nZ1341772
	for <linux-sound@vger.kernel.org>; Thu, 8 Oct 2026 09:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=; b=ffMQqqlrngRc9MV9
	3LljFSL01DDjGEACnX59qfF16x6zKB+5G67wXlhJ4wUv4zv8rwm2FOzyOtnbG2Bv
	YiC1BE1yWYDxH8tALMOCUoES5FGood7IUrEQkeNZeznK0x3Xto0q9/bydUAPSyUe
	ZB15fNOF58GzTRGUTkqpNMobZk0TenZxxmkAlnUtnhmsTfx6txntq00BGf6W5/WJ
	CsQ/lEOJOkZgU4BCNSkNEtjO1zEauOqElYaKLf0K9r1xsVavJJO2poM+sauiLGp5
	75/kHFny8Ap6JQT1DTgCNgSXVwqR3mvgd+m2fjvqpoA5NbGVhMYVKmTLoZJfDeXc
	QwHcCg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2t6kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 09:29:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ccca9481fb6so3342256a12.3
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 02:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791451773; x=1792056573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=;
        b=D6E/Ydszbc/omoYuQaM/V2cgYzHVfgHF+M9V36SJ5ZNroE71zyhdNAEmG/p5B5vXK0
         X+EJ53FNJv2YtMzzmNYa5EClEx2qJTGtZ2DCgmcMuw/CqDb9FFK24ZW0nJSTGST4wLhY
         nAiLDAR8JBI2dzdpZ3054TAGkJKJ6tPPZFsBmGH68xqDl611uYXuZgm+JjKuYH9J2Zpy
         dt4/hO356eUoBN3fzslacmmv0OGNsVpGz0qsTDR9F2ZxaQY6lbs4jQMUkQo229/S8607
         lkLibEK0N+obC9+7W8jcluzb4R8ZHHFcgW2RfKM1q9KzaFSOQKgASoziauKtLOM8z0J+
         G+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791451773; x=1792056573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=;
        b=kdrSy9hGj9MzoVS2xqyw+/3uxfgjbfYarP70Uomkm6aqvfrCAxXNMMBwLGpBg04X3m
         FbJP5arh8JV6qq5qdhYGFqyMVGE7VzB4J22hGVzEnCfhlqSRM0wJceFHGGoQM66m63oN
         pZuRPR1xgsqeqUFgjDsPPgWnwcqd8BiP7nWp/k5tQjdw2NxOfjZmbuu+I1d5Gj2Ofujd
         AbyPCFXCSXTuYqH1gUWQjm7fTp8FonijyNt/4djhS0QKOyr4Pey4QU6l0CTdAH4XJXBg
         JA6O3gLSs5GwtfAbJjg5l34QalZEeuWXTmywRHOZsL5EnbwWv1jmRrV2aZjoxblrtfJs
         FpwA==
X-Forwarded-Encrypted: i=1; AKwUvBwDZ2Dh/Ujm2qJnqLRttVWttyAz3LdGxY0gymOt4rTEhscRnEq3fqKc3xhSniYO+jYVrEjykOweQikQ2A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLdfgtwqCNNmDUTjAv5ayb/zmFJyF8y2QddxcT+asoNfj1uSPGh
	GBCQvySb8n8yfrxKeZ1pdsQHN0JdHaS6VOPJdK0RejzaWYh2lzFQ8/KE8/gdyp1moa6ISfQnm4X
	JoA+OgoH/HddsJIY7vstd+JooK8+Jixob+kkRbUvQ6KfRGwHOO95Fzxd6G92E8+/zPQ==
X-Gm-Gg: AYBFou2QN141cisSiwJRwqJ938mnzpeKW5QLsL2R3tBMJ40RM7/Yr3yJDqRTfKc6hF/
	fywFP1ZEgr1DUEAomGi1b4jC48aT5p84XEMay7t1N1V0FjJRQKP0wQesCbG8cznVhuo9cpPChlI
	/CsgQmd6Exu1O2ogZT+9+pPz4L8oqZZZtHBYbIAa47dT56leAvFGeJCJLVimAaqRwRQPEZrFYmu
	+0P6xcjWcOYwAZ4aTk+cQ9d4Dw4aJrBP3Cx1/CAZv1n+Afce0NlfyXLD9edPVQLpGOeOZu02XhB
	1w+V63Og4rEL1uPAqyEagrSAsG3eeBJO8RuijH0V5KsC7L+2zpMCynDxUXl5NPZbvoKe/Fx+fJQ
	myhFyPy7m6xwpG6jvLFxtTLiwY4c=
X-Received: by 2002:a17:90b:4a41:b0:3ab:c80:9362 with SMTP id 98e67ed59e1d1-3ab0c809861mr582619a91.35.1791451773143;
        Thu, 08 Oct 2026 02:29:33 -0700 (PDT)
X-Received: by 2002:a17:90b:4a41:b0:3ab:c80:9362 with SMTP id 98e67ed59e1d1-3ab0c809861mr582594a91.35.1791451772573;
        Thu, 08 Oct 2026 02:29:32 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a79babsm3415638a91.6.2026.10.08.02.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 02:29:32 -0700 (PDT)
Message-ID: <dd8a9faa-9d6b-4846-b38b-711df8c2d6a8@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:59:22 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/21] arm64: dts: apple: t602x-j47x: Add
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
 <20261004-macaudio-v2-21-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-21-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX22XiL1QEfPXn
 J6UNFEUnC2h6C+z1AURM4ZqradLElURUIRXRDmVNN1ZGmZiY8gy3bz4zHZP+xtcH8lJR0eoWfDW
 9h79PpXF/X6yEsvC0yKFHs83BlqK/pQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX+AfdeNGI0WIP
 1OhCgIqVu37OnKEJ9IKk1s3uJY0UlZ3QZrifjLBIb82NapLRGmvOepOkombaE7skRgVSJy6ezij
 HdoU2PzzdPeby2DqMVP+k3piryNlDJt+vPlmu9EyI97JmIWDk/AZg9JcpxD8ySK3RnHKzoGFbqV
 YhPGtTM7wIIFV1Ud8qPKMtS+lbcWy8uzj1UODEZuOssM/vpKL5/1LMX1KZG2XDdcpWiwzKunDYr
 5MTnVUuWoXX5AFX5cPSXtGbv/AgGyz/12BjEDbOU2xB/1OiAlpqCFaZpNvpNhxTrNVgI6Msz0qo
 ZtQFGOMYOHusDukZ5G1Squ22uNwByBvTIBXo5DzkoBPrnWvC3XbAe31U6aB35CJ5Xru/YyFVpx0
 aYfBvjXhb6vQoWOGd4OrQIMumlNJqj7lglld5D9JWzzP6wpA+33hxauPWWGR2584Ji5td1T8XRW
 p8WyXs+B3ai8kv2j8AA==
X-Proofpoint-ORIG-GUID: ue3ZjEhRuc34FweJvwI-ldHnFdXH7VYS
X-Proofpoint-GUID: ue3ZjEhRuc34FweJvwI-ldHnFdXH7VYS
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac7627d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=oNl7twi5fxIAqsTzne0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080037



On 10/4/2026 11:33 AM, James Calligeros wrote:
> The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
> variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
> advertise them to the machine driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   .../arm64/boot/dts/apple/t6020-j474s.dts |  5 +++++
>   .../arm64/boot/dts/apple/t6021-j475c.dts |  5 +++++
>   .../arm64/boot/dts/apple/t6022-j475d.dts |  5 +++++
>   .../boot/dts/apple/t602x-j474-j475.dtsi  | 10 ++++++++++
>   4 files changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
> index e3c2635d84fa..7b4c4ef471be 100644
> --- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
> +++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
> @@ -46,4 +46,9 @@ &pcie0 {
>   			<0x300 &pcie0_dart_3 1 1>;
>   };
>   
> +&sound {
> +	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
> +	model = "Mac mini J473";

Should this be "Mac mini J474"? The board file is t6020-j474s.dts and 
the root node identifies this machine as the M2 Pro Mac mini / J474s.

The fallback compatible to apple,j473-macaudio looks fine, but the sound
card model string should probably describe the actual machine rather 
than the fallback model.

Thanks
Ajay Kumar Nandam

> +};
> +
>   #include "hwmon-mini.dtsi"
> diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
> index 9fe17f1f7f59..f8f776f9eb1e 100644
> --- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
> +++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
> @@ -36,4 +36,9 @@ &pcie0_dart_1 {
>   	status = "okay";
>   };
>   
> +&sound {
> +	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
> +	model = "Mac Studio J475";
> +};
> +
>   #include "hwmon-fan-dual.dtsi"
> diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
> index 32938a3bf96a..153899f1569b 100644
> --- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
> +++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
> @@ -73,3 +73,8 @@ &bluetooth0 {
>   	compatible = "pci14e4,5f72";
>   	brcm,board-type = "apple,canary";
>   };
> +
> +&sound {
> +	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
> +	model = "Mac Studio J475";
> +};
> diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> index 926bb4ab77af..7f1faefcf9bb 100644
> --- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> +++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> @@ -36,3 +36,13 @@ &hpm2 {
>   &hpm3 {
>   	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
>   };
> +
> +&speaker {
> +	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
> +	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&jack_codec {
> +	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
> +	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
> +};
> 

