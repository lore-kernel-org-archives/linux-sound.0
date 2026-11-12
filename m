Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794524742;
	b=P2UBs00KHKKI9EtnbY39MmH4t3sJFKHSKaK8EWrfMGI6WZvG/PBrnT5z826pq57Z+At5
	 pWXIVWAFCzNqJCetr695AUQ5YwPgDiUw9NvX3KZa/hgCuSNncIF2IbpqZjxbgjQCH+Xsy
	 Kh2sM8HEp5w64XdM0aQ9r3f4qG9PpDvlztIq4RWDeRJhSRidmLLM2Mdan5v7u6jpBL4az
	 kRR3sCdtvkIBXDKl9+VYXnXXfYxLjhLLm0vphmgvRWilZwOjIeHxw29Th7lA+bmarigtU
	 dd+4V+HXEYvtwx0A22UPUDGpKZKo0RJOb53Rvt9BNLnADstXVj7S/p9LKiursAgNjpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m3lRYJaSOF/Piz7YAKasak+99H1rHlRMQKrkdBErHvo=;
	b=U3DRKOYp96tAVlz+hR1gUtIrV8KbLbWCj7Le+mMqjqpfXCvZiXb72ZfcGnNb+g/IsZKM
	 nRqhAwFcXcXQ1wUQkEnb8+Kt+UX3F/DQ2tKZ2pJMJ7zLDWBl5HdjW/ax80ytBnAaJ20Ld
	 oZPeryGlNLdtcHIJxgxgYMrwp1WD4sQ221296p8jRD5Q5OZzFWyyvzpQwMrFFvUZVD5co
	 kzSIhh/A2oDQSKwDTUNSMbTbKb1rcsIJY22QemPTpL83VgdNPb1GNSy00GdMxBrgh6JWG
	 oB74ltz3t1SyJbhj3S6jT5Srsf2ZSLPoXAbuOoYfuY8OT8lz2kC4Qcf4d3B/dwAP8IA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="V9KihbU/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E061606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 23:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E061606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=V9KihbU/
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67990a45e02so333397d50.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 15:05:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524740; cv=none;
        d=google.com; s=arc-20260327;
        b=hrFqDfap9kTA6StPapQxdR3YxzsBM7PUcKQdhsABj+TAOb/yisFelPTLCYHC74Av5w
         USR0yEwaLwC7wl8V6HMzlIz9Fxm21ASMMk6Dc4ffZpxITzZkOTTXQilwBF12weKbbt1X
         gsigBrw3HGe1B5BVrwcCICPlzYGEmO/ulATf2jyoRn42TnEbsQiQHO4wq4pgnOiWCdNe
         ImtzsQaFBtncOjR2olQAS/htEIYq3ni7a4JULEPnhbaNNCJKqb2ov18Y7597XbolApzG
         4plgdAa9CU0ME61YwY1Jq5vrWehkAJEumxuGmadC/WsXrBrF9pDj4WDy68h2GkagChU2
         rVeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m3lRYJaSOF/Piz7YAKasak+99H1rHlRMQKrkdBErHvo=;
        fh=X4NSQvzWvc3JltFFon/EFGrnaCPsgwBYigoQGaVG8KA=;
        b=onD12ZcC3wnNf4/Do60DW3G5F+H21kpSrbZG49S6X46fBT+j+ygw2/7bE5y+1Mwy1U
         vJIYhyCF6yc2GxY3dUFPl89tOZsjtvL720kUYTLoLCpmaqcEVm8ld6jqa4n8Gg+YUBks
         xm7vIjyiaV/2AztQftuYey1hojam6r9OA7iClfMp73kJ/n3s73jU513uanuwkPHQqyl3
         JZbTTtKvs9OAlnqe3zicunjF4ytC39IH9iPp8u8m3RDZ4ni4vkfMzHU2Io0god7zG8Fr
         WKyC7xvzIseWBJHCb+APVr6Tpo75CjmeUHnGu5IWT4VRyBd/B2A2A+wnd/FwEL4STfBc
         9nDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794524740; x=1795129540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m3lRYJaSOF/Piz7YAKasak+99H1rHlRMQKrkdBErHvo=;
        b=V9KihbU/syh/zuEgYGPMEHg6J6Vu4kmxiIuYn7jbGDchBJhRC7i4e7vjObIe62q37C
         UIC/dMNeWWvj0c+Ri19HQnuAC2N0EukgIrIVe/r0tVig4lDDtfnTvT3GNjcCpde6ZA6f
         2fBbb2gtKgh4BaexjI2yq5YgM650evdgpb0TkveeDvetGH+afD39FAmg2i3UQG4hhp2I
         Yu0jRBZZ0z8CgZrW6smwAhhQyQN5QLWvcxyzr17DRFkBX4LsBpmldne4gaDQTTIIENEI
         FcD46LmU5atdzZg7QfzDPlgqbbSxlT9baEiWwsOsGqCnc+d0FUoetWZQx9oa0SScngnm
         w0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524740; x=1795129540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3lRYJaSOF/Piz7YAKasak+99H1rHlRMQKrkdBErHvo=;
        b=Ij3yN9qB0Wn7aKsIX0imCcKNN7WpgoJntRye4L7gr4IOJ2LQ3zNmfe/yZIezTfFNni
         s2k1+wDRq5bztgf9iBhOByc1T4j4FPcUdB3H6r14DIcwmQ3vcsJ7CB+/1gyspOowX1IW
         iw4fziJYAytp2R88mA9sPx1FPnN8eYEL0Fm473w+oUeONntUeMXgulQFaApSP6YryFDZ
         OgTVj61Ljq5tFiF+fjRWsPcTN+CaGLV4O8DQQGmg1rRVgCm7H+PFutdD1hYzXaHnsZTy
         ZzqtDLHssN99mrYtxvEKnXjyMYQG9r1xvQwSQqcqAzOG7YgEWq/NumW090tPldqRpCFW
         Wamg==
X-Forwarded-Encrypted: i=1; AL+hErHykyf3LN+P9EBlfa70TGQk2u7FzCUNMvu5JV6o1hGptp+fFc8cpmiKIBvUvKie93fAq3FUvwNQ97ixWw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8HIbokbQJMgx3w83Eejqn8ARMCWssdUCUgXsOGDtenP1k5WQDT
	9HWjBFPTsm0U2RWkovVc7N7KKb56u1kElZY5RLFKC0Z5UwWNyv0WjxUTO3k7i7EuRXzn5u9vAKJ
	Xtm0A4Uk1VdYPLNDhAtQoew6D5CzbtdI=
X-Gm-Gg: AYBFou2cIqd+unzvoseSGyf1e0Lvu6H7U/WIog3fl3CAFP/NQiCGcPCYJZIBstmskHi
	fehOFRksAGmTVxnghb3LlnrvC1VWQCpskrCEkyJbNAYKlx+8omNcFvM4iLZDh2xczSvy1HiRuJU
	0GxvrrJdFOufxTg/ppJTSAedZGVE6uGHI6A1edGSGK/gR0euvg4PuFGG+dc6VkuiZoIHxOso7Ji
	kBVZVynNGNA1HXf62ckYVCe8laz99d0nUqiYdXixMhAjaZucSov+ATCmu1bnetQ6lDzTPeRhpqF
	OpGipYLDA6mviQ2y2Cp1u8O26rsd/psypkMPgHnq3ZrpRwrQrnLXxqsUPwPUVeqbVLsh1wzprDj
	z4G3fTyQ21DSPD+XrN4GA/wvLiHdicNJq0Rzhhop4c05Q1INW2RP1lQ9YYLOLxqcJCac/5w==
X-Received: by 2002:a05:690e:4506:10b0:67c:1aa:2030 with SMTP id
 956f58d0204a3-67d897be561mr407000d50.67.1794524740366; Thu, 12 Nov 2026
 15:05:40 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
In-Reply-To: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 13 Nov 2026 00:05:29 +0100
X-Gm-Features: AclHuK_8bTUR51TRXYpLvWTsaJ7E1LH3kcGSVltDcpyem9ID-KxpWLn-7OZxH4w
Message-ID: <CAFBinCBLK3Ok7QpKUVT5XtOqDafVzGP2Tn1oBj3f=PUQ_DgnwQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock is held
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Christian Hewitt <christianshewitt@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:09=E2=80=AFAM Valerio Setti <vsetti@baylibre.com=
> wrote:
[...]
> @@ -37,8 +38,11 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_comp=
onent *component,
>         struct aiu_fifo *fifo =3D snd_soc_dai_dma_data_get_playback(dai);
>         struct snd_pcm_runtime *runtime =3D substream->runtime;
>         unsigned int addr;
> +       int ret;
>
> -       addr =3D snd_soc_component_read(component, fifo->mem_offset + AIU=
_MEM_RD);
> +       ret =3D regmap_read(component->regmap, fifo->mem_offset + AIU_MEM=
_RD, &addr);
> +       if (ret < 0)
> +               return snd_soc_ret(component->dev, ret, "Failed to read F=
IFO pointer");
As far as I understand:
- snd_pcm_uframes_t is "unsigned long"
- snd_soc_ret() returns a (signed) int

Doesn't that lead to a signed to unsigned conversion error (highest
bit set -> large value)?

axg-fifo simply discards regmap_read's return value.
That seems odd at first, but knowing that its regmap is MMIO backed
(same as for AIU) means there can't ever be any error.


Best regards,
Martin
