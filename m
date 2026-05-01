Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FAE39EF20
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 12:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777638246; cv=pass; b=TfzBO2mwjrJdVlhi4hzvwRul+WJB1bBRNxfyq7GFAaMlwguwWtIG/O/bRh7kP1/+kgvlXzz76NNNbP3s/akysLQlP/Dps3JS9SgAAzwvowNGb78Lw3vTh8sXZTsrHPQNo8Hfn32Li3YmNYgSrpGKAYFOfMx1lKd8pVbnuOps4cM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777638246; c=relaxed/simple;
	bh=LPm0+K4i6lGxFJ6h0W2UZct9gJ3DEXyv78XPYSegIl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AoLtdv5HWsT+ImspiJFio3Mf00kZPpWQXPliIB71rda6O6M52QrTmgtwvmuopG1BOA6hIe7VxKk3dDm658CZ8JR5IM7C790Ghk/6gqeEGHyw0tKIPXp14gQXFkgLprdj7Rdw2PxiqQ3T1PzkU+yo7EjJNomha20i+RQZ8bTNuAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=kwbqsVnU; arc=pass smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="kwbqsVnU"
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DB2AC3FECE
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 12:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1777638236;
	bh=LehvrC/EwCqytqj7XaSFhay2+icV8/y+NPt4SLYsWZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kwbqsVnUuZZKo9pGSysHpaGbzLCPCpNXPUnH5Nn3xPnEx6JLsqDDqbqi85CArXc0+
	 ZWlDM2wzxBvKkZH+j8tknTPT6tzbiHz8Htzg0pxdHdHCULF2K6M0ScHF0Sb7KBEg9d
	 BzMJ+Pvm+XiztOmMbmiyJ34BcU/b9RjXoz3YicL2kS1E6/eWXE6qMG7WTd3tZ47EiX
	 VeP8/a9P3CCvvIR6Nq1gKwY+/KaQu+quzgpXl7ICxKOt7xH9y3GomZuMXXSodITC8S
	 Ou3LyfwfRIQkdRjlHVXdk1XV5VPvdRXZx4zkFUYyRhmO6/lNSeapZBm+A5z4iZwfjy
	 mrtaehn5FBQ6k9D9tF06CxsqgKDOupHemBIk/bni8UCvokGQQ6+EV1imYescYrNmYN
	 3AZpWsMQR8OjYU98KOyc2g5LaAjF3LXUt3APUEeMeMpAl7gbpjHw0ihEzpw+Ze8h5w
	 wMINMWabjy6kgr5UPuN+QOCg9TYMn7KlS6Ure63CPDj7Ns/k6mL99DJIS6RlnF2OKJ
	 6EznMOXu4seA0CZ9j8S2W7gjmRNtu9JkmtGxQ3uldU2hVwbNI3vc3FJep9FJqcDx3o
	 slx6Qr71skDLjA+g88QQ5xoLGbn50JOW2UfZz5ktxelKptPZ2U4gqDkHhbTMeqwYib
	 1eMSkvyCG+lA8nv1Xum0CaDM=
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so300611eec.0
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 05:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777638234; cv=none;
        d=google.com; s=arc-20240605;
        b=RO1gfVklSvSmkIgntFzBEKVtBJ7Oyz0Iuf9PwB6uZMF8Gk61wxMciw/2NolmPpOZRN
         2b0t696T/vTwTD4gZ5EhUeIDnqW/5tGIlJtA0y+THa23ZCnOrCeDRLEuyai0Da1MXScT
         mJDyH4IfloXq79KJEB3ixfy0tIGqNId7unclu+ybuEYENSI/B+dMgJ35UUEIqFf0a22g
         VhiW56SprRpkTe2tEdqNPXWY8w5FEZQ3RJtY7YsCwcT8LzjiAzmyikL8s23fYIkGG1WQ
         rkrKY04SucpHayfKkpcNyS0PlU1Oquyqg2POdZgDKEJbgofj8jUkU10IM/rnqri6pqkR
         OWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=LehvrC/EwCqytqj7XaSFhay2+icV8/y+NPt4SLYsWZQ=;
        fh=kNFkK4+7M8J3DJnKfM/GUB6gMH41XZkj5gwPXnxUFdQ=;
        b=DmvsbMIn07impOP1o+U85UfGaJUykjWls/xJdzPFfEAxyYxaLDMUca/gxy+jzu0ZFk
         RGY19XEorEpNVfP6up+2TyfBvXbj8ypubdSttWeE6fnHF1fC6A1TWLQhwhi1vc3f2abA
         7+Mxqr6iFq/wuOsCFL4FXgeFqybxBOP6jkz0uklhlK/aCb+Anl+0IPPcXyR+S+ZjAJjs
         2465FIpiAsLGHst1boQhkKJMQi9TvD2af/WWhOU5yfJ/Yp3yRLMZ60fvTE+hZ5+u+vhi
         0n9hIfm3Yd5b15V0M0P3Q2pHLSBzv58QFWkwIIceN2+OyjQ57LgaWU+5wSLV/Hvvn115
         TmzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777638234; x=1778243034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LehvrC/EwCqytqj7XaSFhay2+icV8/y+NPt4SLYsWZQ=;
        b=NBYc/st/CrYHfISPFEzx29mchgVKnnt9+FCxeAc4yXLX+6zFNX6n5uEME1YcyUo7ZR
         2yvNeCsm6vjxRY/Wa9sGmy22PpyOxdcawJ539GZdYXt/19fuNDGY5kwqtmkGGRvYiaFF
         hVaEpz3Kg0Due1RtSU65pdeB4LSwZQM5cn+rXAdlONhBkCOdBAizm8rxlN0gArJkJxmI
         EzUzBwkQiqnFIVW3pKGwSsFou/iYVWXi1GGds+JRkBNnDmShJY7XofXDgE3dHq7bEgy0
         SmzJ+ZVhoBH1WRySI2SmBkE4SbBdG4JEhPpvKyAOX2DJlquvC2wWCDbebR3za5xCFbl9
         AfAg==
X-Forwarded-Encrypted: i=1; AFNElJ9vecmISwECccHC5udk/uc/dychAfaa3Fe6foqz4s6Dr9lDoQsmDvMVwnWpAEDxcFfCFT+pR56StVaH4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs0O3mMlUH4Rj3gT3og09SescQ0H3ZQt/4npFdanVPxvwWOuzJ
	9zU6kapGHZGfzseMBnWCm2+Xs06vxxsqBLFMrQafePVtuSY3kh1lzweWZ3phwwVikwPLzemvxq5
	8oQGDyg47Rq9N6dbVawN00n0YCR4rpjuZIi3R+fzaIRz8nFu7V1jpsLVRldsdxAq5MO8uw6Z4kc
	vXGViGx/wm/h88A21K4f7lwCOOLytaCpz9F7uU1TyGaMWCJDmPTicsVJI=
X-Gm-Gg: AeBDieuoanwQZ8lxAzs865TU6tjB+h4D4v9DhW4wwweIxdbsgUkLf3VAXce6u+upQCr
	eP0+xNgSv5YDY+tNjZUpLV7fbQmlpi2BIYXhgGIPCuTynY/fmZjHd+m8xZLuLjV6bAezwYdGTcY
	JXvfg1/xbr+ilxdEFNaQ4VBwLj1pZiyYiau32oQ/rgHyGNVzRiEXdaqDmYK0MMqIcYPnO2blLy7
	4AbJ7KsTWFUm4OqJqkSfZSC1DdVwWLoVJ25TfwOy2wykrd4k+9qQi6SHTXLv8ar8cVic9s=
X-Received: by 2002:a05:7022:100b:b0:12b:ec96:c936 with SMTP id a92af1059eb24-12deac541cfmr3338972c88.14.1777638234230;
        Fri, 01 May 2026 05:23:54 -0700 (PDT)
X-Received: by 2002:a05:7022:100b:b0:12b:ec96:c936 with SMTP id
 a92af1059eb24-12deac541cfmr3338958c88.14.1777638233738; Fri, 01 May 2026
 05:23:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428073726.1611777-1-aaron.ma@canonical.com>
 <69a3d80d-c9aa-459f-8522-c07e225bd5d9@linux.dev> <CAJ6xRxUuOgfoJ1VP3++Hm_UdhYLJH-16J3rXUcN6O1BmSDJVbA@mail.gmail.com>
 <78c57b26-505f-473d-8472-a491ede5aad9@linux.dev> <CAJ6xRxVeOJWteUsRZNE6QdYvv7ODoErRc7DQda6CdQfvq8-Z8g@mail.gmail.com>
 <579aaccd-990f-449e-a3ab-802b17925ab4@linux.dev>
In-Reply-To: <579aaccd-990f-449e-a3ab-802b17925ab4@linux.dev>
From: Aaron Ma <aaron.ma@canonical.com>
Date: Fri, 1 May 2026 20:23:42 +0800
X-Gm-Features: AVHnY4LAIUPRYevr_5ItS57tgFyGaKLEkwbHDWFdzp5v05yt95mpXJXn6zgFI9Q
Message-ID: <CAJ6xRxWx1QO286deAhLsCivV2_mx8VFAq=fA8gOkHOUrjATYRA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt1320-sdw: don't poll PDE state on power-down
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuming Fan <shumingf@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 1, 2026 at 3:59=E2=80=AFAM Pierre-Louis Bossart
<pierre-louis.bossart@linux.dev> wrote:
>
> On 4/30/26 10:45, Aaron Ma wrote:
> > On Thu, Apr 30, 2026 at 4:07=E2=80=AFPM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.dev> wrote:
> >>
> >> On 4/29/26 06:12, Aaron Ma wrote:
> >>> On Wed, Apr 29, 2026 at 4:20=E2=80=AFAM Pierre-Louis Bossart
> >>> <pierre-louis.bossart@linux.dev> wrote:
> >>>>
> >>>> On 4/28/26 09:37, Aaron Ma wrote:
> >>>>> rt1320_pde23_event(PRE_PMD) writes REQ_POWER_STATE=3DPS3 then polls
> >>>>> ACTUAL_POWER_STATE. DAPM fires PRE_PMD while the SoundWire data por=
t
> >>>>> is still streaming =E2=80=94 the codec cannot reach PS3 until the p=
ort stops,
> >>>>> so the poll always times out during playback. This blocks
> >>>>> snd_ctl_elem_write() for 2-3s making mute unresponsive.
> >>>>>
> >>>>> Remove the poll from PRE_PMD in rt1320_pde23_event() and
> >>>>> rt1320_pde11_event(). The codec transitions to PS3 on its own once =
the
> >>>>> data port becomes inactive. Keep the POST_PMU poll =E2=80=94 on pow=
er-up the
> >>>>> domain must reach PS0 before audio can flow.
> >>>>>
> >>>>> Fixes: f465d10cd731 ("ASoC: rt1320: Add support for version C")
> >>>>> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> >>>>> ---
> >>>>>  sound/soc/codecs/rt1320-sdw.c | 2 --
> >>>>>  1 file changed, 2 deletions(-)
> >>>>>
> >>>>> diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt132=
0-sdw.c
> >>>>> index 192faa431b5e9..e42e8b6de853e 100644
> >>>>> --- a/sound/soc/codecs/rt1320-sdw.c
> >>>>> +++ b/sound/soc/codecs/rt1320-sdw.c
> >>>>> @@ -2000,7 +2000,6 @@ static int rt1320_pde11_event(struct snd_soc_=
dapm_widget *w,
> >>>>>               regmap_write(rt1320->regmap,
> >>>>>                       SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_PD=
E11,
> >>>>>                               RT1320_SDCA_CTL_REQ_POWER_STATE, 0), =
ps3);
> >>>>> -             rt1320_pde_transition_delay(rt1320, FUNC_NUM_MIC, RT1=
320_SDCA_ENT_PDE11, ps3);
> >>>>>               break;
> >>>>>       default:
> >>>>>               break;
> >>>>> @@ -2028,7 +2027,6 @@ static int rt1320_pde23_event(struct snd_soc_=
dapm_widget *w,
> >>>>>               regmap_write(rt1320->regmap,
> >>>>>                       SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PD=
E23,
> >>>>>                               RT1320_SDCA_CTL_REQ_POWER_STATE, 0), =
ps3);
> >>>>> -             rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1=
320_SDCA_ENT_PDE23, ps3);
> >>>>
> >>>> no, sorry, that's clearly wrong.
> >>>>
> >>>> When we touch the requested power state, we *shall* wait for the pow=
er state to be reached.
> >>>> removing the transition delay is silly.
> >>>>
> >>>> You would really need to find out why streaming still occurs when yo=
u get a DAPM event. That doesn't seem right in the first place.
> >>>>
> >>>
> >>>  The stream is active by design =E2=80=94 this is a mute, not a strea=
m close.
> >>>
> >>> To reproduce:
> >>>
> >>>   1. Play audio through rt1320 speaker (aplay or PipeWire)
> >>>   2. Press speaker mute key (or amixer cset on both FU21 channels)
> >>>   3. Second channel mute takes 2-3s to return
> >>>
> >>> Muting both channels removes the last DAPM path consumer of PDE23.
> >>> DAPM fires PRE_PMD while PipeWire still holds the PCM open =E2=80=94
> >>> DP1 keeps streaming zeros. The codec cannot reach PS3 while its data
> >>> port is active, so the poll always times out. The mute register write
> >>> that actually silences the speaker happens after this useless wait.
> >>>
> >>> I confirmed via SoundWire debugfs reads: ACTUAL_POWER_STATE stays PS0
> >>> while the port streams and only transitions to PS3 after PipeWire cal=
ls
> >>> hw_free (~3s later). The poll can never succeed in this path.
> >>>
> >>> Every other Realtek SDCA amp driver does fire-and-forget on PRE_PMD w=
ith
> >>> no transition delay =E2=80=94 rt712_sdca_pde23_event(), rt721_sdca_pd=
e41_event(),
> >>> rt1316_pde24_event(), and rt1017_sdca_pde23_event() all just write PS=
3
> >>> and return. rt1320 is the only one that polls on power-down.
> >>>
> >>> The POST_PMU poll is kept =E2=80=94 on power-up the domain must reach=
 PS0 before
> >>> audio can flow, and the port is not yet active at that point so the
> >>> transition succeeds immediately.
> >>
> >> well that's an interesting issue. IMHO all those drivers are broken th=
en...
> >> A mute should let the ports active and not start any power transitions=
 on the codec side.
> >> That's what should be fixed first.
> >>
> >> I am not sure either why PipeWire would send a hw_free on a mute eithe=
r, that's a sure what to have audible delays and glitches. Mute !=3D Stop.
> >>
> >
> > hw_free is not involved here. The mute is purely at the codec's FU
> > level (FU_MUTE=3D1 silences the output) =E2=80=94 the PCM stream remain=
s open and
> > DP1 stays active. SoundWire debugfs confirms: after mute during
> > playback, REQ_POWER_STATE=3DPS3 but ACTUAL_POWER_STATE remains PS0. The
> > codec cannot transition while the port is streaming. As long as the
> > application keeps playing, this state persists indefinitely.
> >
> > The power transition is not triggered by PipeWire either. It is standar=
d
> > DAPM behavior: muting both FU21 channels removes the last active path
> > consumer of PDE23, so DAPM evaluates the widget as unused and fires
> > PRE_PMD. This is how every rt7xx/rt13xx driver's DAPM graph works today=
.
> >
> > The poll itself is broken in this path: it cannot succeed while the por=
t
> > is active, always times out, and the handler continues anyway. Removing
> > it fixes the user-facing 2-3s mute latency without changing any DAPM
> > topology or power semantics =E2=80=94 the REQ_POWER_STATE=3DPS3 write i=
s still
> > issued, and the codec transitions once the port stops.
>
> well we're talking past each other. The only thing we agree on is that go=
ing to PS3 while audio is still streaming is really bad.
>
> To repeat myself, there is *no reason* why a mute should trigger a power-=
down.
> I am not expert enough in DAPM but that isn't a desired behavior.
>
> Don't fix this unwanted behavior with a change in how the power state tra=
nsition is implemented, fix the unwanted behavior instead.
>
>

The current rt1320 behavior is consistent with how this driver models
the playback path in DAPM.

DAPM is documented to make power decisions from stream activity and
mixer settings,
with those decisions derived from the routing graph
(`Documentation/sound/soc/dapm.rst`).

In rt1320, the speaker mute controls are `SOC_DAPM_SINGLE_AUTODISABLE`
switches on the two `FU21` mute bits,
and the playback path is `DP1RX -> FU21 -> OT23 L/R -> SPOL/SPOR`,
with `FU21` also depending on `PDE 23`.

With that graph, muting both speaker switches removes the active
speaker path, so `PDE 23` receiving `PRE_PMD` is consistent with the
current DAPM model of this driver.

Given that, I think the immediate bug is the synchronous wait in
`rt1320_pde23_event(PRE_PMD)`, not the fact that DAPM attempts to
power down the now-unused speaker supply path.

Thanks,
Aaron


>
