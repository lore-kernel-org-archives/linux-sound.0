Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D06321D00A
	for <linux-sound@vger.kernel.org>; Thu, 11 Dec 2025 08:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765442727; cv=none; b=hPUvmAFJw5gYIt6oLBYjKPKj1IAnNkZqknK37r4+VOPrEgXg+Nwgb9kYgfX9aXtwRPckuueUxun3/UBS9LqgYMxiVtked2n8+zYvtyYFCcDb9CdznWiKdTQrgK8ovZvJdvEdXQ3bHiCVynPy/VE31ESWdYThGSogPkFgMYxGACs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765442727; c=relaxed/simple;
	bh=zYlY/UvSt+N8IKYnvhTh9e4AHKsJ0CDUng7FRWtB2Pc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EUYsbZ1i/BGsxG3wXYMsstxyPCRtb2HUvZyfH9VrTYU1nHnhU0oJwBi3mFfFEGIMqaY06E/rN//QXix1vQ6WV1TZqFQbwpb75dXBkYAYPE/55KFbm+CZHIY66OqutgN8WRwajltD1G1IHMom4knskDHOIHD74N36vNETgnxLwE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GlYruRJP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Sa4LRwWs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A0/93nHL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R603Zwi8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GlYruRJP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Sa4LRwWs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A0/93nHL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R603Zwi8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E1FC85BECA;
	Thu, 11 Dec 2025 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765442723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z4wy4QB9BjJPKd5vBr2cgx8MSASwZ1Wr5arHs4K7bLg=;
	b=GlYruRJPCONRQGjgDAC28DzJwQYozXNcpOGthFLfiGwUO9m3AOtr9QvofxkbTYowTGt7Vn
	WQCCMEZcadeQXvgiD2rQTKfwhvliZNGFw0eGraE/qIDr195QdmBRdg9ikMs1QGuPfMifHp
	6K4RZg11W4ecB/KD/ArVIdnMq77zGbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765442723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z4wy4QB9BjJPKd5vBr2cgx8MSASwZ1Wr5arHs4K7bLg=;
	b=Sa4LRwWs0MnGkk4tA8o9qpVkNydgBQOjByEg1opnPBbhBL//WnJXG9tJTsE6GxtnTnXCAK
	e+gy+1LLUaJj2LCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="A0/93nHL";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=R603Zwi8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765442721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z4wy4QB9BjJPKd5vBr2cgx8MSASwZ1Wr5arHs4K7bLg=;
	b=A0/93nHLm7wQ0nLM6co4gTQUH+JHBcSXkKDN32qaRhnY+JoPuTPNT5wCH6kjRviNioPJWs
	7deGbOhzaoWibFtKL/gyzCdW1RG4u0j/VViHhKZnw/T8zIDYTDsZyODS/502DTPJ/A7aPw
	uBUz/Ic/oqSTd4CPCZNMDg5sXmcToIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765442721;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z4wy4QB9BjJPKd5vBr2cgx8MSASwZ1Wr5arHs4K7bLg=;
	b=R603Zwi8Elh6GOX4xWc0goDMhV/eK0ywXlHZmYL0RKP4KVVXykv+J2x9of97omotV35JIi
	X9Qe25WPzEUc1kDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A113F3EA65;
	Thu, 11 Dec 2025 08:45:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3r9GG6GEOmnaUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 11 Dec 2025 08:45:21 +0000
Date: Thu, 11 Dec 2025 09:45:21 +0100
Message-ID: <874ipxcspq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Joakim Zhang <joakim.zhang@cixtech.com>,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ALSA: hda: cix-ipbloq: Use modern PM ops
In-Reply-To: <20251211-hda-cix-ipbloq-modern-pm-ops-v1-1-c7a5580af021@kernel.org>
References: <20251211-hda-cix-ipbloq-modern-pm-ops-v1-1-c7a5580af021@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: E1FC85BECA
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Thu, 11 Dec 2025 02:50:03 +0100,
Nathan Chancellor wrote:
> 
> When building without CONFIG_PM_SLEEP, there are several warnings (or
> errors with CONFIG_WERROR=y / W=e) from the cix-ipbloq driver:
> 
>   sound/hda/controllers/cix-ipbloq.c:378:12: error: 'cix_ipbloq_hda_runtime_resume' defined but not used [-Werror=unused-function]
>     378 | static int cix_ipbloq_hda_runtime_resume(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   sound/hda/controllers/cix-ipbloq.c:362:12: error: 'cix_ipbloq_hda_runtime_suspend' defined but not used [-Werror=unused-function]
>     362 | static int cix_ipbloq_hda_runtime_suspend(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   sound/hda/controllers/cix-ipbloq.c:349:12: error: 'cix_ipbloq_hda_resume' defined but not used [-Werror=unused-function]
>     349 | static int cix_ipbloq_hda_resume(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~~~~~~
>   sound/hda/controllers/cix-ipbloq.c:336:12: error: 'cix_ipbloq_hda_suspend' defined but not used [-Werror=unused-function]
>     336 | static int cix_ipbloq_hda_suspend(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~~~~~~~
> 
> When CONFIG_PM and CONFIG_PM_SLEEP are unset, SET_SYSTEM_SLEEP_PM_OPS()
> and SET_RUNTIME_PM_OPS() evaluate to nothing, so these functions appear
> unused to the compiler in this configuration.
> 
> Use the modern SYSTEM_SLEEP_PM_OPS and RUNTIME_PM_OPS macros to resolve
> these warnings, which is what they are intended to do. Additionally,
> wrap &cix_ipbloq_hda_pm in pm_ptr() to ensure the compiler can drop the
> entire structure when CONFIG_PM is unset.
> 
> Fixes: d91e9bd10125 ("ALSA: hda: add CIX IPBLOQ HDA controller support")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied now.  Thanks.


Takashi
