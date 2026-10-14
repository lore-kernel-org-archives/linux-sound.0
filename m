Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044C44DA541
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 10:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973169; cv=pass; b=OR52yEL10CZQ0HbTxFSagVHfx803y6vYV1lq8dUxvE8h85xqp6QlG/Su3uN0bUph9QL4EdDZ+FRV+I+7oinRyj475XAvj4vViCDVRW0RJMvsbX9RGwxIzgv3bmmMrU92hP0uMwFHA5GHg4q5i+a2198dHynoOwdoO9uewn+usA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973169; c=relaxed/simple;
	bh=5XC3ePOEfPfhdjRLNfiDYOmx8DhdOuHxUMpgkVnPMoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tWu7Sh4LLeB5nyXeMp3c/3V4JZ38WPS/5x3v8nM3mlkxkcurHZ4HfLQmr5yepVwBiKJHKYiv4TcUn4t+omygUhfJr1CWQluTajdLguPo+wUkmPrIH7KVxLJpaCG887K0hgc4XcfHSxsqOi+LH7RY5bFzHJ4tAg8hn0GvtzprxPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXDHt3En; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXDHt3En"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-677dbe051d4so282386d50.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 03:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791973164; cv=none;
        d=google.com; s=arc-20260327;
        b=K3/jTNxWq5G06BVRPSlpmkPOHm/wRJxlO6KK4W2O9djTh1s6t34STnXy0u9CXnjLao
         7WTg35W4Cmmp+S3xL2GVBzx6Q2YqswLg1Ri5sTd9YEJVS3aZWM5ydYdUJqWD+0xjnqSq
         /VQC1tXkDa7Y983aB/R4aQFrFwuFsNQFLMEv5mdzCjypS13Y+13Q3dQAQHEYWxAVZbrz
         6kgdWN9GN07i52pYkM/ISwh7/nAKX8gw0JC+iNsoNJBRCmPVODYxao6ZxiUqj2xtcH18
         OmplJMvM7yFM/BM2OkSgd5aC8BuY0/n87wfa1DTBcQukyCB7BS5GkQyVKlgyGsNAKuje
         S0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TueIpr4580/+gZvYJMMIRybUm6mt4G86k3V2wAjgF2w=;
        fh=msNLKOJowXMwM18+jHEa7E/hlLXM+j6TWU+6rVWVT/Y=;
        b=bP/dOGA7ijN6LYLeXaAA7AZQLaQedQIdu1PtFtVVcTELMBxpWe9RnWmw7j5mp0JBmn
         JBkDF6CaoHS7yMV+FkV/EbH/afZluIA1VHOAXDlRJ/mqjDo02N4tRNxMX3xQys7vBatJ
         9NpusK+Wl6pi1pWzeBo7lhh4lHvTeGGw3JksQdE0PKGpVHZ3WS5f/I+REbwL5BVv2CIR
         +PK+hwhLdk40F0jZzySBmErI4OXWfiex/eclKjZzlUkV5mxeaftpieCLh23B02UAkVKA
         MnTEe8K+t3fAhlbZGLnb4kz3SS6sBVWg4puC5b5ZVIa+6TmfVOYKH5+lW7wbWuM/08/p
         KjkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791973164; x=1792577964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TueIpr4580/+gZvYJMMIRybUm6mt4G86k3V2wAjgF2w=;
        b=mXDHt3En+ypP1mh+V4AVtV9OV3UOCtu3p6U2kLglRgHbD1C52vBJp/Q0iEatZzwBL6
         JJ88/DJ+/Y8VIVzq6OXZnG1S2GUuRTkE0cJrO3vTm2bInC73V4kyQyBKJZzbNWSAA/i8
         ChUrS++IY4xy7RPrijYV6EUYwan36gpQAj59NWNcbZ6G1PPUHXCdnaY8XXFDVRkJ+etx
         lBSYdK/Vf8ZVG10/fUqvkRtDHUSuyDvy2UuDpoHwSA/Ont8JPTPPLzbQRJRKDBdUd7U/
         B9354f0kt4Om37q/hK4TgUrB9h2YetKiL6AO+KPmvcLoelveoBI5hhbQ7MIiUE07aaID
         QSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973164; x=1792577964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TueIpr4580/+gZvYJMMIRybUm6mt4G86k3V2wAjgF2w=;
        b=KG5LHeE1wdvgH7+vnJR2dD/sRq4wWhCjO03DbhFeY2oBHrrDCXBSWjZh5bWHLvOeHH
         Y1lwe055ToOBm2DnU8FjN9KLEARvoeCqmZW7m8yMWCTK4MRfrpw9n9Wd6KX5MOVxtDqp
         wci3lTtVTpuQyEvnbENCWf3Mxz7HqFJ1Fd8ye+E83C9oB3+er+7xw72mcG+118EzAK31
         umBVvGNykaqX7k2dhMcGbgh3PICmvYTI3Z0bQI7bNjeyz7ILJqkB3Pyx3ldp+y2dA123
         livpxVb1VSYPC+fMm45dpnWCWjEgr9Fm5iNundtGWGpb3zIgQ4twM6rrq+bUsbFmTfgn
         EneQ==
X-Forwarded-Encrypted: i=1; AKwUvByUvi3RFqYk73VImO+YLqNdA581T0nbVSJLb3Iv0v6n/hu76xs5vfrjsLxLqKhWTe5SpZUwos3rpe2jjA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLepuJU0pblNYEl1rHlZvmUWclxSKcg30HdETBI4ec11Z0SnuhD
	ITSsUuLm+z6T/YUuw9gkctyUSd5QeCf4lYu0wN0YKBipqGOocX/ZbK4f/0MLa2y/2xardQA63QH
	/sq4OQiP8tX1I1FiB71saKRXNHaY6N44=
X-Gm-Gg: AYBFou0Q6g+d5ryZmQJkhC6eVaxNxTfdcsJrRSG3dEzmRF64lkfhZ6m8sGQFsNGtmgh
	vWr+rUe8Ca231UkPAxpC4GqjU9QkRn7M1mP/ztKxfDhIZu6JFrbhXDtoRiFKZBTOhoe9cRAxOaN
	s05IR8IjR/CwpyaIdQXMHEOT5Fd46LhXNcVcUMr029jZu8Q9u6E02rHic7LJoxQJKAmC0eYFqmQ
	WRSHOSm4sxpYEejqMKuiQwRoF7poN0AEmlF9Kpa3I+w9djgz33WY0aBm42eMfkv4BlEUiu3HpSX
	waIGJEEJj1DqLlMtpKSgEyKMlXIAaP7YoxBXQMLiG1W6tKPp+hoOYZOgsQ==
X-Received: by 2002:a05:690c:6885:b0:8a9:d345:1c59 with SMTP id
 00721157ae682-8b07edf81dbmr47364987b3.44.1791973163588; Wed, 14 Oct 2026
 03:19:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-9c80f858ccc13b3de84d-v6-d4059ea2910fe5430f5f@gmail.com>
 <877bjkg35f.wl-tiwai@suse.de> <CAFRLqsUH-ehHgXsqFGANE2h0-3WBkeNh7-AOvf5ymWAOH5r5Mw@mail.gmail.com>
 <87v774ejkp.wl-tiwai@suse.de> <CAFRLqsX8rqZrJfLPBOhBmuwXHq_wnxiwfxDGevfQ3wMFo2thgg@mail.gmail.com>
 <87o6cweheq.wl-tiwai@suse.de> <87jynkegu1.wl-tiwai@suse.de>
In-Reply-To: <87jynkegu1.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Wed, 14 Oct 2026 18:19:12 +0800
X-Gm-Features: AclHuK-3Nxy_za_FH1VpGI9imnki_cW__M4TNzexL-eHphdCbnypFU88832XpzU
Message-ID: <CAFRLqsXShbWJPQnoQ=3qWcqOQGOZOorwJHYGTmzFJOpBPkqqWg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: dummy: Defer hrtimer data freeing until runtime detach
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, sammiee5311@gmail.com, 
	phucduc.bui@gmail.com, kees@kernel.org, thomas.weissschuh@linutronix.de, 
	tglx@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8814=E6=97=A5=
=E5=91=A8=E4=B8=89 18:07=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 14 Oct 2026 11:54:37 +0200,
> Takashi Iwai wrote:
> >
> > On Wed, 14 Oct 2026 11:33:54 +0200,
> > Cen Zhang wrote:
> > >
> > > Hi Takashi,
> > >
> > > >
> > > > That's not what I didn't understand: do both A and B use the same
> > > > device?  The release shouldn't happen until all detached, so the
> > > > prepare and the release can't happen concurrently for the same devi=
ce.
> > > >
> > > > If A and B are for different devices, they don't interfere with eac=
h
> > > > other in the case of dummy driver.
> > > >
> > >
> > > Yes, A and B use the same PCM device. The test opens
> > > /dev/snd/pcmC0D0c twice, and SNDRV_PCM_IOCTL_INFO reports:
> > >
> > >   A: card=3D0, device=3D0, subdevice=3D0, capture
> > >   B: card=3D0, device=3D0, subdevice=3D1, capture
> > >
> > > They are separate substreams with separate runtimes. With the hrtimer
> > > backend selected, dummy_hrtimer_create() allocates a separate dpcm fo=
r
> > > each runtime. The test configures both with HW_PARAMS and explicitly
> > > links them with SNDRV_PCM_IOCTL_LINK.
> > >
> > > Sorry, I should have been clearer about what is being released. The
> > > PCM device remains alive throughout. The object being freed is A's
> > > runtime->private_data, from A's driver close callback.
> > >
> > > snd_pcm_release_substream() checks A's own ref_count. When A's last
> > > file reference is closed, it calls A's driver close before unlinking
> > > A, even while B is still open:
> > >
> > >   Final close of A                  PREPARE ioctl on B
> > >   ----------------                  ------------------
> > >   snd_pcm_drop(): group -> SETUP
> > >   do_hw_free(A)
> > >   dummy_pcm_close(A)
> > >     kfree(A's dpcm)
> > >                                     snd_pcm_action_nonatomic(B)
> > >                                       Take link read lock
> > >                                       Walk group: B and A
> > >                                       snd_pcm_do_prepare(A)
> > >                                         dummy_pcm_prepare(A)
> > >                                           Read freed timer_ops
> > >   pcm_release_private(A)
> > >     snd_pcm_unlink(A)
> > >   snd_pcm_detach_substream(A)
> > >
> > > B reaches A through the PCM core's linked-group iteration:
> > > snd_pcm_action_group() invokes the prepare action for each member.
> > > A is still linked and in SETUP at that point, which the prepare state
> > > check accepts. The two dummy runtimes do not share their private data=
;
> > > the group action explicitly invokes A's callback with A's substream.
> > >
> > > The final close holds pcm->open_mutex, but the PREPARE path does not
> > > take that mutex. PREPARE holds snd_pcm_link_rwsem for reading and the
> > > members' buffer mutexes; driver close does not hold those locks acros=
s
> > > the free. The link write lock is taken at the later unlink.
> > >
> > > That is the overlap I meant: A's own backend data can be freed while
> > > A is still reachable by a PREPARE action issued through B.
> >
> > OK, it's then about unlinking in addition to the sync-stop.
> >
> > I believe that we should rearrange the call order of unlink; it should
> > be rather called at the very beginning and unconditionally.
> >
> > So the revised patch is something like below.
>
> ... and after re-reading the code, I noticed that the
> snd_pcm_sync_stop() call is redundant.  After snd_pcm_drop(), the code
> continues as:
>
>         if (substream->hw_opened) {
>                 if (substream->runtime->state !=3D SNDRV_PCM_STATE_OPEN)
>                         do_hw_free(substream);
>                 substream->ops->close(substream);
>                 substream->hw_opened =3D 0;
>         }
>
> and do_hw_free() does call snd_pcm_sync_stop()
>
> static int do_hw_free(struct snd_pcm_substream *substream)
> {
>         int result =3D 0;
>
>         snd_pcm_sync_stop(substream, true);
>         if (substream->ops->hw_free)
>         .....
>
> That said, the only missing piece is the rearrangement of unlinking
> call order.  The hrtimer was a red herring, after all, and rather the
> access to a PCM substream that is being released via the PCM link was
> the real problem.
>
> Please verify whether the fix below works for your case.
>
>
> thanks,
>
> Takashi
>

This approach looks right and addresses this case. Thank you for your
patience and help.

>
> -- 8< --
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index a845f242a163..4fea3f6df682 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -2792,18 +2792,14 @@ static int snd_pcm_hw_constraints_complete(struct=
 snd_pcm_substream *substream)
>         return 0;
>  }
>
> -static void pcm_release_private(struct snd_pcm_substream *substream)
> -{
> -       if (snd_pcm_stream_linked(substream))
> -               snd_pcm_unlink(substream);
> -}
> -
>  void snd_pcm_release_substream(struct snd_pcm_substream *substream)
>  {
>         substream->ref_count--;
>         if (substream->ref_count > 0)
>                 return;
>
> +       snd_pcm_unlink(substream);
> +
>         snd_pcm_drop(substream);
>         if (substream->hw_opened) {
>                 if (substream->runtime->state !=3D SNDRV_PCM_STATE_OPEN)
> @@ -2887,8 +2883,6 @@ static int snd_pcm_open_file(struct file *file,
>                 return -ENOMEM;
>         }
>         pcm_file->substream =3D substream;
> -       if (substream->ref_count =3D=3D 1)
> -               substream->pcm_release =3D pcm_release_private;
>         file->private_data =3D pcm_file;
>
>         return 0;

I'll rework the patch based on this approach.

Best regards,
Cen Zhang
