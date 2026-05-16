Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8091DE8BE
	for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778939047; cv=none; b=f+FEIAXlGPrIJrtmQ8ShLXpfKZEWQaMScU+vjU1cLVG5IcySv1klHdHwpv4AdT8KKo3U5v8ptiBuhcrT97N2P2Oixn7B0zLHk9H9kK/jMnrDqzBDEwdB1ipjKM9jnc3e6QdogaFG6oZQFgYhWYfxlYAq6Y9ZIlQyNIKzHpI9+Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778939047; c=relaxed/simple;
	bh=/ZbtA2R4Khw7+IPxjvUQ2oltQnsys9vZv2jXccS30/8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BArlHtNJMo83V30iGknt1XAk0AJQm5S6XBCcRFujKBxOajvwdXl9b7hffFoC99GQaI862qV6p+CLGYz2juKxvk19vPQG4kcj78vHaJCTKE5vTlzKmpDobZoq7HcQjN97lr5Frvs5ymUHXxkTbj2dUPtUhUDQ0jci1oXi73S0QyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e7y98Yw3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9zYE3uez; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e7y98Yw3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9zYE3uez; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e7y98Yw3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9zYE3uez";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e7y98Yw3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9zYE3uez"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 77CF061BE4;
	Sat, 16 May 2026 13:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778939044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=84EhMv+sSkfe6JhLH9NwOoKMykifhvRUaDQv/Q2/S74=;
	b=e7y98Yw3HhckDAC3EN7OMOEqc9d+N+cOBLS20pdFif6KvUBOQl5JFNkHqaGzCCNq427ZnT
	XAx8OoyZxqcfJ6qMrkQNXXn4nA7/F5Sb5GPL4YHD/hZ60TuDba32G50pu+Pf0N3rKw3npQ
	c54mCcw9qBQYXEkoUmxv8LMTP01KsUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778939044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=84EhMv+sSkfe6JhLH9NwOoKMykifhvRUaDQv/Q2/S74=;
	b=9zYE3uez3zh/9D5S2Te04E3Onkv9J0haqjDjTyatWQ1gY3D3AWYy1K3+QQYh+da/tpq3K+
	bcopqaCU88NFnjAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=e7y98Yw3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9zYE3uez
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778939044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=84EhMv+sSkfe6JhLH9NwOoKMykifhvRUaDQv/Q2/S74=;
	b=e7y98Yw3HhckDAC3EN7OMOEqc9d+N+cOBLS20pdFif6KvUBOQl5JFNkHqaGzCCNq427ZnT
	XAx8OoyZxqcfJ6qMrkQNXXn4nA7/F5Sb5GPL4YHD/hZ60TuDba32G50pu+Pf0N3rKw3npQ
	c54mCcw9qBQYXEkoUmxv8LMTP01KsUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778939044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=84EhMv+sSkfe6JhLH9NwOoKMykifhvRUaDQv/Q2/S74=;
	b=9zYE3uez3zh/9D5S2Te04E3Onkv9J0haqjDjTyatWQ1gY3D3AWYy1K3+QQYh+da/tpq3K+
	bcopqaCU88NFnjAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 557ED593A8;
	Sat, 16 May 2026 13:44:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tgRXE6R0CGo6YQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 16 May 2026 13:44:04 +0000
Date: Sat, 16 May 2026 15:44:03 +0200
Message-ID: <87pl2vxye4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sergio Boglione <sboglione@gmail.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add quirk for HP 250 G10 (103c:8b34)
In-Reply-To: <20260516131651.143109-1-sboglione@gmail.com>
References: <20260516131651.143109-1-sboglione@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 77CF061BE4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Sat, 16 May 2026 15:16:50 +0200,
Sergio Boglione wrote:
> 
> HP 250 15.6 inch G10 Notebook PC uses the same ALC236 codec
> as the HP 255 15.6 inch G10 (103c:8b2f) and requires the same
> fixup to enable the internal speaker EAPD and microphone routing.
> 
> Signed-off-by: Sergio Boglione <sboglione@gmail.com>

Thanks, applied now.


Takashi
