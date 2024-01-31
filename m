Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAA774E0D
	for <linux-sound@vger.kernel.org>; Wed, 31 Jan 2024 11:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706701553; cv=none; b=PEXyfjxAl4QZmGcQ4x1MRpcD0KFg7du766kq/J6e8xPJrCyPUsfQ9ApMKBGujSZVv/s3VzqX2WqIQln3NLupS6bjeDOkBdZp7pDIeKwsId6DSDmHoPuK15Mfkqrpi0YQDPfdyPLDtKP7t73LvEujnSwuSZWp+jUZ96hh0pUaGBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706701553; c=relaxed/simple;
	bh=ExhZtCdOBReoGCRUk16zFlmVS1xffQDVny8wrMoewFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZR0dizRv0kFnBax4kLyDzoJNJK6BPW/QmHysBCPDMtyWZBYkEu0DsPZiUGXU6w/dVYj3sFrS1uCYyxMzR2EBzGiHLikP1H8ttSyjCwxiu9mrhvAnkZs/z1DgEYb7E1P4f5GqBzkXcaRXKy/MSxiSoSPO3IQevPFxG4/lJrZnJxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KzWQTpMZ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzWQTpMZ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33ae7681d03so2440841f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 31 Jan 2024 03:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706701550; x=1707306350; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NDmjGCyur9YmfxyCr2GZD7lXdcmXA71GUE5lblaCPyc=;
        b=KzWQTpMZObBUvzExSlBgE1lW6+7Q3qgvBID4BlbCmZWaXxeCct3fI1aGHOqly4sedV
         P3d+PlxaeQXfzqDrYJIHn98KfRfypVVEhLwciBr0nDbi5uU/hSi6A6yxm7dgsrjM82AV
         sqC9W0TfBtxLgci1eCh8jQa8hRHmlH9AuWRJPbKQfM+alV8nVXmAK9ucXHKTan1QWI9p
         jWLwHYrpviNA1OaN42hdEyFpSjrJ4YsFvHqnPf+Tt30JkRR8gRQWrAzUGeAlsjxnTPcJ
         AHXRPcNhRBZw2kyPqjrGGriHpCmRuTH1UsNqCmE0rc1goUmdOnF0weGj/duF1SxhPjEK
         B2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706701550; x=1707306350;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NDmjGCyur9YmfxyCr2GZD7lXdcmXA71GUE5lblaCPyc=;
        b=F7Gnf76yqwqmstlMICWnT7M1TSAErXGQ3rT3ao6cVzk69lPlAjfWK6Gut9LnUjcS7K
         CDaHMYmiSOb3g+ct98n0dEzt3Z0jHRt8z2bYeg8X8SLj1TIcnm3N2o1sGlvaqUdnOOcY
         8J2RZYnFSH1f5EZif1a3rPSfMmXV+J1XZ90Sdx5scHJkWheq+cG/5PjaBFgdNGasYxom
         Q0brvJEjta6UbzFWtpsBX5GuDjbpJ2YIjqLRcJZT+gtd9hkhWkjbUsmuZJmONXSwm7kd
         cBps9/6IOEP2Y3s24Z3wRqMfAym/VYHsijebT0SaoB/8FU5PiUjYN/YfBoIO4FhNg7j1
         +o5Q==
X-Gm-Message-State: AOJu0YwFl+TAHZK/tJpogTzocwX1ZgqrwzleEz1FnPOn36k3+kLbKHxP
	DaXQw5x9DEVlKThTZ6XIW8JDZ5sMr7LiYRhZ8o7rgFT5FGB//x3V
X-Google-Smtp-Source: AGHT+IFGRM9MHvB7mPxSHypHKrP4CTPJTatgf5NvIGMxgK9H0Z2m9e29hYPs4amWh6pCW+MOydRR8A==
X-Received: by 2002:a5d:4049:0:b0:33b:3b5:39bc with SMTP id w9-20020a5d4049000000b0033b03b539bcmr972596wrp.3.1706701549743;
        Wed, 31 Jan 2024 03:45:49 -0800 (PST)
Received: from aquecedor-3-0 ([2001:818:e81c:ce00:7193:3bd:90d8:9d8])
        by smtp.gmail.com with ESMTPSA id ce2-20020a5d5e02000000b0033af4848124sm6367005wrb.109.2024.01.31.03.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 03:45:49 -0800 (PST)
Date: Wed, 31 Jan 2024 11:45:47 +0000
From: =?iso-8859-1?Q?Jos=E9?= Relvas <josemonsantorelvas@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] Apply headset jack fixup for alc287 thinkpads
Message-ID: <Zboy63KkNfAJB3kf@aquecedor-3-0>
References: <20240130192536.10298-1-josemonsantorelvas@gmail.com>
 <871q9y2cle.wl-tiwai@suse.de>
 <Zbogv_GdHlz5dZsQ@aquecedor-3-0>
 <87eddx3hhj.wl-tiwai@suse.de>
 <Zboqfadxk-4OcEg9@aquecedor-3-0>
 <87a5ol3f6z.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a5ol3f6z.wl-tiwai@suse.de>

Oops, turns out there's a non-bass variant of this quirk: ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK
I've made a V2 of this patch using it - it's much less invasive.

I'm in agreement. If the quirk's name says it targets bass systems, then that'd imply a non-bass version is available, which should prevent future confusion.

On Wed, Jan 31, 2024 at 12:39:00PM +0100, Takashi Iwai wrote:
> On Wed, 31 Jan 2024 12:09:49 +0100,
> José Relvas wrote:
> > 
> > Thanks for the feedback! So if my understanding is correct, the headset jack quirk is currently *only* applied to models with bass speakers?
> 
> AFAIK, it looks yes; at least the majority of machines are actually
> with bass speakers.
> 
> > bass thinkpad -> headset thinkpad quirk -> bass thinkpad quirk (both quirks applied)
> > normal thinkpad -X> headset thinkpad quirk -X> bass thinkpad quirk (neither quirks applied) 
> >
> > I'll go back to the drawing board, just making sure I'm not missing anything.
> 
> Maybe it'd be helpful to rename the current one to be more explicit
> with bass speakers at first :)
> 
> 
> Takashi
> 
> > José Relvas
> > 
> > On Wed, Jan 31, 2024 at 11:49:28AM +0100, Takashi Iwai wrote:
> > > On Wed, 31 Jan 2024 11:28:15 +0100,
> > > José Relvas wrote:
> > > > 
> > > > Thanks for the reply!
> > > > 
> > > > Sorry about the misformatted patch. I did send in a second one through git-send-email. Is it not correct either? 
> > > > 
> > > > Anyways, the reason I'm editing the existing quirks is mostly because ALC285_FIXUP_THINKPAD_HEADSET_JACK was actually wrong.
> > > > It was actually always linking to the X1 gen 7 quirk, which has some kcontrol changes only meant for a few models with bass speakers.
> > > 
> > > Yes, and that's the intentional behavior.
> > > There is the match with the pin table, not only the explicit PCI
> > > SSID, and those are with bass speakers.
> > > 
> > > > It looks like this: 
> > > > 
> > > > /* Quirk for Thinkpad X1 7th and 8th Gen
> > > >  * The following fixed routing needed
> > > >  * DAC1 (NID 0x02) -> Speaker (NID 0x14); some eq applied secretly
> > > >  * DAC2 (NID 0x03) -> Bass (NID 0x17) & Headphone (NID 0x21); sharing a DAC
> > > >  * DAC3 (NID 0x06) -> Unused, due to the lack of volume amp
> > > > */
> > > > static void alc285_fixup_thinkpad_x1_gen7(struct hda_codec *codec,
> > > > 					  const struct hda_fixup *fix, int action)
> > > > {
> > > > 	static const hda_nid_t conn[] = { 0x02, 0x03 }; /* exclude 0x06 */
> > > > 	static const hda_nid_t preferred_pairs[] = {
> > > > 		0x14, 0x02, 0x17, 0x03, 0x21, 0x03, 0
> > > > 	};
> > > > 	struct alc_spec *spec = codec->spec;
> > > > 
> > > > 	switch (action) {
> > > > 	case HDA_FIXUP_ACT_PRE_PROBE:
> > > > 		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
> > > > 		spec->gen.preferred_dacs = preferred_pairs;
> > > > 		break;
> > > > 	case HDA_FIXUP_ACT_BUILD:
> > > > 		/* The generic parser creates somewhat unintuitive volume ctls
> > > > 		 * with the fixed routing above, and the shared DAC2 may be
> > > > 		 * confusing for PA.
> > > > 		 * Rename those to unique names so that PA doesn't touch them
> > > > 		 * and use only Master volume.
> > > > 		 */
> > > > 		rename_ctl(codec, "Front Playback Volume", "DAC1 Playback Volume");
> > > > 		rename_ctl(codec, "Bass Speaker Playback Volume", "DAC2 Playback Volume");
> > > > 		break;
> > > > 	}
> > > > }
> > > > 
> > > > On second review, this does break some routing with older alc285, as the speaker and headphone NIDs are still 0x02 and 0x03.
> > > > Maybe cloning the x1 gen 7 fixup, but without the renamed ctls, is the more appropriate solution here? Let me know what your thoughts are.
> > > 
> > > I believe it's safer to make a specific quirk for X7 gen7.
> > > There are too many dependencies on the existing chains.
> > > 
> > > 
> > > Takashi
