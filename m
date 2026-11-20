Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194470;
	b=ER/ZWPvzxQRcrpp33pyDQDLGvbCw6aBVTVesXLMN9X84T0fl8GmnkJDrHTbirs4HXdZJ
	 dzWDZrOMoH/kN6mFMja9a9wgngZ68P7YZDYg94JQzDSvG3+KUwI6+NJbnZ/P4ESbClttL
	 y/aSMWdpvDIpBer89yXXd85xREshd9Ok5kBvN9+q2sCPjApxjXvpHMTCb9Sr7IGJzJf/p
	 SOhJxHGzlWtXixF5S/Y865wtGkWMHzluRzugAWhFSGl7rtmkPNVrLxRuGuNE/n1coFGjN
	 lXhaOhLyD+tF7LksKakBppWRASSaeNuWqX8nKaSUDOOWjlDVurAr5nqtZp0pnJg5/NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194470;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=XuVKaJNpKyz+U6NZtRi5Tyuv4ViqF1AlOegkq4Q2eoY=;
	b=pbbsDcERLbpI1TxFS4pV/KBEqVbr7mWgpYQ4Q3h1TRU+FbAd9uWUbOgx7fH4E6qdjpsP
	 +6NZh+VtX3Er228IN7IlsxzShc4YJmiFz0YCQeFWROrB2l9kI8fzKL9pOch+Iu5v8dGEw
	 W+E0dJizc7NpGBREMkmbGpor7bDfMjH+h7QzXNOcVkSWpHBuEJbJB7KxQhEnLi7P+JkSk
	 PJlR7GRQ1XN+bk9pxfR2T4YyuK0XcX76JC4DicQxol1i4xN06zx4x89BoWnAbJRRHVtHJ
	 igjKRzmXcCseN0OEg6wKhDMW+2BZPlFd0GRqFIS4nG47gXh09oSva1mECKuhycusXOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d1ULq2zy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=D1IH1LyY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d1ULq2zy;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=D1IH1LyY;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2D8606A335;
	Fri, 20 Nov 2026 17:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC2D8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d1ULq2zy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=D1IH1LyY;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d1ULq2zy;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=D1IH1LyY
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B7B4A1F7F2;
	Fri, 20 Nov 2026 17:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795194467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XuVKaJNpKyz+U6NZtRi5Tyuv4ViqF1AlOegkq4Q2eoY=;
	b=d1ULq2zyTyoBIgRU4iQS7+5LVbDLTqwAnhorvIqGgbZ1UFGNYLTEDV3lji3HD+nG2yaJ/a
	tGY99Z7mdRbdZ7mTxY1scStPzKiWYxyFZOWDpmomeEoNo1qjAVYTgB30aQF6042//h96g3
	2QsSBVyj/qytQXK/lbakyXdkzM9cQv8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795194467;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XuVKaJNpKyz+U6NZtRi5Tyuv4ViqF1AlOegkq4Q2eoY=;
	b=D1IH1LyYEpTadsR8sPOAawsd3rthMFWp0YZXiARgkHXXoqzJkSzUrZTMIQNYTkwyx4aAY2
	Y5OjaBpeS6cvkeCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=d1ULq2zy;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=D1IH1LyY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795194467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XuVKaJNpKyz+U6NZtRi5Tyuv4ViqF1AlOegkq4Q2eoY=;
	b=d1ULq2zyTyoBIgRU4iQS7+5LVbDLTqwAnhorvIqGgbZ1UFGNYLTEDV3lji3HD+nG2yaJ/a
	tGY99Z7mdRbdZ7mTxY1scStPzKiWYxyFZOWDpmomeEoNo1qjAVYTgB30aQF6042//h96g3
	2QsSBVyj/qytQXK/lbakyXdkzM9cQv8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795194467;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XuVKaJNpKyz+U6NZtRi5Tyuv4ViqF1AlOegkq4Q2eoY=;
	b=D1IH1LyYEpTadsR8sPOAawsd3rthMFWp0YZXiARgkHXXoqzJkSzUrZTMIQNYTkwyx4aAY2
	Y5OjaBpeS6cvkeCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C7111342D;
	Fri, 20 Nov 2026 17:07:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aD8qEWN+AGsyTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Nov 2026 17:07:47 +0000
Date: Fri, 20 Nov 2026 18:07:46 +0100
Message-ID: <877bi7whwd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcsp: Only autoload if the pcspkr input driver is disabled
In-Reply-To: <20261120120307.629996-1-pmenzel@molgen.mpg.de>
References: <20261120120307.629996-1-pmenzel@molgen.mpg.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: B7B4A1F7F2
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Fri, 20 Nov 2026 13:03:04 +0100,
Paul Menzel wrote:
> 
> The input driver pcspkr and snd-pcsp both register a platform driver
> named "pcspkr" for the platform device of the same name, and both
> declare the module alias platform:pcspkr. With both built as modules,
> as distribution configurations do, udev loads both for the device, and
> the second one fails to register its driver on every boot. On a Dell
> XPS 13 9310 with Linux 7.4-rc1 and the Debian configuration:
> 
>     [    0.793761] input: PC Speaker as /devices/platform/pcspkr/input/input7
>     [    0.813617] Error: Driver 'pcspkr' is already registered, aborting...
> 
> Which driver ends up handling the beeps depends on the module load
> order. The help text of SND_PCSP already says that the driver is not
> needed for beeps, and that it may become the default sound card. Debian
> therefore removes the alias since 2014 [1], and Ubuntu blacklists
> snd_pcsp. With pcspkr built in, snd-pcsp cannot register its driver at
> all, so the alias is useless there, too.
> 
> Only declare the alias if INPUT_PCSPKR is disabled. Then snd-pcsp is
> loaded automatically and takes over the beeps as before. Otherwise only
> pcspkr is loaded automatically, and users wanting PCM sound from the PC
> speaker keep pcspkr from loading and load snd-pcsp explicitly, which is
> already needed today for a deterministic result. Document it in the
> Kconfig help text.
> 
> Tested on the Dell XPS 13 9310 with Linux 7.4-rc1 and the Debian
> configuration (INPUT_PCSPKR=m, SND_PCSP=m), with snd-pcsp not
> blacklisted: without this change, the error above is logged; with it,
> only pcspkr is loaded and provides the PC Speaker input device, and after
> `rmmod pcspkr`, `modprobe snd-pcsp` binds snd-pcsp and creates its sound
> card. In QEMU with x86_64_defconfig, kvm_guest.config and SND_PCSP=m,
> with systemd-udevd loading the modules, the same holds for
> INPUT_PCSPKR=m, and with INPUT_PCSPKR=n, snd-pcsp is still loaded
> automatically, binds the device, and creates its sound card and PC
> Speaker input device.
> 
> [1]: https://bugs.debian.org/697709
> 
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>

Applied to for-next branch now.


thanks,

Takashi
