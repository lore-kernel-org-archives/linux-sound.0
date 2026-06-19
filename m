Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7C243AB0
	for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781876067; cv=none; b=JQ1HGEyhM9KfKW1MznxtEih8EWAhuqFJasFuL7b4bJcZaTjTOnPZQN0VWqV4un1DhBraip8DwpyuobRJ4AaiRvY3WAa/J2bXKKJitz+e4WsF66PlR+AZKXO8SdN0SG4d9bwlv7Nlj1JL5Gnc1rFLUrKekb9qvrWQQH3gwx6FCM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781876067; c=relaxed/simple;
	bh=U9Ky3OGwzH8o7lzfPH8LeOEWqgKKNN9COZzyzCIgLsg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jPiq0ceW1BMfWMSileYI5sr0Js6fG5D76/xK4Edyl0JbR2dVCiyytuF9/gc465iy8ZGRePwf4YEq0/o0ZN0Pu/ujLDrt68FAvOEJI4IxQ0mJPuJVeL5Z4Qp2IP/eJ4beBCCc3cojKADnTbfcaIb3OZJsO1pLsr7jASFI14JPWfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cNBmVyeB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zRGojd0V; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cNBmVyeB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zRGojd0V; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cNBmVyeB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zRGojd0V";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cNBmVyeB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zRGojd0V"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DE02F75F1C;
	Fri, 19 Jun 2026 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781876062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DtcKKJNSDfUeu/7NM884e4hVARvY72JnCeji8e8f2Hw=;
	b=cNBmVyeBqYgE2qiYTWvTGhauJRXVPXKVy9g0iYKm9XA+v8l5hXyt7Ok8aU1gYrZYBemv//
	6S8f4y0t8n36Z26RryXN9QCl2+ldlCkilYa8yG1Hj9hCJIx8wp8ftbOAMQelVsmeFkeEMz
	qcwn8gZRQbCGtuB1KwtY66nVTJRPoig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781876062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DtcKKJNSDfUeu/7NM884e4hVARvY72JnCeji8e8f2Hw=;
	b=zRGojd0Vip6oPIT5F80oErqhJ8II72gaC1+5zr6CWze47B6qe46+bvAzEg9FmvlJh5cB1q
	0G/pbwi4X9QUJ3CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781876062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DtcKKJNSDfUeu/7NM884e4hVARvY72JnCeji8e8f2Hw=;
	b=cNBmVyeBqYgE2qiYTWvTGhauJRXVPXKVy9g0iYKm9XA+v8l5hXyt7Ok8aU1gYrZYBemv//
	6S8f4y0t8n36Z26RryXN9QCl2+ldlCkilYa8yG1Hj9hCJIx8wp8ftbOAMQelVsmeFkeEMz
	qcwn8gZRQbCGtuB1KwtY66nVTJRPoig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781876062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DtcKKJNSDfUeu/7NM884e4hVARvY72JnCeji8e8f2Hw=;
	b=zRGojd0Vip6oPIT5F80oErqhJ8II72gaC1+5zr6CWze47B6qe46+bvAzEg9FmvlJh5cB1q
	0G/pbwi4X9QUJ3CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ADA5B779A8;
	Fri, 19 Jun 2026 13:34:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UokDKV5FNWr/ZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Jun 2026 13:34:22 +0000
Date: Fri, 19 Jun 2026 15:34:22 +0200
Message-ID: <87pl1mirhd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Show closed for DISCONNECTED state
In-Reply-To: <20260619092936.806715-1-aichao@kylinos.cn>
References: <20260619092936.806715-1-aichao@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Fri, 19 Jun 2026 11:29:36 +0200,
Ai Chao wrote:
> 
> Hello Takashi
> 
> > Right, I suspect that it might be the case.
> > Does the change like below help (or worsen) anything?
> 
> We tested this solution and verified its feasibility.

OK, then I'm going to submit a proper patch later.

As it's a bit drastic change and it's already in a merge window for
7.2, I'd postpone the fix for 7.3.


thanks,

Takashi

> 
> Thanks,
> Ai Chao
> 
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -3907,6 +3907,8 @@ static vm_fault_t snd_pcm_mmap_data_fault(struct vm_fault *vmf)
>      if (substream == NULL)
>          return VM_FAULT_SIGBUS;
>      runtime = substream->runtime;
> +    if (runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
> +        return VM_FAULT_SIGBUS;
>      offset = vmf->pgoff << PAGE_SHIFT;
>      dma_bytes = PAGE_ALIGN(runtime->dma_bytes);
>      if (offset > dma_bytes - PAGE_SIZE)
> 
