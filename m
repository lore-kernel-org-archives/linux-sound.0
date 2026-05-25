Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DDE6FC3
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 07:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694358; cv=none; b=jqF4ik9/P6zoaeRNI27iflNQQq+K+Lh2tMYTkmPNAr/+yi7w1S4WPrFHO31ErFuBcth4U1TW+sJdr+4/dJeK1rCMLN3Kz2kqBcrtxGKz7vNie4ea7Txa2W1s3ebmShdzNjoy2Bfz4SA1EsGs3CI+fdls0mjd0npmj1gr0VQJw2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694358; c=relaxed/simple;
	bh=MlMYZQVjCbqHIsA2+iKa9frdAphJaS9M0q4rtPWqsiI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hSHuqgwfh6DVBiZCHeXiLznhD9C9lbS6Votla1bLDyQ4eBGSC+HgTZmZSSxa4Gn+iHNGE8w3rBWpbyj6hyCkoovDJaE3KWBF/vGA0M21ButQaORirzj9a1AvFB8/+fjGjsJus1xNwP4JKaa9FKteofJGSBDWesU36nZQ3AUcb/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LEdSnNQF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iSFwTTis; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LEdSnNQF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iSFwTTis; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LEdSnNQF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iSFwTTis";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LEdSnNQF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iSFwTTis"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C27CB64AE1;
	Mon, 25 May 2026 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779694355; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PMxOlnRfur418vuPNmnc1o4jsU7DuTc9IQ06t7WKEHA=;
	b=LEdSnNQFdfYxul54smHIrWJ2qB3uGXam8oeHJ1eRZCGhgVIiakQ2fHpA8iRn7cQCxzV5fB
	3MykX1fiOx4ae5hRvYYkFoY9vTmo+aYh5Sc6krY7wcLIhqBVv8x0VCk8OadOHyJZIhjd/0
	iQeMrNeUW4gZBOEcKlyKHTnU4bkWoDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779694355;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PMxOlnRfur418vuPNmnc1o4jsU7DuTc9IQ06t7WKEHA=;
	b=iSFwTTisEETPZQXfPsvHxv+tftxFW5r8pqebLIG6si/rbxQdVLkXHjymROSvqONTn1WovB
	byXYvIEaOwv9IXBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779694355; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PMxOlnRfur418vuPNmnc1o4jsU7DuTc9IQ06t7WKEHA=;
	b=LEdSnNQFdfYxul54smHIrWJ2qB3uGXam8oeHJ1eRZCGhgVIiakQ2fHpA8iRn7cQCxzV5fB
	3MykX1fiOx4ae5hRvYYkFoY9vTmo+aYh5Sc6krY7wcLIhqBVv8x0VCk8OadOHyJZIhjd/0
	iQeMrNeUW4gZBOEcKlyKHTnU4bkWoDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779694355;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PMxOlnRfur418vuPNmnc1o4jsU7DuTc9IQ06t7WKEHA=;
	b=iSFwTTisEETPZQXfPsvHxv+tftxFW5r8pqebLIG6si/rbxQdVLkXHjymROSvqONTn1WovB
	byXYvIEaOwv9IXBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9979C59B17;
	Mon, 25 May 2026 07:32:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SudfJBP7E2qQGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 25 May 2026 07:32:35 +0000
Date: Mon, 25 May 2026 09:32:35 +0200
Message-ID: <877bosgd0s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Len Bao <len.bao@gmx.us>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: core: Mark some variables as __ro_after_init
In-Reply-To: <20260524162914.47764-1-len.bao@gmx.us>
References: <20260524162914.47764-1-len.bao@gmx.us>
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
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmx.us];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmx.us];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[gmx.us:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,gmx.us:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO

On Sun, 24 May 2026 18:29:13 +0200,
Len Bao wrote:
> 
> Some variables in the 'ALSA/core' are initialized only during the init
> phase in the '__init' functions and never changed. So, mark them as
> __ro_after_init to reduce the attack surface.
> 
> Signed-off-by: Len Bao <len.bao@gmx.us>

Applied to for-next branch.  Thanks.


Takashi
