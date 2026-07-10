Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7653955FF
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694355; cv=none; b=j5GdReARNFnB3t7R1IFcrOussm8ZUvBEO7N3xjd+w8Qn1vtKnq3rPYZeLg1LvL2d2ppB9fs3KBbR8mLpJn5ywuZEDW2QZ2J6RSa6+u8kGy5MnYaEvVcIfLhPDvY7tuAUcdvdvxmOkevudzYaCeDktxXXS9S7nUHHpRMeLPZKU/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694355; c=relaxed/simple;
	bh=wr55SriesO4d9TqEzhMpVPGVhDtbpjZQchIcnRrUh+M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=COp39Yy8+63h2etzVKeVbkEQyhr3S4+5vT6bVzCtNOOW7AtL5+SY0dfGLp5LzMdBT/4vvFyUXvyKBZBp1QSm6QKeTSWNdlD8Qqfu0NELLxcVXYsnX0WAfwFNfQr0EmYm3gUeOb5HqOSkPaBsKSWvjwLSpp0JR+zyBNhNIOCov5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qhdXFfPy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fNvcgzoL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UtR9Wezh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7rjIweI+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qhdXFfPy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fNvcgzoL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UtR9Wezh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7rjIweI+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0EDC47532F;
	Fri, 10 Jul 2026 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783694352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WywX2A2/JKBAjKx09bRnb0JwecBq18t/kTQMF7+Al5U=;
	b=qhdXFfPyyrqhkei3q4Jncdygpapmuzv+c19BSdl8KeEjkRRBPbGde07NSM/YcIckxTrWDX
	Tj63nDZhKOisrDOcm8f4PifDBzFPU/VjVrhfJrhl2rau2Cx/pWgjzdLFIypluvrenSnOl3
	ERXvdBRxh2Vo/YJS5S9J6/nmp9ZJ0rk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783694352;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WywX2A2/JKBAjKx09bRnb0JwecBq18t/kTQMF7+Al5U=;
	b=fNvcgzoLUACn2QFPe8Bxys0vAGRgxg2sVts/8NE3pSO6CtYvkZrH3CbqVKHh2BcVtWOXEB
	3TsqapbcozEWOBCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783694351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WywX2A2/JKBAjKx09bRnb0JwecBq18t/kTQMF7+Al5U=;
	b=UtR9WezhQiKCzrhuTANCLcYFiPIc01J1uaZoGxf/d7EZzudFYU8O+dg5UQ93aGiaO6MO4b
	fCx/FHjjynxfFKfB83yZg1PvJL6eysmv/BcPWDONouV0RS1cX3nmx/ENGlrXQRXUHGf8v3
	2zFoO75LBRmnKdMQRXt8TULLNWkGXpM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783694351;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WywX2A2/JKBAjKx09bRnb0JwecBq18t/kTQMF7+Al5U=;
	b=7rjIweI+KVhicW4wkrudB+Hs82axSsr9hBaAY1DXM6icP1ZcstHO7LzRbQ05Ab5yRhsFy2
	9Jfen2iCO4N+n6Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DD7E7779BD;
	Fri, 10 Jul 2026 14:39:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +3XdNA4EUWqNUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jul 2026 14:39:10 +0000
Date: Fri, 10 Jul 2026 16:39:10 +0200
Message-ID: <87o6ge29kh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.2-rc2
In-Reply-To: <19b1f3ea7e0f08ad827d02c50075f69d@kernel.org>
References: <19b1f3ea7e0f08ad827d02c50075f69d@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Fri, 10 Jul 2026 12:45:07 +0200,
Mark Brown wrote:
> 
> The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:
> 
>   Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.2-rc2
> 
> for you to fetch changes up to 3238c634725afbb2a137fdda762208510828f71d:
> 
>   ASoC: tas2562: fix deprecated 'shut-down' GPIO always cleared after lookup (2026-07-09 00:33:20 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.2
> 
> A fairly standard set of device specific fixes and quriks for new
> devices, nothing too remarkable here.

Pulled now.  Thanks.


Takashi
