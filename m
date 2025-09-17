Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC12D2D9ED5
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758117994; cv=none; b=r045cHpQ52iZUXf5ZOSB9aDyXrbqLpmYGYlxIUNzun1owMf5+MycNMx3htOSf2FOWypY+Ip9FxYePwl3mOw/M4su7pZ+uaoa3qdJQHdEIouY4E/n2dl4tvSlEiSfebTN0u+cY0oacbDRQzv9gh2EPtypjz8uFmoNMjmgZYWWoOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758117994; c=relaxed/simple;
	bh=XVKdysU2m7EjLXxqljaLyenvvCcpIxmgNY/ZIxL9yd0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YpUy3gJZZfm7qh2iSm+QvP1fEF0pC9IEiLoPFkOi8rkktAk0Gjp9hzZcEirbphMjLrzlMIrdZk71bNqARfP+Ji0wBrptdCmzgqVP3y83B/Xd5c2KT5vhFNA2ZjVVLp0gwmMAPHdc2x84mjU5o+ryLa28J5sy2fkbWlXOGItABfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y9ChXjBD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oi90Uqaj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y9ChXjBD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oi90Uqaj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y9ChXjBD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oi90Uqaj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y9ChXjBD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oi90Uqaj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7D13E22195;
	Wed, 17 Sep 2025 14:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758117990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wlrwzOKcFh3/PYtgQfnnQhrEaCNJtpaVOCCumLQk0tY=;
	b=Y9ChXjBDo5gnJy/dqyDXBpAkdznYEL+8kDxOPtHc4Nq6z/7r3zmCvpZuVUKfoXzPIeWEdt
	nWcNWH5g+l8o0ZQBV4awID4bVAaAYZQjr4JaTXAa0XUNDEc883X1Jjw9HVsoRmq6mP4iCQ
	Ig6DOGFUKPQ9LvoaUZGWi6MlcOjW4nY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758117990;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wlrwzOKcFh3/PYtgQfnnQhrEaCNJtpaVOCCumLQk0tY=;
	b=oi90UqajgMPq1/wK38jdJnDfAXOG4A7VOnpxKkTdaLhT3HdhlbepH8n8//q2frgu1hjfR2
	Sko2j3ElVv2aYKDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Y9ChXjBD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oi90Uqaj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758117990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wlrwzOKcFh3/PYtgQfnnQhrEaCNJtpaVOCCumLQk0tY=;
	b=Y9ChXjBDo5gnJy/dqyDXBpAkdznYEL+8kDxOPtHc4Nq6z/7r3zmCvpZuVUKfoXzPIeWEdt
	nWcNWH5g+l8o0ZQBV4awID4bVAaAYZQjr4JaTXAa0XUNDEc883X1Jjw9HVsoRmq6mP4iCQ
	Ig6DOGFUKPQ9LvoaUZGWi6MlcOjW4nY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758117990;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wlrwzOKcFh3/PYtgQfnnQhrEaCNJtpaVOCCumLQk0tY=;
	b=oi90UqajgMPq1/wK38jdJnDfAXOG4A7VOnpxKkTdaLhT3HdhlbepH8n8//q2frgu1hjfR2
	Sko2j3ElVv2aYKDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B0B7137C3;
	Wed, 17 Sep 2025 14:06:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /0/4EGbAymiQAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Sep 2025 14:06:30 +0000
Date: Wed, 17 Sep 2025 16:06:29 +0200
Message-ID: <87h5x1cgwq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Luca Weiss" <luca.weiss@fairphone.com>
Cc: "Takashi Iwai" <tiwai@suse.de>,
	<linux-sound@vger.kernel.org>,
	"Arnd Bergmann"
 <arnd@kernel.org>
Subject: Re: [PATCH] ALSA: usb: qcom: Fix false-positive address space check
In-Reply-To: <DCV4O98LHJW2.1HVRG1E5C10DY@fairphone.com>
References: <20250917130909.8211-1-tiwai@suse.de>
	<DCV4O98LHJW2.1HVRG1E5C10DY@fairphone.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 7D13E22195
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Wed, 17 Sep 2025 15:59:55 +0200,
Luca Weiss wrote:
> 
> Hi Takashi,
> 
> On Wed Sep 17, 2025 at 3:09 PM CEST, Takashi Iwai wrote:
> > The sanity check previously added to uaudio_transfer_buffer_setup()
> > assumed the allocated buffer being linear-mapped.  But the buffer
> > allocated via usb_alloc_coherent() isn't always so, rather to be used
> > with (SG-)DMA API.  This leaded to a false-positive warning and the
> > driver failed to work.
> >
> > Actually uaudio_transfer_buffer_setup() deals only with the DMA-API
> > addresses for MEM_XFER_BUF type, while other callers of
> > uaudio_iommu_map() are with pages with physical addresses for
> > MEM_EVENT_RING and MEM_XFER_RING types.  So this patch splits the
> > mapping helper function to two different ones, uaudio_iommu_map() for
> > the DMA pages and uaudio_iommu_map_pa() for the latter, in order to
> > handle mapping differently for each type.  Along with it, the
> > unnecessary address check that caused probe error is dropped, too.
> 
> Thanks for fixing this, and Arnd for the help!
> 
> > Fixes: 3335a1bbd624 ("ALSA: qc_audio_offload: try to reduce address space confusion")
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > Reported-and-tested-by: Luca Weiss <luca.weiss@fairphone.com>
> 
> I don't know if https://www.kernel.org/doc/html/latest/process/maintainer-tip.html
> is applicable to also sound subsystem or the whole tree but maybe
> separate tags are simpler?
> 
> Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>

It's only for tip tree.
Reported-and-tested-by tag is commonly used.


Takashi
