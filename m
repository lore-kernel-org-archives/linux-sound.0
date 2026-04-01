Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64FC3E4C92
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047482; cv=none; b=DMEPr6+7Aovb3H9zZwcCuwT7Uw+YwT6COAh0NRKuWjv+3XFPKmsLiTZOSp+A/ECDo7J94ps0piT+KenEbeyJ8X4uXSCmXELfpRIyq5rHSrlR+s8G5MtbzX4pjl9HQ48712VNBx1XyHnlyp8NhpU43/UQ72UHINOtvJg5sfe0RAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047482; c=relaxed/simple;
	bh=z5nB/npGJEtAVUjbhcZy9g3J/2QhY5ET9IDiYGUvYvM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gihSmz987Rd44CM6rq3wz1CqZGx5IgcpZsP2ydQpsIPYY/1EPkNf36h5ABiYKvW1dgxq4CkZ2N0xmvguu61ICln6Qm5NiKEK2Oswl1DNomIr7tPEojhZQ/EIkTh8IDtLgQLPxLK0rTdWr3vjcugxbJc2D5oSUKJqODd5Q105rIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rGzKRJ2x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QWyBqV+y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YSbZ6HYy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T04Q94es; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rGzKRJ2x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QWyBqV+y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YSbZ6HYy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T04Q94es"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E9DF75BF31;
	Wed,  1 Apr 2026 12:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775047480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e8WcHd17+gbIy3youeuoW44eF9xf+kGknNV/BzxLZm8=;
	b=rGzKRJ2xRLqHBnjzSRFkN0+xZcXgB+QM465GYF3hkqG9fEiQkv3kEKn75cSNyNhuiO0cow
	QqlHbHABx7dVC7WjsjiCOy9ah8DZkQ5PFiyoG7YiveGj8/wfaOinRt/ue2VJcbrB8zqEyE
	1Zy0TmoUYbRRFvNhVPWTB0D41niuquw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775047480;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e8WcHd17+gbIy3youeuoW44eF9xf+kGknNV/BzxLZm8=;
	b=QWyBqV+yFg7m7wVqlH1pKgHAJZ4PKEixObD2jVgSzLVWrgFjbCVuJSGTC2aEK/Rr/0qCm0
	t13LlQR9BjNfXbBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YSbZ6HYy;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=T04Q94es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775047479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e8WcHd17+gbIy3youeuoW44eF9xf+kGknNV/BzxLZm8=;
	b=YSbZ6HYyn1awp1lslxDZsLt8zipte5t9YQfyyCps6EGyqhcMJLFa3TKkHtt0I+cEdOMkLq
	Kv5OWn2wiqeQb3mZaPKL7xkUt9VmeOsAsDDXdBMxjka9mDeBbkQWI6LSnkVQthkK2wSgGv
	o30zDM0U2jU/FS0p+QksI7WoNQXt0YY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775047479;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e8WcHd17+gbIy3youeuoW44eF9xf+kGknNV/BzxLZm8=;
	b=T04Q94esK9wurYlm/9v7XZja1Z6RKKwO9V982rkTTAGHxEAdjUUBC24tMbK5pKOX5P+Z2j
	ClUPeIwlsPyuUSDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 907624A0B0;
	Wed,  1 Apr 2026 12:44:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zgsGIjcTzWmyFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 Apr 2026 12:44:39 +0000
Date: Wed, 01 Apr 2026 14:44:39 +0200
Message-ID: <87h5purgso.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Harin Lee <me@harin.net>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ALSA: ctxfi: Clean up DAIO resource allocation
In-Reply-To: <20260401090159.2404387-1-me@harin.net>
References: <20260401090159.2404387-1-me@harin.net>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: E9DF75BF31
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Wed, 01 Apr 2026 11:01:56 +0200,
Harin Lee wrote:
> 
> Clean up the resource allocation in atc_get_resources() and related
> functions, on top of the recent SPDIFI1 fixes.
> 
> The earlier refactoring introduced a kernel crash on hw20k2, where
> daio_device_index() returned -EINVAL for the SPDIFI1 type and the
> value was used as an unsigned array offset. On my development system
> (64G memory), this did not manifest as a crash, making the bug
> difficult to catch during testing.
> 
> Tested on the real hw20k2 hardware with mem=8G to verify the original
> crash and confirm these patches.
> 
> Changes in v2:
>  - Add atc_spdif_in_type() helper to avoid ternary operators in
>    multiple places
>  - Rewrite the SPDIFI type skip condition as explicit model checks
> 
> Harin Lee (3):
>   ALSA: ctxfi: Rename SPDIFI1 to SPDIFI_BAY
>   ALSA: ctxfi: Use correct DAIO type for da_desc
>   ALSA: ctxfi: Precompute SRC allocation loop bound

Applied to for-next branch now.  Thanks.


Takashi
