Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524591;
	b=FtT6YKBtEk2qs4znOXK8Hx+4eEJmeZiFo+8st9FFc79H75zvNbenpOGFnUaheGumJUg7
	 EOhMzQmM/tk1xwe+bxTINOOD+Bnch8dMtBSodz4YRp2NA7BGo7KtueXqZP0K1BeW3Cwv+
	 BH7zF4crjnytnmnqxbtc7KxohESUJzUAWaCRwphfdGr1ZU+Lc51Hm71/WWjdNx4FvFyAs
	 tqqtRVAa+IXF1OplRCZAqVXL/hWRMeJSb4X28PQpTGSZzSqgf3Or0w8RMNpxw0rPnuBPo
	 iL7lp0neNGRS/kFx27Ar7e/X6fxJMjyf9j2ogRjaBSzwg1OTqppiXGQuxqNlqhf6yYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524591;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=2Ar3R0sAiavmEDCbC3boywkQQn01DRass16tsmxBk6w=;
	b=mo98JEE78qYxgXQfmTe8CIcp13FmwsWhGZFL3qOlmY1qg8RP18lBQJdOP214ThikpXoC
	 9f6o2G3JD1GkXqvDaiWjliWv9trGHBZ7YNQ5EFbS4RHkWt602p8yhl79h7SqKEEsoBqt2
	 0wa8zDirPqYw5XEG4sAwJs+6nOqCwmv23KhdHnUkSRRLvhPokvqXOux+cjwUpXEvfmwIG
	 +1WAydzqNP8UuQJJbrLopPECkqwZXf5kxS4jYyxiQmEVeRYwN62YLQmwTu8Kzu+7CUAmK
	 Hh4J3/Y3tuv4rVpXXQO9qwqoSiuCwS4ST6heKSoY0llpwJ+SvClLpNelQSTD3u+mp8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pg3nKz4t;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=nazSh38p;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pg3nKz4t;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=nazSh38p;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25BE606A32A;
	Tue, 24 Nov 2026 12:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C25BE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pg3nKz4t;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=nazSh38p;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pg3nKz4t;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=nazSh38p
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D96F71F7CC;
	Tue, 24 Nov 2026 12:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Ar3R0sAiavmEDCbC3boywkQQn01DRass16tsmxBk6w=;
	b=pg3nKz4tEtfTxJE/0LlP7QmFw6JI8Hda8ESG35EhvPQIQbM89YkD3+WESVGNZsR2oKjjbH
	HEPY2hxNOe+ON3DZd8NSmitHnqFY7Z2Wq2kF/JwaCIjIn/MO+91iJPK/F7Dcw5LofzuzKJ
	Dw9ed9R/pY/pXwIaZ7ydIdhHaFzm90I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524588;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Ar3R0sAiavmEDCbC3boywkQQn01DRass16tsmxBk6w=;
	b=nazSh38p/6vEGr6URw707d+D7Edj4mXay1XY8SId6zAomDsA5nLHGbzEp+Tjncnyb76qsy
	X3bOMP4bRpdo+YBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pg3nKz4t;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nazSh38p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Ar3R0sAiavmEDCbC3boywkQQn01DRass16tsmxBk6w=;
	b=pg3nKz4tEtfTxJE/0LlP7QmFw6JI8Hda8ESG35EhvPQIQbM89YkD3+WESVGNZsR2oKjjbH
	HEPY2hxNOe+ON3DZd8NSmitHnqFY7Z2Wq2kF/JwaCIjIn/MO+91iJPK/F7Dcw5LofzuzKJ
	Dw9ed9R/pY/pXwIaZ7ydIdhHaFzm90I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524588;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Ar3R0sAiavmEDCbC3boywkQQn01DRass16tsmxBk6w=;
	b=nazSh38p/6vEGr6URw707d+D7Edj4mXay1XY8SId6zAomDsA5nLHGbzEp+Tjncnyb76qsy
	X3bOMP4bRpdo+YBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A13C41339F;
	Tue, 24 Nov 2026 12:49:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IpV3HuyHBWuqGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Nov 2026 12:49:48 +0000
Date: Tue, 24 Nov 2026 13:49:44 +0100
Message-ID: <87tsl69yxj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: uni.lorenzo.a@gmail.com
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable speaker amp on ONEXPLAYER X1 i
In-Reply-To: <20261123-oxp-x1-amp-v1-1-8b61da12d092@gmail.com>
References: <20261123-oxp-x1-amp-v1-1-8b61da12d092@gmail.com>
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
X-Rspamd-Queue-Id: D96F71F7CC
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -11.01

On Mon, 23 Nov 2026 20:05:05 +0100,
Lorenzo Argentieri via B4 Relay wrote:
> 
> From: Lorenzo Argentieri <uni.lorenzo.a@gmail.com>
> 
> The internal speakers of the ONE-NETBOOK ONEXPLAYER X1 i (Intel Core
> Ultra 7 155H, ALC245, subsystem ID 1f75:1602) are almost inaudible on
> Linux. They are driven by a Realtek smart amplifier at I2C address 0x10,
> behind the ALC245 coefficient tunnel. The firmware leaves the amplifier
> unconfigured, and the Windows driver programs it at initialization.
> 
> Add a fixup that replays the register writes of the Windows driver
> through the tunnel: coefficient 0x24 selects the amplifier, 0x25/0x26
> hold the register address, 0x28 the value, and writing 0xb023 to 0x29
> starts the transfer. Bit 5 of 0x29 is a self-clearing go bit; poll it
> instead of using a fixed delay (a write completes in about 200 us).
> 
> The sequence was captured from Windows by the onexplayer2pro-audio-fix
> project and decoded here. Its reads and address probes were dropped,
> leaving 46 amplifier register writes. The fixup runs at every codec
> init, so the configuration is restored after system resume.
> 
> Tested on ONEXPLAYER X1 i, BIOS 2.42, after a full power-off: a test
> tone played through the speakers and recorded by the internal microphone
> is about 50 dB louder with this fixup than without it.
> 
> Link: https://github.com/feederchain/onexplayer2pro-audio-fix
> Signed-off-by: Lorenzo Argentieri <uni.lorenzo.a@gmail.com>

Applied to for-next branch.


thanks,

Takashi
