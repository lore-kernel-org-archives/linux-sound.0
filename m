Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DD71FF7C8
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084928; cv=none; b=YocwCPi7q0KjwkzExxnZ3Dk1sEXmfHYMgjkTly1E2Z5m8t6X4hUwHZ+kWPwIjhUt04GLX3xyfprWp5LlNMgHVPFsneXSAQalMPCBQzK11BLexBy90tlwkI4yP/+pBxjMDawSzMCSg/4iZH6ChbR9Z61VkutUuL897mCJRp+FPw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084928; c=relaxed/simple;
	bh=ZzO+DwR7u6GHE+PXoe2AQYlkIThyL0XtZi9T46yjKhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OxbbNjgxvKxWSL61eqhQDzyrZ92jPxmMr6J/yNhIW3MNDYkV8DkX2oZlTT6kf26boIfKG/OUjyE2Uiro8OpGDxrxjftDhfIKApBo8pHiZESpSUgZCsG3T5RapRtRf2EX4zky4OHvTCcwWnHmISyAWM5neAo5TpvtNGDdGNvL5JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bZcJwwjf; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bZcJwwjf"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30b83290b7bso63387441fa.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 02:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741084924; x=1741689724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B53w3MQPaxkNrF0zClZsbBbaKHU29woPD5v5NTL/nAY=;
        b=bZcJwwjfIAfy89mwhuzT2myRhW0GeqVEsu5sUfyFB1q/mN0znFnRIBIzh//Lsveeq7
         XFjc2ybfGy31YMhPRgwmURZ4r/MqBTInIxQnTKVPPvw4wrN0sdmBvOdwaQVEX+dZYcdz
         w5oo6MDMW87lc2B35pDSnFqLllvrYayIMC21Xv9SOtlI/HFXI0O61bJB/1MN4fr0/9G0
         vWMxFkYQMrTTPA0O5ptZkTGhs/k18UevcCTHjG5JpOg1e81a23RSzJhzznAIOIg1mNDT
         V9h3EVAHWlJ87L3qncnJWV0A16mlD3UllQL9qbc1ZiTqsvKJj4IFOjxs63cgrENDkKX5
         ccAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084924; x=1741689724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B53w3MQPaxkNrF0zClZsbBbaKHU29woPD5v5NTL/nAY=;
        b=QqlgVRLUPDp1rIRBZJG+hJCor0aMDcCMu67npt3K1oyqaE9Iqq62OYevQY3VxgVrjZ
         KC8ES6wJ3m7dgVbWKKpGGG9dDHre3Y7+EWyDkosR4bUGIwoHeCttQkOUZPMWhq8B3Xv2
         c06vgNHfZ6MnZTcbXTk/Fpa483+9UhDUdIiC+jEQt3+2PGTivrQt0cQgQp7FFOF/Gxaw
         Dbbc2IAxoB/RxSlVPRuWi3KMcExbOibFENHeOEiBDQD1RJ3MbK5DUC/4jAEWSbw8qZhj
         U646/vwbCi5XC783izPe5hrIUmwvhRNC6URTHnOW9Qt/Os1ap9ofbSwnTQq4XLWDqhid
         TCWg==
X-Forwarded-Encrypted: i=1; AJvYcCWCubsIRvBB3O3RlGN08l8TrlThe8xsjdMT5SYcbeHzb09fMB4HmdPzMs4QKMufhKLfXvY3wGkh6ErFyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOwrcsOBHkS7BBDPz1zR3reqVVsWe1mkwp3D3Bu+652lJXyM54
	29tX8rTbqajChlW2gwWEHdXPyZZAxD92ZAXq4bl6KCEphqvRRhIjSAUP7FWw9zUYN/6Cs4Bkey3
	NzHvjxr0OGn7zmrq/G8oTNGj1iH0mbD9a36bW/g==
X-Gm-Gg: ASbGncu9vlYGl92SMf0FpLYkRv33t3lXZJKSMQcvR0Rd11WMRBitja6nEZf1tndgkro
	XWjFdxEs0jJhzyzXC8iBmHXeTNL5sIpFTuLPaC00SzpZhpbw64brdKHsYSzRjfuIJgYT+dIiRjb
	VfPYBvvEfOVxJ3jJM70/22pxO+qQhjpiSsS+4BHu02wY5owJ3iZM4CZf1k6Q==
X-Google-Smtp-Source: AGHT+IFjk1UnA0sx0Kef7boBRo1bABdfDdyjC8ITpkOL63KQEFB5T3AVF3JlEQ15FCRpk+EGUuIFoCvwxuTHq4w+81o=
X-Received: by 2002:a05:6512:3189:b0:545:3032:bc50 with SMTP id
 2adb3069b0e04-5494c320d3cmr6862388e87.19.1741084924101; Tue, 04 Mar 2025
 02:42:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <20250303-samsung-codecs-v1-2-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-2-56a2299dd928@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:41:52 +0100
X-Gm-Features: AQ5f1JqqeOex0JCLsht-e_FnDn4g_HMa-cLCOz8gTdBj2tCIzQrrIWUji1KdsEY
Message-ID: <CAMRc=Me7kcLvYPgRF38ahNtq4J0e8yHPRyd9yMnsjN4dB7Y8Ag@mail.gmail.com>
Subject: Re: [PATCH 2/6] ASoC: samsung: littlemill: Drop unused include
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 9:41=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> This file does not use the symbols from the legacy
> <linux/gpio.h> header, so let's drop it.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  sound/soc/samsung/littlemill.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemil=
l.c
> index c5260e101c2a136001c6273200fa35740e618829..9fa5e3ff9215164491839d6ff=
df499a3eeadfbaa 100644
> --- a/sound/soc/samsung/littlemill.c
> +++ b/sound/soc/samsung/littlemill.c
> @@ -7,7 +7,6 @@
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
>  #include <sound/jack.h>
> -#include <linux/gpio.h>
>  #include <linux/module.h>
>
>  #include "../codecs/wm8994.h"
>
> --
> 2.48.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
