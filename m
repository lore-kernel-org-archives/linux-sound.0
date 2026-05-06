Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6906E3EC2FF
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 11:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778065637; cv=none; b=o9+sKwdewj29+U1JU7eu9TcHaW/rDYPOUesrn6hbQFPS1t75jxTP8imuiwy1elfkXdpYsCMyr/lkSn1jl5fnGWkcA1NnQX+/P93Bo2TV8458TkAMleC83ug1NcPuBiJHdq50Obwf9/S1f6RGUWE17qeTKajlea1wBcl4c9kQJ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778065637; c=relaxed/simple;
	bh=VE2loX7GEHkLBIkfThKrvN6f+NIyZbdVKwUIZSotPoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+yo1TkNsg1T6w4eBu1b9n/Xpfqh5tv++kMXOMkhkPK++dO2H5ETYzKk4ujm8Ims0dA/YDG+FxUSxgDTItg2p99q6zfzNJZSz3VMLgoqcs/b7MM1dNRUTeQgTowP1qURbGKdFf/jefAFdz9Fejs61vAr9MHF8uwwlwtbtc++Ri4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyEvSjlJ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyEvSjlJ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a8891febd2so575538e87.1
        for <linux-sound@vger.kernel.org>; Wed, 06 May 2026 04:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778065635; x=1778670435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aSXiRsYq+8taqfodn6O3tOJPun5BIE/c43g1ysDqCow=;
        b=jyEvSjlJre2yiqI/y4H+nmHEwcqNWsZD8J9bzWDM+Cf5oJCuMg/FzlrwdjrFFO9ii5
         UJbxyK4LZ0SbHkNzipLdKBoaxdIMdt+6SC1RyGiOMsCNO0sAZpPBsgyTt4H5dPUrwCtD
         J4zBIAzusHpgp3hgFXkxma3Yy5Fcd3fL79pZxLkUjsYgQ8kzPGsoP/B8dtu6V7G378OH
         XcKAnZNmJ5XyjAKkuNCHCrDf/mPr36ONlA0rVvFfn+LnvYLupSe/E6K38fK8lQnro4ZR
         xKrmSBCxYSlpKvRLGUBMqFEymYaEf3Gwmva2sfteRAKY0lz6qYYClB4piASTMgWDEcN3
         I7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778065635; x=1778670435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSXiRsYq+8taqfodn6O3tOJPun5BIE/c43g1ysDqCow=;
        b=Ow177v+zoIt1e9hntVn3fWC6L4oWc3C55jhfg2iAHbqJKxopBpGlpWym9AWxQmcxru
         YCSGYc8Ci1NIUNhgAKjdOG9LsnJYriWgAc87+x0oqyjG3etI97k4kglis+Rs4/IZsPBN
         TocfDFe2Q7xKbDtkGUNKaq0Vugg13J0FgifTcsx8bpuvb7vl4oYuhIVuKUu+a7FILMu5
         Pz6YlgcOc1YbDrcbC+/gnlQcKvreRyMdNz3BrhaUQG+OpQRX281FPmpJi0ID0YAytNY2
         JqbL4sWJXC6rtNadGtdzK1w7+Ta2fPA0SnWILhsqaTjzFHHLIaHpgpBusqmMbQfCqiXp
         Ao9g==
X-Forwarded-Encrypted: i=1; AFNElJ/aHyQPSRx2oU27SN4rLHAayTi5PH7DlNYLZb4wz252+hgjqLgJc94yBA/5iwFU9T4vu/PP5B86oc3BYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFuvBOEncdzIcQwtqhftVe/AWvHKuVqhfFiaxw5kG2O2VzSzac
	vgamip5hfT5v9XT+cqTTvUdIDCgQA1KGvJFbxKQsTTQ4O8jObiHr3Bgu
X-Gm-Gg: AeBDieuueH0Eq3CYms35RwWJI/soyeFKOczc6VErtWXULiokwGxvbY7dWtKyoUwDS/o
	f4YFTeIgHxTbfby6wh5WRAYBYbIuV8ws+dHXkty28WpWXWeg6bnlB1orgNdgbb8ZslXxTis8Yvn
	S8AIxtsWcQlFN6EBXhy5qvdTQgLgPAPNRKV+krhfNJNwUF22/5I2E0ylFblCuKXEHQJ0TZZnFM8
	UEjIZHhUbtwErHGt4CfEDzSXpvhHkl+HzXPKDCUVANqo2LDH1O0b8n+2Peide6I8J/idX5LKh9t
	Ew6T1JqZ19G+S01osA2IIQsgOB/LzWd4hwh663Am5StlqvSl8JkEql1DItZfIcxS2KUD4T2P6r7
	XCQYeA37x8E/3d08iEa2HH2DWRqPQxURlawqVgt+LfZapI7/CtErpxotIuPEf+RmC7JuZ7Puv2M
	/PcDnm/AJ7rNWAp/QbJ16kDhyX57Ndf9U2FZjLVXrVxDYU4aAOu4L52Poh
X-Received: by 2002:a05:6512:692:b0:5a8:707f:904 with SMTP id 2adb3069b0e04-5a887a9a8abmr1144133e87.0.1778065634368;
        Wed, 06 May 2026 04:07:14 -0700 (PDT)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5a8616598c0sm4343635e87.83.2026.05.06.04.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:07:14 -0700 (PDT)
Message-ID: <5a3615d6-e203-4728-b062-4dc827d370df@gmail.com>
Date: Wed, 6 May 2026 14:07:12 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arch: arm: dts: cpcap-mapphone: Add audio-codec
 jack detection interrupts
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
 <20250122164129.807247-5-ivo.g.dimitrov.75@gmail.com>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <20250122164129.807247-5-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

It looks like this patch from the series may have been missed as well. 
Could you please take another look and consider merging it?

Thanks!

On 22.01.25 г. 18:41 ч., Ivaylo Dimitrov wrote:
> cpcap audio-codec supports headset/micrphone detect interrupts, configure
> them.
> 
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
>   arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
> index 83fd58157579..73e27b95105e 100644
> --- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
> @@ -69,6 +69,8 @@ cpcap_regulators: regulators {
>   
>   		cpcap_audio: audio-codec {
>   			#sound-dai-cells = <1>;
> +			interrupts-extended = <&cpcap 9 0>, <&cpcap 10 0>;
> +			interrupt-names = "hs", "mb2";
>   
>   			port@0 {
>   				cpcap_audio_codec0: endpoint {
