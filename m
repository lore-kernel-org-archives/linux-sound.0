Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD7527F16A
	for <linux-sound@vger.kernel.org>; Wed,  1 Oct 2025 08:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759308564; cv=none; b=GpUdqyPISuDLWGs2CIEiwdOtBnzIrQNWUleETri5sZD0teHFx4cypinYC6zAKajPQoNNyRENqt7i7gleo7m8naqhhWG8xgHv0tH8ShEGy22kxi8KzJWW1l/TQb14WjQy1xbRjeBc5U9d4ZYbmTb0E5RLZaQjXFTRi1u7qaLEdr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759308564; c=relaxed/simple;
	bh=8rIcT1Pqs3Ea0y+ldBE56b1g4vr0kel/gXDqeQVGlIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8p4TQ+IG6CATh3YDEPPeYgDak1jJM3+V/hsMrtG7PEgw8+YMlGVBKobiEkVvvx6u+K9X52WJamsu/mtc3ONZ53hRMVcpqE9bFs2CQJipjf6ajA26IPGDpCtuoiAVniGroB5XN2tS0F8YziV6b7XQdZa6R9Hfkj7XWLdvlYM2dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zkfrDGu+; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zkfrDGu+"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-367874aeeacso50523081fa.1
        for <linux-sound@vger.kernel.org>; Wed, 01 Oct 2025 01:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759308561; x=1759913361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0MU6aIf0UKaVQXy6RXiIl/s8w4p6CMU+2iv6BbdgNc=;
        b=zkfrDGu+OWGi3FG8ITAaOuQBN1lu+3NuDJaQ2yrnNFnH/u4ixV3mjNpWXUlAp6+tpa
         EX6re+C2MTBLzc8+tP2BGCqAmohTb6v4M7n01C4APyZ6weYstslPeSeKGecOJzJZWXBO
         dHUTGYoXnL/KSJbvNr8GWGvwo/Fb45TO1CzVJ4i3gOzmtLQgGyieA4xc3OaVmeumXkwn
         8lhRf7ibgDZsV1U/4E/J13OYbqg6YgoBJ3XS37jH3D74Vl/Hal+T6qhgJXZCzPRyBX5N
         mVMJbwIiMb3Qhyuq6WZKybFR1gzRX5URh/ZKdRBuwn2ltYr++hyKpz0xopO4lH4DySv9
         qXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308561; x=1759913361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0MU6aIf0UKaVQXy6RXiIl/s8w4p6CMU+2iv6BbdgNc=;
        b=vA14L6jkeOgCha4dGd7ZXwqngwTtAEewComvNFKhn77gKN2ltDiWr2h9s7ObNO2V90
         gLhRQEIF0C+tZcQYDpSsNhBgTSHuIlmSm3thnjcaPQuFqAe5I7aNOLeK+sPyOwH0kVcH
         vKFRYC/EP6tIuch/W7vk+RCpu/sdhhLt6QBVpwXphP5EE9dNsGtywv9qQ9Hua6gghCk1
         +xFD2xHGPP85nyGijTxVBrMtQw9PRJ+pBxB8tHPmfjGwl4kYyB1KgIsctBSaEYCYafFg
         ExLWurzbD4U2RiCwZAELpCzAJmSqUh4ZnKkM/G/+Hf5RxET+MSEeYgIevLjDaXf00/JO
         dE7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLWnGFbtwsjsexERrKtd01qDUE13JWYpyVIlFJxciHeE9St4DUY6aKe7xoiugth7my3rrpW8y+7tx/hw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7w8pn9v5VO4ZJSk3Ls1Wwkchf4OmTX7agVUneleWAnKaJ2O63
	y02xQs8rdH86ZKzWLZcvFLQmmJ0fw5YoW9SA7459i7d66DkvQGrHzY6G4rUf7G7D9zlbGGkXqvS
	JY0QuSMaQqanvBEN78CPooUIM0JKHRpdsuWB7p+STaQ==
X-Gm-Gg: ASbGncuNNIC+ZJCWlmD4l2CipNXruC/Oaeo8k6OhZMlOxYB7W5OJmJgGYTF5bfyKM6/
	UTmMIJNrc31e/RVXqZaizr2EiqokZQBJMDDydSRHgY3iIOoPlYqazI8Wnr1xEJAFmsfwgglxbOI
	UPHOviOWxVxuso3A6ZJcwOxMmPsYt3PzVbOF9yKIEKZxVMddB6+ynknmGBCGl6i7snu/iBw9FA5
	NPLOUT2CqZhsiJnTizcRt7BuuUJVYY=
X-Google-Smtp-Source: AGHT+IE/zKf4qFF1V06mzijknnV4vH7ubPftpR9/pcWP4CKpLmmmcoKCGAvUGlvDb6zfdbCLMmIHYOCJfvmvwXDpg0U=
X-Received: by 2002:a05:651c:1592:b0:372:9468:8f99 with SMTP id
 38308e7fff4ca-373a752cee4mr8095951fa.35.1759308560647; Wed, 01 Oct 2025
 01:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 10:49:09 +0200
X-Gm-Features: AS18NWD8uQhySPgdZVvT54DJFS2VbD05G4rr5WTDsYs0mXBgIhMrAJorsb0mOuY
Message-ID: <CACRpkdYcVtJjRHRJ8GgeU7rZDuyaJKu0vgcknb7DsHPjZGKGuA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

I see the big picture of this plan!

One quick comment:

On Wed, Sep 24, 2025 at 4:51=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> I'm Cc'ing some people that may help with reviewing/be interested in
> this: OF maintainers (because the main target are OF systems initially),
> Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> in audio or regulator drivers and one of the goals of this series is
> dropping the hand-crafted GPIO enable counting via struct
> regulator_enable_gpio in regulator core),

...and that is what I thought as well, so:

>       arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM

why would we be selecting this per-subarch?

What will happen is that CONFIG_REGULATOR will select
it and since everyone and their dog is using regulator, what
will happen is that every system will have this enabled,
and every GPIO access on every system will be proxied
and then this better be fast.

Two things come to mind, and I bet you have thought of
them already:

1. Footprint: all systems using regulators will now have
   to compile in all this code as well.

2. Performance, I didn't quite get it if every GPIO on the
  system will be proxied through a layer of indirection
  if you select HAVE_SHARED_GPIOS
  but that would not be good, since some users are in
  fastpath such as IRQ handlers, and the old way of
  sharing GPIOs would just affect pins that are actually
  shared.

I don't know of a good generic solution for (2) to be honest,
last resort would be something like runtime patching of
calls when a GPIO becomes shared and that is really
advanced but maybe necessary to get a performant and
generic solution.

Yours,
Linus Walleij
