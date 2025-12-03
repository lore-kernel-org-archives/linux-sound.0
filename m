Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54E2284880
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 12:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764763317; cv=none; b=M5oZij5MabME+vn+wVPJEK5CP52hUDVIUeKQu5eytxKCoM84lKH4+wgGdrkjxeKvwaCSimKyFuLdK1YjxdITFAOK9V60Jc5YKxMqWjWpxAtSFzCboGb1+PZbYliy54a5KHdX7+jboWqeFnx/jLCugmbRxkd7p4gUWlzGZXhF8a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764763317; c=relaxed/simple;
	bh=uyn/bQkYSKBWP5ZCKaIsnS2oMeVZzea9okRoECVkJnY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=owRqTrQC7/N9zRAe45DioWDN1ipZkkPs3JJziVZIljM3UAscReJ191NYuPRDOLaMuEYKpnfBZ5TlGHeqPiY+Z4GaVUFuXNiRZOfhRrXthJbLSsPXRuphKStCPHSzAKaGtAodS2Zh8YfSKMp5zQg/tc6CArSbD/f4Uhl55XFPv3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMEyW1xt; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMEyW1xt"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42e2e77f519so2981577f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 04:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764763314; x=1765368114; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=15AFpwidwNDi0yT7usARAUjJ/bI+Y3rRDsbOfapCyvY=;
        b=KMEyW1xtvuJiliQAlYBgEM8G0z/xTB+f0FDfkQ/GzVMpN81IwmMp3OtfZCHlWIRE2K
         k/EKIzne32fzZLhmCyGmoCl5pqxnrMZ2PNuhz3pwGysPfiliCRZTrG82keQT9EAtKC9Z
         bgC99LfzhEDpdNBzNWhfo14xLpTAmzQXuMsPJh8BJHgABWFBD53hP8xKzYFUGfU2RQ15
         75bNCLDq72G7nNIf5ePXqRsXbWhGm09nQtZ1sENPWlcMSUg0i6G7qMsWMSnejfjs1ioV
         18AAf66At8psIb3g1mA4ACjful+Z9MLaLx/WIHjyn9f0Rss7XoVJ1WtfwZGh5ddz8Rcj
         dVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764763314; x=1765368114;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15AFpwidwNDi0yT7usARAUjJ/bI+Y3rRDsbOfapCyvY=;
        b=h1KjS0Fr3Kbzd1hpJVJLBD+ub96ErfplP23zbrYfUpaS1ViDQI8PsJGlhJ7l64lPMW
         eBc3pq+VyZcmur7RSFalxrHIiqyXlmgmtZO234s3nd6BwUJIjWQIIWtpw+deNQ3Sh8px
         tOFZSXmR7x32r+ICdgyyX8Ea4iG/pjD8MzkeCo1/BdNhcFZEHKneob+NwHDINHadLaoq
         GWuX71nAtovxwNRq8Y3M+QTzxXFU3/hRjYceohQ1ZG+d3fPVQBQ8uF6PMweWUIV6sFi7
         +T7G6W6H6+r8Nonnj6NrD8Hxqes1y+FNNqvqfahO2qERQV1tVKosYk8l2Sxwho66EGTx
         Xa6g==
X-Forwarded-Encrypted: i=1; AJvYcCXSGFQdv6JVi/j6N2w6TPr0+9T3czNnu3BHKPrU8AB67HZkfAS8PhmMXfhvhhYwNai4Oh6aNRdcVYrYUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxJnDAnHAcGI4jn48FGP/CdPHhSki/rJt8cnLpNweieZ4T1jNu
	Cm3UnvmxNhTN8AWqu+A6G0uGp0hyUjl8BjyrqAUHOSnTMGhO/V+WKayo
X-Gm-Gg: ASbGncv4fs4PDHEEvTXxdg3uKOsmkJiVG7fTI5V8Kqla14lKgKnpeSpbbf5spY2WZ7m
	PXOellxJBzIyhiOEWz4kUxk3Gtsdb6lAicO7q5Ui1FnN2JaNFyGKw6UVplo/uOqZHTR5TJLBOCE
	DcMuVqSRdyYukkLLKVnLJ/o0uyXUH3yGZlcb/h5Znj3d5xoi/b8rKjj4ttARFA0Jt08esCVDFdR
	fMBLWtlj5y7jmQwcIRAzSSEdI2Hh+YRAFBnG+hkyE42ToMSmq/EUV9vGzztiMLMNv6ebFzSkVLt
	012jjoNpbmsl8TI7OYvNk804mqBZNxzrmvmfm9TEK6Fo8T7H0EG7N3pOjJwIb2WzqXY1MCI6bsR
	s/CWN/mq3S1omR17CzuDEgmYiQcS2jaj5jUkw1U8hwIuYXouiwRVAGLmXft0x9YBZI41Cxec+FZ
	8Reha9RybtLhrkPfU=
X-Google-Smtp-Source: AGHT+IEo5sy4FFnxDehg3WkA+SBBLfKq5BR550D46Gqkugu7MJ4rJPgUMuP+eDQDbKl1Fq5hbF1OmA==
X-Received: by 2002:a05:6000:2893:b0:42b:3455:e4a4 with SMTP id ffacd0b85a97d-42f731bc10amr2040037f8f.31.1764763314042;
        Wed, 03 Dec 2025 04:01:54 -0800 (PST)
Received: from [172.23.94.183] ([147.161.143.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1cac995esm37629900f8f.43.2025.12.03.04.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 04:01:53 -0800 (PST)
From: HariKrishna Sagala <hariconscious@gmail.com>
X-Google-Original-From: HariKrishna Sagala <hkrishna@gmail.com>
Date: Wed, 3 Dec 2025 17:31:48 +0530 (IST)
To: Takashi Iwai <tiwai@suse.de>, HariKrishna Sagala <hariconscious@gmail.com>
cc: perex@perex.cz, tiwai@suse.com, cristian.ciocaltea@collabora.com, 
    cryolitia@uniontech.com, franta-linux@frantovo.cz, khalid@kernel.org, 
    shuah@kernel.org, david.hunter.linux@gmail.com, 
    linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Initialize status1 to fix uninitialized
 symbol errors
In-Reply-To: <87v7inss1z.wl-tiwai@suse.de>
Message-ID: <b44d6cf3-a96e-c0d4-99e3-c6af916a2e21@gmail.com>
References: <20251203083319.58555-2-hariconscious@gmail.com> <877bv4t03x.wl-tiwai@suse.de> <c6694145-253b-0ee3-c0f0-4b492994bfe7@gmail.com> <87wm33stye.wl-tiwai@suse.de> <54d0ac3b-6a10-7319-338c-80f52e62af58@gmail.com> <87v7inss1z.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Dec 2025, Takashi Iwai wrote:

> On Wed, 03 Dec 2025 12:22:27 +0100,
> HariKrishna Sagala wrote:
> >
> > On Wed, 3 Dec 2025, Takashi Iwai wrote:
> >
> > > On Wed, 03 Dec 2025 12:01:35 +0100,
> > > HariKrishna Sagala wrote:
> > > >
> > > > On Wed, 3 Dec 2025, Takashi Iwai wrote:
> > > >
> > > > > On Wed, 03 Dec 2025 09:33:20 +0100,
> > > > > hariconscious@gmail.com wrote:
> > > > > >
> > > > > > From: HariKrishna Sagala <hariconscious@gmail.com>
> > > > > >
> > > > > > Initialize 'status1' with a default value to resolve the static analysis
> > > > > > smatch reported error "uninitialized symbol 'status1'".
> > > > > > The 'status1' variable is used to create a buff using "kmemdup".
> > > > > > So, ensure to initialize the value before it is read.
> > > > > >
> > > > > > Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
> > > > > > ---
> > > > > > This patch fixes the below smatch reported errors.
> > > > > > sound/usb/mixer_quirks.c:2462 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> > > > > > sound/usb/mixer_quirks.c:2467 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> > > > > > sound/usb/mixer_quirks.c:2472 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> > > > > > sound/usb/mixer_quirks.c:2495 snd_rme_sync_state_get() error: uninitialized symbol 'status1'.
> > > > > > sound/usb/mixer_quirks.c:2501 snd_rme_sync_state_get() error: uninitialized symbol 'status1'.
> > > > > > sound/usb/mixer_quirks.c:2522 snd_rme_spdif_if_get() error: uninitialized symbol 'status1'.
> > > > > > sound/usb/mixer_quirks.c:2535 snd_rme_spdif_format_get() error: uninitialized symbol 'status1'.
> > > > > > sound/usb/mixer_quirks.c:2548 snd_rme_sync_source_get() error: uninitialized symbol 'status1'.
> > > > > >
> > > > > > The below is the flow of 'status1' it is used before initialization.
> > > > > >
> > > > > > snd_rme_rate_get -> status1 is uninitialized and passed
> > > > > > 	snd_rme_get_status1 -> passed as is
> > > > > > 		snd_rme_read_value -> passed as is
> > > > > > 			snd_usb_ctl_msg -> created buf from status1 using kmemdup
> > > > > > 				usb_control_msg -> sent buf for reading/writing
> > > > > >
> > > > > > Description of "usb_control_msg", states as
> > > > > > " * @data: pointer to the data to send"
> > > > > >
> > > > > > Later from Usb control request, dst buf is copied to src buf but usb
> > > > > > control msg request is made before initialization.
> > > > > >
> > > > > > Thank you.
> > > > > >
> > > > > >  sound/usb/mixer_quirks.c | 10 +++++-----
> > > > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> > > > > > index 828af3095b86..06903c5de087 100644
> > > > > > --- a/sound/usb/mixer_quirks.c
> > > > > > +++ b/sound/usb/mixer_quirks.c
> > > > > > @@ -2449,7 +2449,7 @@ static int snd_rme_get_status1(struct snd_kcontrol *kcontrol,
> > > > > >  static int snd_rme_rate_get(struct snd_kcontrol *kcontrol,
> > > > > >  			    struct snd_ctl_elem_value *ucontrol)
> > > > > >  {
> > > > > > -	u32 status1;
> > > > > > +	u32 status1 = 0;
> > > > > >  	u32 rate = 0;
> > > > > >  	int idx;
> > > > > >  	int err;
> > > > > > @@ -2483,7 +2483,7 @@ static int snd_rme_rate_get(struct snd_kcontrol *kcontrol,
> > > > > >  static int snd_rme_sync_state_get(struct snd_kcontrol *kcontrol,
> > > > > >  				  struct snd_ctl_elem_value *ucontrol)
> > > > > >  {
> > > > > > -	u32 status1;
> > > > > > +	u32 status1 = 0;
> > > > > >  	int idx = SND_RME_CLOCK_NOLOCK;
> > > > > >  	int err;
> > > > > >
> > > > > > @@ -2513,7 +2513,7 @@ static int snd_rme_sync_state_get(struct snd_kcontrol *kcontrol,
> > > > > >  static int snd_rme_spdif_if_get(struct snd_kcontrol *kcontrol,
> > > > > >  				struct snd_ctl_elem_value *ucontrol)
> > > > > >  {
> > > > > > -	u32 status1;
> > > > > > +	u32 status1 = 0;
> > > > > >  	int err;
> > > > > >
> > > > > >  	err = snd_rme_get_status1(kcontrol, &status1);
> > > > > > @@ -2526,7 +2526,7 @@ static int snd_rme_spdif_if_get(struct snd_kcontrol *kcontrol,
> > > > > >  static int snd_rme_spdif_format_get(struct snd_kcontrol *kcontrol,
> > > > > >  				    struct snd_ctl_elem_value *ucontrol)
> > > > > >  {
> > > > > > -	u32 status1;
> > > > > > +	u32 status1 = 0;
> > > > > >  	int err;
> > > > > >
> > > > > >  	err = snd_rme_get_status1(kcontrol, &status1);
> > > > > > @@ -2539,7 +2539,7 @@ static int snd_rme_spdif_format_get(struct snd_kcontrol *kcontrol,
> > > > > >  static int snd_rme_sync_source_get(struct snd_kcontrol *kcontrol,
> > > > > >  				   struct snd_ctl_elem_value *ucontrol)
> > > > > >  {
> > > > > > -	u32 status1;
> > > > > > +	u32 status1 = 0;
> > > > > >  	int err;
> > > > > >
> > > > > >  	err = snd_rme_get_status1(kcontrol, &status1);
> > > > > >
> > > > >
> > > > > The warning itself is rather dubious.  But it'd certainly give a safer
> > > > > feeling to cover the uninitialized variables, so it would still make
> > > > > some sense.
> > > > >
> > > > > But, the code change can be improved.  e.g. initialize the value in
> > > > > the callee side, instead of callers; then it'll reduce all changes to
> > > > > a one-liner.
> > > > >
> > > > > At the next time, please look at the patterns you changed more closely
> > > > > and think again whether it's the best change or not before submission.
> > > > > On the second look, often you see things from a different perspective
> > > > > :)
> > > > >
> > > > >
> > > > > thanks,
> > > > >
> > > > > Takashi
> > > > >
> > > >
> > > > Hi Takashi,
> > > >
> > > > Thank you for the feedback and complement.
> > > > Yes, will check the pattern and avoid this going forward.
> > > > As all the functions call "snd_rme_get_status1",
> > > > initialized here but smatch didn't silence them.
> > > >
> > > > I prefer initializing a variable in caller side as it owns
> > > > and aware of initialized value sent.
> > > >
> > > > Sorry, if I had misunderstood your suggestion.
> > >
> > > Well, you seem driven too much by smatch.  Just look at your patch
> > > again.
> > >
> > > You're repeating the same initializations and passing to the same
> > > function.  And those are the only callers of snd_rme_get_status1().
> > > So, instead of initializing in the caller side, initialize the value
> > > in snd_rme_get_status1().  Then the whole your changes will be
> > > oneliner like below.
> > >
> > >
> > > Takashi
> > >
> > > --- a/sound/usb/mixer_quirks.c
> > > +++ b/sound/usb/mixer_quirks.c
> > > @@ -2548,6 +2548,7 @@ static int snd_rme_get_status1(struct snd_kcontrol *kcontrol,
> > >  	CLASS(snd_usb_lock, pm)(chip);
> > >  	if (pm.err < 0)
> > >  		return pm.err;
> > > +	*status1 = 0;
> > >  	return snd_rme_read_value(chip, SND_RME_GET_STATUS1, status1);
> > >  }
> > >
> > >
> >
> > Hi Takashi,
> >
> > Yes, tried that before, smatch didn't silence them.
>
> Then it's an obvious failure of smatch.
>
> Or you might set *status1 = 0 at the beginning of
> snd_rme_get_status1() although it makes little sense.
>
> > If it is worth having this change though they are not silenced,
> > will raise v2 otherwise will drop this patch.
>
> If the smatch still complains, it's not worth.
>
>
> Takashi
>

Hi Takashi,

This is the change I tried but smatch didn't silence them.

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 828af3095b86..10354576d325 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2443,6 +2443,7 @@ static int snd_rme_get_status1(struct snd_kcontrol
*kcontrol,
        CLASS(snd_usb_lock, pm)(chip);
        if (pm.err < 0)
                return pm.err;
+       *status1 = 0;
        return snd_rme_read_value(chip, SND_RME_GET_STATUS1, status1);
 }

Below are reported with the change, as seen they are not silenced.

sound/usb/mixer_quirks.c:2463 snd_rme_rate_get() error: uninitialized
symbol 'status1'.
sound/usb/mixer_quirks.c:2468 snd_rme_rate_get() error: uninitialized
symbol 'status1'.
sound/usb/mixer_quirks.c:2473 snd_rme_rate_get() error: uninitialized
symbol 'status1'.
sound/usb/mixer_quirks.c:2496 snd_rme_sync_state_get() error:
uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2502 snd_rme_sync_state_get() error:
uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2523 snd_rme_spdif_if_get() error: uninitialized
symbol 'status1'.
sound/usb/mixer_quirks.c:2536 snd_rme_spdif_format_get() error:
uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2549 snd_rme_sync_source_get() error:
uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:4137 snd_djm_controls_info() warn: potential
spectre issue 'ctl->options' [r] (local cap)

Sorry not sure about the reason.
As they are not removed, dropping this patch.
Thank you for the support.
