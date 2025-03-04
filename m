Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236B51FC11B
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084915; cv=none; b=KJrZxO3zDbrXZ2mlpO+bMA4TivtKm+XraDlDTJAESDRCvD5OI4eK99FTJhYVUol6SCpIFNkNMLJtj8hTwMZs4f4IPnd1KcWElcHW61OFSr5CinHYsA4yQsx4vzDhXKjWdNP0cfKiG+S4nx/RVsHjTxQEg3JCo5HxIofwa/qbglU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084915; c=relaxed/simple;
	bh=5eAsQdrocIwsuEZIEV2Bk/wteURhMPFY7Aeo37o/jJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxiaUx0g+K18IU7KvYpPyyQPsU2ZAKywTgZU2kvi3klAVU9kljIjbbxC6JxJHDi9QEVcCvvJccxoc+8GpdTtDMVGYp4NVbrS+wIFpjkCkgIHJVbhE6DCXb8f9A08J8IBBl+9XaSSGsUVj5uCuriRrmVBAwd6JOmebsJcDnYkxF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mRXN6/bR; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mRXN6/bR"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54957f0c657so3881728e87.0
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 02:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741084912; x=1741689712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+CLe9wyo94MK43cR0KkLcVm2hrSOi/FbrLlXKM/n+c=;
        b=mRXN6/bR1i4T3/VBrnDcfW/caVKxhkYUzYG3l+EQE7aVbuo7VSuRoVH0lhy1LtC7Vt
         dPDI8/GavowU/sxF3iiJSVuwFmqH5JN3lqvkcAyeZ76ahL819BoVnJqww6M0pxG4YnJr
         tZ4sZEe4knfmZNnLz8eEYS0oqtU/C4C225LH4WEv4fMJoT+Cfoa0jCgE7rqF2QBgeDuU
         iYjzGCvkY2ivIEo+i7EMHX0ZMZ3u+DkbXARG+BmD7D+VCjAHtHmk/6j7xpt4FNA7BRli
         sHRBQHadiE/j3jeqLQZSKzca6Z3WR0zqlTi6RH1jCoRe9jvgNiL12ETenLOTeTbj8Rmi
         cSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084912; x=1741689712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+CLe9wyo94MK43cR0KkLcVm2hrSOi/FbrLlXKM/n+c=;
        b=PHrizsZjGLvGGOdAtirVjivSGcFXGw1JpfTz7X+St5ZRZWZtFfuGbJM6aHeqDqttnL
         Qthf2c/+45QOBibSOvmKjJ27xMvxpwYrb1l/YKric8wJBduz8MsWX1g974yUg4F4GKvF
         fqweVNYgQPMOycBuMAfH937P/zDAoHZ/a0I0WJKL/iGqd5bkjuXOdg+w03kUgXJztXXR
         4C2lrhnodErWF6kLTXkXj2i63UYrximBXgLmW0WyFXO8GY5XhhC6gfTjOgJ/7vBNm2tp
         xcUV2R5pPJcqJz7oBsvvCMHkkFk0C5XAielwpe/ep3qPyefKXzjvH2dXr8K8rR0nAT17
         L6Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVx3Wp8TOCix+PsCqXJ6Kh9Eflz5NMV2G8yNUf/n91Jn/44oB/yNdKx5y48YXL/EhBAYvK4ILOEkF1U/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRH6lcHaxdHCTwXzce68h18+b7HhJ7fc0Af5VNYda+/CJ/0maU
	eoMnIuGlNHjYaOcrqThIw4svm14l8/xZjXaZj/tG9EQ97Y8V8nxrDcD4yqdXXfX/DyxTMEByded
	9ZSenU1fEBJ6BTj+2YXMh+7iIVIqf5YgvCngwXQ==
X-Gm-Gg: ASbGncsBYBbJxI1PIM7CkjX2FvMC8c7z7EKidsOBXBodgVmpO3n53b1nNQnWCs4Wtoq
	rC/a79/1yNJAkg9B/qKGNl+aht6oxlJbAdrN5gChYVP49jvOSSitr6iBvqJVcTXI6ZwyateND1b
	TQP26cAfj8vq45oTy/odifB3A5pUiM3sE60G5GhGUVbYqICLu332WwbUpwRg==
X-Google-Smtp-Source: AGHT+IFW1dwugcBOwVBAmZrS6CMIuhv8KAFq4W6OW9+G0v4HXawDePl2UapUTtV4ZF3rFz9ZUUYtAhog6ikYaHBlhNI=
X-Received: by 2002:a05:6512:a93:b0:545:dc8:9376 with SMTP id
 2adb3069b0e04-549756bb8b2mr865753e87.5.1741084912286; Tue, 04 Mar 2025
 02:41:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <20250303-samsung-codecs-v1-1-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-1-56a2299dd928@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:41:40 +0100
X-Gm-Features: AQ5f1JrTREE44_9-N9d1KpC5QVfqU80Q79Wuacg5Co0HVa8QMpwM4g47c1JzBGY
Message-ID: <CAMRc=MevrFnw4BGRgwKrg+wj+saEmVmk+diGj=+sveE2P_hwYw@mail.gmail.com>
Subject: Re: [PATCH 1/6] ASoC: samsung: bells: Drop unused include
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
>  sound/soc/samsung/bells.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
> index 365b1aca4855c885e0b59a1101475d8edb86374f..b4c0857ae35134b58a125b074=
6af07a5fff040fa 100644
> --- a/sound/soc/samsung/bells.c
> +++ b/sound/soc/samsung/bells.c
> @@ -7,7 +7,6 @@
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
>  #include <sound/jack.h>
> -#include <linux/gpio.h>
>  #include <linux/module.h>
>
>  #include "../codecs/wm5102.h"
>
> --
> 2.48.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
