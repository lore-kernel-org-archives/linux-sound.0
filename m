Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F947202C49
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754921880; cv=none; b=raH41fbERnl4f7VUzX4kCLciJ8DdzL2L64GyDQCo+8t1KkAQP3hjl61uCDMGUdn8kcBsRO9vP0w67bBbjVNdqNiugvvT7UByB5Xn+WSKex7mMG6mrQZ8YcBoT3a2rw1U55vaeOHfXdMdX+fi7IVyub9+sWg4PgvkSixQMZvHvXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754921880; c=relaxed/simple;
	bh=7GBRyjgIiU0Rgz/De2jX1kz/0X9cVN3ubMK30rZpMhc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R/MQmK/zCbgDgPxtJ6zUOtBhXppKp3A8IazKJ7utbyQAOMbRNon0JaAClWHGXVMYGCymlGclDhwwwpREP8cPLLMDMyM+YEjBCZYXrnhkdghq+NzGEjmTudklzjbVHXkqQvhPvMMFKHXEke2nVpXQ7f4eMHbIJQ1V5wAUJxijA+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Jt8qyDoG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zhsYsgsA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Jt8qyDoG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zhsYsgsA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jt8qyDoG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zhsYsgsA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jt8qyDoG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zhsYsgsA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 38AAD220C9;
	Mon, 11 Aug 2025 14:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754921876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3NXEP47jzSOqPzBX+sRbxi5+nwG4vhy0tfk8W7RTJTw=;
	b=Jt8qyDoGCdIVCwjBQmVEatKcxVhS/xJKKKVB3m5h3KL/g7S8AMghhirk51UrZXiuF+U474
	T1xp8tHEq2mqb9js0hbCgO7SEn/0xd/hFEzCocwMF18TDFuA8kE+zG3ikjR5Zz3H3ZKsMk
	0iDuj0cCtG4voEiLRcEjFMNA1vpO0so=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754921876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3NXEP47jzSOqPzBX+sRbxi5+nwG4vhy0tfk8W7RTJTw=;
	b=zhsYsgsAEZvgKHAeV/j1VTIBqWD0su0rlTFQ9+tcjf4z9f0nQVNC0i+Xu+pxCLevR/0xpR
	SnZqmKMagMyr89Cg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Jt8qyDoG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zhsYsgsA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754921876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3NXEP47jzSOqPzBX+sRbxi5+nwG4vhy0tfk8W7RTJTw=;
	b=Jt8qyDoGCdIVCwjBQmVEatKcxVhS/xJKKKVB3m5h3KL/g7S8AMghhirk51UrZXiuF+U474
	T1xp8tHEq2mqb9js0hbCgO7SEn/0xd/hFEzCocwMF18TDFuA8kE+zG3ikjR5Zz3H3ZKsMk
	0iDuj0cCtG4voEiLRcEjFMNA1vpO0so=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754921876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3NXEP47jzSOqPzBX+sRbxi5+nwG4vhy0tfk8W7RTJTw=;
	b=zhsYsgsAEZvgKHAeV/j1VTIBqWD0su0rlTFQ9+tcjf4z9f0nQVNC0i+Xu+pxCLevR/0xpR
	SnZqmKMagMyr89Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F66C13AB9;
	Mon, 11 Aug 2025 14:17:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Fwc4ApT7mWhDUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 14:17:56 +0000
Date: Mon, 11 Aug 2025 16:17:55 +0200
Message-ID: <87ikiu0woc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Vasiliy Kovalev <kovalev@altlinux.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	Kailang Yang <kailang@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix headset mic on HONOR BRB-X
In-Reply-To: <20250811132716.45076-1-kovalev@altlinux.org>
References: <20250811132716.45076-1-kovalev@altlinux.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 38AAD220C9
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Mon, 11 Aug 2025 15:27:16 +0200,
Vasiliy Kovalev wrote:
> 
> Add a PCI quirk to enable microphone input on the headphone jack on
> the HONOR BRB-X M1010 laptop.
> 
> Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>

Applied now.  Thanks.


Takashi
