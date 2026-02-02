Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653DF273D77
	for <linux-sound@vger.kernel.org>; Mon,  2 Feb 2026 16:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770050625; cv=none; b=pdXzipJTR98szkTeNC3b3XG5KdcWBImQzZy7KXUfnxg3mh52nWfMtWxx1JG/sJFbmrqVX1dFwh8qhD9dmSN0+JOGR8FYJ5HDZuVTSmHwa/CXo0on6vWC5GScSpboKE7c2/bb9e9vpbfIznBX2f3xKyQHr4XkURuruINNL9mxNGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770050625; c=relaxed/simple;
	bh=X+zwBb7Cx/oDTUOKkRH4wLbAkJtbpPQ1akv3Vg0mV3Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cBgNpw5d35wdR9zNzSyAbKE3IaqiZOv5iGHgelkz26BhzcWHWOCXgtSJDuopS+NeMk6AFdMXOL6NCt/1WSHkSiIHSQg/nP4PLWq5FGSSvPnp4vqyjz+q89c7Z26aj1KlfV8zO2q8oXDWVb7lOPwnEoKdmkFmEpGAEvXpfxcESYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eycoi7qB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+V5fA8qF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eycoi7qB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+V5fA8qF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eycoi7qB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+V5fA8qF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eycoi7qB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+V5fA8qF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 97D3F35362;
	Mon,  2 Feb 2026 16:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770050622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+oii4eRJjUemW+iZaRpfyy5dwD3hIO+YJBvSiVYFDA0=;
	b=eycoi7qBo2MXQv445dLjHEdISfTPwnxcHXFQDBuNxckdqDmoVRf0/pV+mh2jKh2GES43we
	ojQW1evKn7IZ0fgSYNegN0sQn0ihRQ5eS4lGjtgu9gORJp0BFelPUJh37Hc4t8hZc6yj7A
	DO54yS377fparwJ7VDNkn/GgN+DDsXc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770050622;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+oii4eRJjUemW+iZaRpfyy5dwD3hIO+YJBvSiVYFDA0=;
	b=+V5fA8qFn7+A7B5k+b8GtvRs1yPIujkiUu7rggWSbuyOzFfgEC3KF/+FtliBZ7qaC69W5R
	dToj3sGxZRRnLYCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eycoi7qB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+V5fA8qF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770050622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+oii4eRJjUemW+iZaRpfyy5dwD3hIO+YJBvSiVYFDA0=;
	b=eycoi7qBo2MXQv445dLjHEdISfTPwnxcHXFQDBuNxckdqDmoVRf0/pV+mh2jKh2GES43we
	ojQW1evKn7IZ0fgSYNegN0sQn0ihRQ5eS4lGjtgu9gORJp0BFelPUJh37Hc4t8hZc6yj7A
	DO54yS377fparwJ7VDNkn/GgN+DDsXc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770050622;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+oii4eRJjUemW+iZaRpfyy5dwD3hIO+YJBvSiVYFDA0=;
	b=+V5fA8qFn7+A7B5k+b8GtvRs1yPIujkiUu7rggWSbuyOzFfgEC3KF/+FtliBZ7qaC69W5R
	dToj3sGxZRRnLYCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 688043EA62;
	Mon,  2 Feb 2026 16:43:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z55CGD7UgGncSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Feb 2026 16:43:42 +0000
Date: Mon, 02 Feb 2026 17:43:41 +0100
Message-ID: <87jywvyu2q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ingyu Jang <ingyujang25@korea.ac.kr>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [Question] Dead code in ALSA drivers - functions always returning 0?
In-Reply-To: <20260131081431.2920839-1-ingyujang25@korea.ac.kr>
References: <20260131081431.2920839-1-ingyujang25@korea.ac.kr>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -2.51
X-Rspamd-Queue-Id: 97D3F35362
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Sat, 31 Jan 2026 09:14:31 +0100,
Ingyu Jang wrote:
> 
> Hi,
> 
> I noticed several ALSA driver functions that always return 0, but their
> return values are still checked by callers. I wanted to ask whether
> these are intentional defensive coding or could be cleaned up.
> 
> 1. sound/isa/cs423x/cs4236.c - snd_cs423x_pnp_init_mpu()
>    This function handles pnp_activate_dev() failure internally by
>    setting mpu_port[dev] = SNDRV_AUTO_PORT, then always returns 0.
>    The caller checks "< 0" which can never be true.
> 
> 2. sound/pci/ice1712/ice1712.c - snd_ice1712_chip_init()
>    Always returns 0. Callers check "< 0" in snd_ice1712_create()
>    and the PM resume path.
> 
> 3. sound/pci/ice1712/ice1724.c - snd_vt1724_chip_init()
>    Always returns 0. Similar pattern to ice1712.
> 
> 4. sound/pci/vx222/vx222_ops.c - put_xilinx_data()
>    Always returns 0. Caller vx2_load_xilinx_binary() checks "< 0".
> 
> Are these intentional for potential future error handling, or could
> the return value checks be removed?

Those are for potential error handling that may be added in future.
But, given that those are all pretty old code, the chance of
extensions should be very low.  OTOH, all those are static local
functions and the compiler should reduce things appropriately.

So, if any, we may clean them up, but the gain would be very small,
likely negligible.


thanks,

Takashi
