Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A808495504
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658121; cv=none; b=ZF+Pr+kFJRbusn7WeJOdT2Sri2I5z3IwUm+jBDJV44kIDcW9Nm2aaZjkfx9ufUUASrFnxvGp7+rUq2c1bnI7x5lRBDrXjkh83C3xV+piqCdmpJVRCIY8Ps7TzDz28mvVe3w4g/Lu7BlzcjWRR7WvOvzOQmvV34zj3E24TTrL/N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658121; c=relaxed/simple;
	bh=OiKshe66dJtePtXGboKDz0heR7/v0AuKOdfOh9P+03A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fZ9MEYikQq2hHL16YrnjHFqRtH2gb28hGSGDBjJnw4ZDSxhx/7BaLcHRN5xEHyeheMPZniGB41jF4UWdU9ONrmFZV2WebMmDRIcXkhq099miLeUDjEQgvBegGQInikPhNyTdpBc1v2wYZonaYxhQYN+SIisILksenOsksbUgKr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OFTdzWtu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=16ScpZoN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OFTdzWtu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=16ScpZoN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OFTdzWtu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="16ScpZoN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OFTdzWtu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="16ScpZoN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 32559759BC;
	Fri,  5 Jun 2026 11:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780658118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bLIya4++p2YUd5hDwAHYQF93YbqA5SZRnGelbI5ja2s=;
	b=OFTdzWtulEsMYhfCfjnG2sgENmiqCLQFnMcEyXREpD6BNycwF6Xk6aQjx2EXktxWY6Msf5
	5yVeImXtutz5rwYtOzBbbL/kAnNaHvaWF2DMx6q/SWAZ+BjIKI0oKYgQvWv8ixwV5opbT7
	KY9j8Rkm/gY/yuWCNJQ9Cw5Rj6OWW1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780658118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bLIya4++p2YUd5hDwAHYQF93YbqA5SZRnGelbI5ja2s=;
	b=16ScpZoN6oFbjKiIRfu6UDAST9+2jEkJWD96YdPa8jQnAYBaSDxWlJF4bx8itNxXCUFuYh
	/Y+ifrOa4ZSqkRBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OFTdzWtu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=16ScpZoN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780658118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bLIya4++p2YUd5hDwAHYQF93YbqA5SZRnGelbI5ja2s=;
	b=OFTdzWtulEsMYhfCfjnG2sgENmiqCLQFnMcEyXREpD6BNycwF6Xk6aQjx2EXktxWY6Msf5
	5yVeImXtutz5rwYtOzBbbL/kAnNaHvaWF2DMx6q/SWAZ+BjIKI0oKYgQvWv8ixwV5opbT7
	KY9j8Rkm/gY/yuWCNJQ9Cw5Rj6OWW1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780658118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bLIya4++p2YUd5hDwAHYQF93YbqA5SZRnGelbI5ja2s=;
	b=16ScpZoN6oFbjKiIRfu6UDAST9+2jEkJWD96YdPa8jQnAYBaSDxWlJF4bx8itNxXCUFuYh
	/Y+ifrOa4ZSqkRBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 020C3779A9;
	Fri,  5 Jun 2026 11:15:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wm5WOsWvImo+DwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 05 Jun 2026 11:15:17 +0000
Date: Fri, 05 Jun 2026 13:15:17 +0200
Message-ID: <87wlwdtf0a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: tiwai@suse.com,
	perex@perex.cz,
	wangdicheng@kylinos.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] ALSA: usb-audio: qcom: Use PAGE_ALIGN macro for buffer size calculation
In-Reply-To: <20260605031611.69550-1-wangdich9700@163.com>
References: <20260605031611.69550-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 32559759BC
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Fri, 05 Jun 2026 05:16:11 +0200,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Use the kernel's PAGE_ALIGN() macro instead of open-coding the page
> alignment calculation. This improves code readability and follows
> kernel coding style.
> 
> The manual calculation:
>   mult = len / PAGE_SIZE;
>   remainder = len % PAGE_SIZE;
>   len = mult * PAGE_SIZE;
>   len += remainder ? PAGE_SIZE : 0;
> 
> is equivalent to:
>   len = PAGE_ALIGN(len);
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
> v1->v2:
> Remove unused variables 'remainder' and 'mult' to fix W=1 build warnings
> reported by kernel test robot.

This has been already addressed on for-next branch.


thanks,

Takashi
