Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319302FE57F
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 08:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541529; cv=none; b=oEjhuk6QyXxMJnIifvf9x+jZAMuHwWc1ijkREoH8my70tAgz6T1RhyXSdJLRVAZ4x2gGXUiQq8gfe//Q84Lii7HiioIGgU+Ap9XEBMl+7DRrIoMd/lsTH4wsl+KVd69ytqOahrYgic9NsB8U2C81HrgXotxjPVmD1IoR5fkydEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541529; c=relaxed/simple;
	bh=Dz2RNjo2Pw0XOcm+SGn1fEPdASUKESrZTRijPS7lbP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TL7EdnBKoHVjZIDJOySvcYfTvILeTsCVy2NVf9/Dty4AZ91tgQsi6TSrL0MFPXIlYdjyQKHH+FTD6iB6UFWZ5Zp04eXgzruPBSlmZxulN6v5Xu0GPlW1Fu2rYcSGfBok2zdpe0ujiC1fECbKxxeywYfMaU+xg5Yq3ztM/Z6pPTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-55b1dde0961so3292681e0c.2
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 00:38:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541524; x=1764146324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zKBmRJ4RypI8GAVhhXpGdOuKGmWr/ovhm00lN6IEqrs=;
        b=cO/dlOnOqGkuZqwr0cHEZHorBT1vYkr87NxAyLcDcY+V4MeOE1LPjCJxxNMl+ia7LJ
         4jKeRynU8XCH4E4fGwZmNnzTAgqr01b79K8MEMGDkFyunodrpXky+nKOAD1vW1n0DM1T
         s2qDJAbAsDODL3IlKg24Ul+7RXMiyxQ6W2VhEYNf+67c278EkrbnQT0RoqrNk7P493cJ
         /+4tyRNoHYj/KXl9IGSkxGcZECF75iCQn8dML7Qf7QYJCjyYgLZqpOWrzw4ThiiWf9V3
         RnMqooVgGHvHmHME+TYTqEFW16AajvkP+I20g8jry6BHWiH5EyC3FOASiw/9GOxjeqF1
         Ve5w==
X-Forwarded-Encrypted: i=1; AJvYcCWONfpM5wqU9aOCaOobFgwrF99MJwOq7sdofUGKq+LjFHrRn0iQqbJ+EVe50gq4BYNf7dNVuHmgf0Uv9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqcA2wWBc0rSihdOcrpe2dANT2td9pbgVj0a/94CaPucsArMeA
	lO6jap7WIo+3gGIjJvjqVjBeLhVAFqDivy1nOwnfE5o03MnWMUNlxjDx67Yxv/wk
X-Gm-Gg: ASbGncvLEqVQS9ezOayjldl4rANTN//F6BVRp0mjWXv+kkQ3ZB3wQxXml46TIQiQ9do
	LrORddlt0zn0runkllaby4hAvj/+moaTm0YewF1YcuxhL1TxMQu5yE38iTpyOuoEZMvfTbGSB7l
	OgOOCICZz5XvGvMXufgq66tGlxLbtL1tAgpLID4pZi+AwLWGOYnGU25/D1ezT6WPnutke1WUGyE
	0OQPhRL9yjA2eIV6On+WGa7u4O7CXpVWo8i3t0yOpbgYFD6HbHcAsebzqaJI3y5jD4nE7WJ1AV8
	6o5EfUoCxclojwLD5X1zwUzYWZZqvJkE6gkL8IsHmAiPBuM9v81szz8+vxXhiZXzaCm1upaeHUZ
	eVPVENU5Zl98yPjqkWdbEClWOOfFkFyEZuzF3x2sMS15yPEqp0qyduPOvG+tkXg/R5tjPzuKEOB
	pDySieGwFpM9SLwevkEGWzQPxGMrUyxL25pX2Af4y+TReywjuUr1qXJlRlFmy4yAA=
X-Google-Smtp-Source: AGHT+IHkdJm8E6vUNdTso88abgzflc32U9zh9NV86p/rDU5AV2HAkxGLvZrjj2KppyXd4fKkvo/P5A==
X-Received: by 2002:a05:6122:20a5:b0:544:7d55:78d6 with SMTP id 71dfb90a1353d-55b1bcdcf73mr6131928e0c.2.1763541524322;
        Wed, 19 Nov 2025 00:38:44 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f32efe1sm6346456e0c.2.2025.11.19.00.38.44
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 00:38:44 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-55b24eedd37so3080423e0c.0
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 00:38:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJiJyokKY3rdatrPHF4Behxv2aKIpU7uhYHp3/rSCdLuxi3XCETscx/F98vPmF1H4WI5WFvSm+ItgHWg==@vger.kernel.org
X-Received: by 2002:a05:6102:c47:b0:5db:e179:1c21 with SMTP id
 ada2fe7eead31-5dfc5c0488dmr6881252137.41.1763541207113; Wed, 19 Nov 2025
 00:33:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com> <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
In-Reply-To: <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Nov 2025 09:33:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUe64MdRL1qPRX3q_OGj287nK=MQTb7HUta51iJ+vP9Hw@mail.gmail.com>
X-Gm-Features: AWmQ_bnsTpUUScnL6xOjY4S7f_b3_VnG_mVkF87eF8BY7eFC84gNc7MAR704Al0
Message-ID: <CAMuHMdUe64MdRL1qPRX3q_OGj287nK=MQTb7HUta51iJ+vP9Hw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, 19 Nov 2025 at 00:24, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Tue, Nov 18, 2025 at 12:15=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > We have a long-standing use-case on various Renesas R-Car Gen3 boards
> > (e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
> > key switches.  Basically, the GPIO is connected to:
> >   1. A key switch connecting to GND when closed, with pull-up.
> >   2. The gate of an N-channel MOSFET, turning on an LED when driven
> >      high.
> >
> > Hence:
> >   - In output mode, the LED can be controlled freely,
> >   - In input mode, the LED is on, unless the key is pressed,
> >   - Hence the switch state can only be read when the LED is turned on.
>
> > If you have any idea how to handle this, feel free to reply ;-)
>
> Isn't it pretty clear from the system-level DTS how the line
> is used?
>
> If it is connected to a gpio key it gets assigned for that usecase
> and handled by that driver and if it is connected to a gpio LED
> it is handled by that driver.
>
> For the input usecase the status of the LED is a byproduct and
> should not reflect in software I think. It surely should not be
> controllable and possible to set into output mode because
> that sounds like a recipe for HW damage if you drive it
> actively high and press the key at the same time.

Suitable resistors are present to prevent hardware damage.

> gpio_keys {
>     compatible =3D "gpio-keys";
>
>     button-ok {
>         gpios =3D <&gpio 0 GPIO_OPEN_DRAIN | GPIO_PULL_UP>;
>     };
> };

But only one of the gpio-keys and gpio-leds drivers can bind to the
GPIO, or am I missing something?
So I do think I need a new combined key-and-led driver, like Bartosz
suggested:
  - When the user turns the LED on, the GPIO is switched to input mode,
    and the switch works,
  - When the user turns the LED off, the GPIO is switched to output
    and driven low, and the switch does not work.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
