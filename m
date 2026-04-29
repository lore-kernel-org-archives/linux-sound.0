Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E48E336EF8
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 04:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777435958; cv=pass; b=TKoNoaDAuIcn0vyQi1JwNE0zS8lNf7nCUnqgZhLJld0bX3akNdh4ufeEP3bWLjBPHa9qAK6xEOGA+82Ur3IaXWledjTqyKzsMO8IzcSaQ6UFgTEW41Cr7w9NWWp86S0LO2H/wOw9kWEAh8N5PTwIMZT9CkqthkHr0bwOi4qoil0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777435958; c=relaxed/simple;
	bh=vh+9UAFdXyvUmEbcOgs7S2dl8EqGhQyf5u520Twth5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VsPqhdFf6Lcy0P5uPjtD7TWUgsVfUDmPtOejmH7EpzMX79z31WysS640CD0CuDAmFIEmGFX3RDau4DoMntYEfOctvkVXP2zaRcR0O8ZAbqpLQNyfstAiuN9sDQ3bFjNKpIaAjt4hiyRerJ2PL7uTiSyD9qmLQtYkfcaC/JbGwXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=SPfb2ZZH; arc=pass smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="SPfb2ZZH"
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CE9343F875
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 04:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1777435954;
	bh=Sg3w3Vh3nd6DLWhWrBNpyiPtx//CodochKRjvCJbw78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=SPfb2ZZHDcF8dbtLvszqqvuEeqn7NgFiW+PypbcLUWjHI9YS2lcVRssvDUx8T7Ohv
	 qxB1Pln8wmf0DHgrVwBr3OMg7fISiMk5V/OMSW2W1n8dV3SJLl2bpgGdZW80yXGtZa
	 /25n4OZoUUcWgdbJNS+SFEi+0JuWoZXUcAfBHidKssve9Zu60MBzAgbyPID6JajhDg
	 iDLd9SGuLIWTbU3LXq0IjA5xIyEPipPXacFQ5QGpXqsiNxIbKdldCslC8uSsSh5Ooc
	 mV3gL/C1gVqxuSzOaTYAVGDY3S7mH30xd0Y4zC6aV4UR2MQ3S6bZ7/ZkW5I67zqN90
	 Yx49aqfS55hofi3CxlP1G0c+xh9n+ewNPP4fuKFLwuguCMwLkrX+KEENHySwS/wpVJ
	 4xRulONw+3jt0yT1bpNCUZiJXptEn47ln6TngwY7JSS/cjTYeV8WPdJGCimJ2xoZNe
	 OoW6BCrIuDbgvF/ZfOj/WGmhsAAdfUpihZotADtMP/V3ijuFNOYlmLa9u1X1ZVSmpT
	 GZb4LLQ3ikDMXfC/ZMqYNUPkVZpso5et0xVbxIgBDvjcuXvLZuDU2KccYG/gZvo2OL
	 AeWrq9ik0JlX1jaFlwyR03hjTb1KPK/H7iTUZLipC/9nMNHXu6x/Fh0s4hj1dX2U5G
	 v+/gwaQ9zeLKUkdTZxvgBaaI=
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c8de02a4dso1959710c88.1
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 21:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777435953; cv=none;
        d=google.com; s=arc-20240605;
        b=lOkek/mWQ89esiDAUPp8kbmAWg9e4Vb4N4bsDzrfQp1RAnXNe13ooUCo+oOFoin9SE
         d0gKEpLwRwKae3xN+lw8eGh7/buRbC4EK1gEBSI2kFDP/GLR1KyZy38NeSWdWKG/KaUS
         KB6NOGOQeeQZaq21WHV67yRl5MCFLoZ2UpZSaWbcYBFLVBlrrpRwgHx64sO0drdtz9v4
         hy5bLu6bAm+vuMedpItj0CDpPG1H6vrDnbOrxx1trH05wuGthEiN7dRGwoyofJ6v1NeU
         85jn3wFRk3zsoU8c8biObN1h6sODMcYFXbCv+z7eKKb31vc2h5a6NmLWWM/XZ8Y4uxyA
         IRSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=Sg3w3Vh3nd6DLWhWrBNpyiPtx//CodochKRjvCJbw78=;
        fh=XIEkQzvrPN607LM8KiJsMGSevwQW4StzgzuBPSaJm7o=;
        b=SdkrG/Xi/VJWZiZzGzqvBpPC6KcM1kzlz/PCiJjIGKS/cfrL0+NFhugbqHE6vQLo4M
         iXOYzKKtbNex7TJ4MdEu3L2p5eu5RR+Gh+chaslX4WIfqAK0hYIm77Vnt1pZd5g8hKHM
         jM7WrqNKFe9TspqWYBIFOIo1DR2yWh6jlEewbWGrN8O6PZu8KEAE4S4EFdJkQ5p7Nx6X
         cidTn4Lo7sZHee6IxW9LdeQ7N+IqH1xw6DfsQzoiQ2+Ftth1///RlycEjStjXEpBoTxF
         V9qI8Rry+vziHRnWJeNffWyJ2acYzBH6weyvq0Lh2orr8OAAyOu0urLjQvP+iHXBZPjd
         gDzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777435953; x=1778040753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sg3w3Vh3nd6DLWhWrBNpyiPtx//CodochKRjvCJbw78=;
        b=Wx/7Wga02PQMAD2HQ4fn7b4USKL/vHa9XIb3W12B/xJjxd5mcSJiwCI3Ikt3UBNCNK
         Uz2piYSHCjsEPWhzp4T2YVrh0VzunVozjOb/JODF8kq/4HRwEQThpjjUGew3b21RB8w2
         G8MmZ6XwCN9UV6bgabYd4phrD87JNFKk1mfPEdvz2H4EDCIj6gmFFiiX88eS023HexaM
         UoXiXQbUoltoxNgdHv6d2QyQ9Nwt4kDQu/YNbHuCU9DW0NWGSuMMPf86CYTtADNSKL4e
         IEpLrrmXVOZxeMKfhBOUf5ygygbWCJyBm+CGVxGO/pU016aSkGlj8mp5Dcse3uzchJVG
         sYmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jNKQK2F1zWpYLhC2E/zQPD6NP5qnJ0G12Rbkhx3urbjDKsn5C+PDeIJjtZqT8Vec/bAw+qRUWR6+jFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww6sPK/8Vewpsj5dnUxBVaxiLoT9cIwA+/T1sWC1nuvNUmcfiU
	kfHPF+3AZhmZQi+85NDiqSWei4A46vvmg9spuvEiClwaLrc6pOGo1mvHxj5qB5gpWBf/QGb71cv
	mPWjIT4MZtB9z0jG3NFLrGPfgAVnbFA8IqM+rv6ntk8SG2sdNe3+B1BoY6GYr/yd0S+ZFFnoJ3+
	wSFqpnBJCXh1M3W4hNo0bOTbsfHxnSCNe/8eHyik329hjEcXJP21VNc34=
X-Gm-Gg: AeBDietF/J0LpVbVDJcrDAtsSu08SeUgO0/yflVuVEmfpV+x6n41RzONXiSyRZtqR4Q
	A6PqUquihzVo/jmbjLZ4w7wQnVI9ZmGZeKbkQI5WHvoPZPKzUtmEwwcl+ayWRHzlzGQVblcFZPp
	jOYIW0tR1eEtn4IuX/SF7Nd3SBbsdUU52EkVRp/uFBidhS5VHR7yffuLIogab7CZNw0lew9uQ/S
	3r/qT9RO4VdbjBRkQUrJSWyhkvmyNZTjp8oR1mOR2MSQq29LSDKfS5sLpIojzHVn8xw9TpU
X-Received: by 2002:a05:7022:fe06:b0:12d:de3e:cbfd with SMTP id a92af1059eb24-12dde3ecd45mr2151304c88.36.1777435952924;
        Tue, 28 Apr 2026 21:12:32 -0700 (PDT)
X-Received: by 2002:a05:7022:fe06:b0:12d:de3e:cbfd with SMTP id
 a92af1059eb24-12dde3ecd45mr2151290c88.36.1777435952421; Tue, 28 Apr 2026
 21:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428073726.1611777-1-aaron.ma@canonical.com> <69a3d80d-c9aa-459f-8522-c07e225bd5d9@linux.dev>
In-Reply-To: <69a3d80d-c9aa-459f-8522-c07e225bd5d9@linux.dev>
From: Aaron Ma <aaron.ma@canonical.com>
Date: Wed, 29 Apr 2026 12:12:20 +0800
X-Gm-Features: AVHnY4KiPjms5Afj8uccAOJpJaU64sJqO6k18TFoN-fPaDIPuMu4UvKyKkrawuU
Message-ID: <CAJ6xRxUuOgfoJ1VP3++Hm_UdhYLJH-16J3rXUcN6O1BmSDJVbA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt1320-sdw: don't poll PDE state on power-down
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuming Fan <shumingf@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 4:20=E2=80=AFAM Pierre-Louis Bossart
<pierre-louis.bossart@linux.dev> wrote:
>
> On 4/28/26 09:37, Aaron Ma wrote:
> > rt1320_pde23_event(PRE_PMD) writes REQ_POWER_STATE=3DPS3 then polls
> > ACTUAL_POWER_STATE. DAPM fires PRE_PMD while the SoundWire data port
> > is still streaming =E2=80=94 the codec cannot reach PS3 until the port =
stops,
> > so the poll always times out during playback. This blocks
> > snd_ctl_elem_write() for 2-3s making mute unresponsive.
> >
> > Remove the poll from PRE_PMD in rt1320_pde23_event() and
> > rt1320_pde11_event(). The codec transitions to PS3 on its own once the
> > data port becomes inactive. Keep the POST_PMU poll =E2=80=94 on power-u=
p the
> > domain must reach PS0 before audio can flow.
> >
> > Fixes: f465d10cd731 ("ASoC: rt1320: Add support for version C")
> > Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> > ---
> >  sound/soc/codecs/rt1320-sdw.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sd=
w.c
> > index 192faa431b5e9..e42e8b6de853e 100644
> > --- a/sound/soc/codecs/rt1320-sdw.c
> > +++ b/sound/soc/codecs/rt1320-sdw.c
> > @@ -2000,7 +2000,6 @@ static int rt1320_pde11_event(struct snd_soc_dapm=
_widget *w,
> >               regmap_write(rt1320->regmap,
> >                       SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_PDE11,
> >                               RT1320_SDCA_CTL_REQ_POWER_STATE, 0), ps3)=
;
> > -             rt1320_pde_transition_delay(rt1320, FUNC_NUM_MIC, RT1320_=
SDCA_ENT_PDE11, ps3);
> >               break;
> >       default:
> >               break;
> > @@ -2028,7 +2027,6 @@ static int rt1320_pde23_event(struct snd_soc_dapm=
_widget *w,
> >               regmap_write(rt1320->regmap,
> >                       SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
> >                               RT1320_SDCA_CTL_REQ_POWER_STATE, 0), ps3)=
;
> > -             rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_=
SDCA_ENT_PDE23, ps3);
>
> no, sorry, that's clearly wrong.
>
> When we touch the requested power state, we *shall* wait for the power st=
ate to be reached.
> removing the transition delay is silly.
>
> You would really need to find out why streaming still occurs when you get=
 a DAPM event. That doesn't seem right in the first place.
>

 The stream is active by design =E2=80=94 this is a mute, not a stream clos=
e.

To reproduce:

  1. Play audio through rt1320 speaker (aplay or PipeWire)
  2. Press speaker mute key (or amixer cset on both FU21 channels)
  3. Second channel mute takes 2-3s to return

Muting both channels removes the last DAPM path consumer of PDE23.
DAPM fires PRE_PMD while PipeWire still holds the PCM open =E2=80=94
DP1 keeps streaming zeros. The codec cannot reach PS3 while its data
port is active, so the poll always times out. The mute register write
that actually silences the speaker happens after this useless wait.

I confirmed via SoundWire debugfs reads: ACTUAL_POWER_STATE stays PS0
while the port streams and only transitions to PS3 after PipeWire calls
hw_free (~3s later). The poll can never succeed in this path.

Every other Realtek SDCA amp driver does fire-and-forget on PRE_PMD with
no transition delay =E2=80=94 rt712_sdca_pde23_event(), rt721_sdca_pde41_ev=
ent(),
rt1316_pde24_event(), and rt1017_sdca_pde23_event() all just write PS3
and return. rt1320 is the only one that polls on power-down.

The POST_PMU poll is kept =E2=80=94 on power-up the domain must reach PS0 b=
efore
audio can flow, and the port is not yet active at that point so the
transition succeeds immediately.

Thanks for review.
Aaron

>
> >               break;
> >       default:
> >               break;
>
