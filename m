Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC401A9F96
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 05:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779773290; cv=none; b=GV2Qg/4mJ9f28qKI2GNQM66noNCbfOSevkr8kFUbQMmOUfoMo/slcF/4CDXrRPZ/R+nZJivEmqs3pWufArDNl3fMT22RACUllQaILXXZM2AAIIqGA9REtMjvV4+NAQxzPjVxdSF/liJMupgtrAPw42ndb0YH2th2xNiPv+wWO9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779773290; c=relaxed/simple;
	bh=gnUOTALvHHcl2nVOzsFzqLBfVZUwZ6juvqOZB2xuZ8Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZkwJLvc2FfYYkC3INkEpzXqgJiJ89injdwuRqcvY74mTu0aCLca6k9BuUDr3y0k9Jg0oRJ6hMjR9mWqruN5pSgdv8ftyTCoJVG1ZrPDjC0rUW/LfnaxFrA+tjbUf5PFBT2VWNL67q5CH9Bwg7a+UoCuW+j++yZDYbJSuCz6jKYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FeVGHtRq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xt8Vuu3X; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FeVGHtRq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xt8Vuu3X; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FeVGHtRq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xt8Vuu3X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FeVGHtRq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xt8Vuu3X"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5AB406536F;
	Tue, 26 May 2026 05:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779773285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IutryjVvvXGUHIVenFLcXh3fsiuFX+TplLql6uAxJzk=;
	b=FeVGHtRqbMc5Heb++sYKULtTUduR3TghEmczJnaJeFGn4AqA3Ktun1txk/jzpCojAhdGgC
	PV6BPRud7R7VmMTE4BmAiyKeYucjg4Rifoeo6hoOLWNxC07Ug+/hUv7q21DY5vxE6x7qjc
	+p3DHWg9YctY8SHk1wnnwaMljHMG11w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779773285;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IutryjVvvXGUHIVenFLcXh3fsiuFX+TplLql6uAxJzk=;
	b=Xt8Vuu3XFJEAdNzkG9Y9QxHuJHJt5iCYHBGdBHF4p8/kGOJ++Ef70gD9xY2t29aW9H4s+s
	SSutsDrH1qluhOCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779773285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IutryjVvvXGUHIVenFLcXh3fsiuFX+TplLql6uAxJzk=;
	b=FeVGHtRqbMc5Heb++sYKULtTUduR3TghEmczJnaJeFGn4AqA3Ktun1txk/jzpCojAhdGgC
	PV6BPRud7R7VmMTE4BmAiyKeYucjg4Rifoeo6hoOLWNxC07Ug+/hUv7q21DY5vxE6x7qjc
	+p3DHWg9YctY8SHk1wnnwaMljHMG11w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779773285;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IutryjVvvXGUHIVenFLcXh3fsiuFX+TplLql6uAxJzk=;
	b=Xt8Vuu3XFJEAdNzkG9Y9QxHuJHJt5iCYHBGdBHF4p8/kGOJ++Ef70gD9xY2t29aW9H4s+s
	SSutsDrH1qluhOCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 278195A03C;
	Tue, 26 May 2026 05:28:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RbJPCGUvFWprDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 May 2026 05:28:05 +0000
Date: Tue, 26 May 2026 07:28:04 +0200
Message-ID: <871pey210b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Kees Cook <kees@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: pcm: Fix NULL dereference in import_ubuf() during exit
In-Reply-To: <20260526013245.785435-1-xujiakai24@mails.ucas.ac.cn>
References: <20260526013245.785435-1-xujiakai24@mails.ucas.ac.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,ucas.ac.cn:email]
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 26 May 2026 03:32:45 +0200,
Jiakai Xu wrote:
> 
> snd_pcm_oss_sync() calls snd_pcm_lib_write(substream, NULL, size) to
> fill silence.  The in_kernel flag is hard-coded to false by the wrapper,
> so do_transfer() falls through to import_ubuf() with a garbage pointer
> (NULL + frame_offset).  When the process is in do_exit() and current->mm
> is already NULL, import_ubuf()'s access_ok() crashes dereferencing 
> mm->context.pmlen.
> 
> Add a NULL guard in do_transfer() to use iov_iter_kvec() with a dummy
> kvec for the fill_silence path, avoiding the import_ubuf() call.  The
> fill_silence transfer function ignores the iov_iter, so the dummy kvec
> is safe.
> 
> Fixes: cf393babb37a1 ("ALSA: pcm: Add copy ops with iov_iter")
> Signed-off-by: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>

This is already fixed by the upstream commit e4d3386b74fb ("ALSA: pcm:
Don't setup bogus iov_iter for silencing").


thanks,

Takashi
