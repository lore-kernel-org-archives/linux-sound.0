Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98803E51D4
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936916; cv=none; b=SlvzQhG7mqGwWggS2Pd38ySqFJMNgE60S5L+zQOG3u9bVLjkgy8XtgC0Ao4B/cSGbarqN0TLtsgeM7CxWL6pRzr6lFRdMeeZan9f67X8mMGPehzUHlWHOwy35mLLHd5XKrPnRkykGVunJsdJmDAYI65ZL5zIWZJ5UENa5HThMY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936916; c=relaxed/simple;
	bh=ifH81RLNeGU50xrHXrzIDjplpU+hH1KaweiHR36h8CQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BGdjk7f33TyJgfz0hynd/VvML0Zf05u3vpXlQyyw1wjC9ludrN7LzHjZYLagtlJjcdIvctqyOCju/Wuw9c7f0Tif1eGYmulcQUU6+D2MOauUom93JnATkhV6i63KTGbdlzUgpEmhtbVF46z9hCRxzQLkVLWweAaB7dCakZmaQXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cTTUa1g4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n1R81TRH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cTTUa1g4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n1R81TRH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cTTUa1g4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n1R81TRH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cTTUa1g4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n1R81TRH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5DEBB773F7;
	Mon, 13 Jul 2026 10:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783936911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SPUhIrVjg5lbmO6Tzvh3qCe+6ZawiyTouYdo37xABbk=;
	b=cTTUa1g415RHlrrjofZLaTLCblPLlx7XUV5ebzmLT738AJQQBedq8nRVi+Wslet+F7FVCC
	CdhV9OvJoklhFIYVbJXjdO6BfBIR08vpTcytTvo+yk1kmgfOEErdCDkIeLz8d9e9kd0JaT
	DAzjIYiaV9Dbbbm5DniW78zb4qH5Gas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783936911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SPUhIrVjg5lbmO6Tzvh3qCe+6ZawiyTouYdo37xABbk=;
	b=n1R81TRH2zLabTMze0foO2FjrNj3uqc5wuOtmXJDBRWYhlFqwtlRRTpsDgC/eOJBPAg5bZ
	cxohij5/uel0SbBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cTTUa1g4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=n1R81TRH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783936911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SPUhIrVjg5lbmO6Tzvh3qCe+6ZawiyTouYdo37xABbk=;
	b=cTTUa1g415RHlrrjofZLaTLCblPLlx7XUV5ebzmLT738AJQQBedq8nRVi+Wslet+F7FVCC
	CdhV9OvJoklhFIYVbJXjdO6BfBIR08vpTcytTvo+yk1kmgfOEErdCDkIeLz8d9e9kd0JaT
	DAzjIYiaV9Dbbbm5DniW78zb4qH5Gas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783936911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SPUhIrVjg5lbmO6Tzvh3qCe+6ZawiyTouYdo37xABbk=;
	b=n1R81TRH2zLabTMze0foO2FjrNj3uqc5wuOtmXJDBRWYhlFqwtlRRTpsDgC/eOJBPAg5bZ
	cxohij5/uel0SbBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BCC54779AE;
	Mon, 13 Jul 2026 10:01:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +1DWLI63VGreGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Jul 2026 10:01:50 +0000
Date: Mon, 13 Jul 2026 12:01:50 +0200
Message-ID: <87y0ffyzqp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: phucduc.bui@gmail.com
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Ziqing Chen <chenziqing@xiaomi.com>,
	Kees Cook <kees@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Len Bao <len.bao@gmx.us>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	Mehul Rao <mehulrao@gmail.com>,
	u.kleine-koenig@baylibre.com,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Dewei Meng <mengdewei@cqsoftware.com.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: core: Clean up file_operations definitions
In-Reply-To: <20260708140624.562403-1-phucduc.bui@gmail.com>
References: <20260708140624.562403-1-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 5DEBB773F7
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.us];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,perex.cz,suse.com,gmail.com,xiaomi.com,gmx.us,baylibre.com,linutronix.de,cqsoftware.com.cn,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Wed, 08 Jul 2026 16:06:24 +0200,
phucduc.bui@gmail.com wrote:
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Align file_operations initializers with tabs to match the standard
> kernel coding style and improve readability.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
