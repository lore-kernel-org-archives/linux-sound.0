Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB111EB5E2
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947718; cv=none; b=FVHwk7WJHuBZ2ei+J9IDaONNAjPmTdlg7vLDxVzW+a9B1cHk2qXz0cWHRNe5YPE6EC2OKFz8rCPfc5ZuWSD1fbqQdijHOgvo+BUVeoJASw+UgaL3jqOUWaQXjK6WwKX+w4lq9jGlprPMJ3vKuXGDJ+oJ4uAqyu0uG3i2Y0Bcan0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947718; c=relaxed/simple;
	bh=xTpZTX6AMxu3+qazJFqKIwM9kTorD9hdWCEh54oD/yY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVSzmxo8KOu1Z9XM1Zbva4p3JrRl6oGwDZ2BpIxyl7nW7mwgZRBitHPGI/k0emffcDi1vK8TRuElMfF4wPgolwGxLJHPVWAzJZNIEKpjhu5l8ghMc3IFesA/WLQa29GJeOA6pNP7520C9+UljeuMXCjdDbksixgJISu57SF3Oyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p9zQ3ft0; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p9zQ3ft0"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54998f865b8so1712916e87.3
        for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741947715; x=1742552515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTpZTX6AMxu3+qazJFqKIwM9kTorD9hdWCEh54oD/yY=;
        b=p9zQ3ft0WTocuto3kxkJdZvK8WPT9p0aKQQAxmKEeEhxOfmQMgVSf0WYouq2RNtnDZ
         nz+yP1Epw6b136sAePYsDMbo7ZfBWCV898YfqtD4tmE3Guhtz0zr6avLivv9OGMGOzch
         nFG7Eo0X3COKdmeFB3I2JCqiPxnx69KlVzg4uCEN8pALQplNC3dfBeLdCE+PAusxtQMD
         v/kMktGMAMG0YKXNuafxPmdDNq0y4kMzgIZ0s9hMg9tWhou/fo12OEHnGVzq9AzbvlYS
         hELu1wvIyxLtFtNgSphQnXx0ozfRY2z2xBKSS0M+yfRlmTT1mtp+Vrz9w48Fd/YNIh15
         Adow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741947715; x=1742552515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTpZTX6AMxu3+qazJFqKIwM9kTorD9hdWCEh54oD/yY=;
        b=Kkey4YZpNzEO8XuAiXKnj4zaSSlZbXFQGWN21bifGQIXWu1wYnTlZ2XeBhbO290zUl
         HLJln4gAam/Bt0z0AzY6VHJ7ghEkxyyfDWLNWq8UoJ+08OEqOuuzT12M59WbB3qjyjWe
         2bgNiuCu/ymOrnttfTNZDUmLx8p4zYPbEyXnhQq7Vubhp+34x8qIu9sTvLEyGmaWWbvX
         DS436wh442mWRa9+NBk9ZhYJpP5qj8FUx7CEKXQesnQsLhqvdR6nQMqv6Fv5s+niN3G2
         lmjQAgKVAHntQge7OmJCkaWTF9bRoo/Todur7meuCyakUDdyrHBHQF8g9+sGmpxLscxy
         qB+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVB4EhCukBHKkkWFobdAVAdKaPEtkSSRNrSuWB9lYIQTxeVmlL8abd9mC3E3i6VuDsZgI8hDkTsN85uIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOJyspOrQsVlP3rxV9ae9MCsARaWV8kWMB8CyqvWXSTha/DUJ5
	WKbt+cLZbaF8jvWeBm4k0QXupMItSEFWf0D47ijSQS21MkmQ1M1LyMlYcylNz6Ec/eMK2IQuhdN
	2JvCSHTxR7R8YmgxpP9NICVntVJRfPRU6kQw+KP4ka5Yy6xP1
X-Gm-Gg: ASbGncuyaA+MdV9lQ3SPFt8QwHG6n1tTAnciKXnPCLGKCflLC0thWT4/EYTnurIpxZW
	tw33p3EE1HNktisuZuDb7NnuC0LoayO2xiU855YNgrukbhy7lFQHWyRxPXDvyWiZqHn04JE+D6c
	cqwRglhvlz9sBdKhrVOUEGLD4rFLXlDoA/jA==
X-Google-Smtp-Source: AGHT+IEUDgH4hKI/VlqsNxuCaInPD1IYUYUxnK5o+/fyx5ELv/o0sS9qDolaum2DK5go96TmMf3VW3HeNPG9uPpiEA8=
X-Received: by 2002:a05:6512:b94:b0:545:c1e:65fb with SMTP id
 2adb3069b0e04-549c38fbccdmr686124e87.18.1741947715080; Fri, 14 Mar 2025
 03:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307124841.23777-1-darren.ye@mediatek.com> <20250307124841.23777-7-darren.ye@mediatek.com>
In-Reply-To: <20250307124841.23777-7-darren.ye@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:21:44 +0100
X-Gm-Features: AQ5f1JoRI9uPFODrP-kekoqBVTf1T6TLHgkeo343GHaQMulDksI11fRwjUXLOnA
Message-ID: <CACRpkdZ=a0mbir=D3dCSPns1TC_OVWMMTXJKcTYOJeNy7aQ7NQ@mail.gmail.com>
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8196: support audio GPIO control
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Darren,

thanks for your patch!

On Fri, Mar 7, 2025 at 1:49=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:

> From: Darren Ye <darren.ye@mediatek.com>
>
> Implement mode switching for audio GPIO.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>

> +#include <linux/gpio.h>

Please don't include this legacy header. I don't think you even need it,
you are not using any gpio_ symbols at all.

> +#include <linux/pinctrl/consumer.h>

You don't seem to use anything from this include either.

Find more specific headers if you need the code to compile.

I think you should drop both, the name "GPIO" in this file is a bit confusi=
ng
because it's not very generic but dealing with audio IO routing. But I gues=
s
it is what Mediatek calls it.

Yours,
Linus Walleij
