Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0582FD665
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 07:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694339; cv=none; b=GOkdSFuKPUan2GwK1vKzClgkF4OTT4+wFfIXZ5u/+cIgmuCMzo81eAVxB1FZkTik7LIeHABDyzn7G1MkCczrTL2p949pk4wrGGsjbUGk//rmNVvMuHeZzPuKuKzFlFxuCoYLCYsMfrvKNbcJQdfrdWJ9ib9xfRvmMtiyVBmakZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694339; c=relaxed/simple;
	bh=q0MY3vmY/rgUwoekGs7OKUNrJCgu5VnDU+DYDtMTvQo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pHXdWn2S7uNKyRFPt99bAM2uSPsq5hlf5M7HASlgbmJxBfXQokejfxi1WYlXMwYRWtNcFxO/AuqOYvg5Gbw8bElZjALCmsXfxE7ZpqAs59PxwuXUhYjy6Hi42qcFxtdhxs3tBs+qMb0zmMOf9TIJa/nqZPkXO1CTj4HbpneOWyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qO6ClztS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fVJngHY8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qO6ClztS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fVJngHY8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qO6ClztS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fVJngHY8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qO6ClztS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fVJngHY8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7B65A64AE0;
	Mon, 25 May 2026 07:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779694336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bbslI724Te72fx+84XkJpKp59q0GrturJny0BOlJxfk=;
	b=qO6ClztSWxsNchLezPLpf0YYosLZUotShAUvUDNg4PJ/Zo8aWVFL57dIIOQzI+P+92J6nK
	ZdBBACUaBkYuBlhZKmkkH4MBqJHTlGB0vgckwQI0THhvzFimyrxSOqO6VOphUpn1v+wt4r
	AnvxJw3WEPdocHYWeehvuifSHSb3nyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779694336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bbslI724Te72fx+84XkJpKp59q0GrturJny0BOlJxfk=;
	b=fVJngHY8QsxUShXs1+WnThK/A/2/RELZs5WRQpi7u+yzxnXQluNSCRLXVb+Qnba2+4uTmZ
	YMAql592XCdUE1Aw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qO6ClztS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fVJngHY8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779694336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bbslI724Te72fx+84XkJpKp59q0GrturJny0BOlJxfk=;
	b=qO6ClztSWxsNchLezPLpf0YYosLZUotShAUvUDNg4PJ/Zo8aWVFL57dIIOQzI+P+92J6nK
	ZdBBACUaBkYuBlhZKmkkH4MBqJHTlGB0vgckwQI0THhvzFimyrxSOqO6VOphUpn1v+wt4r
	AnvxJw3WEPdocHYWeehvuifSHSb3nyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779694336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bbslI724Te72fx+84XkJpKp59q0GrturJny0BOlJxfk=;
	b=fVJngHY8QsxUShXs1+WnThK/A/2/RELZs5WRQpi7u+yzxnXQluNSCRLXVb+Qnba2+4uTmZ
	YMAql592XCdUE1Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DCEC59B17;
	Mon, 25 May 2026 07:32:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qzS8EQD7E2psGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 25 May 2026 07:32:16 +0000
Date: Mon, 25 May 2026 09:32:15 +0200
Message-ID: <878q98gd1c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Len Bao <len.bao@gmx.us>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: isa: Mark '*_registered' variables as __ro_after_init
In-Reply-To: <20260524154051.45258-1-len.bao@gmx.us>
References: <20260524154051.45258-1-len.bao@gmx.us>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 7B65A64AE0
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,gmx.us:email];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmx.us];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmx.us];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Action: no action
X-Spam-Flag: NO

On Sun, 24 May 2026 17:40:49 +0200,
Len Bao wrote:
> 
> The '*_registered' variables are initialized only during the init
> phase in the '__init' functions and never changed. So, mark them as
> __ro_after_init to reduce the attack surface.
> 
> Signed-off-by: Len Bao <len.bao@gmx.us>

Applied to for-next branch.  Thanks.


Takashi
