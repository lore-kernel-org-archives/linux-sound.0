Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3E83E3C74
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 07:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778829057; cv=none; b=nfyY7EGxEVvo80eoyRh+SeZnpTBmCq6ANYxXRQRf9jiZcjS67jZQtMEVTkJnBmY6HP5P8bqWsDdDrs00BWTNq5Ekw8T7Wze4jhgKS/tM7h5CYeUWE9vt2w3nkP1iC2C5k+taiXVbYooBw823ylmqPd8gtJBvbavj5Zlq5R7/r+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778829057; c=relaxed/simple;
	bh=ob+Y3f2DPzi6Ap+3sHD6w4PtyefHUfVdcFp6r/U/cs8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QW8/M5v0WBQqgTE++RT3JnXE5B+phaVOjRqaUSeJmQ+OPWicG2p1j7iTJ9POgWCINJS8GWAGR5nh58YaF5Ry/VHOWiL4LUFuoFw4GiJXBzmNjHpvNt4911TaHzlm2+MQJcscKXaniM4YPYvTAoeDPNTbYWqn0GFrcDwCelAgF48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yBljQL/B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uzBYpmId; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yBljQL/B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uzBYpmId; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yBljQL/B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uzBYpmId";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yBljQL/B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uzBYpmId"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0B90A675BE;
	Fri, 15 May 2026 07:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778829053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3LbFwMDL5B3nau60JB8/7yYsHjvxhgE1K7dj9KzCC8Q=;
	b=yBljQL/BQxZ1NyDzWmHsWms+9OSzD8/OMzfRo11GgpocEB38PVeHAfFJdoCmncePn1k/l9
	Bd1hSpTvD8Ysv2XoQScGPTLc3wrZdGB6DkgRfKLyaijF8aC5tqAP2RoZiek9XbrcQlgWg5
	M84GbuKwXYldGsHH7tANl25lFENXNWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778829053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3LbFwMDL5B3nau60JB8/7yYsHjvxhgE1K7dj9KzCC8Q=;
	b=uzBYpmId8HyaSGlMZpCkqk6URkVJHuC7QA2HUrvBOQpbCTlrUbN4rVlKfhlS0gfD1O87u6
	nrhvqaeYOYOMiUBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="yBljQL/B";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uzBYpmId
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778829053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3LbFwMDL5B3nau60JB8/7yYsHjvxhgE1K7dj9KzCC8Q=;
	b=yBljQL/BQxZ1NyDzWmHsWms+9OSzD8/OMzfRo11GgpocEB38PVeHAfFJdoCmncePn1k/l9
	Bd1hSpTvD8Ysv2XoQScGPTLc3wrZdGB6DkgRfKLyaijF8aC5tqAP2RoZiek9XbrcQlgWg5
	M84GbuKwXYldGsHH7tANl25lFENXNWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778829053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3LbFwMDL5B3nau60JB8/7yYsHjvxhgE1K7dj9KzCC8Q=;
	b=uzBYpmId8HyaSGlMZpCkqk6URkVJHuC7QA2HUrvBOQpbCTlrUbN4rVlKfhlS0gfD1O87u6
	nrhvqaeYOYOMiUBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7DBD593A9;
	Fri, 15 May 2026 07:10:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gqYmK/zGBmp9YgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 07:10:52 +0000
Date: Fri, 15 May 2026 09:10:52 +0200
Message-ID: <87y0hltaf7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jackie Dong <xy-jackie@139.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	zhangheng@kylinos.cn,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mpearson-lenovo@squebb.ca
Subject: Re: [PATCH v2] ALSA:hda/realtek: ALC269 fixup for Lenovo Yoga Pro 7 15ASH111 audio
In-Reply-To: <20260514153940.7320-1-xy-jackie@139.com>
References: <20260514153940.7320-1-xy-jackie@139.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[139.com];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,139.com:email];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0B90A675BE
X-Spam-Level: 

On Thu, 14 May 2026 17:39:40 +0200,
Jackie Dong wrote:
> 
> ALSA:hda/realtek: ALC269 fixup for Lenovo Yoga Pro 7 15ASH111 audio
> 
> Volume control for the speakers on the Lenovo Yoga Pro 7 15ASH11 laptop 
> doesn't work.
> The DAC routing is the same as on the ThinkPad X1 Gen7 function, so reuse
> the alc285_fixup_thinkpad_x1_gen7 to get it working.
> 
> Signed-off-by: Jackie Dong <xy-jackie@139.com>
> 
> ---
> Changes in v2:
>  - Use ALC245_FIXUP_BASS_HP_DAC instead of creating a new quirk.

Applied now (with minor modification to drop the superfluous subject
line).


thanks,

Takashi
