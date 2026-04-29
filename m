Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C177127281E
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 05:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777442012; cv=none; b=cWNMAKap6PtJoasDM9N6bmD36BK0A0B2HKtx5QjE+K0BAMczNyGjEAwMBi+yu5S6g/ZA1w0D86xOum9bDYRD3ThFWMVYmOWOC7iEq1aB1q5JNT6hijOrtg7VXbls53lbA+/MH0U1MLYshTb8R3UYrxw6CsCSoRdWuizoroSPv9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777442012; c=relaxed/simple;
	bh=VvjVSNrUJV2FUgNEgjoBWvePXFNEbUEXagaOHlQujbo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P96ISHq8ltoMpvHcE1NKUIg5dnMVQGp5KwQg7fwiDrCEXouNIlnKflHaoaFALYScMZswnR08KJm2QGzECiX9vD56fB0M5cA8P4ldBkkrhfGBH7RscEqlrlLWUk7ZatZqjcQUO1RadWmAKtX/Taj2dinza2QPlJm94/IDV0SedWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N2QAEPkd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T4sw2BlZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N2QAEPkd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T4sw2BlZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N2QAEPkd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T4sw2BlZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N2QAEPkd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T4sw2BlZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2B0B76A7FC;
	Wed, 29 Apr 2026 05:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777442009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jou1/aiPnMXOg6bbWZR+fKJn+Dy986aWE4o6n8/2KvI=;
	b=N2QAEPkdHwaACLIt05KYgZsWk1Yf4mnlYjao13k+3unmq1R3Qh60ZOKV4hgBO2htgKKWUW
	OpUmhvyrRpl83Yn/6xiIljnLV8eME0uU1rE2ww5p1Z+yXKYdiFHi5D8VMCHVLUMqiZm4wr
	NWMJ6DqW+627jfqblJAXv4BHBfwXrq0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777442009;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jou1/aiPnMXOg6bbWZR+fKJn+Dy986aWE4o6n8/2KvI=;
	b=T4sw2BlZPEwFBGkCID8QWhPCBaYOuUBQxmuQoPTwzbZPYNzx6tNkza+JOps8yvWo9ZbURI
	NWImWHs1Znnm45AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777442009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jou1/aiPnMXOg6bbWZR+fKJn+Dy986aWE4o6n8/2KvI=;
	b=N2QAEPkdHwaACLIt05KYgZsWk1Yf4mnlYjao13k+3unmq1R3Qh60ZOKV4hgBO2htgKKWUW
	OpUmhvyrRpl83Yn/6xiIljnLV8eME0uU1rE2ww5p1Z+yXKYdiFHi5D8VMCHVLUMqiZm4wr
	NWMJ6DqW+627jfqblJAXv4BHBfwXrq0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777442009;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jou1/aiPnMXOg6bbWZR+fKJn+Dy986aWE4o6n8/2KvI=;
	b=T4sw2BlZPEwFBGkCID8QWhPCBaYOuUBQxmuQoPTwzbZPYNzx6tNkza+JOps8yvWo9ZbURI
	NWImWHs1Znnm45AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F170B593B0;
	Wed, 29 Apr 2026 05:53:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ADmzOdic8WnLMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Apr 2026 05:53:28 +0000
Date: Wed, 29 Apr 2026 07:53:28 +0200
Message-ID: <87zf2mpb1j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound: oss: dmasound: kick queued output before extending tail fragment
In-Reply-To: <20260427-dmasound-sq-play-v1-1-28bbeb8509b1@gmail.com>
References: <20260427-dmasound-sq-play-v1-1-28bbeb8509b1@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 28 Apr 2026 00:13:28 +0200,
Cássio Gabriel wrote:
> 
> sq_write() currently clears POST and then immediately appends
> to the current rear fragment.
> 
> If the queue already contains complete fragments ahead of that
> incomplete tail, playback is not kicked until the queue-full wait
> path or the final sq_play() at the end of the write. That wastes
> the slack those queued samples would otherwise provide while the driver
> spends more time copying and translating more data into the tail fragment.
> 
> All in-tree dmasound playback backends still refuse to queue
> an incomplete last fragment while !syncing, but they can start
> earlier complete fragments.
> 
> Call sq_play() immediately after clearing POST and before extending
> the rear fragment so already-queued complete output can start earlier.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
