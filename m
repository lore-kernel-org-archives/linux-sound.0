Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FA643C076
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 14:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777387473; cv=none; b=TYqBFPuxJCgIQIm5nINK4kqA6P85F8MrHl2x5yylkJy02rHrQgLFu8rjdQOYhhyc4pOWE32Ihcz7q8g5TJ8/FD01m8d71b5Km0PKpldeePsEFE1wVleWiyRsCrX8RDK38VhHJJPimEPdd/W9obvmFQxTPWXD9iDyTcka9ZH0VP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777387473; c=relaxed/simple;
	bh=oGYdDELDCQLXqMUjiokF3+jBPpzIMVaNqkXaPd0Hwv0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RHhUZKszKaC66pEgGmXcl+kv15WGrStJOEkAnJHrjbfsx91LnicrjOB+K7HWQWrzh9hjETHdQg528W1AlJnvKkFN0s3PpB2bGG/4NzaSxLV3ey7QAqg1nVyBWkegpGImAtcYApkt2GlwVX5W9zuWv+zwT9iFfnxj/ytHSqzfu/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PgvvhRlN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dj5sdGpN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PgvvhRlN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dj5sdGpN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PgvvhRlN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dj5sdGpN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PgvvhRlN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dj5sdGpN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 663375BD4F;
	Tue, 28 Apr 2026 14:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777387468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fKIQbp4W7VKcDLsPJCuUNF/pe2Y3s0pNKH9LW30B1d4=;
	b=PgvvhRlN5HTPL4pVNvu9Ml2P4fZZYzWUMFqF99ClrDjjhC/Mt5vsRYEQYNOZTnAk++QHOD
	ZQe7yDKB3l/Bku1u6MIrQjH9oas/cRdUpAK1+vIbnvhtBKLThCeq2pjokB+7bm7cqiQs24
	16prZU9YUlhM2nYx4S6vMQ8Dzp2LoG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777387468;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fKIQbp4W7VKcDLsPJCuUNF/pe2Y3s0pNKH9LW30B1d4=;
	b=dj5sdGpNWtlGNky5pwkgHjuC/FolSXwASGEFHOdcdbWjfvQwp6zDDbO/NUdmGlG9yVbQLu
	pRi8wQsWZfssvhBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777387468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fKIQbp4W7VKcDLsPJCuUNF/pe2Y3s0pNKH9LW30B1d4=;
	b=PgvvhRlN5HTPL4pVNvu9Ml2P4fZZYzWUMFqF99ClrDjjhC/Mt5vsRYEQYNOZTnAk++QHOD
	ZQe7yDKB3l/Bku1u6MIrQjH9oas/cRdUpAK1+vIbnvhtBKLThCeq2pjokB+7bm7cqiQs24
	16prZU9YUlhM2nYx4S6vMQ8Dzp2LoG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777387468;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fKIQbp4W7VKcDLsPJCuUNF/pe2Y3s0pNKH9LW30B1d4=;
	b=dj5sdGpNWtlGNky5pwkgHjuC/FolSXwASGEFHOdcdbWjfvQwp6zDDbO/NUdmGlG9yVbQLu
	pRi8wQsWZfssvhBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3BE74593B0;
	Tue, 28 Apr 2026 14:44:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VvEBDczH8GmDOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 Apr 2026 14:44:28 +0000
Date: Tue, 28 Apr 2026 16:44:27 +0200
Message-ID: <87bjf3du0k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Abhinav Mahadevan <abhi220204@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: usb-audio: Add quirk for PreSonus AudioBox USB
In-Reply-To: <20260428143527.5453-1-abhi220204@gmail.com>
References: <20260410143335.5974-1-abhi220204@gmail.com>
	<20260428143527.5453-1-abhi220204@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 28 Apr 2026 16:33:38 +0200,
Abhinav Mahadevan wrote:
> 
> The PreSonus AudioBox USB (0x194f:0x0301) only advertises S24_3LE
> for both playback and capture interfaces. Add an explicit entry to
> the quirks table to ensure correct format handling for this device.
> 
> Fixes: 099cce2b5 ("ALSA: usb-audio: Add quirk for PreSonus AudioBox USB")

Non-existing commit ID for the upstream.
And, you'll have to put 12 letters SHA id here.

> Signed-off-by: Abhinav Mahadevan <abhi220204@gmail.com>
> ---
> 
> v3: Update patch description to accurately reflect the change
> (adding a quirks table entry, not fixing format negotiation).

... and it's not exactly what *this* patch does!
You don't have to repeat the same text you already gave in the
original commit at all.

Basically this patch *corrects* the position of the quirk entry that
was mistakenly put into the disabled block in the previous commit.

Please resubmit with a proper patch description and Fixes tag again.


thanks,

Takashi
