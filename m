Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AF838AC8D
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 08:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781686392; cv=none; b=NMn/HPQ6RqPKGrXma5wHtxEzo4OaPz6ycu9nbpAk9OAWUweIVXaHzVSZo42W0TXKnwI3/4nHoRLk/k1LTMn6bdQww+i3xWYZ2tCHWvApg0Pwg9CsBMDtSw2WarUzKAUskoj9TxTjC3HD8VDffO9jtw3Qw5cVG8dPTlyoylUX+ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781686392; c=relaxed/simple;
	bh=Tr56+HQ7Le3fhj9iwj+QzAzAxLQWHx2fq+cmx68CLhc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p/EohD1PVXDKv0rM5O0tKEh5huGaOgK7U4TJH8kb9A84g2fU2LnVubMEHXCTIj11g/XHIGUsgefB6bQpFpje0ggxdEpfe5b81pkqhF+tYK4UjFlcP4l8CV+d9wRpslYkFgUaLPdeUxggo12gYjsGMRWphV9vxunw8eKFwo+9+2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LxGfehxZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FVqHx1YC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LxGfehxZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FVqHx1YC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LxGfehxZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FVqHx1YC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LxGfehxZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FVqHx1YC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6E2176B6D5;
	Wed, 17 Jun 2026 08:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781686389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U6CpriLP5tEgPbM0Wo1XQUnhHLZC1koASKjaArxLC5c=;
	b=LxGfehxZS55j55PzA4UKwWHEKsya5O4gqFv8ZF3lUMFiZm5fVrJuE+PNlj5gXNzAYQkGgw
	4L3BT9kxaej0p3O37laITWfhem19m0mGOnQRwWITK8sOHU3kY9XDBAWis2xXK0Fkmp6pDC
	8TVrPVZUUe/EeTRa/l31c2frQtGyWls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781686389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U6CpriLP5tEgPbM0Wo1XQUnhHLZC1koASKjaArxLC5c=;
	b=FVqHx1YCWRRULJrGZ0Q+XawBweGbqRP/MxD+v28BjVZ5a2Gxes/ya2yU/xA8xV+pOOhuG7
	m5QXeb7IIVK6TiAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LxGfehxZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FVqHx1YC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781686389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U6CpriLP5tEgPbM0Wo1XQUnhHLZC1koASKjaArxLC5c=;
	b=LxGfehxZS55j55PzA4UKwWHEKsya5O4gqFv8ZF3lUMFiZm5fVrJuE+PNlj5gXNzAYQkGgw
	4L3BT9kxaej0p3O37laITWfhem19m0mGOnQRwWITK8sOHU3kY9XDBAWis2xXK0Fkmp6pDC
	8TVrPVZUUe/EeTRa/l31c2frQtGyWls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781686389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U6CpriLP5tEgPbM0Wo1XQUnhHLZC1koASKjaArxLC5c=;
	b=FVqHx1YCWRRULJrGZ0Q+XawBweGbqRP/MxD+v28BjVZ5a2Gxes/ya2yU/xA8xV+pOOhuG7
	m5QXeb7IIVK6TiAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3820E779A8;
	Wed, 17 Jun 2026 08:53:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id r8hzDHVgMmrFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Jun 2026 08:53:09 +0000
Date: Wed, 17 Jun 2026 10:53:08 +0200
Message-ID: <87tsr1pmyz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Ai Chao <aichao@kylinos.cn>,
	tiwai@suse.com,
	kees@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Show closed for DISCONNECTED state
In-Reply-To: <0888c20f-0a0f-458f-9a73-f05d85ecddaa@perex.cz>
References: <20260617071951.3357788-1-aichao@kylinos.cn>
	<0888c20f-0a0f-458f-9a73-f05d85ecddaa@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6E2176B6D5
X-Spam-Score: -3.51

On Wed, 17 Jun 2026 10:36:44 +0200,
Jaroslav Kysela wrote:
> 
> On 6/17/26 09:19, Ai Chao wrote:
> > Hello Takashi
> > 
> >> Thanks, it's a bit clearer.  But it still means that it's a cargo fix
> >> only for that specific application.  The program should receive an
> >> error for any further syscalls, so that it can close gracefully by
> >> itself.  Or it doesn't work as expected?
> > 
> > The recording software monitors /proc/asound/card0/pcm0c/sub0/status.
> > When the USB device is suddenly disconnected, the recording software fails
> > to capture audio data from the sound card, with both the hardware pointer
> > and application pointer being 0. The software remains in a pending state,
> > continuously displaying "Generating recording file". If the status file shows
> > "closed" (DISCONNECTED), the audio service detects the status change, reinitializes
> > the device, starts processing the recording file, and either resumes recording or
> > notifies the user.
> 
> The PCM API ioctls should return an error in this case (device
> disconnection). Does software communicate with the driver through
> ioctl ? It seems that only mmaped appl/hw pointers are used which is
> not enough to detect the disconnection.

Right, I suspect that it might be the case.
Does the change like below help (or worsen) anything?


Takashi

-- 8< --
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3907,6 +3907,8 @@ static vm_fault_t snd_pcm_mmap_data_fault(struct vm_fault *vmf)
 	if (substream == NULL)
 		return VM_FAULT_SIGBUS;
 	runtime = substream->runtime;
+	if (runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
+		return VM_FAULT_SIGBUS;
 	offset = vmf->pgoff << PAGE_SHIFT;
 	dma_bytes = PAGE_ALIGN(runtime->dma_bytes);
 	if (offset > dma_bytes - PAGE_SIZE)
