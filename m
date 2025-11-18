Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432253101B0
	for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 13:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763471051; cv=none; b=I4hnS5UqgxikTIh8/Zy5p2D2J0UvhOUyJlyE7rRlfrNCMVwEsJMmXN+olp19/ltjCawT4wK4kESeq3GnLgh/Zj8khha3CVOwGmOj6Txx55EtZ49WCmfbiKQhLxT1UbYddU54Rj7exVqwKUHEd8WIKvvZYqs8Ur6US9Vq45Wcaac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763471051; c=relaxed/simple;
	bh=/zVQ3caVQJG3gQBJgK50MyXyKcMooS7fUfIbjJLVF6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZSYTU8LaAHMIIQwaIGA0rx0SWXy23rHHEEWV3+RQ3Hrx9Sh46Gq/22WBdYvKiIe6XxamnTmvx7MapgMBD6nSjmsB7nGaNUjeObQJDeQl3z+7Q7S4EgWx9cVoE+Mr5JNyvPexQi/+14iA+k9yH93A1JVOYFKPz0zYpNmJW6MkLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9372149216bso3100607241.3
        for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 05:04:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763471049; x=1764075849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XMYcwyn3PU+pOgxTORp/4U9I/0iJwsVP/bkqLPdjG54=;
        b=KL1UO1Riiy4RIJJhvU6AJmUwULn70r5+XGe7AwrxYMpLLKdtC1Jyvw+hGCuLmtYSuk
         s3/GdwXgLM/Fr+Ytv64KpC5cbxE8UcKwbYmmZjZBabAREaKAX7ptGmoCj5nC5NEvWeSr
         0me4JN1mHkW9EiN1SuIvYFBquIzomTTnqIDWETExoV9IHEYqC9TvmsXAs7VqokdGg+Ru
         oQIkqDLEOxgIk4iAmMQ/zFzRC1FRV3mKRQyJugmWXQGcom6VnNZXjWtSuMrEmTk1YTWU
         Brea86tvIxgp/KUFLZ8iYmDusfQUJDd9j3chEKNKHsR2ty07D7kPRJMQgpDja4z7XbGi
         y24A==
X-Forwarded-Encrypted: i=1; AJvYcCVfk963i2OtaDkAzBir77vKexMra18+vvS6hepE+qwEpnUJzT7PQTJ03uSEwDpYz6sfO0RcxAq6W1cZjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt0f0ryQ8047ACXw2CljXQL/I8ZIVPbaPE+vawsvtcY1fYtVtp
	bgxvZT35m0/xKGoTGIS2lfERY/fnlTsPwdVwCUJ7iQNcWtHX3c23XhsxE3aG5al1
X-Gm-Gg: ASbGncvc2sRYPQQchciJTyN3kiXhh5rIiauXe2euwR/BypHo+cvK+72+Hee/LGfT3rC
	r3AhjT3jJmbKmgtFT0BHDF0yOWCspUN0Ixy/cBDiHQE/KxUjqyeCeFegINHF5REf5LbihI2W2+Z
	pF7ROE5eHWYRSIVdxzNdCnF3BFr3N2gQeHYPSQaYpkTMdxMydU0OszvLw/iOi+Wy3adkTHGwd3c
	tEQne5TjQGShFP53HZ4HO43EsgqINPuxRbtzkQR/5whGQq/PTstE21UdMIj/irzcx5VFlJU9tp6
	lOz2bvbB8iyBOzEdGK53C1AYqwp8izk9rDeejqp9l3q+5Vx/QJxv+owza7GXwxzCfCai23M/KM8
	yxGU8tQzB4LnCtwFShr456DkyYdO/8VMRBawA8sJUJpxfHBR5qygvd73LmYvWBMIduHU7Vzbfee
	M+KEgMWSXG4QFkh0tfutX8dcpu0vXpDl0t+tKR0wzpmqODeWYaVg5qD3ETDudmiVM=
X-Google-Smtp-Source: AGHT+IGa1kZ19Ytvn7QVtleLv5tubQXm+1hWiCie3+2nfNt/prb2H/21uTPoRFkhQHAy6JRMNODLVg==
X-Received: by 2002:a05:6122:1783:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-55b1bd94471mr5866562e0c.4.1763471048820;
        Tue, 18 Nov 2025 05:04:08 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f4425f7sm5285163e0c.13.2025.11.18.05.04.08
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 05:04:08 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-55b6a642a4cso37564e0c.3
        for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 05:04:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUH+52QJZGDqwKtbL8Vv6Hti/zkVbTtJIWt8nckajJMcJsS1fvdshhVcQbll1MWoXitZvg/huHKMqI00Q==@vger.kernel.org
X-Received: by 2002:a05:6102:441e:b0:5db:e0fe:985c with SMTP id
 ada2fe7eead31-5dfc54fcc32mr4842088137.10.1763470566608; Tue, 18 Nov 2025
 04:56:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com> <CAMRc=Mdo__Yzigqoy4xKt0LWSvES5Jse1HeXkePfhiWyiz6tBQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mdo__Yzigqoy4xKt0LWSvES5Jse1HeXkePfhiWyiz6tBQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Nov 2025 13:55:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXpySSvjgju2LXr6puVXzHMR4ckpaKEWK_S4spTWz6B-A@mail.gmail.com>
X-Gm-Features: AWmQ_bkC98gq3Hx-nk9zI-w6kSG9BC0TZLZ6VioIzu7f0ulaeAjNY59_KJ5q6hs
Message-ID: <CAMuHMdXpySSvjgju2LXr6puVXzHMR4ckpaKEWK_S4spTWz6B-A@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

Hi Bartosz,

On Tue, 18 Nov 2025 at 12:55, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Tue, Nov 18, 2025 at 12:16=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Wed, 12 Nov 2025 at 15:05, Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > > Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with wha=
t
> > > came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> > > this series however impacts Qualcomm platforms. It's a runtime depend=
ency
> > > of patches 8 and 9. Would you mind Acking it so that I can take it in=
to
> > > an immutable branch that I'll make available to Mark Brown for him to
> > > take patches 8-10 through the ASoC and regulator trees for v6.19?
> > >
> > > Problem statement: GPIOs are implemented as a strictly exclusive
> > > resource in the kernel but there are lots of platforms on which singl=
e
> > > pin is shared by multiple devices which don't communicate so need som=
e
> > > way of properly sharing access to a GPIO. What we have now is the
> > > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > > doesn't do any locking or arbitration of access - it literally just h=
and
> > > the same GPIO descriptor to all interested users.
> > >
> > > The proposed solution is composed of three major parts: the high-leve=
l,
> > > shared GPIO proxy driver that arbitrates access to the shared pin and
> > > exposes a regular GPIO chip interface to consumers, a low-level share=
d
> > > GPIOLIB module that scans firmware nodes and creates auxiliary device=
s
> > > that attach to the proxy driver and finally a set of core GPIOLIB
> > > changes that plug the former into the GPIO lookup path.
> > >
> > > The changes are implemented in a way that allows to seamlessly compil=
e
> > > out any code related to sharing GPIOs for systems that don't need it.
> > >
> > > The practical use-case for this are the powerdown GPIOs shared by
> > > speakers on Qualcomm db845c platform, however I have also extensively
> > > tested it using gpio-virtuser on arm64 qemu with various DT
> > > configurations.
> >
> > Thanks for your series, part of which is now present linux-next.
> > IIUIC, this requires the direction of the GPIO to be fixed?
> >
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
> > If you have any idea how to handle this, feel free to reply ;-)
>
> How is this done currently? Even without this series and using the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE, the descriptor has a well-defined
> direction so it's not possible for two drivers to request it as input
> and output simultaneously. The second requester will override the
> previous settings.

We do not handle it yet:
  - arch/arm64/boot/dts/renesas/salvator-common.dtsi describes only
    the keys (key-[a-c]),
  - arch/arm64/boot/dts/renesas/ulcb.dtsi describes the first key
    (key-1), and the others as LEDs (led[56]).

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
