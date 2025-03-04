Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC0A1FCD0C
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 10:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085128; cv=none; b=gaIHEWetohbtzj48ip5RLZAvFGoiZn0KxUgAYpA6wWCpzEoCeUGVT4/6j9TUZJacV8gdOVbNSedIjpjF0tlchXiZyuMN+kaqN1333o4Uet+lr5BM5FWiDc9XjjLgPowpw3/b54HiNCHq/Domb0sH+V7WFgIiShe1CNygDFwZ6S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085128; c=relaxed/simple;
	bh=lpQOVmqdm8Q90U0dBkxHkIPWtveykQpDBnR0VAapH/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I8jNdsGW1YWEU1UJAwyjQodHNNk0a2x7324+30aZxLyG1XWew2kCBQ6+Kl+Y9hIZMEcc+f805RKlG3gE2HoGQHJmDjCptca9SgDRhuZxMoADwt1kRX+PSf3SND137CNBobcYc6bfXuFCE8CR2piQl6fiFgfqPFtfp/8krlEh7yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cag6nyCV; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cag6nyCV"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54965898051so2186391e87.2
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 02:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741085125; x=1741689925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epMSf47ns8yAb3YJF/FdVNBVirEA8Ks5JMLAsym0/0U=;
        b=cag6nyCVnfb5VR23envd/mG0wwHBnoQmTLyMSjb+ydG7lIdhi78HSIyiRRy5p7a10s
         fNE5DZqiZL3VdV+UEpRsvLA231k626B+Q471KtYneXpEk5LEYwh8FVVyOEH0XKjg8Kx7
         o3p1CJ7/ZOVvjw9pdeQU9N/piINq7InUA1USbQtBhZzhZ2IIetsQV3eosQ8l20myJVQB
         OeuJR6ClvrhKOI5weNn85mzbLQHv45HgyyJh0FdYLOZFVg2hp76IVyBy6SDKP/pEgoGR
         fO7BSAb3ySOwc81/bFxY7nObIDAeyh5E9Z0Ys3tsW4Cc9z9cbH+MiZ9X642B4QQr9qdu
         QC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085125; x=1741689925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epMSf47ns8yAb3YJF/FdVNBVirEA8Ks5JMLAsym0/0U=;
        b=slQ1Q8YUqjx9j6TfahoheSccvQt5tixli37gxbXJEG5KWV793rNySb/o+FpOZ/oiwq
         mKemDACg4VHeWXIDRFaK4Ae6OGfyRBjCwEBUhKsCm3gBJ3A5BqNMHE8K9GcN01rvZ3vt
         9UyZwBybo7McPuz7iX4jjkSdYdGg9A5iTjk6JLAurb3w7bkfBN6WFOL7i4OUm0uWP+sa
         9eZf4G25ElKWics7e/ipmKRnkcbJezaAwmisCseVPoLrZE00hXchRm8CThSnvGxRQinn
         aeqJa01rrCeLy4QHBDyJX9R8eIaxe4xk8kAhbyPqgOpFplik5I/Togx3/UgZXdjmXZYz
         uRPw==
X-Forwarded-Encrypted: i=1; AJvYcCX6WantlMpyj9bE/u+byen/Qwi8ihf2MR5ZhfpY5ubFXpwA5S1FBtXV5NXPdzPDMWdsUHR65Gaz7IxmUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCQeEV5Vuvgwe0R1D5tdPvmBLClp5Zm9iyg7edLV+41sZAFw63
	3KXuVPHjYqMemj4L068o8Z8zXX/nrFzW7tXHQp+FvWWVH3+46reLz+d7byY1saJDGkZrgH9gSba
	gEqnjl0VjDrnj5AZAkmKFWwrZGJgrvRAEq5xP1w==
X-Gm-Gg: ASbGncvZ/cKDpBCO5H2apAj9jSGelcKczSpkjKbTNLBD6RjZ4pbLHeNTq/22qkYT3bk
	abvKu8cbyFHC2BDgzAS5Zvc3VETi8qoNz4+c4kz63ytqzbQ0fcOlb/0urvV/uuiZDuH+UxZ2TH3
	qhLl60Rf/77vsC0Rip7mAceQT9EACctig9Rl1qbluRFUoLWzmPH5mZ2luk2w==
X-Google-Smtp-Source: AGHT+IEDjizBZuoKcVJzTvYSj7vwl65RVcrwqkiBwiEL6QNm0uEz+vKrfiVjezbf5nMFjCyjKA6bvZCgsmKvfmqPHJE=
X-Received: by 2002:a05:6512:a8e:b0:549:5850:f275 with SMTP id
 2adb3069b0e04-5495850f375mr5706338e87.50.1741085125142; Tue, 04 Mar 2025
 02:45:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <20250303-samsung-codecs-v1-5-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-5-56a2299dd928@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:45:14 +0100
X-Gm-Features: AQ5f1JphOoQ1tHR1pinYEgCRRxUl9CA1Qxe3jW8NE3pmYkIdk5RPI6bGrAoFaOE
Message-ID: <CAMRc=MeWNT9k6o55UjsLypuNzpwDKRmNs7Mh6TgTchxq-9+QPg@mail.gmail.com>
Subject: Re: [PATCH 5/6] ASoC: samsung: tobermory: Drop unused include
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
>  sound/soc/samsung/tobermory.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.=
c
> index 2bdd81bf821a5b9bdc56479bb2cd5d0089fab339..bc2608dbaddc4feeb9af77639=
699fed89540b44b 100644
> --- a/sound/soc/samsung/tobermory.c
> +++ b/sound/soc/samsung/tobermory.c
> @@ -7,7 +7,6 @@
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
>  #include <sound/jack.h>
> -#include <linux/gpio.h>
>  #include <linux/module.h>
>
>  #include "../codecs/wm8962.h"
>
> --
> 2.48.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
