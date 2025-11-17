Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92112D4B71
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 16:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763396537; cv=none; b=nAueTe554alRUqDi2i7slBXGN4s6YNz2iWbgKOMOeDeYaX5zGKmKxQSyIQrDuZ/qZtG5u2FwsBIFcNa9o6/GwVRN9D6kuoKWNsszyw5asyD0cmUmS1rnmAuOnhAzzWQqTCSDnufcJV8UZCo76dRQo2rXNwRn8nbNSErwTnaEyQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763396537; c=relaxed/simple;
	bh=GHGklC4N7kXsqkY6WnQWpBkKPJqTh3GICz1OTLv9OW8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pO76yjbVXhnpnffU3LO0GYT/spmOY3CFWP/qillhB3zKPcAZqJ4mnKddEJvG++lc2ArV9p51uVUunitsab/KagpDnD5f21YukcTO0gnTzVlGqMzuYu55CC+umkO2y1n/Bf9RLynb66Di76hX0pUwlUoCbgQ8WfThEYslOXfagVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Mx7B/15g; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PJKKEGAW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HO7ct1WP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d3A86Plr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Mx7B/15g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PJKKEGAW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HO7ct1WP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d3A86Plr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F1A50211EB;
	Mon, 17 Nov 2025 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763396534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LAUp9wXq8JigWqJgQM1TbHTFtjYhBq8qK/2MOvDxnxs=;
	b=Mx7B/15glGtEvmJ2PdmJgQ70upQMFvDQkKNLIodnTdT02Hif3mfEzElFMcaGThrmPnk4bh
	+F0Ie2VqAhhHTfElYkvXBghXhfy+PDVokUVTc6hAY+WAcrdqjWRFgC/GMVzdGI9nAFprG0
	lKcaGxM0NsQt8B3CBUTEFv7a4hmRhAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763396534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LAUp9wXq8JigWqJgQM1TbHTFtjYhBq8qK/2MOvDxnxs=;
	b=PJKKEGAW4UvHZ2gGVFDSJxtLuZlkltcPblGdGfnv0cK28xXvGiAyXuBztHiixqP2UgGVyO
	29Buh5GPFVydTZBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763396533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LAUp9wXq8JigWqJgQM1TbHTFtjYhBq8qK/2MOvDxnxs=;
	b=HO7ct1WP5ESRrMnEY6i+pTq1X3UNaw8qs1jNjJrlgq8WPQkANC3uoI+VSAekhGpvX3EDBs
	B4gG+QvH1Zm9/h0eaz1SyRPgq9+pF/hqCq6ApZ91RnI3hKBNr27adHXp4wfRoTlemTQ1Ze
	05R1M8FpKNQG0YbvVonm4Jw521FCG3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763396533;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LAUp9wXq8JigWqJgQM1TbHTFtjYhBq8qK/2MOvDxnxs=;
	b=d3A86Plrsv5UfEC0WkVOlNKoxd6WVX6U9hY/RTrfMHaGQl/sB3p5WaYQuk8mSsMPMcUYZD
	pEPfHJ+We++2kFDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C546A3EA61;
	Mon, 17 Nov 2025 16:22:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id twDzLrVLG2mlHgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Nov 2025 16:22:13 +0000
Date: Mon, 17 Nov 2025 17:22:13 +0100
Message-ID: <87h5usfx3e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "jempty.liang" <imntjempty@163.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: core: Fix style issues in sound/core/device.c
In-Reply-To: <20251117032816.55442-1-imntjempty@163.com>
References: <20251117032816.55442-1-imntjempty@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 17 Nov 2025 04:28:16 +0100,
jempty.liang wrote:
> 
> This patch fixes blank line and trailing whitespace issues in
> sound/core/device.c as reported by checkpatch.pl.
> 
> Signed-off-by: jempty.liang <imntjempty@163.com>

Thanks for the patch.  We don't apply a coding-only fix (especially
about only white-space) unless it's tied with some other real fix or
changes, because it'd bright merely more noises in the history.

That said, if you have more fix or a code change patch that is applied
to the code path, put such a cleanup as a preliminary work in the
series, and we'll happily take it together.


thanks,

Takashi
