Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CBD1BA275
	for <linux-sound@vger.kernel.org>; Wed, 11 Sep 2024 19:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726082869; cv=none; b=UkAtTYSKbgqIt+hLHl+pRDS2GqRFPVGbDGXBs5AzfisOiuJrNU1Vn2YtORQBRyqpMnxrI63oGGSnnENoPr+ji4JJi/2KUndoqx89xaCcG8X5EBjjjO2YMEOa1fKW6E3AD9O2OgbwzieWVVCkPdE547qCdrUlDYyoH5EmGKLr8Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726082869; c=relaxed/simple;
	bh=28VQxxTcF6zriSW//kiDBloDgrUWMiPf3s4r6H2DoeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWfwmdWqBeA9ChWdODwjRu0Un4BK8hEs7s3Pz4Nd1D4M/AutjjV2x/1yE6y06H5EJ79KAuR83NiuhkcxlSBjpb1stLLy+bPTIgw1SMrJr0HbXA4T/se3JkWFbJWJyThFAcyoAZtGd++MrESsVfzkK5UeV6ucNp0ncyu8tXXvBSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QmUxzc0N; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QmUxzc0N"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53659867cbdso242767e87.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Sep 2024 12:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726082865; x=1726687665; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVNn2ed2GBXRXi1IS2byeByLJGlVq8ZELsiy66KEkNM=;
        b=QmUxzc0NMI+Gw3nYTWZ8pHFwF2doPnLEKY2+kx/12AiTOVys85NyEFL/6tdB1vMb5N
         s86zic89XqHQgvlaNSto/MPbnm0JU1yYzutX8DHibdZtb+LdRp6Q4SCuzPL0lgXv9C0F
         catIz9V4+9uGUQyFI+VCDzFuSzUQgOfh0eJsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726082865; x=1726687665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVNn2ed2GBXRXi1IS2byeByLJGlVq8ZELsiy66KEkNM=;
        b=BET+17ORgHQQTgAciTkl3MEosOu3Q/Lz5iT6AWA0/AmNJAEkZmcYTYI+x1GWaf12kp
         PFrVxZ67myk+3e5S6vPnVKzhTy3+/2qmkd3rrq8NaqZNtch0J/0k5RwZNLGQWtsdmWgg
         56sR+F9uWM2VWYwq37GOVlN05jbjHFXv25PMEqWxGc6AAzje/mRbUbcM7I9ewHEWuXIs
         PVHILHYVufg28B3Z+mWmzWTc7I2iIlT35oDF1U7urLtOclO4SkRp7zG1HJoia1i8SbYz
         drcUJny9dgGcgvNUy/dv58okWDB1CGBp7A3+Nj4QRH2w5aEL11/nNUbCHuS9C8hfWRmU
         CR0A==
X-Forwarded-Encrypted: i=1; AJvYcCWPffYH4hbBNhGS52KffG+7vtjMxQK2R5abIJbwc3OEaJSIXGXgdInk6LUfQOCuN94KAwPcBwQimmq4JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrTaIGW7wSyQY/GlNKuxp7iOyOCPC67MySmu+JAwaMuXiHYvhA
	BWum9CFu3D/6djCIYOjMKcCqFzq5ISf0VktxWscymh9/arYNVkGtLb+QHV1NeLX9ecQVJ2VFYpa
	C1uZkSqUeRZVrlo0eLDcT0xh0lw91uonsuOfQ
X-Google-Smtp-Source: AGHT+IEW2bxQx2PeMhxbvntpzjVnkkvCp2gCzaOGUyXEwbimgXH5Avs6JFBqhKxW4Eh2kobLxWBwS7SfV7odLAGzdEE=
X-Received: by 2002:a05:6512:ac9:b0:52e:932d:88ab with SMTP id
 2adb3069b0e04-53678fb7165mr370248e87.23.1726082865014; Wed, 11 Sep 2024
 12:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906211445.3924724-1-joshuapius@google.com>
 <878qw2d1ry.wl-tiwai@suse.de> <CAFs7P=g8Pqk2-WH8kX6spNSjJ8x80GnDur0ny2CvpzTKb7oa+Q@mail.gmail.com>
 <87o74v7w43.wl-tiwai@suse.de>
In-Reply-To: <87o74v7w43.wl-tiwai@suse.de>
From: Joshua Pius <joshuapius@chromium.org>
Date: Wed, 11 Sep 2024 15:27:34 -0400
Message-ID: <CAPUqXZAabm2xCK_H9bf=JBZk25BXKzsCUtcGEv0dHsMCyUTcZQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Add logitech Audio profile quirk
To: Takashi Iwai <tiwai@suse.de>
Cc: Joshua Pius <joshuapius@google.com>, alsa-devel@alsa-project.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	"Steven 'Steve' Kendall" <skend@chromium.org>, Karol Kosik <k.kosik@outlook.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Done.


On Tue, Sep 10, 2024 at 4:25=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 09 Sep 2024 04:03:36 +0200,
> Joshua Pius wrote:
> >
> > Yes, this change is for UCM profiles.
> >
> > Yes this should be a one time occurrence as afterwards effort is being
> > made to migrate over to UCM v2.
>
> OK, then I'll take it.  But, I noticed that your Signed-off-by tag was
> with google.com address while you submitted from chromium.org.
> Could you align those?
>
>
> thanks,
>
> Takashi
>
> >
> > Thanks,
> >
> > Joshua P
> >
> >
> >
> >
> >
> > On Sun, Sep 8, 2024 at 3:47=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wro=
te:
> > >
> > > On Fri, 06 Sep 2024 23:14:38 +0200,
> > > Joshua Pius wrote:
> > > >
> > > > Specify shortnames for the following Logitech Devices: Rally bar, R=
ally
> > > > bar mini, Tap, MeetUp and Huddle.
> > > >
> > > > Signed-off-by: Joshua Pius <joshuapius@chromium.org>
> > >
> > > Is this change needed only for UCM profiles?  UCM v2 should be able t=
o
> > > handle better to identify models, and such short name updates aren't
> > > needed for them.
> > >
> > > OTOH, I don't mind much to take this kind of small harmless changes
> > > (unless it happens too frequently).  So I'll likely take this, but
> > > just for verifying the situation.
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> > >
> > > > ---
> > > >  sound/usb/card.c | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > > > index 778de9244f1e..9c411b82a218 100644
> > > > --- a/sound/usb/card.c
> > > > +++ b/sound/usb/card.c
> > > > @@ -384,6 +384,12 @@ static const struct usb_audio_device_name usb_=
audio_names[] =3D {
> > > >       /* Creative/Toshiba Multimedia Center SB-0500 */
> > > >       DEVICE_NAME(0x041e, 0x3048, "Toshiba", "SB-0500"),
> > > >
> > > > +     /* Logitech Audio Devices */
> > > > +     DEVICE_NAME(0x046d, 0x0867, "Logitech, Inc.", "Logi-MeetUp"),
> > > > +     DEVICE_NAME(0x046d, 0x0874, "Logitech, Inc.", "Logi-Tap-Audio=
"),
> > > > +     DEVICE_NAME(0x046d, 0x087c, "Logitech, Inc.", "Logi-Huddle"),
> > > > +     DEVICE_NAME(0x046d, 0x0898, "Logitech, Inc.", "Logi-RB-Audio"=
),
> > > > +     DEVICE_NAME(0x046d, 0x08d2, "Logitech, Inc.", "Logi-RBM-Audio=
"),
> > > >       DEVICE_NAME(0x046d, 0x0990, "Logitech, Inc.", "QuickCam Pro 9=
000"),
> > > >
> > > >       DEVICE_NAME(0x05e1, 0x0408, "Syntek", "STK1160"),
> > > > --
> > > > 2.46.0.598.g6f2099f65c-goog
> > > >
