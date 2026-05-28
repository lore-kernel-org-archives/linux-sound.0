Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ECD3438AF
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 07:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779953865; cv=none; b=rok/TIiGKEpXyZEFD/bu/S/5uKnpgAgUU70ZVq6I8XO+9O1IlHz8iEwpWz3dNW/067HYWfG/G/HozBeRgcHatOqa74bE7RAUL8AQw/oTtVcnOd3ENAqYRi2//8FtF/M/CxCieIywXXn3lSkt3S6hzZNdkwIvGxMF68yED8znhgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779953865; c=relaxed/simple;
	bh=CeaGffkjZj8IT9d0dhd4hGdh1eg4+yvbq1J9iF7p2Io=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HKoxe7qXvEgf0GkBlU9X/8wdeJAA8p1OWWwo4QX3Vf4YmJ1Ur6QjUks8ZSkQpjf5bygzan1waTfsOv4axpw+kQQtRmBcuH57T0Sl+m4XjRhW85XL1MrpdKR6iJU6HcE4eNkSACrB+zqPP23Z07EpizOLGg9FN7JaqI3d+3LerHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MDYfrx+c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9+hgx2VG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MDYfrx+c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9+hgx2VG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MDYfrx+c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9+hgx2VG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MDYfrx+c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9+hgx2VG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BB9656A8C0;
	Thu, 28 May 2026 07:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779953861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IqSkf5O7p+TOGCzT8oV0M6ucdEz6mcPnUlkpJUspG5w=;
	b=MDYfrx+cbWUfx+ATSBAhL2epo4VxKn7m6RtBa2UsTGdZXoaimwMBRkzQdORgMcZJfxaNov
	C8FV5fM2QE90Qu6Bb/IJ7Py+0uX370iP/aPtT1AkDoeIAvCsw7V1xKk0q4+UYL0c1BT4FY
	cnYr+ZHSlVbgmWQhOFlrovB05S0QenE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779953861;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IqSkf5O7p+TOGCzT8oV0M6ucdEz6mcPnUlkpJUspG5w=;
	b=9+hgx2VGNeP/E0QKYl7Qlb6BnGw5CBYkJgzes0im/4acdGgYo9S9WLV4Qv27E957HaZvq2
	/bLv4JcOtbRWfkAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MDYfrx+c;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9+hgx2VG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779953861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IqSkf5O7p+TOGCzT8oV0M6ucdEz6mcPnUlkpJUspG5w=;
	b=MDYfrx+cbWUfx+ATSBAhL2epo4VxKn7m6RtBa2UsTGdZXoaimwMBRkzQdORgMcZJfxaNov
	C8FV5fM2QE90Qu6Bb/IJ7Py+0uX370iP/aPtT1AkDoeIAvCsw7V1xKk0q4+UYL0c1BT4FY
	cnYr+ZHSlVbgmWQhOFlrovB05S0QenE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779953861;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IqSkf5O7p+TOGCzT8oV0M6ucdEz6mcPnUlkpJUspG5w=;
	b=9+hgx2VGNeP/E0QKYl7Qlb6BnGw5CBYkJgzes0im/4acdGgYo9S9WLV4Qv27E957HaZvq2
	/bLv4JcOtbRWfkAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8CEB35AC88;
	Thu, 28 May 2026 07:37:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eBn4IMXwF2qXVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 May 2026 07:37:41 +0000
Date: Thu, 28 May 2026 09:37:41 +0200
Message-ID: <87a4tkugqi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhao Dongdong <winter91@foxmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Subject: Re: [PATCH v3 0/6] ALSA: check snd_ctl_new1() return value in multiple drivers
In-Reply-To: <tencent_355874CF7D3723CAA5BEBDF10EAD78E86605@qq.com>
References: <tencent_355874CF7D3723CAA5BEBDF10EAD78E86605@qq.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BB9656A8C0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[foxmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[foxmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Wed, 27 May 2026 14:09:08 +0200,
Zhao Dongdong wrote:
> 
> From: Zhao Dongdong <zhaodongdong@kylinos.cn>
> 
> Check snd_ctl_new1() return value before dereferencing in:
>   - es1938
>   - cmipci
>   - ymfpci
>   - ice1712 (aureon, ice1712, ice1724)
>   - gus
>   - aoa (layout)
> 
> snd_ctl_new1() can return NULL when memory allocation fails.
> Add a NULL check and return -ENOMEM on failure.
> 
> Assisted-by: Opencode:DeepSeek-V4-Flash
> Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
> ---
> v1: https://lore.kernel.org/linux-sound/875x49w1i0.wl-tiwai@suse.de/
> 
> ---
> Zhao Dongdong (6):
>   ALSA: es1938: check snd_ctl_new1() return value
>   ALSA: gus: check snd_ctl_new1() return value
>   ALSA: ice1712: check snd_ctl_new1() return value
>   ALSA: ymfpci: check snd_ctl_new1() return value
>   ALSA: cmipci: check snd_ctl_new1() return value
>   ALSA: aoa: check snd_ctl_new1() return value

Applied all 6 patches to for-next branch now.  Thanks.


Takashi
