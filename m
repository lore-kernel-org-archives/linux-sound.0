Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801052;
	b=t1+CxnNLlqO5+6mliTcV02j9r73M/9aWh8wGCEBM6yznA7M4xYQlY0HnoAAa7wk77PaV
	 aWggo7nuAZVO886Cr20b4AbUKBOkWAsNjqxATnVMs8TxhzsmDN5XjyEycVSP1LK21rtFU
	 aPBWdlMKXcLGUNWxhCdYm/zP4dOPzPpl2ToekBKTli1BA0f5tVCDcHK1WN/ru2bwHmgaN
	 RXaJDtUlhOPE1zhwmFHit3Ho0maPb5/OTBrleMxgOPY3ZToEtHY2onqDqyGLMbLFGIeCo
	 Kajga3dsPgaI60nZ8paVB5reEZ+KRmKKTfYm9LaTSoenrQCviP+yiE/iFAwOMnvPo6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801052;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=Ybmf5eA8nO2z1EXCBSwNgRRAB14C9dISogEzuEi/y2w=;
	b=m2dQTyPlvjD8pRgXqMKu2/ueF1gDxxEdEwpn/fzclcs5dqt4atyPPGF000rNI9ivSyjW
	 7hbQsWGnlvp2p+4bnSPLMemZjLleFWMUdPy27owuLJKpQ1aHIrvYtQomX/hU4mZPGFUx2
	 IFNys3cSxAZD8HMEevm2y4nUngerxavJP3remFl4avreFamlliSLcZWKGRHbE10RRlBWM
	 UnHfufGt2nhjj4nRtLvMMTM0+ZYiMY7nf8UB72nN6BkcHZgNvcuAT91urFC2VAXN5+tok
	 VS28JSZRN51FsYjKIlFneSAWg+ngqzjEbLyx1ZSFhneu1vZl/HI5Ga6PxAA2G35FBnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GBpnaCxs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3LNuVTnC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GBpnaCxs;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3LNuVTnC;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A964606A69B;
	Fri, 27 Nov 2026 17:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A964606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GBpnaCxs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3LNuVTnC;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GBpnaCxs;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3LNuVTnC
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 692BA229B3;
	Fri, 27 Nov 2026 17:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795801044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ybmf5eA8nO2z1EXCBSwNgRRAB14C9dISogEzuEi/y2w=;
	b=GBpnaCxsoKsqmpgeuhX6PcK38zGVRL1/v00yZkO5RzTAeEU+QO4frT7xyJIA1y4rPYgIsX
	lV5sXHrpp49aL1Pa4OByttGbsLLMu2kBGfQS05zYuO4lJ1QKetFYD8Vh8lb7IP0sh7aF03
	Ye4jiVGzCrWv7jEbRJIBebq4mT3+uv4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795801044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ybmf5eA8nO2z1EXCBSwNgRRAB14C9dISogEzuEi/y2w=;
	b=3LNuVTnCHbjBqdEeosKTgmGqj3A/cj+ua712lvZFZrPhyOdszGUDIWOjjaHLfZngDZhZbX
	x988wy/bUCrp7IAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GBpnaCxs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3LNuVTnC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795801044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ybmf5eA8nO2z1EXCBSwNgRRAB14C9dISogEzuEi/y2w=;
	b=GBpnaCxsoKsqmpgeuhX6PcK38zGVRL1/v00yZkO5RzTAeEU+QO4frT7xyJIA1y4rPYgIsX
	lV5sXHrpp49aL1Pa4OByttGbsLLMu2kBGfQS05zYuO4lJ1QKetFYD8Vh8lb7IP0sh7aF03
	Ye4jiVGzCrWv7jEbRJIBebq4mT3+uv4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795801044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ybmf5eA8nO2z1EXCBSwNgRRAB14C9dISogEzuEi/y2w=;
	b=3LNuVTnCHbjBqdEeosKTgmGqj3A/cj+ua712lvZFZrPhyOdszGUDIWOjjaHLfZngDZhZbX
	x988wy/bUCrp7IAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B838134E8;
	Fri, 27 Nov 2026 17:37:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AW3mNNO/CWsIFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Nov 2026 17:37:24 +0000
Date: Fri, 27 Nov 2026 18:37:23 +0100
Message-ID: <878q2emazw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	perex@perex.cz,
	tiwai@suse.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: atmel: ac97c: fix reset GPIO error handling
In-Reply-To: <20261127100645.3564-1-sreekuttan2156239@gmail.com>
References: <20261127095029.3280-1-sreekuttan2156239@gmail.com>
	<20261127100645.3564-1-sreekuttan2156239@gmail.com>
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
X-Rspamd-Queue-Id: 692BA229B3
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.51

On Fri, 27 Nov 2026 11:06:45 +0100,
Sreeraj S Kurup wrote:
> 
> The driver currently ignores errors returned by
> devm_gpiod_get_index() and continues probing. This can cause problems
> when the GPIO provider is not ready and the function returns
> -EPROBE_DEFER.
> 
> Use devm_gpiod_get_index_optional() to handle the reset GPIO as
> optional. If the GPIO is not available, the driver can continue using
> the internal reset mechanism. If GPIO acquisition fails for another
> reason, return the error using dev_err_probe().
> 
> Also, check the GPIO descriptor for NULL in atmel_ac97c_reset(),
> because the optional GPIO API returns NULL when no GPIO is assigned.
> 
> Fixes: 5f10e84934e4 ("ALSA: atmel: convert AC97c driver to GPIO descriptor API")
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
