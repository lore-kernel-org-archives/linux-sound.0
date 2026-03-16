Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A969413A3ED
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 17:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773680797; cv=none; b=Hnl90d7Bqsn1fqgGaSGtrea7l9gk3l+zxpir9yDUNQdSko9ki8vuSuMd5l7TOGo47a0cf9+cSnKpx4dKp/qCBPt6HF7SQt70CyUGhdpeQicz2h1ZfcDd1OY7Cv4B+ESoh0asaIlq9H86Tcv4QnkKWq+WrNUdG6HLjln8Vx4yFh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773680797; c=relaxed/simple;
	bh=44aeCRI3/rO0S3sFWuNkDoc5HtZSDwwll6GofcoZJaU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EML1GilDFoDxzuC33tzwI5kVyP4nzRisIQ9feTgpsyHSqg6JPquLmW/kVJuvDwj71qZnME85NVmb6lTAhiBtiX2z6vg7nFXqxL0eR6ZdXemGM4NLTwX0i6JmWhi0JYDXvViVyWUG0M6J8AT+3vqW0G7xTCgAHQjP4WKFLGchLls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wg5fJhDn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ETH+PMn8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CdPuubOQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tpDuIzxp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wg5fJhDn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ETH+PMn8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CdPuubOQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tpDuIzxp"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EC7335BE1B;
	Mon, 16 Mar 2026 17:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773680795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fafz/xzTuVvKetn1aRrFpDufGEZmG7DAdSqF8u/2tvY=;
	b=Wg5fJhDnvE9Lr8PHN5jZMYNSbrfWcZh40TfETga3OlpiUH49NcAJ5FwuY/34eiSMw/evZk
	BXQNgUffOflNGdmv9L1SBdrk8+3QzmDh+atjetQlNYRP/UST2K0mytLipN7W1nKBKLW85i
	4gT4iFLoyGJymBuRXbDPS1TcUFujpdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773680795;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fafz/xzTuVvKetn1aRrFpDufGEZmG7DAdSqF8u/2tvY=;
	b=ETH+PMn855L/D/iqqbpOUKrnccxb15q83wFuFvfCH2dmxnRUvPduIT1jspNB327w5toxqj
	aPydii0DsFw9iwBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CdPuubOQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tpDuIzxp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773680794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fafz/xzTuVvKetn1aRrFpDufGEZmG7DAdSqF8u/2tvY=;
	b=CdPuubOQKTvzY38NP63nApjOBLXS7dKuvv31R5BVbQ10H4fHLBtqL5u4V5yt5XBFmvp2OS
	1Kik54Zv9yOxydxDQt539xy5Rlf7QtPA4ndIEar7CR1oOe3jr2jO982ZWsKATwhnLbhTat
	/W92QApoZKifqB3HEmZ2nWIo5ciMFjU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773680794;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fafz/xzTuVvKetn1aRrFpDufGEZmG7DAdSqF8u/2tvY=;
	b=tpDuIzxpXa2BuDJmXTCTfVmGf912MkYlMzXSsw6kprgxV9T33cEeGV3pFWaeLPwFNWBRy5
	s8UNYoCWDQ27eYCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 993D64273B;
	Mon, 16 Mar 2026 17:06:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dRwtJJo4uGloQwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Mar 2026 17:06:34 +0000
Date: Mon, 16 Mar 2026 18:06:34 +0100
Message-ID: <87jyvb7lgl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	chleroy@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	r33s3n6@gmail.com,
	gality369@gmail.com,
	zhenghaoran154@gmail.com,
	hanguidong02@gmail.com,
	ziyuzhang201@gmail.com
Subject: Re: [PATCH v2] ALSA: pcm: oss: use proper stream lock for runtime->state access
In-Reply-To: <20260316085047.2876451-1-zzzccc427@gmail.com>
References: <20260316085047.2876451-1-zzzccc427@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,kernel.org,suse.com,vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:32098, ipnet:2800::/6, country:US];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Queue-Id: EC7335BE1B
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 16 Mar 2026 09:50:47 +0100,
Cen Zhang wrote:
> 
> __snd_pcm_set_state() writes runtime->state under the PCM stream lock.
> However, the OSS I/O functions snd_pcm_oss_write3(), snd_pcm_oss_read3(),
> snd_pcm_oss_writev3() and snd_pcm_oss_readv3() read runtime->state
> without holding the stream lock, only holding oss.params_lock (a
> different mutex that does not synchronize with the stream lock).
> 
> Since __snd_pcm_set_state() is called from IRQ context (e.g.,
> snd_pcm_period_elapsed -> snd_pcm_update_state -> __snd_pcm_xrun ->
> snd_pcm_stop -> snd_pcm_post_stop) while the OSS read/write paths
> run in process context, these are concurrent accesses that constitute
> a data race.
> 
> Rather than using READ_ONCE()/WRITE_ONCE() barriers, introduce a
> snd_pcm_get_state() helper that reads runtime->state under the stream
> lock, matching the locking discipline used elsewhere in the PCM layer.
> Also export snd_pcm_set_state() for completeness.
> 
> Use snd_pcm_get_state() in all four OSS I/O functions, caching the
> result in a local variable where the same snapshot is used for
> multiple comparisons to avoid taking the lock repeatedly.
> 
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
