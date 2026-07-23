Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043D83DCDB1
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 07:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791598; cv=none; b=PAQmrryJ2rVl/MrktWEqHVRvg1wQ6gzmozeVAXhHrHfY4M1ID+Pnwkz5OuunZITXzKzUph+cHGBnneXpYfZqgdmq001pGaMdMoI/4cW9sSBPDpGXhVLA3stbAWZPNPmUADO0g9Ajy666y/x5yz2c9KhIyZ7X3tQPCF/P+37jbd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791598; c=relaxed/simple;
	bh=PHVVHMzvamfInu0laUoasP6sfprHLwXreih4RDNS2Es=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=olBYy0oeeJvsVyx2ZjLFjNetr+ex7nWH7UAADmqqytMdIKom4BZKC1eAkq2PXEbvuzPF6yrjnFZcpvORslgmLkDTsTWk8VWzH+XCA6Sr7Em9DO5gaMSEuZjc5SJgRMfzchEc9Ozx1aa7koONT8j8l7rQ2MPnhaCNbJEvqzIify0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gIgiAGjA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gIgiAGjA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso1326935e9.2
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 00:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784791591; x=1785396391; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YZYNxTA29o+VVvsMIKxzvkFs91vd12LPquYRo5EUNDc=;
        b=gIgiAGjA1p1INPu05PAHiL2LJ+Yhr32WHh/kLL4+TEjjUUWUQ11+zYzyoTMvz9TdLl
         QHsbaeb+Smuo8rlRf5lp6f/3OoRd2B6WNL596qWkrK9du1uyw7HE66mxh6laKsJym1C/
         sREIgwzBcxqN3QlgoqWLL1/VIqgZUP+thC0AuT2ooNHek3izP3f6irETxrixDRTfRSdh
         A9InLdwmzt683PXPCDe1OBGe9NHo8tTdxD9Ktto0VxrAYB6Z7gbYewXVo14CgoyXcDzX
         0kwpDGecliTO0Qfxtvo4wQPVA57hXu+XpZm58VS10g9CHOa/dQrMDjm8Dp54peEHexdW
         /gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784791591; x=1785396391;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YZYNxTA29o+VVvsMIKxzvkFs91vd12LPquYRo5EUNDc=;
        b=dVkGYN8PTNTiwcsuwNaLHTMC+UMNhlPimDNTuqMtkM/zThDf/3IwzDRc8XgqDrSS88
         v52KjAEG2Zh7oMT0nmTiPX/ayaTBEHZj6SXJw01MTPvLcC75AtUbkJFEFK8ljm9x9HaG
         uonKx+lM2SdjYxr96JYScQT5J0500KaQSOql5Ir/qDTEgIwDEjcj9JWJ8FHMIWF+2ICR
         6ParW0uy5+7qFmMtsiZ+YZ1vvGD9MHIZQiG6vrS+lfGOx3P88yZovs0ZZ7qaZOZaJOaq
         lL5e0SEhXiGgv37w14WHKbEy/FLc1p3E0oipps6LsBp6t9F3DREj7PJrbX3mbzooO1F8
         oibg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+/NmfnvXvVCq9Sp4v7ppVR1moH1KEPB72eUfzmBwj/ZXgKYfQH55O/4nCFMGENuRvSqaUSuis043DEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuZ7iPjZOMTpVAfjgakDRmqLAdNVVIDO7eJA0+K2MNFIuLeKGf
	2HMhExuOnBygpiyJsSHl5AuafyiUMZ9j9LWUzIS5bpqLr5rvKWzyi1rvUoP68G/9bXw=
X-Gm-Gg: AR+sD12QE/B2v6jaDhOQAq+ycO3kB3B++FBV378uqT2sNhXRyGJ/tOx8sn7xSSXBatg
	Ucj4sZMdZCgBsMrLluorL2MD5Edf4xNCFWT4ZgnLQCzm6e9m2GGLi0sC2Xko7IRco0luMvMTwAn
	VFHywdq8RtMNLtIls2ND8DWj2u/E3c+Ww3SEG5ZIO+qs/Pc6nRYc/h67H/H/GwDZFmNM5v3hLQF
	vOeYwtURRd/4QkcbTEzRH1pJly8r015ovY7ecmRybAyjjFp+tkYRY58vd2atzP2uHVfuUfxciT5
	jaKa+NeEPI/uWtL+tfAPdlNzAucbQ6eFbncJUNBno9/+chFHNcYmEpiQTgRHUCnjM/1E9PmY0KS
	v4vH/I6/htDaI5gcAIwoJmtbvs2qaHVa1vPj9gFqGjX9OfDkIsLYcSmXUqDErfJQUHzb7rfxceO
	G83acZEwtemDY=
X-Received: by 2002:a05:600c:8b35:b0:493:bfea:2780 with SMTP id 5b1f17b1804b1-49573c99630mr15932445e9.9.1784791591318;
        Thu, 23 Jul 2026 00:26:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3274:dbb5:2710:802b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4956b0395f7sm83940215e9.3.2026.07.23.00.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 00:26:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>,  Kevin Hilman <khilman@baylibre.com>,
  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Takashi Iwai <tiwai@suse.com>,
  linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ASoC: meson: preparation for Card capsuling
In-Reply-To: <87bjbytkej.wl-kuninori.morimoto.gx@renesas.com> (Kuninori
	Morimoto's message of "Thu, 23 Jul 2026 04:11:32 +0000")
References: <87bjbytkej.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 23 Jul 2026 09:26:29 +0200
Message-ID: <1jmrvicgka.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 23 juil. 2026 at 04:11, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Meson developers
>
> These are v2 patch-set of meson preparation for Card capsuling.
>
> I will post Card capsuling patch.
> To makes its review easy, tidyup meson drivers to reduce
> un-related diff as preparation.
> No functional change, but is preparation for cleanup driver.
>
> v1 -> v2
> 	- Do nothing for snd_soc_of_parse_aux_devs()
> 	- Don't replace card to priv
> 	- replace card->dev to dev only
>
> Link: https://lore.kernel.org/r/87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com
>
> Kuninori Morimoto (3):
>   ASoC: meson: axg-card: tidyup not to use card->dev
>   ASoC: meson: gx-card: tidyup not to use card->dev
>   ASoC: meson: meson-card-utils: tidyup not to use card->dev
>
>  sound/soc/meson/axg-card.c         | 25 +++++++++++++++----------
>  sound/soc/meson/gx-card.c          |  6 ++++--
>  sound/soc/meson/meson-card-utils.c | 22 ++++++++++++++--------
>  3 files changed, 33 insertions(+), 20 deletions(-)

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome
