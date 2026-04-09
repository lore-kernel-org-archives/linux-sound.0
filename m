Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CCE358381
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728982; cv=none; b=gqHzA9r71hJpFNguJ+c6Ub6KqJSmbsbopvZdDJO6Mfe86BRu01rYp9LR3abS1+GNxNf/OWRf7z4Na2i7Xm0RXGdm48xHFny18YSxiZlNwuO1bHILQSBVmctbNwf43V1qLIupgLR36yv0axwkN/R1mFJ7Ok1neIWFi29dKxPZwSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728982; c=relaxed/simple;
	bh=J77Fnymkg/hHheAWI4O5diB25l9K4ix1TqZPmj4kHhU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JUdPmh4ihwn4sCkhbiA0tUuApb96mWZVIcHABs5/thDTFDeXDpOk9MIGP56/rpnhg1ds09BzYmGcC1bbdHk8jENKzNe7q+UT+lmZiEF3ZtT5MM97t3Njr4TIbqXe/Z4ak6pyd+MfOSBFua3phDDOO4gdDGCrQmU4U29GeSUmNs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yVhAbOz9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=j79YeIf1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yVhAbOz9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=j79YeIf1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yVhAbOz9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j79YeIf1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yVhAbOz9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j79YeIf1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AC0BA4EE94;
	Thu,  9 Apr 2026 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775728979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S96bZe6W40wT9HcZAKUzimNxUqFCM24bag2UIuwCIEM=;
	b=yVhAbOz95h5aPCIgNUCDPry41/AlVw4iKsuZhnB2UIQ/u5Bs9+DqeTbmXCErlFRCDmwtuy
	atiiiBd85JHrhaKZahTeCFdyDgNfdMiWxxapRJ86tHQtjeB/Ttalie8vWjFBNYvQP7FZ+O
	bono/EQnwS8H7x9VDMxwjLKK1oL0VT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775728979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S96bZe6W40wT9HcZAKUzimNxUqFCM24bag2UIuwCIEM=;
	b=j79YeIf1eBaxlw9DHarUI0mjhvgDIDnmIwJyvfNGA7FZS3N2AVW3/1F8JPGnOr09tDb6L1
	KuUwsyXsb3zekkBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775728979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S96bZe6W40wT9HcZAKUzimNxUqFCM24bag2UIuwCIEM=;
	b=yVhAbOz95h5aPCIgNUCDPry41/AlVw4iKsuZhnB2UIQ/u5Bs9+DqeTbmXCErlFRCDmwtuy
	atiiiBd85JHrhaKZahTeCFdyDgNfdMiWxxapRJ86tHQtjeB/Ttalie8vWjFBNYvQP7FZ+O
	bono/EQnwS8H7x9VDMxwjLKK1oL0VT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775728979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S96bZe6W40wT9HcZAKUzimNxUqFCM24bag2UIuwCIEM=;
	b=j79YeIf1eBaxlw9DHarUI0mjhvgDIDnmIwJyvfNGA7FZS3N2AVW3/1F8JPGnOr09tDb6L1
	KuUwsyXsb3zekkBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 828B64A0B3;
	Thu,  9 Apr 2026 10:02:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JEiOHlN512kvdAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 10:02:59 +0000
Date: Thu, 09 Apr 2026 12:02:59 +0200
Message-ID: <878qawjvsc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: msnd: add suspend/resume support
In-Reply-To: <20260409-msnd-pm-support-v1-0-2abef720d0e7@gmail.com>
References: <20260409-msnd-pm-support-v1-0-2abef720d0e7@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Thu, 09 Apr 2026 07:07:44 +0200,
Cássio Gabriel wrote:
> 
> The msnd drivers still have no system-sleep callbacks, and the shared
> driver file still carries a FIXME for suspend/resume. Probe already
> depends on rebuilding volatile device state by resetting the DSP,
> uploading firmware, reinitializing shared memory, restoring mixer
> settings, and calibrating the ADC. Without matching PM callbacks, the
> driver has no defined way to recover that state after suspend.
> 
> This small series adds the missing suspend/resume support with the
> minimum scope needed for the current driver.
> 
> Patch 1 prepares the driver for PM by:
> - accepting SNDRV_PCM_TRIGGER_SUSPEND in the PCM trigger callbacks
> - factoring the IRQ enable/disable bodies and adding a helper that can
>   quiesce or rearm the shared IRQ without disturbing irq_ref
> - restoring cached master-volume values when mixer state is rebuilt
>   after DSP reinitialization
> 
> Patch 2 adds the actual PM callbacks by:
> - saving the current capture-source selection and msnd-side MIDI input
>   state
> - adding shared card suspend/resume helpers
> - wiring those helpers into the ISA driver and the Pinnacle PnP card
>   driver with the current callback signatures
> 
> The series intentionally does not add trigger-level PCM resume support.
> The driver can rebuild hardware state on system resume, but it does not
> preserve enough runtime queue state to justify advertising full
> SNDRV_PCM_INFO_RESUME semantics in this change.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
> Cássio Gabriel (2):
>       ALSA: msnd: prepare system sleep support
>       ALSA: msnd: add ISA and PnP system sleep callbacks

Applied both patches to for-next branch.  Thanks.


Takashi
