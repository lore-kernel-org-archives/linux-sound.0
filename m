Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB63377EDD
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 08:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166539; cv=none; b=joLWbbAmQX5Sj0+SyMMRoBLAyisL0TbKjeWeASk1zJxE0XOgQJmr+kO2VqG8wTaOmu3QkHlVAfGciGQiZlMN1uvKQVmptrjSGXtDSG9lvhVMVre98y6xGTbNpin0/OATlYgFtMc31pZtcYzHbpSo3k5q6iBGHejdyRzUWA4XmIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166539; c=relaxed/simple;
	bh=BKPbMz4ymqlyl4qu11XKJ0++jaotO1IK3S+yeAc9SEc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=POx+x2YcTVJHv2Us3KQfhI7n//tM6fU6KWPRqyVI1oYt2uwhVS93smsonUYKhvLcyipZejbfTgWGHQT5RDTKRswX6jIb9NXTNhB7uGQRJ3qdH8CsWzXUxJg0y4KB36Ax/B6j8D0F0eO63KhCtsblNBLi+PkBw8nq1z2v/FrFe1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=U5/Y+yLL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="U5/Y+yLL"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b3637b90so65710425e9.3
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 01:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781166535; x=1781771335; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q+GZxQR0zVGYyc7t6dGL8c2RABIohdt9U+GPG+DCKw4=;
        b=U5/Y+yLL21yPCpPx1cR/Qdw1LhmWCEoAMHqHuo1i4vqMOqPUg8q1YDn0+nnwlQRluH
         EElnGP4vdh6sPk9JrWakAzbos3MllJsNpNRy7mQcwKY4tNGYcTTc6A8rRiBenHrH7YIu
         hNb0LUAiW0TzguVcEh3ZVnM6uuv3C5mYRdRstMUKIePJYF7GPb2pFceFO11nX24p585y
         tALoRdGGGj6/PP4dRSnuSxpsnJ8W0dPXK+Bga+JJaiY93xyFNcSJHaqQTnm++AmCCaUU
         4uABUogWlcNJ//TGg++FLCrmliqIxceoxs1ouToEYzo8XXDpU/w2Erc8q4MbZxnQBfqr
         u2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781166535; x=1781771335;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q+GZxQR0zVGYyc7t6dGL8c2RABIohdt9U+GPG+DCKw4=;
        b=ZWziTj94j8lpZdxD/LJij1nMeTS15TjPqKTQZgy9wZMDVq3AAZBLNz07N0OC/5AcXr
         MR/e/CysOLi/vWBxiVzoFGmIJejGtINypxMh4BPGtcWt2rjmMvxwF/0OZ360Jd7en1nd
         lTUvUkdt3NIxB9i8sEhwpVKoWcPDIvaWHenOSp9cNZoIea8Pobgwo457UrxMSRSk3oSp
         SqBOgMMWVjOGSBu0UxoI9iJfeEJTcjNlN88jyd/Bj8j1KGjvin1w5hxF/eogm18PaWc+
         yb0jTLfmbfQL/mhQWI7aqYEchDxLl8ayFACiDaomPMHOyZdSzAwY03Y4bLsUOMXkBvJe
         HhrA==
X-Forwarded-Encrypted: i=1; AFNElJ/A0H+3glp+mX4DHtV5FZApcO2ys9+1YiQ11SPeuL2ZAOulR+UQx4SYkOZeg/EnaUuaAiIv7BDAvi7LOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwejLdP0/1q7VE6TqPB6R59xpNv/MEWfyh0P1lcAKp+yViBPJCE
	3Ox+40rxAQzV5zedJSi6b1STcaNeI73kydLLCSUDqpgMjqksZUMZfyu/HJhsQYd8DGI=
X-Gm-Gg: Acq92OFHCyUID6zD5HOG3MviD/ISDBhShnogC04o0pVr83LC+4oS2pH5AVg3O3iT/vy
	qw1T+O9PuJJyWA6bYeIfJsjk57hMnlZAr2xMj93YLIaBxwjuYPrPIGtwAbkLUgNpBOUEUPTs3gn
	P9EabiEfjCgOTjw7otDV6OB5Tv1R/hv+pY47EHE/8gFlr7RYI0eKWDPn9Z3oewOQsecYR65kZVP
	P1MxpRXDqp7/zkqSQU85w/Ag6JyEQJ655w9Aj1UkZa3KVSzhbMbE6ZKSZjrIfifwlQL5pbbk8qe
	kQjn74iRCJ3b+Xd27DDwQBajco0ympBQ7LMBjmnmyUrNFByLhtUZuPRGtfc0tDYIT+HYoTA1uVK
	ITTbovIzl3AHECGM9vGRN9A/8beieGG2jYn9/6l40096IHWaWnGL1ruOqSyfDcyFycyqZFwx76p
	H70FCokC0RLLT/CQiAavZ4k56QHu/kMKdl
X-Received: by 2002:a05:600d:8450:10b0:48e:6db3:ff2e with SMTP id 5b1f17b1804b1-490e55dd891mr14395135e9.15.1781166535248;
        Thu, 11 Jun 2026 01:28:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d1b:88ba:5161:3581])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f35133csm75931032f8f.25.2026.06.11.01.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:28:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 0/4] ASoC: meson: aiu: align I2S design to the AXG one
In-Reply-To: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
	(Valerio Setti's message of "Wed, 10 Jun 2026 23:29:24 +0200")
References: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 11 Jun 2026 10:28:53 +0200
Message-ID: <1jcxxxeb0a.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 10 juin 2026 at 23:29, Valerio Setti <vsetti@baylibre.com> wrote:

> The goal of this series is to reshape Amlogic GX's AIU implementation for
> I2S to let it follow the same design as in AXG's TDM. Keeping the same
> design allows for unifying the two platform implementations in the future
> and it also allows for an easy addition of I2S input.
>
> The first commit introduces gx-formatter as the basic block which takes
> care of properly formatting audio data. Formatters are DAPM widgets
> (c.f. axg-tdm-formatter in AXG) which are dynamically attached/detached
> to the streams when the latters starts/stop, respectively.
> aiu-formatter-i2s is introduced as formatter implementation for the i2s
> output.
>
> By the end aiu-encoder-i2s will only need to handle interface clocks and
> enforce interface wide rate symmetry (c.f axg-tdm-interface on the AXG
> platform). Right now rate symmetry is not relevant because only i2s output
> is supported, but it will become useful when following patch series will
> introduce the i2s input part.
>
> This series was tested on an OdroidC2 board (Amlogic S905 SOC) both with
> HDMI output and with NXP SGTL5000 codec connected to the I2S pins.
> This series was also verified using "pcm-test" test tool and all tests
> are passing.
>
> Changes in v2:
> - Fixed most of the weaknesses found by Sashiko review tool [1].
> - Resolved testing failures with "pcm-test" as reported by Mark Brown
>   (thanks for the heads up!). I left a comment in
>   "aiu_encoder_i2s_startup" to explain the fix.
>
> Link to v1: https://lore.kernel.org/r/20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com
>
> [1]: https://sashiko.dev/#/patchset/20260515-reshape-aiu-as-axg-v1-0-53b457784ff3%40baylibre.com
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Nice work. Thanks for taking the time to understand the existing drivers
and build upon them !

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Feel free to add yourself as maintainer of the Amlogic audio drivers, if
you fancy doing so ;)

> ---
> Valerio Setti (4):
>       ASoC: meson: gx: add gx-formatter and gx-interface
>       ASoC: meson: aiu-encoder-i2s: prepare for multiple streams
>       ASoC: meson: aiu: introduce I2S output formatter
>       ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
>
>  sound/soc/meson/Makefile            |   2 +
>  sound/soc/meson/aiu-encoder-i2s.c   | 281 +++++++++++++++++++++++++----------
>  sound/soc/meson/aiu-formatter-i2s.c | 104 +++++++++++++
>  sound/soc/meson/aiu.c               |  32 +++-
>  sound/soc/meson/aiu.h               |   4 +
>  sound/soc/meson/gx-formatter.c      | 282 ++++++++++++++++++++++++++++++++++++
>  sound/soc/meson/gx-formatter.h      |  56 +++++++
>  sound/soc/meson/gx-interface.h      |  48 ++++++
>  8 files changed, 731 insertions(+), 78 deletions(-)
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260515-reshape-aiu-as-axg-1dac9037cad3
>
> Best regards,

-- 
Jerome
