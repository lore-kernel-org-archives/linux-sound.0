Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D957D3BFE33
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 06:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440339; cv=none; b=eXp3ZtEoVZPbHAjks4CGPWhRsRdZn1faKe1syzfRZKkXf1d3NgPZ1zQXo46BfiH/KnWOdHN48vyWBKuN5kK95nnn5yMbPtTer03/ymJOJCOd/uSaM4CXZPuA/BDkA/Dvc5VpwXr9PtTR+CrDQshd54WG6kT48LqFP9WhMd7MSh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440339; c=relaxed/simple;
	bh=EAEruviiYG/N6nple+mn9NdhJEM/dZOzYksLjrNmyuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tiDC8a9+T+besy6N+WHZO6nBZJxIVwPuP8nknv11X+bZm6A3d/XUBvXNhZRqs9sx6sw7vtJdtXuqJlyRZmgl4hOAnebio9GMWJP7bpb0r1UeBTuDdZBbTOnNd+9DijbKAzKszK4/AEuKw2R+l0wPPuMTpDoVYFw2cNlewicFoQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gW2v5S5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfQ2lT/q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gW2v5S5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfQ2lT/q"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BT1Y2895401
	for <linux-sound@vger.kernel.org>; Thu, 8 Oct 2026 06:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=; b=gW2v5S5e5sa5Yb41
	tkhYl/JefCzIgByxIoWKayWoEjlGs+o7BxGfrdi5I7/DQBHO9fG/857kGsp/r1YG
	3dcOPYIdnm9yYD2D+CYaipsNYW5Wd6uz3BsA1OyD8k4iR63P7/QXLahXZFslPUif
	njCLrDG6P92+PnIhXv5A12ld6WEU1WbDSOL6kpb024dAZWUVl/UCdIh3h6o58+bh
	xPVyr1w2O5hzt4QBVMektOkw201yAfcWMR0otA3TeQJv73CghMsXwfKgh+ZYMZJA
	X/2hKzAhZXUj728/QTUQzACXEP9sl3gQLK4qqHr/n8Qg025FhQ2/TO8PE86Vq4Y+
	sUrjgA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg90dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 06:18:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e617b5e9b3so8310975ad.0
        for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 23:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440336; x=1792045136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=;
        b=CfQ2lT/qRJXEsRSBlTGqsENb4z3T0g20gi+tIjvXMlVGYuZDiFjq8R/nwsxI6QnMpR
         zHKsVK6rg87r1diXpjgbl1Xyys1YFHfhYG/owpiCvheTdtXys1Gfkc3MATBqx9ZMD6Uf
         ySicMrP20PJ6/UB8O0fqcycVW7hL+8c/romKRFEaN6eXgqu5zA4imOvhW0uQ7P5ZBVhW
         Ev6FO8Ulkm9x2nKi25LBRwX2d8JPDdsX3+KzAklygNoE2qmGUagLAKNHBIqQjjuxaDO3
         UQzm2OxCf79BcJNczsDKiXzrMr538tE/EnT2kJJXZKxV6517MaP7qwZaUlR+2ysGBZ7c
         4krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440336; x=1792045136;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=;
        b=q4sbZ25ThDuBc5aPIkVtHQ3/WgwXgLctYWAZtZEkXlZEAPOw3Cd+iG2RWfZEiRKNcw
         r9giYA5tiBal5CurwID82pQAJhxb93E+ZOcpb+I3y0nSo/w0TubnuY7VTa8k0nRmhTbf
         JxhWC17ISc0KaE6zjdiTdrE/mYB7xHRMHFaAzk3CJmShcdSKOL0HBOgj0fhjKAiEHsnu
         50ng0PHbwSJJQL/ZKObIleH5qYxX5BFdGKzhh2Rtrm1oWM4uM/lScKy5+XvZ7enBuntm
         gdip7wASjm1jtwC6vRaLstKmFHrGdB8PdnWmt5PiokxovAHKR0jnJ10B/p1AqFr3RFZo
         BOuQ==
X-Forwarded-Encrypted: i=1; AKwUvByYpbYh2wDoljeGMvDPbRUMypG0/tvQaf9auTEQKt7YExHBNw2jKMZP2hEiVzb1zSoAlCZQ7RanZDVatw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZkNqiw6vUTaENAsYI3EuJ+JWI4jsAd3VrduooUSdKkikP26bA
	V/TX2DUOlfuyB2Us3SZOS704veHNwR8a4sg9dMWY6ux2Q6hVs1kxAHXQAgdqCQ1di5oRiSCbbmZ
	zxHGmU3DWQlV5mMuUD+ROxAsdF6Bi02g1OV4XK6Sm/M0w3Q8U4WmE5BNJf/Lt2iAOog==
X-Gm-Gg: AYBFou37RwI9ZFsb7CQOPSSFy+xyIW6LnkopDnuUXrZXRTTHB6dpZ7iOM1im9v7iIuZ
	knNcx161uIxhyIzkKRTWzKSfop+aQ7HNlGrDijSoMwbZKIMrVL0dGXQU3OnoSpQnm/IEGrxd6rG
	4/2152Yy0xB/8NqyCat8wqj+S1b4GYv0H8ehaGWfGpUdqCamCLHW/2YD3whZooHQ0ctTGJP6u0M
	pyl7JUGFtow8YpI3+PkWAum4d5hUy7wwNOsZQVKhrx/Rh05P1WphvOztrdAIX9/bF/WxiaR46Hg
	aR8hxVi/rgUb9ygRZkPTv30rD/b/Vr1KKf3zMSQfR4TE0RQG6/h+jJnVT/jsAVEqv+vCnyDHfpp
	jUBRlUmzZm6Y3gTLR0z47bMSciEw=
X-Received: by 2002:a17:903:2445:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2e600510556mr38286095ad.49.1791440336493;
        Wed, 07 Oct 2026 23:18:56 -0700 (PDT)
X-Received: by 2002:a17:903:2445:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2e600510556mr38285425ad.49.1791440335008;
        Wed, 07 Oct 2026 23:18:55 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e606da8fc6sm19674205ad.58.2026.10.07.23.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:18:54 -0700 (PDT)
Message-ID: <41c5a595-7f40-4505-99a3-5041641fb025@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:48:43 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
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
 <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MKmPi87QOpB-3w5bcyo3ng4OLYVcsFuF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX3F1DC7TKdGE9
 k56Xhp4t1NVj/0PvuVLP12l/379yHChx3vH9NPNZSwHKchSq/z0TVYRklCrEAjLfy/131v7Tk3f
 8K15yqTNucBIyQsJw/c+1LnGoIlMHI4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXzf36u5qmXiv8
 H/L09FDw+DjpOtHg0wpTlPYjd29Y1PDLCe/uhyHTl2YC+wpmsrFAyxutY+kNaVAfUIxE/x7T80R
 qLUyfsCw0GQ1MX8IoR7S0wl33BesbfuFxeSWmVlkFp+mle4y8shVSuTJiBR+ssmlv7V9m/xO8/X
 6GYxpDrw/EkgzXbBvMMuZwD5BM8shxfUwIzqLgca0oDTp9kT+MIlNFVaFD2MD/oBsqlPo3cf1j0
 M9tlCB7Behgj/wSrbViZRQLzkOKohSxtmurFAFqJMZmaiVXkCYRHfPtoq++QW+RnKEFj01EZ6kv
 3qnW5dev2VZhex4oSifH57r3IoSBDwy67NfWNP8roZwDZ2d6ZHhr+M8i44xZEMWJhldXh4klS8s
 kiXEw8h8l+bF6wxlupVZqWa80j5P1DHleLY2Tx/DmFF17TgZfoVjQ5ZZBUkbCH4522qkKnkQXco
 7uojHf780xadQL5auRg==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac735d1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=UesLP-FnXeQSrw_j-0AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: MKmPi87QOpB-3w5bcyo3ng4OLYVcsFuF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024



On 10/4/2026 11:33 AM, James Calligeros wrote:
> The M1 iMacs integrate Apple-specific variants of the TI TAS2770
> and Cirrus CS42L42. Since it is not yet safe to expose the speakers
> on these machines, add the headset jack nodes and advertise them
> to the machine driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t8103-j456.dts | 38 +++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t8103-j457.dts | 38 +++++++++++++++++++++++++
>   2 files changed, 76 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
> index 090c97bb781b..1fc74ebf9ab2 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j456.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
> @@ -88,3 +88,41 @@ &pcie0_dart_1 {
>   &pcie0_dart_2 {
>   	status = "okay";
>   };
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	jack_codec: codec@48 {
> +		compatible = "cirrus,cs42l83";
> +		reg = <0x48>;
> +		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Jack";
> +		cirrus,ts-inv = <1>;
> +	};
> +};
> +
> +/ {
> +	sound: sound {
> +		compatible = "apple,j456-macaudio";
> +		model = "iMac J456";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dai-link@1 {
> +			reg = <1>;
> +
> +			link-name = "Headphone Jack";
> +
> +			codec {
> +				sound-dai = <&jack_codec>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&mca 2>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
> index ebddde75455c..d8ea6bb53b3f 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j457.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
> @@ -69,3 +69,41 @@ ethernet0: ethernet@0,0 {
>   &pcie0_dart_2 {
>   	status = "okay";
>   };
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	jack_codec: codec@48 {
> +		compatible = "cirrus,cs42l83";
> +		reg = <0x48>;
> +		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Jack";
> +		cirrus,ts-inv = <1>;
> +	};
> +};
> +
> +/ {
> +	sound: sound {
> +		compatible = "apple,j457-macaudio";
> +		model = "iMac J457";
> +

I don't see 'apple,j457-macaudio' in the macaudio driver's OF match 
table.The driver comment instead says J457 is compatible with
'apple,j456-macaudio'.

Should this node use a fallback compatible,

e.g.
   compatible = "apple,j457-macaudio", "apple,j456-macaudio";

or should the driver add an explicit `apple,j457-macaudio` match entry?


Thanks
Ajay Kumar Nandam

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dai-link@1 {
> +			reg = <1>;
> +
> +			link-name = "Headphone Jack";
> +
> +			codec {
> +				sound-dai = <&jack_codec>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&mca 2>;
> +			};
> +		};
> +	};
> +};
> 

