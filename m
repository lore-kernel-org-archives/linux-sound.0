Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8014654A
	for <linux-sound@vger.kernel.org>; Wed, 27 Dec 2023 19:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CMLOCkL7"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4b72f2bdbdaso527227e0c.3
        for <linux-sound@vger.kernel.org>; Wed, 27 Dec 2023 11:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703704402; x=1704309202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3qLwklk9U4gMAhrladKe1ApGulYoEDWa19ngg2KpQ4=;
        b=CMLOCkL7tc5m/B5sWs6PP7QghzaQh/TET0pi7s7h33BoKdrp3Bq6HaQWawAHtChm+q
         NOSacPWN5Na1qd3xtav5uG3SmsCC372kCjnkqj2fCmFk8m66jAvw0NlQcRKUcgwwGnlg
         mr4NJrp3atN/uzmUYhPCyOcRdW4jEyzSJZakNFv2L+tndskjSH8F5mUGlXsSnCrrcVYO
         g3w1PZjdde+S41Q1pL6mohdlHBGgNpaXD55v0d/AIkZmzwy0XjFt6b+ZrkaKgD682eyP
         /rHPJ5pnwCWxF35P/WuO0AQi+5XCX699aTH2io5x8nOLVkYErZw0iCfqEQV0VC/R+Y+a
         0npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703704402; x=1704309202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3qLwklk9U4gMAhrladKe1ApGulYoEDWa19ngg2KpQ4=;
        b=wC08qEdIM0jos6puHkVmGwS8/wu04K1vLvHLCTsemjXyMBpW/Rk5dbm/sSEuhTqOEu
         3v9H5pYl1MZNdwmwa1LLGII4uSgjbOiiHVbc14L7TU2U9X7CFmN0beVQOvcwk/V/JbFV
         ViUyB6GFhBBX681aLltXOt5cPhU7ueRKdeYg8MlBZ9CRbuTdo5xxBFVb6koENp+pDESR
         31CI3aAaqklKAn8AKp7fs/no8lCVa+gshwBZzW86voumgiDraY/rvEuu1k+XvPrLATLr
         Nj5m/XZemVA3VNhPH0eEpxBDR8QYFMpGk7k1wcTe3SMjWpSXBtoVNh8jo+J17fcQGHWS
         LAkA==
X-Gm-Message-State: AOJu0YwLAgHW7GXMCg74kkHmg0xobyrUHt6Cl3doX5Hy3oe8RcKWwWue
	R/OY7MSvDH/Z3sDBhc2rDB5tMXOZTAbeqXLBQ9J9xWw3WNqkjw==
X-Google-Smtp-Source: AGHT+IFUs7dm3S3V4xYhOPFC9E9EgbP+SpH3MAbAicqVRSXicJa9l3Z7CFlOmIGFjC7GBisXfF33h7pkFtdX1T+HNa0=
X-Received: by 2002:a05:6122:a02:b0:4b7:3eee:3a3f with SMTP id
 2-20020a0561220a0200b004b73eee3a3fmr1614353vkn.31.1703704401898; Wed, 27 Dec
 2023 11:13:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
 <20231222150133.732662-2-krzysztof.kozlowski@linaro.org> <CAMRc=MdYPuW8C_+EAY4UTCjqNggx6RAkp9OmLU-hRxjZNRQRHw@mail.gmail.com>
 <e9bcea6e-922c-4903-996f-1677e6eb6e1e@linaro.org>
In-Reply-To: <e9bcea6e-922c-4903-996f-1677e6eb6e1e@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Dec 2023 20:13:10 +0100
Message-ID: <CAMRc=MfGOr4yF50fOwfvahe=CV2Xf9oTrPBLC1QPAb2hw1FLUA@mail.gmail.com>
Subject: Re: [PATCH 1/4] reset: instantiate reset GPIO controller for shared reset-gpios
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sean Anderson <sean.anderson@seco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 27, 2023 at 1:35=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>

[snip]

> >
> > I dislike this approach entirely. Here's what I would do:
> >
> > In the reset core: parse the phandle of the reset-gpios property. Use
> > the resulting node with gpio_device_find_by_fwnode(). If the device is
> > not up yet, defer probe. You'll now have the GPIO device object.
> > Retrieve its label using gpio_device_get_label(). Now you should have
> > everything you need (the offset and flags of the GPIO you'll get from
> > __of_parse_phandle_with_args()) to set up the lookup tables. See
>
> I don't get exactly what do you want to use as the cookie for lookup
> reset controller?

I'm not sure what you refer to as "cookie". :(

> 1. GPIO controller node? No way, not enough
> 2. GPIO label?
> 3. Or some combination of above? This would work, I guess, a bit more
> complicated cookie than just one pointer/unsigned long.
>

For a GPIO lookup you need:

1. The name of the target device (in your case "reset-gpio.X", you can
either keep track of device IDs yourself or live with the fact that
you may have one deferred probe between when the device is registered
and bound and when you are able to read its final name for the
lookup).
2. The label of the GPIO chip (whatever gpio_device_get_label() returns).
3. The hardware offset of the pin (which you can get by parsing the phandle=
).

You may need additional lookup flags but the above allows you to
correctly assign a GPIO to a device. No need for cookies.

Bart

> > include/linux/gpio/machine.h. An example of that would be in:
> > bcm2835_spi_setup() in drivers/spi/spi-bcm2835.c.
> >
> > Then with a lookup table in place, you instantiate your device and
> > it'll get its GPIO as it should. This is not ideal but much better
> > than the above.
>
>
> Best regards,
> Krzysztof
>
