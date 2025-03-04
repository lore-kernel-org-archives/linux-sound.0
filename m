Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081F120012D
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 10:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084938; cv=none; b=vDt4ya8iY36zRjRO/JGOTVbhuwjuUD9W4jsJgih1+HjTBWpNZgcTjw6eAZaNJx3Ucp3gvS6cFtsPEKWTNo6noUczfn4GckhlxKKwscYmqzMkrcie8wYRDwF7kqC3XM06uYhcSpAvZW+ancxrXOBPH7+o6BJ5M+dUOKrsdAOsjv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084938; c=relaxed/simple;
	bh=pmAQpHbC8wArVsFRAQpGnDIhYMvnon9jfmpWKrRxfSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4/MbSO6px6HR2rKF6ENBnwVVkZDiH+3Cwx1zwM1ch+8nJL7Vj6U4ouk9UtBQFY0in7Rljeo2YV1YV6sPm11d0si+2pwoBqPB/odpg9frE5mjtNI3RNLpsC1JzBBiQN3d8ZH8Z601YnnVEk1mcaqPYG0ajZ6AcugcAN8K+6ptuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ccJuzKzn; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ccJuzKzn"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-548878c6a5aso6006885e87.3
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 02:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741084935; x=1741689735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3K/LcKqtOkyKdbJPvYlfinf1m8ideZSsXyRIMH0tEQ=;
        b=ccJuzKznzRGDC5rZMbNHCdnlLWlqX3hB8lVJNi4hVNzgVJeFEYeb+NDOS7ONq7Uccu
         fLL4aozcde7u1lvvvUKLT2Rz/aToFRDHfa8j4imNSU4M+JZN7dAuYleIRwSK/vFnO4EU
         RZvcGkZHaC8/DHnreabv9HsXLo5Qcoml2kZ6Bhv6ZSvuAB8qlfavduxvuK0SOoA3sc91
         otH0qdfIPfH35GPHm5JGVJ180cGLtBQBFTKKSDYLrcxD87EtLS2zJWqeHdiO9nLoAXL5
         I5w7Vj0V0UPWpBD+O4pVpGuC40kmN19vWQ7a3y3sJ0qt7saoxeQCBACOqhKeXLbGBYKe
         XLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084935; x=1741689735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3K/LcKqtOkyKdbJPvYlfinf1m8ideZSsXyRIMH0tEQ=;
        b=mwTGirWxV7VDnSxKHW2Z+iCp5xEXoI5jrjrfvl/T/aqfEaCBWTDkSST+oKhzEfYIny
         APg+McEtUVhwLUiX6KmSJSq9I6WM4fX67UUEJ6kiyLUIBrBJXQyAU4SrTzpcM1BTA3xV
         F8Ps4KKpVUpC4N0wSKKcfyaBHpvJf7inKYbIBMEQCzuLqOv08facP8+5AUzELPug/SYK
         +eHKZWhCC4+P6OnmfAlANmZNPygIFZQQnmiVwvl+tZYK9TWSGytjqIqCiEwl7kUU8Ydk
         GXRLrO78teH4abyoZvQ83PmWTQggTazy2YPtiS2s2OPzL3jU9fgt6j+AFUGKD5I8UgWE
         Fa4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbeCtPblLenb+37ntX3rBriLodogfh94ZPsu8XrzjtptAijCxGNICljJSIm9K6ynLXS3kXs5yH8uuIaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+rCXT0v2j1NAOMSvIDiWuW3rANT5MNJ2YeJkP2qm5/KEFi5qd
	0cHLF1GT80Bw5325nnWYKB5y+VTz1nyU703vGlbwLb1fImEbBCIuZ0C8qRpLtH/n1Qc+QXssibg
	HtVbsBfjVKcnRRqx8kZpELXhqdGHw2f8ZXun7Lg==
X-Gm-Gg: ASbGnctOtCgvAQ+Q3R92GtAB10WqQzwH/8Mbjczy3WlDgOreH+F9zi17HJXKFv6p+rZ
	dJHjaACbtREcP900AznNgOgLUiVi61rFknSXQaJJB0de/0BOzSGkH0hdA0GwM3RLMqZHL4AinGG
	CFGQEvVWc580vUcIqds/9AklQrpihnKNFHUK65QG3QXliygWWcPbfmx02wtg==
X-Google-Smtp-Source: AGHT+IGDNSudfFFzjYqFrM8y6kc064hj36m920RZvLgMZC0Na/fCdcQtaQhlOFDOArIsQb1iaYRQKjijvj//5BehIcI=
X-Received: by 2002:a19:521a:0:b0:549:4d78:2418 with SMTP id
 2adb3069b0e04-5494d78261emr5767689e87.27.1741084935146; Tue, 04 Mar 2025
 02:42:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <20250303-samsung-codecs-v1-3-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-3-56a2299dd928@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:42:03 +0100
X-Gm-Features: AQ5f1JrCOkNsO-_LmSd0i-zdQ5ywyJGyS5xBtupnKd3oNTQMfbL3qs4qw3hPkug
Message-ID: <CAMRc=MdqV7bm+zbi=mrBhS0506CTXOn09=rJj+pR7RMYmhn-MA@mail.gmail.com>
Subject: Re: [PATCH 3/6] ASoC: samsung: lowland: Drop unused include
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
>  sound/soc/samsung/lowland.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
> index 702cb4cc1ce9f07e55ddf9435b19c4691e0236e5..d4088b72d43c2295102d85019=
7f8b9eac50d7120 100644
> --- a/sound/soc/samsung/lowland.c
> +++ b/sound/soc/samsung/lowland.c
> @@ -7,7 +7,6 @@
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
>  #include <sound/jack.h>
> -#include <linux/gpio.h>
>  #include <linux/module.h>
>
>  #include "../codecs/wm5100.h"
>
> --
> 2.48.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
