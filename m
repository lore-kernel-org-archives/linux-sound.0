Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A4E1F63D9
	for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 18:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760811179; cv=none; b=P3aKZDx+ZP9rxxGA91IeZ0bvBSjNJf//bZQep0TAvuGPeEWHD4K+RgAF5glJ6NHecc8rC48ZKJzw0Xk4CjKO/RZ4MV1iwVHkeVJ6jXeMgSbsr9vJpjOnkNyIgvpbjg5/uX9cuhgg+Uidqmm52soUDzrSy7uIKXeL7DrWXhbNJQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760811179; c=relaxed/simple;
	bh=7CZg6UP/oUH88uaCVPs1L7VyRuaOhAJRyl3xvkzxqWY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V1kPytFkcK3Fxq1lY6T0ZTu5KlP0x76xND7XVWJiWwgPKRiHn/shUIKsNDvU8CMjojy/yPEt6kgGY5suqsNrIiv08mZpNc1ffjevB1IoeLh8U1jCqM7TepUve8emyrJiEpdjW0M1aTnH/0DTElVQZb29Myc7/DpRipTmOXcNnFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NUv03hxx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RzsWakTM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tm1I+m5B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/7vqteAd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NUv03hxx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RzsWakTM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tm1I+m5B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/7vqteAd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE0DF21A4B;
	Sat, 18 Oct 2025 18:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760811173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rLmWtNy6khHscJ7FU09gVG/PlFfsGjYy/jUdXDozoOA=;
	b=NUv03hxxRgwXxcu4sg6JtBfIuln9oRrtk3/KAYcV+junGdsByrIaIQExRJ5Mu8toBKgStl
	utqGNTzrPN/TS/mBUjJxG8WfHkXWGcJBEaWt68ipu7jRtvVUK4AVLOSlRTK3BWQtRoqrzI
	D1eBZiGjZnUDQSp48CavFpxYcLCLPJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760811173;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rLmWtNy6khHscJ7FU09gVG/PlFfsGjYy/jUdXDozoOA=;
	b=RzsWakTMRVh9vD60kyS3VVhH+TF8hOednKCKnT0ABrPNuUENhTqd6u55APr8dUXN7A9ENr
	5iRC0OgzoxgGuyCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tm1I+m5B;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/7vqteAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760811169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rLmWtNy6khHscJ7FU09gVG/PlFfsGjYy/jUdXDozoOA=;
	b=tm1I+m5BAibEHQqTxQU6BPIP+k84KWs/VXDZ8MdW9TLdzL00s28iM+yrg9mheWhDYIjwyz
	ysuUSa9FFxEofgXrg0YtsSJqWaHqtbOlPQGUjL5x7wPXVIMOsvXabqN9wjvAfLUUYXHJ9f
	YA/UVGM8FL77aswWahUA4TDrkKYivo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760811169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rLmWtNy6khHscJ7FU09gVG/PlFfsGjYy/jUdXDozoOA=;
	b=/7vqteAdMDhETKPsEqPCsY6YpuN6QP0GbtW3Lu626alJmPaGU/VKLLvEBEG0u295zu+raF
	CqTjSM5gslqlavBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C6341386E;
	Sat, 18 Oct 2025 18:12:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yhO2HKHY82gAWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 18 Oct 2025 18:12:49 +0000
Date: Sat, 18 Oct 2025 20:12:49 +0200
Message-ID: <87jz0s3wpq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Xj <xj@wp.pl>
Subject: Re: [PATCH] ALSA: usb-audio: fix control pipe direction
In-Reply-To: <aPPL3tBFE_oU-JHv@ark>
References: <aPPL3tBFE_oU-JHv@ark>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: AE0DF21A4B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.98%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,wp.pl];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,wp.pl];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 

On Sat, 18 Oct 2025 19:18:22 +0200,
Roy Vegard Ovesen wrote:
> 
> Since the requesttype has USB_DIR_OUT the pipe should be
> constructed with usb_sndctrlpipe().
> 
> Signed-off-by: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>

Thanks, applied now with the missing Fixes tag.


Takashi
