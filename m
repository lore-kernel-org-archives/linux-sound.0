Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1426E1E4AE;
	Wed, 15 Jan 2025 08:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736928135; cv=none; b=tA8sA9bTKZsfv4GQic/FgwZCHbzctKrwE2o3t2VpPwKWmax2xWZTAM6PkqEIOlqR8f8XeykogJJHiAUJg5zKa3IcqjHSEwdL9tfhaM5QYgJxsCtdN0W+HyMs8SmKId57parsdrxer6vNjPvtl13aCZZYnVp+7gZYFtDRhwVzfxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736928135; c=relaxed/simple;
	bh=k1yV5WXm3bdDqPhh5AIWajkaIsPyqmO1+L3Qs+ST6kc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Co02raSL6PkjKg/lKPS83feYxpKg1qkCR4PYFvdX0TKneK4kQggrHAvi9ZCw2PFstUmrp7u0QGl4Rlu+GNd7VNpEkYn8sxFJMqWkcBG8EZ+8XSIhAHpmI6wc8dm1Lq7E6R9jmG9lzQAq0Xs3dGLz1/zFWM4uF4QFPJx2TdkZHaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v38vEMXw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OyLBgOeY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v38vEMXw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OyLBgOeY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v38vEMXw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OyLBgOeY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v38vEMXw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OyLBgOeY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 24E8F2121E;
	Wed, 15 Jan 2025 08:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736928132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q6rqe/ovCI5Zd8mvoJXuX7jFqPgqkLuSJ3K5N5sTdls=;
	b=v38vEMXwkyvR4N1EYKhKVp4KxIAaaCu/lw5B/SlraaZpXQN1uu6z/QaQvgE5Ir9VprdEHT
	WeAapFqy/C+Id96cSd7jyvO8ThV+w5CjQbs6Mpy7dJc8ZX+g0ksV8Onl2LL0uM8aGmXXDb
	LYNudbRRSAuM0PJEMk0jJ8wzHiX849U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736928132;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q6rqe/ovCI5Zd8mvoJXuX7jFqPgqkLuSJ3K5N5sTdls=;
	b=OyLBgOeYwP8AKAqkbpv1UMIV8AGPcGGwtu+3GeHKnKTqgkfY8TprPIeBWS5skcryYOBgvi
	0FF9Ij6S7DOlitDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v38vEMXw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OyLBgOeY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736928132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q6rqe/ovCI5Zd8mvoJXuX7jFqPgqkLuSJ3K5N5sTdls=;
	b=v38vEMXwkyvR4N1EYKhKVp4KxIAaaCu/lw5B/SlraaZpXQN1uu6z/QaQvgE5Ir9VprdEHT
	WeAapFqy/C+Id96cSd7jyvO8ThV+w5CjQbs6Mpy7dJc8ZX+g0ksV8Onl2LL0uM8aGmXXDb
	LYNudbRRSAuM0PJEMk0jJ8wzHiX849U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736928132;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q6rqe/ovCI5Zd8mvoJXuX7jFqPgqkLuSJ3K5N5sTdls=;
	b=OyLBgOeYwP8AKAqkbpv1UMIV8AGPcGGwtu+3GeHKnKTqgkfY8TprPIeBWS5skcryYOBgvi
	0FF9Ij6S7DOlitDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C2D1D139CB;
	Wed, 15 Jan 2025 08:02:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lFzNLYNrh2d1cgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Jan 2025 08:02:11 +0000
Date: Wed, 15 Jan 2025 09:02:11 +0100
Message-ID: <878qrcld30.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"lina@asahilina.net" <lina@asahilina.net>,
	"mbarriolinares@gmail.com"
	<mbarriolinares@gmail.com>,
	"wangdicheng@kylinos.cn"
	<wangdicheng@kylinos.cn>,
	"cyan.vtb@gmail.com" <cyan.vtb@gmail.com>,
	"dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
	"bsevens@google.com"
	<bsevens@google.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add delay quirk for USB Audio Device
In-Reply-To: <TYUPR06MB6217F6DFCF671E7B0E001D9ED2192@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217F6DFCF671E7B0E001D9ED2192@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 24E8F2121E
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,asahilina.net,gmail.com,kylinos.cn,linaro.org,google.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 15 Jan 2025 07:45:33 +0100,
ºúÁ¬ÇÚ wrote:
> 
> From: Lianqin Hu <hulianqin@vivo.com>
> 
> Audio control requests that sets sampling frequency sometimes fail on
> this card. Adding delay between control messages eliminates that problem.
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Could you give a bit more specific name / model to both the subject
and the quirk comment?  Then it'd be more helpful for people who read
/ check the changes later.


thanks,

Takashi


> ---
>  sound/usb/quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 8ba0aff8be2e..7968d6a2f592 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2239,6 +2239,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>  		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
>  	DEVICE_FLG(0x0c45, 0x6340, /* Sonix HD USB Camera */
>  		   QUIRK_FLAG_GET_SAMPLE_RATE),
> +	DEVICE_FLG(0x0d8c, 0x0014, /* USB Audio Device */
> +		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
>  	DEVICE_FLG(0x0ecb, 0x205c, /* JBL Quantum610 Wireless */
>  		   QUIRK_FLAG_FIXED_RATE),
>  	DEVICE_FLG(0x0ecb, 0x2069, /* JBL Quantum810 Wireless */
> -- 
> 2.39.0
> 
