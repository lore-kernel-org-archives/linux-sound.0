Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2D43148B3
	for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 08:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768638735; cv=none; b=dhg1/CmXDgRv4QR9CU32e1b53hXChVqPw/ke67jFkDfz18xWbg4RW4D0t9JBX/FmHQszK+V7+l9sFVVH4SjyeLW/+VgbWjPTOx1ZlheyQZ0Myo+iX+RQKq+h492r69U5J83Hubjn7zRi+M5v2BnuYfQrjwzw1uqwIoG7wVJHV18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768638735; c=relaxed/simple;
	bh=G8hN+Ka8G1RexJhcol87YDJ0uilBXZtsw/Tkt9tbsC0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ClXMpbcK44qrV+6/ZONaAhy17xnU+1C9oH1tD51twdrVXxOLIWnBpJl5UFkPJAdDDkD13qHDBlkKfqlvIlZPse1eqIXBFVVHfpHUC//MMaJWyMmK/mpIG0FBo5tpI4pXLc6e/jltZtMTys1qhwZcbgPyJdmqx5wQZiKvlecwmd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QZXcWW2N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FU67g5H4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pQWzeZGj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7yAUkb6v; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QZXcWW2N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FU67g5H4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pQWzeZGj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7yAUkb6v"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CBBCA3368D;
	Sat, 17 Jan 2026 08:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768638732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HXH4KYkB499gfV6Z9RQkB97dG6PwmZirWETSN19m4JM=;
	b=QZXcWW2N4scBVPmkf60qvXfHJ4eCia6CJ6yWUqQr/eUqIaagRQWPutHXGE+r5DEpc7cmJ6
	QP0MIoIdctc5YR2tAZhmay/JHIE1Apk0eULggzVgqt1AyaWh41FvxijPge5G5RZZ2KOQ3V
	9lKynpqmaSPq3yLIKlGtdULwIWAm1Tc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768638732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HXH4KYkB499gfV6Z9RQkB97dG6PwmZirWETSN19m4JM=;
	b=FU67g5H4a1LG8h/v79W0YOqYOdfdCbc1htPfF/oX52S3epQBmRkrBcnBQjqJBgyLHCI3/5
	6HrPZZbYes9c9oDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pQWzeZGj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7yAUkb6v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768638731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HXH4KYkB499gfV6Z9RQkB97dG6PwmZirWETSN19m4JM=;
	b=pQWzeZGj4hTCjNiaOZttZDngco232W8Ew/aLGCR0zhLY3oi+7iG+FCv9MLsCopYF0vywk/
	vG3KgMgIBQDURmXKz3MGK2O5eF/OzmPKQIEl3uXosMvPhip3539A/SNqJtenoWU6kGcjjk
	sSqfK1bOLolwDZb76L3w8ykCrljtGwc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768638731;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HXH4KYkB499gfV6Z9RQkB97dG6PwmZirWETSN19m4JM=;
	b=7yAUkb6v3Gr3wJCnVBawICDEcz0pYgHOp0sW+Nme2g9CLh5z6ZVjJh72G+ojxCTM/4DBBh
	i5dGrIoIqkUQpDCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A6413EA63;
	Sat, 17 Jan 2026 08:32:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rFQ1JAtJa2nEagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 17 Jan 2026 08:32:11 +0000
Date: Sat, 17 Jan 2026 09:32:11 +0100
Message-ID: <871pjod4hg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arun Raghavan <arunr@valvesoftware.com>
Cc: <linux-kernel@vger.kernel.org>,
	Arun Raghavan <arun@arunraghavan.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai
	<tiwai@suse.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH] alsa: usb: Increase volume range that triggers a warning
In-Reply-To: <20260116225804.3845935-1-arunr@valvesoftware.com>
References: <20260116225804.3845935-1-arunr@valvesoftware.com>
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.de:dkim,suse.de:mid]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: CBBCA3368D
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Fri, 16 Jan 2026 23:58:04 +0100,
Arun Raghavan wrote:
> 
> On at least the HyperX Cloud III, the range is 18944 (-18944 -> 0 in
> steps of 1), so the original check for 255 steps is definitely obsolete.
> Let's give ourselves a little more headroom before we emit a warning.
> 
> Fixes: 80acefff3bc7 ("ALSA: usb-audio - Add volume range check and warn if it too big")
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: linux-sound@vger.kernel.org
> Signed-off-by: Arun Raghavan <arunr@valvesoftware.com>

Applied now.  Thanks.


Takashi
