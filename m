Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96620363C64
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 11:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777894004; cv=none; b=IDOT25YBZHLfYuFUFKn9XzXEFZFNEDD1WQtsBhPKQek/3Lrd6LSP3hx4HHtKZmwv85ziHkLaN23csjeUpT2tSYYfLtrdyLu5oC2ugZC4sCox0rkVi16RiTcOfCFAxuSKOTbGP0XxcPKcKFPA9+k/nxsBETRTBNbewQE31etG9JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777894004; c=relaxed/simple;
	bh=9DiSTGC4NBR+i3cXXJYnuBkMiiv6ZcU3FrpaRSX9klY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LUVgdFSOFAIZBiQL32eVUgNKS0Vvzi9r2K+tjIP6NIvNwF25kq7P9xCDO100HTLRzgL37XbmcsK9v74VTCEZ6fE1GuoZ31v21W52CddhwfeZG4aP7ZruLFXoPBu3TKbQZ3j9uwZ7TvmAcuHQviE8WSHSSg1lGcG4L9yefqWRBOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xZUH81OK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1kXhRRO9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xZUH81OK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1kXhRRO9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xZUH81OK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1kXhRRO9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xZUH81OK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1kXhRRO9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0355E6AFBA;
	Mon,  4 May 2026 11:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777894002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3VA0sk5nwTrkHrddDSUNRFDwht0q6X/rorZ3AEdFOI=;
	b=xZUH81OKShs0wu2uJ5zjPfVjc54PsYbc2/a5knWz15RvcqxBDcHprhPhQ195Do/WAVdRE4
	T3mLaEtmJj8mtc/eNyxUYQ/oLjvpDG1i5i9XFSM/TegufQ3Zi5YqvWxvGn0dB+tjO37xmS
	cGMhZJfS30X2a1C5meK4hVU8US+zFAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777894002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3VA0sk5nwTrkHrddDSUNRFDwht0q6X/rorZ3AEdFOI=;
	b=1kXhRRO9kmvtjwr+1yuZxo7Vv3xmQG4oMPORXlgDCZLy9mgoz/lkb+A6PDe/QGi+D7GAGy
	A3LUYs49lMNTfSDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xZUH81OK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1kXhRRO9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777894002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3VA0sk5nwTrkHrddDSUNRFDwht0q6X/rorZ3AEdFOI=;
	b=xZUH81OKShs0wu2uJ5zjPfVjc54PsYbc2/a5knWz15RvcqxBDcHprhPhQ195Do/WAVdRE4
	T3mLaEtmJj8mtc/eNyxUYQ/oLjvpDG1i5i9XFSM/TegufQ3Zi5YqvWxvGn0dB+tjO37xmS
	cGMhZJfS30X2a1C5meK4hVU8US+zFAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777894002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3VA0sk5nwTrkHrddDSUNRFDwht0q6X/rorZ3AEdFOI=;
	b=1kXhRRO9kmvtjwr+1yuZxo7Vv3xmQG4oMPORXlgDCZLy9mgoz/lkb+A6PDe/QGi+D7GAGy
	A3LUYs49lMNTfSDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B3631593A3;
	Mon,  4 May 2026 11:26:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HluGKnGC+GnFGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 May 2026 11:26:41 +0000
Date: Mon, 04 May 2026 13:26:41 +0200
Message-ID: <87y0hzxvny.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcmtest: Return -EFAULT on pattern read copy failure
In-Reply-To: <20260501-alsa-pcmtest-pattern-read-efault-v1-1-53e1e8c11dda@gmail.com>
References: <20260501-alsa-pcmtest-pattern-read-efault-v1-1-53e1e8c11dda@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,perex.cz,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0355E6AFBA

On Fri, 01 May 2026 19:45:14 +0200,
Cássio Gabriel wrote:
> 
> pattern_write() reports -EFAULT when copy_from_user() fails, but
> pattern_read() converts copy_to_user() failures into a zero-length read.
> That makes a userspace buffer fault look like EOF instead of reporting the
> actual error.
> 
> Return -EFAULT from pattern_read() when copying the pattern data to
> userspace fails, and update the file offset only after a successful copy.
> 
> Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied now.  Thanks.


Takashi
