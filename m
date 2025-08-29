Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4053302767
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 09:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756458979; cv=none; b=FYJjqbalN9YPga/vS9mkogyAwjr6vdkh44YlecRdBhOcmEcm/T54Qf0aMJbMnY4kFSVTIBT61p4/0NffVp1I0+V99KoFrbTocIn5IHpQg43uQ38Fi38vyspMPM36O79wJA9ybIQ0P08ZB6T7V5ikTwoim2KuKSc6GXtDRhzu5VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756458979; c=relaxed/simple;
	bh=4AW22795PvHQsDkLjfK27XfB4sVF3cBZaWlQbzhHRZU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VWrE2NQ9mBxRDLHjhwiJBXitWDzogwcDFzhGkzbXMxTgTnuFEXsQn0yc3iVnr7WhtEaTbaoja8KiBRTHkEGfFo+SQ7c+aT6zTYkrEovbSvOQLpLj/zyWO/r7Ns7TddwZOB65lbtYy4eDJOPJxAqCDTXJGIT/Dq7SORXF7XNohdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mcOWCh83; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tAA2rd82; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kBhBN6B7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z8upxczW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mcOWCh83";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tAA2rd82";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kBhBN6B7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z8upxczW"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D9DB433CA8;
	Fri, 29 Aug 2025 09:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756458975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6C1FFvBI1x8OL+I8cjBSAhJ2L61BMJQCy8tiDgNMzx0=;
	b=mcOWCh83p2t0rsbh1YmMSILSbDsEhvhqK06u/NFO5cIVC8wdSRi4PYjLuC/KMGTH3qNijH
	+v51w+qHMBnGjXg6ItzrxqhGG8Ckl8DLFGYfcK0GpCJ66M0TOKkJc8LdrS5JzVfL2Fa2wp
	jqrs4Z6k4ZZ7GOuq5031U0p/B1GKhNs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756458975;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6C1FFvBI1x8OL+I8cjBSAhJ2L61BMJQCy8tiDgNMzx0=;
	b=tAA2rd826DSQnlqc+2P3cktvPj8SYvfQ9xuxrYd5fuy+PHh6weqGBTtU8GB5216r2oRopC
	+EG3jow3Zwbn1aBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756458973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6C1FFvBI1x8OL+I8cjBSAhJ2L61BMJQCy8tiDgNMzx0=;
	b=kBhBN6B7FWlX0Yi/GDLEBLoEeymmSXxfikvcD0dmq7y/biO75BRh75pUwsu67n5PGKKmgQ
	hLkc1tlqlaYFFv8CxEjCLZ5L99OIJb7NZBYpOg7giByp9rxCqApb6bQDoiBQlGhaAxB9lf
	81lqmiwyxGN1LmwB+TLw49+DRvmaVuo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756458973;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6C1FFvBI1x8OL+I8cjBSAhJ2L61BMJQCy8tiDgNMzx0=;
	b=z8upxczWzE1S/BDrEXGWIFm34vbt8h+xLPJmFLbz+Lzd8sB3rZrFoeZoNG86tfpS3VlGhI
	qH3Qr2bmRuTRREDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B23A913326;
	Fri, 29 Aug 2025 09:16:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AOLPKd1vsWiWLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 09:16:13 +0000
Date: Fri, 29 Aug 2025 11:16:13 +0200
Message-ID: <87zfbih4iq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.17-rc3
In-Reply-To: <b8dbfe9e97c69e8307375219e714c823@kernel.org>
References: <b8dbfe9e97c69e8307375219e714c823@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Fri, 29 Aug 2025 11:09:33 +0200,
Mark Brown wrote:
> 
> The following changes since commit 1b237f190eb3d36f52dffe07a40b5eb210280e00:
> 
>   Linux 6.17-rc3 (2025-08-24 12:04:12 -0400)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-rc3
> 
> for you to fetch changes up to 3e7fd1febc3156d3d98fba229399a13b12d69707:
> 
>   ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op (2025-08-28 21:15:49 +0200)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.17
> 
> The main fixes here are for some of the cleanups done in the core in
> this release, we had broken component lookup in the case with a single
> bus and DMA controller.  Otherwise it's driver specific changes, the
> shortlogs for the Intel WCL and rsnd drivers look like minor cleanups
> but are actually bugfixes (adding an op needed for correct functionality
> and reverting an inappropriate helper usage).

Pulled now.  Thanks.


Takashi
