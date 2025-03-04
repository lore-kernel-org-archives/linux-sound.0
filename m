Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861C31FC0F0
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085143; cv=none; b=tyTKYEwecrSpF++6+ZjGbZHry4wKSh3K2xZ4bgJuvhG2Gv08Krw0isFWb14tZFZt6+XVyXKO0yWxNNPz3yT0gTL5jPcValcNZsIUQe79GQ9o00jjHXpW7DYfGDd+uJiZXQRutHCWEtgZn25cTTSYG26e6JSyw02fa/Swwlkhjk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085143; c=relaxed/simple;
	bh=XrccfVlX78d8fm1mMioQKtD60WqdbUAbCv4lJv19APU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjLPc7Jf+bAb25W5rSnklh935CDEZZkExSPFSZxx+c1NxSfeT1nHf4nJARsSZmoVt8qVEfQKSq9srfeTJLpoQgObjxxlfDas++goFIYqaBWSTHe7KUlQ1+i4HqXq9h79m2SHRbC1HCLNphQc9yniDq7yMsJCSINVobFmRMGhDHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1nZ4Qqav; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1nZ4Qqav"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bcb48b0a4so5215021fa.2
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 02:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741085140; x=1741689940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/aaHwkC/E8uA1kqYtAAaX8nqXZT+jPYwGSFIvz+Wis=;
        b=1nZ4QqavzDcaZHcAJnFRHUByoeTC+8Jnxs0tdEa8v1iJg+l3keEduYcCQg2ZGPhG/v
         yq8+Zx2QN6n33rijKs9ZLZcHxstKuP/BsL69sZsLGIVZZqFQZXyvP7wIQuo6V+ymm2Uo
         zkIde1eYxTgj5WU/TfAs3gbQ9zacBCqNqKdt2Ce2oJFcb8F6BsBjAEK+ai0MTxM04wqr
         Gb7jqSzfW4T7VH977IjXvXLoGpiIr7zJJ281oE/8m80HnhTXaw80pf2ALQcU3x84ny6v
         bwBMe0XQmNiz5CkYfY4Q+C783dpg2rFTEojdBKxiQIn65o7h5KhysLCJ+kxxv+L1EcC9
         M2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085140; x=1741689940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/aaHwkC/E8uA1kqYtAAaX8nqXZT+jPYwGSFIvz+Wis=;
        b=UsIcsl/u1CpBPxp6+L7spy93mEDWlVbmo6KSahFpu2NRSSi649B+pIMPAYxT06Vp/2
         0i6tUouOq2XUJeVX/VlYfwVPLWN6gJcbIk1fnhlnY9GyZ8E7MEAmyFXG9iob+HeWdNSs
         LakCc0xDSj/0HnW1XjI09JYpUEOXxgn418DwAOrx6dT3faQrcGvXV/KGEc1kvpEgEzXG
         XL3jSAVJp4SdBZNSVF/GHaESN8YTjJikXQDvYzGAhyesOcBK5IwzzwDVAUkOn1Iej21R
         k1nPWwmPqWmscrDhvZTDsbHso7Xva4T4RrLjPZnHb0/fryIU7XsX0SMj6nOo3QOcFzZk
         GcFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqiPsuzmSf+nZlsVmhQ8Pr7ng50sLQyRq6WVIC3jYIolBQ+MI3XzcJQX+3HJfem/6ScILHEThnI3h7vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmvD61VkLR1Eo+aU5ec3TTE8xfnybPXpkFD4n0Ci4OQWZzfe+c
	EM0LzehH+8o/5pfph4SO3FoPUf8gYbafQHgBVNuCGQfFJ85WRjg1jUJe3V02Bm0VwVbZSeTbEMO
	kSfxIHJIPEN23dITrWAlos4XlgTiayD4NZmkW5A==
X-Gm-Gg: ASbGncv8cbE99XJms6R4H93/vF4BXw5L4Jev7r/hWKcJU9tlvx5RxI9p1WBHl5C7BD5
	bPKYQZxsh9PI0QeCIOFhEh3ht6v3c6iNQ75/t2JzezsLG6J9ShN5xnMpe48ysZkd0ZwS5mln2S/
	XkjQyjDkY0GMrCrTUG63uHJO/OyCom+eLu1HQsvJv0Qu5sgV6SNWaAGhD5Zw==
X-Google-Smtp-Source: AGHT+IFXXt2AqKqjjUsUgbBtUp0OHXy4RcnJzi21Vkdwe1SliF6nWQg1kfmRVJCF27CAXfJfhtKA7V7mluHj46qdMQY=
X-Received: by 2002:a2e:b896:0:b0:302:1cdd:73c6 with SMTP id
 38308e7fff4ca-30b9326af9bmr64690081fa.20.1741085139679; Tue, 04 Mar 2025
 02:45:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <20250303-samsung-codecs-v1-6-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-6-56a2299dd928@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:45:28 +0100
X-Gm-Features: AQ5f1JqzX8kxY0W6rt0f6HfW2eatpxqYEnNpnql_NIg_4tkiueWX8b7wCcm5OjA
Message-ID: <CAMRc=Mfr0Bwy_OWRheY8U5c2-0nB+_JxZHLNjbHFzvCEQb3OrA@mail.gmail.com>
Subject: Re: [PATCH 6/6] ASoC: samsung: tm2_wm5110: Drop unused include
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
>  sound/soc/samsung/tm2_wm5110.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm511=
0.c
> index 2417b91a328f083f991af8505c5586d3b27d9bbd..cc76963105d9fa37fe0bc45ac=
f9a28720fdde158 100644
> --- a/sound/soc/samsung/tm2_wm5110.c
> +++ b/sound/soc/samsung/tm2_wm5110.c
> @@ -6,7 +6,6 @@
>  //          Sylwester Nawrocki <s.nawrocki@samsung.com>
>
>  #include <linux/clk.h>
> -#include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>
> --
> 2.48.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
