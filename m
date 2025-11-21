Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019BB126C17
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 10:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763719407; cv=none; b=s55J+Anu7D8wTHTz5w+R1PyeVowZAqvyqri5XQKO6iLPJToHSx7lkRVhqGohJP26oPwjVegOzi+VNitInrD/m0aktwZuHpyXThZJocsFoom+027bSe9SdraeWbOnPuWuwFeLTX85sghYf9FG24kBHxX4sMPNqI8GXA4QmDvNnQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763719407; c=relaxed/simple;
	bh=i5HAL7zxYO0FR1UhUzrd2VJ+jDNhCdMevP1IK3NEp4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I39DJRvmvr5g5kA92iAueuil5g5DpeiP2Jf/4ZOQ9cUifIfrw8SbZpzTNFeXBssRa0NO/rh1X8re8GlkRLodvLhSRR4bDXlJJgWGCA0P4xp7FWPmOmgjfY2wS/5itbp0PfL+QtdViuScrWmd1clVhFy5lcPGfr/5BJ6JSr1fLT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+UJBp2Q; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+UJBp2Q"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5957753e0efso1862714e87.1
        for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 02:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763719403; x=1764324203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q06qwS7bqzHrgv8P9i29J5CGzzldkNz7+z8LjgxLs+k=;
        b=G+UJBp2Qpn2r9GlChQO/jGevjGwyq/lwcKzHcchu6azc+wjpoANxE2ygGo/8fxJzs5
         0/gTaRdHJ1Eid41kQ9Lbzxg3OS1EPQSio9Y1PVdxEGedLfvVUeC78G8C8Y9GpuPApY/p
         9MaXInbKhItSY+X5PLjsm8znzNuVnejnEkO61KG/A1uCQWfW4kHXF8rSaSkwOlJT1ruR
         Bj0Afn9+sa+U96gf+gtGMn0HgoGZqERjEWKyViCKSHPuKDwNwnhDVSgXUfgkOYJlEETg
         MiH69SOVOV3y8ZJ5LyUHeFyWZZjdyAYabP8jAsbYINt61O0b4yGa3CFMXbGHucwDegOX
         XipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763719403; x=1764324203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q06qwS7bqzHrgv8P9i29J5CGzzldkNz7+z8LjgxLs+k=;
        b=obdF8MZ0+P34Wd7koLLDgyHYkFAmVj7S7SQh9aA5yt5afL6aaM++ouT0OO51KdIzH1
         DPKMpgNS9s4h63X8v0rKOhHjVE6SOXq/2hI/EzwH1E6mpKzL26rl9SfmzUBv460MVvVS
         U5Yk/4rJYHueQikHMh/2ulF0NsnddoA5sEHU7ZWtDFUmRHFniB3/a62mOIwFtorUkNDS
         vqEoNdmww4aPcgqcW6WxyXbXtG/CRCibubfUgEgGnqkVdQwckSSO+Tn1cQVBXDIDWCik
         nEiZ9vxuC5EIUlkGyWec/72wcAgNWN0NhD+LKf5RFfodRCSL2icsBgH4/Mld16vf45he
         GMQw==
X-Forwarded-Encrypted: i=1; AJvYcCXqlr+98q4lxty2I9qRekYKEVUP/05Pnc9YQE6q7R4Y6TxEvJcriLChkBpxKthsZTdC1uyZWFvMn1a4Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYQQ3Ecm8iZr74pn0isakdcO61izP2X2ecBzWS6ALtNbyzhb1v
	lMG14iOIRzDzlhrE9v9MP/1TFW8y4eRcfJXJC700MYt5jW489s6F9TqCwUYormyMRGMHsUpRECB
	wCymJ66GtnB/ZTHoo69pcdEMKX4SwlqKB8Y67P5c=
X-Gm-Gg: ASbGncuRfNRwNtxIAoUxcqq14emxH5Aj5ufOgCWs9dm7fQ1FvdZIvY+UGmn0FcUL6+A
	MIlurkr9swC0+KcYlYTw3VpxKQTSYqYiZRpZzmTNOViaoJxatJ1e6Q49XVktoGagZTb1B9y021y
	Y8xH/ehri0Vq216CVPGz6sfdbnkTePLkgExqHFa7ToTbDrnaqktDPogreLzOUTnrXMx6N6SN3Sw
	2J8JtGRoFt3izK2L+QPsqkha8TwoJAJvS1HgbEreNEo+IIZ/eFTeKtSM0MzTzeLR4wePD0=
X-Google-Smtp-Source: AGHT+IHrP6aVjQApeDnivY2kYJNlL05WT+Hh0OV8LFZHoS6qVTl0TXomg/xX42Oq4HhhbYGYBiYqeR9GtMivTZCJ8WI=
X-Received: by 2002:a05:6512:158f:b0:595:840c:cdd0 with SMTP id
 2adb3069b0e04-596a3ea6320mr538963e87.2.1763719402522; Fri, 21 Nov 2025
 02:03:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEo2pzvpEXYZzpLXesDp=wvQJ7VN8yaVZZDkCMvFzKySaezf_A@mail.gmail.com>
 <87a50f4ti6.wl-tiwai@suse.de>
In-Reply-To: <87a50f4ti6.wl-tiwai@suse.de>
From: Ilyas Gasanov <torso.nafi@gmail.com>
Date: Fri, 21 Nov 2025 14:03:09 +0400
X-Gm-Features: AWmQ_bmDkRDNN-iZJ-xAQkuHdWudy_XJ6F9r2X4BFxv524xGohj5A9ROXeyLiiE
Message-ID: <CAEo2pzuMBmcR8Oq8nPXRwp5s3sWQ=jm9Etp8x1MiX_udG5MEww@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP ProBook 450 G8
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Nov 2025=E2=80=AF13:36 +0400,
Takashi Iwai wrote:
>
> On Thu, 20 Nov 2025 20:15:47 +0100,
> Ilyas Gasanov wrote:
> >
> > My laptop, HP ProBook 450 G8 (32M40EA), has Realtek ALC236 codec on its
> > integrated sound card, and uses GPIO pins 0x2 and 0x1 for speaker mute
> > and mic mute LEDs correspondingly, as found out by me through hda-verb
> > invocations. This matches the GPIO masks used by the
> > alc236_fixup_hp_gpio_led() function.
> >
> > PCI subsystem vendor and device IDs happen to be 0x103c and 0x8a75,
> > which has not been covered in the ALC2xx driver code yet.
> >
> > Signed-off-by: Ilyas Gasanov <torso.nafi@gmail.com>
>
> The code change looks good, but the patch isn't cleanly applicable due
> to the line breaks by your mailer.
> Could you try to resubmit with the proper setup?
>

It looks like the issue is either on the lieer (gmi) side, or on the
Gmail server's side (in which case I'll probably have to set up a
separate mailbox with another service specifically for patch
emailing). I'm inclined to think it's likely the latter, since in the
copy I'm having in my Sent folder, there are no extraneous line breaks
in the code. Could be wrong though, might as well be an IMAP sync
thing with lieer, for all I know.

Configuring Gmail to work with git-send-email at all is a pain these
days anyway, in no small part because of Google's rather convoluted
OAuth2 token issuing policy. And plain old passwords just don't seem
to work anymore, at least for me.

I'll see what I can do later.

>
> thanks,
>
> Takashi
>
> > ---
> >  sound/hda/codecs/realtek/alc269.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/sound/hda/codecs/realtek/alc269.c
> > b/sound/hda/codecs/realtek/alc269.c
> > index 6748057e6a14..10c83cd3460e 100644
> > --- a/sound/hda/codecs/realtek/alc269.c
> > +++ b/sound/hda/codecs/realtek/alc269.c
> > @@ -6590,6 +6590,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
> >       SND_PCI_QUIRK(0x103c, 0x8a4f, "HP Victus 15-fa0xxx (MB 8A4F)",
> > ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
> >       SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41=
_I2C_4),
> >       SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC",
> > ALC236_FIXUP_HP_GPIO_LED),
> > +     SND_PCI_QUIRK(0x103c, 0x8a75, "HP ProBook 450 G8 Notebook PC",
> > ALC236_FIXUP_HP_GPIO_LED),
> >       SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One",
> > ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
> >       SND_PCI_QUIRK(0x103c, 0x8aa0, "HP ProBook 440 G9 (MB 8A9E)",
> > ALC236_FIXUP_HP_GPIO_LED),
> >       SND_PCI_QUIRK(0x103c, 0x8aa3, "HP ProBook 450 G9 (MB 8AA1)",
> > ALC236_FIXUP_HP_GPIO_LED),
> > --
> > 2.51.0
