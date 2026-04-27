Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47D2388E72
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 11:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290771; cv=none; b=puqxdHAvSqhAgvGZzp4AnyStATFOObdsxSmd9af4wZLSwufjCqgahbIAwtR/53x0PRBzyXII2SgfDXsfS/aFZ6Saa8yUGtaWeuvdHn2Atsy9/UyYsFGgRRXs/SaM6QsuLyp4e+W5JGPt1pMQh7Dk7w2jZwQOvzj5+nHxHH9cZmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290771; c=relaxed/simple;
	bh=NHs4w+rTt5T28/u/Ux8PMWouz6N2e4KC3Q0ecP153Os=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D2rfxotUcEplmBmIYOpeokAFg0IxB5rf56u+qxuMGs6odlccUADEkFrfqvNdiRQCc1K0jNr+qFjQ4qoCTJ5P5+KrMFi4IjfP+v0SOwFeozruih5eb6BlvyqDbIbKQ5qeaF7xKzivilTDslFCRxD/KlQqV5cB7lH2AKPvN2Xq6IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f617WbeS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wMfevgso; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f617WbeS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wMfevgso; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f617WbeS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wMfevgso";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f617WbeS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wMfevgso"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 91F625BCCD;
	Mon, 27 Apr 2026 11:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777290763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xXzR8Czzqt/HQU7Nplb7OvNiP482aaXb0lHBU49k5U0=;
	b=f617WbeS09UCO9ILkS0qsVTM2jWHlyhHU04lqsaym2qJXE0DpMgJqqrm18Alg9VV8euNpu
	I0PaxfPX62s+f8z/Rtur8CVvQ8PJJj5VSCU/E9RVflhiIahzds7oBr2+fOR1WjfWeDCDdx
	gp3CBQv/6R1uOC+09c6rW9halA2Lfk8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777290763;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xXzR8Czzqt/HQU7Nplb7OvNiP482aaXb0lHBU49k5U0=;
	b=wMfevgsoIR5LUb56iHQOtVPQX+ZHcF3jFSxY1zZ2BwsEyhKMPiyJsRQ7J8lPAYz5h0ngyY
	tp5AUYcnUKvM/5Cw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f617WbeS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wMfevgso
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777290763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xXzR8Czzqt/HQU7Nplb7OvNiP482aaXb0lHBU49k5U0=;
	b=f617WbeS09UCO9ILkS0qsVTM2jWHlyhHU04lqsaym2qJXE0DpMgJqqrm18Alg9VV8euNpu
	I0PaxfPX62s+f8z/Rtur8CVvQ8PJJj5VSCU/E9RVflhiIahzds7oBr2+fOR1WjfWeDCDdx
	gp3CBQv/6R1uOC+09c6rW9halA2Lfk8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777290763;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xXzR8Czzqt/HQU7Nplb7OvNiP482aaXb0lHBU49k5U0=;
	b=wMfevgsoIR5LUb56iHQOtVPQX+ZHcF3jFSxY1zZ2BwsEyhKMPiyJsRQ7J8lPAYz5h0ngyY
	tp5AUYcnUKvM/5Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 66BDD593B0;
	Mon, 27 Apr 2026 11:52:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cuzbFwtO72l3cwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 11:52:43 +0000
Date: Mon, 27 Apr 2026 13:52:43 +0200
Message-ID: <87jytszkl0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] ALSA: ctxfi: simplify mixer allocation
In-Reply-To: <20260425013020.430496-1-rosenp@gmail.com>
References: <20260425013020.430496-1-rosenp@gmail.com>
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
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 91F625BCCD
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Sat, 25 Apr 2026 03:30:20 +0200,
Rosen Penev wrote:
> 
> Combine 3 allocations into one to simplify memory management.
> 
> No need for 3 separate frees now.
> 
> Replace void pointers with proper types. No need for void here.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
