Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055812DC33F
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 11:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760009036; cv=none; b=nWtzAtPe8rWFnv0sSTF5BMcN0wVjXSuE0/SWIGM3scrDcUu3XfUeaqJjlBS+g4JO6pxE6hcl8/IIweL/z9tx/Zy5qacCxGEASp/gHuoHMcfmHYEFNJVp+cJPLw8pxNyqz7DMW9tj2hFWYFK0Nv2XwHDUOn9mdMbf25dFwuZsH4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760009036; c=relaxed/simple;
	bh=M8nKHUSLyfmF/jDqaCh29GHjGeEn2rLwihqAqoSAQ1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kXYVpe1ufbjsqA7T4qFZAb66tvYN9Bj6nNHEZvMbkoBc0MlRJy6Mk274+iV/TN7P3B0DrN9Q0gd447TxUs2DvI9mJdEZZuV+BR2i4pGVZYbSEsASPCNhBuMGHLpDtgUM8kLalE7sOmlua1Dxq8YtArzPwuhf32/+uZGWj5RFsb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4FcU3jW; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4FcU3jW"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-32ec291a325so656796a91.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Oct 2025 04:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760009034; x=1760613834; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kliHzWy45qfkN0IzOPN+PcDRadWv7e7Kck/MfP/2C44=;
        b=W4FcU3jWi9hIPMO7TKrTCUPJTEcQWtrhQpJIpnCxru7nx5N5zEtCvZbPMbITqSUp/9
         RP4lz9yiwTXTefqmNh2Cxp3uQsjadOC3i65gcm1Q2z0wr2g1DVhPEjYdW69RGqjeE0fP
         mSnge8Q9HfW5bWH29YLP21am7ylFlvXbsYnjPavjCvL6/U2wVVk+Zw8zMW0C5D5ww5GN
         fNzyQkgBQhDKNOeKpn/sLK7c2vh1yL5TttBHQ4/ZlEUT8767MbJA4frUxnKDn/0u+6Jp
         TgtgeEyyVxIkbo73BWa6fo+Y1OhCp36lhfwQFtlUgqiu/njcsw7PxCum9eL0rj+3Hl9U
         T4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760009034; x=1760613834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kliHzWy45qfkN0IzOPN+PcDRadWv7e7Kck/MfP/2C44=;
        b=jniC/MBt6I2kwiiXMfzZQ16WpJYYhGT+zlasXFajkvb9NQ1fUZiJK9AbiiGV7HJa/B
         3XjGHQZdfv1XcJC1gn/TlIIUAGIAFDtiwYX1eu+5bhFiaBospMaXSbZk2b/YtO0Fg7uu
         4OJAR18eKw/6x+8CP7MEoERFsJZLKdgJ1TsVN6UQ0HzR0d+DNZhnfUwGJmRGH8wPhxV2
         4fr+XrcOxZVLyHfBf/lOQWGyl+glzjK3uZ/4wj0I/FZjlahrqtVghQ6ms3qKstchy83q
         QzEizrprF4rbBCaPp7X91/l7lAv+esW4xchYmgzpCvzg5yi0UcqnucZ4TdUQ89vmSYRX
         IYdw==
X-Forwarded-Encrypted: i=1; AJvYcCVir9LDW8FH+D9sOBAZfP+X8QCNpMGWkCkHbVkg85hzoCWcmqckl7nPthXhESkkgaJHokxwaILfv4vFCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYz933NJdCPi1tmpabqH0nsh7iX60e1KBfb0qUJr42qAcHzF9M
	PGKNvy2Zl+/xBTPlbXJuZAmshro8E+QqauzLRISYBkdfwFHN8709gUv7ObEiujukJHzHTb/NTlv
	awBxRIxcXOk0RX+KLEdK8lNtDAerBuI1x3hwm/Cs=
X-Gm-Gg: ASbGncszqb464R7qq/b8T3Bh1iuS2ay7o6PZS9zW5l0EHaQWlcBmptH5VrF9zFaz5cr
	9iCbt3At9spHJbfVcUagXt6ycWpYIMDBeUuoa89wpSZgJ4bVULyMD162HZuTBulPZ0vl5W6pg/Z
	wE8brbFjWXbDJ2JatpOOpNo0ZoY4dnyQsAZzChh1it55L+/uQ/GgYi7IK9juib/d5fRAHeXmrw/
	Uf+xRO8bumWaYi3VL7pwlPBFcc3/5hp3g==
X-Google-Smtp-Source: AGHT+IE+oExOF2jNddJCJDxFn2LMWZIP7mnrCCfmT9mXjdVFldXv6CzpC9tsZJGeyRewgDpRTI6zkh6MEHvslRRbXv0=
X-Received: by 2002:a17:90b:48:b0:32e:5d87:8abc with SMTP id
 98e67ed59e1d1-33b51399953mr8978140a91.36.1760009034367; Thu, 09 Oct 2025
 04:23:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007155808.438441-1-aha310510@gmail.com> <2025100824-frolic-spout-d400@gregkh>
In-Reply-To: <2025100824-frolic-spout-d400@gregkh>
From: Jeongjun Park <aha310510@gmail.com>
Date: Thu, 9 Oct 2025 20:23:42 +0900
X-Gm-Features: AS18NWDC7BJjcFMFyKRFdwMNKT5poJ9maKr6eXsqA75V1U9kn8oIuPnGoXIKjFI
Message-ID: <CAO9qdTEo46hCZ0UXKjjBQ4W2sLT2+5zw9DugQF98sqpHLyNzPg@mail.gmail.com>
Subject: Re: [PATCH 6.12.y 6.6.y 6.1.y 5.15.y 5.10.y 5.4.y] ALSA: usb-audio:
 Kill timer properly at removal
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
	syzbot+d8f72178ab6783a7daea@syzkaller.appspotmail.com, 
	Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 08, 2025 at 12:58:08AM +0900, Jeongjun Park wrote:
> > From: Takashi Iwai <tiwai@suse.de>
> >
> > [ Upstream commit 0718a78f6a9f04b88d0dc9616cc216b31c5f3cf1 ]
> >
> > The USB-audio MIDI code initializes the timer, but in a rare case, the
> > driver might be freed without the disconnect call.  This leaves the
> > timer in an active state while the assigned object is released via
> > snd_usbmidi_free(), which ends up with a kernel warning when the debug
> > configuration is enabled, as spotted by fuzzer.
> >
> > For avoiding the problem, put timer_shutdown_sync() at
> > snd_usbmidi_free(), so that the timer can be killed properly.
> > While we're at it, replace the existing timer_delete_sync() at the
> > disconnect callback with timer_shutdown_sync(), too.
> >
> > Reported-by: syzbot+d8f72178ab6783a7daea@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/681c70d7.050a0220.a19a9.00c6.GAE@google.com
> > Cc: <stable@vger.kernel.org>
> > Link: https://patch.msgid.link/20250519212031.14436-1-tiwai@suse.de
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > [ del_timer vs timer_delete differences ]
> > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> > ---
> >  sound/usb/midi.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/usb/midi.c b/sound/usb/midi.c
> > index a792ada18863..c3de2b137435 100644
> > --- a/sound/usb/midi.c
> > +++ b/sound/usb/midi.c
> > @@ -1530,6 +1530,7 @@ static void snd_usbmidi_free(struct snd_usb_midi *umidi)
> >                       snd_usbmidi_in_endpoint_delete(ep->in);
> >       }
> >       mutex_destroy(&umidi->mutex);
> > +     timer_shutdown_sync(&umidi->error_timer);
>
> This function is not in older kernel versions, you did not test this
> build :(
>
> I've applied this to 6.6.y and newer, but for 6.1.y and older, please
> use the proper function.

Sorry, I didn't realize that the timer_shutdown_sync() implementation
commit wasn't backported to versions prior to 6.2.

But why wasn't this feature backported to previous versions? I understand
that most drivers write separate patches for pre-6.2 versions that don't
implement timer_shutdown_sync() to address this type of bug.

Is there some other, unavoidable reason I'm unaware of?

>
> thanks,
>
> greg k-h

Regards,
Jeongjun Park
