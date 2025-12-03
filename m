Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5E92F2606
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764759707; cv=none; b=r0XUazn/IvGFXXWJzCwn7//LEGy1erpCND7ufAZ20TsVbpqKzMqp/cWj0QzlJKSo63SwI9pVk/OCHeTYDRY7JNl1GeGfh9uOxsUiBvbQ1Z0yuua+GU1IPSE5uEabZcznlX0uZolN7I1+JCrWrq2hjVE2G9fkhZ+L4yiGYomxfu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764759707; c=relaxed/simple;
	bh=TFslczi42wrSYmyM02aO6atllZslPetHT/2A48UtXJY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AUH/9QnaifUNstzJs/7DOhJ/MOhxa67MqYjii+l/nYrMW2aGCP5B6Skju0lcaOXnkk1I2XFGjMmEEtOjX8sKEsdQRkekadyACZI2Vk9TmqMLDJKIitiM7ojOM0lvx6f0ozUurihmN/t7kGLEwY3mpCKNuZDOnvGFyDPLYOCdK8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zy6qQ0k8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zy6qQ0k8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso60912205e9.3
        for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 03:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764759703; x=1765364503; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SFzt6QggPpTCMz+1TuyXui144AQc3Ybgeav2uv35GIQ=;
        b=Zy6qQ0k8pnCZvt2QmgsOPbAGd6F+ZN0A2FBnxbPIohzFAN9SDrDKE2ONxtWTA/IE8w
         mtqVcWxNYiuSajPLbAQ1n28E4QFPz4N7ldKOUY+AwrTxAXgOezfY0j2uraPxGRa39BIX
         l3E186gqNQI5VKLh4lG2k/trtw+3iriEEGyvT6qiOOX4SepdxDwIFdLYV1IrbwQdhRbl
         QD1bHeeRCcYU1Dw+Ni+Ng/dr6K+RY7cFbHILH6NWvLiqXh8LrqTaNAh4lXtB4bVa4XPT
         oR95uVpE9CUL4/fcJBM99aJP76h5atD8Tx9nbfvLzMbB7w4wOOAEKTz+VkZCSCHFjsK+
         gBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764759703; x=1765364503;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFzt6QggPpTCMz+1TuyXui144AQc3Ybgeav2uv35GIQ=;
        b=IwG5ZHhmQlmQ3dnGAm12mAYk9h88wassXvHwCK3SinMWPDCUAifofwaKnshM/1J6z+
         nyb/wn5zUg+zt6x58dSyq9JRjsW/OeQKyGdurjM6drq9n3ULJhb6+culIB46oH7bt5YW
         r7rXfiIizVuPZAaMp18b8Ysvtvu4Eabwyq2BjENwIP4++xkcLPmKG+TIm+9KeIxqD4Rk
         zy17BaKLWPUKu/VcvUW/MmnsYhEC0Y6Ea6f7wh8jOXG3wO3AcEQ9f4ArIEBoJJsUAKfC
         nAGgqksLgFStIkyzdknxzBeW0rQtOUyg8WjrIqXbJ7X2m8gr3nw9Sh/NujPmm/qciacc
         vCDg==
X-Forwarded-Encrypted: i=1; AJvYcCUBXKrcFIqZBN+qdIhf1yPNHJ0CKpNKdDBM7EJMnfYoMrzwkuStnnGPGnOH8nhtefMUCR2GqmBB95rPWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgC/9kKaKCkpdAI4mfEpYogoMoLBFNGYV6mgYLydfc6gcIfldF
	3FmeL1FoUEjomBfSXtWL+lRAT/HS8T724Oh9BFQDzKCcsYt0nvpK85Hb
X-Gm-Gg: ASbGncs8qBwmEw8ro0QaapP0xzCrFaDuTwbe61lna0lTslLZmhL7pBVaSyWTV2hKXZm
	FlBFghUxTJFPcGBA4x0sFWSLio7BtVtjG3QwdvGSwYT1cUlXp/0OhFCw3pdWuVE33C6JBqTyDXX
	uXr0x8LAvhN0oA0A3Cd7TF3rdvJxxMeA0szyXsKeOxUday227qGeP6wqOgKGRQAPVEgJTI0lOM4
	pV2ZRW79ceZfLiuJLqhn57JKDzqbJO+pNO/vhGT+U/Dsu6GIzrC6ND/cOrYZW5BPeeL2za4Lucl
	8tYIS+Z5wTKRu5AlOdZ33glmASYxXovcTMKVszGsE6qV86lH/BpE1xktozGIR7zc0lcXTv0HJw1
	4U4Wq0H6G9pV58/5xEPVGri9zB3AUh/J8kx2+zHJ3RR7qBTkjj+pcaK1HyU6Nela1kf/Jux8MY1
	tFSzwNmplA8AfpHeA=
X-Google-Smtp-Source: AGHT+IHjwf8HswGG/TpPsT6ndfuHYQc1UKDIDNcAt64B+fymzTtGr2/t4hT8V9a3x+3g07Zz6s+LXg==
X-Received: by 2002:a05:600c:314b:b0:471:1717:411 with SMTP id 5b1f17b1804b1-4792af3d3c2mr19391035e9.24.1764759703078;
        Wed, 03 Dec 2025 03:01:43 -0800 (PST)
Received: from [172.23.94.183] ([147.161.143.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a7b03cfsm43633845e9.14.2025.12.03.03.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 03:01:42 -0800 (PST)
From: HariKrishna Sagala <hariconscious@gmail.com>
X-Google-Original-From: HariKrishna Sagala <hkrishna@gmail.com>
Date: Wed, 3 Dec 2025 16:31:35 +0530 (IST)
To: Takashi Iwai <tiwai@suse.de>, hariconscious@gmail.com
cc: perex@perex.cz, tiwai@suse.com, cristian.ciocaltea@collabora.com, 
    cryolitia@uniontech.com, franta-linux@frantovo.cz, khalid@kernel.org, 
    shuah@kernel.org, david.hunter.linux@gmail.com, 
    linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Initialize status1 to fix uninitialized
 symbol errors
In-Reply-To: <877bv4t03x.wl-tiwai@suse.de>
Message-ID: <c6694145-253b-0ee3-c0f0-4b492994bfe7@gmail.com>
References: <20251203083319.58555-2-hariconscious@gmail.com> <877bv4t03x.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Dec 2025, Takashi Iwai wrote:

> On Wed, 03 Dec 2025 09:33:20 +0100,
> hariconscious@gmail.com wrote:
> >
> > From: HariKrishna Sagala <hariconscious@gmail.com>
> >
> > Initialize 'status1' with a default value to resolve the static analysis
> > smatch reported error "uninitialized symbol 'status1'".
> > The 'status1' variable is used to create a buff using "kmemdup".
> > So, ensure to initialize the value before it is read.
> >
> > Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
> > ---
> > This patch fixes the below smatch reported errors.
> > sound/usb/mixer_quirks.c:2462 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> > sound/usb/mixer_quirks.c:2467 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> > sound/usb/mixer_quirks.c:2472 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> > sound/usb/mixer_quirks.c:2495 snd_rme_sync_state_get() error: uninitialized symbol 'status1'.
> > sound/usb/mixer_quirks.c:2501 snd_rme_sync_state_get() error: uninitialized symbol 'status1'.
> > sound/usb/mixer_quirks.c:2522 snd_rme_spdif_if_get() error: uninitialized symbol 'status1'.
> > sound/usb/mixer_quirks.c:2535 snd_rme_spdif_format_get() error: uninitialized symbol 'status1'.
> > sound/usb/mixer_quirks.c:2548 snd_rme_sync_source_get() error: uninitialized symbol 'status1'.
> >
> > The below is the flow of 'status1' it is used before initialization.
> >
> > snd_rme_rate_get -> status1 is uninitialized and passed
> > 	snd_rme_get_status1 -> passed as is
> > 		snd_rme_read_value -> passed as is
> > 			snd_usb_ctl_msg -> created buf from status1 using kmemdup
> > 				usb_control_msg -> sent buf for reading/writing
> >
> > Description of "usb_control_msg", states as
> > " * @data: pointer to the data to send"
> >
> > Later from Usb control request, dst buf is copied to src buf but usb
> > control msg request is made before initialization.
> >
> > Thank you.
> >
> >  sound/usb/mixer_quirks.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> > index 828af3095b86..06903c5de087 100644
> > --- a/sound/usb/mixer_quirks.c
> > +++ b/sound/usb/mixer_quirks.c
> > @@ -2449,7 +2449,7 @@ static int snd_rme_get_status1(struct snd_kcontrol *kcontrol,
> >  static int snd_rme_rate_get(struct snd_kcontrol *kcontrol,
> >  			    struct snd_ctl_elem_value *ucontrol)
> >  {
> > -	u32 status1;
> > +	u32 status1 = 0;
> >  	u32 rate = 0;
> >  	int idx;
> >  	int err;
> > @@ -2483,7 +2483,7 @@ static int snd_rme_rate_get(struct snd_kcontrol *kcontrol,
> >  static int snd_rme_sync_state_get(struct snd_kcontrol *kcontrol,
> >  				  struct snd_ctl_elem_value *ucontrol)
> >  {
> > -	u32 status1;
> > +	u32 status1 = 0;
> >  	int idx = SND_RME_CLOCK_NOLOCK;
> >  	int err;
> >
> > @@ -2513,7 +2513,7 @@ static int snd_rme_sync_state_get(struct snd_kcontrol *kcontrol,
> >  static int snd_rme_spdif_if_get(struct snd_kcontrol *kcontrol,
> >  				struct snd_ctl_elem_value *ucontrol)
> >  {
> > -	u32 status1;
> > +	u32 status1 = 0;
> >  	int err;
> >
> >  	err = snd_rme_get_status1(kcontrol, &status1);
> > @@ -2526,7 +2526,7 @@ static int snd_rme_spdif_if_get(struct snd_kcontrol *kcontrol,
> >  static int snd_rme_spdif_format_get(struct snd_kcontrol *kcontrol,
> >  				    struct snd_ctl_elem_value *ucontrol)
> >  {
> > -	u32 status1;
> > +	u32 status1 = 0;
> >  	int err;
> >
> >  	err = snd_rme_get_status1(kcontrol, &status1);
> > @@ -2539,7 +2539,7 @@ static int snd_rme_spdif_format_get(struct snd_kcontrol *kcontrol,
> >  static int snd_rme_sync_source_get(struct snd_kcontrol *kcontrol,
> >  				   struct snd_ctl_elem_value *ucontrol)
> >  {
> > -	u32 status1;
> > +	u32 status1 = 0;
> >  	int err;
> >
> >  	err = snd_rme_get_status1(kcontrol, &status1);
> >
>
> The warning itself is rather dubious.  But it'd certainly give a safer
> feeling to cover the uninitialized variables, so it would still make
> some sense.
>
> But, the code change can be improved.  e.g. initialize the value in
> the callee side, instead of callers; then it'll reduce all changes to
> a one-liner.
>
> At the next time, please look at the patterns you changed more closely
> and think again whether it's the best change or not before submission.
> On the second look, often you see things from a different perspective
> :)
>
>
> thanks,
>
> Takashi
>

Hi Takashi,

Thank you for the feedback and complement.
Yes, will check the pattern and avoid this going forward.
As all the functions call "snd_rme_get_status1",
initialized here but smatch didn't silence them.

I prefer initializing a variable in caller side as it owns
and aware of initialized value sent.

Sorry, if I had misunderstood your suggestion.

Thank you,
HariKrishna.
