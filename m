Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6885430C34A
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 06:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778048779; cv=pass; b=QHfghLTe1BRVsjuoAuYgMywzMjKjXyAWrv8Gl0vOPZMK/TkmxRgJvdoHr4BqIYqCbtldP10L9y4YDekjEpj0j+gTxAcDMR5tnrdAA+heLDJDwUXhkZkC6g39kk/qhhDUKa1/DI4C2EbhASg5o2qytsTOUFAR8SEvGRYZYtI8Aq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778048779; c=relaxed/simple;
	bh=0V/973qhKikITbexX/BwABU12MHIDK7p6AXvN6Ng7M8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ua2IWYI6XJu2Xm3Jrrb6aJozExWzNo3mMO8hQ6vNtiUnT2XhUBwWYAlW8NpNdrB4hBFYy2rb4TOAIR07+knIex0Bn6KNv8I8UD6AjO4Wv0GolmF7T3OTJolIRmIazyIdU+el54kupWACidFVNfNCs78B35BA8iNyvmB6rKJMwdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=OO9f05xc; arc=pass smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="OO9f05xc"
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D712B3F85E
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 06:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1778048768;
	bh=lXSGFJofNtSRhX4wi9eog1v+DElnz1HCqzPFz62WKhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=OO9f05xcvuy0QEBQvzoqTiBrbp9392papyqhxzEGRZYZLYSEKBReKqqhcRGDC6LAU
	 01UfMgyRFNSdROlbgCbwidj8rM0dAaff1FyGa3SrHNabv9wKtP6FkAAWCBzZCaayMe
	 mHjCTPV3iqNtOUukN5a+7casAOBcjGqWcwvM/ueSFd7XfED7BTrV584EP/2Tops9dg
	 3VtaG94Mhu/rD9TV9xVzTcJ3mi8LEDf0VgETeAQjtZ0HokR5ASG0//TmMo+RYnq5uD
	 //8xBVYQYF9DIeNtGPwfSZccdQKk4g6opKdgnFJmViJ232hEQpdNJdw3KkTSt9GXrp
	 X/6P0XbgwQXpoCAcoCTKJ3T1xQ3RkATngfsLXFTYXIGL8IkKTm+shQLUZp2KV9ZmWx
	 tljEQPO9mS4qGHmuflIWrvXRDVJ6fP1iJ+rISdOmjrI02MUee6NruqTwJMTvbUMFSO
	 v4pF6AKrPprQ7Z29a1s5Kj+0bgH4KTX6JZZ8Bflyxt/4NZTPcwAEbpjQ00+GCBMaU0
	 QgAS/COpIggA2Hkv30fE+CpGmJXWy/TMxc+xak/FID7ioHI4UNgAZyKhIsU1VdZO1N
	 tbv8i36QFRwnHBFIsc0QOKSzvP2jcoL3hDN41FJ7t7DmP9/geIXtm0cVH7Q/JltX+b
	 59LIOPYt8YdmhC08P+ieSxNk=
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12dfb99429bso10017742c88.1
        for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 23:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778048767; cv=none;
        d=google.com; s=arc-20240605;
        b=LGV2n5Saljci0ND5NQTjY1hb+la4Gh0xLqWLG+Wy7UiT29TJ4tKrAQzLxqCAvyds7Z
         LhB0HDaPh+kIViKx399VRg8pzsvwi0bsEzdisL/zgq9J/PpnitMd071Z63TGL+P3jO8r
         yewKFC7346FmOmCNcBNZrfaHhVHsi8NokrjwlvIQkszIXh5iv2kgKMJjb3ZRTdrclkWS
         2ms6I03bYiwIoA09wCIsGLT9Nr9meOYbH6rI4iSEtyQjtNpFUYQHmCbRvfW2YrTuvFOA
         Af3dHJWuE4mUj1ddVNH410pwq9lGKmc+kF05oe/FD+bU+6/Yood6Xpbxhd6UQD/w7RP+
         t0Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=lXSGFJofNtSRhX4wi9eog1v+DElnz1HCqzPFz62WKhc=;
        fh=Btwnzw4Rntx8zkNLnN9leUPPzI2L/AwkjTsoG973Gf8=;
        b=JjhqFhEiZTxIq4LIOIvNHbTsLF7epLr8d87JpfoF2E2uDUfiRhG7am+Fki9iaCsEFz
         1Em73kbUgYkeQ3NXK6wCtg9J/9tTfJf/s5iaRCL5GhjhugDIlghpuCYCE4VblvR0UkYZ
         hJrszCuWxXFgLOH8AIZgu9IAwLin+dKoIV4E5dGyxM+uE2dnSGTN/uPv5bbBmWI35PuD
         bNyaAJjXy6mLxPcyM5Vw4U2Cr2rhj0fXG1XmFOULKg045XyVVHmYSsTaSOan6V/tuaRi
         qi4WPzEKMBI3c41R+Gu5d7rkza2xVXhh2kzcgOkq3xjDaEKoO9h0EPije/cH8hVNXXHS
         2rwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778048767; x=1778653567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXSGFJofNtSRhX4wi9eog1v+DElnz1HCqzPFz62WKhc=;
        b=A5OxGW5mw/VQRXsCutMxA/vLm7N3SarUKjsFX1ULz+5DJpryAPPbXjYZB1gs06AjGK
         WRSEkidwMzPJXu3LZ/OPj9sfZrHEoc/CrFyNreBGCclEJmZMX5UqxJ9gm3lLFbw7VDz3
         vnGXWXpVM1F0XjfB43jTXxZeF0TuCiZvUV6LyczRQ/0rT6GW1T4RmjPAl5Wle2wwjRdk
         DmEmRWg2prkWYsjNic/24koCGVdxq5bD0ePLqobM7Eigz5rUPaDuM56d52h5iR96KeNw
         sTd/Pp67yJGfU0OgifPSMHPR/TO7nNXhecbf0bGGZDP3Vc036FMNcG7NxYdvYL6tBTWj
         Wkkw==
X-Forwarded-Encrypted: i=1; AFNElJ82pwXaburXUNCUR2fb4hWyYJ1H6tRey8VQBMEx4ym6N9NVoPi2I4atEDZqyUlRlITtgXFiwgw0hKp5hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2AC1w9P7E+A8YAf7wnQuo9Jd80pXydmlcq0FlYrLHGJXM4l6u
	SONUwObjzDlNdwwWadQVVD5n+4S6YsDH+b/qb6aYd0FQ7sDMVMsuF1wH96quEKTR7WIEJOfCFQ1
	Mzhq4ejVpsPFMioG+AvEDMVOr/nj2wy3ylvHATiv12KYrf9j66TIm8miY2233E/JtaU52SAdjTm
	DdeaKZUbWQCCGWGrYpz+RdumzwON2jaW+XkOwXt6b53c3TgaTiQow/pyM=
X-Gm-Gg: AeBDieutPPOTokFpKE74Rks4dAmvtNJTwOtsY68YExFfFQEa8oayNImbZTbEer+j+hn
	y50r+CnAvcZkqyIQZmdy5StKOdg+BhzvJf8RiyLa1K80NRsua6R/jUNi920FvHgUu1nlyMLyLQ8
	cfyY7pbP/gxd4QIHXh6S9D1SOdRg9ojxYPpoRqlIzRTWtUVldskrByy0a0Xv3Pv3WEgSnzFBF6D
	Wm/UTzstFM+CMC0NDB84ZBpNZLKc6kubvXpfX0NwCmi6MigzPqNjhZSiiO2pwcxyRHNCKQ8
X-Received: by 2002:a05:7022:6893:b0:12d:ceaf:ffcc with SMTP id a92af1059eb24-131852d25fdmr1291511c88.5.1778048767003;
        Tue, 05 May 2026 23:26:07 -0700 (PDT)
X-Received: by 2002:a05:7022:6893:b0:12d:ceaf:ffcc with SMTP id
 a92af1059eb24-131852d25fdmr1291502c88.5.1778048766470; Tue, 05 May 2026
 23:26:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428073726.1611777-1-aaron.ma@canonical.com>
 <69a3d80d-c9aa-459f-8522-c07e225bd5d9@linux.dev> <CAJ6xRxUuOgfoJ1VP3++Hm_UdhYLJH-16J3rXUcN6O1BmSDJVbA@mail.gmail.com>
 <78c57b26-505f-473d-8472-a491ede5aad9@linux.dev> <CAJ6xRxVeOJWteUsRZNE6QdYvv7ODoErRc7DQda6CdQfvq8-Z8g@mail.gmail.com>
 <579aaccd-990f-449e-a3ab-802b17925ab4@linux.dev> <CAJ6xRxWx1QO286deAhLsCivV2_mx8VFAq=fA8gOkHOUrjATYRA@mail.gmail.com>
 <ee566ae6-79bf-4ee5-9f0f-ba1a2607df25@linux.dev> <78cfbf996d4841fda613e72ca5471e2f@realtek.com>
In-Reply-To: <78cfbf996d4841fda613e72ca5471e2f@realtek.com>
From: Aaron Ma <aaron.ma@canonical.com>
Date: Wed, 6 May 2026 14:25:55 +0800
X-Gm-Features: AVHnY4LtuQ_EsQz4GQozhcFu9j1LUs13WfJlZQrcilbM0CRN9g1gZ1knirIiMIY
Message-ID: <CAJ6xRxXm5Qj8stg8grKeA8qoTzdpnCRoLhOS=JQV3=x-oqb9BQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt1320-sdw: don't poll PDE state on power-down
To: =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Oder Chiou <oder_chiou@realtek.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 11:10=E2=80=AFAM Shuming [=E8=8C=83=E6=9B=B8=E9=8A=
=98] <shumingf@realtek.com> wrote:
>
> > >>>>>>> rt1320_pde23_event(PRE_PMD) writes REQ_POWER_STATE=3DPS3
> > then
> > >>>>>>> polls ACTUAL_POWER_STATE. DAPM fires PRE_PMD while the
> > SoundWire
> > >>>>>>> data port is still streaming =E2=80=94 the codec cannot reach P=
S3 until
> > >>>>>>> the port stops, so the poll always times out during playback.
> > >>>>>>> This blocks
> > >>>>>>> snd_ctl_elem_write() for 2-3s making mute unresponsive.
> > >>>>>>>
> > >>>>>>> Remove the poll from PRE_PMD in rt1320_pde23_event() and
> > >>>>>>> rt1320_pde11_event(). The codec transitions to PS3 on its own
> > >>>>>>> once the data port becomes inactive. Keep the POST_PMU poll =E2=
=80=94 on
> > >>>>>>> power-up the domain must reach PS0 before audio can flow.
> > >>>>>>>
> > >>>>>>> Fixes: f465d10cd731 ("ASoC: rt1320: Add support for version C")
> > >>>>>>> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> > >>>>>>> ---
> > >>>>>>>  sound/soc/codecs/rt1320-sdw.c | 2 --
> > >>>>>>>  1 file changed, 2 deletions(-)
> > >>>>>>>
> > >>>>>>> diff --git a/sound/soc/codecs/rt1320-sdw.c
> > >>>>>>> b/sound/soc/codecs/rt1320-sdw.c index
> > >>>>>>> 192faa431b5e9..e42e8b6de853e 100644
> > >>>>>>> --- a/sound/soc/codecs/rt1320-sdw.c
> > >>>>>>> +++ b/sound/soc/codecs/rt1320-sdw.c
> > >>>>>>> @@ -2000,7 +2000,6 @@ static int rt1320_pde11_event(struct
> > snd_soc_dapm_widget *w,
> > >>>>>>>               regmap_write(rt1320->regmap,
> > >>>>>>>                       SDW_SDCA_CTL(FUNC_NUM_MIC,
> > RT1320_SDCA_ENT_PDE11,
> > >>>>>>>
> > RT1320_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
> > >>>>>>> -             rt1320_pde_transition_delay(rt1320,
> > FUNC_NUM_MIC, RT1320_SDCA_ENT_PDE11, ps3);
> > >>>>>>>               break;
> > >>>>>>>       default:
> > >>>>>>>               break;
> > >>>>>>> @@ -2028,7 +2027,6 @@ static int rt1320_pde23_event(struct
> > snd_soc_dapm_widget *w,
> > >>>>>>>               regmap_write(rt1320->regmap,
> > >>>>>>>                       SDW_SDCA_CTL(FUNC_NUM_AMP,
> > RT1320_SDCA_ENT_PDE23,
> > >>>>>>>
> > RT1320_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
> > >>>>>>> -             rt1320_pde_transition_delay(rt1320,
> > FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, ps3);
> > >>>>>>
> > >>>>>> no, sorry, that's clearly wrong.
> > >>>>>>
> > >>>>>> When we touch the requested power state, we *shall* wait for the
> > power state to be reached.
> > >>>>>> removing the transition delay is silly.
> > >>>>>>
> > >>>>>> You would really need to find out why streaming still occurs whe=
n you
> > get a DAPM event. That doesn't seem right in the first place.
> > >>>>>>
> > >>>>>
> > >>>>>  The stream is active by design =E2=80=94 this is a mute, not a s=
tream close.
> > >>>>>
> > >>>>> To reproduce:
> > >>>>>
> > >>>>>   1. Play audio through rt1320 speaker (aplay or PipeWire)
> > >>>>>   2. Press speaker mute key (or amixer cset on both FU21 channels=
)
> > >>>>>   3. Second channel mute takes 2-3s to return
> > >>>>>
> > >>>>> Muting both channels removes the last DAPM path consumer of PDE23=
.
> > >>>>> DAPM fires PRE_PMD while PipeWire still holds the PCM open =E2=80=
=94
> > >>>>> DP1 keeps streaming zeros. The codec cannot reach PS3 while its
> > >>>>> data port is active, so the poll always times out. The mute
> > >>>>> register write that actually silences the speaker happens after t=
his
> > useless wait.
> > >>>>>
> > >>>>> I confirmed via SoundWire debugfs reads: ACTUAL_POWER_STATE
> > stays
> > >>>>> PS0 while the port streams and only transitions to PS3 after
> > >>>>> PipeWire calls hw_free (~3s later). The poll can never succeed in=
 this
> > path.
> > >>>>>
> > >>>>> Every other Realtek SDCA amp driver does fire-and-forget on
> > >>>>> PRE_PMD with no transition delay =E2=80=94 rt712_sdca_pde23_event=
(),
> > >>>>> rt721_sdca_pde41_event(), rt1316_pde24_event(), and
> > >>>>> rt1017_sdca_pde23_event() all just write PS3 and return. rt1320 i=
s the
> > only one that polls on power-down.
> > >>>>>
> > >>>>> The POST_PMU poll is kept =E2=80=94 on power-up the domain must r=
each PS0
> > >>>>> before audio can flow, and the port is not yet active at that
> > >>>>> point so the transition succeeds immediately.
> > >>>>
> > >>>> well that's an interesting issue. IMHO all those drivers are broke=
n then...
> > >>>> A mute should let the ports active and not start any power transit=
ions on
> > the codec side.
> > >>>> That's what should be fixed first.
> > >>>>
> > >>>> I am not sure either why PipeWire would send a hw_free on a mute
> > either, that's a sure what to have audible delays and glitches. Mute !=
=3D Stop.
> > >>>>
> > >>>
> > >>> hw_free is not involved here. The mute is purely at the codec's FU
> > >>> level (FU_MUTE=3D1 silences the output) =E2=80=94 the PCM stream re=
mains open
> > >>> and
> > >>> DP1 stays active. SoundWire debugfs confirms: after mute during
> > >>> playback, REQ_POWER_STATE=3DPS3 but ACTUAL_POWER_STATE remains
> > PS0.
> > >>> The codec cannot transition while the port is streaming. As long as
> > >>> the application keeps playing, this state persists indefinitely.
> > >>>
> > >>> The power transition is not triggered by PipeWire either. It is
> > >>> standard DAPM behavior: muting both FU21 channels removes the last
> > >>> active path consumer of PDE23, so DAPM evaluates the widget as
> > >>> unused and fires PRE_PMD. This is how every rt7xx/rt13xx driver's D=
APM
> > graph works today.
> > >>>
> > >>> The poll itself is broken in this path: it cannot succeed while the
> > >>> port is active, always times out, and the handler continues anyway.
> > >>> Removing it fixes the user-facing 2-3s mute latency without changin=
g
> > >>> any DAPM topology or power semantics =E2=80=94 the REQ_POWER_STATE=
=3DPS3
> > write
> > >>> is still issued, and the codec transitions once the port stops.
> > >>
> > >> well we're talking past each other. The only thing we agree on is th=
at going
> > to PS3 while audio is still streaming is really bad.
> > >>
> > >> To repeat myself, there is *no reason* why a mute should trigger a
> > power-down.
> > >> I am not expert enough in DAPM but that isn't a desired behavior.
> > >>
> > >> Don't fix this unwanted behavior with a change in how the power stat=
e
> > transition is implemented, fix the unwanted behavior instead.
> > >>
> > >>
> > >
> > > The current rt1320 behavior is consistent with how this driver models
> > > the playback path in DAPM.
> > >
> > > DAPM is documented to make power decisions from stream activity and
> > > mixer settings, with those decisions derived from the routing graph
> > > (`Documentation/sound/soc/dapm.rst`).
> > >
> > > In rt1320, the speaker mute controls are
> > `SOC_DAPM_SINGLE_AUTODISABLE`
> > > switches on the two `FU21` mute bits, and the playback path is `DP1RX
> > > -> FU21 -> OT23 L/R -> SPOL/SPOR`, with `FU21` also depending on `PDE
> > > 23`.
> > >
> > > With that graph, muting both speaker switches removes the active
> > > speaker path, so `PDE 23` receiving `PRE_PMD` is consistent with the
> > > current DAPM model of this driver.
> > >
> > > Given that, I think the immediate bug is the synchronous wait in
> > > `rt1320_pde23_event(PRE_PMD)`, not the fact that DAPM attempts to
> > > power down the now-unused speaker supply path.
> >
> > My point is that the DAPM model seems wrong. Muting should not have any
> > impacts on power management.
> >
> > For some reason the RT1320 driver differs from previous codec drivers:
> >
> > static const struct snd_kcontrol_new rt1320_spk_l_dac =3D
> >         SOC_DAPM_SINGLE_AUTODISABLE("Switch",
> >                 SDW_SDCA_CTL(FUNC_NUM_AMP,
> > RT1320_SDCA_ENT_FU21, RT1320_SDCA_CTL_FU_MUTE, CH_01),
> >                 0, 1, 1);
> >
> > static const struct snd_kcontrol_new rt1318_sto_dac =3D
> >         SOC_DAPM_DOUBLE_R("Switch",
> >                 SDW_SDCA_CTL(FUNC_NUM_SMART_AMP,
> > RT1318_SDCA_ENT_FU21, RT1318_SDCA_CTL_FU_MUTE, CH_L),
> >                 SDW_SDCA_CTL(FUNC_NUM_SMART_AMP,
> > RT1318_SDCA_ENT_FU21, RT1318_SDCA_CTL_FU_MUTE, CH_R),
> >                 0, 1, 1);
> >
> > And the main question is "why"?
> > There's been no change in the topology definition, FU21 plays exactly t=
he
> > same role but is handled differently.
> >
> > Maybe there are separate DACs for left and right, but that doesn't mean=
 we
> > want muting to impact PDE management.
> > If you look at the helper that is being introduced, no one has any plan=
s to
> > remove the synchronous wait after changing power states.
> >
> > Shuming, can you please chime in?
> >
>
> Hi Aaron,
>
> Sorry, I don't have a clear understanding of the root cause at the moment=
.
> Could you let me know which project this issue was encountered in?
> Also, could you please contact Realtek's PM?
> We can involve the owner of this project to help reproduce and investigat=
e the issue on the Realtek side.
>
>

Hi Shuming,

What I can confirm is the following:

1. playback on `DP1` is active
2. both `FU21` speaker mute bits are set
3. `rt1320_pde23_event(PRE_PMD)` writes `REQ_POWER_STATE=3DPS3`
4. `ACTUAL_POWER_STATE` remains `PS0` while the data port is still active
5. the synchronous wait then times out, and the mute control returns
after about 2-3 seconds

So the immediate issue I am trying to address is the blocking wait in
the current `PRE_PMD` path.

On Pierre-Louis's question, can you confirm whether using
`SOC_DAPM_SINGLE_AUTODISABLE()` on the `FU21` speaker mute controls in
rt1320 was intentional, and if so what the rationale was?

Regards,
Aaron
