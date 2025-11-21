Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D995B24728F
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763717721; cv=none; b=LkHBDzlse7In17ONE3VSal1tsZtosn1YF9L1GTEGvgQ4ZdCeY7TtId7ujmslbrxv+jzRpqiIwKuhg3ynYFWXDjDTVvuLu6yNd8ljoKCwo+vQYpcXKntE6QVaI4Z6/P4NIsh/pGHKvvW9sHi4ldyXxpaIDj89ylTkrclrb3TcgqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763717721; c=relaxed/simple;
	bh=xpXLb4RBBbYWrVMKXHr/Hhnv+z8BjtrNg3ISomdyB4s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bMBZ34E573r4IA9i1l2RxbvwiwD+QMG2FKks1qdH/qxO3aaR9i4aajrDzzMfTPzcN/O4qBhQ5FZpBw5FaTll2f10b/m3UJPqLnQFwz2DjiECP4Q2T5nVsKuCejWugt7QZGWxFiyYYGzowloJ5/4bIkwHVCRrXG0++hP5xRO5bKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dG7onFcr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+xdFhugl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dG7onFcr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+xdFhugl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dG7onFcr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+xdFhugl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dG7onFcr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+xdFhugl"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 14E6A204FE;
	Fri, 21 Nov 2025 09:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763717718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PgqSEbWjh5Xb2n8bEnJON+Q3QafZoCtwKsI+sZeByDI=;
	b=dG7onFcr6VfHVc/fadpzXK7rYl+zXrLE1CG6zDbXViDUQ4C/rHkTzgOqwtkbm9RiPITWOP
	TnjN1P/5Ae9ekdwNeiAW/bWVKr5IqSKYlNF7EXUPNUhKHJdlnBSQme8/tvp9Oo4FnvNbcJ
	7fwCiSUH4S2EflWa26waafeaW9IWWlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763717718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PgqSEbWjh5Xb2n8bEnJON+Q3QafZoCtwKsI+sZeByDI=;
	b=+xdFhugldkdzqgyGBcXUSp8glRC+vZ+NNPceyjfS8G4qV8utgMRTSYVje0OQNfo5cAOuVF
	W2e92ffJUwcuqcCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763717718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PgqSEbWjh5Xb2n8bEnJON+Q3QafZoCtwKsI+sZeByDI=;
	b=dG7onFcr6VfHVc/fadpzXK7rYl+zXrLE1CG6zDbXViDUQ4C/rHkTzgOqwtkbm9RiPITWOP
	TnjN1P/5Ae9ekdwNeiAW/bWVKr5IqSKYlNF7EXUPNUhKHJdlnBSQme8/tvp9Oo4FnvNbcJ
	7fwCiSUH4S2EflWa26waafeaW9IWWlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763717718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PgqSEbWjh5Xb2n8bEnJON+Q3QafZoCtwKsI+sZeByDI=;
	b=+xdFhugldkdzqgyGBcXUSp8glRC+vZ+NNPceyjfS8G4qV8utgMRTSYVje0OQNfo5cAOuVF
	W2e92ffJUwcuqcCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D7ECE3EA61;
	Fri, 21 Nov 2025 09:35:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qL10M1UyIGlpeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 21 Nov 2025 09:35:17 +0000
Date: Fri, 21 Nov 2025 10:35:17 +0100
Message-ID: <87bjkv4tka.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Umang Jain <uajain@igalia.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Subject: Re: [PATCH] ALSA: pcm: Harden the spk_alloc assumption check
In-Reply-To: <20251120141757.901505-1-uajain@igalia.com>
References: <20251120141757.901505-1-uajain@igalia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Thu, 20 Nov 2025 15:17:57 +0100,
Umang Jain wrote:
> 
> If the parsed ELD has spk_alloc=0, it currently assigns the parsed ELD
> spk_alloc to 0xffff. However, we should also check if there is at least
> one SAD (Short audio descriptor) to enforce the assumption, as ELD
> without any sad_count, is usually considered invalid for e.g. in
> commit ce9778b7a0272("ALSA: hda/hdmi: Consider ELD is invalid when no
> SAD is present").
> 
> Signed-off-by: Umang Jain <uajain@igalia.com>

Thanks, applied now.


Takashi
