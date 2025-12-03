Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20C52D7D59
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 13:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764768889; cv=none; b=abNmevymIAV/H0H15M8sBEduevSn6BmdTT/2nhh4P5Vfwws8puotjm24LFnOiAaTmaSN1VlOYNzBd0yQJL3CdvgDTJOcxqX+TDXuw+An0zD96cC6GUZKeRrQFn/w7F6tDasSSpM73ixAUJG4LcVs+5BR3bAvg4QEVahdjceKFPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764768889; c=relaxed/simple;
	bh=Tqh3mAFFEpYiA6fivh/9gs5vQ23uQLVQP7vcMleDUIk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YRUMKSoRy/zXaEqq5pzXmSeTgUxy5gZA5KYND4qS07/Sg+avJ+ROxywdUeiwF1smLkQvJYkT8vvtRE3iX3uOqr3gwnKNazT/PIg650wjA7ea0pQ7n91jo47WApLymJfHzXFrA0XfrAsReeGy1A2fFKoxFt02mzaxsELzmbuFez0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbuOC4V6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbuOC4V6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so41522975e9.1
        for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 05:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764768886; x=1765373686; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s8T+mHxnmZgIFTmUGmZS98RRyK+RWbmul9OF9tWScA8=;
        b=QbuOC4V69TXnysuehBLaWYxWkTCPog4rwKQo1z962CuY+SsXpia2+TBA7iMxZfHWzu
         B2UgTO0K0n+QeCl8M14lwsnANps0RbEejYPfxUrmxIuttCeOcr4ErThkjHNGBAI8wdF8
         uXn/8q7RkzLvmrL4jF5DzZEo7VDIuRZlnE4yuooATP7Ce1GNHw3QxAydfwm5Hyt6/Q5I
         1Ljfx7gizbX+fESBwRiIGZfsWvECdAuRJN1Xq+M9FY4vzKa68DgaBuyPCQSqcvPm9+C0
         zmDAzXizn4jXAFDhIDraslB5rrkEL611KK39XRwDfA5gLf1Iu+zFTIzzszUin76PWY0z
         Jcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764768886; x=1765373686;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8T+mHxnmZgIFTmUGmZS98RRyK+RWbmul9OF9tWScA8=;
        b=D+y/fhMO1fuDaGFKXGcPNAKwUyKikPqT/U370YCW8NKFinzKzBAYzaVLIjLtXCahlw
         tH4voPpgK4H9f/ldv+Zec9UMUIb1LBW+sRz3g9gVxMrvLQdQnpeZZY7LhaJ9cHASBura
         ZaFs3M686nNXB6JFQdDWzUzl1CPhOONw9dTug/90uQB11QiGPXASX8p0dZZnORgOGOIP
         qGj8rzSdL2Jw3AJ+Njb9y6anzjdSzQ8zyI50CsBae2HHYPe4NZ/z7JFvRaztoAYDTHqh
         lMDjT6YXM26gBMJ+otYWj5Ni5RlFd6taCwVUuYriGvbpFXckqgiM6rqjGT4u5nkew+sr
         9dUA==
X-Forwarded-Encrypted: i=1; AJvYcCX6v/8HmrL8smFc8ZSW2eqHLbw6evl4OrHuVitPXJDevbUYPkBwd1gLnQzOfikcKCsSfX9PvjQB7FFCzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0tFFpSZR1Xu/NNu/ktIj8dyRLTjhDNfqguyWtQzA9vad0G0ND
	6Fcvj7HBHeNTa2nozwwhBoYkuLLMk1PjdCqgZHmvOa88e+82G6RxJULy
X-Gm-Gg: ASbGncsxj/Ph30eU4OR0Yw2I+rR3M7lyNEGb93TMVp64vnE+wPB41wO81SDKZd9jash
	LXlfGZfnWkwOne19PJziclZK+a/37CSF7siiRW6QwzyAqAR4L8mNlGPEorjPaTKbm/ikmvr0myp
	NPOA+Gave63EGZeAR76lMcxfnwme9+3/hRWUPiuD9/gzWaW46spW6p/CapfF4oXKjUqM6jGWrys
	FLRGtqARXsGIWWKOoMb5L494OndHpGb1sT7Wp+wUorPq/N7e6A1NxSG4hvrpUd9YTJnlC3icKmE
	vuz7Hof3QlQt++ovhmva3/kO3TkqwJcNosHS87uhftP97JHv9eSKOhZjCcXD2dMfvy2Fx86VJt7
	tvFT14kSXXvQyntYCjHScM41QSjyl3sPysPfcHHSO7k+1FUxJTCjcYj63FEx9/nX2eH9gEPXGPt
	xVjSBbKsrYMxTXDxE=
X-Google-Smtp-Source: AGHT+IFnRlI71As2M3jQCZI5fwc2lWbr6i4RZOzf31TQN+wMM93RqrqlgXezZAjDN5rw8TOz//88/A==
X-Received: by 2002:a05:600c:35d2:b0:477:8b2e:aa8f with SMTP id 5b1f17b1804b1-4792aefbf40mr33271195e9.15.1764768885573;
        Wed, 03 Dec 2025 05:34:45 -0800 (PST)
Received: from [172.23.94.183] ([147.161.143.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a79dcfdsm47474225e9.5.2025.12.03.05.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 05:34:45 -0800 (PST)
From: HariKrishna Sagala <hariconscious@gmail.com>
X-Google-Original-From: HariKrishna Sagala <hkrishna@gmail.com>
Date: Wed, 3 Dec 2025 19:04:40 +0530 (IST)
To: Takashi Iwai <tiwai@suse.de>, HariKrishna Sagala <hariconscious@gmail.com>
cc: perex@perex.cz, tiwai@suse.com, cristian.ciocaltea@collabora.com, 
    cryolitia@uniontech.com, franta-linux@frantovo.cz, khalid@kernel.org, 
    shuah@kernel.org, david.hunter.linux@gmail.com, 
    linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Initialize status1 to fix uninitialized
 symbol errors
In-Reply-To: <87sedrsp2z.wl-tiwai@suse.de>
Message-ID: <9012f70d-a3d1-2f80-8f4f-e9b7b7bbb40d@gmail.com>
References: <20251203083319.58555-2-hariconscious@gmail.com> <877bv4t03x.wl-tiwai@suse.de> <c6694145-253b-0ee3-c0f0-4b492994bfe7@gmail.com> <87wm33stye.wl-tiwai@suse.de> <54d0ac3b-6a10-7319-338c-80f52e62af58@gmail.com> <87v7inss1z.wl-tiwai@suse.de>
 <b44d6cf3-a96e-c0d4-99e3-c6af916a2e21@gmail.com> <87sedrsp2z.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Dec 2025, Takashi Iwai wrote:

> On Wed, 03 Dec 2025 13:01:48 +0100,
> HariKrishna Sagala wrote:
> >
> > On Wed, 3 Dec 2025, Takashi Iwai wrote:
> >
> > > On Wed, 03 Dec 2025 12:22:27 +0100,
> > > HariKrishna Sagala wrote:
> > > >
> > > > On Wed, 3 Dec 2025, Takashi Iwai wrote:
> > > >
> > > > > On Wed, 03 Dec 2025 12:01:35 +0100,
> > > > > HariKrishna Sagala wrote:
> > > > > >
> > > > > > On Wed, 3 Dec 2025, Takashi Iwai wrote:
> > > > > >
> > > > > > > On Wed, 03 Dec 2025 09:33:20 +0100,
> > > > > > > hariconscious@gmail.com wrote:
> > > > > > > >
> > > > > > > > From: HariKrishna Sagala <hariconscious@gmail.com>
> > > > > > > >
> > > > > > > > Initialize 'status1' with a default value to resolve the static analysis
> > > > > > > > smatch reported error "uninitialized symbol 'status1'".
> > > > > > > > The 'status1' variable is used to create a buff using "kmemdup".
> > > > > > > > So, ensure to initialize the value before it is read.
> > > > > > > >
> > > > > > > > Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
> > > > > > > > ---
> > > > > > > > This patch fixes the below smatch reported errors.
> > > > > > > > sound/usb/mixer_quirks.c:2462 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> > > > > > > > sound/usb/mixer_quirks.c:2467 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> > > > > > > > sound/usb/mixer_quirks.c:2472 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> > > > > > > > sound/usb/mixer_quirks.c:2495 snd_rme_sync_state_get() error: uninitialized symbol 'status1'.
> > > > > > > > sound/usb/mixer_quirks.c:2501 snd_rme_sync_state_get() error: uninitialized symbol 'status1'.
> > > > > > > > sound/usb/mixer_quirks.c:2522 snd_rme_spdif_if_get() error: uninitialized symbol 'status1'.
> > > > > > > > sound/usb/mixer_quirks.c:2535 snd_rme_spdif_format_get() error: uninitialized symbol 'status1'.
> > > > > > > > sound/usb/mixer_quirks.c:2548 snd_rme_sync_source_get() error: uninitialized symbol 'status1'.
> > > > > > > >
> > > > > > > > The below is the flow of 'status1' it is used before initialization.
> > > > > > > >
> > > > > > > > snd_rme_rate_get -> status1 is uninitialized and passed
> > > > > > > > 	snd_rme_get_status1 -> passed as is
> > > > > > > > 		snd_rme_read_value -> passed as is
> > > > > > > > 			snd_usb_ctl_msg -> created buf from status1 using kmemdup
> > > > > > > > 				usb_control_msg -> sent buf for reading/writing
> > > > > > > >
> > > > > > > > Description of "usb_control_msg", states as
> > > > > > > > " * @data: pointer to the data to send"
> > > > > > > >
> > > > > > > > Later from Usb control request, dst buf is copied to src buf but usb
> > > > > > > > control msg request is made before initialization.
> > > > > > > >
> > > > > > > > Thank you.
> > > > > > > >
> > > > > > > >  sound/usb/mixer_quirks.c | 10 +++++-----
> > > > > > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> > > > > > > > index 828af3095b86..06903c5de087 100644
> > > > > > > > --- a/sound/usb/mixer_quirks.c
> > > > > > > > +++ b/sound/usb/mixer_quirks.c
> > > > > > > > @@ -2449,7 +2449,7 @@ static int snd_rme_get_status1(struct snd_kcontrol *kcontrol,
> > > > > > > >  static int snd_rme_rate_get(struct snd_kcontrol *kcontrol,
> > > > > > > >  			    struct snd_ctl_elem_value *ucontrol)
> > > > > > > >  {
> > > > > > > > -	u32 status1;
> > > > > > > > +	u32 status1 = 0;
> > > > > > > >  	u32 rate = 0;
> > > > > > > >  	int idx;
> > > > > > > >  	int err;
> > > > > > > > @@ -2483,7 +2483,7 @@ static int snd_rme_rate_get(struct snd_kcontrol *kcontrol,
> > > > > > > >  static int snd_rme_sync_state_get(struct snd_kcontrol *kcontrol,
> > > > > > > >  				  struct snd_ctl_elem_value *ucontrol)
> > > > > > > >  {
> > > > > > > > -	u32 status1;
> > > > > > > > +	u32 status1 = 0;
> > > > > > > >  	int idx = SND_RME_CLOCK_NOLOCK;
> > > > > > > >  	int err;
> > > > > > > >
> > > > > > > > @@ -2513,7 +2513,7 @@ static int snd_rme_sync_state_get(struct snd_kcontrol *kcontrol,
> > > > > > > >  static int snd_rme_spdif_if_get(struct snd_kcontrol *kcontrol,
> > > > > > > >  				struct snd_ctl_elem_value *ucontrol)
> > > > > > > >  {
> > > > > > > > -	u32 status1;
> > > > > > > > +	u32 status1 = 0;
> > > > > > > >  	int err;
> > > > > > > >
> > > > > > > >  	err = snd_rme_get_status1(kcontrol, &status1);
> > > > > > > > @@ -2526,7 +2526,7 @@ static int snd_rme_spdif_if_get(struct snd_kcontrol *kcontrol,
> > > > > > > >  static int snd_rme_spdif_format_get(struct snd_kcontrol *kcontrol,
> > > > > > > >  				    struct snd_ctl_elem_value *ucontrol)
> > > > > > > >  {
> > > > > > > > -	u32 status1;
> > > > > > > > +	u32 status1 = 0;
> > > > > > > >  	int err;
> > > > > > > >
> > > > > > > >  	err = snd_rme_get_status1(kcontrol, &status1);
> > > > > > > > @@ -2539,7 +2539,7 @@ static int snd_rme_spdif_format_get(struct snd_kcontrol *kcontrol,
> > > > > > > >  static int snd_rme_sync_source_get(struct snd_kcontrol *kcontrol,
> > > > > > > >  				   struct snd_ctl_elem_value *ucontrol)
> > > > > > > >  {
> > > > > > > > -	u32 status1;
> > > > > > > > +	u32 status1 = 0;
> > > > > > > >  	int err;
> > > > > > > >
> > > > > > > >  	err = snd_rme_get_status1(kcontrol, &status1);
> > > > > > > >
> > > > > > >
> > > > > > > The warning itself is rather dubious.  But it'd certainly give a safer
> > > > > > > feeling to cover the uninitialized variables, so it would still make
> > > > > > > some sense.
> > > > > > >
> > > > > > > But, the code change can be improved.  e.g. initialize the value in
> > > > > > > the callee side, instead of callers; then it'll reduce all changes to
> > > > > > > a one-liner.
> > > > > > >
> > > > > > > At the next time, please look at the patterns you changed more closely
> > > > > > > and think again whether it's the best change or not before submission.
> > > > > > > On the second look, often you see things from a different perspective
> > > > > > > :)
> > > > > > >
> > > > > > >
> > > > > > > thanks,
> > > > > > >
> > > > > > > Takashi
> > > > > > >
> > > > > >
> > > > > > Hi Takashi,
> > > > > >
> > > > > > Thank you for the feedback and complement.
> > > > > > Yes, will check the pattern and avoid this going forward.
> > > > > > As all the functions call "snd_rme_get_status1",
> > > > > > initialized here but smatch didn't silence them.
> > > > > >
> > > > > > I prefer initializing a variable in caller side as it owns
> > > > > > and aware of initialized value sent.
> > > > > >
> > > > > > Sorry, if I had misunderstood your suggestion.
> > > > >
> > > > > Well, you seem driven too much by smatch.  Just look at your patch
> > > > > again.
> > > > >
> > > > > You're repeating the same initializations and passing to the same
> > > > > function.  And those are the only callers of snd_rme_get_status1().
> > > > > So, instead of initializing in the caller side, initialize the value
> > > > > in snd_rme_get_status1().  Then the whole your changes will be
> > > > > oneliner like below.
> > > > >
> > > > >
> > > > > Takashi
> > > > >
> > > > > --- a/sound/usb/mixer_quirks.c
> > > > > +++ b/sound/usb/mixer_quirks.c
> > > > > @@ -2548,6 +2548,7 @@ static int snd_rme_get_status1(struct snd_kcontrol *kcontrol,
> > > > >  	CLASS(snd_usb_lock, pm)(chip);
> > > > >  	if (pm.err < 0)
> > > > >  		return pm.err;
> > > > > +	*status1 = 0;
> > > > >  	return snd_rme_read_value(chip, SND_RME_GET_STATUS1, status1);
> > > > >  }
> > > > >
> > > > >
> > > >
> > > > Hi Takashi,
> > > >
> > > > Yes, tried that before, smatch didn't silence them.
> > >
> > > Then it's an obvious failure of smatch.
> > >
> > > Or you might set *status1 = 0 at the beginning of
> > > snd_rme_get_status1() although it makes little sense.
> > >
> > > > If it is worth having this change though they are not silenced,
> > > > will raise v2 otherwise will drop this patch.
> > >
> > > If the smatch still complains, it's not worth.
> > >
> > >
> > > Takashi
> > >
> >
> > Hi Takashi,
> >
> > This is the change I tried but smatch didn't silence them.
> >
> > diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> > index 828af3095b86..10354576d325 100644
> > --- a/sound/usb/mixer_quirks.c
> > +++ b/sound/usb/mixer_quirks.c
> > @@ -2443,6 +2443,7 @@ static int snd_rme_get_status1(struct snd_kcontrol
> > *kcontrol,
> >         CLASS(snd_usb_lock, pm)(chip);
> >         if (pm.err < 0)
> >                 return pm.err;
> > +       *status1 = 0;
> >         return snd_rme_read_value(chip, SND_RME_GET_STATUS1, status1);
> >  }
> >
> > Below are reported with the change, as seen they are not silenced.
> >
> > sound/usb/mixer_quirks.c:2463 snd_rme_rate_get() error: uninitialized
> > symbol 'status1'.
> > sound/usb/mixer_quirks.c:2468 snd_rme_rate_get() error: uninitialized
> > symbol 'status1'.
> > sound/usb/mixer_quirks.c:2473 snd_rme_rate_get() error: uninitialized
> > symbol 'status1'.
> > sound/usb/mixer_quirks.c:2496 snd_rme_sync_state_get() error:
> > uninitialized symbol 'status1'.
> > sound/usb/mixer_quirks.c:2502 snd_rme_sync_state_get() error:
> > uninitialized symbol 'status1'.
> > sound/usb/mixer_quirks.c:2523 snd_rme_spdif_if_get() error: uninitialized
> > symbol 'status1'.
> > sound/usb/mixer_quirks.c:2536 snd_rme_spdif_format_get() error:
> > uninitialized symbol 'status1'.
> > sound/usb/mixer_quirks.c:2549 snd_rme_sync_source_get() error:
> > uninitialized symbol 'status1'.
> > sound/usb/mixer_quirks.c:4137 snd_djm_controls_info() warn: potential
> > spectre issue 'ctl->options' [r] (local cap)
>
> As mentioned, try to put *status1=0 line before CLASS() call in the
> above.  If this still doesn't help, it's a bug of smatch, and we
> should ignore it.
>
>
> Takashi
>

Hi Takashi,

Yes, with this change it got resolved :)
Will raise v2 for the same.

I need to understand the change before CLASS() is helping to resolve this.
(Action item on me)

Thank you for the support.

HariKrishna.
