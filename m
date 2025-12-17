Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA59126E717
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 09:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765962439; cv=none; b=HgEk/MFPz1LBY8qzfkic3j6SKjtrVhGwm48P2/b0GbC4m5ryxBiHSrBPaDA8gy0XltGTJdUFhen2yOL9odIpXgdKpEIlW3uQAostGSq+YSAK50ZHQHzPFZtz3d/pt8jtH/zFsYtnRsh7P5oYpwB79dMl7+yCk2V6e0NSJDdmauw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765962439; c=relaxed/simple;
	bh=h23Wu773KVjL+PpXE2+jmBs+1P2536vQf/sRo4NnJ0Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J1LIBH/9DMln7pSt01Dn788i/AxtTEjpNyoPMuolPfTyjZ3cThyYqbi92p/Akki05nBYEOVgOHdZyfvPbzRJ/bNsCNqw/5Zslz8GpsvG5shI3RUt1hSfv9pJL+UKEokx7IrtuomNNcdpdaXFoZa/J/dws14f1zPj8O4bnCpjOgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fTRmHlEU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zQVxHNmK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yoM+PCO/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YWVue3Ea; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fTRmHlEU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zQVxHNmK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yoM+PCO/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YWVue3Ea"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D227A336C7;
	Wed, 17 Dec 2025 09:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765962436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DIajH9RMMxcHtX9MgZD+qVfJuYlovd1DpZEhXMf7Gts=;
	b=fTRmHlEUFYjpVb60ltOvc6x7Ug4mdF8e3ZXTZweC2uboFxs5hM39Q8tbH0NezzUqFg6F2t
	D5SwDS0BsuQxTnSuN83jixnJRWTWQeaDLky1x/jgat5fRSJ/yw2xTs5w9GdlSSaYfNdXZe
	2w4F6YLS6EZMoWGZA9Eh7ccy3gjwLO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765962436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DIajH9RMMxcHtX9MgZD+qVfJuYlovd1DpZEhXMf7Gts=;
	b=zQVxHNmKKkRaidnIMrpjTo+z9mQGWd/aH89LxRDLo/jqIv8Y5iZtAfeGcsnNVfvf7L3bUt
	dfFgCAz2uMOCSkCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="yoM+PCO/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YWVue3Ea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765962434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DIajH9RMMxcHtX9MgZD+qVfJuYlovd1DpZEhXMf7Gts=;
	b=yoM+PCO/ODU91cfQuOBuH6IOt8Z9uvmKoK9y6UoOwvghxxV2OfGvSTHq6Il6acLopsWEVw
	RTORK2tqrKPGhxS9TctZP4aOY11ZCoTW2LmJ4UfEYFwcfWqkz4E+LyXCTtlgyPIzrOzV1W
	E6E7lNwayh9c/1ajH9OKszQC0MyOAXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765962434;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DIajH9RMMxcHtX9MgZD+qVfJuYlovd1DpZEhXMf7Gts=;
	b=YWVue3EabuNoV3GOHkk0+KidViW71DHzRLQ6jwVyuoq4rDWSy4zU3bn/23nxZJGNzN88N+
	ssm0YzcjJRHwrXCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F1A63EA65;
	Wed, 17 Dec 2025 09:07:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7S2fJcJyQmnVUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Dec 2025 09:07:14 +0000
Date: Wed, 17 Dec 2025 10:07:14 +0100
Message-ID: <87zf7hcw8t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1 0/2] ALSA: hda/realtek: Add support for various HP Laptops using CS35L41 HDA
In-Reply-To: <20251216164830.832148-1-sbinding@opensource.cirrus.com>
References: <20251216164830.832148-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: D227A336C7
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Tue, 16 Dec 2025 17:48:11 +0100,
Stefan Binding wrote:
> 
> Add support for HP Clipper and Trekker laptops.
> 
> Laptops use 2 CS35L41 Amps with HDA, using Internal boost, with I2C
> 
> Stefan Binding (2):
>   ALSA: hda/realtek: Add support for HP Trekker Laptop
>   ALSA: hda/realtek: Add support for HP Clipper Laptop

Applied both patches now.  Thanks.


Takashi
