Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C36B3E1D02;
	Thu, 20 Aug 2026 08:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787216122; cv=none; b=UzVR85QiM6yMcl+5XylJvahruCUSC2YqB3JwWoJackBG35luq9jzm98ixFlaV2zOYNU0dngYhqbmEk0i+yAV+D8IV2PomDuqNpZ7WpY+zm4ezkcz/vpYBMM9Yw1Sf5ve+jJIaxYAfDoBgoIfhjcpDb8F1nxXQXS//Vuc5veoqqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787216122; c=relaxed/simple;
	bh=CFJYi3b8Ow1Xx2fBrkdwLyaKVLvz+U6u/QPIHvEzfvY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rJ67IMb2zn7b18iagKzocJXtsDWT2nW6cMtNsEfO+2nY6uGs6K8hS5FKhzYlezkNN/WUsnp2dcKHqDBfVYPyFc6LyEBcqs5bZZElUWs7lPUi4Svkukug6lUksi6eItYyQ+IBQ9Z+qUo0wAU/sOoseFcJdcsOyurwp9IWRfVuOxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hUMcohaM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=83OAWxHq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZgFKNnxg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mdG2EHO4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hUMcohaM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="83OAWxHq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZgFKNnxg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mdG2EHO4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 58B473EAD;
	Thu, 20 Aug 2026 08:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787216114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GYfeZE/RenRN5PMMSpOHz53H5wGImE6dbYnGtAY8BZc=;
	b=hUMcohaMhnMpC7qHF419G5WXrAJXvBbEsmg9Vs47MtcYr4VdDzPikidlZPrk6uuaGjO0Bp
	1uoJIVRzwJZeR9C9gQEvQBAnEY/+XnFy7xf+034uDGxfMwobZNORkgm4yHwcU7c+HOSQoI
	i4+i2pihMcxR02B/4IrlJftLn9uQB7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787216114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GYfeZE/RenRN5PMMSpOHz53H5wGImE6dbYnGtAY8BZc=;
	b=83OAWxHqI2qRrpQF8kZinQuU4D8ut/ENfbMibCqCc0eTddu9LO13w6kTrvEz+WVewnhX2C
	hJNI8Bskq5T11kCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZgFKNnxg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mdG2EHO4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787216110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GYfeZE/RenRN5PMMSpOHz53H5wGImE6dbYnGtAY8BZc=;
	b=ZgFKNnxg651wECJ0n7S+A55fnYvRNg7ch7V0ZneVK3ncTu9Jjz9EMrLVlvFT+GmTULMagV
	cddAO6gTh+MHG8jntB4AoVhwJpWiTM9/+pp3lbaV+4fXKkOfm/aCpCuPCQAJiuBFjTtxcG
	0s0qkVtbfm2xPszguH3nGR5owgXp9NQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787216110;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GYfeZE/RenRN5PMMSpOHz53H5wGImE6dbYnGtAY8BZc=;
	b=mdG2EHO4BBRhW7S8VbYT7ViGItCd1Oj0zFfOSzoAkgPFnbN595o2R3ocqtWB7PBte1LJ6x
	cnbK80QBzsZogqAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 292F727A8;
	Thu, 20 Aug 2026 08:55:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id B4GbCO7Ahmq9JwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 20 Aug 2026 08:55:10 +0000
Date: Thu, 20 Aug 2026 10:55:09 +0200
Message-ID: <87jyplmas2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] ALSA: ice1712: Fix the card leak at probe error with the auto-cleanup
In-Reply-To: <20260820014117.14044-1-vulab@iscas.ac.cn>
References: <20260819084959.10649-1-vulab@iscas.ac.cn>
	<20260820014117.14044-1-vulab@iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,iscas.ac.cn:email];
	URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,iscas.ac.cn:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 58B473EAD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Thu, 20 Aug 2026 03:41:17 +0200,
Haotian Zhang wrote:
> 
> snd_ice1712_probe() performs multiple initialization steps after
> snd_card_new(), but directly returns on failures from later steps
> without releasing the ALSA card, causing resource leaks when
> probing fails.
> 
> Use snd_devm_card_new() together with scope-based cleanup
> via __free(snd_card_unref), and clear the card pointer after
> successful registration to keep it alive.
> 
> Fixes: ca642da4b33d ("ALSA: ice1712: Allocate resources with device-managed APIs")
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Applied now.  Thanks.


Takashi
