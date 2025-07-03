Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32C12DE6E5
	for <linux-sound@vger.kernel.org>; Thu,  3 Jul 2025 14:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751553792; cv=none; b=O8U8icoRe0Qq0a80i7VwU6UHiP31SyWLSLrD4vykSpQqQ//QuhMuN/bLCmqaA7XquNwzKXCQtrFqenOi7zM2M/NbsSZuAjAQ7sazrK2aKjoRKsp9b6Z9yea177R8YM0y1T7MOsSAKGq30sizoXTs2PVSw1qumRHik9uFCGpeDrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751553792; c=relaxed/simple;
	bh=rTIATc9yLuh6bC16nQzJJIRuoLT/OykTsKRPlK+EbSU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t/4YJVD31w6DoizrIMIQttuWrRu8lErD/5/4vv57fteZyW04vokJpwIviK6RqZDucM3fKPFrmT/mf+oNS2vHz5z9R1l/IMEanxl6m50VEvOCPiuC0KUE15TyjrEaX7VbrTJsDnFFoqNeT/dIiUW+fG0KR9nV3uNgFVLVLAXFVEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iFWLEZzr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lobJ1zEI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nHRBlNgF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v8xbYMH+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iFWLEZzr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lobJ1zEI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nHRBlNgF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v8xbYMH+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CDEE821249;
	Thu,  3 Jul 2025 14:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751553789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dc1wbrdTB0DgOmWYDRmhlgksvmhIDJa1JoSrGkhvgLA=;
	b=iFWLEZzr7rk7mLhrNDbgZBZvlgvvLdHqRhr8Qp7JnIsLl84lsOk2Phn5cC50ccYKAg6qC1
	VpDvkvDOIp03UP6TNsCkL+AAmecylDUaCvdQaIFWXzFMpWdpeUWDVVGwe5/Ta/J5gcmtRr
	VIpA+DbizW8QeOdFWVjbyv/2UgiKwIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751553789;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dc1wbrdTB0DgOmWYDRmhlgksvmhIDJa1JoSrGkhvgLA=;
	b=lobJ1zEIQgP4KjcqUr3C9aiLWe1LPq42H6X05Rc+ZVACeAUl8pvarmLxnH+xwh+sR3b4Qw
	blYXsFnZ/NKGGeCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nHRBlNgF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=v8xbYMH+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751553788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dc1wbrdTB0DgOmWYDRmhlgksvmhIDJa1JoSrGkhvgLA=;
	b=nHRBlNgFggFR+ereY44cKkqX6dhfdmFArqtL6FxKGdeoP2SFBz42RHOrf04fwzRtRlq4k0
	BhNMRRw9mvIbHZNXGD51mBT8PuWUj9iPB103B+SWl+O9uPYinqnr3GmyodZAvQzzOyvYVF
	3wwes60L4hQmmZUmY33Rr9Xe5MMMe1E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751553788;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dc1wbrdTB0DgOmWYDRmhlgksvmhIDJa1JoSrGkhvgLA=;
	b=v8xbYMH+n2GjQDcqExtdE0cGAMRwvBzzUy6d4GmzZSlg/tZUfec5z2eqNA+AEWDCi8git6
	lM7TEdJTGqJAV+Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B656A1368E;
	Thu,  3 Jul 2025 14:43:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fJr/K/yWZmjmaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Jul 2025 14:43:08 +0000
Date: Thu, 03 Jul 2025 16:43:08 +0200
Message-ID: <87y0t5pc77.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	Richard Fitzgerald
 <rf@opensource.cirrus.com>,
	Kailang <kailang@realtek.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [RFC] Reorganizing HD-audio driver code?
In-Reply-To: <8734bdqr8s.wl-tiwai@suse.de>
References: <87ldpdgzle.wl-tiwai@suse.de>
	<e6451c29-2ade-4b73-bfd7-f48bafccfa98@opensource.cirrus.com>
	<87h5zygawe.wl-tiwai@suse.de>
	<87ikkave2o.wl-tiwai@suse.de>
	<d7836c81-79d5-4920-8d8a-31ac6bd39fc1@linux.intel.com>
	<875xg9qtqn.wl-tiwai@suse.de>
	<3b69bdd6-9531-4101-985e-b03629e00967@linux.intel.com>
	<8734bdqr8s.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CDEE821249
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUBJECT_ENDS_QUESTION(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Score: -2.51
X-Spam-Level: 

On Thu, 03 Jul 2025 16:32:51 +0200,
Takashi Iwai wrote:
> 
> On Thu, 03 Jul 2025 15:57:48 +0200,
> Amadeusz S³awiñski wrote:
> > 
> > 
> > 
> > On 2025-07-03 15:38, Takashi Iwai wrote:
> > > On Thu, 03 Jul 2025 15:29:56 +0200,
> > > Amadeusz S³awiñski wrote:
> > >> 
> > >> 
> > >> 
> > >> On 2025-07-02 16:53, Takashi Iwai wrote:
> > >>> On Sun, 29 Jun 2025 11:22:25 +0200,
> > >>> Takashi Iwai wrote:
> > >>>> 
> > >>>> On Fri, 27 Jun 2025 15:22:20 +0200,
> > >>>> Richard Fitzgerald wrote:
> > >>>>> 
> > >>>>> On 27/06/2025 1:04 pm, Takashi Iwai wrote:
> > >>>>>> Hi,
> > >>>>>> 
> > >>>>>> HD-audio driver is known to be quite messy in both file structures and
> > >>>>>> its design, but until now I haven't touched its files paths so much
> > >>>>>> because I set a higher priority for the easiness of backport to stable
> > >>>>>> kernels.  But, you can't leave garbages forever, it's been already
> > >>>>>> high time for a large clean up.
> > >>>>>> 
> > >>>>>> So I tried a quick code reorganization, and put the result in
> > >>>>>> test/hda-reorg branch of sound.git tree.
> > >>>>>>      https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=test/hda-reorg
> > >>>>>> 
> > >>>>>> The basic idea is to move the code from sound/pci/hda/* into different
> > >>>>>> subdirectories in sound/hda/ per functionality, as most of the stuff
> > >>>>>> are independent from PCI, but rather HD-audio bus specific.
> > >>>>>> 
> > >>>>> 
> > >>>>> This all seems reasonable to me. I always thought it strange that there
> > >>>>> is a sound/hda directory but most of the HDA support isn't in that
> > >>>>> directory.
> > >>>> 
> > >>>> Thanks for your review!
> > >>>> 
> > >>>> It's a long story: at the time of ASoC Intel HD-audio support, we
> > >>>> thought to implement more ASoC-friendly way of HD-audio controller and
> > >>>> codec drivers, e.g. adapting DAPM and others.  So we began with the
> > >>>> factoring out the HD-audio basic core stuff to the common directory
> > >>>> sound/hda/*, while keeping the rest legacy stuff almost as is.  But
> > >>>> ASoC implementation didn't fly in the end from various reasons, and
> > >>>> the legacy HD-audio stuff was good enough for the actual use cases;
> > >>>> it's too bit to fail, after all.
> > >>>> 
> > >>>>>> The Realtek codec is split further to smaller pieces (which was really
> > >>>>>> huge).
> > >>>>> 
> > >>>>> Yes, that file was very confusing having support and quirks for so many
> > >>>>> Realtek parts all in one file.
> > >>>>> 
> > >>>>>> The Cirrus and TI sub-codec drivers are moved to codecs/side-codecs
> > >>>>>> subdirectory:
> > >>>>> 
> > >>>>> That's ok
> > >>>>> 
> > >>>>>> They can be put to each own directory and drop the file name prefix,
> > >>>>>> if we want, too.  Let me know if Cirrus and TI people would like to
> > >>>>>> split to more subdirectories.
> > >>>>> 
> > >>>>> I don't mind either way.
> > >>>>> The hda_component* files are common to the amps and the realtek driver
> > >>>>> so I wonder whether they belong in helpers. They are only utility
> > >>>>> wrappers around the kernel component-binding APIs.
> > >>>> 
> > >>>> Right.  So far, just because it's basically only binding with
> > >>>> side-codecs, I put into side-codecs subdirectory.
> > >>>> 
> > >>>>>> *HOWEVER* the biggest question is: whether it's worth?
> > >>>>>> 
> > >>>>>> Essentially, this makes almost impossible to make a patch for stable
> > >>>>>> trees from the original commit as is; one has to translate the file
> > >>>>>> paths and adjust manually in each patch.
> > >>>>> 
> > >>>>> Depends which file you are patching and how much it has changed.
> > >>>>> Git can figure out file renames (and changing directory is a rename).
> > >>>> 
> > >>>> I'm afraid that the Realtek codec changes might be hard to track
> > >>>> automatically.  Maybe the Cirrus side-codecs stuff would work.
> > >>>> 
> > >>>>>> Also, of course, if anyone is working on HD-audio stuff right now, the
> > >>>>>> work had to be adjusted to the new file path.  It'd be one-off action,
> > >>>>>> though.
> > >>>>> 
> > >>>>> Speaking only for Cirrus, I don't think this makes much extra effort
> > >>>>> for us. Our amp drivers have only changed location, so that should be
> > >>>>> trivial. The other file we change is patch_realtek.c but that typically
> > >>>>> is only 1-line quirk entries.
> > >>>> 
> > >>>> OK, thanks for confirmation!
> > >>> 
> > >>> ... and now I worked further on this, resulting in larger set of
> > >>> changes.  It's not only the file location changes but also the
> > >>> HD-audio codec driver binding changes.  So I put more people to Cc for
> > >>> catch their cautions.
> > >>> 
> > >>> To recap:
> > >>> 
> > >>> - The all HD-audio driver code are moved under sound/hda.
> > >>> 
> > >>>     % ls sound/hda
> > >>>     codecs/  common/  controllers/  core/  Kconfig  Makefile
> > >>> 
> > >>>     * The former hda core code is found in sound/hda/core.
> > >>>     * The former snd-hda-codec code is found in sound/hda/common.
> > >>>     * The former snd-hda-intel, tegra and acpi are put in
> > >>>       sound/hda/controllers.
> > >>>     * The former patch_* and co are put to sound/hda/codecs.
> > >>>     * Realtek codec driver is split to several modules as
> > >>>       sound/hda/codecs/realtek/alc*.
> > >>>     * Cirrus codec driver is split to cs420x and cs421x, put under
> > >>>       sound/hda/codecs/cirrus together with cs8409.
> > >>>     * HDMI codec driver is split to several modules under
> > >>>       sound/hda/codecs/hdmi
> > >>>     * Cirrus and TI sub-codecs are put under
> > >>>       sound/hda/codecs/side-codecs
> > >>> 
> > >>> - The HD-audio codec driver binding is changed from the embedded
> > >>>     hda_codec.patch_ops to hda_codec_driver.ops.
> > >>>     (As of now, hda_codec_driver.ops is a pointer, but it can be
> > >>>      embedded later, too.)
> > >>> 
> > >>>     This change required some code to be modified without the dynamic
> > >>>     override of callbacks.
> > >>> 
> > >>> - In future, we may convert the runtime PM handling to use the
> > >>>     standard pm_ops, too.  This was raised some time ago during the
> > >>>     discussion with Realtek devs.
> > >>> 
> > >>> The current patches are found in test/hda-reorg branch of sound git
> > >>> tree:
> > >>>     https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=test/hda-reorg
> > >>> 
> > >>> It's based on master branch for taking all changes of for-linus and
> > >>> for-next, hence the branch may be still frequently rebased.
> > >>> 
> > >>> So, please let me know if you see any issues or suggestions for this
> > >>> conversion.  I have no concrete plan for merging, but if everything
> > >>> looks fine, it can be even on the next 6.17, too.
> > >>> 
> > >> 
> > >> I've built it and put it on one of our machines and hit KASAN during
> > >> HDMI initialization, when I go back to master branch it works, so it
> > >> is something on test/hda-reorg.
> > > 
> > > Yes, there was bug in my branch that I fixed in this morning.
> > > Could you try the latest test/hda-reorg branch, commit
> > > 6491d5b2e256a678b3a138500bf601c916d3913e
> > > ?
> > > 
> > 
> > Still broken :(
> 
> OK, thanks for confirmation.
> 
> I guess it's a power up code path that happens just before the codec
> driver initialization.
> 
> Could you check whether the patch below covers it?

A possible alternative is like below.  This one might be safer.
Let me know if either of them can work for you.


thanks,

Takashi

--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -2774,8 +2774,9 @@ static unsigned int hda_set_power_state(struct hda_codec *codec,
 
 	/* repeat power states setting at most 10 times*/
 	for (count = 0; count < 10; count++) {
-		/* might be called before binding to driver, too */
-		if (driver && driver->ops && driver->ops->set_power_state)
+		/* might be called before or during binding to driver, too */
+		if (device_is_bound(&codec->core.dev) &&
+		    driver && driver->ops->set_power_state)
 			driver->ops->set_power_state(codec, fg, power_state);
 		else {
 			state = power_state;
