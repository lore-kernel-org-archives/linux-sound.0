Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D77742669C
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 15:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772121208; cv=none; b=Z9geDKz9sPDjGzqNz3RZrFxEopyg4vURybNTrjwkqngeKrTdCieotcURvb0sMKl2BI/71ApbaoZKdJXw57B3wMHwG1tdELYGuKMd5gBeY6G/M9AYlY0sf50bifFO4SLZRpzoJaHUjlg4g3DGF2V8u4YeOsgrcfEcYnHprNXu7vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772121208; c=relaxed/simple;
	bh=F/R7vW1NdYbsQjv1PxA4HhoDrPhRHYEC+/7m2vPXJ0k=;
	h=Date:Message-ID:From:To:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F8GZbL70pbg2LQHaRspkQyGkCT2GFq83J65jU5354whJNXHIwmocZ4xwr+Bm9txV8vCSAHXz0eCY99ysseQBeh+UbZA+wkmZm+LtIHgjZP83TDj5BCukUshcrj/ucqgzj8LNxjAiOjEnXYc+9bV4lJ+GAVfpvJpjIMwEfrnUW+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AIcdPZrO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eFf2FFTP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AIcdPZrO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eFf2FFTP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AIcdPZrO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eFf2FFTP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AIcdPZrO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eFf2FFTP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 814BE1FA90
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 15:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772121202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GwF1R/1AGY8OZLE90X4QmU8OFJVbqnSkaPGd7c/6GxU=;
	b=AIcdPZrOmDwFfpjaYFeuDjkNoDCJKuhrvTtiBcXXWJuv4aL9fNXyXbwcIk43SGFe4UUlA8
	UPFY7UN81b3XivWSi3SaW2/KrgVXXhN0dKQkfynRqrAZX8E5uim5KqD8HgC6xDESd38TBf
	rp3MymiaOkaQ0pdL4odW5GoXUmrAPJU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772121202;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GwF1R/1AGY8OZLE90X4QmU8OFJVbqnSkaPGd7c/6GxU=;
	b=eFf2FFTPYxpZGaXQBe220vHNLeHwedPvFNhODeO89414NcuZAW+7SQ3EiIqGxKrslF8cF5
	EWuuURQxQRaubtAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AIcdPZrO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eFf2FFTP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772121202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GwF1R/1AGY8OZLE90X4QmU8OFJVbqnSkaPGd7c/6GxU=;
	b=AIcdPZrOmDwFfpjaYFeuDjkNoDCJKuhrvTtiBcXXWJuv4aL9fNXyXbwcIk43SGFe4UUlA8
	UPFY7UN81b3XivWSi3SaW2/KrgVXXhN0dKQkfynRqrAZX8E5uim5KqD8HgC6xDESd38TBf
	rp3MymiaOkaQ0pdL4odW5GoXUmrAPJU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772121202;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GwF1R/1AGY8OZLE90X4QmU8OFJVbqnSkaPGd7c/6GxU=;
	b=eFf2FFTPYxpZGaXQBe220vHNLeHwedPvFNhODeO89414NcuZAW+7SQ3EiIqGxKrslF8cF5
	EWuuURQxQRaubtAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D3043EA62
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 15:53:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TNmGGXJsoGmPdQAAD6G6ig
	(envelope-from <tiwai@suse.de>)
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 15:53:22 +0000
Date: Thu, 26 Feb 2026 16:53:22 +0100
Message-ID: <87seana4ct.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/3] ALSA: us144mkii: Drop kernel-doc markers
In-Reply-To: <20260226154414.1081568-2-tiwai@suse.de>
References: <20260226154414.1081568-1-tiwai@suse.de>
	<20260226154414.1081568-2-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-sound@vger.kernel.org];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 814BE1FA90

On Thu, 26 Feb 2026 16:43:47 +0100,
Takashi Iwai wrote:
> 
> We don't process this driver code for kernel-doc, and the "/**" marker
> leads to warnings with W=1 builds.  Drop the superfluous markers, and
> also fix the invalid mark up, too.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/usx2y/us144mkii.c          | 14 +++++++-------
>  sound/usb/usx2y/us144mkii_midi.c     | 22 +++++++++++-----------
>  sound/usb/usx2y/us144mkii_playback.c | 10 +++++-----

I noticed there are another couple files that still have the same
problem, and should be fixed together.  Will resubmit v2 patch.


Takashi
