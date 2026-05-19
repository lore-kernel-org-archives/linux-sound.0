Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED05D36680C
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 06:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779170783; cv=none; b=Hva62PNVYMJm25+52f2UOhy3TLx7/Xxm0usZTmPBb0DH/qsszK/xxtwL+/iemEaDV4MR1mSaqePbOwE0fzTzOxkHVwysuuQ7mXxJ3Xmk6aevsXe5zjSylfxTQVLaxVZuUOPzwUrna+4mfWX6Wd5KhIQo1mahreR3NjIpnV+341U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779170783; c=relaxed/simple;
	bh=pIrrbROApvvLf6FJDUkEicRPkkPkP6ecXXQU0x1bC4o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e5eI0Zezs5LoxGym+EYNX/bfFXsnL2EG0PtBlPrQpU0vjJD2YkEWLYdSmycYd5lyWOc3pPWqu0fCJAz3hqFb4ydxXL0Nsoegam5Rr5kDNE9nzL/K4EWGUnFWsqDazUultVp8qL74cpwnBooZ55QQ5vRHAqrS8sySJDaDlz2eXD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SJ0JKL5T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mFZQHedZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SJ0JKL5T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mFZQHedZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SJ0JKL5T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mFZQHedZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SJ0JKL5T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mFZQHedZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 331C067E00;
	Tue, 19 May 2026 06:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779170780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7+Afa8fPPiz5R0z5g+ecLCn5k6tkM7LpzCkqWaYhvMI=;
	b=SJ0JKL5TajLLVZdyoAdrsSHFySXTW4vk+2fmm3xJJMu+vQXoTKhcMcs/LcFy/3iItkhdgb
	tganuUF9k40JK4PafttE4Ak0V7AJSd5sRk8H9E7Xw4zK6v8S/JxKQKwoSPr8llO/bz9G7C
	yYHAHpbbI60WGdC4qoX8xqH23yI1k4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779170780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7+Afa8fPPiz5R0z5g+ecLCn5k6tkM7LpzCkqWaYhvMI=;
	b=mFZQHedZxT9z4Kf5jbNCKz12W3eFGWphwf4jR7c9Rfouf4OjhyYpdTD9vvRjdowiTTcSOc
	EStywBcO7wd+imCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SJ0JKL5T;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mFZQHedZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779170780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7+Afa8fPPiz5R0z5g+ecLCn5k6tkM7LpzCkqWaYhvMI=;
	b=SJ0JKL5TajLLVZdyoAdrsSHFySXTW4vk+2fmm3xJJMu+vQXoTKhcMcs/LcFy/3iItkhdgb
	tganuUF9k40JK4PafttE4Ak0V7AJSd5sRk8H9E7Xw4zK6v8S/JxKQKwoSPr8llO/bz9G7C
	yYHAHpbbI60WGdC4qoX8xqH23yI1k4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779170780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7+Afa8fPPiz5R0z5g+ecLCn5k6tkM7LpzCkqWaYhvMI=;
	b=mFZQHedZxT9z4Kf5jbNCKz12W3eFGWphwf4jR7c9Rfouf4OjhyYpdTD9vvRjdowiTTcSOc
	EStywBcO7wd+imCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 00B6A593A8;
	Tue, 19 May 2026 06:06:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YNVVNtv9C2oafgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 May 2026 06:06:19 +0000
Date: Tue, 19 May 2026 08:06:11 +0200
Message-ID: <87a4tw3pd8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] ALSA: oss: Use flexible allocation for PCM plugins
In-Reply-To: <20260519004647.627429-1-rosenp@gmail.com>
References: <20260519004647.627429-1-rosenp@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 331C067E00
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 19 May 2026 02:46:47 +0200,
Rosen Penev wrote:
> 
> Allocate PCM plugin objects with kzalloc_flex() for the trailing
> extra data area instead of open-coding the size calculation.
> 
> This keeps the allocation tied to the existing flexible array member
> without changing the plugin lifetime.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
