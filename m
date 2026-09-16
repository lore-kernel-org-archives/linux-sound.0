Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC3640862F
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 19:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789588095; cv=pass; b=lBo9cGtUwz4Wk1KdshDNspZBmgj8XtxmG+8sczYCn4Xi29d2cf+l46lF4JCwtlmtnFjkDrTybMLEwFNNPkTh7rJhDIOQpX4ThDEntZhDJfPVsyeREOcY1P6+KzWF14APfmMtXo1+LYDHjALaR9k9U2w6Z4c2sePRhUnMFGeLjlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789588095; c=relaxed/simple;
	bh=wU+5155qdUPgw7RyzztSXCOgYlXDyq4rSWa8o9Db53U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYlMP0/UIHXUreuhlHYq/3UaZDGjF8t5UQ/6MBpop+D9VgpZDILI05ujyHIiRNBWlNeTl9A8NCJkY1YeKhwguuPR80LOZuRGNGOHyrdS2VWumQ+sj+YP41MxqNuGA2OpKwVp/6ifcKoEWP0AiSRYpLU0i4YTqhgXWLIFZKcLCSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3wCsWwr; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3wCsWwr"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294af0caa8so20433566b.1
        for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:48:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789588086; cv=none;
        d=google.com; s=arc-20260327;
        b=HZRhiJmKiCyuAaX/DxGwzQDktEs6B0Ga2mqES5Pqw5k2XPLPqEglbZcJOr4wpqGWZf
         B9bryKQzVsxl4dl+Ma375486TudxvTHqRx7iMJL/+1DHYSq+rC8i4F2f809YOsKhke5K
         Lv4xef3yoelo8ndhQS5Hcm5o/QG3QxpfoQThNhqNJVx0Nd9KClg072coPQBOagnI9AqC
         sJw2SvKXo+5n4PPk2U2+oGW643ckYFaFl9XZVnFnuB8wvrX/esqPwNJ0v5tVRbBYSC7i
         6ETPu89RGrxALRksFs9ZDn7j3td3FwYxBvLqx7a6CS8x3/lqubpqHgbmMqLZVcUTeT3O
         +RRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uUwNANsqCyAEnoTGeTMQrWBhCYCOT0fgfggYDa58xD4=;
        fh=Oux+YEFjm60TM7sPXOf2+J3Eb92gOwOriIXTPPG5PrU=;
        b=h6onifQPCYKwr03u8CrfdWkiqkYWWcfw0SWMHKHBJzn5xr+6p5McC/culg1Bn0xz08
         sVJxEQ5r+sWsBLyzzB755M8n07x7ieEsUmM4Un/lvvhHxdTPsaxlNBlOyHhzH+7aAYNc
         6YLQgHSAdzKx48Mk1UPBkZzaNmDc6qaenZVJ0C38zYbpQvBnPE92Uy4woPerUhTetmGs
         eFDbLOLrSJ3CFZNcSQJQUiqMwacIqVIDr0o4vQK12lJvkyOp2EzKi2rvDa//WY9zHhv6
         wN2HHz1hmsx4z5Wj3dJrC2MB5Ww30WjUqWoE6tiV7rIVFCt5g4MNEsLEkQXj1qC+ZeiS
         zRLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789588086; x=1790192886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uUwNANsqCyAEnoTGeTMQrWBhCYCOT0fgfggYDa58xD4=;
        b=H3wCsWwr/wqoeV/byKUorfvf1//TjUw+lUK7PZ9FoQIuayEavGD8iAfUto4Hkte2DN
         0ib2TCGLehY9/G9o5/uX6fhPxzN2r0AKAfWGA4owTHgu/Mkig9DY8I7i5arikNQgnp9+
         ypFKml4y2hCIXDS1sXJCgn9kca7+HjVMlMWduaCdE63pFw9FFc3mO3j7D4D8NLj1Xr9o
         e/Z05HuQtzAaWV9++IziI688FmAOUIhiuNOWbDMg3m1pnDq9yv1wQlSAltuU2lNX9Xop
         K6nXE051Mvv3w6GaUSZnrLIjH4qVI9L6AblZV6NQJuvwQQn0xkn1Z3WRcwfe0Xon7Wkf
         PJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789588086; x=1790192886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUwNANsqCyAEnoTGeTMQrWBhCYCOT0fgfggYDa58xD4=;
        b=yGdM/BecbqSFUYszf2lQ7/OSnsHE0hGUlhFksSLGzrv3jkjGHVGVP9lSf/vAM9P50o
         4qPTk5tzG4SH8G0GIuK0W4qIzyjQzFnMfPIDMK124KZWGz2ENeQI0T2EOFhWaZcS0s3i
         us8IfLvIJM8XTXr8/pQMXJHAtUf94dMtfHl6/b0O5gPGLtqjsUnqDUDqlaOfnFK4Rq0R
         CPaWqrTUvOp05iRgnr2yyRbXj2H91NLezED69RsXOl10zckrgPewOxYJ39xDoZEaxTW0
         QBYmGuVp1a0JEets5Sx8GkpMH60Po3GHcaTKv7+eH8W/UzvUdhN5ZrS+GwV1p5ZtkETR
         fizQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpP5fjFw9Cp5PpJg3dbh6wzBsea3WbztoB7KlaKQrqBgSQnIjTnYawLEuVKt0NqOQ+rBHzr8hZJIHyWA==@vger.kernel.org
X-Gm-Message-State: AFuF++lBdmORqvOkpB7oh4G0206XA9T9Rrll45i8Giwv5W29aSrUB8tA
	hTWsxUb+0Trf9OOdHcbbBjv0m5tSWVWTFV1pUA+1DVZvlOyyr44UEBQYj7XO/BS9eOc7hsBPRt8
	WVH22jjv+M60arEHD3vZlE5gjMhW0u2Y=
X-Gm-Gg: AYBFou1/8vpFFDrF0Ov0FjUQsdB/qbhJThnuAAcpVCJmLmRrRhCWUbZoh7/Tisp7Qzi
	9MpWfAJitsIek8shhTYMSIeG7n5/gqJIXAKIszem7xF109PK/WVw5wa6JnrhJI6eLQEySbAtpy1
	obVl+6HExfrcBkDv41Qb6VxOnmL3/evCHUm3Km36ZobhmdpN1fRoi7e0DwfyEGssZ80lbwtmh1V
	DmnBU4ATzWjFYovNIlRE6CFnEYj4cbU77YyWDKyrvqeciG5A1RH5SNGqfsiqhBKA1y5pXg2lPmQ
	wmaEUjzPqjA7CkcqUi3CMfGc28wlKTq5WiUMkv/AKPz0y2fwBFpynK5G8r9VauIiZcp3+HlMK+/
	rEdMQBasw4pMNVHC2FFTQaim2U1W8+DQTXwGlxD/4G7Cy/fM+j2FX9k7c+5JTO/krQxQPX/WXZs
	4ccLZg2usHNO7c5CnoTsaMUCTVwA860UcZJxlKyroR3uPsFYSrKulOPEM1i3TUuIRM+Q==
X-Received: by 2002:a17:907:c705:b0:c29:6400:ef8e with SMTP id
 a640c23a62f3a-c29e5413d2fmr269131466b.42.1789588085865; Wed, 16 Sep 2026
 12:48:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915181709.11323-1-rosenp@gmail.com> <aqrxFTWEsJmFIrel@SMW015318>
In-Reply-To: <aqrxFTWEsJmFIrel@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 16 Sep 2026 12:47:52 -0700
X-Gm-Features: AcwNN1VWEP860etYY_BLQbwSQ7HYCEYQgEcVWOM6xtWBlz1ixaj6SyE77I5cWWg
Message-ID: <CAKxU2N_zEA1NxAp6H6J6COjTwUv8NK909m3OZ2kcyVCpCby18A@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: bestcomm: Enable compile testing
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, 
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:42=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Tue, Sep 15, 2026 at 11:17:09AM -0700, Rosen Penev wrote:
> > Allow the BestComm DMA engine to be selected for PowerPC
> > compile-test builds.
> >
> > The freescale ethernet and sound drivers now need a dependency on
> > PPC_MPC52xx as they use headers/functions from that platform.
> >
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/dma/bestcomm/Kconfig           | 3 +--
> >  drivers/net/ethernet/freescale/Kconfig | 2 +-
> >  sound/soc/fsl/Kconfig                  | 2 +-
> >  3 files changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/bestcomm/Kconfig b/drivers/dma/bestcomm/Kconfi=
g
> > index 5dd437295964..153b5492c93c 100644
> > --- a/drivers/dma/bestcomm/Kconfig
> > +++ b/drivers/dma/bestcomm/Kconfig
> > @@ -5,7 +5,7 @@
> >
> >  config PPC_BESTCOMM
> >       tristate "Bestcomm DMA engine support"
> > -     depends on PPC_MPC52xx
> > +     depends on PPC_MPC52xx || (PPC && COMPILE_TEST)
> >       default n
> >       select PPC_LIB_RHEAP
> >       help
> > @@ -34,4 +34,3 @@ config PPC_BESTCOMM_GEN_BD
> >       depends on PPC_BESTCOMM
> >       help
> >         This option enables the support for the GenBD tasks.
> > -
> > diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/ether=
net/freescale/Kconfig
> > index b34c0fcfddea..d81984fcec64 100644
> > --- a/drivers/net/ethernet/freescale/Kconfig
> > +++ b/drivers/net/ethernet/freescale/Kconfig
> > @@ -38,7 +38,7 @@ config FEC
> >
> >  config FEC_MPC52xx
> >       tristate "FEC MPC52xx driver"
> > -     depends on PPC_BESTCOMM
> > +     depends on PPC_BESTCOMM && PPC_MPC52xx
>
> use seperate patch for difference subsystem.
The issue is this patch exposes the issue. It's also extremely
difficult to get anything into net without the maintainers claiming
this is pointless churn.

>
> Frank
>
> >       select CRC32
> >       select PHYLIB
> >       select PPC_BESTCOMM_FEC
> > diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
> > index 04940879dfd8..101bc952aa14 100644
> > --- a/sound/soc/fsl/Kconfig
> > +++ b/sound/soc/fsl/Kconfig
> > @@ -234,7 +234,7 @@ config SND_SOC_MPC5200_I2S
> >
> >  config SND_SOC_MPC5200_AC97
> >       tristate "Freescale MPC5200 PSC in AC97 mode driver"
> > -     depends on PPC_BESTCOMM
> > +     depends on PPC_BESTCOMM && PPC_MPC52xx
> >       select SND_SOC_AC97_BUS
> >       select SND_MPC52xx_DMA
> >       select PPC_BESTCOMM_GEN_BD
> > --
> > 2.55.0
> >
