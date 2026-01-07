Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFC3277C9A
	for <linux-sound@vger.kernel.org>; Wed,  7 Jan 2026 08:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767774668; cv=none; b=eGfIA3aqm9u/gMI14PVZ0xDihbDFPvsMO6Uy8v9cu3UEqzIeXcFb1KcG30wFWnksloDXCfQKcDoN6/w57WhGjs/4EETw6tdsGzJwShHDC075/hiq6OYJ8LP5K+dmUGlwewDBn+kSK1Zj95mZm/glTY9tVNR6unYbD414BIO9tgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767774668; c=relaxed/simple;
	bh=zaMO5pGCY+SkDEzI+V7Q79Za0Tt+LebdcaQdFjSntAQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mKK0HSHj5rf1b29zKV1OXfGnHzuX/WyvtmVfKI1vJW6fDye8/jpfoFwtgdLW0kQ/d9SRR99IoYfgertDcY4U0faAUZGtHvS6ZIIUi5kC09uOex6bTjqZnMTEiC4x8iL4d+jjYTCWkna68VCJJWWROb/KwNlr4li2SmnptzDrd40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wj7Ja537; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w+6SW37/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wj7Ja537; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w+6SW37/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wj7Ja537";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w+6SW37/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wj7Ja537";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w+6SW37/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2CEDF33BD4;
	Wed,  7 Jan 2026 08:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767774662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c8wtJYUEYb0N35pmXFVbJx9kbqP+YpN9ddkh44g7Quo=;
	b=Wj7Ja537kOnzZv4vqNpgYQdb0esIm7TzsP88s5m4lmR4FK/TjJXqNszcxJcxQAvFa0P2hp
	2ya0R7Z9lL++DatsKu5cxURx86ISdplrO+Be4dcgDAHtdfuPavRwkFwolcPT+lGDL9AHsw
	v+0aSKTW7dDHNpZ13IPyfZiK6ZDEjeU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767774662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c8wtJYUEYb0N35pmXFVbJx9kbqP+YpN9ddkh44g7Quo=;
	b=w+6SW37/rFXDWu5EfSG+4XXlOIt40Xfq45xq2yjWX0kOPGwAmGQ2o/B1i5Xmj1uJfwpp9i
	3njjknSGnB5ExhCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Wj7Ja537;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="w+6SW37/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767774662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c8wtJYUEYb0N35pmXFVbJx9kbqP+YpN9ddkh44g7Quo=;
	b=Wj7Ja537kOnzZv4vqNpgYQdb0esIm7TzsP88s5m4lmR4FK/TjJXqNszcxJcxQAvFa0P2hp
	2ya0R7Z9lL++DatsKu5cxURx86ISdplrO+Be4dcgDAHtdfuPavRwkFwolcPT+lGDL9AHsw
	v+0aSKTW7dDHNpZ13IPyfZiK6ZDEjeU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767774662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c8wtJYUEYb0N35pmXFVbJx9kbqP+YpN9ddkh44g7Quo=;
	b=w+6SW37/rFXDWu5EfSG+4XXlOIt40Xfq45xq2yjWX0kOPGwAmGQ2o/B1i5Xmj1uJfwpp9i
	3njjknSGnB5ExhCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E51E03EA63;
	Wed,  7 Jan 2026 08:31:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0LqsNsUZXmkOYQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Jan 2026 08:31:01 +0000
Date: Wed, 07 Jan 2026 09:31:01 +0100
Message-ID: <87bjj5ese2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: "Xu, Baojun" <baojun.xu@ti.com>,
	Antheas Kapenekakis <lkml@antheas.dev>,
	"Ding, Shenghao" <shenghao-ding@ti.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tiwai@suse.de" <tiwai@suse.de>
Subject: Re: [EXTERNAL] Re: [BUG] hda/tas2781: ASUS ROG Xbox Ally X audio issues with default firmware
In-Reply-To: <d50cbda2-7c62-433e-b7a4-c716e6818007@linux.dev>
References: <0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@linux.dev>
	<2d8b782c-a97c-4521-9307-a2cf8934802a@linux.dev>
	<288f6482-9a6b-4362-ac97-18043659deb7@linux.dev>
	<09148B42-71C2-4428-8D21-903F85853091@linux.dev>
	<CAGwozwEJRDq96ZUQv+8H5fiXBVQ2jFvvuK48WpDqZ0eQ_NB+NA@mail.gmail.com>
	<c7929aa2-93d4-40d5-aa6f-d554729f4bee@linux.dev>
	<CAGwozwH6A-NNCioS7J_EiTbxv2Y0B3YFXuyeWU_RMsW2Z+YsRA@mail.gmail.com>
	<0b18b97f-a5dc-4f24-9716-e1eb26ac85af@linux.dev>
	<CAGwozwFQKoQgo_Q=qdr-FTD+uoVWA8AtHyDmKwTOV4ZU6+F3SQ@mail.gmail.com>
	<160aef32646c4d5498cbfd624fd683cc@ti.com>
	<d50cbda2-7c62-433e-b7a4-c716e6818007@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	REDIRECTOR_URL(0.00)[proofpoint.com,urldefense.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 2CEDF33BD4
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Sun, 04 Jan 2026 10:29:17 +0100,
Matthew Schwartz wrote:
> 
> On 1/4/26 12:58 AM, Xu, Baojun wrote:
> > Hi Antheas,
> > 
> > It may known issue which relative with calibration result.
> > Could you try to remove calibration result apply, and check if the problem still exist?
> > For example, mask below line (line number is 494) in tasdevice_dspfw_init() from tas2781-hda-i2c.c:
> > 
> > hda_priv->save_calibration(tas_hda);
> > 
> > Best Regards
> > Jim
> 
> Hi Jim,
> 
> Thanks for the reply. Antheas does not have hardware affected by this issue, but I can confirm that this fixes the problem on my own device.

Can anyone submit a proper fix patch?  It's a regression, and the fix
itself sounds trivial, as it seems.


thanks,

Takashi

> 
> Matt
> 
> > ________________________________________
> > From: Antheas Kapenekakis <lkml@antheas.dev>
> > Sent: 03 January 2026 19:48
> > To: Matthew Schwartz
> > Cc: Xu, Baojun; Ding, Shenghao; linux-sound@vger.kernel.org; linux-kernel@vger.kernel.org; tiwai@suse.de
> > Subject: [EXTERNAL] Re: [BUG] hda/tas2781: ASUS ROG Xbox Ally X audio issues with default firmware
> > 
> > On Sat, 3 Jan 2026 at 02: 31, Matthew Schwartz <matthew. schwartz@ linux. dev> wrote: > > On 1/2/26 3: 13 PM, Antheas Kapenekakis wrote: > > On Fri, 2 Jan 2026 at 21: 17, Matthew Schwartz > > <matthew. schwartz@ linux. dev>
> > ZjQcmQRYFpfptBannerStart
> > This message was sent from outside of Texas Instruments.
> > Do not click links or open attachments unless you recognize the source of this email and know the content is safe.
> > <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tDdkczlnnYRTxMpLVz-pN5EZOCpqg7wGjyDRBvMeAZFuWZXBJlfNUQdJ4vR2DLvmO1o91tMvcFY2CkFWEO4UIBOBJ80exLz0o0fjR_qbdsgA4aHVUaeJh-oUWg$>
> > Report Suspicious
> > 
> > ZjQcmQRYFpfptBannerEnd
> > 
> > On Sat, 3 Jan 2026 at 02:31, Matthew Schwartz
> > <matthew.schwartz@linux.dev> wrote:
> >>
> >> On 1/2/26 3:13 PM, Antheas Kapenekakis wrote:
> >>> On Fri, 2 Jan 2026 at 21:17, Matthew Schwartz
> >>> <matthew.schwartz@linux.dev> wrote:
> >>>>
> >>>> On 1/2/26 9:12 AM, Antheas Kapenekakis wrote:
> >>>>> On Tue, 30 Dec 2025 at 22:44, Matthew Schwartz
> >>>>> <matthew.schwartz@linux.dev> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>> On Dec 8, 2025, at 8:00 PM, Matthew Schwartz <matthew.schwartz@linux.dev> wrote:
> >>>>>>>
> >>>>>> - snip
> >>>>>>> 2.52.0
> >>>>>>
> >>>>>> After reading the TI E2E forums, it seems these calibration tuning configurations are only meant to be used during a calibration process.
> >>>>>
> >>>>> A source would be good here, a link or two
> >>>>
> >>>> Sorry about that, here is where I read about the differences between the two configs:
> >>>> https://e2e.ti.com/support/audio-group/audio/f/audio-forum/1558310/tas2563-what-is-the-difference-between-tuning-and-calibration-configuration-in-exported-smartamp-binary
> >>>
> >>> This link describes "calibration" configurations that are used in the
> >>> calibration procedure. It is not clear to me that it refers to the
> >>> calibration parameters exported by UEFI or in the configuration itself
> >>> to be used alongside a configuration. I would tend toward this being
> >>> irrelevant.
> >>>
> >>>> It's about a different amplifier model, but I assume the same applies to tas2781 given the naming structure is the same for the configurations.
> >>>>
> >>>>>
> >>>>>> Instead, something else I found that works is not overriding the firmware file calibration data with the UEFI calibration data:
> >>>
> >>> I misunderstood what you meant by this before. I thought you meant
> >>> that the firmware overrode the UEFI data, not the other way around.
> >>> Surely, using the dummy data in the firmware file is better than using
> >>> incorrect data from UEFI. However, the manufacturer calibrated data
> >>> from the factory floor for each specific unit is in UEFI, so that is
> >>> what should be used.
> >>>
> >>>>> I did not look into the source code, do you have any reference in the
> >>>>> ACPI TAS code that r0_buf is prefilled with UEFI data?
> >>>>
> >>>> From what I understand, I think the current flow goes like this:
> >>>>
> >>>> 1. During driver init, tas2781_save_calibration() reads UEFI calibration data into the cali_data memory buffer and sets is_user_space_calidata=true: https://urldefense.com/v3/__https://github.com/torvalds/linux/blob/master/sound/hda/codecs/side-codecs/tas2781_hda.c*L162-L173__;Iw!!G3vK!U3mEJNuRpB9ZxVAGZZCyoMNqMnAl4M1N8YoxbHiMHIsF-13h4Wg_fbVfd008drQfvgstYyA1aQnWHw$
> >>>>
> >>>> 2. When switching to a DSP config, tasdevice_select_tuningprm_cfg() calls tasdevice_load_data() which writes the firmware configuration, including any calibration values embedded in that config: https://urldefense.com/v3/__https://github.com/torvalds/linux/blob/master/sound/soc/codecs/tas2781-fmwlib.c*L2510__;Iw!!G3vK!U3mEJNuRpB9ZxVAGZZCyoMNqMnAl4M1N8YoxbHiMHIsF-13h4Wg_fbVfd008drQfvgstYyDJTrchbQ$
> >>>>
> >>>> 3. Immediately after, tasdev_load_calibrated_data() writes the UEFI calibration data from step 1, overwriting the values just set in step 2: https://urldefense.com/v3/__https://github.com/torvalds/linux/blob/9b043680446067358913edc2e9dd71bf8ffae208/sound/soc/codecs/tas2781-fmwlib.c*L2392-L2428__;Iw!!G3vK!U3mEJNuRpB9ZxVAGZZCyoMNqMnAl4M1N8YoxbHiMHIsF-13h4Wg_fbVfd008drQfvgstYyBeYnGr_w$ + https://urldefense.com/v3/__https://github.com/torvalds/linux/blob/master/sound/soc/codecs/tas2781-fmwlib.c*L2519__;Iw!!G3vK!U3mEJNuRpB9ZxVAGZZCyoMNqMnAl4M1N8YoxbHiMHIsF-13h4Wg_fbVfd008drQfvgstYyBz8-7Z6g$
> >>>>
> >>>> I confirmed this this by inserting some debug logs around tasdev_load_calibrated_data:
> >>>
> >>> I went through the code. It loads the UEFI data, sets
> >>> is_user_space_calidata=1, then if the data is available it loads it.
> >>> This is correct.
> >>>
> >>> To me this seems like the calibration data for amp 1 is written to
> >>> both amp 1 and amp 2, and for your firmware this breaks amp2.
> >>
> >> If this were the case, shouldn't my debug logs have the same data being written to dev 0 and dev 1?
> >>
> >> [    6.367380] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 0 writing calibration: r0_reg=0x000ce4 data=3c5f7222
> >> [    6.371718] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 1 writing calibration: r0_reg=0x000ce4 data=3c90e72d
> >>
> >>>
> >>> In tasdev_load_calibrated_data(), an i index is provided, but
> >>> cali_data is nested under priv. So only one calibration set is
> >>> supported. This means that amp 2 gets amp 1 calibrations.
> >>>
> >>> Perhaps there is a "SmartAmpCalibrationData2" that should be read
> >>> instead for amp 2 instead, can you dump the EFI variables and check?
> >>
> >> (128)(deck@steamdeck ~)$ ls /sys/firmware/efi/efivars/
> >> AmdAcpiVar-79941ecd-ed36-49d0-8124-e4c31ac75cd4               BugCheckProgress-ba57e015-65b3-4c3c-b274-659192f699e3             MemoryOverwriteRequestControl-e20939be-32d4-41be-a150-897f85d49829
> >> <snip>
> >> There's only one EFI var that seems to be for calibration data:
> >>
> >> xxd /sys/firmware/efi/efivars/CALI_DATA-1f52d2a1-bb3a-457d-bc09-43a3f4310a92:
> >>
> >> 00000000: 0700 0000 dd0a 0000 0300 0000 7e4a 9d68  ............~J.h
> >> 00000010: 0000 0000 2272 5f3c d515 f610 ac9a 9b2e  ...."r_<........
> >> 00000020: 5d91 9600 0000 8025 0100 0000 2de7 903c  ]......%....-..<
> >> 00000030: 283c e810 ffc8 c12e fcce 9600 0000 8025  (<.............%
> >> 00000040: 8000 0000 0000 1964 0000 1974 0000 197c  .......d...t...|
> >> 00000050: 0000 1560 0000 1a70 eb7f b12b            ...`...p...+
> > 
> > I reviewed the loader for CALI_DATA, it supports multiple device
> > calibration data and indexes it currently. In addition, it has two
> > versions with CRC checks that pass, so one of those versions loads the
> > data correctly.
> > 
> > So everything looks technically correct
> > 
> > Here is your data from the first amp reordered:
> >        r0_reg=0x000ce4 408f5c29
> >        r0_reg=0x000ce4 3c5f7222
> >    invr0_reg=0x000cf4 0fdc788c
> >    invr0_reg=0x000cf4 10f615d5
> > r0_low_reg=0x000cfc 0f7e9100
> > r0_low_reg=0x000cfc 2e9b9aac
> >   pow_reg=0x000ae0 009b5281
> >   pow_reg=0x000ae0 0096915d
> >  tlimit_reg=0x000d70 25800000
> >  tlimit_reg=0x000d70 25800000
> > 
> > And the second amp:
> >     r0_reg=0x000ce4 40cccccd
> >     r0_reg=0x000ce4 3c90e72d
> >  invr0_reg=0x000cf4 0fcd6e9e
> >  invr0_reg=0x000cf4 10e83c28
> > r0_low_reg=0x000cfc 0f8d4fdf
> > r0_low_reg=0x000cfc 2ec1c8ff
> >    pow_reg=0x000ae0 009b9c58
> >    pow_reg=0x000ae0 0096cefc
> > tlimit_reg=0x000d70 25800000
> > tlimit_reg=0x000d70 25800000
> > 
> > There is a large deviation in r0, invr0, and r0_low in both of them.
> > Unfortunately, I do not have my Xbox Ally non-X to check to see if
> > it's incorrect. This hints to me that the registers get incorrect data
> > loaded, so there might be a mistake in the UEFI parser.
> > 
> > Here is a breakdown of your efivar
> > 0700 0000 # This is not supposed to be here / Might have been thrown
> > out by kernel if v2 loads
> > 
> > dd0a 0000 # 2781, is v2 protocol
> > 0300 0000 # Data-Group-Sum / How many nodes
> > 7e4a 9d68 # Timestamp
> > 
> > # First amplifier data
> > 0000 0000
> > 2272 5f3c # r0
> > d515 f610 # invr0
> > ac9a 9b2e # r0_low
> > 5d91 9600 # pow
> > 0000 8025 # tlimit
> > 
> > # Second amplifier data
> > 0100 0000
> > 2de7 903c # r0
> > 283c e810 # invr0
> > ffc8 c12e # r0_low
> > fcce 9600 # pow
> > 0000 8025 # tlimit
> > 
> > 8000 0000 # Calibration data / Derivation logic in TASDEVICE_REG
> > 0000 1964 # r0 addr
> > 0000 1974 # invr0 addr
> > 0000 197c # r0_low addr
> > 0000 1560 # pow addr
> > 0000 1a70 # tlimit addr
> > 
> > eb7f b12b # CRC32
> > 
> > Specifically for the 0x80, cali_reg addresses get stored into
> > r0/invr0... iff p->dspbin_typ == TASDEV_BASIC.
> > 
> > I suspect the problem here is that the UEFI override for the first
> > three values tries to change different registers and not r0, invr0 and
> > r0_low. The pow, tlimit look correct.
> > 
> > But, due to p->dspbin_typ != TASDEV_BASIC, cali_reg ends up being
> > thrown out and the UEFI values end up corrupting the r0, invr0 and
> > r0_low default addresses. and not 00, 19, 64/74/7c
> > 
> > Antheas
> > 
> >>>
> >>> In that case, a minor refactor to move cali_data and
> >>> is_user_space_calidata from priv to priv->tasdevice[i] and then use
> >>> the proper efi var would fix this.
> >>>
> >>> Antheas
> >>>
> >>>> [    3.908963] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_apply_calib: dspbin_typ=2, ndev=2, Setting is_user_space_calidata=true
> >>>> <snip>
> >>>>
> >>>> where it loads the UEFI calibration over top of the firmware calibration.
> >>>>
> >>>>>
> >>>>> It could be that there is a specific priority, where UEFI data is
> >>>>> supposed to be loaded after the firmware code, replacing the
> >>>>> calibration data from the file, or that is what is done in Windows.
> >>>>> But here it is done the other way. In that case, it might be more
> >>>>> appropriate to set a dummy var such as bool uefi_calib that becomes 1
> >>>>> when loading calibration from UEFI, and skip loading from the fw file
> >>>>> if available.
> >>>>>
> >>>>> But links, etc. Here, this would affect all TAS devices too, so it is
> >>>>> more major.
> >>>>
> >>>> Yes, was really hoping to get TI's feedback before potentially sending it out, as it would be a major change and the documentation on this is scarce. I could also be misunderstanding the calibration data load flow, but this is just from poking at this issue from every angle I can think of.
> >>>>
> >>>> Happy new year,
> >>>> Matt
> >>>>
> >>>>>
> >>>>> Happy new year,
> >>>>> Antheas
> >>>>>
> >>>>>> diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
> >>>>>> index 78fd0a5dc6f2..1e768e6187da 100644
> >>>>>> --- a/sound/soc/codecs/tas2781-fmwlib.c
> >>>>>> +++ b/sound/soc/codecs/tas2781-fmwlib.c
> >>>>>> @@ -2377,6 +2377,7 @@ static void tasdev_load_calibrated_data(struct tasdevice_priv *priv, int i)
> >>>>>>         unsigned char *data = cali_data->data;
> >>>>>>         struct tasdevice_calibration *cal;
> >>>>>>         int k = i * (cali_data->cali_dat_sz_per_dev + 1);
> >>>>>> +       unsigned char r0_buf[4];
> >>>>>>         int rc;
> >>>>>>
> >>>>>>         /* Load the calibrated data from cal bin file */
> >>>>>> @@ -2389,6 +2390,20 @@ static void tasdev_load_calibrated_data(struct tasdevice_priv *priv, int i)
> >>>>>>         }
> >>>>>>         if (!priv->is_user_space_calidata)
> >>>>>>                 return;
> >>>>>> +
> >>>>>> +       /*
> >>>>>> +        * Check if the DSP config already set the calibration registers.
> >>>>>> +        * Some tuning configs contain their own calibration data which should
> >>>>>> +        * not be overwritten by user space calibration data.
> >>>>>> +        */
> >>>>>> +       rc = tasdevice_dev_bulk_read(priv, i, p->r0_reg, r0_buf, 4);
> >>>>>> +       if (rc >= 0 && (r0_buf[0] | r0_buf[1] | r0_buf[2] | r0_buf[3])) {
> >>>>>> +               dev_dbg(priv->dev,
> >>>>>> +                       "%s: dev %d r0_reg already set by config, skipping calibration\n",
> >>>>>> +                       __func__, i);
> >>>>>> +               return;
> >>>>>> +       }
> >>>>>> +
> >>>>>>         /* load calibrated data from user space */
> >>>>>>         if (data[k] != i) {
> >>>>>>                 dev_err(priv->dev, "%s: no cal-data for dev %d from usr-spc\n",
> >>>>>>
> >>>>>> Is this more suitable to be upstreamed?
> >>>>>>
> >>>>>> Thanks,
> >>>>>> Matt
> >>>>>> <snip>
> >>>>>>
> >>>>>
> >>>>
> >>>>
> >>>
> >>
> >>
> > 
> > 
> > 
> 
