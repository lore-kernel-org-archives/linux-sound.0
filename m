Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392935;
	b=ZJEFSlVi/6bfkXgND3vXKGte4jy0QxLdthb4Vx6ILCa0NCJbh72Kw9nPCu66V/vjlnLL
	 RXMaBSOdIB3+EvK/UQB86XQsveSQYy9SNIftjwo9LSXnE68Vw8duD0r5+dVaYAX46S2VI
	 hBhGRuG1uMUa4Y1uBSd2NEgmRSGLtTFDNE+b+pAu2dX7OJheBreZFz2buYD7dfP3iVdXo
	 U+9dteI/WMEHrd7yf9ZhK2JEqOalhHYB3XKvYt5pkvBhZUXMC1bCY+7SIadk6LEsQq9mx
	 mTLEuDQz47WLf2y25gOpMokOfcud3w78wm2zHPVX3QC3/gANMaXGY9LJsZGbjVEWFcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=S0n6tEIf6xgoVedt+MafTEKXaK+IsDQRgSWIh9QwpkE=;
	b=hj2etbKYdd0gPTB0/46gsrYh2e6nQcqgwaGoUUYLkYMpDY+V99RNwD+l+8ezwh6+BXGE
	 FgEDr3T433NleZpSCKV4UVPFQPNWomP+5ymchFbZ2nriSoP1YgLYs2O/9X+MkFwKEFnPJ
	 H9/KdXS5/ZhLSpDpGbBq3To+lLLnWNvhomEXVmorAdj5l3e2pMyXri4VSTh7ljQLMpj1u
	 0X3WNnZC9AKbi0fq++qddnntPgYntrPnpQp+Nn+3Ea4zBDbGFzbxwJIRPzFLt2pfewW6z
	 Ov14ly3WAempg2ikXvTVEfjskZiNTrLVFjXJk2u4qUZ+knrzUZCrAZIAR3iYfT3nMjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PjW39RcL;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901F6606A32E
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 10:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 901F6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PjW39RcL
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492690dd5daso2341144f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794392934; x=1794997734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0n6tEIf6xgoVedt+MafTEKXaK+IsDQRgSWIh9QwpkE=;
        b=PjW39RcLxzoGvtaKcQYDQP2va3T9aZKhVStCO4PitYqiXI92QH4v+JUentad+6tFcX
         c+UIVPyEMpkFJVvDxgUAmsb9V+25vMtzatHC5XpytY7COKz5m6B2DKxs61dzKDdx5q1C
         IB84sEugGeoLpsKYMjMfSHutuS8Fxg0BDRCbW8oRrNGJ9I9TiLf+yVdiU50A3uGbJxqv
         jTc6W1XJX0b/KWLV4qVe++Ze3WSf/bx7y7BXZWYq/cpGiYtnpIx7WeoFZVUy8LjUBMmz
         ohQRcTYEJQ7qB7CjNPxVVAHw95KNReLbkn0GknrUihsDOgV1LQnP4SGx6bLlmuX26UZU
         Qr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392934; x=1794997734;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0n6tEIf6xgoVedt+MafTEKXaK+IsDQRgSWIh9QwpkE=;
        b=OizIMk+kGuFBy9TU0QugzaH+Q18w4uDqh4UzHdb2fVR7RpkvIzcbvVdItR801aD0Sn
         tffJ+qwAefp4HLjukvNH94kQduZMPjXsHpZRGw8tPszc/5lEDSw+TlD7MHDFjsWQrqpE
         LJ3zhql8V8f4cZe+BwJwP6NpPv1pUPb2wfIeCfHnwkcd9ogj4uehtkuOA7fEjLs2lkds
         y8OQSkXcClCfCXj0rf+T9VFDrkk/qt2dhu0JuifPOxNIlqfbGJfZzpYtT6XXG1C8x68P
         vcIG12J3oKk820AePuGJMSA2AdDRFzXzE0aZswsMv8/0oTl12L2+Ve1RZxoTPgDP2upk
         Hp/g==
X-Forwarded-Encrypted: i=1; AL+hErHnnbjQI0wJ7IohVUk7RyM10U3Xsb9RXEAzM5Xp//N4xnNtDP9GL4jBylitLpL7XWExzMaUBVYOdWYK1A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/M2tK43LdUkwRytRa7MzzpTwGM24/1pAyRxUATngh9BhnlF1Y6
	nRo+ruiTreUcHjqc64SJuayWhQJM5Icafe5IazVKfV8ih6yXWQeTpKk/
X-Gm-Gg: AYBFou1fyTa4ndy4xNw2PfaM3oD0ENnzo7vxmTUW+I6BOgCo2PB5XWRzeOrSi3NlguU
	XgWseLwBYaGKEoEXJE2VKaIIBQyM2YFtPxPASgq7fu2JBRjKf2LFlp1FkB9LO31aXl5DBn1Vogv
	Goj0am2CKNB2X+AEgUIdbTi9vWmqSGpFEomvPWkjAl61ffVAhAk0Iydytnoodr6W/ZfVR4Xkb5o
	tQvCICbNZTAtC28pU2q21t5gP20UF46eUuDfAJOKNuYhKIwHccW40a+9j4cdCnxDNLYQw+S1XvE
	PVMLXTMt4O1kpJ6JSIg5KTkJBjDO8Q8u0MijsE6wjkp827aoUn0mD/QkejGP4KnHmdUfGr/8i8B
	aVQYL354o0n1TUPHOrSFiYYj4/ZaAfgM9zvkiGnrJqzHA+t52iuXoU9OWv8ZDdERebqygNewixc
	NM9cpFNsSCRNboZ6nPhim8AbAnXOBucHdU7gAUUwBx7mx64Cl2Tg1ZfdD+nEb/qEk0i8tFHwBR+
	SCeJdTbzvK8sB/LW7xsZH5/AT1zDmxF9tMpJjh5qA/7ZJeZOFbaBJ6Ed9DDShWU1KnP2SFMyjc1
	v5xTWj5v7UnMtbMm2BPdj8F6hWgAURg5Yqw3y4uPrDfByE8AxMfXYMquW+Se6atBVkHIV6UG7Wu
	yX4s9NlE=
X-Received: by 2002:a05:6000:2201:b0:48e:5cd4:aa60 with SMTP id ffacd0b85a97d-499c9dad952mr3537266f8f.42.1794392933785;
        Wed, 11 Nov 2026 02:28:53 -0800 (PST)
Received: from [192.168.68.73] (host-87-4-46-207.retail.telecomitalia.it. [87.4.46.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm10342588f8f.10.2026.11.11.02.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 02:28:53 -0800 (PST)
Message-ID: <a64e2fa1-6670-4018-80b8-b6856709ad5f@gmail.com>
Date: Wed, 11 Nov 2026 11:28:52 +0100
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
Subject: Re: [PATCH] ASoC: soc-core: reset rtd->num_components after
 allocation
To: Kees Cook <kees@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, wenst@chromium.org,
 angelogioacchino.delregno@collabora.com
References: <20261109102536.357134-1-ghidoliemanuele@gmail.com>
 <87bj7yw9e2.wl-tiwai@suse.de>
 <87FF4A7B-853C-466A-AB01-2D9137DEE6CC@kernel.org>
 <EAAF07EF-6B11-4EA5-A5AF-A7787CA2F196@kernel.org>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <EAAF07EF-6B11-4EA5-A5AF-A7787CA2F196@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/11/26 06:59, Kees Cook wrote:
> 
> 
> On November 10, 2026 9:50:08 PM PST, Kees Cook <kees@kernel.org> wrote:
> 
> For example, what keeps snd_soc_rtd_add_component() from overflowing that array? If you want to protect the array, add another member, say max_component, and use that for the counter, which gets set at allocation time and protects the array from indexing beyond the actual allocation size.
> 
> 

Hello Kees,

Mark has already applied the fix to for-7.4 (d00ba321499c). I agree that
your proposal is far better, but the applied patch was meant as the
minimal change to fix the regression.

On your question about what keeps snd_soc_rtd_add_component() from
overflowing the array: nothing, and it already seems possible today.

From an LLM-assisted review of the code: the platform loop in
snd_soc_add_pcm_runtime() adds every component that matches the platform
dai_link_component, while components[] has one entry per
platform. On mt8173, for example, the AFE registers three components on the
same device and the front-end links use it as platform, so four components go
into three entries. The extra store has gone unnoticed in the slab slack, but
with max_components as the counter UBSAN_BOUNDS would report it.

I can't work on a follow-up. If someone picks it up, components[] probably
needs to be sized by the matching components before the counter is switched to
max_components.

Emanuele


