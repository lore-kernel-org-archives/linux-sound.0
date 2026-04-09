Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C172307AF4
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 06:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775717248; cv=none; b=FEDov6ZvUbqnfHJXvt1lC/INLhE/sX54d/hDwoxHzT+HOzXJ0JGcds46TCcwCLx4yrkhrshsMfs0sHkmRrFq3VgEwtLjc0CfYgke8CtAfKdxiBRyyV1ObIoMh6/nG7cUl+banB0gH/QSkQB6Fq839U8ZE4zEZ4yAmOzIV0WketU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775717248; c=relaxed/simple;
	bh=pbHkZcS6Jb9ObwXKaRYaEAlR5xRZG7iCWfi0IPoVvwo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LozCjfRuIW2n/ETMTUSPghZJYq3JJGqyBkmyfMbJ6RJORH6hr6QHcJtsgmNoH7PRyAuXWA0pYIJoxfoTdLm09ouogC7BkGToaGvFbIrfXrXkN8COBFjLqKEjDnxBlLJ/Hs8NL5PI/o9ai7V4XWx04eUL4SkYIXLf3jEgx1CEFHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EHpZHFaC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gUz/Rrrb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EHpZHFaC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gUz/Rrrb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EHpZHFaC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gUz/Rrrb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EHpZHFaC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gUz/Rrrb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 510364EDD8;
	Thu,  9 Apr 2026 06:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775717245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u1weFM4RzBPUc6cRmuRp59YkmBE+mmxfGyPHbh0MOgE=;
	b=EHpZHFaCu6P0KVCADP6JTxGdUlE407o6gdr4vDb2/BMdKouj7D+3qV4XOmDliqtKWJM3U4
	Y7JerUN+tXXydVXH5ng/gy8dQFF0xgiphCAzoifyFWWnGrz026G9gK/BiWuT8TWpKvmibQ
	sM47/6zeFvScf+9QEGCFhTsbkQiG0JE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775717245;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u1weFM4RzBPUc6cRmuRp59YkmBE+mmxfGyPHbh0MOgE=;
	b=gUz/RrrbwJh8Jnq9c8vXj7o+CZ0JiNfEo1qKuJPbZlIyJoY/sfpzIQg3lEJ9W01rLkKVoD
	H4JjGzNw6FLloHAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775717245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u1weFM4RzBPUc6cRmuRp59YkmBE+mmxfGyPHbh0MOgE=;
	b=EHpZHFaCu6P0KVCADP6JTxGdUlE407o6gdr4vDb2/BMdKouj7D+3qV4XOmDliqtKWJM3U4
	Y7JerUN+tXXydVXH5ng/gy8dQFF0xgiphCAzoifyFWWnGrz026G9gK/BiWuT8TWpKvmibQ
	sM47/6zeFvScf+9QEGCFhTsbkQiG0JE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775717245;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u1weFM4RzBPUc6cRmuRp59YkmBE+mmxfGyPHbh0MOgE=;
	b=gUz/RrrbwJh8Jnq9c8vXj7o+CZ0JiNfEo1qKuJPbZlIyJoY/sfpzIQg3lEJ9W01rLkKVoD
	H4JjGzNw6FLloHAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E5E54A0B3;
	Thu,  9 Apr 2026 06:47:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VpGgBX1L12l6KAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 06:47:25 +0000
Date: Thu, 09 Apr 2026 08:47:24 +0200
Message-ID: <87pl48k4ub.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: Takashi Iwai <tiwai@suse.de>,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for CSL Unity BF24B
In-Reply-To: <c5079ef8-abfe-4373-8fc2-7892b23b95d5@kylinos.cn>
References: <20260409024028.1297587-1-zhangheng@kylinos.cn>
	<873414lnyf.wl-tiwai@suse.de>
	<84e98864-5858-4bb7-b62a-5b4928f2065b@kylinos.cn>
	<87tstkk5ph.wl-tiwai@suse.de>
	<87qzook5m2.wl-tiwai@suse.de>
	<c5079ef8-abfe-4373-8fc2-7892b23b95d5@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 09 Apr 2026 08:33:19 +0200,
Zhang Heng wrote:
> 
> Some machines also need to write GPIO again after waking up from sleep,
> 
> please consider this.

Sure, but your patch puts one extra unnecessary GPIO operation than
needed, and it can be optimized later -- that's my point.  The fixup
could deal directly with only GPIO high/low only once.  With the
current alc_*_gpio() helpers, the values are cached and it's restored
already once before the fixup at each resume call.  So we'd need some
tune up in the helper code for this optimization.


Takashi

> 
> 在 2026/4/9 14:30, Takashi Iwai 写道:
> > That said, I'm going to take your patch for now, but we might need to
> > reconsider the implementation of Realtek codec helpers about GPIO
> > handling.
> > 
