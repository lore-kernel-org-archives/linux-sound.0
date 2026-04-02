Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68C23D47BA
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775126640; cv=none; b=D3TcCiJkApwKdfQOuxLFR4wOvstkEUFvABkyerJJnx1W366F70jgfYbS0IfM6LQjvG3ysRxPzn0sBVY0V6VKMnHV2Hc6Dh1Dbb58YINnGomiSJ1j7irnXbmmlAR8rK9F5QT2dB/xi109hqj+FJIIpBWp35WCNZoqNPDmOWObdTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775126640; c=relaxed/simple;
	bh=8+cVRrgj+wP9qDR7skRbAFD75d0HdLjHo8MqVoAtK6o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LIh1vrFviK3H5o5whr9/yx6VEH3ngs3wsMSX2NMEOgMKu75Vx69ZR7A7ti3VUQ/KtAf/Q3s+5vJCwZ9PGrYpEX673LBAcDv80ga+PF+cKPmiUec34PPfb7p5UNoLUPJWs1jiBisObLdy239FFhbGvwBQGgZqGhWAmFb/4zmocwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qON8VJId; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JsxMkKa5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SUxG7qAN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T8l5TbrU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qON8VJId";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JsxMkKa5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SUxG7qAN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T8l5TbrU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E4D785BD9E;
	Thu,  2 Apr 2026 10:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775126637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TEXmNjrjG/wLUIR75UWQeZu+rGm41vF2yGZ3uqcagsw=;
	b=qON8VJId7QzX8KDGvjIiYxPtokIuorAbXIX8ZK00EQQMKbT7bJMCOpKKwQ3zhUtJLxWSvo
	GZYyoiQLDdoKQrAAHkHnZGwk0ZrA/NIdcPpzzTT9PaezWKElu9PWD98Jvgnz0xYG4tnZbc
	K3G+2AZsmGMRHG+OGDyC2Nz4MPRZQNE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775126637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TEXmNjrjG/wLUIR75UWQeZu+rGm41vF2yGZ3uqcagsw=;
	b=JsxMkKa5A3nmdCZ+2boo9mbV3jd1gXQGSQEpi5NIeX4yEaNtFJwkw8Pw/YsPjSzDi/Kd9Y
	b4wQgGHehJ/d9VCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SUxG7qAN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=T8l5TbrU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775126636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TEXmNjrjG/wLUIR75UWQeZu+rGm41vF2yGZ3uqcagsw=;
	b=SUxG7qANHeE9CYK6SfudC8guneEnYcJ0b62GFKv62XBSZioj2tT0TVEKUTN8AGEqP1RUwC
	SN4+nKFBUiFZNW64OTOoCk4QNCai02OjJ347kc4z+UgDlHzF3GFCJP4YnuDJijv2rxCJL5
	uXHB7LY9E7BiDT5IVCaEUTYFgYeGII0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775126636;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TEXmNjrjG/wLUIR75UWQeZu+rGm41vF2yGZ3uqcagsw=;
	b=T8l5TbrUoh5GskRan3P2Yz9JaKr+XmNIBtI49I1P1JiH8q8W9UxWC7XT7xJFoaYLPTel6N
	I/cdhhTISKO5LDCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B71FD4A0B0;
	Thu,  2 Apr 2026 10:43:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9ZOEK2xIzml9MwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 02 Apr 2026 10:43:56 +0000
Date: Thu, 02 Apr 2026 12:43:56 +0200
Message-ID: <87tsttiqvn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: johannes@sipsolutions.net,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH 1/2] ALSA: aoa/onyx: Fix OF node leak on probe failure
In-Reply-To: <20260402023541.54476-1-wangdich9700@163.com>
References: <20260402023541.54476-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.986];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: E4D785BD9E
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 02 Apr 2026 04:35:41 +0200,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Add missing of_node_put() in the error path.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
>  sound/aoa/codecs/onyx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/aoa/codecs/onyx.c b/sound/aoa/codecs/onyx.c
> index 04961c456d2c..fea12d3a06a9 100644
> --- a/sound/aoa/codecs/onyx.c
> +++ b/sound/aoa/codecs/onyx.c
> @@ -985,6 +985,7 @@ static int onyx_i2c_probe(struct i2c_client *client)
>  	printk(KERN_DEBUG PFX "created and attached onyx instance\n");
>  	return 0;
>   fail:
> +	of_node_put(onyx->codec.node);
>  	kfree(onyx);
>  	return -ENODEV;

This error path is used commonly for the code path before
of_node_get(), hence you can't put of_node_put() unconditionally.

You'll need another goto label for of_node_put() and the error path
from aoa_codec_register() should jump to it.


thanks,

Takashi
