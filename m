Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4C9136A
	for <linux-sound@vger.kernel.org>; Wed, 20 Nov 2024 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732093677; cv=none; b=sD5OP2Q8XIMpCIQsphj2i6Q2I5PegTD1cgK58TUHck3HzQIkmDyrL7dvA1290awsM5UdPi5ZFaVCOMjLJGAKYSr5Qv4M0pq3V2vohyL/AJxe3PRQIYkYK38WHOIPlV//ZxWZ7pIhXWaDa/ldxrVYgRR2YFBQtlvWq2q518cBps4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732093677; c=relaxed/simple;
	bh=GzDpos2oTak5EG8IyS770pl3D40s6N3y4PbDDT7n+2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IkZ/4Ulr2GTf8/c6pL2h70LORCGo1Hb/EhPmORwTXFI9Gmk+RpjqN24H6L4mbu+lPJl1LkL2aY9zmcA6vcaDRGrDfsqtjMHTxM1THybpZ0cktwFsk0KhcJK+76mTUNkgyCz6akXShjAa+bEi0ftS5P+vC8fs+3wKonW3S/GS2Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qqtmkTvK; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qqtmkTvK"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d4035f2d18so11887926d6.1
        for <linux-sound@vger.kernel.org>; Wed, 20 Nov 2024 01:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732093674; x=1732698474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2WwekQUFr0BvAwRNGQmepwGXwE9UlR1YoNyav/1R1M=;
        b=qqtmkTvKCP4RTN8dVi1998cJ0T47Z1CazXFpoQEFh650g0lJKvZZwYCNfq0Z3rWTyE
         Og2Hg16G1U1A0Sc7cY7sM3/+ZmehJyCYW5oVr4tG8D0IIjglA3dFA6rH9lZjB2PUfXyh
         7YPGi8yiM6XOnhwGE2yf6a8wd8tGt69lpdHFuA7hgZOSiWfDa5viSMXbwptPRSU1o3Qi
         EnDuAgDQ7S5dDDtWTBUB8FFX4A/W84ggJ1nMyKGcc3dLDdB7DhCrSCkIAC5hZLP0Lg7m
         d816yFHT3CrGxF3gb49M6Xuz4VL/BE8RHIHkt0cpaZK03H53RJt9PK9tHC+iLUo5ojZz
         ddXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732093674; x=1732698474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2WwekQUFr0BvAwRNGQmepwGXwE9UlR1YoNyav/1R1M=;
        b=UAG4cHHDiSC3anNDnKJ9Fdhf3Avgf24W1AKTICcuY4lChe3p/Vw/Yyyqpep0nYTzC2
         dN4sto59D2oPorZ5kuMDnKWKGqh5B4wM+OvjasUsGoVhBK5ds9EzhuqEdEHAWl3vDXzj
         QxUUSTF1u2f1AQODnW0HAiAbZR22EAXgCSzBg9DQHCN6dX2zlRgBqTsjQVfFdlaUGTy1
         +ja/MTY1ANtxKigRc6+jV5VE7Tj/+syPjLsRSZs8WhtjpqgJUP/XYslYQ8B3IOf04m/z
         bRzaVICRzVrPZ0yHxYu6abMB94rS+oZ5rJR0JpnnnH/HyRQp9ULIHcXQkuQKCwRRNzIJ
         zrvw==
X-Forwarded-Encrypted: i=1; AJvYcCXmYiv097txYzkJpxOkYTpqAeGZbZYBd7tfIUjmj3qkB6mOFbXqVIlZt3DqYJNyum7G0Uzi17MNtoUpWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5iaoUAO2peMla2NVv2qf3l3FWghy13unfnlykfo4+a5hSX4Ah
	KCezTMFbuExX0Gqmr2nUEVH43gaar/ynbBMAOT4j5RTj7ByXx3p5fpgkdzpvhXOPO0XvnwjJ825
	ZfK5Xk1CL0ueOVH6iheGN1ziKGhtbz9ibtmhS
X-Google-Smtp-Source: AGHT+IGSk12PvmdBPB0uCNXrddUUrGooFWDFFmyiH72FjUWqdT5rfdTRQl47SUAxiUMeimg52XjO3rPupBIH9pRUSJI=
X-Received: by 2002:ad4:5c49:0:b0:6d4:2616:60c1 with SMTP id
 6a1803df08f44-6d43780f3f2mr27515496d6.29.1732093674284; Wed, 20 Nov 2024
 01:07:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119142813.3528722-1-bsevens@google.com> <87mshv5lna.wl-tiwai@suse.de>
In-Reply-To: <87mshv5lna.wl-tiwai@suse.de>
From: =?UTF-8?Q?Beno=C3=AEt_Sevens?= <bsevens@google.com>
Date: Wed, 20 Nov 2024 10:07:43 +0100
Message-ID: <CAGCho0V4xhCPNODRvtaJBYDkDwuyqhNo1vJK3u1bDJQyUJF6WA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: usb-audio: Fix potential out-of-bound accesses
 for Extigy devices
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

On Tue, 19 Nov 2024 at 15:43, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 19 Nov 2024 15:28:13 +0100,
> Beno=C3=AEt Sevens wrote:
> >
> > A bogus devices can provide a bNumConfigurations value that exceeds the
> > initial value used in usb_get_configuration for allocating dev->config.
> >
> > This can lead to out-of-bounds accesses later, e.g. in
> > usb_destroy_configuration.
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Cc: stable@kernel.org
> > Signed-off-by: Beno=C3=AEt Sevens <bsevens@google.com>
> > ---
> > v2:
> >  - Also add sanity checks to snd_usb_mbox2_boot_quirk and
> >    snd_usb_mbox3_boot_quirk
>
> Thanks for the revised patch.
>
> Although we should fix better in a long term, a duct-tape fix like
> this wouldn't hurt.
>
> But one thing I'm considering is...
>
> > @@ -565,8 +566,11 @@ static int snd_usb_extigy_boot_quirk(struct usb_de=
vice *dev, struct usb_interfac
> >                                     0x10, 0x43, 0x0001, 0x000a, NULL, 0=
);
> >               if (err < 0)
> >                       dev_dbg(&dev->dev, "error sending boot message: %=
d\n", err);
> > +             num_configs =3D dev->descriptor.bNumConfigurations;
> >               err =3D usb_get_descriptor(dev, USB_DT_DEVICE, 0,
> >                               &dev->descriptor, sizeof(dev->descriptor)=
);
> > +             if (dev->descriptor.bNumConfigurations > num_configs)
> > +                     dev->descriptor.bNumConfigurations =3D num_config=
s;
>
> IMO, we can get the new descriptor locally, then do
> compare-and-store.  If bNumConfiguration is unexpectedly large, it can
> return an error without modifying the original descriptor.
>

That sounds like a good idea. I'll send a revised patch.

>
> Takashi

Thank you,

Benoit
