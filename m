Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC2914A639
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 06:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724741232; cv=none; b=M+9uL+jInj1kKgEPxkDYhjY+MKEsQgE3YsyYQxiPjux5QfldFYmF4Yscq3stTSdq5LhA7mEsfnnvQrqDSWAWWN43zeZJ9IgefBdCEtcMAsd0GYRoKOnoLAN6XFtlYBSyMavB7+HHSEsgW4MboxhyWHNla+Cdi0O17WHGZQ3ERiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724741232; c=relaxed/simple;
	bh=ysxjm6KwzfkTdgUhFkmt+UJiQU/oRtZdUXO6bFOifRw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=StQu+WY3nAJQHZaxvVBaiDft7ABzg/E62P4+F+Cuk3id0yOe+N1hz35QlC8JHXVqag7ctct5VUnMJ5lDZUrbU5IUIARe6sDu2LYtPV82vjELLAZIqbCm2IouzcXEtB6g+FcaRLUWliqQDriGRZcje9MLFTUNLfMhE8zRGb5b1Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PCiyhfRl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dwU4PY8u; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PCiyhfRl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dwU4PY8u; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PCiyhfRl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dwU4PY8u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PCiyhfRl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dwU4PY8u"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AF32B1FB4F;
	Tue, 27 Aug 2024 06:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724741227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oh1HhJBZ+zXSIBrli2hYsBIUNFK1vgfHzTbMMQHTtRc=;
	b=PCiyhfRlctYBqyl3pyeA9nDXJFxTY8OxRMoOX6ayXBrStB1QATkLdvNj6cSwvgGdJxo88o
	wSKwLhBF1wxWI868O/Rb26aAsq8t5ho0vMCnutydmbsIv/j1VhZtjsvm8dG5wIlBX2HwZr
	MTWsUIt7xIdkMgB1aOJh24YhFgjDfZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724741227;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oh1HhJBZ+zXSIBrli2hYsBIUNFK1vgfHzTbMMQHTtRc=;
	b=dwU4PY8uBEQ1vTP1KGch55mQ2o/iHx0qTk8cqnAgJ7BGWzT2FF3jW52YKNEjjVchHKtA/0
	xeb8QuGx0hdWZIAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724741227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oh1HhJBZ+zXSIBrli2hYsBIUNFK1vgfHzTbMMQHTtRc=;
	b=PCiyhfRlctYBqyl3pyeA9nDXJFxTY8OxRMoOX6ayXBrStB1QATkLdvNj6cSwvgGdJxo88o
	wSKwLhBF1wxWI868O/Rb26aAsq8t5ho0vMCnutydmbsIv/j1VhZtjsvm8dG5wIlBX2HwZr
	MTWsUIt7xIdkMgB1aOJh24YhFgjDfZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724741227;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oh1HhJBZ+zXSIBrli2hYsBIUNFK1vgfHzTbMMQHTtRc=;
	b=dwU4PY8uBEQ1vTP1KGch55mQ2o/iHx0qTk8cqnAgJ7BGWzT2FF3jW52YKNEjjVchHKtA/0
	xeb8QuGx0hdWZIAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E1EB13724;
	Tue, 27 Aug 2024 06:47:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DK8VFWt2zWY9bQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Aug 2024 06:47:07 +0000
Date: Tue, 27 Aug 2024 08:47:51 +0200
Message-ID: <87ed6a31ig.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
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
In-Reply-To: <87sev65i1v.wl-tiwai@suse.de>
References: <20240807152725.18948-1-tiwai@suse.de>
	<87sev65i1v.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Thu, 15 Aug 2024 10:03:40 +0200,
Takashi Iwai wrote:
> 
> On Wed, 07 Aug 2024 17:27:21 +0200,
> Takashi Iwai wrote:
> > 
> > Hi,
> > 
> > we still keep the legacy vmalloc ALSA PCM helper API since there is
> > only a single user of it, namely, the DRM dw-hdmi bridge driver.
> > In the past, I attempted to change the buffer management of the
> > driver, but due to the lack of testing, it failed to get merged:
> >   https://lore.kernel.org/20191210154536.29819-1-tiwai@suse.de
> > 
> > So, this is a second try after some years of gap: now the relevant
> > code snippet is moved from ALSA core to dw-hdmi driver itself, and the
> > API functions are dropped.  There should be no functional changes in
> > the driver.
> > 
> > If DRM people don't mind and give an ack, I can take the change for
> > dw-hdmi code together with ALSA core code drop via sound tree for
> > 6.12.
> 
> Gentle ping to any DRM reviewers.  It's merely a safe clean up, so if
> you don't mind, I'd like to take for 6.12.

Now merged to for-next branch of sound.git tree.


Takashi
