Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794776986;
	b=NqtK2Pr3VanYSRTSqUHUgaqHw/pJyZTKjF/dnCL6iXFu8FtKNTSqYxL1E5iJ/e3XAykJ
	 SpyQOvuv04NzsM/MXPAQBvubQyQ0Jj+8CK+uX/b/csDhIR0nNwRheQgTJC69wnLwztKtS
	 25m7oz4s3amiUERFXsUjusFV48QxdkHHEynb5HLvJgVipg4O78i8GW8AlW73z5kQuqakw
	 +7Dv7H5wkc5VwEYRBNcZJQ241apStr9buCdfFXNbs3tvXir0MH+VD9OYfMXsUf6SYSj38
	 kpJ2p29sIa1moOQEFaiarXyz7UuHCwpcugry44+nHWt821xvQJBtURl4YXfrGgJO2wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
	b=W6dvNZPm1vwbSVkzC9ZfBk1EiCktpF8e7Mt4ORHUOZwh82ZqzYbUjQxlqHmD9SR3DC9V
	 ujDfKUv2Un0V1PcYuLhxSEY7m/RwrXODuNWY9lddPHLa4mGNtaEQlrbTx6fzOSkpkN3nz
	 RsZUnYlWxvh7Cu4gOTRLQyWCvKEuZsNbFdOpmnhTpR0azimuyPS3xzn4I9Kg8tBjGNQI6
	 usQ5yVRp0siAS3Gox06iI+FPp3LeDSLmnLIh9Yp5e69RplVOFfrRirRucVfl5xg8AoTU2
	 zWWRorrYRomq1HxWiEFMQl7a9rF6YyPRb/5g4qh0AYCx97rKD7eY4KoHxT17BOUfRkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Sl1nvHNh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EDC606A330
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38EDC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Sl1nvHNh
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67db89857abso239462d50.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:09:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794776984; cv=none;
        d=google.com; s=arc-20260327;
        b=l+nUC7tlYx+NRvSns2oJEpnDEtn6YkW+E6GwhkwUm96L0Heu838umBbwqc4/ywKrV0
         60l1gW4LMXSqrOdBo4hgIvXVLZ9+LcwkEetjnOvCak+fDlgw4NzvJuE4xdNkkgq32MCO
         8G3NXYlko2Zd5NfEarav5t4cmuv4zQpbQtxdiVWCpquDc4JiSjDtIh94LBCLvYg/jfsu
         2BvOUwqxbkfBNARN3RR6Z+O9rHnni5m+hRL3tt4vdElc3NsgMUL9jRSIUn1SubpR1x23
         kmsmF+a1Wlbctolfmkmk8rHI4nrpULV9PoWFbH9PCyF3Bfjr1YEq0oD7oRg8LEVzl2qy
         pxBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
        fh=gmR9+XbhhyRxAQMrB96JcdSyvT/zsOR91+InPACv0AA=;
        b=r3Koqp11DMY1r7TDAbLHWu0Vue6QnQOCoDOzDSejrycgH1+V268A8NbU19S4iBWj6G
         OHbZ7FWpUaDo42W7dpdXpI/me7H6GsnGEWV6XA2fBKnLFWSKrIaZOvKDKceZT8KBd2wq
         Z53o5eN97LGuLuGwxWlY+IJRwurMGbHsq8GpXs5Eq+dmgsAlE55hRIIU4B7MaxrKvjcw
         iajq+bXJizWLgv/Cckg/+qQs/IL1CdVHezx4m2KIqAYfF6bF6sCEQ4TSkzvpZbOUn2my
         N2dlmBbn/VgyumO+v/hSI2qFMxvD2mw3Q4koxcCtOzI/khDajqQU93Mlg4T/QWQPPxbb
         Le+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794776984; x=1795381784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
        b=Sl1nvHNhKhAgdXV6eF9snxogwmW2KEFXEoeKXPziOPzyezDqEnjQx3TE0b28sh+Z/V
         +zUtEMZXBWIL+bImfjhwOY9EzABl/+THfCGwt+VpR5XQUeu7sb/uXXCDApnXxXDNYRfE
         vBQabVx/xnF0cJVgfBj3S9VV363Q2JmfNtzSPwpluFN19sm79WgEjt9AuobRARUTinxq
         Iuf78MgXoV0suIFS5xhpesJFOkoQUuABV+Tjhn9yI3IIf4Npj0G7kIhlSSbGzw/vyOrD
         gC8gzgQhjpgPTpNqfKRM4yz2Oq9/mGxGcRdndxlJwq9y48BmGcPAJzXkgPymQdDGb80K
         s0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776984; x=1795381784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
        b=OlKnG3XU9s+75Nopo9qNbnilf4QRo/6cbUo7pT0lTMAt1Sls+TR2+Vbz2Ju/fOqNwn
         9YMoqxbwA4exJ4IU4w+ktrChey4sRe9GL8fLq5snVZJ/VRB9KA9QMSMMNsCD5RbZJ6Cm
         UjKOLvvWMzGv3LLqjE6FZqGydNO8Dl9oiisru8tQeKHIUKqWjdJqir7/vnhUMXpT+nOg
         dlONK8FJfO+1jp2NrgW6nKXFPkfYhsMZ1xgzi7ydpMRNG0AtLuhv83P7LqqJ2SA3E7wx
         3tg4NZpVe6eUECp/KinxWN4H5z74WxQ1l8EFjmZ47oUTAxIzi6O1bRk3X3YcWQ1TIkxr
         OAxQ==
X-Forwarded-Encrypted: i=1; AL+hErFc817r1V/tQiG9OKjwvID+zpr9yFhTvAA3Wl187ge7BraYOk99ggb47dci9R6fOlQ+bePwQos0qNCCIg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9O+T8k4k/4Kj8Auc48I9oLr7PHlWKtC6PbE92J8Kz6LSMWXUrx
	hP77ahitSAq1wFr/f3yrRf5AIPNWns253D/uFo9NxInan51sIHP9nv//M5Sn5kN/FVHl+N4/Eau
	arCHngZ8od9LA+FBUA6c9DMFKfLNCCSg=
X-Gm-Gg: AYBFou2mJD0JgvemwDR9HzBTOmkDQ/gIEskE7/oI5+nqjmLDFrfNy/gzasThL4o9gbF
	948g7OkQhaJjoDRgkiw57xVFSP6INl3MQK3Sn3YtuPcaMtXr6pDUEEONnI12Cm74CKzlYLRjVsk
	/V6Y895Wa5i3UlMoLFuMgKHFvIPKyjvZyMH0oEkZddiavyyjs3X55v9ypuqeCn5ojjiJVlkHZ2Z
	dHHXm/iyuk1m2l+Tq8VhL2gEZnb3aibImnW9TxAdzhzGYYuihsBQrvOVZIbso9qz3ijNJiD8Szf
	mi0eHrMD5nRsMULWiIA2U/u8kqSZWqcFiYQPERpY1XKSTiql+N5sJs5c1pQKuS7nAHrD4Ri7npS
	VEHD6LI7qZDBvn9pEeaJbYuj0iI6VzTKGwjU8hH5KBTLPAOMQtik6HO+l4EOaxy/hycP6zg==
X-Received: by 2002:a53:ac9a:0:b0:67c:cd5:f5aa with SMTP id
 956f58d0204a3-67d89731e46mr4496105d50.122.1794776984233; Sun, 15 Nov 2026
 13:09:44 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-3-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-3-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:09:33 +0100
X-Gm-Features: AclHuK_ZuEq6J89mo54PdzP1OnTq4mPljqW6aT-mLz76EZXNOrQC8XCfvE0QC_0
Message-ID: <CAFBinCDB93uLnY9V-tLt4n77Oh5keji=rwA-VNbHm6V8rkYkJA@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> A recent Sashiko review [1] on this code revealed the following problem:
>
>   If a user opens both streams so snd_soc_dai_active(dai) evaluates to 2,
>   and explicitly calls SNDRV_PCM_IOCTL_HW_FREE before closing them,
>   snd_soc_dai_active(dai) remains 2. This skips disabling the clock
>   divider.
>   When the streams are subsequently closed, the ALSA core skips invoking
>   hw_free again because the state was already changed to
>   SNDRV_PCM_STATE_OPEN. This would leave the clock divider permanently
>   enabled, potentially draining battery or blocking system suspend.
>
> This commit resolves this problem by using the 'clk_enabled' field of
> 'struct gx_stream'. In particular when 'hw_free()' is called on a stream
> the code check what is the status of the other stream and then only if
> both are off the clock divider is disabled.
>
> [1]: https://lore.kernel.org/all/20260917212019.4ECE61F00893@smtp.kernel.=
org/
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
