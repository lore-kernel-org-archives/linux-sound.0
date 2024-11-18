Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCF719259B
	for <linux-sound@vger.kernel.org>; Mon, 18 Nov 2024 10:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924489; cv=none; b=kGQL89BV+GSZBuPr47FXTfI1gNrY15Xyh2lhX4K4BXqNMSTbC9/RFEMpPG03KWDJxlPP3OPbL5qbHeV0aCknyyIiZyeaSexGOCW5/EKyq8yjc9uVw0e7teoY6oUtGAW73gaGrekT+OXd1/xhvOp1pWdqrIBxSCBlVImaix71gXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924489; c=relaxed/simple;
	bh=46FBQ9YilRkgukvDTFCIUv+jroGhUjtKv/1xcSI1Kw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=leJiJYIwSIkZoktxL7s5D/WFRrsFA7PFobUfBApPiHOeisP8fcdIF+yXnFlBnwoyYf/urkWMHEh6/jwylJESV8hraSEqB+syv4UkDhWfWBYZ7LkDdlFKCO0bfzQKkGa3gubj8FR+gE03DyN9wbERKmuRjIT+Wj9RWpdgM+0B5aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B5Hqc0Z7; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B5Hqc0Z7"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d413def36cso18910686d6.3
        for <linux-sound@vger.kernel.org>; Mon, 18 Nov 2024 02:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731924486; x=1732529286; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cDbGB4TmwOLd1WdZCgvlYswY84crRtJuB0qexEiL4sE=;
        b=B5Hqc0Z7KEN8nDDnNvSiBolTXnrfPdWdY5NIKXkYZf8XoYCSslwro3dNv9tf2NZsgS
         qas5iWJq1J6+Azs0ivcMCQ2rqvIOATD3cU/BWhU43UNunMgzxlnsQElhRxUZpDpBqmy7
         0reoti7zKslRnbK39R+mHmZnM8inYyaDxdncNUjYf4SSoVpiTBNF9Wugq3dGqH4qq+Aq
         xg1Xd0PmvASNdfLqUvGRJ2pKtvEm1i+ydBBwDdYhw32ARAdKnsfPnWCs57jakBSxtybj
         wzX4apgAJSVZMEixdM7PHqnJw0qtLGL4w6keIksIzJEZ0As8sEIwdcpgbOtHDgUPZ8Vf
         gkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731924486; x=1732529286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDbGB4TmwOLd1WdZCgvlYswY84crRtJuB0qexEiL4sE=;
        b=Lt0Cc9wIhLfOAZ74ZuRtyFkYFk0m9wVuYEMAExJffdWSlTKXlBW3b5dLqJbQgSe3QL
         KgtL0WXKxzPLK7pRxkBWlOrapTTcBL/1/vSi1I6IYRo1NEYfoLcPwMqKnPMiua0V5FzG
         JHLVYWO0JNIDFaAIWMjlycoK3Aado0larMLVM/c3o5YUiYDhhlhwhliJ6DshfUtnzGfq
         bt6MrUVqu0LyKkArageQHshmyYL3JUdWV+9HDIvEBxCGa5gTKFol52/vL5VB0DKkitbc
         aL4k/9tsdZchK+ZMSJgriO37NmsSQhTPW4i7doS40LHkFpkqezEF8RccdXGtF2xxxQIw
         jXxw==
X-Forwarded-Encrypted: i=1; AJvYcCXGQ1xVAbh0dA1Vwf0K4w5t0PDHS139kUArOsjISS2MTPWqAARQ+0BaCc9SMM+izUrZ2PGpBl+huSYoPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxwpMuyWaWP4FtG0jBufGs2/PQNYruz3a0AtUbVhcIFFVVdquz
	dUllCMfZ9Mji9FsN/soVTb6DFbPZ0y5Oby0g6syBdEXD9CIrZEr8im0Mq2CJWXWPOpAUzmqtB73
	JFIhYRDEN3I2+Gu3Wy7bfQXxUym+5NX0MvU45
X-Google-Smtp-Source: AGHT+IHA2MPIwKa4zKtddEKeFNuR4HcOqJbPWHm/9ZQc/6T4hQjwDS7pdFUp1X4j0eQ9paSxKWPL73J2araWMP54VO4=
X-Received: by 2002:a05:6214:570a:b0:6cc:378f:f7fb with SMTP id
 6a1803df08f44-6d3fb88beb2mr174785646d6.35.1731924486301; Mon, 18 Nov 2024
 02:08:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115130833.1077260-1-bsevens@google.com> <87h686q7t3.wl-tiwai@suse.de>
In-Reply-To: <87h686q7t3.wl-tiwai@suse.de>
From: =?UTF-8?Q?Beno=C3=AEt_Sevens?= <bsevens@google.com>
Date: Mon, 18 Nov 2024 11:07:55 +0100
Message-ID: <CAGCho0VT=ntX6ysJ-NvquTxK140fRAkL7kFu3sXLnUXOhVr5pA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Fix potential out-of-bound accesses for
 Extigy devices
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lianqin Hu <hulianqin@vivo.com>, 
	Manuel Barrio Linares <mbarriolinares@gmail.com>, wangdicheng <wangdicheng@kylinos.cn>, 
	linux-sound@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 17 Nov 2024 at 15:00, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 15 Nov 2024 14:08:33 +0100,
> Benoit Sevens wrote:
> >
> > A bogus devices can provide a bNumConfigurations value that exceeds the
> > initial value used in usb_get_configuration for allocating dev->config.
> >
> > This can lead to out-of-bounds accesses later, e.g. in
> > usb_destroy_configuration.
>
> It'd be more helpful if you can elaborate how it can happen; the code
> you touched doesn't call much stuff, just send a boot sequence and
> reset the configuration.  Yet your patch tries to overwrite a
> usb_device field, which isn't really a task for the driver side.

I am touching a field of the usb_device->descriptor, which the current
code is already doing in usb_get_descriptor().

A malicious device can use the  snd_usb_extigy_boot_quirk() quirk to
provide a new device descriptor with an increased bNumConfigurations,
after dev->config has already been allocated for a smaller
bNumConfigurations. This will lead to out of bounds accesses later on,
such as freeing out-of-bounds pointers in usb_destroy_configuration.

Actually, I noticed snd_usb_mbox2_boot_quirk and
snd_usb_mbox3_boot_quirk can probably be abused in the same way, so
I'll propose a new patch that also does a check there.

Unless anyone knows of a better/cleaner way to fix this?

>
>
> thanks,
>
> Takashi
>
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Cc: stable@kernel.org
> > Signed-off-by: Benoit Sevens <bsevens@google.com>
> > ---
> >  sound/usb/quirks.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> > index c5fd180357d1..970d36d13ad8 100644
> > --- a/sound/usb/quirks.c
> > +++ b/sound/usb/quirks.c
> > @@ -555,6 +555,7 @@ int snd_usb_create_quirk(struct snd_usb_audio *chip,
> >  static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_interface *intf)
> >  {
> >       struct usb_host_config *config = dev->actconfig;
> > +     int num_configs;
> >       int err;
> >
> >       if (le16_to_cpu(get_cfg_desc(config)->wTotalLength) == EXTIGY_FIRMWARE_SIZE_OLD ||
> > @@ -565,8 +566,11 @@ static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_interfac
> >                                     0x10, 0x43, 0x0001, 0x000a, NULL, 0);
> >               if (err < 0)
> >                       dev_dbg(&dev->dev, "error sending boot message: %d\n", err);
> > +             num_configs = dev->descriptor.bNumConfigurations;
> >               err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
> >                               &dev->descriptor, sizeof(dev->descriptor));
> > +             if (dev->descriptor.bNumConfigurations > num_configs)
> > +                     dev->descriptor.bNumConfigurations = num_configs;
> >               config = dev->actconfig;
> >               if (err < 0)
> >                       dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
> > --
> > 2.47.0.338.g60cca15819-goog
> >

Thanks,

Benoit
