Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778CB202963
	for <linux-sound@vger.kernel.org>; Wed, 31 Dec 2025 15:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767196057; cv=none; b=ncbhne+V9JERl+4iBZuxVHEHyhiyUsha3tcH4ro/SNqBM/Psgu1VbeQZWr+JRJ0CUp2ly6h4UtHV8+FWU7Bdi3qyrz73OxMJdoE0dHBYDu6PrZpgQgqopZqYgL8s6KKywxPzxVc60S2pod6Nl7hUkl+XZMW7FSE85OhT+7DVZb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767196057; c=relaxed/simple;
	bh=aNMrxxNZhgBaDLGtarpGqj71l1gd4safLDxAS2S/tE4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VwoeHJ6ZJXaPV6N7a1M+/kjCzPo8pBQ5Q2R8qH/liXQ1mEnzARKCQ4F5px2C2QztuZN53roqmOhg3y6yuhfIWdM7ogtM+C+XBHq8ZfJt9xHZpmmZHKEyEPjneV/xGmUlnVQWrqJ5mAm/1Jqomqh+kK8O548kTgN2+x8YT6DnnC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fuezrPPP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0PBRgiIk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fuezrPPP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0PBRgiIk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fuezrPPP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0PBRgiIk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fuezrPPP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0PBRgiIk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B5151336EF;
	Wed, 31 Dec 2025 15:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767196053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/00fWlN/+Eb4GWSQdTMzbc/mW5FlzOsXIFzba8GhrxY=;
	b=fuezrPPPbt12i8Y2of8zxUcGoIYQkFJtJDe5nqbPiiU1sKPN+zQqhdsqZVZt9/tmojy86k
	tl4flDycOVkXTTr6JkZvNZXzDnlzi5pI7qihStpL+EzHtMiExgMLSWHAf9Eh3lmd3eOSxL
	anOhrzsbAlSKRnALQdSTb0FzWtKSRl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767196053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/00fWlN/+Eb4GWSQdTMzbc/mW5FlzOsXIFzba8GhrxY=;
	b=0PBRgiIkz38GYykOq6Da/0g6qzz9ZgSaT0CTY/ETxQdcS4raNjXfcfis/xvGr5t9kzzgyM
	6ex6ot7GcvMfaVBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767196053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/00fWlN/+Eb4GWSQdTMzbc/mW5FlzOsXIFzba8GhrxY=;
	b=fuezrPPPbt12i8Y2of8zxUcGoIYQkFJtJDe5nqbPiiU1sKPN+zQqhdsqZVZt9/tmojy86k
	tl4flDycOVkXTTr6JkZvNZXzDnlzi5pI7qihStpL+EzHtMiExgMLSWHAf9Eh3lmd3eOSxL
	anOhrzsbAlSKRnALQdSTb0FzWtKSRl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767196053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/00fWlN/+Eb4GWSQdTMzbc/mW5FlzOsXIFzba8GhrxY=;
	b=0PBRgiIkz38GYykOq6Da/0g6qzz9ZgSaT0CTY/ETxQdcS4raNjXfcfis/xvGr5t9kzzgyM
	6ex6ot7GcvMfaVBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CDC3137FE;
	Wed, 31 Dec 2025 15:47:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id o1trGZVFVWkLagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Dec 2025 15:47:33 +0000
Date: Wed, 31 Dec 2025 16:47:33 +0100
Message-ID: <87a4yyy7oq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Jaroslav Kysela <perex@perex.cz>,
	yunbolyu@smu.edu.sg,
	kexinsun@smail.nju.edu.cn,
	ratnadiraw@smu.edu.sg,
	xutong.ma@inria.fr,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ice1724: adjust function name reference
In-Reply-To: <20251230140103.93134-1-Julia.Lawall@inria.fr>
References: <20251230140103.93134-1-Julia.Lawall@inria.fr>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.26
X-Spam-Level: 
X-Spamd-Result: default: False [-3.26 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.16)[-0.786];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[inria.fr:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Tue, 30 Dec 2025 15:01:03 +0100,
Julia Lawall wrote:
> 
> The code just below the comment is_pro_rate_locked(), so it seems
> like that was what was intended for the comment.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Thanks, applied to for-next branch now.


Takashi
