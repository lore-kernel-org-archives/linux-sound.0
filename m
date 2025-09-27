Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140BE2D5412
	for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 08:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758962887; cv=none; b=HrVeJcNIBxa4iM9Gm7ZHz4Tf8WnYSGDn+is7v2WWZzfeYt7ln3757dZPZfg6s1O/NW9vSM9PIuoomCyxVpXbMU171SjlrVGZfWJCd98/K161fXOPa5FM52h/UPGdq5tWKgmsYVX0MTAeYpz7Br6IfV53XCQ9Esegqp6kwOn1jG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758962887; c=relaxed/simple;
	bh=W3jFT2xCuMdLstdxWfEbBiE9g9ULW4SMf/2PYW8sF0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uK91qMXD3e2grb3q0B+brnXIPxeCPYM4e5adE1H7JzMn4J9HD8iWLiQaZc1ostlqdyEHV5GQfx8Qvo92xQUqyZRz2VnQHnhmOaaa+SU+m0VHsB9CU4J1Oua7wH7OXOO5k5x8UJgV39vjCZY4ZOOjHME69atI2o4sEOXYYBpZaDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFbPhmcE; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFbPhmcE"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-329e1c8e079so2628724a91.2
        for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 01:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758962885; x=1759567685; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/GTUQPP8+/5EC2O1mZ2t0mC7oS0NY7urV0HxwSW70UI=;
        b=EFbPhmcErXPM8UQyW275k9D26+VWXbmSxKKVEaVdO+dHiJNibzbB4VrBZuctCTnwk4
         3wGoVXcYXndrozrGZ3NnqsKRUKV5plnNn1uR1vxJFTfde++dWX23+QPp0d3u12I9WHXI
         4FxkGdFkJK5u1d2tHJ7doEveJ0V2b9yVgbl86zrLwR06tqc2JSynRjk3RCFGVJTx/ZOA
         em+ItWhG0QHec+jAmUpPLTuAMNGzTSHfKtjjZWzCYJOnPG86k1I8TKBkeYUYMdQ+G3RU
         hj5x1nEbttLOFgcSxWWvJXKIqXeUpCjCOf74pPNrLJ9VdXZEpcuByEf0w0fxy+gjGxGC
         In2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758962885; x=1759567685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/GTUQPP8+/5EC2O1mZ2t0mC7oS0NY7urV0HxwSW70UI=;
        b=FQiZmVGeAxeskq/i6BMabzpe9iqk81KCCD4kZcQ+n3xqnDzql7kczFsWXXRVtasO1Q
         a8NAQN67l0Ct+X+eE94TShucGe1M5nYniWC37UJb141kTDVyCOARJ/Hf8ki/Be5XusbZ
         /EcBCn98FzoQrTPmjMz/P+C9FPOeo91ar0PV4ru6ll2j5np1Cy6iOwJz6m1ORCEu/6wv
         pr11PqI7sAQnZ1qL1tFKQyUiQy8Gbm3sjeZMr7cvo+eniQE6Bnj5H39zgkSA1W2z9ter
         sRQIcPoD0wrt7wZoL3eSOe9GigWCWvlBbqoDC0Z2A62sdo/XQGT+RUwWQ0bttEDPHhri
         fnlw==
X-Forwarded-Encrypted: i=1; AJvYcCXveJCi8ebf/sypKE3vJjbDStdLGFFlfT68TnzXYO+UeGDiyjSBId0yVmMf8+XynyyrIoYCrFjcHRXt0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4sZ1r/r1WJR31bgE3b9k8Aq7nGLVhnH5NTJozH2PWs0ZMWbMK
	xSaAL5kjH1WtkqTKhYeVKSaxglpa0fUispeEGnhf/1+I5aD6Qqe4JxbHLAlNSD7Uxk1XAwVobHR
	lG//cGajpD8iJfMC78eXwTKyhXGxehQo=
X-Gm-Gg: ASbGncs5uM7rLq5SGjq+CIwrj8+f+AVTYbULtWoxISdxoQub0rEnqJxpyOc5GxVKGaZ
	Uyy8R7tf/v0Jh8AZwNTmiT34rpvNOaBdwynNGi/kIGYPpDXcwtU+r+ngN/E3/GM/5XsgEdUBQLr
	76ZfIZJrjWcSmdMfZ9gSLAPzq8xszfsYLV1GfCouuURGQjcvl3bDU/ALRH/QQKP7ks9nrVq4KBa
	3NoTFUXsM2tMT7D9Lqj
X-Google-Smtp-Source: AGHT+IE8/Ky1EmR+0LJIy4YhT01cjWKhOibqsHQ53cBmr/JkwwCwaBr7tP12GcnmDWyv0cmrxLHDEEw+q8nuhwMAZu0=
X-Received: by 2002:a17:90b:4d04:b0:32e:a60d:93e2 with SMTP id
 98e67ed59e1d1-3342a260e49mr10570366a91.11.1758962885154; Sat, 27 Sep 2025
 01:48:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250927044106.849247-1-aha310510@gmail.com> <87bjmwb9y6.wl-tiwai@suse.de>
In-Reply-To: <87bjmwb9y6.wl-tiwai@suse.de>
From: Jeongjun Park <aha310510@gmail.com>
Date: Sat, 27 Sep 2025 17:48:02 +0900
X-Gm-Features: AS18NWAH5mQvcVsDREbrMd7yAaCa4-5UOBVCoSMH3cnV9nAbMNh2Maxiike7hRQ
Message-ID: <CAO9qdTHSu6QmUVMo0pZj_=foz9CDtwKEYwjBx5vjj8gHzzVFNQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix race condition to UAF in snd_usbmidi_free
To: Takashi Iwai <tiwai@suse.de>
Cc: clemens@ladisch.de, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sat, 27 Sep 2025 06:41:06 +0200,
> Jeongjun Park wrote:
> >
> > The previous commit 0718a78f6a9f ("ALSA: usb-audio: Kill timer properly at
> > removal") patched a UAF issue caused by the error timer.
> >
> > However, because the error timer kill added in this patch occurs after the
> > endpoint delete, a race condition to UAF still occurs, albeit rarely.
> >
> > Therefore, to prevent this, the error timer must be killed before freeing
> > the heap memory.
> >
> > Cc: <stable@vger.kernel.org>
> > Fixes: 0718a78f6a9f ("ALSA: usb-audio: Kill timer properly at removal")
> > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
>
> I suppose it's a fix for the recent syzbot reports?
>   https://lore.kernel.org/68d17f44.050a0220.13cd81.05b7.GAE@google.com
>   https://lore.kernel.org/68d38327.a70a0220.1b52b.02be.GAE@google.com
>

Oh, I didn't know it was already reported on syzbot.

> I had the very same fix in mind, as posted in
>   https://lore.kernel.org/87plbhn16a.wl-tiwai@suse.de
> so I'll happily apply if that's the case (and it was verified to
> work).  I'm just back from vacation and trying to catch up things.
>

Although it's difficult to disclose right now, I have already completed
writing a PoC that triggers a UAF due to the error timer in a slightly
different way than the backtrace reported to syzbot, and I have confirmed
that no bugs occur when testing this patch through this PoC.

>
> thanks,
>
> Takashi
>
> > ---
> >  sound/usb/midi.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/usb/midi.c b/sound/usb/midi.c
> > index acb3bf92857c..8d15f1caa92b 100644
> > --- a/sound/usb/midi.c
> > +++ b/sound/usb/midi.c
> > @@ -1522,6 +1522,8 @@ static void snd_usbmidi_free(struct snd_usb_midi *umidi)
> >  {
> >       int i;
> >
> > +     timer_shutdown_sync(&umidi->error_timer);
> > +
> >       for (i = 0; i < MIDI_MAX_ENDPOINTS; ++i) {
> >               struct snd_usb_midi_endpoint *ep = &umidi->endpoints[i];
> >               if (ep->out)
> > @@ -1530,7 +1532,6 @@ static void snd_usbmidi_free(struct snd_usb_midi *umidi)
> >                       snd_usbmidi_in_endpoint_delete(ep->in);
> >       }
> >       mutex_destroy(&umidi->mutex);
> > -     timer_shutdown_sync(&umidi->error_timer);
> >       kfree(umidi);
> >  }
> >
> > --

Regards,
Jeongjun Park
