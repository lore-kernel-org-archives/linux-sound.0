Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9517456458
	for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 12:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718280847; cv=none; b=MND40YVK23L3ApgaktxMrgPHakL+XFR2NzRTch31LYSP31XxmEE4BAZhbGfLWvqYINyecBhCKFzX5WFbIcMbnaMG3EMRKngt+/HQOt0K9tDUPYFKTL4PxvCRHdYG5MkEHat/8mshW4SpofMOJv9anbCn4BH9mmBu2kG2L0K4ddA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718280847; c=relaxed/simple;
	bh=PeeNz0WE7K573oW7/1B0ipU0BkgcZqBwM9EgyNZIG2M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PE2k+qoRLtbk8gKNRGl91L0C6WeDzdbA/kxFAPLUBgCaQRfCJ2I6P5SrRPc9BqTpP9DhPbC+ZEQNVb2Myl+Owh8CLjKupUvhs5PcoaQNZ7UQkyJTSOX932uWBhbBQUKhDInXPcEowRHYKOL0QuspEXVu56oFmYsWAxspYx58cUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wT+8CTLH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6QAUIq2f; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wT+8CTLH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6QAUIq2f; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wT+8CTLH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6QAUIq2f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wT+8CTLH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6QAUIq2f"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 76ED9353C3;
	Thu, 13 Jun 2024 12:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718280843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PER2habhxLRgUboMa42sY20EmGtXo6Mfe9DuoVb3XpQ=;
	b=wT+8CTLHKkyNQf/sRuj4gmWaCKlQuz7t/of1oBFV2GjeJDzvYfThkTI8hRNsnp3EQ6fQGi
	lWEQNhtuozBdEqcRzen55tJ+s/rmtKy6BxoXEiEkWMgE9qKGfKPLCw72LJiCMrK+HUYnPP
	O9Qc3c4yQEJhqv1kHalOJYQrqTYf+9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718280843;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PER2habhxLRgUboMa42sY20EmGtXo6Mfe9DuoVb3XpQ=;
	b=6QAUIq2fxVN+jQjHYvJQ9Df1C6ID9jGmkvf1cLzbvkG/EAnknbE95J+3Ik3xggrhpbeWPS
	GZcydDm4kWcjOfDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718280843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PER2habhxLRgUboMa42sY20EmGtXo6Mfe9DuoVb3XpQ=;
	b=wT+8CTLHKkyNQf/sRuj4gmWaCKlQuz7t/of1oBFV2GjeJDzvYfThkTI8hRNsnp3EQ6fQGi
	lWEQNhtuozBdEqcRzen55tJ+s/rmtKy6BxoXEiEkWMgE9qKGfKPLCw72LJiCMrK+HUYnPP
	O9Qc3c4yQEJhqv1kHalOJYQrqTYf+9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718280843;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PER2habhxLRgUboMa42sY20EmGtXo6Mfe9DuoVb3XpQ=;
	b=6QAUIq2fxVN+jQjHYvJQ9Df1C6ID9jGmkvf1cLzbvkG/EAnknbE95J+3Ik3xggrhpbeWPS
	GZcydDm4kWcjOfDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 581A313AA0;
	Thu, 13 Jun 2024 12:14:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p9/vE4viamajIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Jun 2024 12:14:03 +0000
Date: Thu, 13 Jun 2024 14:14:27 +0200
Message-ID: <87cyolnios.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v4 0/2] ALSA: pcm: reinvent the stream synchronization ID API
In-Reply-To: <20240507133551.607171-1-perex@perex.cz>
References: <20240507133551.607171-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Tue, 07 May 2024 15:30:49 +0200,
Jaroslav Kysela wrote:
> 
> Until the commit e11f0f90a626 ("ALSA: pcm: remove SNDRV_PCM_IOCTL1_INFO
> internal command"), there was a possibility to pass information
> about the synchronized streams to the user space. The mentioned
> commit removed blindly the appropriate code with an irrelevant comment.
> 
> The revert may be appropriate, but since this API was lost for several
> years without any complains, it's time to improve it. The hardware
> parameters may change the used stream clock source (e.g. USB hardware)
> so move this synchronization ID to hw_params as read-only field.
> 
> It seems that pipewire can benefit from this API (disable adaptive
> resampling for perfectly synchronized PCM streams) now.
> 
> v3->v4:
>   - more code shuffle as suggested by Takashi
>   - remove unused snd_pcm_empty function in the second patch
>   - put back snd_pcm_set_sync documentation
> 
> v2->v3:
>   - fix pcm_sync_empty() function (wrong comparison) [thanks Takashi Sakamoto]
>   - more documentation for snd_pcm_set_sync_per_card (ID composition)
> 
> v1->v2:
>   - remove union usage per Takashi's request
>   - reduce memory usage
>   - use standard ID generation scheme
> 
> Jaroslav Kysela (2):
>   ALSA: pcm: reinvent the stream synchronization ID API
>   ALSA: pcm: optimize and clarify stream sychronization ID API

Do people have any concerns about this proposal?
Otherwise I'm going to merge them for 6.11.


thanks,

Takashi
