Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8116E2741BC
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 11:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764760957; cv=none; b=aSPAFBBcLJbVQ0ZP/BnNCRCJUXs1dZe1ClAeWhNF8hwBLmn+McQCnXBH1mt3Gt7p8PEfWDUAIJ/wsq/sRvml2ZMBf1fRcn5PV4gIV35bPS+X297gAnvFxgFZ+PXG8+8DAmVa0Fl5xgLJwAtyf2ueiT3Z698QCNQUq3YI/4/Ffkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764760957; c=relaxed/simple;
	bh=3KbPzZU9kKdkIJKW5DVjzBzh4Kks6CXcMYJeNAV+ww8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M7/dn1JtR6mWibE99RDYb6lZnKI9E27jLZK/i8B93F04btqTu4jdXoVQrf27LAKPuy8o74FvV2bv1wJHiB7qoN7ZrbaUpO/envHsqcNyViRFnWRAAxI2K28wOXjeRts8Gvz6XUk8EAlTqVgLl14l89RepZr9IFvg6VLM03U8MPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+Quma69; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+Quma69"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47778b23f64so38900225e9.0
        for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 03:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764760954; x=1765365754; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f9ykXwh/eR+j1ylu5f9nInXKTPglWHQkon9C8VPjRE4=;
        b=I+Quma69ngK12GP3Q25XrMtKbuHxaVBzURfYT02xiXEz8mpOCb3+mexrL5PZYH0R+p
         jP6I+yMLtnjq1lL5nciQHKKjJpNqoQpqTbibKmxmt06/2/quAzHgzCD98sdTF3WIR5A5
         /2geq2cER1gFN0rxG5j6iqpRpWpkw9HCI72IVzlfPW2lc7JN+cleldYKFSkdmsOtetw7
         qJdzSR2acIX1udC9WGla4CDpFEb252hbc31qEkiTBqJxTwPO9suB2UTTRjFVNYiXKqUS
         EGhlp83Ecxj4BlZiNndmBZJOIs1qyVydGQyHKarXchEmCBIarBZFtgZaTSx7Sn0oVeEY
         3xHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764760954; x=1765365754;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9ykXwh/eR+j1ylu5f9nInXKTPglWHQkon9C8VPjRE4=;
        b=kGLGHnFkWvH6mAVlIqu7g18g3H7XyIzJes87lXdG4PEaKcX8/n3ak3mzl3hP2kWgIS
         v0ZqJ933/ApzNB+Rw2tExAFlHK81QFldAa4Q62lVk4k5uO8u2J2JvZqJNbE8MbTDjGVt
         2xqVwLxETlQk4Y0IV8JZfvnaPWGByicwyd8WonMHaS+z4hAQhJg60eMalqsRWUzF6aeQ
         16KWKp7ct5+WitxRkNol106fcbGDck/lIJFPV3fEKz9+SPEkkTK/uFT3/VVQU82H4C4w
         +nPkKkSl576AbZAPzX+WbzZRrvT5VLDYzmQUPlSBvWLiPEBgvozG/RuUXkWokPJPOr+J
         +sag==
X-Forwarded-Encrypted: i=1; AJvYcCWqYemsRdPSu6WUo3JL2iceJEcXhgwG2qBXiZPJtrL8Q+ib2Yzw83CzZqbQSJZjvECCUZRuT96bhil0nA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yywnb8PPMClKsZW/rWUVP7MH3c/MNN1kOgutofykq/Z5FwBRZkA
	In6oZcaMWtoGBMLtxVrEvg44puuK1hOzC6oWy5e5I1M9xXAsJ86GPw1N
X-Gm-Gg: ASbGncs4hZ1F3g/udN97nDo0h+21Iy0ef7pTCqdqqksq0mr6pjvxapta0oxQjI1bngY
	wvq4vfz7WTZIxO/pSpuhCLyjqtSTmJAo2hTvio/Hh2FcZLi9NKdwW3fa9LBIkDOVsyA7C9OtBZF
	e6wlcAo1YeTSVTBM6GVZVYpr10yPsupaKDivyA2OyJKyfPkP4K/Ocu7S/I0o4h/lnX/Qf3dVXgt
	cOrEloSRUmGor/GYDIWaEptf+L0VWdA7zQfIYUU806Mfw3cPUuZ5CVeyCnbQ47wgRJ26M9ocpte
	vA2X4AUaYrIafIYalno3UPgLLqtBcWKOsXjZqf+C79Bs6Yjc9y35MqK5YzhoeOrY7MW18PfkAAD
	7jPw50Dcvfq2l1hNl6OqAT+l+pKf1dot+MpN4ZwqQ1NeoVPAx9v86JilD883zNvR8FA9FR9dwws
	HhWmbNDWqtnwffyeLbz4OT++oucg==
X-Google-Smtp-Source: AGHT+IFlUBsk0+GeY8YttkB1/u0DJrauUm6XdCeXTz99Tqewh8JI47yECryASc2nOwbQ687X51ij+Q==
X-Received: by 2002:a05:600c:1f1a:b0:475:da13:2568 with SMTP id 5b1f17b1804b1-4792af35015mr16660055e9.25.1764760953407;
        Wed, 03 Dec 2025 03:22:33 -0800 (PST)
Received: from [172.23.94.183] ([147.161.143.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b02ba67sm16895195e9.2.2025.12.03.03.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 03:22:32 -0800 (PST)
From: HariKrishna Sagala <hariconscious@gmail.com>
X-Google-Original-From: HariKrishna Sagala <hkrishna@gmail.com>
Date: Wed, 3 Dec 2025 16:52:27 +0530 (IST)
To: Takashi Iwai <tiwai@suse.de>, HariKrishna Sagala <hariconscious@gmail.com>
cc: perex@perex.cz, tiwai@suse.com, cristian.ciocaltea@collabora.com, 
    cryolitia@uniontech.com, franta-linux@frantovo.cz, khalid@kernel.org, 
    shuah@kernel.org, david.hunter.linux@gmail.com, 
    linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Initialize status1 to fix uninitialized
 symbol errors
In-Reply-To: <87wm33stye.wl-tiwai@suse.de>
Message-ID: <54d0ac3b-6a10-7319-338c-80f52e62af58@gmail.com>
References: <20251203083319.58555-2-hariconscious@gmail.com> <877bv4t03x.wl-tiwai@suse.de> <c6694145-253b-0ee3-c0f0-4b492994bfe7@gmail.com> <87wm33stye.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Dec 2025, Takashi Iwai wrote:

> On Wed, 03 Dec 2025 12:01:35 +0100,
> HariKrishna Sagala wrote:
> >
> > On Wed, 3 Dec 2025, Takashi Iwai wrote:
> >
> > > On Wed, 03 Dec 2025 09:33:20 +0100,
> > > hariconscious@gmail.com wrote:
> > > >
> > > > From: HariKrishna Sagala <hariconscious@gmail.com>
> > > >
> > > > Initialize 'status1' with a default value to resolve the static analysis
> > > > smatch reported error "uninitialized symbol 'status1'".
> > > > The 'status1' variable is used to create a buff using "kmemdup".
> > > > So, ensure to initialize the value before it is read.
> > > >
> > > > Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
> > > > ---
> > > > This patch fixes the below smatch reported errors.
> > > > sound/usb/mixer_quirks.c:2462 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> > > > sound/usb/mixer_quirks.c:2467 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> > > > sound/usb/mixer_quirks.c:2472 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> > > > sound/usb/mixer_quirks.c:2495 snd_rme_sync_state_get() error: uninitialized symbol 'status1'.
> > > > sound/usb/mixer_quirks.c:2501 snd_rme_sync_state_get() error: uninitialized symbol 'status1'.
> > > > sound/usb/mixer_quirks.c:2522 snd_rme_spdif_if_get() error: uninitialized symbol 'status1'.
> > > > sound/usb/mixer_quirks.c:2535 snd_rme_spdif_format_get() error: uninitialized symbol 'status1'.
> > > > sound/usb/mixer_quirks.c:2548 snd_rme_sync_source_get() error: uninitialized symbol 'status1'.
> > > >
> > > > The below is the flow of 'status1' it is used before initialization.
> > > >
> > > > snd_rme_rate_get -> status1 is uninitialized and passed
> > > > 	snd_rme_get_status1 -> passed as is
> > > > 		snd_rme_read_value -> passed as is
> > > > 			snd_usb_ctl_msg -> created buf from status1 using kmemdup
> > > > 				usb_control_msg -> sent buf for reading/writing
> > > >
> > > > Description of "usb_control_msg", states as
> > > > " * @data: pointer to the data to send"
> > > >
> > > > Later from Usb control request, dst buf is copied to src buf but usb
> > > > control msg request is made before initialization.
> > > >
> > > > Thank you.
> > > >
> > > >  sound/usb/mixer_quirks.c | 10 +++++-----
> > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> > > > index 828af3095b86..06903c5de087 100644
> > > > --- a/sound/usb/mixer_quirks.c
> > > > +++ b/sound/usb/mixer_quirks.c
> > > > @@ -2449,7 +2449,7 @@ static int snd_rme_get_status1(struct snd_kcontrol *kcontrol,
> > > >  static int snd_rme_rate_get(struct snd_kcontrol *kcontrol,
> > > >  			    struct snd_ctl_elem_value *ucontrol)
> > > >  {
> > > > -	u32 status1;
> > > > +	u32 status1 = 0;
> > > >  	u32 rate = 0;
> > > >  	int idx;
> > > >  	int err;
> > > > @@ -2483,7 +2483,7 @@ static int snd_rme_rate_get(struct snd_kcontrol *kcontrol,
> > > >  static int snd_rme_sync_state_get(struct snd_kcontrol *kcontrol,
> > > >  				  struct snd_ctl_elem_value *ucontrol)
> > > >  {
> > > > -	u32 status1;
> > > > +	u32 status1 = 0;
> > > >  	int idx = SND_RME_CLOCK_NOLOCK;
> > > >  	int err;
> > > >
> > > > @@ -2513,7 +2513,7 @@ static int snd_rme_sync_state_get(struct snd_kcontrol *kcontrol,
> > > >  static int snd_rme_spdif_if_get(struct snd_kcontrol *kcontrol,
> > > >  				struct snd_ctl_elem_value *ucontrol)
> > > >  {
> > > > -	u32 status1;
> > > > +	u32 status1 = 0;
> > > >  	int err;
> > > >
> > > >  	err = snd_rme_get_status1(kcontrol, &status1);
> > > > @@ -2526,7 +2526,7 @@ static int snd_rme_spdif_if_get(struct snd_kcontrol *kcontrol,
> > > >  static int snd_rme_spdif_format_get(struct snd_kcontrol *kcontrol,
> > > >  				    struct snd_ctl_elem_value *ucontrol)
> > > >  {
> > > > -	u32 status1;
> > > > +	u32 status1 = 0;
> > > >  	int err;
> > > >
> > > >  	err = snd_rme_get_status1(kcontrol, &status1);
> > > > @@ -2539,7 +2539,7 @@ static int snd_rme_spdif_format_get(struct snd_kcontrol *kcontrol,
> > > >  static int snd_rme_sync_source_get(struct snd_kcontrol *kcontrol,
> > > >  				   struct snd_ctl_elem_value *ucontrol)
> > > >  {
> > > > -	u32 status1;
> > > > +	u32 status1 = 0;
> > > >  	int err;
> > > >
> > > >  	err = snd_rme_get_status1(kcontrol, &status1);
> > > >
> > >
> > > The warning itself is rather dubious.  But it'd certainly give a safer
> > > feeling to cover the uninitialized variables, so it would still make
> > > some sense.
> > >
> > > But, the code change can be improved.  e.g. initialize the value in
> > > the callee side, instead of callers; then it'll reduce all changes to
> > > a one-liner.
> > >
> > > At the next time, please look at the patterns you changed more closely
> > > and think again whether it's the best change or not before submission.
> > > On the second look, often you see things from a different perspective
> > > :)
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> >
> > Hi Takashi,
> >
> > Thank you for the feedback and complement.
> > Yes, will check the pattern and avoid this going forward.
> > As all the functions call "snd_rme_get_status1",
> > initialized here but smatch didn't silence them.
> >
> > I prefer initializing a variable in caller side as it owns
> > and aware of initialized value sent.
> >
> > Sorry, if I had misunderstood your suggestion.
>
> Well, you seem driven too much by smatch.  Just look at your patch
> again.
>
> You're repeating the same initializations and passing to the same
> function.  And those are the only callers of snd_rme_get_status1().
> So, instead of initializing in the caller side, initialize the value
> in snd_rme_get_status1().  Then the whole your changes will be
> oneliner like below.
>
>
> Takashi
>
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c
> @@ -2548,6 +2548,7 @@ static int snd_rme_get_status1(struct snd_kcontrol *kcontrol,
>  	CLASS(snd_usb_lock, pm)(chip);
>  	if (pm.err < 0)
>  		return pm.err;
> +	*status1 = 0;
>  	return snd_rme_read_value(chip, SND_RME_GET_STATUS1, status1);
>  }
>
>

Hi Takashi,

Yes, tried that before, smatch didn't silence them.
If it is worth having this change though they are not silenced,
will raise v2 otherwise will drop this patch.

Please let me know.

Thank you,
HariKrishna.
