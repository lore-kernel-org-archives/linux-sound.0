Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A44F34F46C
	for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464939; cv=none; b=F4I3ba7hrcgYgCvZlcaTB5igRjS+qO2SSxCu8o9CvM0j1fIdO7/92CBdz4LtAxbEN7ESDn+Wp2E09ifVKmwXmiFY2GX3JVJt3BRmoudB1b21sgBVTjUDXrU4k4Uy/c30PqWRKpeY95HKr9NnfAxytzjhOMY2CHxccgNCEfhWelE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464939; c=relaxed/simple;
	bh=B1FsBCLZ1091fdu3CKfazhUK9tOtY4FVr3EaczDF5Oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GY7s6UC7cZivi1AINc+PhNoIww7SALRaOs7o//6MRshg9iJodQlPiO5W3o7eVTtFJ3sWhQ5GcQ/I/mwj2Nydk8eQZd2LcoJozMPVF5ig6F5b++4a75KKVsgdo8JlfI70nKLHwjOwI7B8OSxxgHsIV9FuWUKhnDN3OMlyIoJhS/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-93728bac144so2956268241.2
        for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 03:22:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763464936; x=1764069736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prvcS1Nj5HxJbRS6Jy4uHehWZnJysfpIngTPCq04YCY=;
        b=Yauc0M9ftCJCIZdWYpHJDkTA3Sz7pwB4mdVzpwcf4t+/m/Oe9T2sDcVRUw27AKnRNB
         3zZkj0yUKec0Wmd7cx4MHhoyGrj6u4ttyldi6JdPEZbptOROxQqHLcAynD+wbhYjGU4O
         5tQg6PVs5LN5AaF6L1HsTkEXsXdjFn8jd6KH4YT0Gcu+HqPSR7kluefPorONskRLMc/5
         1TFLpb1bwxmweUs3sZJWY/dk2XbIKN0pSbGEXuSM3nTspXpAbxKgr3KkvgAOrQK0BTBY
         L++kiYYgjn7sgP5FH4Wd9L7AWkiSf63n11jU/jBtLsmxsSnjNHYIl1cQ24mOW5Xznr3y
         Si0A==
X-Forwarded-Encrypted: i=1; AJvYcCUlNNxWnHg6Lsf5+tbi1n6X+TJA8wK3H6imA3NUF2Aag5wzKmIxxG6FCOy1+dRsCtdbB28hxAKtd4lRNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Wxr0hYZt/TsjpjruA0NqAjWoE9RWkQsjj0b/8m2Vh63oPA3x
	YGoclrYUZOQT8Xi83VIXr0Oy3oc2O+9Da1MvfwHZUD3cfXCaHbaO/WHJVgtz+mG4Um4=
X-Gm-Gg: ASbGncuAw3bujxBMw0yWUFajx2OHlS4z3YiVez1cqx1uIP6JE3w7GdMUYLZ64WjqwGY
	6Fb3tpMZPlXELRExW43t918pTsVVfu9aahoYeODJ8ZK2AYfBPhBLN05w2ug/BjeO8ZYF859EW21
	0StyasPZpuvOrrENLPkGXHiPUaZgvfC20SKfcMaoq7JldF6+ULIDw5QgGRnGo/8XpI75/pWz88e
	dWgJH1ivp7J3Mi/ocPRU3AcHYs0SJt/L2PxMU9HiDmila13RV732RAj8L4jcQepJSe5BuHUxyaz
	P0lo4ZbZ5rH0WpFYhcDQr/9eEveZ0vrJp6kRCi2WUinJgH4KtHMuHfk1Fm7/MLgm/IJN8jBNYvX
	8nQ7TLz/+fdwOOmYQhN51MlW1lOcKnPit40z/r+89jwap1Aywo0ucrgkWhy6EU+qM64t/Ano00o
	j7CFLjROThhcibkdkUwcOzwNl/o5/O73GWISY/LUcdr9K7eHspVj8x6n42HrU=
X-Google-Smtp-Source: AGHT+IFmGz462pWMVWdSITssrbNGLGDJSq56c5LCYo6fb9p6ZLUXkSz1H8sy7450aDcimCIjeoR8PQ==
X-Received: by 2002:a05:6102:14d0:b0:5e1:82e5:2020 with SMTP id ada2fe7eead31-5e182e5222dmr1427350137.15.1763464936203;
        Tue, 18 Nov 2025 03:22:16 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb707521fsm5276642137.2.2025.11.18.03.22.16
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:22:16 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-93518a78d0aso2704894241.3
        for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 03:22:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1MCD9frK9OtGSR5WwvSrrAqj2kSTEq31/eE0/Lbwm57JpeXzVmvL55fbI7OdfDMiNqd1Uq57N+JepxA==@vger.kernel.org
X-Received: by 2002:a05:6102:4189:b0:5dc:7fe3:1d0 with SMTP id
 ada2fe7eead31-5dfc5586babmr5642681137.19.1763464547898; Tue, 18 Nov 2025
 03:15:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Nov 2025 12:15:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnG1e_JZjF_t0LAgzvKf5wM6L4cWt2t2bx5VV8t6YS3prQ_Mx2gaFVEov0
Message-ID: <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
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

Hi Bartosz,

On Wed, 12 Nov 2025 at 15:05, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> this series however impacts Qualcomm platforms. It's a runtime dependency
> of patches 8 and 9. Would you mind Acking it so that I can take it into
> an immutable branch that I'll make available to Mark Brown for him to
> take patches 8-10 through the ASoC and regulator trees for v6.19?
>
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
>
> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
>
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.
>
> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.

Thanks for your series, part of which is now present linux-next.
IIUIC, this requires the direction of the GPIO to be fixed?

We have a long-standing use-case on various Renesas R-Car Gen3 boards
(e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
key switches.  Basically, the GPIO is connected to:
  1. A key switch connecting to GND when closed, with pull-up.
  2. The gate of an N-channel MOSFET, turning on an LED when driven
     high.

Hence:
  - In output mode, the LED can be controlled freely,
  - In input mode, the LED is on, unless the key is pressed,
  - Hence the switch state can only be read when the LED is turned on.
If you have any idea how to handle this, feel free to reply ;-)

Thanks!

[1] https://www.renesas.com/en/document/sch/r-car-starterkit-schematic
    (needs a (free) account) Page 15 aka schematic 12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
