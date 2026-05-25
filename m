Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D406FC3
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 07:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694372; cv=none; b=lzNnS5NWAVt4nlNAguj0mBh0w+C3Y9PVJoshrvbs2Y/bN14ln0JV42BgJiH4pR+ggofOFbn5RQaChm3vrYghkcOd6koDfbebAI6doTpJTqh81wLnvKgbUUGHTQX7SYKrU6F48MEqBfYKJiq3eaedhUoNpmEyDFXoeBSCpuy01RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694372; c=relaxed/simple;
	bh=TaD5d9pMNFWseyYkCybJP7z1a6lFydUTeeVXK5EdD34=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GrJy8/CttpAbHtL3vZfqBWQPGZGEsUlbfpsqB+23ytduMw1HdvQFo5lHNkMDY6Bnn0nbagfGp2AtFJdQKNeb7TKSUJFowfR8BPaAulIGHOWPkHzbG6MYejW8446jZjxWRrqxL4sqwkeltxtewX0L+mNyOj4hTypLWyp4PY8S1cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1LYQas8K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HsCcoqCq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1LYQas8K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HsCcoqCq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1LYQas8K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HsCcoqCq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1LYQas8K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HsCcoqCq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CA79268A33;
	Mon, 25 May 2026 07:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779694369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BsoaSiEBlMKs1XgDIRoc1f/NCARh4Y4BAZHxX/92Jcc=;
	b=1LYQas8Kt8aMqlNZ9uCsv/SjKP+dgQLvfWKALPs5+k2JG46jgVIqH2w9Kb52aB7r56shlS
	BivJCjpNIanLN11QEjJsv/A0Rojm6yXuxiCTMIA9ipdlNi7EPCpJbELXQ4+C5RoDDi8HRb
	FuGvCOSNQFKEJ45E4Nd83U30frKo1N8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779694369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BsoaSiEBlMKs1XgDIRoc1f/NCARh4Y4BAZHxX/92Jcc=;
	b=HsCcoqCqkY5ahCH1c7bzCgSSt/9MnOyf9qOw+L8j5CavzkV2KZxhDbH2IlxSHB8qtcdLkb
	JtB46NJq69IBTRBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779694369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BsoaSiEBlMKs1XgDIRoc1f/NCARh4Y4BAZHxX/92Jcc=;
	b=1LYQas8Kt8aMqlNZ9uCsv/SjKP+dgQLvfWKALPs5+k2JG46jgVIqH2w9Kb52aB7r56shlS
	BivJCjpNIanLN11QEjJsv/A0Rojm6yXuxiCTMIA9ipdlNi7EPCpJbELXQ4+C5RoDDi8HRb
	FuGvCOSNQFKEJ45E4Nd83U30frKo1N8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779694369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BsoaSiEBlMKs1XgDIRoc1f/NCARh4Y4BAZHxX/92Jcc=;
	b=HsCcoqCqkY5ahCH1c7bzCgSSt/9MnOyf9qOw+L8j5CavzkV2KZxhDbH2IlxSHB8qtcdLkb
	JtB46NJq69IBTRBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 977A759B18;
	Mon, 25 May 2026 07:32:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YIO4IyH7E2omHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 25 May 2026 07:32:49 +0000
Date: Mon, 25 May 2026 09:32:49 +0200
Message-ID: <875x4cgd0e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Len Bao <len.bao@gmx.us>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: drivers: Mark some variables as __ro_after_init
In-Reply-To: <20260524165249.48941-1-len.bao@gmx.us>
References: <20260524165249.48941-1-len.bao@gmx.us>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.us];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmx.us];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	internal_greylist_whitelist(0.00)[10.150.64.97];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,gmx.us:email,suse.de:mid]
X-Spam-Flag: NO

On Sun, 24 May 2026 18:52:48 +0200,
Len Bao wrote:
> 
> Some variables in the 'ALSA/drivers' are initialized only during the
> init phase in the '__init' functions and never changed. So, mark them
> as __ro_after_init to reduce the attack surface.
> 
> Signed-off-by: Len Bao <len.bao@gmx.us>

Applied to for-next branch.  Thanks.


Takashi
