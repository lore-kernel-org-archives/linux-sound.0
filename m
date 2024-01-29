Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD8652F65
	for <linux-sound@vger.kernel.org>; Mon, 29 Jan 2024 08:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706515845; cv=none; b=CiMPWDwyPJpQKko7EdRc4SpDuU+Tt8DaRmB8w5M1b23MJttWqcFcI+Y46ReE/bU3b0gw92yl6gMoim49q0enakQfpkGv2X4bgAE+hmH8UtD+0irbnuycHlvrJ62E5u0lzZ2vVomFwnnfvIy9QH4hxQs0A7gkbAhxzFogF4YfHwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706515845; c=relaxed/simple;
	bh=XEbsdlOqsFxhqyay4HPRioN/YF76CHzLUAnIf+ww4Jg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZxaLDGdzFFs6cIQKM9+Sla41i7huqKU39naaMX/m2GKjur6pHtvmZBe5NSl3hgLd3Qsj4zpVt094ar0a062oin0WKaqFaoSh7ghRHQDiDSCAIgi8xXxZZA2klJuRPwGiQfSUQ5LHlIjMxY1w626unNvQCLuKEMLzdoVi8VLcqok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g/itNrtE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qpNyev7d; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UtX/0Q2h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4ulzpf+m; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g/itNrtE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qpNyev7d";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UtX/0Q2h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4ulzpf+m"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3B8DA22284;
	Mon, 29 Jan 2024 08:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706515841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lWng3G5iwpWjfc5vUBBHcYqppV/C/zfWmjLSTSmt9mQ=;
	b=g/itNrtEwk3mYlFN80FZlrneydu2fUWi2t0LfkpF7EmtXsI+clFlZAvlIyaKcLDrfZs+al
	iULk2WFItE6ksBD8geHKPDxLs2KxpMN7UnEWiIdlnH5NxKLB08wMcGpleSjetia9OaY2LL
	QGXrReHSLSKqwgMjd7Yfxn9oRoBy25Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706515841;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lWng3G5iwpWjfc5vUBBHcYqppV/C/zfWmjLSTSmt9mQ=;
	b=qpNyev7dnkpyq+/0Gvy9Ik9Uhfdw5bVdp6WFFms7ACfWm+ml8WaMIosA7bZxMOJnLi6u6J
	whPzAHu7vvK5ZdCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706515840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lWng3G5iwpWjfc5vUBBHcYqppV/C/zfWmjLSTSmt9mQ=;
	b=UtX/0Q2hPx7BNErMC+wyPvTxzQgOvDhVTlqfyZzoj37k1NCCvPuuzCpd2yTYMpqXo0RO6j
	UkXRhLvd6wmsY1At3IxRBAS9EGUnsJfptM7EWTxOt3/WQErTnM2ABcrebZQBSeUHNbhaxQ
	fNHiNE2nX0yJFsuOXV9JihjwkM9LYl4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706515840;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lWng3G5iwpWjfc5vUBBHcYqppV/C/zfWmjLSTSmt9mQ=;
	b=4ulzpf+m2DnCBs+ZUCkCOwyfgMilux2htjXdDefsivY8t7KSc4BmbqeRwA/a4dHYJV0JgD
	22qswqt79Z/mklAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11B7B12FF7;
	Mon, 29 Jan 2024 08:10:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UWE9AoBdt2WbXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jan 2024 08:10:40 +0000
Date: Mon, 29 Jan 2024 09:10:39 +0100
Message-ID: <87mssomuf4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexander Tsoy <alexander@tsoy.me>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] Revert "ALSA: usb-audio: Skip setting clock selector for single connections"
In-Reply-To: <20240128132338.819273-1-alexander@tsoy.me>
References: <20240128132338.819273-1-alexander@tsoy.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="UtX/0Q2h";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4ulzpf+m
X-Spamd-Result: default: False [-2.05 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[tsoy.me:email,suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.74)[98.85%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3B8DA22284
X-Spam-Level: 
X-Spam-Score: -2.05
X-Spam-Flag: NO

On Sun, 28 Jan 2024 14:23:38 +0100,
Alexander Tsoy wrote:
> 
> This reverts commit 67794f882adca00d043899ac248bc002751da9f6.
> 
> We need to explicitly set up the clock selector to workaround a problem
> with the Behringer mixers. This was originally done in d2e8f641257d
> ("ALSA: usb-audio: Explicitly set up the clock selector")
> 
> The problem with MOTU M Series mentioned in commit message was fixed in
> a different way by checking control capabilities of clock selectors.
> 
> Signed-off-by: Alexander Tsoy <alexander@tsoy.me>

Thanks, applied.


Takashi
