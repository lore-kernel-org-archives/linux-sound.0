Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D7671B4F
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715085176; cv=none; b=Y+jz5+/w9Vw3Xrdxr4jucC/hQkNJ0FbnpnRvhmPqCxYvsbEnqocBv5DjhNDoCKedHwUQl4hqECyyspvjriGjDkXgPSOVVMlFzSfscOBoEyoynzePF5Em5i4yz5V9ki3sT3BMxC362p0jI2gphhh9J9SsA2DwJ/sqovOKt/2EJl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715085176; c=relaxed/simple;
	bh=Um2uX4tCIb0NjzSFee/c26JKu0947CpAStT7bJDXGrE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k7niLtZp815hzd56toBNEZlQj8ovJ27Xc0Itj57FVoOUjerDaEAgsdEZgQRIn9dX/6IkJZeCg3FoWGKgN4Ddj4FQypLG/O2v0i0fpkniN0jdx0ObGX7d0p3MlOqYMujQstyUAQHRCcmB1wffoAaomsHc1l1uo9M63QRCyQ578Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ib83HnA4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E8HokFyi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ib83HnA4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E8HokFyi; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ib83HnA4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E8HokFyi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ib83HnA4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E8HokFyi"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BF313209BA;
	Tue,  7 May 2024 12:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715085172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2zDOphM0pW2gPAKXk4WSFCkrZC0mEj/vVBj7FRQlO9k=;
	b=ib83HnA4wrlxboCromPZl12W8qRmKc5TGgUoFhuk3YFbNj/GQh6eB2ovfB6/nK0neuy94L
	L2Ad3M81MrU0FKRoOukBfwBgN51m6OrPfF28Z0LoCFqx8NaqB5qQ+27yHZBSIXDOO6a5sl
	1nFLbcuBa777cp8vhRj6LflbBqFeJ0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715085172;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2zDOphM0pW2gPAKXk4WSFCkrZC0mEj/vVBj7FRQlO9k=;
	b=E8HokFyiaXXJ9Qp7VVaShri/Ywz7pKunlEI+iAvhQM7wConCWDqp4jvmG2WcWNOz7zVUcf
	l+/ED1/K3+m591Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715085172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2zDOphM0pW2gPAKXk4WSFCkrZC0mEj/vVBj7FRQlO9k=;
	b=ib83HnA4wrlxboCromPZl12W8qRmKc5TGgUoFhuk3YFbNj/GQh6eB2ovfB6/nK0neuy94L
	L2Ad3M81MrU0FKRoOukBfwBgN51m6OrPfF28Z0LoCFqx8NaqB5qQ+27yHZBSIXDOO6a5sl
	1nFLbcuBa777cp8vhRj6LflbBqFeJ0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715085172;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2zDOphM0pW2gPAKXk4WSFCkrZC0mEj/vVBj7FRQlO9k=;
	b=E8HokFyiaXXJ9Qp7VVaShri/Ywz7pKunlEI+iAvhQM7wConCWDqp4jvmG2WcWNOz7zVUcf
	l+/ED1/K3+m591Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB38413A2D;
	Tue,  7 May 2024 12:32:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lnspKXQfOmaYFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 12:32:52 +0000
Date: Tue, 07 May 2024 14:33:07 +0200
Message-ID: <87msp1er98.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	Takashi Sakamoto <takaswie@kernel.org>
Subject: Re: [PATCH v3 1/2] ALSA: pcm: reinvent the stream synchronization ID API
In-Reply-To: <20240507083142.557299-2-perex@perex.cz>
References: <20240507083142.557299-1-perex@perex.cz>
	<20240507083142.557299-2-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
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
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Tue, 07 May 2024 10:26:18 +0200,
Jaroslav Kysela wrote:
> +/**
> + * is sync id (clock id) empty?
> + */
> +static inline bool pcm_sync_empty(const unsigned char *sync)
> +{
> +	return get_unaligned((__u64 *)(sync + 0)) == 0 && get_unaligned((__u64 *)(sync + 8)) == 0;
> +}

This helper is needed only in one place, so we don't have to put in
the common header.  Let's move to a local place (together with
unaligned.h inclusion).


> @@ -1810,6 +1808,16 @@ static int snd_pcm_lib_ioctl_fifo_size(struct snd_pcm_substream *substream,
>  	return 0;
>  }
>  
> +static int snd_pcm_lib_ioctl_sync_id(struct snd_pcm_substream *substream,
> +				     void *arg)
> +{
> +	struct snd_pcm_hw_params *params = arg;
> +
> +	if (pcm_sync_empty(params->sync))
> +		memcpy(params->sync, &substream->runtime->sync, sizeof(params->sync));

Since sync is an array now, shouldn't we drop '&' here?


thanks,

Takashi
