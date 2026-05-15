Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DAB392C52
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 06:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828029; cv=none; b=ART/XbvyhkUcDUngimlAdHSbsfV7xLKAUSNkcFpC9vkgxrMXUIFwjfN5Y72APipAYxrZYy/v0Mndmt/XHDPzAz+hV4SBifSSihttRHt1keL0+d/KaulYHUcuy3/F9+mj9ulWJW/WxQlOWSXU41H0Jkx+pMnGbQ45a3eapjOOKro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828029; c=relaxed/simple;
	bh=raRpXBat1A8gNMWuKdKblsH4M2F4RHzMFn9poZKsDJY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ameucoCRgx8Ex4rMog/Qbknu3um2aHWrU6FBt8ZZZE8ROo1TsrYer1f3LOIYka47O20CBYhhNpKdjzBu+fkffxAYBhqQ026jQ+6D60MH6Q6NF+g3Da9wboCstiByRVQH6YqL8UOioefgErlpjjFXrACP90JlgShgPq1niJfa0Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JHtFCtu+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VuAnKwJj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JHtFCtu+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VuAnKwJj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JHtFCtu+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VuAnKwJj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JHtFCtu+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VuAnKwJj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 41CC56B346;
	Fri, 15 May 2026 06:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778828026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JbnwQ0RNfMKxUmpJxVBSdG9429JzXNwV+KwtWxj2jlQ=;
	b=JHtFCtu+P0Nzy1uwluyjEdAFDS86pZRrluYC1p1Mfu9M6qUH4ykW7ywH/sQBoR6ujEcqMc
	4gaHqJybfqvUcLmrqfDB1LrHOMkJjrjQC/wZUE3uN87132Ppbn4ivk+Suj60Ahe+v0hf9y
	FjODoKtAaAuKM1iupRZQD3CVFUm/b3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778828026;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JbnwQ0RNfMKxUmpJxVBSdG9429JzXNwV+KwtWxj2jlQ=;
	b=VuAnKwJjpah/lIVMTdhAa7zWhRgykCTkFpwUktc2RNACiSy57P4VkT9KUsrySKSdGIMqVq
	ymAsrku4G9E5THDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JHtFCtu+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VuAnKwJj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778828026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JbnwQ0RNfMKxUmpJxVBSdG9429JzXNwV+KwtWxj2jlQ=;
	b=JHtFCtu+P0Nzy1uwluyjEdAFDS86pZRrluYC1p1Mfu9M6qUH4ykW7ywH/sQBoR6ujEcqMc
	4gaHqJybfqvUcLmrqfDB1LrHOMkJjrjQC/wZUE3uN87132Ppbn4ivk+Suj60Ahe+v0hf9y
	FjODoKtAaAuKM1iupRZQD3CVFUm/b3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778828026;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JbnwQ0RNfMKxUmpJxVBSdG9429JzXNwV+KwtWxj2jlQ=;
	b=VuAnKwJjpah/lIVMTdhAa7zWhRgykCTkFpwUktc2RNACiSy57P4VkT9KUsrySKSdGIMqVq
	ymAsrku4G9E5THDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 17E9D593A9;
	Fri, 15 May 2026 06:53:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xuSRBPrCBmpVUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 06:53:46 +0000
Date: Fri, 15 May 2026 08:53:45 +0200
Message-ID: <87bjehups6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: doc: cs35l56: Update path to HDA driver source
In-Reply-To: <20260511104148.36382-1-rf@opensource.cirrus.com>
References: <20260511104148.36382-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,cirrus.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 41CC56B346
X-Spam-Level: 

On Mon, 11 May 2026 12:41:48 +0200,
Richard Fitzgerald wrote:
> 
> The HDA drivers were moved to sound/hda/... so update a Documentation
> reference that still pointed to the old location.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Applied now.  Thanks.


Takashi
