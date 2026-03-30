Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8F139EF2B
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 07:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856031; cv=none; b=qLrlFQBaYcFfpL85L0QN4WhVUAiOqwB2xhZgwhKyE0qSXZhRgDirXu4AqXwycmgILFBkA5dxx1ePdYdXdmt7LCXeBNFcyDdfg9N+rIsvXQ48v+5P13jRbuwkd1a0w5euCE4kDFARHV3brHhwLIU6+NrFkDbRISu3xRAY2uboPPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856031; c=relaxed/simple;
	bh=nHvKmRE/94eNi6m7h4ujORy46BFoyC7QLcoFIQtcXgI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=itptnFzebHBv/aEaVXR9vwPLLtMPRlEYAZIkoLrSco/KGAOmSpN4/v7wvW1MobAPHLgJOhMOR/7hke3sNckl6dSRh3xx1q9nzKT5gDHHSQt/Uphbv0ADmRycL+HCgm91eK8Pra0fXTMn5szq7SmP+bZWFfrR+rCMWwIyfXkP59g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jZS2NT5n; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qm8P5K5h; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zjN1HWXh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YyWTs/FU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jZS2NT5n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qm8P5K5h";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zjN1HWXh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YyWTs/FU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D831C5BE85;
	Mon, 30 Mar 2026 07:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774856028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yO/NyGT2FBxwxL3F11zdUdR2UlbdGKZTgwDfGPrf6sc=;
	b=jZS2NT5n/ANDDt6t4lH/uOfbS+4VXbaNbwVPETi480UbhtyB7mzu6M+xG0+8w8NrySqGFo
	/OVtMTV+u+1lVv/W2xOxt9K/ywQNZ6baqbcCCr49ByWmkZdU7aANq2fx1QpUPEsZ9KLTB0
	PBAkVWyG2JFeVarBr5kXkwBqmKGTlTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774856028;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yO/NyGT2FBxwxL3F11zdUdR2UlbdGKZTgwDfGPrf6sc=;
	b=qm8P5K5h3OgegElDZzYEgGLJ56p9ypj2VeOm58YdTTbRBOVHRdPEa6PvI4ZfrBvvBAOQ6Q
	DjR7sQG6Kr6CmSAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zjN1HWXh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="YyWTs/FU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774856027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yO/NyGT2FBxwxL3F11zdUdR2UlbdGKZTgwDfGPrf6sc=;
	b=zjN1HWXhszUUFn9STa5FjdwTYyOPOSACE9Q+Wx83Oo+l60ENrkGWQb0DRk2EDhPPHEZI2J
	Y7VDxEPqvv3Uzxps80Bv+qaHfbClLYnxvAPtkXQGzNJlVvHnNnBDtOWjAsvq4VCQXo2Neq
	lAHsBkcCQDbFRQdXoMmaQta+X2C1MSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774856027;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yO/NyGT2FBxwxL3F11zdUdR2UlbdGKZTgwDfGPrf6sc=;
	b=YyWTs/FU7jk9au0s6FO3N7Xag0cWx2vpX4R9pIDNtmxBdUiXibgQ2+66tsaAfmR/Pg3plq
	BHToKV9hii3z3NDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A4B4A4A0A2;
	Mon, 30 Mar 2026 07:33:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qmy6JlsnymlJJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Mar 2026 07:33:47 +0000
Date: Mon, 30 Mar 2026 09:33:47 +0200
Message-ID: <87qzp1u5yc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dag Smedberg <dag@dsmedberg.se>
Cc: tiwai@suse.com,
	perex@perex.cz,
	g@b4.vu,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Exclude Scarlett Solo 1st Gen from SKIP_IFACE_SETUP
In-Reply-To: <20260329170420.4122-1-dag@dsmedberg.se>
References: <20260329170420.4122-1-dag@dsmedberg.se>
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
	BAYES_HAM(-3.00)[99.98%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: D831C5BE85
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Sun, 29 Mar 2026 19:04:20 +0200,
Dag Smedberg wrote:
> 
> Same issue that the Scarlett 2i2 1st Gen had:
> QUIRK_FLAG_SKIP_IFACE_SETUP causes distorted audio on the
> Scarlett Solo 1st Gen (1235:801c).
> 
> Fixes: 38c322068a26 ("ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP")
> Reported-by: Dag Smedberg <dag@dsmedberg.se>
> Tested-by: Dag Smedberg <dag@dsmedberg.se>
> Signed-off-by: Dag Smedberg <dag@dsmedberg.se>

Thanks, applied now.


Takashi
