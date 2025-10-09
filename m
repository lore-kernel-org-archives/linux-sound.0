Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55B92D5944
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 12:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760013737; cv=none; b=qwivBBI0bYyWxdMnBlWDDW1ngysZPCPFABMQ2ccsP254TyFh7xkfVB1IJVbj60uclgdrGe7VOqxaE+SmCiE/IMCwftHJZg4D6DwAyeNB1HsWBZkS4wC9ngM4geC8LC7Jaidp5S93bzQhsnGuyXgo0RSor9b7GCa0m/eNKH3qWns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760013737; c=relaxed/simple;
	bh=bYIFaq1Mo5ck6eZSr/P9RWtuoRuQQYxYdIqM9OZP/BA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K4q+rAEM0eLcGNukynVRpc5YtishH1gGE93quUoaeXYP9miBzqlJFWJ80n6/vRWADMKgMMe0q8V5nz5BtCvs+4oT17q3GKbQBhOAMO29De+rLJ67LmF6OSa3Gw+x/S/ou41o/p4CzR14Tm+HbAKIRPK1acDCv444mgF1gJ2krlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRNQO7ZS; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRNQO7ZS"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-273a0aeed57so25038995ad.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Oct 2025 05:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760013735; x=1760618535; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DOe3oVDqR85nR2fwu3ohGJtPxHxOCysNyoebRoZ3K5o=;
        b=fRNQO7ZSOovyLAjJWT+hp3xgGVk6HxqW7+6i0R7Fg949cEf85VguWKAaQPJSfuE4qI
         8s7vVVqPXaPR3U4JAXN0zMRmXUW6wGj4dDBMeuWmAbuzZ9SlzTsfWKYKg2wtquteeRVU
         bf4KNpp5KP+08MD/kyB9kMP5OJY1WToZFmwUtOD+/dR9mjVe/vnVrC965Y5NZpLCxz7r
         edeSMMhgUoJwQUIJtsk9bkszIggMuESyJ7qcVQP5opLUWg50O3Intt65Dmk3DEjafQQb
         pT4XWp4o5ZufosE32AyCzsKI7zctlrFGZTL5FvxGJp4ftFtbeUYUhCurx5HQccwjncqU
         XrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760013735; x=1760618535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOe3oVDqR85nR2fwu3ohGJtPxHxOCysNyoebRoZ3K5o=;
        b=OSb6kFxiXhJLYe1wAQLBH5ps0uESpTcveVLSmmJWZCf4Kv49SD0O1O8k+fk8bLOw4J
         IJ2vtJVmsfgXmyX2KPCE+t8/KzDVQpD40Qz1FJUHY3MeLOCbibXw3JdTRHHFhlf3S6WC
         2d77oX7rS78C6qS9nPnLGmWndGAQqcaBZxkyCO7/+8OiVGiN7caUBnT0xqqbUOKMaSBy
         /Z/6F3v4E4QdhWhtBC0ejilPoX3v9pd9baBpmKVoDNk2e0RIakStThATwk1SZnONBlvA
         dDBX9j9U98El+o8m+yAhn8BjipI9oCKFrC2T6RScOY2SYZwp1Ez7GVgi/I82V8h+Lf7g
         k7Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWnpAoUI/BhoYvHE9l60RGuo3QEtIEu9dAUxqxwJU1QwZGy49HS/dUYDsapj6Id4TyupVBcRfGM00AY1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyETXjBJyuy4w0m/exKbQ1CX79mV1VaiwN823tL+aRp0lE1rvF
	VUimJ4967SFhsJ+M+1YQEEl3JFgKoBtFQt3bdlgzoI1aZPPc9GUBKKcPE2AwvpcUi1RqpztehPw
	dsvQgEMaX964reSYlfc/SqaH+XPX4CO0=
X-Gm-Gg: ASbGncuFPB+EsyhF73VeLZK5K/PR8+SE3AknEXlIFKQUUIsNti0wTRS+dqLOdRzM95M
	otnM/P4JxFKEKjwzr9SUm7PzTCN+gWtorbFtDmCfYQWoR7xD2uNgotskOdrhOtgC7I07k1epnRE
	+apg8pNLAOFZChwAQz3Pgtmdj4N2KgApvVCq2bjlVyrcIA7inGhW9R8eeL/9fueVrZyckKvwSXo
	oSueNbjKJ3sHrLnIc2+LP97ACbEyw4Guw==
X-Google-Smtp-Source: AGHT+IGNyj/nlQwe8P7jt8p/6nIFzaQojjpzpHA2u3gzIiLTo+jcmOhifOgoQWIQZU+ee5SP9iX/eeXegA+8sYDkv0s=
X-Received: by 2002:a17:903:2c03:b0:279:b2cf:26b0 with SMTP id
 d9443c01a7336-28ec9c97450mr139697695ad.14.1760013734835; Thu, 09 Oct 2025
 05:42:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007155808.438441-1-aha310510@gmail.com> <2025100824-frolic-spout-d400@gregkh>
 <CAO9qdTEo46hCZ0UXKjjBQ4W2sLT2+5zw9DugQF98sqpHLyNzPg@mail.gmail.com> <2025100940-unrevised-passcode-6682@gregkh>
In-Reply-To: <2025100940-unrevised-passcode-6682@gregkh>
From: Jeongjun Park <aha310510@gmail.com>
Date: Thu, 9 Oct 2025 21:42:04 +0900
X-Gm-Features: AS18NWChPXtq3xJ5rkA9wSMgPxns56d8dKAkezJPDg5Kxa6WRZEDQu4yF8VynC4
Message-ID: <CAO9qdTGktp71We9BAhsd3bewb9yKWyOjbnq2TQh0CaV7CqD6UA@mail.gmail.com>
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
> On Thu, Oct 09, 2025 at 08:23:42PM +0900, Jeongjun Park wrote:
> > Hi Greg,
> >
> > Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Oct 08, 2025 at 12:58:08AM +0900, Jeongjun Park wrote:
> > > > From: Takashi Iwai <tiwai@suse.de>
> > > >
> > > > [ Upstream commit 0718a78f6a9f04b88d0dc9616cc216b31c5f3cf1 ]
> > > >
> > > > The USB-audio MIDI code initializes the timer, but in a rare case, the
> > > > driver might be freed without the disconnect call.  This leaves the
> > > > timer in an active state while the assigned object is released via
> > > > snd_usbmidi_free(), which ends up with a kernel warning when the debug
> > > > configuration is enabled, as spotted by fuzzer.
> > > >
> > > > For avoiding the problem, put timer_shutdown_sync() at
> > > > snd_usbmidi_free(), so that the timer can be killed properly.
> > > > While we're at it, replace the existing timer_delete_sync() at the
> > > > disconnect callback with timer_shutdown_sync(), too.
> > > >
> > > > Reported-by: syzbot+d8f72178ab6783a7daea@syzkaller.appspotmail.com
> > > > Closes: https://lore.kernel.org/681c70d7.050a0220.a19a9.00c6.GAE@google.com
> > > > Cc: <stable@vger.kernel.org>
> > > > Link: https://patch.msgid.link/20250519212031.14436-1-tiwai@suse.de
> > > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > > > [ del_timer vs timer_delete differences ]
> > > > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> > > > ---
> > > >  sound/usb/midi.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/sound/usb/midi.c b/sound/usb/midi.c
> > > > index a792ada18863..c3de2b137435 100644
> > > > --- a/sound/usb/midi.c
> > > > +++ b/sound/usb/midi.c
> > > > @@ -1530,6 +1530,7 @@ static void snd_usbmidi_free(struct snd_usb_midi *umidi)
> > > >                       snd_usbmidi_in_endpoint_delete(ep->in);
> > > >       }
> > > >       mutex_destroy(&umidi->mutex);
> > > > +     timer_shutdown_sync(&umidi->error_timer);
> > >
> > > This function is not in older kernel versions, you did not test this
> > > build :(
> > >
> > > I've applied this to 6.6.y and newer, but for 6.1.y and older, please
> > > use the proper function.
> >
> > Sorry, I didn't realize that the timer_shutdown_sync() implementation
> > commit wasn't backported to versions prior to 6.2.
> >
> > But why wasn't this feature backported to previous versions? I understand
> > that most drivers write separate patches for pre-6.2 versions that don't
> > implement timer_shutdown_sync() to address this type of bug.
>
> Features are not backported to older kernels.  If you want this fix in
> an older kernel, then you need to either backport that feature, or fix
> up the driver to use whatever was used before that function existed.

I could write a separate patch to fix this bug, but I'm not happy that
great features like timer_shutdown_sync() haven't been backported.

So, I'll try to backport the "timers: Provide timer_shutdown[_sync]()"
patch series sometime soon.

>
> thanks,
>
> greg k-h

Regards,
Jeongjun Park
