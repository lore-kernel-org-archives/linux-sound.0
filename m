Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793121503;
	b=pST99Q5x9ADtoFh9m7SeWfDoH4DMAUPJVHEeQ40+ZJE1ExtzpgI9itQoZZd+bnZSek7Q
	 YjYkXl1+QVbnGJ1IzQQX4mZxwIJBd6LIo9/u65FWbGWM68Ka9+N6ZTLHIT8HLhQ+96r/6
	 FsW4t5R+uZDDiUKQV/G7HcfMeHOS398uwc3QeQ2QVDvwlHxooE+nkWrFK/0bZAiuOwpbl
	 2G0pRra7tFfqGbrDt2BgXCD3C3V+oLwWZ5i10M5wIV/LGcE1QcGgUOREs9ayUuSpdtwgV
	 s1N3VEE2j1uSpdoKPc+9724EpV1NRVjcDpkgp/AsnhX2/t2QjRhQbkcPqpzcrq4HNNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=PmgfchcoCK9IQsA5yVNcgReDzkrnB4LL8E3TuvSoWU8=;
	b=O4LXVb2DOMBULi3zlf49UJ8Z+zA8oP9joScIWE8o8IyPgHufQq8AJoW9fNmtF4ZDlGZJ
	 fRW86qVN07kBGwPzGm/vCd+D+hJ8LKRg29D4lwpzpTX5dV7aTFGqCBlO0zPd5X9keW/ir
	 HLZJ/5oBVNVgD0IKLuue+Jo1D6SizF5TICZdZ7SlvJILkiiHUuW+crH74Bd8PAHz9abxv
	 PN32XW1QM5IHvJ9/Y5KlBTKjfXL/0MFh5fJ35Rq4dT4BUkK3CM5ujVSbfwyOw6Xbfd+hf
	 wDjvFA78Qjx5BHSyYB/JQ7RMkxcwv+8RmFEcj6zjsUUElmS5bxqiBBqs/V3FzG7ZmXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KViQ7A7q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F4E606A31E
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 17:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39F4E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KViQ7A7q
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c450ab1483cso7080766b.3
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 10:18:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793121501; cv=none;
        d=google.com; s=arc-20260327;
        b=knDkdzAB76P97y5wCEg8Z7pdDUIRxdtHlQ3DeXzn8suAJ3ySXimIw2LA/1wvqexOZg
         hwEv8JjlKqZld19rhuxm34NTMk5CYhCJ5Jwx371aCv29190bNncl1d8yNrNjECKI+cj5
         HDt4uaYzNCGUaHOar+5HAa9Z0Br8wJQZc01EMR7fJ23VPXvJq1MkhhSL6oSx9m80W9BT
         OZOxZJHjmfMPjC13pdFNcA7yKku6Vq/N40+4vSQIUTfehrhHRLxuZKnuQir88cs4eDpG
         4uiWqrVjNy8YU2MiXVmUzN/lwv/EX8a0ivpPykQ8XGuSjQeczdD0qyQq68b+ez/67vAx
         oV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PmgfchcoCK9IQsA5yVNcgReDzkrnB4LL8E3TuvSoWU8=;
        fh=V8W0TViz8XU8Pp8/scINkR8Za+A0ROkPCVAQr2owVZg=;
        b=eCUWAWg1m2TofVz4rW1t2UP0ejEiiQtgWGw6mDp6WZswJcovN4JFhBc1MGpiaxEnFL
         qw84DtMU+1TN4N8fd8BriSzW2abwCCcluB92lZi4x9I0B0MytHL/PNQM6V3uG+T8Uz+I
         bOC8VBS6nwDwIayUgnmyTunrqYwJpY3bgDU8+4iKDZ+lmrVcfAkkRfw7JiBqQ3fUvLrc
         gjnnUTQcdQylhJFfWbbxyYUqrAvWA53vZlcSQsc5lhsVnBDBD7Z9+PkaqTc9/pkBtOwF
         iBOdivodEl5XZs6c+SBqQ3zz7L5tK6f9tzrdHZSCtJwJ+yql3iERt9F/bH1vYt5hQG04
         oy2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793121501; x=1793726301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PmgfchcoCK9IQsA5yVNcgReDzkrnB4LL8E3TuvSoWU8=;
        b=KViQ7A7qI2wIR5FzZ+Rwhzfr2AHHKx1LCr4xuE5BWP3dpbmvx/wNN1Pswz+4SQWnVa
         ifLOapGUno/nhCmIemXkGid8le76IxvBwKm5i0KzQ+hJ2zX2dU+6sS/SNgT1cB+K1dH7
         raUagi/bXpo6iNY6BCdDnZN3iT12hayaiwkp/JKXoAgWADzJf4zbKBPue0I2Y39HchkO
         AqYItqSe9qyyoYYk1KgQWpzI5H6pm+nK4UpuIRuqp4ZnDleZKL+QB725y9N0up1ApS3c
         pA6sG8rSwDIc4CNcEEzFDX1sudRKMW/0PrysVLxLM6t4VuUY7LK/yX1GI6uj5TmgsVHw
         nUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793121501; x=1793726301;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmgfchcoCK9IQsA5yVNcgReDzkrnB4LL8E3TuvSoWU8=;
        b=L8xnf3QgFBwXvQVEVYuKfhE2L+civ9IoBvq/keLE1f86mGthdnjVufZBYF48STr1Jm
         TuJ7wkX5HHngz9PGxJQfEbv0oCGBLLhqK3U2OQtP2s6hFq3pHbJMRJQjAgWy6VYmIXft
         YuwqFTK2BZozWRu0NimXvT7fcZ3Ac+gNbN5+fKXEIQi6apsQ4ZcuXCBw4S/3liKYnSyH
         WNH1RlMxqXzI8Vm6pe5yXhT7lh0gSkKY+0xyg2jgpLKFUJ6c4OLZoTOWCU5jeVrIGjts
         ZD9LBAGSnAL/c0CrD2oNhAC6H6SkS4k631jlLnQaNfspZIOfyIFq6kS2SIcPQKmAxcW9
         9RBw==
X-Gm-Message-State: AFq9FYIf9+W7pLksDPTeYm/UPOHsYUBV6B0oigx+euKXbXTH93AcZpkl
	uAftMLipou86x1loVU1cMC1cQzSo2B8XRT1zdPDYypRbq6RlSwdU4PMB7VZoJtM1+VSl78JqKAU
	exWX3tJdKiU7glp4wsI1C24Q3g5/Lvu4=
X-Gm-Gg: AYBFou0SQ7c2FoUQBXu292VscP3LCEeQrf9Yx9sD6vrlQdmRG+UfmRnpYBanLjNj6p+
	sbwsPrm2Ix+pMaRLAO5H+a8DhH2bwEHVAu9a/oH3f5bNIlOvqaKDZGlIOUl31qZd7uNfmXwKtow
	qKXWe+Nj+7KwxosXFEdEkpcmUeHEg4A9mrUt+OuzY0REsvDqpXK/TCGdpU6NLXfqyPd4VxkbUDD
	qcG46wDVt1FbxzVF7LRqGm8JhrNcZGee3PKBjLHUY5mqpMsVUWrdLONwMfDPA/AMlnk8CgPbxDC
	a/6/Nh/jMNvLWDkgzql/ied4XtiwCwl+RFYwv6mAdcXg615H+/fDmiIPD8yvvgEpQWQ5YBjDTi7
	NNHFnjFEnvhUFqvR/ek4QcuLdWXgYgj20Bek=
X-Received: by 2002:a17:907:6ea8:b0:c2e:2252:6ddb with SMTP id
 a640c23a62f3a-c46bdc2ab32mr1112853966b.10.1793121501209; Tue, 27 Oct 2026
 10:18:21 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027131233.17692-1-mikachu@gmail.com> <87ld7j19l0.wl-tiwai@suse.de>
In-Reply-To: <87ld7j19l0.wl-tiwai@suse.de>
From: Mikael Magnusson <mikachu@gmail.com>
Date: Tue, 27 Oct 2026 18:18:09 +0100
X-Gm-Features: AclHuK8xDa6othyb1RfV4Qf3CkPN91KdVOkQT_Ec4faksuli_RWM_zyEFu-1w7M
Message-ID: <CAHYJk3S-KYODgHtASimLO_9Pc3dZGeFKT2_XrdthXoQGj8c_hw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: pcm: update state after xrun
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 3:50=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 27 Oct 2026 14:12:33 +0100,
> Mikael Magnusson wrote:
> >
> > If the snd_pcm_update_hw_ptr call from snd_pcm_status is what triggers
> > the xrun state (eg, as opposed to an IRQ), the returned status->state
> > was stale and told userspace the device was still playing, so they coul=
d
> > get confused about device state and hang indefinitely.
> >
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D222201
> > Signed-off-by: Mikael Magnusson <mikachu@gmail.com>
> > ---
> >  sound/core/pcm_native.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> > index 35152fae74..62a2bea043 100644
> > --- a/sound/core/pcm_native.c
> > +++ b/sound/core/pcm_native.c
> > @@ -1132,6 +1132,9 @@ int snd_pcm_status64(struct snd_pcm_substream *su=
bstream,
> >       status->trigger_tstamp_nsec =3D runtime->trigger_tstamp.tv_nsec;
> >       if (snd_pcm_running(substream)) {
> >               snd_pcm_update_hw_ptr(substream);
> > +             /* update_hw_ptr may have put us in xrun state, update st=
ate */
> > +             status->state =3D runtime->state;
> > +             status->suspended_state =3D runtime->suspended_state;
> >               if (runtime->tstamp_mode =3D=3D SNDRV_PCM_TSTAMP_ENABLE) =
{
> >                       status->tstamp_sec =3D runtime->status->tstamp.tv=
_sec;
> >                       status->tstamp_nsec =3D
> >
>
> Thanks for the patch.  I can take this as-is, but what Sashiko
> suggested in the review is also valid -- we may copy trigger_tstamp_*,
> too.
>
> Also, we don't have to always overwrite the values.  As a further
> optimization, check the return value from snd_pcm_update_hw_ptr(), and
> update only if it returns a negative (-EPIPE).
>
> So, in the end, it'll be something like below.
> Could you check whether this works for you?

Hi, this should be fine as well, from what I can see you are correct
that it always returns -EPIPE when an xrun happens. I'm not sure if
this actually ends up being an optimization (branch vs unconditional
write), but it probably also doesn't really matter on this path. You
can do whichever looks clearer, either is fine with me.

Thanks!

> -- 8< --
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -1131,7 +1131,13 @@ int snd_pcm_status64(struct snd_pcm_substream *sub=
stream,
>         status->trigger_tstamp_sec =3D runtime->trigger_tstamp.tv_sec;
>         status->trigger_tstamp_nsec =3D runtime->trigger_tstamp.tv_nsec;
>         if (snd_pcm_running(substream)) {
> -               snd_pcm_update_hw_ptr(substream);
> +               if (snd_pcm_update_hw_ptr(substream) < 0) {
> +                       /* update_hw_ptr may have put us in xrun state, u=
pdate state */
> +                       status->state =3D runtime->state;
> +                       status->suspended_state =3D runtime->suspended_st=
ate;
> +                       status->trigger_tstamp_sec =3D runtime->trigger_t=
stamp.tv_sec;
> +                       status->trigger_tstamp_nsec =3D runtime->trigger_=
tstamp.tv_nsec;
> +               }
>                 if (runtime->tstamp_mode =3D=3D SNDRV_PCM_TSTAMP_ENABLE) =
{
>                         status->tstamp_sec =3D runtime->status->tstamp.tv=
_sec;
>                         status->tstamp_nsec =3D
>


--=20
Mikael Magnusson
