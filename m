Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B942ED148
	for <linux-sound@vger.kernel.org>; Thu,  3 Jul 2025 14:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751553258; cv=none; b=RdNdqLh7hsApuatTH9/e8Tp6rOWUboECQrk8NWb1QcVtM5aIVM967ySOz1etS9imTZqkJJvqZfLdjFu45HzQQUjYNjn0ZR80JCB3/rXG1SzlIuJge3XdEJBFy8k7yDH66EJHB4gXwR6ym/YfoFvXfozR3Dxcgjr8G30DQ2c/Nx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751553258; c=relaxed/simple;
	bh=LA0AEwZUKiSkUGw0EwaY+Ws8ybRDDwrPnpUfRVYRWpo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sVeXz4drT7yGDvoFHTPFYgVGqjsjdcj2MOlJHnGdTKgDqDk03RMRUvCwZ3r41w6scFWV+PZKoE2AkfoMsnNYHNv47ERjZrl1nSwB8EZbtQ4DnMP6OUqjYCrflpwwI6tUQt6lXp9Rl2B1LNY9mpbKECpJvm/yd3TQuPfUIlEdgRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hsGBbsRe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BAMiqMY0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hsGBbsRe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BAMiqMY0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hsGBbsRe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BAMiqMY0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hsGBbsRe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BAMiqMY0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4C9A0218FB;
	Thu,  3 Jul 2025 14:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751553255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3BIEvQ98+7EtulgEZKeCZXYrVl1FI2kRXVooF4palM0=;
	b=hsGBbsReRrMMJMLAYIQoOnDP5q4YCQ2+bA3jtKR07u6sW5A4lbwUIt3fu6RnLiv/punkpE
	AnHyiDxRp2U7pTsoM4/pHlCLIQmMMOJdG4aLgJ8YQab9bcfvjotT82QhpUqYxahsf2JJcW
	1hd2aP3mUh/2WMju3uc+DTm7VjUPGyQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751553255;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3BIEvQ98+7EtulgEZKeCZXYrVl1FI2kRXVooF4palM0=;
	b=BAMiqMY010dF5x3Vz0UlyzVtCBgOEKKBT2TLqs4gVBukJFtogXMTY5pJlBpQEPy2Nn+DCa
	uk0bozZFyxBpvuAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751553255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3BIEvQ98+7EtulgEZKeCZXYrVl1FI2kRXVooF4palM0=;
	b=hsGBbsReRrMMJMLAYIQoOnDP5q4YCQ2+bA3jtKR07u6sW5A4lbwUIt3fu6RnLiv/punkpE
	AnHyiDxRp2U7pTsoM4/pHlCLIQmMMOJdG4aLgJ8YQab9bcfvjotT82QhpUqYxahsf2JJcW
	1hd2aP3mUh/2WMju3uc+DTm7VjUPGyQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751553255;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3BIEvQ98+7EtulgEZKeCZXYrVl1FI2kRXVooF4palM0=;
	b=BAMiqMY010dF5x3Vz0UlyzVtCBgOEKKBT2TLqs4gVBukJFtogXMTY5pJlBpQEPy2Nn+DCa
	uk0bozZFyxBpvuAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CBEB1368E;
	Thu,  3 Jul 2025 14:34:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6n5SDueUZmj+ZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Jul 2025 14:34:15 +0000
Date: Thu, 03 Jul 2025 16:34:13 +0200
Message-ID: <871pqxqr6i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [RFC] Reorganizing HD-audio driver code?
In-Reply-To: <60be4a8c-6147-4e08-9c20-24c54c51851f@opensource.cirrus.com>
References: <87ldpdgzle.wl-tiwai@suse.de>
	<e6451c29-2ade-4b73-bfd7-f48bafccfa98@opensource.cirrus.com>
	<87h5zygawe.wl-tiwai@suse.de>
	<60be4a8c-6147-4e08-9c20-24c54c51851f@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	SUBJECT_ENDS_QUESTION(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Thu, 03 Jul 2025 16:04:29 +0200,
Richard Fitzgerald wrote:
> 
> On 29/06/2025 10:22 am, Takashi Iwai wrote:
> > On Fri, 27 Jun 2025 15:22:20 +0200,
> > Richard Fitzgerald wrote:
> >> 
> >> On 27/06/2025 1:04 pm, Takashi Iwai wrote:
> >>> Hi,
> >>> 
> >>> HD-audio driver is known to be quite messy in both file structures and
> >>> its design, but until now I haven't touched its files paths so much
> >>> because I set a higher priority for the easiness of backport to stable
> >>> kernels.  But, you can't leave garbages forever, it's been already
> >>> high time for a large clean up.
> >>> 
> >>> So I tried a quick code reorganization, and put the result in
> >>> test/hda-reorg branch of sound.git tree.
> >>>     https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=test/hda-reorg
> >>> 
> >>> The basic idea is to move the code from sound/pci/hda/* into different
> >>> subdirectories in sound/hda/ per functionality, as most of the stuff
> >>> are independent from PCI, but rather HD-audio bus specific.
> >>> 
> 
> I tried your branch on a Cirrus development platform. This has an
> out-of-tree patch so was a test of how easily we can apply our backlog
> of patches to the new tree. Good news, it was easy to apply the patch
> (with only very minor conflicts) and audio works.

Good to hear!  Thanks for verification.


Takashi


> 
> Test hardware is Aaeon UpXtreme (WhiskeyLake) + CS8409 + CS35L56
> side-codec amps.
> 
> [    5.155395] snd_hda_codec_cs8409 hdaudioC0D0: CS8409: picked fixup
> for codec SSID 1013:8409
> [    5.155622] snd_hda_codec_cs8409 hdaudioC0D0: Found 4 CSC3556 on
> i2c (-%s:00-cs35l56-hda.%d)
> [    5.159626] snd_hda_codec_cs8409 hdaudioC0D0: bound
> i2c-CSC3556:00-cs35l56-hda.0 (ops cs35l56_hda_comp_ops
> [snd_hda_scodec_cs35l56])
> [    5.159955] snd_hda_codec_cs8409 hdaudioC0D0: bound
> i2c-CSC3556:00-cs35l56-hda.1 (ops cs35l56_hda_comp_ops
> [snd_hda_scodec_cs35l56])
> [    5.160722] snd_hda_codec_cs8409 hdaudioC0D0: bound
> i2c-CSC3556:00-cs35l56-hda.2 (ops cs35l56_hda_comp_ops
> [snd_hda_scodec_cs35l56])
> [    5.160857] snd_hda_codec_cs8409 hdaudioC0D0: bound
> i2c-CSC3556:00-cs35l56-hda.3 (ops cs35l56_hda_comp_ops
> [snd_hda_scodec_cs35l56])
> [    5.161763] snd_hda_codec_cs8409 hdaudioC0D0: autoconfig for
> CS8409: line_outs=1 (0x2c/0x0/0x0/0x0/0x0) type:speaker
> [    5.161769] snd_hda_codec_cs8409 hdaudioC0D0:    speaker_outs=0
> (0x0/0x0/0x0/0x0/0x0)
> [    5.161773] snd_hda_codec_cs8409 hdaudioC0D0:    hp_outs=0
> (0x0/0x0/0x0/0x0/0x0)
> [    5.161777] snd_hda_codec_cs8409 hdaudioC0D0:    mono: mono_out=0x0
> [    5.161779] snd_hda_codec_cs8409 hdaudioC0D0:    inputs:
> [    5.161782] snd_hda_codec_cs8409 hdaudioC0D0:      Mic=0x3c
> 
