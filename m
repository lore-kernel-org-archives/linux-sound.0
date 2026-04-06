Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2967229AAEA
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 08:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775465463; cv=none; b=edKXR/ezGIKwzYVDdmifIgX/HtRJ04a65WTQ9DkdzzvSvDQBjvce5QLHNfbHv2gXkSj+Qgva1s+AqcQrwfVP/nVjG9Y5Jqi3RArU+pVU/nNWSEHrmia6I5SPwPX6GYVPB4cYD+8qITGUvIGQxA0WD5wK5NmTJnCQcBW5lMkEz48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775465463; c=relaxed/simple;
	bh=fk4MOl3rLi/1hIqXtcJzeZUxW09UnHQUFrwI/J+vB34=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DMOUTb2Amz4pyp0aTJ9/UuahX3A0n3wVMCrZ+UxXKPZQC4eOwjVczcWKN2hRFUh1JUbluO7B80WA3Y/5IAJAN3YMVZzv7iAoiPdOZghERA08IFig+iW58FN2yjmY8FCRmfi/Alr1e/mbIo7ESkBv5D1jLIdon/vMshrphVGoiH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b3ucY19r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QSdIU8/L; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b3ucY19r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QSdIU8/L; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b3ucY19r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QSdIU8/L";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b3ucY19r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QSdIU8/L"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 897695BDA6;
	Mon,  6 Apr 2026 08:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775465460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tNo4vkaPjOKVOIe3QeHtvw8y7v3OB3kKqACyvMuXbTY=;
	b=b3ucY19rssD2PM5DlJXn4FjuImyGd/GzMlm6A3/IXwHw7/4yMbeXFs83Vwvh9e80rifw3P
	v8PLkecyEsjO45AlJL+39HhpFVzUhZ3Pq1TXk8BDXzIDbO7RGx/dFhDNRvXHdV9U8IlGVX
	0X5YOge+ruTyHAcB5M9F06j3ndR+MF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775465460;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tNo4vkaPjOKVOIe3QeHtvw8y7v3OB3kKqACyvMuXbTY=;
	b=QSdIU8/Lz3jGlGW7FQb5tNsfUlXmBauNiEb6XUwKQIyqmm3/ZvbSXTiuFm+RTmFeIKJQ/s
	YhycEgqKY68CgICw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775465460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tNo4vkaPjOKVOIe3QeHtvw8y7v3OB3kKqACyvMuXbTY=;
	b=b3ucY19rssD2PM5DlJXn4FjuImyGd/GzMlm6A3/IXwHw7/4yMbeXFs83Vwvh9e80rifw3P
	v8PLkecyEsjO45AlJL+39HhpFVzUhZ3Pq1TXk8BDXzIDbO7RGx/dFhDNRvXHdV9U8IlGVX
	0X5YOge+ruTyHAcB5M9F06j3ndR+MF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775465460;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tNo4vkaPjOKVOIe3QeHtvw8y7v3OB3kKqACyvMuXbTY=;
	b=QSdIU8/Lz3jGlGW7FQb5tNsfUlXmBauNiEb6XUwKQIyqmm3/ZvbSXTiuFm+RTmFeIKJQ/s
	YhycEgqKY68CgICw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E5B34A0B0;
	Mon,  6 Apr 2026 08:51:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id g4vAFfRz02lEMAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 Apr 2026 08:51:00 +0000
Date: Mon, 06 Apr 2026 10:50:59 +0200
Message-ID: <87zf3glbf0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Harin Lee <me@harin.net>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ctxfi: Add fallback to default RSR for S/PDIF
In-Reply-To: <20260406074913.217374-1-me@harin.net>
References: <20260406074913.217374-1-me@harin.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Mon, 06 Apr 2026 09:49:13 +0200,
Harin Lee wrote:
> 
> spdif_passthru_playback_get_resources() uses atc->pll_rate as the RSR
> for the MSR calculation loop. However, pll_rate is only updated in
> atc_pll_init() and not in hw_pll_init(), so it remains 0 after the
> card init.
> 
> When spdif_passthru_playback_setup() skips atc_pll_init() for
> 32000 Hz, (rsr * desc.msr) always becomes 0, causing the loop to spin
> indefinitely.
> 
> Add fallback to use atc->rsr when atc->pll_rate is 0. This reflects
> the hardware state, since hw_card_init() already configures the PLL
> to the default RSR.
> 
> Fixes: 8cc72361481f ("ALSA: SB X-Fi driver merge")
> Cc: stable@vger.kernel.org
> Signed-off-by: Harin Lee <me@harin.net>

Applied to for-next branch now.  Thanks.


Takashi
