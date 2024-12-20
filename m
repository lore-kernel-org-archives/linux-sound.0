Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966431AA1F2
	for <linux-sound@vger.kernel.org>; Fri, 20 Dec 2024 08:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734684717; cv=none; b=EPvUlG6Cct860fQObrXufrcHLL+XGKbgLeQ4jbYUzt21GWOTkJHsC97KoDfGcJAhkfr5kvaoyJZpGph7wgVbL/xVtwqhDaFq/597ENc3NHI7XeLvA3yMqlzvCnfh+jVR00jlxPspjAUAEKYbdEq5njZveoZmz+bzuX2SwsHvWns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734684717; c=relaxed/simple;
	bh=vp4fClweQvHISkTr8S5tTmvca0uv45riHqVe4c8ZNzY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fDAm8hI+uslTWUfCk8w9ZzWjbN130VLKuGcavrlz5ssk7zO34SoYL+NGpoXo4pgS7MS3BAwta1qIt+bqrkyAP2LNfwxWPRWWxCQ34HzpI96NFp1aUHZk/z8AD5jlcGOK7V6b2iVZRTnX5K4Q8VXPUdEUvKsgkIr7vEREEVDgGs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n0xHthrx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n7ID8NnO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n0xHthrx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n7ID8NnO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n0xHthrx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n7ID8NnO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n0xHthrx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n7ID8NnO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A44311F365;
	Fri, 20 Dec 2024 08:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734684713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRMHI0LBJwACf4u0M5VNyYJsCPvf490N6G5reZXQGNM=;
	b=n0xHthrxOKuUcZsjBIV4VLL2DtZMjQMWvI3IKY/42jZ138q/D4Hac0Zc95eafEJgTBGOS4
	LI/LcAem5MHQ4ciMfK8PVWq9K8Bf+zWgc4D9MlnllvvJMm6rfvkvq+pnN+2DguOqQcRRit
	gUpMSbV7oXozYkeiXnnJFz21rvL3XU8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734684713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRMHI0LBJwACf4u0M5VNyYJsCPvf490N6G5reZXQGNM=;
	b=n7ID8NnOnuFqPFDQBoFFBlK2pSmIji1FcLmsAI1P4VTZrRR3N6jkLmhTwuF76gDynL+dwN
	x8jVgz5uh9sKhWBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734684713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRMHI0LBJwACf4u0M5VNyYJsCPvf490N6G5reZXQGNM=;
	b=n0xHthrxOKuUcZsjBIV4VLL2DtZMjQMWvI3IKY/42jZ138q/D4Hac0Zc95eafEJgTBGOS4
	LI/LcAem5MHQ4ciMfK8PVWq9K8Bf+zWgc4D9MlnllvvJMm6rfvkvq+pnN+2DguOqQcRRit
	gUpMSbV7oXozYkeiXnnJFz21rvL3XU8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734684713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRMHI0LBJwACf4u0M5VNyYJsCPvf490N6G5reZXQGNM=;
	b=n7ID8NnOnuFqPFDQBoFFBlK2pSmIji1FcLmsAI1P4VTZrRR3N6jkLmhTwuF76gDynL+dwN
	x8jVgz5uh9sKhWBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37FEF13A63;
	Fri, 20 Dec 2024 08:51:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9SEqCikwZWdGawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Dec 2024 08:51:53 +0000
Date: Fri, 20 Dec 2024 09:51:52 +0100
Message-ID: <87bjx6rb2v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Linux Sound ML <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] ALSA: compress_offload: use safe list iteration in snd_compr_task_seq()
In-Reply-To: <20241217100707.732766-1-perex@perex.cz>
References: <20241217100707.732766-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,linaro.org:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 17 Dec 2024 11:07:07 +0100,
Jaroslav Kysela wrote:
> 
> The sequence function can call snd_compr_task_free_one(). Use
> list_for_each_entry_safe_reverse() to make sure that the used
> pointers are safe.
> 
> Link: https://lore.kernel.org/linux-sound/f2769cff-6c7a-4092-a2d1-c33a5411a182@stanley.mountain/
> Fixes: 04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>

Applied now.  Thanks.


Takashi
