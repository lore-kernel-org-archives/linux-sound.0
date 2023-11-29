Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LU5Ak2+5"
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540F493
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 14:32:25 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a00cbb83c80so39772666b.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 14:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701297144; x=1701901944; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DOLqmi7b50T9PkP3AmZzht9hiYWi7WRHf89m4vrUUkg=;
        b=LU5Ak2+52pcWK8LsISo3y7p68nJZAPBZvDV0czdxRMFcNuJpD8w4S8UqfpIU8Hcpja
         Gq/STJIHhp4Wh9W42z4CFXF6/Q9Yl/B4rPYnKO+KLqVNcQK2W+nsmUgKdZ3nBeLeh6+I
         phEW9IKQHRtVsL7E1zHtVI7/mfXYUrTHJQAZJbyrYhPR+TDi2gF2qeXcvLo0vZ8wUXbB
         50AHfQwSr00kbYmonC/LnxYFESBcZl7DK6UWmgXXrpEqgLOciD0doAhlKFd2y8VQSRrL
         pAJWZ16hOV/aDkgPxMjFPbE1wkqvHgnfNrntWJcqPxJA95iVEjwwHmKr01BaGoK18xJu
         ew1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701297144; x=1701901944;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DOLqmi7b50T9PkP3AmZzht9hiYWi7WRHf89m4vrUUkg=;
        b=ocZtALf4h9oZQIDVSAKgS7rZFmAv2kx8htEuRhliZwPkgKqu9DLC3Cl9+O3RCPF4ue
         OejwnpS659fdwrxLf9bJFvIjjjJ8bHND4chPDLBlA8/7UJ3zhqfteVMFSm997Dzpw8nX
         fBgXg2UToVn61Lj5ujyRPRklo5vA9hQFcNDDmut228Cg1sAd81gSTGzXh0R5YyRWujBz
         aIGdLJbB03Qm2QQZJQEjUG+CCzPDOvtcTn6dQrzEGvhBkjQppudjFQbfgqjPbOT79foA
         1o3X2twedckiBuvwEDtp56sHCjwXBndZ5U+wpUXlbaqqQYC7P2JaYAWWXAi+tRtGgtmW
         YXiQ==
X-Gm-Message-State: AOJu0YywoJB4d0DVBxvr3R+tma5cZlIg/QO73KJwsrQq6whklSB13owl
	ip6hl6wlfvFbue5UD7wfuLc=
X-Google-Smtp-Source: AGHT+IFyCzzmiNEl9u2pt+nptCpuv+o0WdKpbzFpF4OyVP9Z1zNN9Y7i8EakVpt69tVWsfMMW5D5xg==
X-Received: by 2002:a17:906:9597:b0:a18:a1f:3c2d with SMTP id r23-20020a170906959700b00a180a1f3c2dmr890906ejx.66.1701297143495;
        Wed, 29 Nov 2023 14:32:23 -0800 (PST)
Received: from giga-mm-2.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id n20-20020a170906119400b009fbdacf9363sm8282987eja.21.2023.11.29.14.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 14:32:22 -0800 (PST)
Message-ID: <68b3c0a5d1ad283e3a43b6a011e683a32732555c.camel@gmail.com>
Subject: Re: [PATCH 06/10] ASoC: cs4271: Convert to GPIO descriptors
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Paul Handrigan
 <Paul.Handrigan@cirrus.com>, James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Hartley Sweeten <hsweeten@visionengravers.com>, Nikita
 Shubin <nikita.shubin@maquefel.me>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 29 Nov 2023 23:32:21 +0100
In-Reply-To: <20231129-descriptors-sound-cirrus-v1-6-31aa74425ff8@linaro.org>
References: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
	 <20231129-descriptors-sound-cirrus-v1-6-31aa74425ff8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Linus,

On Wed, 2023-11-29 at 22:28 +0100, Linus Walleij wrote:
> This converts the Cirrus CS4271 ASoC codec driver to use
> GPIO descriptors.
>=20
> It turns out that there are two in-kernel users of the platform
> data passing mechanism so these are switched over as well.
>=20
> One locally defined GPIO "gpio_disabled" is declared in the
> state struct but completely unused in the driver, so we delete
> it.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> NB: the affected platform EP93xx is being converted to device tree
> I don't know if that is happening in this merge window, but the
> colission should be manageable.
> ---
> =C2=A0arch/arm/mach-ep93xx/edb93xx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 32 +++++++++++++++++++++++++----
> =C2=A0arch/arm/mach-ep93xx/vision_ep9307.c | 12 ++++++++++-

I'm not sure about this merge window, but you are right, the above files
will be removed.

> =C2=A0include/sound/cs4271.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A0sound/soc/codecs/cs4271.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 39 ++++++++++++------------------------

Codec driver is untouched by the mentioned DT-conversion series.

> =C2=A04 files changed, 52 insertions(+), 32 deletions(-)

--=20
Alexander Sverdlin.

