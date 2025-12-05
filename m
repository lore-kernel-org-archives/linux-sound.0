Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29982D8371
	for <linux-sound@vger.kernel.org>; Fri,  5 Dec 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764944907; cv=none; b=dhFHbbnla+hU+RwJyeb2DQJQFYXAA0cY7pgsPu856rVzP4xuy3DC9qv/6XA2/Zm2oPm7CfAB6gDQ3O1TWuEEEwnw8H0mkgMjgcA0EmAEIV64ubYOIamkaz8nIlLqgtuk3bveIx7I79bbSdHpsx8diDuOU1/IYTAbhPei/AlLs5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764944907; c=relaxed/simple;
	bh=H2am5Msd5JxBDWhC9olw5+yVg1bmNKJ6obwvH105yvQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HHd3yMa4FWpmnWHnGdv/H2YWmkOnXeA+8u2iL7sdHx4r9vVl2h56FLvXjrDqTmrAByADCdna0DiGcow6uL2YR8I2Ir0jqEYFIc3wlGZq0AOCXCOMzZZ+c+QX+y1iiJbQQu3Adum1i5zdtxcjKUnLOPVeTDxxw1Wj1m2o5+A/6qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D2Hm0pzS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mXD71AeB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hJwqfzeR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a3g00qzv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D2Hm0pzS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mXD71AeB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hJwqfzeR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a3g00qzv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AA6715BCD5;
	Fri,  5 Dec 2025 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764944900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tN0HPwrhrKnYU4O2wQ2B617JcSipmxshXhpJlRKA3yQ=;
	b=D2Hm0pzSpiC1N5rSHl3Kwl+8SVZM4a1cYemavUV28c2W56oKrVSBbnP6XVzgfDtCLpbMO5
	DjuIIjlpjqOuiSywPGtS35bndBwuqfCOkDjR1r5fa7lOeIsa3AjTggU7ijYkOMqcvRmOIs
	npC0KQHbA5ev7n6esR0H9z0prLok/g0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764944900;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tN0HPwrhrKnYU4O2wQ2B617JcSipmxshXhpJlRKA3yQ=;
	b=mXD71AeBPMXR88CZCcw6pA/sf0NlDjZRpaCuRTpFVpuUFdf9eozVM98xMHUTnUZUDSZZWG
	6QoGGN+cMvSx4IDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hJwqfzeR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=a3g00qzv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764944899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tN0HPwrhrKnYU4O2wQ2B617JcSipmxshXhpJlRKA3yQ=;
	b=hJwqfzeR9j+wASHfz9mcFPr2IY2NSl2V3Q4p98QQ/kC7VTkcrYJo1O8tYLXnPEes1wYIDt
	kJ1l18eUqzNAF24YRLVa49X2OOzNaGaT7d/iMyK4GtmF6xluLsPtJkM3sfrx9k38FkVfe9
	46T8Xku0G+/BZlJMRPLdzWm1sPvDNQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764944899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tN0HPwrhrKnYU4O2wQ2B617JcSipmxshXhpJlRKA3yQ=;
	b=a3g00qzvkSN1Hb5b46BeiKRs9WV1lGAAriIjjOPDtJ2PhAtQVRqvNkS7VB9n+6Napvt9sB
	9mipuqDhqC4hi2Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5769A3EA63;
	Fri,  5 Dec 2025 14:28:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9wkQFAPsMmmgBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 05 Dec 2025 14:28:19 +0000
Date: Fri, 05 Dec 2025 15:28:18 +0100
Message-ID: <87pl8tvw8t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: hariconscious@gmail.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	cristian.ciocaltea@collabora.com,
	cryolitia@uniontech.com,
	franta-linux@frantovo.cz,
	khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] ALSA: usb-audio: Initialize status1 to fix uninitialized symbol errors
In-Reply-To: <20251204052201.16286-3-hariconscious@gmail.com>
References: <20251204052201.16286-3-hariconscious@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: AA6715BCD5
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,collabora.com,uniontech.com,frantovo.cz,kernel.org,gmail.com,vger.kernel.org,suse.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Thu, 04 Dec 2025 06:22:03 +0100,
hariconscious@gmail.com wrote:
> 
> From: HariKrishna Sagala <hariconscious@gmail.com>
> 
> Initialize 'status1' with a default value to resolve the static analysis
> smatch reported error "uninitialized symbol 'status1'".
> The 'status1' variable is used to create a buff using "kmemdup".
> So, ensure to initialize the value before it is read.
> 
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>

Applied now.  Thanks.


Takashi
