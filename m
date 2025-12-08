Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47FA328277
	for <linux-sound@vger.kernel.org>; Mon,  8 Dec 2025 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765204124; cv=none; b=SJfhP45E0r51qtLwT7z/Z3oNJT6aVzNP+RLUKhgp1dUpH9zeE2ci7HMfYJlcYJR307j1jt8d91CcoNZFKXl/BL0eYQvS/IJRxIEV168mir63Ew8vxCxopzFDOCHv859imH62iYDfwPpz8KLOgXc18TimaKAbTzEePgE6p7Y4Oug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765204124; c=relaxed/simple;
	bh=41O2RGhzMoDRw79CIKaLm9hYzODNfKspz0LTOYBpu+Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CqmlPjDOgmKI1yLn8rouPEHhEgI7vxqfqAr7jgGjxPA3e4KnNHK8ZLukMD8o+vLfvh0JnoF9A1XLYVXECiPqE4cGnqniET2IUWbYjwzsqWVi94bPbmNIEdRSaXQfeRc/L5rQYLLPARkNZ/voNDV6DFo83JV6TBQsTQFUYcEdAMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b7T0ejbN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=acBn5h/J; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b7T0ejbN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=acBn5h/J; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b7T0ejbN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="acBn5h/J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b7T0ejbN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="acBn5h/J"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C0D76337F1;
	Mon,  8 Dec 2025 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765204120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJ7o5yFokxGKDF1++LqzGxkl5wGif7X6hVbEcbWy9TQ=;
	b=b7T0ejbNzmxrXvJqXJ2JGQlgCBP/9r7oaIqb7RFVe8AfwTVEKzYXuq3wWWm91UZJ5jWgi3
	tIRX1Sabhu2dVQ3WowOzWABoNAKoKOtbAktMOxHpX+aQYhj0Bjg88dMd0ffFEz2Le+oWr2
	0wiKIWSjMLnbeT65Pv0AtaBOJie83yw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765204120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJ7o5yFokxGKDF1++LqzGxkl5wGif7X6hVbEcbWy9TQ=;
	b=acBn5h/J3udZkh8aQ20bMZevShp3sH6RRVf+VdB2ArzRNYHw5jhuv1jPCTmHXa9FJZpiad
	uMZxLMkXWi2q5gDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765204120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJ7o5yFokxGKDF1++LqzGxkl5wGif7X6hVbEcbWy9TQ=;
	b=b7T0ejbNzmxrXvJqXJ2JGQlgCBP/9r7oaIqb7RFVe8AfwTVEKzYXuq3wWWm91UZJ5jWgi3
	tIRX1Sabhu2dVQ3WowOzWABoNAKoKOtbAktMOxHpX+aQYhj0Bjg88dMd0ffFEz2Le+oWr2
	0wiKIWSjMLnbeT65Pv0AtaBOJie83yw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765204120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJ7o5yFokxGKDF1++LqzGxkl5wGif7X6hVbEcbWy9TQ=;
	b=acBn5h/J3udZkh8aQ20bMZevShp3sH6RRVf+VdB2ArzRNYHw5jhuv1jPCTmHXa9FJZpiad
	uMZxLMkXWi2q5gDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 984E53EA63;
	Mon,  8 Dec 2025 14:28:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zJUUJJjgNmlnNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 08 Dec 2025 14:28:40 +0000
Date: Mon, 08 Dec 2025 15:28:40 +0100
Message-ID: <87sedlt5d3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andres J Rosa <andyrosa@gmail.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: uapi: Fix typo in asound.h comment
In-Reply-To: <20251203162509.1822-1-andyrosa@gmail.com>
References: <20251203162509.1822-1-andyrosa@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.931];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.29

On Wed, 03 Dec 2025 17:25:01 +0100,
Andres J Rosa wrote:
> 
> Fix 'level-shit' to 'level-shift' in struct snd_cea_861_aud_if comment.
> 
> Signed-off-by: Andres J Rosa <andyrosa@gmail.com>

Applied now.  Thanks.


Takashi
