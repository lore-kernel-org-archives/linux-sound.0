Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1404C19D88B
	for <linux-sound@vger.kernel.org>; Fri, 20 Dec 2024 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734684792; cv=none; b=H6hFKQfKE4XhM5CdQf8CF3xxkgOlRekfWUBPJFd9lXCtz3KllQ2R4JSvzjWRrzgF4BHONjSR+zPxyPyEvb9Ve4l3g1zHZtbf2dm9yjs/5wOPwtfgP7c2FtypmlwPp5S274htDaZLBel42SLcDZdq5D1LjcIcWgPDqj9bLA8iZGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734684792; c=relaxed/simple;
	bh=kDBDLrCQCPdZ7qeOEicELq2DHXvzpJioE9/Qkh5YLy8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f48oQo/7cqfNrmeoX3TRNU4pNGCq/qfcxDF/LrWsMcf/N/M18rn6mPLISz3MCHVgDcqB9olYh1PCgBRC65T/Y80+18xxHfB1oUuqyPF+IZ71obrrtW7cfdr9cBKR/rr1zITilS54tWIx+5FRSQX3tPjkZHTgRGbzdXHkdzE2Lgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OSjs57KI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nA/c5NUF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OSjs57KI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nA/c5NUF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OSjs57KI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nA/c5NUF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OSjs57KI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nA/c5NUF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1700E1F396;
	Fri, 20 Dec 2024 08:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734684788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hAtTCHwOmflHgtyo9ZN0rPOWMYptcCLkfxQ2m8khlKA=;
	b=OSjs57KIe653Rr/aSza+MKvsSepReQxr7GMujIRKVvgBWyB57Hfz58mWTpFEzzEHHcEVTW
	g6BgxB7Wfq4EMAZ+B7HTZrLE4+JN3eH1kL6yeM3SYwL7YoE4NYh70IyB+WtsRI6uCOESa9
	RZ8/stZ5hC358KCmt7g+80lpfv+M3dk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734684788;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hAtTCHwOmflHgtyo9ZN0rPOWMYptcCLkfxQ2m8khlKA=;
	b=nA/c5NUFeDGJaDVGSYRI3MwXDXkiNK/EPZR96BFSQtYWCrXAGcWRg1aXPGJJpwYsmLMkGu
	IBVy165EdIVJfqCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OSjs57KI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="nA/c5NUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734684788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hAtTCHwOmflHgtyo9ZN0rPOWMYptcCLkfxQ2m8khlKA=;
	b=OSjs57KIe653Rr/aSza+MKvsSepReQxr7GMujIRKVvgBWyB57Hfz58mWTpFEzzEHHcEVTW
	g6BgxB7Wfq4EMAZ+B7HTZrLE4+JN3eH1kL6yeM3SYwL7YoE4NYh70IyB+WtsRI6uCOESa9
	RZ8/stZ5hC358KCmt7g+80lpfv+M3dk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734684788;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hAtTCHwOmflHgtyo9ZN0rPOWMYptcCLkfxQ2m8khlKA=;
	b=nA/c5NUFeDGJaDVGSYRI3MwXDXkiNK/EPZR96BFSQtYWCrXAGcWRg1aXPGJJpwYsmLMkGu
	IBVy165EdIVJfqCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A370B13A63;
	Fri, 20 Dec 2024 08:53:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CuRNJHMwZWeQawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Dec 2024 08:53:07 +0000
Date: Fri, 20 Dec 2024 09:52:58 +0100
Message-ID: <87a5cqrb11.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Linux Sound ML <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] ALSA: compress_offload: improve file descriptors installation for dma-buf
In-Reply-To: <20241217100726.732863-1-perex@perex.cz>
References: <20241217100726.732863-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 1700E1F396
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 17 Dec 2024 11:07:26 +0100,
Jaroslav Kysela wrote:
> 
> Avoid to use single dma_buf_fd() call for both directions. This code
> ensures that both file descriptors are allocated before fd_install().
> 
> Link: https://lore.kernel.org/linux-sound/6a923647-4495-4cff-a253-b73f48cfd0ea@stanley.mountain/
> Fixes: 04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>

Applied now.  Thanks.


Takashi
