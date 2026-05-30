Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D350234E746
	for <linux-sound@vger.kernel.org>; Sat, 30 May 2026 13:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780148291; cv=none; b=m8omMfLhgqPg0BjQhW5BFkBrhk4/gt4KeA6UmYRu34BgCdpakaSNF9KKDTfEnruag8Up8R1weEhOCW+C1wqDdTGXsS2YxJDkCd7QcSoTwIgmWYBtoZUGwiEySmunGBShxqdoqiEHEeNJX4j0v2grCq9Lz6zZlTgUD6PKx5cd/9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780148291; c=relaxed/simple;
	bh=eprYrL29YHl45LKRBwrHmfab84rAf1H0o/rzSSXrxzU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LkBQ6t5G0NHk45cxq0htwW5X5vEWk6XryTpMkKEDMOWfiT/qBuwC7bYTsnbHroSkdcorGhl1n//Rt7UUvCwvngM/v9zDonSPCPuE1cr9dUyjilvPswWqNJSH+xfuHePvYVAd9wJmkwsF5egbxNoMssFFkoDVgV+EBQARCTZdlIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d5Fmaslb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N7TV+d+o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fmper+4Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wmjG1ncS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d5Fmaslb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N7TV+d+o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fmper+4Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wmjG1ncS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C2CE46B9AD;
	Sat, 30 May 2026 13:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780148288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ue/XLqPtTNzyZbzreuYOG8qyoOz/yNZp+n8QcTFxcac=;
	b=d5FmaslbPLQzv0Q96gHtWxSdxrN4cP3WQde38gTNQ4jzVCTwdZLyfLu+gtf9/d0pnaIMEW
	K57eCTGsZ+5/IWf3yJZ2k4lQbsXgQwYNhgCunSPxhTwJudfpirERSfZIG4hKCdV1QzjAH5
	O4e85pI3SeO149Kxt0tMOYgZngIPygI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780148288;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ue/XLqPtTNzyZbzreuYOG8qyoOz/yNZp+n8QcTFxcac=;
	b=N7TV+d+owZ98vpV3aVLSwqWZ5PX8+mdqv4uEpdwFogE2fSDGNsN09aAmbXmW8zcGL/G8Q2
	v0EpqhFx7tfbcZBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780148286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ue/XLqPtTNzyZbzreuYOG8qyoOz/yNZp+n8QcTFxcac=;
	b=fmper+4ZFIr9Inu+2i4358s70TE6jUNKsevYPH3/PsP81njlIyL8cNWZAGMs4t8Ex7Lwse
	CN18tjdYAk1H9QXNrjJfK/t0IeZDqwgwekgv7YuTVCFmvzWYuxaHcT/kCydn6MxJyCF1T6
	h/m4dfY0j5/AGFloIJX9CcuxGeL/7nU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780148286;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ue/XLqPtTNzyZbzreuYOG8qyoOz/yNZp+n8QcTFxcac=;
	b=wmjG1ncSzKTI54k7r1icp91X/Ly+vq8FPpGSqn891hN44NC1ba3E/MNoOUH8dgbPf1aPSc
	e+5rqcY5u0sc9hBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A0D0779A7;
	Sat, 30 May 2026 13:38:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id R9w0JD7oGmp6KgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 30 May 2026 13:38:06 +0000
Date: Sat, 30 May 2026 15:38:06 +0200
Message-ID: <87ik85ow5d.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Takashi Iwai <tiwai@suse.de>,
	Steve Smith <tarkasteve@gmail.com>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [BUG] Audio regression in 7.1-rcX; low volume on Edifier MF200
In-Reply-To: <1B383455-B0F8-4B67-92AA-559D3F638999@rong.moe>
References: <CAHLWS5FJCx66GQ-O10pu+nEudEo_QgQAM9vt76T7vT0zGPPC1g@mail.gmail.com>
	<87wlwmr32n.wl-tiwai@suse.de>
	<b25d12e13bffefb926d92464eda1f66cb26f5dfa.camel@rong.moe>
	<CAHLWS5HrOUGw8KiPsZPV4im3jKLd1YOoRs6szvLjusHQm1dmZQ@mail.gmail.com>
	<50261203461f3b56c0bd196c1d9a754f84a4d8bc.camel@rong.moe>
	<87ldd1p09p.wl-tiwai@suse.de>
	<1B383455-B0F8-4B67-92AA-559D3F638999@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,vger.kernel.org,perex.cz];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:email,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]

On Sat, 30 May 2026 14:22:23 +0200,
Rong Zhang wrote:
> 
> Hi Takashi,
> 
> 于 2026年5月30日 GMT+08:00 20:09:06，Takashi Iwai <tiwai@suse.de> 写道：
> >On Sat, 30 May 2026 13:06:03 +0200,
> >Rong Zhang wrote:
> >> 
> >> Hi Steve,
> >> 
> >> On Sat, 2026-05-30 at 12:34 +1000, Steve Smith wrote:
> >> > On Fri, 29 May 2026 at 22:07, Rong Zhang <i@rong.moe> wrote:
> >> > > 
> >> > > Hi Takashi, Steve,
> >> > > 
> >> > > Hmm, the dmesg dump is, however, for a good commit. No wonder we
> >> > > couldn't find the error message... :-/
> >> > 
> >> > You are correct, apologies. rc5 (broken) dmesg attached; it does have
> >> > the following line:
> >> > 
> >> >     usb 1-3.2: 9:1: sticky mixer values (-32768/-32513/1 => -32702), disabling
> >> > 
> >> > > Steve, could you please attach a dmesg dump for a bad commit? And could
> >> > > you please test if setting QUIRK_FLAG_MIXER_GET_CUR_BROKEN on your
> >> > > device helps? See
> >> > > https://lore.kernel.org/linux-sound/20260529-uac-quirk-get-cur-vol-v3-0-bde363188ca4@rong.moe/
> >> > 
> >> >  I can confirm this works:
> >> > 
> >> > * Applied above patchset to its base commit; volume still low.
> >> > * Added to MF200 to the quirks list (see below); volume behaves as expected:
> >> 
> >> Thanks for testing! I will submit a patch for your device with your
> >> Tested-by tag.
> >> 
> >> While a correct fix for your device is a said quirk table entry, I will
> >> also submit another patch to improve the error path of sticky mixers as
> >> I've said in my previous reply, so that future quirky devices can mostly
> >> work fine before someone submits a quirk table entry. I will add you to
> >> the CC list when I submit it. Could you kindly test it (without the
> >> quirk table entry for your device) to see if the soft mixer works better
> >> when you receive it?
> >
> >Rong, if you work on the improvement, can you try to have a small fix
> >that fits with 7.1?  We can merge whatever for 7.2, but 7.1 is already
> >at a late RC, so I'd like to avoid to drag a big series of fixes
> >there.
> 
> Sure. I will fix the error path for 7.1 while adding a quirk table entry for Edifier MF200 for 7.2.

Great, much appreciated!


Takashi
