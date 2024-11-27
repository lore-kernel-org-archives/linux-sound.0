Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC73126AD4
	for <linux-sound@vger.kernel.org>; Wed, 27 Nov 2024 03:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732676433; cv=none; b=BByqLqGxgXuRJFpzI3bWxwbQK2NxRgdSiowV4leW1Nney+Y+F/O1DIZggwgSWN0qOOZesX3mxeWFwCBGbo+y0e1ClL4EwvjlnKdjZ/hKS6saAdupNOdGMGxAQS5gbvw5aR8zQ3ehSz0B72qVGjET+hXyX8srP9KoqL9+kRiiZ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732676433; c=relaxed/simple;
	bh=BwexJOM8Lt6eGEeXs/wFnXLrXF44Ff0XiaeHC8NyObQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JfIMOsz141PyrX0TUtgz9nLjn1koW/S+Xs5WjWTvJA7UPsYLiI3Hmo6ww5di3IGc5jkFkmRwacpBGuqzMuqTnX707VovUr3A3/RP1wdFCTVLYb9vhcPKywSTL6W4Vhymcd8Lwt0r6gXbOuskfjGDKs60UkErC+I0Qf1U0DmkUgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XJW+66fD; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XJW+66fD"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-856fd9237e7so1359394241.2
        for <linux-sound@vger.kernel.org>; Tue, 26 Nov 2024 19:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732676430; x=1733281230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwexJOM8Lt6eGEeXs/wFnXLrXF44Ff0XiaeHC8NyObQ=;
        b=XJW+66fDCf6xM0EhlKD1eLDYaV1+SZt4gVPoBJe6Qz9bL9hWbUMLoVlu2Y3p+OVerX
         TWld0xZm7X7y4OngtZsGHrwG3ptL1ElhP6l6YsaM7GmAc9ZmcbLVUdwmPmCl7W6TGcri
         ingaNtx42aDaD0EFbmDgMyNJwwUv4T13oGQXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732676430; x=1733281230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwexJOM8Lt6eGEeXs/wFnXLrXF44Ff0XiaeHC8NyObQ=;
        b=Ch7No3+VjjQGkJ4+VTkXtAr3j3Qr+fXjTZaeTTQwbZiLsX4ZCIWk15JrNw7H54ZI42
         D5yKnVEqH5Nq12G/Fkkp7nueogCmeJGd2t8I4b0BlMiHCH6CDgy9KqqIxGOHDLh5nWsV
         knEvru3CGJE6kyQQpNao0CRFuRoB3N71N4sWIK0BsRoOhvSMn0eLYgMdhdWr8QbzeWQ/
         6N+orlqhxnXCDQQMZUaks4jPHscZhTzFg5DJvCx9tA/h10+3frFJaybOYjcVqoaExbJY
         yQ6+IaSJHZ/5sQsEHRXjAVditwqLTR3aTPGtLjTKiB3FzOi7YXLJkM6AuoYkx5ETV2Gj
         sFWw==
X-Forwarded-Encrypted: i=1; AJvYcCU+bcMF4gI0dmlVZJpgeRVqHZlH4aNFdz6m4zKcamHgixv+HQoJ32JphgLVaxDWPjX98xWWkTRh0ULvww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWW0jGwNoFXRemjLNb2kF/cLZygJM8qO5sMZORVdi0JszNOgim
	N7tct7Y5ZGDpPUtHFF6wSani4HuNOv4dGhl3pAJ30MZUqYIkLltVEjVW3NyKX69s4h7MBzprdrA
	=
X-Gm-Gg: ASbGnctK0wH8IYNh4sWoPeNHnZPK/hXEA14vBGySLHZZq2Iy1VAavgg0jwsE9Ql/XmQ
	G/MUAPx2Sry5OZn6aCZ9fET69tjEYZKVgygRU+aJXm5cEzKCN3wb64uKnVUw0Z/yM516kTjSGaQ
	FDoNBJqlXj3HLO+7nutwpiNc+dAwx1DZ0b8N3MpMs8/P1tV3vLxSqQD2LOMe5Oib8S/Vk+VbMeU
	h9ckOIcz3IKu0tWWzEpDpVAMu5zXvOp1YBjj9195Xv5bv464q/rwlE3aVFPwx39WJClOdLZX9Au
	ItxIKKXqOw==
X-Google-Smtp-Source: AGHT+IEFf8vHVAJCv8VjrNdj12f7S/OEQNLBvQmsQ5YJJDRGCejU4iFcTHV2/JU3Ed3Vzb17o/jTXw==
X-Received: by 2002:a05:6102:dcd:b0:4af:3fa2:2bed with SMTP id ada2fe7eead31-4af447f7f26mr2626638137.12.1732676430685;
        Tue, 26 Nov 2024 19:00:30 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b4e8205fdsm538615241.1.2024.11.26.19.00.29
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 19:00:29 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-856f083f1cfso1428935241.3
        for <linux-sound@vger.kernel.org>; Tue, 26 Nov 2024 19:00:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVz73W9s2+s920L//beicxD/Isr3c9edy+3HKgPYkBEI1IYQwW1htdYbAbIA2h/exHTs/SHA91XjEqS2w==@vger.kernel.org
X-Received: by 2002:a05:6102:c03:b0:4af:4b03:4b8 with SMTP id
 ada2fe7eead31-4af4b0306b9mr275735137.7.1732676429255; Tue, 26 Nov 2024
 19:00:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126-asoc-mtk-dummy-panic-v1-1-42d53e168d2e@collabora.com>
In-Reply-To: <20241126-asoc-mtk-dummy-panic-v1-1-42d53e168d2e@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 27 Nov 2024 10:59:53 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh6nE1+whLEUcAVG7LyoJ=o7oakR_k6=rjoYYoMSnfS2Q@mail.gmail.com>
Message-ID: <CAC=S1nh6nE1+whLEUcAVG7LyoJ=o7oakR_k6=rjoYYoMSnfS2Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: Check num_codecs is not zero to avoid
 panic during probe
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 4:10=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Following commit 13f58267cda3 ("ASoC: soc.h: don't create dummy
> Component via COMP_DUMMY()"), COMP_DUMMY() became an array with zero
> length, and only gets populated with the dummy struct after the card is
> registered. Since the sound card driver's probe happens before the card
> registration, accessing any of the members of a dummy component during
> probe will result in undefined behavior.
>
> This can be observed in the mt8188 and mt8195 machine sound drivers. By
> omitting a dai link subnode in the sound card's node in the Devicetree,
> the default uninitialized dummy codec is used, and when its dai_name
> pointer gets passed to strcmp() it results in a null pointer dereference
> and a kernel panic.
>
> In addition to that, set_card_codec_info() in the generic helpers file,
> mtk-soundcard-driver.c, will populate a dai link with a dummy codec when
> a dai link node is present in DT but with no codec property.
>
> The result is that at probe time, a dummy codec can either be
> uninitialized with num_codecs =3D 0, or be an initialized dummy codec,
> with num_codecs =3D 1 and dai_name =3D "snd-soc-dummy-dai". In order to
> accommodate for both situations, check that num_codecs is not zero
> before accessing the codecs' fields but still check for the codec's dai
> name against "snd-soc-dummy-dai" as needed.
>
> While at it, also drop the check that dai_name is not null in the mt8192
> driver, introduced in commit 4d4e1b6319e5 ("ASoC: mediatek: mt8192:
> Check existence of dai_name before dereferencing"), as it is actually
> redundant given the preceding num_codecs !=3D 0 check.
>
> Fixes: 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_=
DUMMY()")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

I noticed the same issue on MT8188, so it's really nice to see this
fix. Many thanks!

Regards,
Fei
