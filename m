Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792666609;
	b=WzQjzHwnMEEhor2yIissYzheoom4CRLXA/ooiITkRgEkIZnYKwNluC6YRG8zinFyaf49
	 5Dw9etMTsR2LMdCs3gBk8BldIh25iDlTNkyfjhBgwPKXJJw2wIR9d3s7XMEI4y9MWyvrN
	 J+gUHUA0hfmUU99SjsYhcb+IfztRQXyXsjBXGU+51Vr2fg6oM8bDnE+GuMkDZZ9r267yJ
	 pi4/24xO/EbNDPgsOShQNGIkkeo1WRZQHicoZVux3PiKkPF7eMoYXpDUr1TKYC01U10fe
	 UqVQT3WuoShCc5swkNihBVAEUBMMQqMR7+NksAZTcQGTSpByfMQuDvb2drLnew2mQJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z7CjQzBDnl04aWONNGlhTdVtRpqeXhaqo6cL0x3Dgio=;
	b=Urm+xr8dNX58ZmMrqNrnRa/i2pvspu/3UhSkkQkHTvKlGTXmezeSWo4ZznwASlPZAma5
	 Fo73gTGEvOmpbz/0gO5BWbNU+R4dgVHPn+LNTG7p8ns1HyUKPO4zsS8Ni+wMPdu1OV24g
	 4TqF4GjTS837xsyQ7dDIAshDV74oeFgyEN8WSwf6nGswKkNpd+WTzWRe3PMd6mMhv2hzO
	 8XbmkydvTo77MN9bl1nn36eAkcIaCDss4ELyE5rPaB2rqR3HS67Xk+ajbDmWoDpdTuIkQ
	 vfDQrBpLpAdB21sDyD7oxee6ozdG6H8B9F2TaDZsXLq54YYEoNNtjitA6xJAaCYYweg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ADK6qMqY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A9C606A31B
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 10:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A9C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ADK6qMqY
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8a83d2706fdso13991397b3.0
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 03:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792666608; cv=none;
        d=google.com; s=arc-20260327;
        b=Im8WQFXlsmevmuddog6ufZclsQqIDITJ65huz+9XWYDCWEcUx0ttdZDH/ppQ+Vvdmx
         i8OGD59DonY4uEq4z2Eg6ZFwmwIwKMDK6bmyQm35YRM1ImrGsSyPi/rdD6lG4XPgTSEp
         xLPXu3N9Z+a5nTdp/768PuvJgIx3hH8DDQWFGHIcPQ3uyta5wX6PsrSgArzMOer93aRw
         I6OTjJNygFuBnX6hIiwRHfzp1fvXY4se9mFFFodmzOM+UAEboqnAZn5TdWK0L3QgaOQb
         OjQcbui82t/SKUmj4uzFEQMIdEcyHZysk/Gm4nFvzaICccMgn2uVFAVd3yDarjjgz0Z2
         2x9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z7CjQzBDnl04aWONNGlhTdVtRpqeXhaqo6cL0x3Dgio=;
        fh=OzNdfytIosmyyNaMyVucOioohbgWqn0vHPJFMHJymfM=;
        b=Bqgxr78D/icyN/HIUKFDvjgt5AhtZyrC6S/WJRwxuA7Zrf06hDW5o/980jq5/ObNHh
         ou54jqQnCAB7p/wBvChDJXNZh9D8e996DAZM/3flDTvqUCTcYVS//Md01cdBoKvQ3VqH
         vhUDjhRc9y7FuRT4lukzybzxeHYst/Bs1xYySO41o63s3Xi+/roOYuOXyEmjNgSrxblo
         krk8TY7pyfaWXSvCY4tA8elgHtYNsslBgEdYLZLfJ4NqZXldri8rnYjyEiHAK7KRWgKx
         pXduEDiE6aJE06k65uY8Tk7u91vbff6QMXfp/4ku1t+I1b2vfy2WwjCX6UWlQkyfUkG0
         g9dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792666608; x=1793271408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z7CjQzBDnl04aWONNGlhTdVtRpqeXhaqo6cL0x3Dgio=;
        b=ADK6qMqYfj++BYLCYDjZA0g4iUJRd635oOl+MQs616Hil5i2EvY0xspGPy+xBELhWL
         c1IE2JqSa+Y0ujrhJsSskK7WukOvBCZZ0jDGv82wfGzKEydabW9NgmH9mjRF17VdY4es
         +Jwdg9b3HhnWhxY5BVx65BvQ+9EKPlp27Q0rzmBCCTpe+L8a7eVBIrsHCZ8vLRtmvFmb
         uTdHwV94NpWpDO0tCJLJTiOSjm+Gc2vzj0EmVQKGpQ3gFAbfF8BHymlMYT/b1F+VRA5L
         nY7fJ6569zvJYVd7bEpvfaViRrOFFw/rxzk9VhGiy+I/mZOtPDNCFmWqyU/tmnxoi6yT
         FWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666608; x=1793271408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7CjQzBDnl04aWONNGlhTdVtRpqeXhaqo6cL0x3Dgio=;
        b=FY9jfA3YJqDC09P2JbfVjMdT3A6MDMtJqmJv1jfnSB2LFr5zqBH8xmviDIcuCjknUH
         pp2+mr+noJb/GUJPwMu7b1jdBehxuQIhLn96g1FfTlZ3YpGUlctW1/1YL9J/jNIWbJGj
         WiFRCO5zeB5WuIQT/834hxFoMeA8/x39M8NsUMW+ASbENxe2SPQfcyiO2rcVp37TSo9D
         K1nkxHzTVK4md2LPuPfu8lynVN/iBS8kvrD/p4XXQkPAArIVredrZ04AuY77JPiPsD4s
         meeJ95OdLLyAskmO7Yc25r6T4cLK0YmvJOzeHv2iibLWunNjHt0QIRx15EYPHtkFTHxd
         zp5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwfTFJsmW2AHWQwrDIeo34PMJ7QY6DN3Gi5SH6VbvwnS9RrTiNYzpwTI3PE2pH0QL3zXG1MeF2RWaTu9A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLD3DzQ+fAqSD3EL9P9QQqaelDWv75vuiXbEC98cmOT5cqHwtyU
	vFF4DXSACx1FTp5skF55bqwd/J438jrKIa3mscBRlqKBZCp33yXTPznvHiCjfE1RItKJZwxpY97
	SElK8QrVwxrBhDgnJTRN0rvdVOq2a/Dw=
X-Gm-Gg: AYBFou0/lP1da4fZHbxxoKXITndDp6zVI7jS2WVISVXUzbqo7LcmrKVB3r1dZKDbO3B
	NjlscuaRdclPqL2C8cy0niD4o3V2hIxGoz1L+dRc2VcSwI3jr2fpVJTHZnm3WriVWdWZnXj7g9g
	Jzf+y/WApMES/Z99dTZzYWqu1bjpo5WzNZq4G9wVvsWWh8bbdnLRDaXE0foKGt4Mq92Lj/LJCqP
	8pE0xjoAB5xybfzGUa7DaNM0GhIbn2cArxlCXg/sD7cfPprd/jc1ezrm1gKdw3IkET31wUrdEHg
	NOJQ4fcIeA9UfTyCpKfJ7FzXG5gQwRLb90Zr1XDYD4n2zMkaeshoYJSVBJ4yacqKGVO61r1Q++k
	E9i/uP8PipjAn5MnGGH+3HKEtkkjeYN+Re9IWi+k=
X-Received: by 2002:a05:690c:e252:20b0:8b0:ac9e:14f7 with SMTP id
 00721157ae682-8b133fb3f9bmr19361017b3.28.1792666608356; Thu, 22 Oct 2026
 03:56:48 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pm-pmb-2439c851f82c443c3600-v4-9e7df0ea42c36afe6171@gmail.com>
 <87h5igix41.wl-tiwai@suse.de> <CAFRLqsVe0JjW9VTbjBG9w00LFuQBxyK3CCjTnqaCXzcUPDCE4w@mail.gmail.com>
 <87v76uccta.wl-tiwai@suse.de>
In-Reply-To: <87v76uccta.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 22 Oct 2026 18:56:37 +0800
X-Gm-Features: AclHuK8C3qRffRiZ2Dmc9zttsL0U6qgzV__R004le6XLTPii7twzMle1FS1Gtf0
Message-ID: <CAFRLqsUjzhcMwCZb+LNCGFFbHv=GF+2+StrbHH0md4REgyADJw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: pcm: Drain proc writers before freeing preallocated buffers
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8822=E6=97=A5=
=E5=91=A8=E5=9B=9B 17:19=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 22 Oct 2026 10:58:02 +0200,
> Cen Zhang wrote:
> >
> > Hi Takashi,
> >
> > Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8820=E6=97=
=A5=E5=91=A8=E4=BA=8C 16:40=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > I believe a better fix is to handle the disconnection of procfs more
> > > properly.  The hda codec driver calls snd_device_disconnect() for eac=
h
> > > pcm, but in the PCM side, the procfs removal relies on the card level
> > > disconnection (snd_info_card_disconnect()).
> > >
> > > That is, something like below works instead?
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> > > --- a/sound/core/pcm.c
> > > +++ b/sound/core/pcm.c
> > > @@ -1119,6 +1119,7 @@ static int snd_pcm_dev_disconnect(struct snd_de=
vice *device)
> > >         for (cidx =3D 0; cidx < 2; cidx++) {
> > >                 if (pcm->streams[cidx].dev)
> > >                         snd_unregister_device(pcm->streams[cidx].dev)=
;
> > > +               snd_pcm_stream_proc_done(&pcm->streams[cidx]);
> > >                 free_chmap(&pcm->streams[cidx]);
> > >         }
> > >         return 0;
> > >
> >
> > Sorry for the delayed reply =E2=80=95 something came up to me over the =
past
> > few days.
> >
> > Thanks for the review. Handling the proc entries at PCM disconnect
> > looks like a better approach.But I noticed two possible issues with
> > adding the call here: proc removal can invoke a prealloc release
> > callback that takes open_mutex, which is already held; freeing the
> > subtree also leaves pstr->oss.proc_entry pointing to freed storage
> > until final unregister.
>
> Hm, basically we don't have to release the resources but just
> disconnect procfs (that guarantees that the pending callbacks are
> finished).  So how about something like below instead?
>
> > I'll follow your approach, but perform proc rundown outside open_mutex
> > and retain the entry objects until final cleanup. I'll also prevent sub=
sequent
> > card registration from republishing the disconnected entries.
>
> But those are assumptions: the proc rundown must be after all pending
> stuff is gone and it shouldn't be called until the next registration.
> And, running re-registering before the complete release is already
> fundamentally broken, and that should be addressed instead.
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> diff --git a/include/sound/info.h b/include/sound/info.h
> index adbc506860d6..4b08a32ff4fe 100644
> --- a/include/sound/info.h
> +++ b/include/sound/info.h
> @@ -117,6 +117,7 @@ struct snd_info_entry *snd_info_create_module_entry(s=
truct module *module,
>  struct snd_info_entry *snd_info_create_card_entry(struct snd_card *card,
>                                              const char *name,
>                                              struct snd_info_entry *paren=
t);
> +void snd_info_disconnect_entry(struct snd_info_entry *entry);
>  void snd_info_free_entry(struct snd_info_entry *entry);
>
>  int snd_info_card_create(struct snd_card *card);
> diff --git a/sound/core/info.c b/sound/core/info.c
> index c4d57d0809ad..bb9f564001ea 100644
> --- a/sound/core/info.c
> +++ b/sound/core/info.c
> @@ -737,6 +737,15 @@ static void snd_info_clear_entries(struct snd_info_e=
ntry *entry)
>         entry->p =3D NULL;
>  }
>
> +void snd_info_disconnect_entry(struct snd_info_entry *entry)
> +{
> +       if (entry && entry->p) {
> +               proc_remove(entry->p);
> +               guard(mutex)(&info_mutex);
> +               snd_info_clear_entries(entry);
> +       }
> +}
> +
>  /**
>   * snd_info_free_entry - release the info entry
>   * @entry: the info entry
> @@ -749,11 +758,7 @@ void snd_info_free_entry(struct snd_info_entry * ent=
ry)
>
>         if (!entry)
>                 return;
> -       if (entry->p) {
> -               proc_remove(entry->p);
> -               guard(mutex)(&info_mutex);
> -               snd_info_clear_entries(entry);
> -       }
> +       snd_info_disconnect_entry(entry);
>
>         /* free all children at first */
>         list_for_each_entry_safe(p, n, &entry->children, list)
> diff --git a/sound/core/pcm.c b/sound/core/pcm.c
> index 1e4e0ecb3dbd..58098ee894a1 100644
> --- a/sound/core/pcm.c
> +++ b/sound/core/pcm.c
> @@ -520,6 +520,11 @@ static int snd_pcm_stream_proc_init(struct snd_pcm_s=
tr *pstr)
>         return 0;
>  }
>
> +static void snd_pcm_stream_proc_disconnect(struct snd_pcm_str *pstr)
> +{
> +       snd_info_disconnect_entry(pstr->proc_root);
> +}
> +
>  static int snd_pcm_stream_proc_done(struct snd_pcm_str *pstr)
>  {
>         snd_info_free_entry(pstr->proc_root);
> @@ -580,6 +585,7 @@ static int snd_pcm_substream_proc_init(struct snd_pcm=
_substream *substream)
>
>  #else /* !CONFIG_SND_VERBOSE_PROCFS */
>  static inline int snd_pcm_stream_proc_init(struct snd_pcm_str *pstr) { r=
eturn 0; }
> +static inline void snd_pcm_stream_proc_disconnect(struct snd_pcm_str *ps=
tr) { return 0; }
>  static inline int snd_pcm_stream_proc_done(struct snd_pcm_str *pstr) { r=
eturn 0; }
>  static inline int snd_pcm_substream_proc_init(struct snd_pcm_substream *=
substream) { return 0; }
>  #endif /* CONFIG_SND_VERBOSE_PROCFS */
> @@ -1119,6 +1125,7 @@ static int snd_pcm_dev_disconnect(struct snd_device=
 *device)
>         for (cidx =3D 0; cidx < 2; cidx++) {
>                 if (pcm->streams[cidx].dev)
>                         snd_unregister_device(pcm->streams[cidx].dev);
> +               snd_pcm_stream_proc_disconnect(&pcm->streams[cidx]);
>                 free_chmap(&pcm->streams[cidx]);
>         }
>         return 0;

Agree that. But I moved proc rundown outside open_mutex because
proc_remove() can invoke the
prealloc release callback, which takes that mutex.

Best regards,
Cen Zhang
