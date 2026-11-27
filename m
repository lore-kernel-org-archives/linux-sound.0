Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800896;
	b=oP6a0MtmI1/fBr9ryK0IVEK+8b7Wh4ZpwmqHzb/Wv0uHgm4GoI9azIxAjxCKtSN+Xpsf
	 bVY4OhYL5AplK50pC5ka5vKZzS+r47cpkVvcf6tyCyGL1CtH1ic1rZdYzML7A3jxo5Kyd
	 Q8a6zjiQwC+eagu9nogZ1NSKlaC23+PrvVZlaVaF0b1qxhpcSrZSfGTscT6WVITcVOmR+
	 YYTHTUpoke2Uy2kSvJmmikVI48wqBy1C+jk9jmCgO6qZRli+wnFpsd0o7nvB6CqWGcMsi
	 OtaERhOyBHS6b0bG0sL/GHVPoIy1zx7042nQFf7Lxv6AiUKVevewPj41fFo5hWvlJ2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800896;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=kPpGEHG6VovayWI9GFe4l79h9ZltQBudHjaEsgSVKAA=;
	b=YbZZeEl1apKQc7o+4US97VFuT6Auimsu+v7h/lTiegqrB20QeMWn/ZUngs7Po6OJa9Me
	 1UwCFy8kBYBWZq4i8tS6DqBYudGMrjtekXZpSu1zhq7Xbr/xAOsxIqp12UR1591oMCpzk
	 5qWKLQJP8OWpyIhwQ/6YGoZJoesYERU1ChTRZLB/AxTnX24wNwKLbpPstG6e7r4YT1nJO
	 tQ3exTXtgwyUSWV0z0vLwJVlqSz6hstU+N6+lr1pHMJYYFgJdKUk0z6u4W+jSulEuT81C
	 66pj9cNkISlu5wEQkCH8oqyRboi4gMeUDKO+2bqTw5NDG82wNlhYUJw+PKwSyE8ekAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="w/LOKRdt";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eeauQ42b;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=f7xhHznZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=j3BST3hO;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAA1606A31E
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 17:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFAA1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=w/LOKRdt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eeauQ42b;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=f7xhHznZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=j3BST3hO
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 586F821E90;
	Fri, 27 Nov 2026 17:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795800894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kPpGEHG6VovayWI9GFe4l79h9ZltQBudHjaEsgSVKAA=;
	b=w/LOKRdtpKoU84BV5qFL42B3U0UIAzyExO9Lu8qZdnWHkb5DGCfgUgEyf8c/j4jv09BBZ0
	Fd1+p4T8dQDKggYJyuyDm02nDUIPyM0x3FuoTvtuKt3J3oeB0jhYh7zgIoD6RlPA3VmPuY
	EErrq9Jjfr/LJcJNQful+tJTHzC7p68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795800894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kPpGEHG6VovayWI9GFe4l79h9ZltQBudHjaEsgSVKAA=;
	b=eeauQ42bOfdO19pditRWIcXDltzOBcc2wqTgurJwpD6+4tzMKPkrPpe9BPJ20UVUdUofJ0
	Q06SMeGJa/agb3Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795800892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kPpGEHG6VovayWI9GFe4l79h9ZltQBudHjaEsgSVKAA=;
	b=f7xhHznZb/tM0g5h8VIeYyyPUqnMHqo71/k4YdPetcJyYeUbTx3VUpgLUKUalOYcC3hCzG
	bNplZMOp6Hf9eLUORwzIgY2+LMiB1VXGzOMEiIskG1pByBKUub+OGNE0wvagmdhlue7a0r
	u7uiGF53ceT/QeBiYMQ6a2d2vchh4TM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795800892;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kPpGEHG6VovayWI9GFe4l79h9ZltQBudHjaEsgSVKAA=;
	b=j3BST3hOjWTKxjqWQvgvvfFloWDUIw4ZWAscUVOm9zc2i6AdNlMEPmDiUyZl79GH4wWmaq
	D01Bxqg/hE7Uq8AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C1AF134E8;
	Fri, 27 Nov 2026 17:34:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q80nNTu/CWvEEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Nov 2026 17:34:52 +0000
Date: Fri, 27 Nov 2026 18:34:51 +0100
Message-ID: <87bj7amb44.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	cassiogabrielcontato@gmail.com,
	tim.bird@sony.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] sound/oss/dmasound: unregister OSS devices on init failure
In-Reply-To: <20261127045509.333969-1-haoxiang_li2024@163.com>
References: <20261127045509.333969-1-haoxiang_li2024@163.com>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,sony.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Fri, 27 Nov 2026 05:55:09 +0100,
Haoxiang Li wrote:
> 
> dmasound_init() registers dsp, special sound and mixer device
> but never unregisters if something fails. Unregister the devices
> in the error handling path so a failed initialization leaves
> no stale OSS registrations. Also fix some code styles.
> 
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

Applied to for-next branch.  Thanks.


Takashi
