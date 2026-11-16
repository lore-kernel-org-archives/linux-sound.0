Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831514;
	b=Zjtvu37d/p7g/9EpXZIrKH+H0hlsEW4VhvqVqGq3DlQaiEgZTOhppWhxfe+YfOeiiD36
	 poNDVuXdpcgBABTAsYNoxxjB6BrcDd6IJarJQ9jEV3vw0GNBv9Dt7T7xf3AH8vXXgz6yI
	 E1BVteUi4xio0GTL4VxTwUMd/pArY4V274goSbAiibEVV6Adx1IJfj4VkmVphKs1V0kRN
	 9kkfQ+jXgb2QnGbOURXmx0agPUIxtvc4xnFIxckt2lL5HQ+shBgtpgz2zZoC8iLKnHGet
	 6gFyaIwutBjktWgex/5oRlKnR0UDDkISS3i8dMP6k8ABeqrsnIjsadDy0OhaklHOpFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831514;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=fHuC57dmgSbzUer9VdrtoxBcg+j0iH/hERY3kZ71ZUA=;
	b=dyKNs0sgas0D01HEOxJo0tryEf31vUqX+gGiKP5KK+t9amF1ROzhxsDmQhka/6pkxyHU
	 5vwdl3UeKGKrh9cyBdw478H/L5HD4Kr4Omzasbvf5JeoUBibt+za866MtmGy2ZulUV9VT
	 9Vtnegv08LCytoSEgjoHzA02Frrba8yBbPXiJDVcamzrmnaP6q+Bk89gSYYSdJmBMHuIu
	 d0TdXSxydh5yUF+ZfNMp/JznsebEDzQZIAaY49Ek0DtXycFcNrzaCUU+fQZk068yDnyre
	 gC5iyq4s+Xue1LV5PRPS3fWehzOA2x7pdXNhFE0pBsCSKShuozAOT74qeNuyzTfM+UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0HhFT7Pw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="olQ9jo/G";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zsRx0fYh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MtbfuDXe;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139FD606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 12:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 139FD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0HhFT7Pw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=olQ9jo/G;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zsRx0fYh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MtbfuDXe
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DDC67221BE;
	Mon, 16 Nov 2026 12:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794831512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHuC57dmgSbzUer9VdrtoxBcg+j0iH/hERY3kZ71ZUA=;
	b=0HhFT7PwpDwfbaQMRUhyaGfk1kfVjNPhl9zcaBgyJ0zPwb3+U946sKC+Vpst1PiUG/UhCt
	5Ksa17emO80yPWHQDjyjK9Mk9/p8kNaw4D/RAFcNo5ym+FG5p+tWkeVl75StCggpJzJl9u
	kCNgauAuUCc+cm/vRtmOitecSUNHZtM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794831512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHuC57dmgSbzUer9VdrtoxBcg+j0iH/hERY3kZ71ZUA=;
	b=olQ9jo/GdYYzoEmZSpId6dJpWSIP0pPLpGmsSEjnxb87TiAz3O0qSjHi8BrxDoOFJn8/Rr
	8Ba3Cr0w8ZH4mRBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zsRx0fYh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MtbfuDXe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794831511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHuC57dmgSbzUer9VdrtoxBcg+j0iH/hERY3kZ71ZUA=;
	b=zsRx0fYhZNottxTeyCUk3tMcsD2M71B7nyxQZhEdZMRcpQ0P/rmaweAyCM263FULGdVKRV
	swox/+439IPpVgcbmoDYLsC5xjJNqdt1Uai6JTx4t2f6uEB9hDVm5WXdJz7Y/LMnh/zB9t
	JvmXNJvkcTEjAcjloQ4H76TFQTvO8mU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794831511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHuC57dmgSbzUer9VdrtoxBcg+j0iH/hERY3kZ71ZUA=;
	b=MtbfuDXeYjOgNfUSb4eEEGZzRCbHMkk61mjir56/gaU/d3FWBEQV2O1sCO04Nq8rFYlaVv
	hlzK1V2MCDHm5DCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94FFD1334C;
	Mon, 16 Nov 2026 12:18:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eyzAGpf0+mrwXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 12:18:31 +0000
Date: Mon, 16 Nov 2026 13:18:31 +0100
Message-ID: <874idhynoo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	Frank Slotta <frank.slotta@posteo.de>
Subject: Re: [PATCH] ALSA: usb-audio: Add always_set_rate quirk for Yamaha MODX M
In-Reply-To: <avnJGI3L/sf7KQCi@m.b4.vu>
References: <avnJGI3L/sf7KQCi@m.b4.vu>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[suse.de:dkim,posteo.de:email,linuxmusicians.com:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: DDC67221BE

On Sun, 15 Nov 2026 16:00:40 +0100,
Geoffrey D. Bennett wrote:
> 
> The Yamaha MODX M uses a different USB ID for each combination of its
> audio mode and MIDI version settings:
> 
>   0499:1772  2 stereo, 44.1-96 kHz, MIDI 1.0
>   0499:1763  2 stereo, 44.1-96 kHz, MIDI 2.0
>   0499:1773  5 stereo, 44.1 kHz, MIDI 1.0
>   0499:1764  5 stereo, 44.1 kHz, MIDI 2.0
> 
> With 0499:1773 and 0499:1764 playback is silent. With the
> always_set_rate quirk flag set for them it plays. 0499:1772 and
> 0499:1763 play without it.
> 
> Tested on a MODX M6 with the quirk_flags module parameter set to
> 0499:1773:always_set_rate and to 0499:1764:always_set_rate.
> 
> Reported-by: Frank Slotta <frank.slotta@posteo.de>
> Closes: https://linuxmusicians.com/viewtopic.php?p=186121
> Cc: <stable@vger.kernel.org> # 7.3.x
> Tested-by: Frank Slotta <frank.slotta@posteo.de>
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>

Applied now.  Thanks.


Takashi
