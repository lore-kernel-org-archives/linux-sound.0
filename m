Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BCA7A712
	for <linux-sound@vger.kernel.org>; Wed, 31 Jan 2024 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706699396; cv=none; b=NmKDHmlYRV1eX0gdQmQIo4Nv3wFh4tWS/OcePLv3iMhd/iKgsy4l9Z9xw5iodxhnBdZnNXNCaZgc70OViCEF/xL2uc78uR97pVwhn1h7a5yIa3Q4PAygmbUbu7YnK4VkbFQZVscP3lo0kazHueJENiBrI42GF4eYeIOuWM3aJVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706699396; c=relaxed/simple;
	bh=kY4JwaV1pFyCM93sx+O8FxV7C+Klts+XEayeI1bROSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhEFW6wrjXFCnxUDuvD/cUr5JWvNUy+vAtjujkMhyafmrdhHCk7fagOQRMtmC8Y2Wc4woZ3AJa0DKOtIOkZrDRBGzGWP4C00zTiAjHpBdJw/TYQdjJ5bCk0CK10q2tldE3AZ4CKI0FcDV2CtCTtCyrt7mY3UfNyGwH7AxSOmMnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daTCWSSJ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daTCWSSJ"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51120e2864fso1407518e87.1
        for <linux-sound@vger.kernel.org>; Wed, 31 Jan 2024 03:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706699392; x=1707304192; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xfVaeiWmugfqY5bXZuha+ZL2rpQPtam3K3tkwqlGmfY=;
        b=daTCWSSJoIHMNE7eiiEtELXKAu/Epxq29O20iPJ83hU6PjQsY0VuvqvYkb0UigU5qU
         hA668pZfgPLDqCsPCFfSjhKEDY6kLDUkKF6w7Y1ySd4A8XGw79We9UAM00YQeTNt7cef
         MJ5pgocgdOhlRiV3FmFFR/NPUUOjWVziiI3NFTq6SHMw6DYURwpnAcsbDIK5YgHMzi14
         hHvq+vW1r6MpkwH2LS3MkeHYCd6aGTijAd0tQLcAquNxT91yxJWi4U7lu3wt2n57hS0L
         ZEFOBF9UyvNPtrbllI3AdLBG7du7/0AHJK24/xYgxiU7cyG2qCO7BnJokUhxZO6Oc5Oo
         r1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706699392; x=1707304192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfVaeiWmugfqY5bXZuha+ZL2rpQPtam3K3tkwqlGmfY=;
        b=CRqYRuROqLZDmf8OvYMPhjuiXKZ26Qoo4hNW/dTV7jgh2ubgG7x4Dv0Ryh1yrGc2k+
         cZqNJfuuRHiAc0s4kDh49moQ9Osflqjyht3v9NhKr+xcbTXczbrwCpTVgNNpL//ZyxVi
         Gkyu0DWhUgIfEQs6etpVtabFnN+Wziw7gXEpckGZnUOONIXWjT9+OQMSzAwMPRBDW+JZ
         XN7OTZSps6BVCJv4H3Z6oAXZXDzCDvs1cGwhrsMEnuTZQFPpGHMiYAbMlUv1LVW6zqWg
         sRUufgyBFLKRRIVQxTlE5d2PXy1Aqvq2x+1irEwo7Xn/N3cqvEgONr7EyKw8Kj4X4Gfe
         tG6g==
X-Gm-Message-State: AOJu0Yy69OMDGztj3KrHdy2wlP79LjdvmlKka2Pa2Mzdnu2ZvratjBNR
	UQU7rDTorsnwaNt+JYwnVHYvg4e3oQ7+YvAAx0Hkl8DiqDBTiqT6
X-Google-Smtp-Source: AGHT+IF6SywL68mCvjAPYvVueg2yndtZ3x10XmZHcHOapYHSo9gQTdEKY2aXiWZSbb0wouslswxsMQ==
X-Received: by 2002:ac2:5969:0:b0:510:ac5:5782 with SMTP id h9-20020ac25969000000b005100ac55782mr981733lfp.57.1706699392430;
        Wed, 31 Jan 2024 03:09:52 -0800 (PST)
Received: from aquecedor-3-0 ([2001:818:e81c:ce00:7193:3bd:90d8:9d8])
        by smtp.gmail.com with ESMTPSA id a15-20020a056000100f00b0033aee3bfac5sm7330431wrx.16.2024.01.31.03.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 03:09:51 -0800 (PST)
Date: Wed, 31 Jan 2024 11:09:49 +0000
From: =?iso-8859-1?Q?Jos=E9?= Relvas <josemonsantorelvas@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] Apply headset jack fixup for alc287 thinkpads
Message-ID: <Zboqfadxk-4OcEg9@aquecedor-3-0>
References: <20240130192536.10298-1-josemonsantorelvas@gmail.com>
 <871q9y2cle.wl-tiwai@suse.de>
 <Zbogv_GdHlz5dZsQ@aquecedor-3-0>
 <87eddx3hhj.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87eddx3hhj.wl-tiwai@suse.de>

Thanks for the feedback! So if my understanding is correct, the headset jack quirk is currently *only* applied to models with bass speakers?

bass thinkpad -> headset thinkpad quirk -> bass thinkpad quirk (both quirks applied)
normal thinkpad -X> headset thinkpad quirk -X> bass thinkpad quirk (neither quirks applied) 

I'll go back to the drawing board, just making sure I'm not missing anything.

José Relvas

On Wed, Jan 31, 2024 at 11:49:28AM +0100, Takashi Iwai wrote:
> On Wed, 31 Jan 2024 11:28:15 +0100,
> José Relvas wrote:
> > 
> > Thanks for the reply!
> > 
> > Sorry about the misformatted patch. I did send in a second one through git-send-email. Is it not correct either? 
> > 
> > Anyways, the reason I'm editing the existing quirks is mostly because ALC285_FIXUP_THINKPAD_HEADSET_JACK was actually wrong.
> > It was actually always linking to the X1 gen 7 quirk, which has some kcontrol changes only meant for a few models with bass speakers.
> 
> Yes, and that's the intentional behavior.
> There is the match with the pin table, not only the explicit PCI
> SSID, and those are with bass speakers.
> 
> > It looks like this: 
> > 
> > /* Quirk for Thinkpad X1 7th and 8th Gen
> >  * The following fixed routing needed
> >  * DAC1 (NID 0x02) -> Speaker (NID 0x14); some eq applied secretly
> >  * DAC2 (NID 0x03) -> Bass (NID 0x17) & Headphone (NID 0x21); sharing a DAC
> >  * DAC3 (NID 0x06) -> Unused, due to the lack of volume amp
> > */
> > static void alc285_fixup_thinkpad_x1_gen7(struct hda_codec *codec,
> > 					  const struct hda_fixup *fix, int action)
> > {
> > 	static const hda_nid_t conn[] = { 0x02, 0x03 }; /* exclude 0x06 */
> > 	static const hda_nid_t preferred_pairs[] = {
> > 		0x14, 0x02, 0x17, 0x03, 0x21, 0x03, 0
> > 	};
> > 	struct alc_spec *spec = codec->spec;
> > 
> > 	switch (action) {
> > 	case HDA_FIXUP_ACT_PRE_PROBE:
> > 		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
> > 		spec->gen.preferred_dacs = preferred_pairs;
> > 		break;
> > 	case HDA_FIXUP_ACT_BUILD:
> > 		/* The generic parser creates somewhat unintuitive volume ctls
> > 		 * with the fixed routing above, and the shared DAC2 may be
> > 		 * confusing for PA.
> > 		 * Rename those to unique names so that PA doesn't touch them
> > 		 * and use only Master volume.
> > 		 */
> > 		rename_ctl(codec, "Front Playback Volume", "DAC1 Playback Volume");
> > 		rename_ctl(codec, "Bass Speaker Playback Volume", "DAC2 Playback Volume");
> > 		break;
> > 	}
> > }
> > 
> > On second review, this does break some routing with older alc285, as the speaker and headphone NIDs are still 0x02 and 0x03.
> > Maybe cloning the x1 gen 7 fixup, but without the renamed ctls, is the more appropriate solution here? Let me know what your thoughts are.
> 
> I believe it's safer to make a specific quirk for X7 gen7.
> There are too many dependencies on the existing chains.
> 
> 
> Takashi
