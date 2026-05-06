Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F04421EF4
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 10:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778065185; cv=none; b=M0CVhSXS32YwM4xrRKu7JoQW6T+d6AcE2YTtPpYiefrsvdG3X7DnPdDvqmx1wKVOHF6LNkKp7pQTP9LE1Zb86YTWZ8FW7hhco0pEdHBJ9utFFLtMneHhmaDSdVVIdFmCLkGoxpC/bbSPv1k08NSvi8QJXYtq9efGqEWbHi+jN+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778065185; c=relaxed/simple;
	bh=68tySyh4OCRbTeMjA4Q3ATFLu5St0nhIXSCwG3pciB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TilcxVXgCTixYyC1FYz5c912eL8Oo/OGUP+DasNyDtUiFGTT4wgk8ah3D7CkvdMUxtX9W2g5XyV0ZUL2qFZoZNQkDpvHFp0NfJRhQR1yYXfKCeKO+LPVfvXfRvFgMiV7bVaJ+P0KY/p+aUFlqBy5RrnmDispAdmUKslLxHdIeQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sMd0gAT1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMd0gAT1"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso66280985e9.3
        for <linux-sound@vger.kernel.org>; Wed, 06 May 2026 03:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778065181; x=1778669981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V7mCE4spOzGHm/dSut48qSV7WdMjsy0PphKRPfYRcpo=;
        b=sMd0gAT1FYcCxVNXtb8XsGV9ckUy6x97h2Lv0xJiBypiN5ziq8UjbBjLyajnZncwPC
         VMXrCDkeQrkM9WSpx9Cl8kna/3Qdy6+p+gKSnDPakoiiQVr69sTufEgU9oFFzlnkD14t
         1C414/SVfP/eX48S5w/hAqDsmWWrzLv/5ISmlI+M4mJ4yG2KRWUq/M0gDtG58kv3fiBK
         TsHmur2A4BXfkVT/gtFq25HwTsbYytZcr49xrAoI77hanqQpOLhIo8gWPXATTm0Soh6/
         XJT6RqereGEPgd/9GwjE+PY1eASpNDSq7G/F0uZwV8jjJ49gDkWR5v1leYvz1TWZmsP9
         PZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778065181; x=1778669981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7mCE4spOzGHm/dSut48qSV7WdMjsy0PphKRPfYRcpo=;
        b=JV3DuD+45LVltzEz3pChSYeiYp6pGf0pA2lUSkWA88d1+ARrazP/+uE7qN/YhJB8Yt
         gnbAnjP1MwVHKtRCyhBC3OzUBo5PnB4q9AGG0NfuqtaLCFY6fCRJY+dSMtn1LyttvTyP
         LopEytjUVl5lRb4jiZjgFmO/z8QkK84HzZdscqRn45sQZwmSVWYQPrINnD+F9ghalHVF
         oA9n84l5MC8m0bZW5zR3l/UEFbav7QbgtW1lt8pCGLaFfa1z8m4YBQr+xlPOZhi+d88u
         ImiLTyrxTEAe4HmGafZVFBq/5HBzH/4Beb5U9otf+Z/4ZR83uV675Jff/08qJjF3mKkc
         EPjw==
X-Forwarded-Encrypted: i=1; AFNElJ8F+Tfgjela59cINWxGUEk4h1+Mbo+q6WsbE4vcKOQTE0CSxvDC5BKNxy4tP9TX5OjZGOuZue+GgEc1Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN7SWFcml2k06BE9wWdEleIxAr7eZ52nd/0w1bM5fBA6MOnIhH
	e8Z6wrkEtnrT/zIL7LmSp6Vdr5oxuSida1EWN0e298CdROhEAynG2G13
X-Gm-Gg: AeBDievPw82RPXaSg01w5NvpseE3xaHi5eGux7gvxcjuip7uvuvvbgx8HAhLewd7BsB
	Apb6uFHFUfNdrlj/rz/tBkxcri0lXKQzSom1/+wQlXJudRGSqfI4/EpsqHbKlXAPpHX7X66vA69
	q4O/uamISFKcTJ0fQkP3lt7onzi8HdBuU723MtYg+9ypPKD3JFaT6K9b5/5ssaYB5Aj+Iisw+7k
	+7mIpEjLSb4tPlv29S443oxCA00YSROIRl2V8kPZQTkGyfabIr/x2+9qcovDCVTfyFWhLa36Apv
	Q3GTbX3XGHc3XOWJW5PMI5Xn7ehLoZ9bJokDoV8XboE8Z510WnygDU/UgIzLPY+dNPAOYWUy+bT
	uh19ZjguTmZHUUpLbuKmbo6WQmyfVTh79pktpr4fbdyTaUjZsiCbwXO8U8sF08MokJZY4XfmTrW
	12AwZsS5moWtpURnz57yul432fa9xDc7IEqMbi1VSRBcGM+Q==
X-Received: by 2002:a05:600c:c094:b0:488:b14f:b8ed with SMTP id 5b1f17b1804b1-48e51dd89ffmr38486615e9.0.1778065181007;
        Wed, 06 May 2026 03:59:41 -0700 (PDT)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e530d8691sm31468585e9.2.2026.05.06.03.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 03:59:40 -0700 (PDT)
Message-ID: <115479a5-3471-4f49-ac7f-48da5508ee70@gmail.com>
Date: Wed, 6 May 2026 13:59:38 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arch: arm: dts: cpcap-mapphone: Set VAUDIO
 regulator always-on
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
 <20250122164129.807247-2-ivo.g.dimitrov.75@gmail.com>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <20250122164129.807247-2-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

It looks like this patch from the series may have been missed. Could you 
please take another look and consider merging it?

Thanks!


On 22.01.25 г. 18:41 ч., Ivaylo Dimitrov wrote:
> VAUDIO regulator is used by cpcap codec and currently is enabled/disabled
> by dapm logic, however, when regulator is turned off, various cpcap
> functions (like jack detection) do not work.
> 
> Configure VAUDIO regulator-allowed-modes property while at it to enable
> low-power regulator mode being set.
> 
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
>   arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
> index ea02fd403a9b..83fd58157579 100644
> --- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
> @@ -267,6 +267,8 @@ vaudio: VAUDIO {
>   		regulator-min-microvolt = <2775000>;
>   		regulator-max-microvolt = <2775000>;
>   		regulator-enable-ramp-delay = <1000>;
> -		regulator-initial-mode = <0x00>; /* NORMAL */
> +		regulator-allowed-modes = <0x00>, <0x40>; /* ON, LOW_PWR */
> +		regulator-initial-mode = <0x00>; /* ON */
> +		regulator-always-on;
>   	};
>   };
