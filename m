Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1032472BA
	for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 10:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766312509; cv=none; b=XZSzCI0hXX+cWjLEU2JzA/qPcx+XSI+K/+BNdhURRAUyS72EUGC/UgpOquAe2FUbsz+7WsCbGj/T+aaK2z+6SPTaWpSv0k2se9hCEYQAc0vDDZ4nvVe1GN3AL2jJQRWnX5OlA4OQYlc48IhBQzKe7oFd/i1r7Z/TfJN24m5U94E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766312509; c=relaxed/simple;
	bh=apyf4q2s3P5eoy+nFBVdgTUC0AuUreenGhegVMGkO7Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sFCck070ZYvW9xzSztMOximrPmAOe3Hz/Y4g/mNtOiTWv6eY1hXIhVkIbI38sa+p1c/PzZjSqRyUFLncirmIrkYiMJhRj7g9h3z6ciwvO6LgDHb7JKjb0ONDhSIw1zWnkfroSNghT66qC3DIDbYCZmgBwRHjcbMPAD1CqRDCQIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gT3S+rqU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+DCCl+aH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lpPeDnvt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Sm3RDrWX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gT3S+rqU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+DCCl+aH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lpPeDnvt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Sm3RDrWX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BCE873387C;
	Sun, 21 Dec 2025 10:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766312505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/2oXZGmGVHVr8v2lwqjqU+VSXsEzYcXw1CZtYZhYbhs=;
	b=gT3S+rqUNWOOgMuCMrRylKlo1xTvrnSuBbjqgQOdAa9VspTFIurkb1Z+MLvbzlTQBZ5bsB
	1VAa5B36Xh6kb0n5djOg2MIaYOeehcgGmaQNUOU802srIXe2Y54lpfQYUJ4YqF7/+WgMT0
	oUXmkkF+4Smlcxja9NpFS2fNjJxWGns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766312505;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/2oXZGmGVHVr8v2lwqjqU+VSXsEzYcXw1CZtYZhYbhs=;
	b=+DCCl+aH/j9vYcjwMtagq1HtWofOkVkAxT9O4XjE6skqG7RFB2nAZPLPRHhAe9LXpzLCUF
	CneKxrew31z1fPDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lpPeDnvt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Sm3RDrWX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766312503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/2oXZGmGVHVr8v2lwqjqU+VSXsEzYcXw1CZtYZhYbhs=;
	b=lpPeDnvtnZ5C2epg0cfYjbtYeAXbuavwUTFeku8pPFq9BIFVO4SaF8MFrkNpoeVU6s+v5t
	KAE4zGWaKmUj9ylg0g4+nbVI7DiMa328xCfzxqC8iQiNg/QJfTiiz7Sdw9ICJC0qlzz5AP
	1zn8EnLWm4nKOYXPn1/PT2iO5ZQnAkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766312503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/2oXZGmGVHVr8v2lwqjqU+VSXsEzYcXw1CZtYZhYbhs=;
	b=Sm3RDrWXUtEofEcvlq3Wg7/AyvDAIdDQBpPV8UlPwN3gGnjufF1vVPI+hugE/cWKId5zFn
	txjNl5YK/T/Q74DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B0CE13A54;
	Sun, 21 Dec 2025 10:21:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FoQwCzfKR2nOfQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 21 Dec 2025 10:21:43 +0000
Date: Sun, 21 Dec 2025 11:21:42 +0100
Message-ID: <87v7i0yw21.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Leo Tsai <antivirus621@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	leo.tsai@cmedia.com.tw,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [PATCH v6] ALSA: hda/cm9825: Add GENE_TWL7 support for AAEON
In-Reply-To: <20251218055136.3875-1-antivirus621@gmail.com>
References: <20251218055136.3875-1-antivirus621@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: BCE873387C
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Thu, 18 Dec 2025 06:51:36 +0100,
Leo Tsai wrote:
> 
> The GENE_TWL7 project is an AAEON platform with a fixed audio
> configuration consisting of line-out, line-in, and mic-in.
> The audio routing and pin assignments are defined according to
> the board-level hardware design and are not intended to be
> dynamically changed.
> 
> Signed-off-by: Leo Tsai <antivirus621@gmail.com>

Applied now to for-next branch.  Thanks.


Takashi
