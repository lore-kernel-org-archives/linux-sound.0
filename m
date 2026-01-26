Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8421311C09
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 08:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769416995; cv=none; b=JkgVG95Jb8qaiacHSCjMMDsvGD/F4OzYx/m9rnRwHJkO1ZxuXJ13tzvuOvaDBzNW5VbC7z7C3AZGmY8YlNv6QWXzpG/fnms4zOGhd1siagZcTfvsEWJELwz5d4GiD5wGJHs/vCFb7mfvyDny5FJ6ZA+YjhuJckVImHmd9FfNbfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769416995; c=relaxed/simple;
	bh=1FOkszlMwzLLKiyFUcC4xwe7nYxa0IjZ5Toew5Irakw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o438U4LkZPbESmFnVXRq2b4n5sWjClwwfc2TzpUISSejSgSBSUG3tnQknyP9jKy/Tv/kAiTgIzJhh3JQhntVplhLAV/i5NGXPQ6Eb4j6v+Pjsh9OQAqUYMR73k89ENOrk7onBqoO/SKBAlJIl3O6JYORUSkmuON238PDRc2dJj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ktbkhYTL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3acyh/ng; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ktbkhYTL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3acyh/ng; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ktbkhYTL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3acyh/ng";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ktbkhYTL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3acyh/ng"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 174795BCED;
	Mon, 26 Jan 2026 08:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769416992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LOC/Ytvche6mB0e7SJ089bdGMDnM2vTcntMPXy3JtSE=;
	b=ktbkhYTLK8MGz/4g3btnjvyga2Od/f71c+Qzc3hh76qIdG5x6wAGwKqVONqnlBztUFReC3
	GpURf4B6zwKrf/255Yb6bS/VPnlAb3jVAZTCqv63fM0GOtwAtFz13SR7//E9mv2LkPp5aG
	lGkNJH3JOJYe3BUUufPrBeaYuxmHBLs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769416992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LOC/Ytvche6mB0e7SJ089bdGMDnM2vTcntMPXy3JtSE=;
	b=3acyh/ngcXFzvO5jSQIsgw8/1IBwWhj0HRqMV0e9onBun/sWZcgcaylVlmDGNkxHXoBNvJ
	NAtykFPdhEvg2fCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ktbkhYTL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="3acyh/ng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769416992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LOC/Ytvche6mB0e7SJ089bdGMDnM2vTcntMPXy3JtSE=;
	b=ktbkhYTLK8MGz/4g3btnjvyga2Od/f71c+Qzc3hh76qIdG5x6wAGwKqVONqnlBztUFReC3
	GpURf4B6zwKrf/255Yb6bS/VPnlAb3jVAZTCqv63fM0GOtwAtFz13SR7//E9mv2LkPp5aG
	lGkNJH3JOJYe3BUUufPrBeaYuxmHBLs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769416992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LOC/Ytvche6mB0e7SJ089bdGMDnM2vTcntMPXy3JtSE=;
	b=3acyh/ngcXFzvO5jSQIsgw8/1IBwWhj0HRqMV0e9onBun/sWZcgcaylVlmDGNkxHXoBNvJ
	NAtykFPdhEvg2fCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A4514139F0;
	Mon, 26 Jan 2026 08:43:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DdC9Jh8pd2mOKwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 26 Jan 2026 08:43:11 +0000
Date: Mon, 26 Jan 2026 09:43:11 +0100
Message-ID: <87ldhkbw80.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	chris.chiu@canonical.com,
	edip@medip.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ALSA: hda/realtek: Add quirk for Inspur S14-G1
In-Reply-To: <20260126073508.3897461-2-zhangheng@kylinos.cn>
References: <20260126073508.3897461-1-zhangheng@kylinos.cn>
	<20260126073508.3897461-2-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,kylinos.cn:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 174795BCED
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Mon, 26 Jan 2026 08:35:08 +0100,
Zhang Heng wrote:
> 
> Inspur S14-G1 is equipped with ALC256.
> Enable "power saving mode" and Enable "headset jack mode".
> 
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

The use of Chromebook quirk is rather rare, but as long as it was
tested and confirmed to work, there is no reason to avoid it.

Now applied.  Thanks.


Takashi
