Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC761A0733
	for <linux-sound@vger.kernel.org>; Thu, 15 Aug 2024 08:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723708986; cv=none; b=XLRMKKmQePsVUhRo9ZgmzJ7NYjv+Z039dOB2Nl74V/+STgf3Qi6o1HuEdwlIM1xOsU4lJ6csEnCa4bJKiytplteqS8xQV5dXss8ZUmF/uUsIqK5ntJgj7aX/zhcHo6RY5CzV9xn8i0uGIluOj1cDnhkccvX9MafmmS6DYUa+1AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723708986; c=relaxed/simple;
	bh=cAlTvpVo03AJQ3Ai6o4LbIj3+cxrsRXL3dtDeDoN3A0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oP+PdGeEY2ZpzV5bTZ+cmZekurx/A9b6C2n0EhwJWmmLZ6q32B0yItg2KnKNnNd0VRdZCRsr4CVsHJxUSXw3FxjrHyrZ/JLqMWVqmuvrLXtIJArL4u3pnBPzSQ6FieevpW7MIhBPyYv/bPb0D1ZxouDJnYonqRUlzEOyR8GtePY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RFoh3JEW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jRb7aDcH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RFoh3JEW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jRb7aDcH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RFoh3JEW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jRb7aDcH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RFoh3JEW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jRb7aDcH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B565922259;
	Thu, 15 Aug 2024 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723708979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tdHi+wDH9SO04RdGAw27qBlAL9nWT7HUXEXtiWFNAxE=;
	b=RFoh3JEWus3cuPVuIfaG2viFLH98rRIw25xgGGpZNP6P1I8ZFBGxuZ46x/Qs7yBdAAKeRL
	WBAfUi7aS8vEDWqBQSV0G3FqnL2oCKKXpFr1AWO7axg9mH4FXHaDrytTI1E20Li3Yr/KqG
	qflVYAGl+UrpwmlcEz+MQh1RRGd/bQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723708979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tdHi+wDH9SO04RdGAw27qBlAL9nWT7HUXEXtiWFNAxE=;
	b=jRb7aDcHa8jciiYSF7vO5UliHgolYb8HJKmvfa+RiL9Egqod3RnYRKvqGQJ+Uft9isHIKG
	hkGnDT56LlpWi6Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723708979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tdHi+wDH9SO04RdGAw27qBlAL9nWT7HUXEXtiWFNAxE=;
	b=RFoh3JEWus3cuPVuIfaG2viFLH98rRIw25xgGGpZNP6P1I8ZFBGxuZ46x/Qs7yBdAAKeRL
	WBAfUi7aS8vEDWqBQSV0G3FqnL2oCKKXpFr1AWO7axg9mH4FXHaDrytTI1E20Li3Yr/KqG
	qflVYAGl+UrpwmlcEz+MQh1RRGd/bQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723708979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tdHi+wDH9SO04RdGAw27qBlAL9nWT7HUXEXtiWFNAxE=;
	b=jRb7aDcHa8jciiYSF7vO5UliHgolYb8HJKmvfa+RiL9Egqod3RnYRKvqGQJ+Uft9isHIKG
	hkGnDT56LlpWi6Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69D9B1342D;
	Thu, 15 Aug 2024 08:02:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DY6zGDO2vWYudwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Aug 2024 08:02:59 +0000
Date: Thu, 15 Aug 2024 10:03:40 +0200
Message-ID: <87sev65i1v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/2] ALSA/DRM: vmalloc PCM buffer helper cleanup
In-Reply-To: <20240807152725.18948-1-tiwai@suse.de>
References: <20240807152725.18948-1-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Wed, 07 Aug 2024 17:27:21 +0200,
Takashi Iwai wrote:
> 
> Hi,
> 
> we still keep the legacy vmalloc ALSA PCM helper API since there is
> only a single user of it, namely, the DRM dw-hdmi bridge driver.
> In the past, I attempted to change the buffer management of the
> driver, but due to the lack of testing, it failed to get merged:
>   https://lore.kernel.org/20191210154536.29819-1-tiwai@suse.de
> 
> So, this is a second try after some years of gap: now the relevant
> code snippet is moved from ALSA core to dw-hdmi driver itself, and the
> API functions are dropped.  There should be no functional changes in
> the driver.
> 
> If DRM people don't mind and give an ack, I can take the change for
> dw-hdmi code together with ALSA core code drop via sound tree for
> 6.12.

Gentle ping to any DRM reviewers.  It's merely a safe clean up, so if
you don't mind, I'd like to take for 6.12.


thanks,

Takashi

> 
> 
> thanks,
> 
> Takashi
> 
> ===
> 
> Takashi Iwai (2):
>   drm/bridge: dw-hdmi: Move vmalloc PCM buffer management into the
>     driver
>   ALSA: pcm: Drop PCM vmalloc buffer helpers
> 
>  .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   | 30 ++++++++--
>  include/sound/pcm.h                           | 42 -------------
>  sound/core/pcm_memory.c                       | 59 -------------------
>  3 files changed, 26 insertions(+), 105 deletions(-)
> 
> -- 
> 2.43.0
> 
