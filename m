Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EA533E344
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066296; cv=none; b=bLIWPE2ZlVT2cpz3kNCqtyjt7KEWEO+JwFuV5ixaVlVZFqRymNruS3AGMge1aCkCBS0e8HuK9XUKBCTuCwZmda80sHv1h1bWKQMjvLcNF2djJUx7n6Iyfe2M4QOS6O902fF6W8t9sJtvaod0sOQkTFFWRBE4LGLmH/zR+y9ch20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066296; c=relaxed/simple;
	bh=K3UkdqA6x90/19ybEpxWHBdCxpOj02tBQ+NjlOyhqm4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fo69ci1OuWKdhricYxoKNJwGkxt2N/IIRfMLkaBOYLDh14sJ+DR0RM48aEDZu2ZSan+RIQtEHZbQQtgR/recQ5cdl7zIOm+RiM+RDEy5DXFtAsOl15PEPAQysvSkI54Mqzknh/NLt+R/RpqCmpRsksBxFPKQWeZoAZ0cc9hvIS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uQT8tRYb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vOaWzADa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uQT8tRYb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vOaWzADa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uQT8tRYb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vOaWzADa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uQT8tRYb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vOaWzADa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 18C0F759C8;
	Fri,  3 Jul 2026 08:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783066293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JOsRXdSFzaRInUwhRrnPKQlvllUI2sVG6gCSQxNTHx4=;
	b=uQT8tRYbzaPxKSipCxCxghS2CvLN52zBP7nKgIQU6SwpZDvTeXU48eh3FoLZaXtMZ2xDYH
	QhUTJKRLJ75fVGW0KAabMWWcdBLbmQYPIfbYLcYZMaiJGza9JWd7TCnFsYvqLM3WDfj6dI
	OJyekK5gChetbUXYUr/UgFDzJQvLeaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783066293;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JOsRXdSFzaRInUwhRrnPKQlvllUI2sVG6gCSQxNTHx4=;
	b=vOaWzADayvyo6JTD9hn8nTa4tSO/4pHPIJnHK9bVYKOoEEwjaiN5hw9AFkI1ukgtAPSrxB
	sZXUTekNVqJ/W0Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783066293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JOsRXdSFzaRInUwhRrnPKQlvllUI2sVG6gCSQxNTHx4=;
	b=uQT8tRYbzaPxKSipCxCxghS2CvLN52zBP7nKgIQU6SwpZDvTeXU48eh3FoLZaXtMZ2xDYH
	QhUTJKRLJ75fVGW0KAabMWWcdBLbmQYPIfbYLcYZMaiJGza9JWd7TCnFsYvqLM3WDfj6dI
	OJyekK5gChetbUXYUr/UgFDzJQvLeaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783066293;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JOsRXdSFzaRInUwhRrnPKQlvllUI2sVG6gCSQxNTHx4=;
	b=vOaWzADayvyo6JTD9hn8nTa4tSO/4pHPIJnHK9bVYKOoEEwjaiN5hw9AFkI1ukgtAPSrxB
	sZXUTekNVqJ/W0Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7EF3779AC;
	Fri,  3 Jul 2026 08:11:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wIxZN7RuR2qQJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 03 Jul 2026 08:11:32 +0000
Date: Fri, 03 Jul 2026 10:11:32 +0200
Message-ID: <875x2w8pcb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.2-rc1
In-Reply-To: <706f31e9c125d17fbca0a5ed648f4933@kernel.org>
References: <706f31e9c125d17fbca0a5ed648f4933@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Thu, 02 Jul 2026 20:57:06 +0200,
Mark Brown wrote:
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.2-rc1
> 
> for you to fetch changes up to 83245e7a436c04e511378af14dd81fd188b41541:
> 
>   ASoC: rsnd: src: Add missing scu_supply clock to suspend/resume (2026-07-02 18:56:38 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.2
> 
> A fairly standard set of driver specific fixes and quirks that have come
> in since the merge window, plus a MAINTAINERS update.  The tas675x
> READ_ONCE change is probably not actually fixing issues properly but we
> need a whole new approach to concurrency there and it came along with
> some good fixes.

Pulled now.  Thanks.


Takashi
