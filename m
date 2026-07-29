Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB9935DA43
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 06:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785306817; cv=none; b=Mpz5BWcExD6WD7mCUuJPupcQNJCHRW9M4jzWfvC74vnJK+QG9PRappZQCql6EkLuTuAFgjXStBHdW4a1cIfm9aJLBJEtUMjYTeGlJfM5U9sd2g1zpvlhgrGM8+tfqqSP0t5BqAUlr0i2SVYcrO8N+I3r3FkZu4yKAQRo2z91KDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785306817; c=relaxed/simple;
	bh=o3mvfMYPPpr7IOIBUg8HebXEWEJ5XbfbsV9De+yGR4M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KOkXdvVsyeFH7OjcBBqk82yQYb6yTQRhh34MNQ0eQb7xRIbOfbpw8AxHrIUYBEuDebyueiq6upr5QZYag86D5lx1itWHY/f0jN1eXbj/e5VO8lGoAKOqSzpv7IhO4LWodUtLSBjBhADx8TL3ZYhCYPT2qUNFRIBSQK8D/LV29gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JR9UEudb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=turELo9u; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TbyXl3L0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AsL5B6v+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JR9UEudb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="turELo9u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TbyXl3L0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AsL5B6v+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E2E143E0F;
	Wed, 29 Jul 2026 06:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785306810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IhZhbPWaqyVHuLuo9UIH8OEh/qH07mAaSSdUm971jZw=;
	b=JR9UEudb8Gh94alYwm1axO51mC/7eId94pbCD1PZZbQPi1fLangsdNpS9o3zY2BCWhkFSM
	BAWrW2+80hA7YaV2ueoShEg6+1p5CBcO4Grhy/p1Lnlp2gwsuUXZBm5P9BBzI8D+6+3dkH
	36GYOicERCFEdv4CQIwmsB/V+1pUsbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785306810;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IhZhbPWaqyVHuLuo9UIH8OEh/qH07mAaSSdUm971jZw=;
	b=turELo9uN4KHUay4Re8g0WF7goodpxqlRgdCm5MwNtBnXLSJ6174QI76S4xLREO+Mj3O9o
	VZy4GXOZOr620bAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TbyXl3L0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AsL5B6v+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785306805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IhZhbPWaqyVHuLuo9UIH8OEh/qH07mAaSSdUm971jZw=;
	b=TbyXl3L0qO2hQHAc++u73cbnEYTAX13QRTjjH1yas5+Ns25gbKygt07S3B3CuTk2zwGo2d
	n0tXUAKFHfj/jrGKcVWf384ph1/crCCBvwJCn6fWQprBF6ji5pTv6gpeUxbyc4POo6Dnxg
	w3uE/HX5XOwwfivKm2hWmHJdIThUBv4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785306805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IhZhbPWaqyVHuLuo9UIH8OEh/qH07mAaSSdUm971jZw=;
	b=AsL5B6v+irOKtil+fdafmWIbhi1gDs37mslWyFpbQGTthWk1I6aZynDuNiTDdwxq2MksOH
	rrfYryt5g/1ydFBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC619779A1;
	Wed, 29 Jul 2026 06:33:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q77LKLWeaWrGXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 06:33:25 +0000
Date: Wed, 29 Jul 2026 08:33:25 +0200
Message-ID: <87mrva5mq2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+b6cab840e6a85641c7ad@syzkaller.appspotmail.com
Subject: Re: [PATCH] ALSA: ump: Fix double-free of ump->out_cvts on legacy rawmidi attach failure
In-Reply-To: <20260729002333.11525-1-kartikey406@gmail.com>
References: <20260729002333.11525-1-kartikey406@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E2E143E0F
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[b6cab840e6a85641c7ad];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,syzkaller.appspot.com:url,appspotmail.com:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Wed, 29 Jul 2026 02:23:33 +0200,
Deepanshu Kartikey wrote:
> 
> If snd_rawmidi_new() fails inside snd_ump_attach_legacy_rawmidi(), the
> error path frees ump->out_cvts but leaves the pointer dangling. Since
> ump->out_cvts is a field of the long-lived struct snd_ump_endpoint
> (not the rawmidi device that failed to be created), it gets freed a
> second time later during normal endpoint teardown, in
> snd_ump_endpoint_free(), invoked via snd_rawmidi_free()'s
> private_free callback when the sound card is released. This results
> in a KASAN double-free/invalid-free.
> 
> Clear ump->out_cvts to NULL after freeing it on the error path, so
> the later unconditional kfree() in snd_ump_endpoint_free() becomes a
> harmless no-op.
> 
> Reported-by: syzbot+b6cab840e6a85641c7ad@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b6cab840e6a85641c7ad
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>

The very same fix has been already merged in commit
70c977815af0d997feb2d0c5d284d55689bf7051 on sound git tree.


thanks,

Takashi
