Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C223D524F;
	Tue, 25 Aug 2026 08:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787644941; cv=none; b=NvuMbd2THXdmTpLagME7xnDHHpdZ7MMnKXz7CwByxrkHLqsWJQo0q1CkJ06RtYQoGi02huRAX+yX+ClOsILV93K22Z+meK7VJbje3S2y5YbWNuGXkAwBJQRH3cSQzCZCrQYgo3wmeyXJ3ejwYnbvSCsmGVX1LbWWZeu3huB9viU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787644941; c=relaxed/simple;
	bh=QP2JaDM/A/eSOJ+f6spEJ1n4IRoLWbdwjm494gYyv+Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o2pRuBaTySiLhZutt0XLV8mTOFCpLtJaVe/F0EHfuzFQ96Jy0mFDVNJgBU7+9D+UuALIeDN9EmxpewIFGeJDB9X8+F1GGJpTjAJ84LFwY0kq/OyecVEG4rXnOll3V/DdNqW6/y0cfP2qgUjCdiT/kgPLZuiaOlYYeqfewHeTkr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o8euLOeN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vqZEnqvE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pNzQnWN1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BZSG0oE8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o8euLOeN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vqZEnqvE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pNzQnWN1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BZSG0oE8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C45EC86D88;
	Tue, 25 Aug 2026 08:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787644933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=us420zcxTLx6R86hGGnswpe3fvW/TBr+YDM6yctJ3fE=;
	b=o8euLOeNSplrCxxXptNOsGyuwmmRUfCNHYQsFG4hxOlgAZS6gjr90V1aQHI+OA4aaCpFwS
	Rm8RN4vtKzw1bK44/c7PDt7rEiQrkPGGvBo5XFQgTb9kKt0Gqw2YdqIz6qEdrgYXJ0lACT
	ia4B67fhUx9rQlkx5ATNNWZgGT5D6UE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787644933;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=us420zcxTLx6R86hGGnswpe3fvW/TBr+YDM6yctJ3fE=;
	b=vqZEnqvEP06YmHs8dHjL9aMCYXL409Z5HqyIOar34VtE5C98dBmA9eaKhGH+JPRRjuE8KU
	UC960AJp+ooZrUCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787644929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=us420zcxTLx6R86hGGnswpe3fvW/TBr+YDM6yctJ3fE=;
	b=pNzQnWN10M3dc1gNDoQPg1z9CLwZx4Mg4VDCjU9EM/O6MRcPLWDQ60BVHim8jmJlfkMnSE
	Qv+g+Sy8k7NtqL7ZuYfSAe1WPx699ReKI2OfZCvoB+PA+V5d3Un6WBvtRJLEguLYZYMwJ1
	GXQKEBHUSFeP4I+IBEGTPzM1OlNIibc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787644929;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=us420zcxTLx6R86hGGnswpe3fvW/TBr+YDM6yctJ3fE=;
	b=BZSG0oE8b8iikqQ2lIr43K1gta2AwzdfJwL/q+To8RAkQ/Y08fX7OIvNGo4zFiNF33DHbx
	vfcIYt+tNAq2fqBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9136513335;
	Tue, 25 Aug 2026 08:02:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 99FUIgFMjWodcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Aug 2026 08:02:09 +0000
Date: Tue, 25 Aug 2026 10:02:09 +0200
Message-ID: <87fr02typq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Oliver Neukum <oneukum@suse.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Complete cleanup after system-resume errors
In-Reply-To: <20260824225757.26749-1-mrwillporter@gmail.com>
References: <20260824225757.26749-1-mrwillporter@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.963];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.29
X-Spam-Level: 

On Tue, 25 Aug 2026 00:57:57 +0200,
Will Porter wrote:
> 
> A failed system resume can leave the card unusable until reboot.
> usb_audio_resume() jumps to err_out when snd_usb_pcm_resume() or
> snd_usb_mixer_resume() fails. The error path skips the out: block, which
> restores D0 and decrements chip->num_suspended_intf.
> 
> The card stays in SNDRV_CTL_POWER_D3hot, so later control access blocks in
> snd_power_ref_and_wait(). USB core logs an interface resume callback error.
> It does not retry that callback, so a later callback cannot complete the
> skipped cleanup.
> 
> usb_audio_suspend() increments num_suspended_intf before returning success.
> A system-resume callback must consume the system-suspend count even if a
> component resume fails. Otherwise, the stranded count skews later suspend
> and resume cycles.
> 
> Do not apply this cleanup to runtime-resume errors. Runtime PM can retry
> -EAGAIN or -EBUSY without another suspend callback. The count must continue
> to describe that suspended interface. Other runtime-resume errors latch
> runtime_error in the PM core and do not cause an immediate callback retry.
> 
> Both parts of the system-resume error path are longstanding. Commit
> 88a8516a2128a ("ALSA: usbaudio: implement USB autosuspend") introduced
> err_out past the D0 restore. Commit 862b2509d157c ("ALSA: usb-audio: Fix
> inconsistent card PM state after resume") later moved
> num_suspended_intf-- into the out: block. The error path now skips both
> operations.
> 
> No third-party code is needed to reach the error path.
> snd_usb_mixer_resume() ends in snd_usb_mixer_activate(), which returns the
> result of usb_submit_urb() for devices that have a mixer status URB. Its
> mixer->private_resume hook can also fail through scarlett2_init_notify().
> snd_usb_pcm_resume() issues a SET_CUR request to a UAC3 power domain. It
> can return -EPIPE or -EIO when the device stalls the request.
> 
> Route a component error through out: only when system_suspend is nonzero.
> Continue to return runtime-resume errors through err_out. Later component
> resume stages remain skipped. The original error still reaches USB core.
> A later transfer can fail if the device did not recover.
> 
> I reproduced the system-resume failure on an Audient iD14 MkI with an
> out-of-tree diagnostic mixer resume hook. An injected -EIO on the unpatched
> core left control readers in uninterruptible sleep in
> snd_power_ref_and_wait() until a reboot. With this patch, the same failure
> restored control access. A second system suspend and resume also succeeded
> after I disabled fault injection.
> 
> Assisted-by: Claude:claude-opus-5
> Assisted-by: Antigravity:gemini-3.1-pro-high
> Assisted-by: Codex:gpt-5.6-sol
> Fixes: 88a8516a2128a ("ALSA: usbaudio: implement USB autosuspend")
> Fixes: 862b2509d157c ("ALSA: usb-audio: Fix inconsistent card PM state after resume")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Will Porter <mrwillporter@gmail.com>

Applied now.  Thanks.


Takashi
