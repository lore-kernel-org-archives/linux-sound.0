Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14CB2F0C7D
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765789916; cv=none; b=gBli+5aFSMqlab1AgI90TcDDIt3wXpjuRQD/ks97q7D79yXAcl72ey/2Fdq8HaTXKZXXVwIokEB44PTw//TmfqPQs5mI5dwtg77eJ+SXeU7yPW+UBY83BgLTJOQ7RXhYEzAS7N5JcBRZXm/gElBNcwQHLgNYck+rIYrQcr9g00Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765789916; c=relaxed/simple;
	bh=oEF5gDU+ONfiA+htZl7GqvWe4gYv4TmxYFcI1Ko7bQo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q6h63aSMXvhQvD7LHhnPe8hUNFbjCtrdRfSFMzjk/+IQ9QFdLsJEAAWY4Dbg6MT47L43AIWmqo2/apWcCLZYYH7PvVsvJxbvhGZJo49ZH6+ksshv/efjb+Rn4JGwX7kx//757qMNRmHEmvvmmhxJx92ks3iMcHPMSeqZ3RGEGiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h7y3k9/w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bHlv0lKf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h7y3k9/w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bHlv0lKf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h7y3k9/w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bHlv0lKf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h7y3k9/w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bHlv0lKf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7F51F33763;
	Mon, 15 Dec 2025 09:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765789911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X2JnsKFOhsDLJh2a6pf5HLcfJsInlDfu3hMrF0QbodA=;
	b=h7y3k9/wPD4kqvI62k2ukzE6dcxKW2M3OD7ONTr8rlX4zmZRvErdxEUw4p4wqZ4zig23K8
	4aOQKRPvClaULWUOK65o/A7paeG2uGqsrCA/peI/lrjHa7QqqXJ9csaEkFh/SC0IjedvRd
	qKOdcFprB2Cl/KCA35ACWLU/sxZf0RU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765789911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X2JnsKFOhsDLJh2a6pf5HLcfJsInlDfu3hMrF0QbodA=;
	b=bHlv0lKfyNO5J/fG5nj+TRWo6m17709vsZIR4GpwN9Ao8mHYK+HA1XF+0kBkk5XO7hbdqQ
	sfEtwZB70X5R/HDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="h7y3k9/w";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bHlv0lKf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765789911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X2JnsKFOhsDLJh2a6pf5HLcfJsInlDfu3hMrF0QbodA=;
	b=h7y3k9/wPD4kqvI62k2ukzE6dcxKW2M3OD7ONTr8rlX4zmZRvErdxEUw4p4wqZ4zig23K8
	4aOQKRPvClaULWUOK65o/A7paeG2uGqsrCA/peI/lrjHa7QqqXJ9csaEkFh/SC0IjedvRd
	qKOdcFprB2Cl/KCA35ACWLU/sxZf0RU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765789911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X2JnsKFOhsDLJh2a6pf5HLcfJsInlDfu3hMrF0QbodA=;
	b=bHlv0lKfyNO5J/fG5nj+TRWo6m17709vsZIR4GpwN9Ao8mHYK+HA1XF+0kBkk5XO7hbdqQ
	sfEtwZB70X5R/HDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BD573EA63;
	Mon, 15 Dec 2025 09:11:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z0rUENfQP2lZfQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 15 Dec 2025 09:11:51 +0000
Date: Mon, 15 Dec 2025 10:11:50 +0100
Message-ID: <87cy4ggld5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: pcmcia: Fix resource leak in snd_pdacf_probe error path
In-Reply-To: <20251215090433.211-1-vulab@iscas.ac.cn>
References: <20251215090433.211-1-vulab@iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 7F51F33763
X-Spam-Flag: NO
X-Spam-Score: -4.51

On Mon, 15 Dec 2025 10:04:33 +0100,
Haotian Zhang wrote:
> 
> When pdacf_config() fails, snd_pdacf_probe() returns the error code
> directly without freeing the sound card resources allocated by
> snd_card_new(), which leads to a memory leak.
> 
> Add proper error handling to free the sound card and clear the card
> list entry when pdacf_config() fails.
> 
> Fixes: 15b99ac17295 ("[PATCH] pcmcia: add return value to _config() functions")
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Applied now.  Thanks.


Takashi
