Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56B6189B84
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776173515; cv=none; b=EmU9mbMdlLtU5rGBhfYgSOeQmkHlOjbqDg52TkIUXq6aVY9JssAA3FUjPNwxb8uy+WsAbIURnvZKjDmRjsPWpdN/r0cZ8QCe7N3Iq3BVImi+Bgf90XRrj8cYP2MBbDsYb4oFwqBOpn5rFEW0tC5tZorsYdE0HYiZCYU8BVT//jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776173515; c=relaxed/simple;
	bh=DA47YLA8+iH7EKUyDkkru1Zwz/1IB1OgGUzmDngHtlY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kwCGM+7m2//bpaT17QNc0T3hEHUEHZXV+X1Ns8Q9acToRVHkG2MhdbAyzgeXewacd9pmUy+DhgbprFWTolQnaJcSwIICMEKjtkA/n2rL2bXOZIAV/qdhKLyyJ2MMxowjP6wJZ/zrpDjpS0hEKkt3OCwBjCPQg9b7jzXEI2wZBgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nD9ZTmgh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m8AAg6Bc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nD9ZTmgh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m8AAg6Bc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nD9ZTmgh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m8AAg6Bc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nD9ZTmgh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m8AAg6Bc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 244D26A906;
	Tue, 14 Apr 2026 13:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776173512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8knfCaqAx482469gGvSsU0Xu/1N+7BGizQbTdNW3ft4=;
	b=nD9ZTmghK9QVRxGwnORAqjZwNENIMXxb4e/gCtCfk0zelXJU267if4rHLmxTSSwdWXred1
	uZNiKyFGThPilM8RgvLyJVCGHYunzYyXNT4ZxNE07QtXjOOWWc/Mlur92UCyI6HnT17HbI
	TXOxEy6EkQxmNTneTdx115XwA2ad+5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776173512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8knfCaqAx482469gGvSsU0Xu/1N+7BGizQbTdNW3ft4=;
	b=m8AAg6Bc+EsvCZPl+tY4MB/2q3O4VZLWibaKG4/19OU/l2oBge71JdiCaOkt1t58p8TSGl
	/vbhgWTZPIvKANBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nD9ZTmgh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=m8AAg6Bc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776173512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8knfCaqAx482469gGvSsU0Xu/1N+7BGizQbTdNW3ft4=;
	b=nD9ZTmghK9QVRxGwnORAqjZwNENIMXxb4e/gCtCfk0zelXJU267if4rHLmxTSSwdWXred1
	uZNiKyFGThPilM8RgvLyJVCGHYunzYyXNT4ZxNE07QtXjOOWWc/Mlur92UCyI6HnT17HbI
	TXOxEy6EkQxmNTneTdx115XwA2ad+5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776173512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8knfCaqAx482469gGvSsU0Xu/1N+7BGizQbTdNW3ft4=;
	b=m8AAg6Bc+EsvCZPl+tY4MB/2q3O4VZLWibaKG4/19OU/l2oBge71JdiCaOkt1t58p8TSGl
	/vbhgWTZPIvKANBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D51DC4B482;
	Tue, 14 Apr 2026 13:31:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Lqq1MsdB3ml8RAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Apr 2026 13:31:51 +0000
Date: Tue, 14 Apr 2026 15:31:51 +0200
Message-ID: <87340xsm60.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ziqing Chen <chzq96@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ziqing Chen <chenziqing@xiaomi.com>
Subject: Re: [PATCH v2] ALSA: control: Validate buf_len before strnlen() in snd_ctl_elem_init_enum_names()
In-Reply-To: <20260414132437.261304-1-chenziqing@xiaomi.com>
References: <20260414132437.261304-1-chenziqing@xiaomi.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 244D26A906

On Tue, 14 Apr 2026 15:24:37 +0200,
Ziqing Chen wrote:
> 
> snd_ctl_elem_init_enum_names() advances pointer p through the names
> buffer while decrementing buf_len. If buf_len reaches zero but items
> remain, the next iteration calls strnlen(p, 0).
> 
> While strnlen(p, 0) returns 0 and would hit the existing name_len == 0
> error path, CONFIG_FORTIFY_SOURCE's fortified strnlen() first checks
> maxlen against __builtin_dynamic_object_size(). When Clang loses track
> of p's object size inside the loop, this triggers a BRK exception panic
> before the return value is examined.
> 
> Add a buf_len == 0 guard at the loop entry to prevent calling fortified
> strnlen() on an exhausted buffer.
> 
> Found by kernel fuzz testing through Xiaomi Smartphone.
> 
> Fixes: 8d448162bda5 ("ALSA: control: add support for ENUMERATED user space controls")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ziqing Chen <chenziqing@xiaomi.com>

Applied now.  Thanks.


Takashi
