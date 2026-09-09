Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780563E315F
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966755; cv=none; b=FuxPX1j6MdOw26R6s75472HyB0WohvQFWUx+eOw/qr4KCll8ELyIiHngOe+4nhxuNvvR2xOUMPQcENDQfsQBURA0Y8ksrh8z5tVyrrAamJtQveAOUt4sbG98/QofIjY8b64R6wHXNwq0Xr3A8eYVfwiHwiuupz4OuOLGIsH9EHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966755; c=relaxed/simple;
	bh=E6zHsk5cqEfMlA4f/lEdF7JO+YXccPr9jve1paSt9wc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A/aPuSw8SNbYl1UNn+DGEUPNpV+xCGe2ywtj0DBaLP9lfklUaQGQbBA6JiifGKQuO2mov54AZ+owiW9O8qTPFWXbnKpU3PPG0Qo2lKqzWHPoDk2E4vKbdNnjd448W9UKEnN/wh0yGxznd9OhpxuvmoiIfwZJWuB5TCF+vLuVmRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hf1NRMfe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e8Fda8R2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zk1gF3p4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aBrRSRxn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hf1NRMfe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e8Fda8R2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zk1gF3p4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aBrRSRxn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C5B0721D0E;
	Wed,  9 Sep 2026 15:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788966747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=guGAX2EIFiZvLA7jb7zR/O01UDDZ6Je2ITnnPHYA0Ew=;
	b=Hf1NRMfe1PAxqKAvsHsSGN8LTqLozzKzAGWq9cz7/4xJBrTTlPwHqf4JG9bTMFAE8pG8IV
	1vogJyBFY18Dk+C30RPfkdiBT3ThszPOBOot9YXP6tUSeVV0eCYSDbzlKX1BIP4TpjiO+M
	zF/5hTxkYkVUU222306l6rK349x/jRA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788966747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=guGAX2EIFiZvLA7jb7zR/O01UDDZ6Je2ITnnPHYA0Ew=;
	b=e8Fda8R2NnpYCGZZmxh9RlctFhi1jmLDcEuyFtP8XyQ+oLkUnRMsmZg+oiSblErh08ts4a
	WrGd9DZNiXCeXaCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zk1gF3p4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=aBrRSRxn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788966742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=guGAX2EIFiZvLA7jb7zR/O01UDDZ6Je2ITnnPHYA0Ew=;
	b=zk1gF3p44Enu5uHkExEJERLRSRQfLl+n+oy+6pVwlogpZ9Ut0Z40Dh9x/GVpfgo9ckYQ7h
	rw4Z+3P4NGHi0rUmtsY5GkVzNR2OTqeFQxDa35WR7tIQymUiloaNaMlpi2uMTUWH/FLRkU
	IYm7zt6HpubtTVm33s1gO9ba9cZ9hmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788966742;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=guGAX2EIFiZvLA7jb7zR/O01UDDZ6Je2ITnnPHYA0Ew=;
	b=aBrRSRxnnb2NKstE6gFCFlpJrx7IxBwDnP81VbDrq0ycOxyDlhJhtUw0bFjp4mvOpv4jj+
	RnVieBiAzYHXpxBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55A9613223;
	Wed,  9 Sep 2026 15:12:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Qx1LE1Z3oWrhRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Sep 2026 15:12:22 +0000
Date: Wed, 09 Sep 2026 17:12:21 +0200
Message-ID: <87pkymmpbe.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: Re: [PATCH v2 02/24] ALSA: compress: register the open file with the card
In-Reply-To: <20260909090949.7503-3-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
	<20260909090949.7503-3-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: C5B0721D0E
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,oss.qualcomm.com,vger.kernel.org,linux.intel.com,linux.dev,nxp.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,intel.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO

On Wed, 09 Sep 2026 11:09:27 +0200,
Peter Ujfalusi wrote:
> 
> The compress-offload device is the only ALSA character device family
> which does not add its open files to the card's file list. Without it
> the core cannot replace the file operations on disconnect, so syscalls
> issued after the card is gone still reach the driver, and a card freed
> with snd_card_free_when_closed() does not wait for the open compress
> streams.
> 
> Call snd_card_file_add() at open and snd_card_file_remove() at release,
> following the ordering used by the PCM, control, rawmidi and hwdep
> devices.
> 
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
