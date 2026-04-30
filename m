Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F933ACF02
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 08:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538775; cv=pass; b=YksgcQWU5TnU3JpOr7dy98Gbyrh6N7VELACQw6p4Q6/ePCRtdrp+lQYLUWla5N1ZEV34SoEKwockKL5tl37mh3FHS8IOHtcgzqA3gxvRUbifX9xtFEmz5z/bipkz7STwOvVREQVxpCUL90QbiFSzE8/lItwENnVkT3x9049IZ2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538775; c=relaxed/simple;
	bh=C6WrJVZ7mxiaCqHx3Pg8/FaCGf/eN1Q3ix9DQPNXg8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PKu+skZ0l/MXEcxobhm4cRihvLqzzxNd+g0HgjbmH0PCxs0cmI9usSRJINnoBS0cH30yatCPTZdR2/RxRUwkcwBi2Scm1pkwb/33Kr0L2SNsg1AYMbgR1s3/v1c4s6nVh/L6D293ve6JQ2Sr7AnFC6OapiMkbpNs8HChyoVBgSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=WOKIPDWQ; arc=pass smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="WOKIPDWQ"
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1EB613F9CB
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 08:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1777538768;
	bh=zAwcTVTDJAFx7Zf1XHw1mE8M1HnA1HbUWR/ulL9i3S8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=WOKIPDWQkh48IR/qnfCy3y0yPa9Cw+KiwxZaow2Yz50A74VB6EoSM89iPbDiySxzZ
	 vna9/89J9yoNo8Z8WTIBD+7eO79l0muHaU9DdI/559kJbV0d/F+0CNAOJcoPc6FRzh
	 punjFrqdRM6Y6TIPrPuMTgXYt5nsw30Ss82MxOg0eXINCCEVhFgJZRsTgVc7u3AOFc
	 wHytFQ4d1Et/6kPZYm3Tid/P15jb8XfJrGGYZGjnB/n/VjoSAzHK1J4NQ9yAQN7YQ+
	 SQkliIWp+jEoQX4qc6R8u3hiOff6L450eavqxWIKQ/hyeqivCIqZ3xAiCv3UDBmrEL
	 GBFxo8f59WgSgiDZ/CxSqVwU2I4hXpzZC5dVGuOP8cM432zCgkDdTD+TAOrecw91Ev
	 /xH43JcK9hB1P940Kd4HvIfiirJYVtyH2Qhfwj41S7vWi38Y1GfNbtjG4bQTKAjU1C
	 KWt/Njc8OqkHTaGGvQe0oi++kOR0PYIYDJfsY8WD/UljMEH7ZgYgs27W+cDgXjCUlZ
	 BT8zQO5XKI5UND15t3fzTRCdemIpiyn5+vAFf/DokDvn4KK/LAXbOweXzX9D64a0zc
	 FvTNfz5RTQ/WXrbPl9g69qm5fIZmdTe/bOx//m7/vhaTKo/znl/+qGH6N0VCStIe1U
	 /HrME2/Cn7ab/mz7WmTovaw8=
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c16233ee11so959157eec.1
        for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 01:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777538766; cv=none;
        d=google.com; s=arc-20240605;
        b=cjnLxKzZsNJmGqKtgXxI9CgxhRO6D9RMBk/j6QwsG7MnZLe7ecKr88WVZCfCMwzRL5
         IHm78eK/Vi8C4oEzKrCyEIEwuIns24XX3A+lCNB7WIMwWT3ol9VqOChErqUmPtm1hi2g
         KMTzZ9D+zawfeSGUWqD/wGLCkHDp1VrROFGn3kxzBxmv5J7AJqQPA7KfM9+9mAtQqK5l
         wT4sDkfVl08NUKYgUmVH7kWgnDcbGYGFPccJAl9ZquI0vg5LF+ND5WZIppXuWPZeUfKf
         67+nq6GQ8hhPehgDuxvOPAy0jX3YbrN4r7RMVi4xLYE257GiUO54kjvdNvSdDrAP6lhi
         NVOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=zAwcTVTDJAFx7Zf1XHw1mE8M1HnA1HbUWR/ulL9i3S8=;
        fh=EXPfc674KCLCemD75NVN+TKODzPMzzndmey2++R+/tI=;
        b=WJm0b9CHhPnF7jNNYDKVRAzl/Bly5ENKenjlRRJrvn/T8fKmNNLqwIFTyo1kxMv/ch
         QO6HM6iuxkSQSvoGdC4ftNOjCz2+OTvIVQjzeMaDbz2SYVcgra30DWl4wA1WISmYyP8g
         P5/owzMp1jI80a7BuqWxc861MKDUgSEHL92Sxvgd4OxUMfJWKGC7bkI1Dz9fk426R9ZS
         CjZcSzV6zzqzLOxPS5yCUiqch7uYyKDEtG/e8hvEJzjedEW17HoG+kkZ+zYAY9n43eu3
         Uc4uOYxAkX96wdiU16X+8b1RUgOiSzIsxZ3gUDdAY96dgWhwd5UMgWu5Zbs+RuRLZXZ6
         ueaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777538766; x=1778143566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zAwcTVTDJAFx7Zf1XHw1mE8M1HnA1HbUWR/ulL9i3S8=;
        b=Na5y64vCjVjjYpoLeYZ5wjlDWsQ7M9+z/6Y2QBb8kuulkFv4uu0XQX8oHSo2ND16E+
         KiQoVBDOtEs8pImbm7U79vp+ItHQUlCHKvz+dAXn56f7pzIhkadzg0Uzs2KE8+SbKmQb
         pTm9t1dUSjhWuWko6E0G5c1Du5trcRw6xF6Qhf2VTpqsxRBPsYQVS/j4o7wtVjonPv1v
         RPE/BsHyvF27oQeG/x4yX13RhT5yuDjDAttOfc8VGJcqdcZkLR6rzpwff24U2LIhsMv0
         KjKSesy7Y0ahGUlhM7wrNC+i2h2hML/Wrmiw++SrDqUznXKDcH4rQb7RE7UPnsyW3igG
         uHtQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dtUwVTOjAQHgY4wVwkTSex5Fque/q6NbURf6N4ZatP966J3TIo1Zu59F/LyXb/hrVqaHFGxjyDdZRgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAnZl/p+qlbZqXUHQ5NREJwDdaEMzkl1KCPVvKKgu/PhwLnbcZ
	5DAK2Bw508yXUnJuVXto+ql04k/QJNndt+ZeM6sSgcc7UU0iGLYKv9Brn+g6qVo9bEpYE0BuAn+
	9tZfzJctolj7MKSdCNxk6wDuGfxl8lybxWlU/T5t+7MPywTu5pIe+iMRSIvbWZmQrPtlWZj/fdz
	bBayMthSJNzqe1ozyLrSkf/lVB5CPuRipo59XOlUb1hbdsAB1ayI4UEPI=
X-Gm-Gg: AeBDievzQXrOjwC4Nn8+lxRapYxkRgrvMuBuSStEzRMqcz0EGPHwfgqSbesO4PTYVAr
	BHBKqPmHan2qAa9TC9P5kk89cu660S+q0R3tHHE1IsAtZBD2tiZj0VlInpby4CvY/K5xa+WNcWk
	B1ALqfzTe/gA0/Gh34ObXs+BM7oOYP3c0xwVqxT+lEM1GZ51lxZ1dWdPlqY6dyahZCcitcisaiN
	N9jNWf79mWdcIw9kGg7wnyWJ3YsZNfwx62GYDN1BexZAVwXTqC6nC/aZmz4Cix8U0ewTdCY
X-Received: by 2002:a05:7022:218:b0:12c:6e75:bb1 with SMTP id a92af1059eb24-12deac4f179mr805357c88.4.1777538766222;
        Thu, 30 Apr 2026 01:46:06 -0700 (PDT)
X-Received: by 2002:a05:7022:218:b0:12c:6e75:bb1 with SMTP id
 a92af1059eb24-12deac4f179mr805345c88.4.1777538765778; Thu, 30 Apr 2026
 01:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428073726.1611777-1-aaron.ma@canonical.com>
 <69a3d80d-c9aa-459f-8522-c07e225bd5d9@linux.dev> <CAJ6xRxUuOgfoJ1VP3++Hm_UdhYLJH-16J3rXUcN6O1BmSDJVbA@mail.gmail.com>
 <78c57b26-505f-473d-8472-a491ede5aad9@linux.dev>
In-Reply-To: <78c57b26-505f-473d-8472-a491ede5aad9@linux.dev>
From: Aaron Ma <aaron.ma@canonical.com>
Date: Thu, 30 Apr 2026 16:45:54 +0800
X-Gm-Features: AVHnY4JNxbHWhyqVZ7Q0-HGij_C6byjbJzU1_GXwcIG1u859Z0VLmk7qUmb4mcs
Message-ID: <CAJ6xRxVeOJWteUsRZNE6QdYvv7ODoErRc7DQda6CdQfvq8-Z8g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt1320-sdw: don't poll PDE state on power-down
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuming Fan <shumingf@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 4:07=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.dev> wrote:
>
> On 4/29/26 06:12, Aaron Ma wrote:
> > On Wed, Apr 29, 2026 at 4:20=E2=80=AFAM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.dev> wrote:
> >>
> >> On 4/28/26 09:37, Aaron Ma wrote:
> >>> rt1320_pde23_event(PRE_PMD) writes REQ_POWER_STATE=3DPS3 then polls
> >>> ACTUAL_POWER_STATE. DAPM fires PRE_PMD while the SoundWire data port
> >>> is still streaming =E2=80=94 the codec cannot reach PS3 until the por=
t stops,
> >>> so the poll always times out during playback. This blocks
> >>> snd_ctl_elem_write() for 2-3s making mute unresponsive.
> >>>
> >>> Remove the poll from PRE_PMD in rt1320_pde23_event() and
> >>> rt1320_pde11_event(). The codec transitions to PS3 on its own once th=
e
> >>> data port becomes inactive. Keep the POST_PMU poll =E2=80=94 on power=
-up the
> >>> domain must reach PS0 before audio can flow.
> >>>
> >>> Fixes: f465d10cd731 ("ASoC: rt1320: Add support for version C")
> >>> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> >>> ---
> >>>  sound/soc/codecs/rt1320-sdw.c | 2 --
> >>>  1 file changed, 2 deletions(-)
> >>>
> >>> diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-=
sdw.c
> >>> index 192faa431b5e9..e42e8b6de853e 100644
> >>> --- a/sound/soc/codecs/rt1320-sdw.c
> >>> +++ b/sound/soc/codecs/rt1320-sdw.c
> >>> @@ -2000,7 +2000,6 @@ static int rt1320_pde11_event(struct snd_soc_da=
pm_widget *w,
> >>>               regmap_write(rt1320->regmap,
> >>>                       SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_PDE1=
1,
> >>>                               RT1320_SDCA_CTL_REQ_POWER_STATE, 0), ps=
3);
> >>> -             rt1320_pde_transition_delay(rt1320, FUNC_NUM_MIC, RT132=
0_SDCA_ENT_PDE11, ps3);
> >>>               break;
> >>>       default:
> >>>               break;
> >>> @@ -2028,7 +2027,6 @@ static int rt1320_pde23_event(struct snd_soc_da=
pm_widget *w,
> >>>               regmap_write(rt1320->regmap,
> >>>                       SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE2=
3,
> >>>                               RT1320_SDCA_CTL_REQ_POWER_STATE, 0), ps=
3);
> >>> -             rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT132=
0_SDCA_ENT_PDE23, ps3);
> >>
> >> no, sorry, that's clearly wrong.
> >>
> >> When we touch the requested power state, we *shall* wait for the power=
 state to be reached.
> >> removing the transition delay is silly.
> >>
> >> You would really need to find out why streaming still occurs when you =
get a DAPM event. That doesn't seem right in the first place.
> >>
> >
> >  The stream is active by design =E2=80=94 this is a mute, not a stream =
close.
> >
> > To reproduce:
> >
> >   1. Play audio through rt1320 speaker (aplay or PipeWire)
> >   2. Press speaker mute key (or amixer cset on both FU21 channels)
> >   3. Second channel mute takes 2-3s to return
> >
> > Muting both channels removes the last DAPM path consumer of PDE23.
> > DAPM fires PRE_PMD while PipeWire still holds the PCM open =E2=80=94
> > DP1 keeps streaming zeros. The codec cannot reach PS3 while its data
> > port is active, so the poll always times out. The mute register write
> > that actually silences the speaker happens after this useless wait.
> >
> > I confirmed via SoundWire debugfs reads: ACTUAL_POWER_STATE stays PS0
> > while the port streams and only transitions to PS3 after PipeWire calls
> > hw_free (~3s later). The poll can never succeed in this path.
> >
> > Every other Realtek SDCA amp driver does fire-and-forget on PRE_PMD wit=
h
> > no transition delay =E2=80=94 rt712_sdca_pde23_event(), rt721_sdca_pde4=
1_event(),
> > rt1316_pde24_event(), and rt1017_sdca_pde23_event() all just write PS3
> > and return. rt1320 is the only one that polls on power-down.
> >
> > The POST_PMU poll is kept =E2=80=94 on power-up the domain must reach P=
S0 before
> > audio can flow, and the port is not yet active at that point so the
> > transition succeeds immediately.
>
> well that's an interesting issue. IMHO all those drivers are broken then.=
..
> A mute should let the ports active and not start any power transitions on=
 the codec side.
> That's what should be fixed first.
>
> I am not sure either why PipeWire would send a hw_free on a mute either, =
that's a sure what to have audible delays and glitches. Mute !=3D Stop.
>

hw_free is not involved here. The mute is purely at the codec's FU
level (FU_MUTE=3D1 silences the output) =E2=80=94 the PCM stream remains op=
en and
DP1 stays active. SoundWire debugfs confirms: after mute during
playback, REQ_POWER_STATE=3DPS3 but ACTUAL_POWER_STATE remains PS0. The
codec cannot transition while the port is streaming. As long as the
application keeps playing, this state persists indefinitely.

The power transition is not triggered by PipeWire either. It is standard
DAPM behavior: muting both FU21 channels removes the last active path
consumer of PDE23, so DAPM evaluates the widget as unused and fires
PRE_PMD. This is how every rt7xx/rt13xx driver's DAPM graph works today.

The poll itself is broken in this path: it cannot succeed while the port
is active, always times out, and the handler continues anyway. Removing
it fixes the user-facing 2-3s mute latency without changing any DAPM
topology or power semantics =E2=80=94 the REQ_POWER_STATE=3DPS3 write is st=
ill
issued, and the codec transitions once the port stops.

Aaron
