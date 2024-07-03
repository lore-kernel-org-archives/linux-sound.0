Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83B13BBEA
	for <linux-sound@vger.kernel.org>; Wed,  3 Jul 2024 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719997007; cv=none; b=oSWqTKYVweiuN/3suVvo97I/3rnL448AtfLgVJdXLIQbqS6BHPiYSQPrajbFuZlmNdfmkz9FEZZ1DzDTqS5zCjupRsCi5VLe+P3WbN4XUD+zsg/FmRKJE7IEbcEZ0/U915FPE+ixFF/h3wr8EvI6yjEkP9qWyGFaDeIOjmaBbOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719997007; c=relaxed/simple;
	bh=iAzAW4hNt5EJ1BB04zO+qp5oik+XysN+Y03/FuhfzYY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hUMDMKAFt5lQ3l4Zj5EfYaetBjOC7Md258WPdQVL1Pyr9uNJnFAlJgV6bNsBKNmAElTA3U3hvdakBmj/ErdMf5MCSoZb9Mgv+EeLoX/smyHRJHlZlTnSAaMct2OQseyzgOt1QfORZpLgNewkJZBMUtheu0dyCA+8DF1Lg9GsFUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CdN5y96o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bgkY9k1m; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CdN5y96o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bgkY9k1m; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CdN5y96o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bgkY9k1m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CdN5y96o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bgkY9k1m"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BFB2A21111;
	Wed,  3 Jul 2024 08:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719997003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NKfbG/WE30MGFlrbHaxqa1Z+tRqVzvjAeno3ZoTbYNo=;
	b=CdN5y96oYD4yUjaf84d2jGcvi+PJKyys39z+zZTpXmwNYQokSe7/lOMCGabwum2e4jTxtX
	g5JhLYCkkqXhBYgzaGSXeKS3GmA0//gSXmMyyaYdAa/YC06Wqk581ZxOk9Zid/ekRnWYCt
	Qmnioo+NLs0p827yHaVy9GnXy6hhzIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719997003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NKfbG/WE30MGFlrbHaxqa1Z+tRqVzvjAeno3ZoTbYNo=;
	b=bgkY9k1mYQ5qjWs2vkfZp44P5u8faRjOwBasAT21x92dWGH8Jvw415TnjuniNdukeGPgM9
	z8c+VJuWbTddtXCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CdN5y96o;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bgkY9k1m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719997003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NKfbG/WE30MGFlrbHaxqa1Z+tRqVzvjAeno3ZoTbYNo=;
	b=CdN5y96oYD4yUjaf84d2jGcvi+PJKyys39z+zZTpXmwNYQokSe7/lOMCGabwum2e4jTxtX
	g5JhLYCkkqXhBYgzaGSXeKS3GmA0//gSXmMyyaYdAa/YC06Wqk581ZxOk9Zid/ekRnWYCt
	Qmnioo+NLs0p827yHaVy9GnXy6hhzIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719997003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NKfbG/WE30MGFlrbHaxqa1Z+tRqVzvjAeno3ZoTbYNo=;
	b=bgkY9k1mYQ5qjWs2vkfZp44P5u8faRjOwBasAT21x92dWGH8Jvw415TnjuniNdukeGPgM9
	z8c+VJuWbTddtXCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9864F13889;
	Wed,  3 Jul 2024 08:56:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X4ZiI0sShWZHTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 03 Jul 2024 08:56:43 +0000
Date: Wed, 03 Jul 2024 10:57:12 +0200
Message-ID: <87v81mzwd3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	Takashi Sakamoto <takaswie@kernel.org>
Subject: Re: [PATCH v7 0/2] ALSA: pcm: reinvent the stream synchronization ID API
In-Reply-To: <20240625172836.589380-1-perex@perex.cz>
References: <20240625172836.589380-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: BFB2A21111
X-Spam-Score: -5.51
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Tue, 25 Jun 2024 19:25:45 +0200,
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
> Note that the contents of ID is not supposed to be used for direct
> comparison with a specific byte sequence. The "empty" case is when
> all bytes are zero (driver does not offer this information)
> and all other cases must be only used for equal comparison among
> PCM streams (including different sound cards) if they are using
> identical hardware clock.
>     
> Cc: Takashi Sakamoto <takaswie@kernel.org>
> 
> v6->v7:
>   - rename sync_flag to std_sync_id per Takashi's request
> 
> v5->v6:
>   - remove wrong line from comment (suggested by Amadeusz)
> 
> v4->v5:
>   - extend commit message (clarification for ID use) for first patch
>   - mark union snd_pcm_sync_id as deprecated
>   - do not use get_unaligned() - reviewers are confused and the code
>     is removed in the second path (optimization)
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
>   ALSA: pcm: optimize and clarify stream synchronization ID API

I merged both patches now to for-next branch.


Thanks!

Takashi
