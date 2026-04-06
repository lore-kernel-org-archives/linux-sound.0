Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426E42D0603
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 08:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464900; cv=none; b=OZ0U4ARWdPjxzmB/noqFo/dyurK68ugtfQ8wJaYGPy1qhQJBZhfa0gYgpyRfoG5UR7KwWps/sRBEeV2jONYIY8HUaC+PP/GUofpRp1MHDe+ox3wlzgeZ8gk89xqDBz4Iy6+oV2sjA8OXhq88zmyyNdGLd8qy2IYDbdbpk3i30DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464900; c=relaxed/simple;
	bh=QiSLC7NE6wBeeSE97jvJARnOESNoLV6E2nOCidCmQWs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ug/4v1tnZz5723Eazv8Cpfv0g56Q2g/cSa3eyLCqJ+tNuFxD3wXNcJH3RflptW6nVhrLuYWzgBuQdTek6w3iRfvr/CBILOxw/L2S/lxg687f9t7yXjbdWQxC/zaN89Z/rSb9DqF/ZPBz+KW28PXcxzagXMX0cKbENG7Ab4L9sUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dB0vJiH1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s0yW/C4P; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dB0vJiH1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s0yW/C4P; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dB0vJiH1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s0yW/C4P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dB0vJiH1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s0yW/C4P"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5A4125BE4D;
	Mon,  6 Apr 2026 08:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775464897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gpLNydfTyspq2Ps/yiY/PGpQxBX81uVkAkd06CjHbMM=;
	b=dB0vJiH1sNB7aK44Rb9FiUx4wMwjsgIAHvOux5E++upoCeF3QLpkf1YHB9PMw0ZPCp0zj+
	KrGVGWY6sWNy5QQyUqev+R8qJXDrL7H621CBQDQvGlTyzDkGIQvcH4FCXxtzqs6fWak32+
	eBi9y1xgfLsKuB+gcS/5vJFS6lHWjFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775464897;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gpLNydfTyspq2Ps/yiY/PGpQxBX81uVkAkd06CjHbMM=;
	b=s0yW/C4PzUh+Go4b0wu+xU0GLlLE8etbz78LiImWV4lnHBz/1vH7XqDIljaQ9Fsn/o/voJ
	AdaMGNqJIwxrK3Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775464897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gpLNydfTyspq2Ps/yiY/PGpQxBX81uVkAkd06CjHbMM=;
	b=dB0vJiH1sNB7aK44Rb9FiUx4wMwjsgIAHvOux5E++upoCeF3QLpkf1YHB9PMw0ZPCp0zj+
	KrGVGWY6sWNy5QQyUqev+R8qJXDrL7H621CBQDQvGlTyzDkGIQvcH4FCXxtzqs6fWak32+
	eBi9y1xgfLsKuB+gcS/5vJFS6lHWjFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775464897;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gpLNydfTyspq2Ps/yiY/PGpQxBX81uVkAkd06CjHbMM=;
	b=s0yW/C4PzUh+Go4b0wu+xU0GLlLE8etbz78LiImWV4lnHBz/1vH7XqDIljaQ9Fsn/o/voJ
	AdaMGNqJIwxrK3Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 150D94A0B0;
	Mon,  6 Apr 2026 08:41:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TynRA8Fx02kOJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 Apr 2026 08:41:37 +0000
Date: Mon, 06 Apr 2026 10:41:36 +0200
Message-ID: <875x64mqf3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: aoa: onyx: Update IEC958 sample-rate status for PCM playback
In-Reply-To: <20260403-onyx-spdif-pcm-rate-v1-1-dcfaf931cf83@gmail.com>
References: <20260403-onyx-spdif-pcm-rate-v1-1-dcfaf931cf83@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Fri, 03 Apr 2026 05:47:13 +0200,
Cássio Gabriel wrote:
> 
> onyx_prepare() accepts 32/44.1/48 kHz PCM playback, but it leaves the
> Onyx IEC958 sample-rate status bits at the driver's initial 44.1 kHz
> setting in DIG_INFO3. As a result, 32 kHz and 48 kHz PCM streams
> advertise a stale IEC958 sample rate unless userspace rewrites IEC958
> Playback Default first.
> 
> Update only the consumer sample-frequency bits in DIG_INFO3 from the PCM
> runtime during prepare, resolving the long-standing FIXME in the PCM
> playback path while leaving the other user-controlled IEC958 status bits
> unchanged.
> 
> Mark IEC958 Playback Default as volatile as well, since prepare() now
> changes the exposed register contents outside the control put callback.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied now to for-next branch.  Thanks.


Takashi
