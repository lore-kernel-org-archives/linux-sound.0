Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D450E3DCD87
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605224; cv=none; b=je5QOOVbRaQqPrIx1my1syEGQ/INc1aNS3Igz7VkZbhiZYwE0Es9dqrTxOD5aW6X6jyOyp5y4v7WwXAXE0Di32KFwYb8A8LoMe0dhvPBIcnwCxlUJYFXPt/IYZomJNYuT2cIcZyaw6h8KHHIa0PG1Pro6j+Ll2IUxUBtF/vDoLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605224; c=relaxed/simple;
	bh=XLtQzIbC/76Sc8SqFtXo2f9nurdfq4NY4odmhochFXc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oyKYCqU5FgSGwdSmO+umPR3RLUr0clXwrHzzTkCyJUXIfROlylX4yTetAJK747TN9JcViw4a8zBG6kmGPgmMtq7ko2HbPBshoqg00O+LnIu5iYWXZoQffTSoES1l6XF1QTQg0Sc4AjGjWEOt2LYHcNpKoXUiJ2Q4tNZOQQUEiPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GrBUNfvK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N2R2qa93; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GrBUNfvK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N2R2qa93; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GrBUNfvK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N2R2qa93";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GrBUNfvK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N2R2qa93"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2D4F34D250;
	Fri, 27 Mar 2026 09:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774605217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yLk/95zehhjlx7OT4urvcq3KzHamMIvpNEYxK5bdS0A=;
	b=GrBUNfvKkK/v0ABSqZGx8UMvs5VcJW11IcPj4WSxtKfJr4Fhj+IY+nLPSMZYhRrA1LpXQx
	yLnuyyQ1MXgPKvzWSF7rSIdPzW4XFo0UvhiNk4Gzbz68MEy7IBqs89fRgwCv8cjnNB/4/d
	ZBMwkc+u6bbSWU5gyqkPen3OQTzQNFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774605217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yLk/95zehhjlx7OT4urvcq3KzHamMIvpNEYxK5bdS0A=;
	b=N2R2qa93TSlCwkzt6bTwoMfeTJAWQQ8yv2FS+N6fkcPrgFK7NS7vKHCrOpFS4epBLXKgTS
	VEUC5CoPjUNo8jAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GrBUNfvK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=N2R2qa93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774605217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yLk/95zehhjlx7OT4urvcq3KzHamMIvpNEYxK5bdS0A=;
	b=GrBUNfvKkK/v0ABSqZGx8UMvs5VcJW11IcPj4WSxtKfJr4Fhj+IY+nLPSMZYhRrA1LpXQx
	yLnuyyQ1MXgPKvzWSF7rSIdPzW4XFo0UvhiNk4Gzbz68MEy7IBqs89fRgwCv8cjnNB/4/d
	ZBMwkc+u6bbSWU5gyqkPen3OQTzQNFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774605217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yLk/95zehhjlx7OT4urvcq3KzHamMIvpNEYxK5bdS0A=;
	b=N2R2qa93TSlCwkzt6bTwoMfeTJAWQQ8yv2FS+N6fkcPrgFK7NS7vKHCrOpFS4epBLXKgTS
	VEUC5CoPjUNo8jAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0981F4A0A2;
	Fri, 27 Mar 2026 09:53:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v3ciAaFTxmnbNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 09:53:37 +0000
Date: Fri, 27 Mar 2026 10:53:36 +0100
Message-ID: <877bqxsin3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: NonameBlank007 <nonameblank007@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/1] ALSA: hda/realtek: add quirk for HP Victus 15-fb0xxx
In-Reply-To: <20260326134409.15230-1-nonameblank007@gmail.com>
References: <20260326134409.15230-1-nonameblank007@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 2D4F34D250
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 26 Mar 2026 14:43:24 +0100,
NonameBlank007 wrote:
> 
> This adds a mute led quirck for HP Victus 15-fb0xxx (103c:8a3d) model
> 
> - As it used 0x8(full bright)/0x7f(little dim) for mute led on and other values as 0ff (0x0, 0x4, ...)
> 
> - So, use ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT insted for safer approach
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: NonameBlank007 <nonameblank007@gmail.com>

Please use a real name or a known identity for Signed-off-by line as
it's a legal requirement.


thanks,

Takashi
