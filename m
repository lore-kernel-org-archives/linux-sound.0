Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A648488D9C
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 21:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593962; cv=pass; b=MjfndYfMRHZDhsK0Pc97RxnmkXwzZBvBEnemT2MHYYcJnc3332nfP+dP0dqBYCKjcX8+UoUZPhN6wdS6at/zACdkzrVdMeVpA54tqqbQ6n+BaTyoPJeg3aDLpHcvTFBfFr8yT88qZ0DEPoS5xNd9V11BkO74OyyfbVnmmZwb3YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593962; c=relaxed/simple;
	bh=PaEyW8ziV39/D+o3TZiBGYjeiJYSGmcsepQiVBnz1sM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BITwwYoeQg+w9p8ckdUjsK75l4nU1/k2MxmTu/bcYlW/WtD69hGTmTw6/JrwM4GztgJMOk9uyZph4mYPhjPI8Yjyfas48+Vh5H5nqJhLxtxIc7c/Cj+fww33wCO63mYyptFdxAbcqB4pwN9jVLk2wzd/sekJ0Y0SaVrvvg5OsVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfIu5n/t; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfIu5n/t"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe5so31761366b.2
        for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 14:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789593953; cv=none;
        d=google.com; s=arc-20260327;
        b=VGGGMrBG54k9lY7ZognDcPF4GIPr3ZUyAaE3z3BZrOnM5PkM6Un9akzVhLTh/Ok9mI
         uBrFq19BfCdSuvSnzA8RmkKe8EknhO5iOhdKaMNUg++3pITSMqhp/Kkkwzi/eZqszaTy
         3ZzpBqt7Bn9xpBUzJvbbuWk7OecCMjnfij7HA+kC0y5tVlzl6uPhImZlc7tTwagN9Yk0
         OdXG/CER0D/eLYppNpG8kSd/hPOJ7VA0OoGfL7HFbBaJgSj7M2jzGiTuKw1WqWOf9M6p
         MqJrI+GxSfYYbBLeKAly/qI0fNwlQ6ZE6C+z1+Yh/J/PgEWotTa6saxBmRvkZ/MfiZX9
         GfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=24dq6MGP09BQVdqu/qtRfDCvRFA88J8G77yWogi+o5k=;
        fh=HC4EFkbC/wmjHAmKqhjH017V9zQ0EpdtDWu3nqUf27c=;
        b=ieqCicBTpgH1ykTHcOYNNyjC7ESKKLfw1BfzchOnv6BSDousuMSMIxiYr/ipO7IRP8
         ZIs2BOaRlpr3/S8VxLEAe4JkDbChRYU0cd8ZnWW5OXZXtqVmbpxsbmEUSsEwimCUegGy
         B1QblI7QpnQRQX/E8zBh7z2jkNp7MWTwCo8XfO/B/lgT79jbtBdhWTxhomgGvSXjtpEo
         mzm00udCpf9QjHbiAw7lDr19A3vcYRppsTheYLekjgV08tn7f/JzzXVyl1wA/aA6pNC0
         Xipo4Tb810Uxl7e7RBzhgCSY4XJqUelK8yyudkFBaQfEZiE2+0ZicznHlyaGKtzY2UIZ
         9QsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789593953; x=1790198753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=24dq6MGP09BQVdqu/qtRfDCvRFA88J8G77yWogi+o5k=;
        b=MfIu5n/t1RRV2o/akMJ+Y31OkeyhzD2pq7zmpeZYO4oUGALZZNAW6R7ZQrHOdY01oY
         aJCPZXbJd3tR0RcGsB4VR7z1EqiWPQcldm+1+WF3JPxZGZH8edKlprJ76XvmSAAOTqUp
         kbRmPNf80/Yrs8PE3nnlzjAQHj7a8IgBsHlnK0l6XljHuaNLSn+jGOMK9vXt/jisRZ1o
         OrO/1DWdFp5ykOXUlwTpXDkiOkthwoRpfliaERFEdiswXKomJuwUAdWvnSnp73u/3IrQ
         OHl5f1FrRzafawmfnwoqLbAh2NzN/bE+8PMZfYNlHv9uf8BLgPeaxO7nfbO8miWoWCaK
         vtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789593953; x=1790198753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24dq6MGP09BQVdqu/qtRfDCvRFA88J8G77yWogi+o5k=;
        b=gLsRkwmSpGgAnsNE04RE7jwTh/XaG5xye1eqCaEPgZZjtESsBv2i6x6soUiIh4hI7J
         7WEO73ft8wQcZBPa9rHfgy3MbL0iHZNKS+9Idi1ceTZ7QkCIRQaQ2fA8d5rWPyO1977E
         XC0v+OaAtHHCxnpUknlYMPByfgoQVUQ/RZqWcwpIL37+hcAfYYs6eJXrwhMk9HKK0cyg
         La/+3pBn379tWfUhrokHEnUK/+rx0nj4Gdr6aY8ahXiYgBx72YAJzczA35wmisZob/vE
         +IeJNTScUBngnhOBMGxmc+pjX1GVdKf19hG1TCxNYTIepHYyfB/Y638U6IRbKbZ3bNrr
         018Q==
X-Forwarded-Encrypted: i=1; AKwUvBy9yyI1hPHxWeHuI8vqN8xav0uLg8k5z+3aORoFq454s/RlDqi0NmwWGj8xYMHBqc5ND6xO6Qv9dY62Dw==@vger.kernel.org
X-Gm-Message-State: AFuF++lC3u84K2n4jGcroCO2ShH4QZZUFj9BOjQkSatIhdxWJ2TRJ8wc
	nU3V71Sy/mslCdfiDkxwj43PEIulV/w4Xjpzbx6zaroR16eOVqI8RHEiyjwCZ3COUPpxhcix8eJ
	ffmz8mk4Z+PNOtSRnkqSLrk57GCwbMmw=
X-Gm-Gg: AYBFou3hBtngoXlZTQJVjl2NOe1fNH2t9I7cZa7pfXVVv66Dfc3/EYM24eOI6dCPobc
	4Hgfj/BlAxt7Bjq2/Q6yDiA4a90sG6M5+VKZHTmpd+rTaCcT/aXVwgIPonUO61i8j4aIbMab8an
	J/0vNDv9jWI6f03dFqHSI5AaopMhdVdF2fo98xpcxWn6tMkDtam3zFF3yUMmhHdIKfuzE36/cCH
	x24UCaTDI7jHo+0uo+CoDzAFL9HxKpSvFT9PFfNsh5Opw037nd/LSKl4D0EcBolAe74yhtpUffM
	R3veqcp0ImG5qJ7zlhdVBAfUlc7TdhLmSOhHJxzg2DEgmqCz5bLpfGnW/ySQCiL9dBdBMB0KIHO
	1RVv+8z7TMRGfFm3tk8tIXgfmvtJiyZ858NeqS+IFMnSeGCrebthkJXq6YaSKJ1bB/TlVVUQNfS
	X01gFPqYnobJFbFkThN7cHTZb1GVdywcZBfVFCeOe9CWHja1iByDFw3SUHSgWZBYEIvpcXG+086
	f59
X-Received: by 2002:a17:907:9343:b0:c29:62d8:68af with SMTP id
 a640c23a62f3a-c29e5311f45mr285472266b.47.1789593952818; Wed, 16 Sep 2026
 14:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915181709.11323-1-rosenp@gmail.com> <aqrxFTWEsJmFIrel@SMW015318>
 <CAKxU2N_zEA1NxAp6H6J6COjTwUv8NK909m3OZ2kcyVCpCby18A@mail.gmail.com> <aqr7Lfji97j_0nVd@SMW015318>
In-Reply-To: <aqr7Lfji97j_0nVd@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 16 Sep 2026 14:25:41 -0700
X-Gm-Features: AcwNN1V3Sj2lR93W3zP_MWf1RpGY0ZFkZFuGnqEzbiPZuRWy3aeiqO_w5mHISZk
Message-ID: <CAKxU2N-bWXPHNgg2jLjZ8dUFQELr8RV3kWhKdSi8gKF3_9JRVQ@mail.gmail.com>
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

On Wed, Sep 16, 2026 at 1:25=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Wed, Sep 16, 2026 at 12:47:52PM -0700, Rosen Penev wrote:
> > On Wed, Sep 16, 2026 at 12:42=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com=
> wrote:
> > >
> > > On Tue, Sep 15, 2026 at 11:17:09AM -0700, Rosen Penev wrote:
> > > > Allow the BestComm DMA engine to be selected for PowerPC
> > > > compile-test builds.
> > > >
> > > > The freescale ethernet and sound drivers now need a dependency on
> > > > PPC_MPC52xx as they use headers/functions from that platform.
> > > >
> > > > Assisted-by: LLM
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  drivers/dma/bestcomm/Kconfig           | 3 +--
> > > >  drivers/net/ethernet/freescale/Kconfig | 2 +-
> > > >  sound/soc/fsl/Kconfig                  | 2 +-
> > > >  3 files changed, 3 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/dma/bestcomm/Kconfig b/drivers/dma/bestcomm/Kc=
onfig
> > > > index 5dd437295964..153b5492c93c 100644
> > > > --- a/drivers/dma/bestcomm/Kconfig
> > > > +++ b/drivers/dma/bestcomm/Kconfig
> > > > @@ -5,7 +5,7 @@
> > > >
> > > >  config PPC_BESTCOMM
> > > >       tristate "Bestcomm DMA engine support"
> > > > -     depends on PPC_MPC52xx
> > > > +     depends on PPC_MPC52xx || (PPC && COMPILE_TEST)
> > > >       default n
> > > >       select PPC_LIB_RHEAP
> > > >       help
> > > > @@ -34,4 +34,3 @@ config PPC_BESTCOMM_GEN_BD
> > > >       depends on PPC_BESTCOMM
> > > >       help
> > > >         This option enables the support for the GenBD tasks.
> > > > -
> > > > diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/e=
thernet/freescale/Kconfig
> > > > index b34c0fcfddea..d81984fcec64 100644
> > > > --- a/drivers/net/ethernet/freescale/Kconfig
> > > > +++ b/drivers/net/ethernet/freescale/Kconfig
> > > > @@ -38,7 +38,7 @@ config FEC
> > > >
> > > >  config FEC_MPC52xx
> > > >       tristate "FEC MPC52xx driver"
> > > > -     depends on PPC_BESTCOMM
> > > > +     depends on PPC_BESTCOMM && PPC_MPC52xx
> > >
> > > use seperate patch for difference subsystem.
> > The issue is this patch exposes the issue. It's also extremely
> > difficult to get anything into net without the maintainers claiming
> > this is pointless churn.
>
> Maybe you try enable COMPILE_TEST for FEC_MPC52xx also
IIRC it compiles but does not link.
>
> Frank
>
> >
> > >
> > > Frank
> > >
> > > >       select CRC32
> > > >       select PHYLIB
> > > >       select PPC_BESTCOMM_FEC
> > > > diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
> > > > index 04940879dfd8..101bc952aa14 100644
> > > > --- a/sound/soc/fsl/Kconfig
> > > > +++ b/sound/soc/fsl/Kconfig
> > > > @@ -234,7 +234,7 @@ config SND_SOC_MPC5200_I2S
> > > >
> > > >  config SND_SOC_MPC5200_AC97
> > > >       tristate "Freescale MPC5200 PSC in AC97 mode driver"
> > > > -     depends on PPC_BESTCOMM
> > > > +     depends on PPC_BESTCOMM && PPC_MPC52xx
> > > >       select SND_SOC_AC97_BUS
> > > >       select SND_MPC52xx_DMA
> > > >       select PPC_BESTCOMM_GEN_BD
> > > > --
> > > > 2.55.0
> > > >
