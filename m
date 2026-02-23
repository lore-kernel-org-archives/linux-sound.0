Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE13343203
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771836976; cv=none; b=lmMJheDMTLUG8HYMNQcsp1a/G0zCrY+Ga/XzygzKhbApPIUO0d8BarTdHqrL8KZzkqzWGQ7EtakYISGwUKODBD7XSKyZKOozDG0weGTOw2mtNdHkLSBV5zWbuYJVqONaZCXh6Zozc0wjOV/6hdfFborxACLHwpebf9taHLIunhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771836976; c=relaxed/simple;
	bh=43R6GSyRBH/DMNINwThi/aGhpkKk/5DAk1S1Cz40mv0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fy91USSfqY7tKVOumYSjgGlqn9AJopzMR60scMED0BbF8RFw8UW9RWUlShUf6Rwf9QbdVOLYEqMWG2/NyY/tMku/Ahpn4VWEV5o4bBLwyuUrcdNbQ/VRCQPs4jF9G2lkNcVy8JAUGSTcMu2bWnm7mtgIg6ywqHR7eUDO4mcYqr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cQRa3Hm2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bKqkeSTT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N85JS72g; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=quqq5ncV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cQRa3Hm2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bKqkeSTT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N85JS72g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="quqq5ncV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D12DF5BD01;
	Mon, 23 Feb 2026 08:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771836974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5xXfq/HoxfgYoLiw/yxCmNuf8OEvlTCrMk6C5nSec4U=;
	b=cQRa3Hm2SgKE31ZucCDzzYKMKouD5Yb5lPg7af9yssm/jYqxmwIcosyMx1F3I8dl+SR5iz
	T+kSv74q957KiSVCsan4uTrDRZwTYweAJ2TWkFFiphOdmhD+XumvaE8DRCB/guup2oG5R4
	dXRhSvvCtshzaBD2pWoegONfFJfNu4c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771836974;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5xXfq/HoxfgYoLiw/yxCmNuf8OEvlTCrMk6C5nSec4U=;
	b=bKqkeSTTx+I0TVd0+mApdZ6tgM+jlqCBhtZ0c2yF4dTtLrYrLbgaG+PWz+gFcYwexGH+mQ
	prXIHpHtBhUVHFCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=N85JS72g;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=quqq5ncV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771836973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5xXfq/HoxfgYoLiw/yxCmNuf8OEvlTCrMk6C5nSec4U=;
	b=N85JS72gSETHEqTF/O2YB2g7F1YdaCgj8dp815wKuegg/yXJupIcT+eRY3LmAJBbrl4Hqc
	3VMMHQW5x5jEbo/XcAeuERSlS4O1yFHxph0lf66c01H3YUa8P29j+mlByeWkgkSijHJODt
	UiKl0g7OyXn7SMH46bkIXtd7GFITJQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771836973;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5xXfq/HoxfgYoLiw/yxCmNuf8OEvlTCrMk6C5nSec4U=;
	b=quqq5ncVc4YxB6PXhVLsg2GXUoo8RUtGHe1BBbj/HaImv/geB9199FTcSzm8absixD8/qu
	2ubc9LD2c1IytJAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8138B3EA68;
	Mon, 23 Feb 2026 08:56:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9FZDHi0WnGmLfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Feb 2026 08:56:13 +0000
Date: Mon, 23 Feb 2026 09:56:13 +0100
Message-ID: <871pibn8ia.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Pawe=B3?= Hofman <phofman@o2.pl>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	chris.chiu@canonical.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: use ALC285 rear speaker fixup for ASUS UX7602ZM
In-Reply-To: <20260222213224.216805-1-phofman@o2.pl>
References: <20260222213224.216805-1-phofman@o2.pl>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D12DF5BD01

On Sun, 22 Feb 2026 22:32:24 +0100,
Pawe³ Hofman wrote:
> 
> On UX7602ZM, the previous quirk (ALC245_FIXUP_CS35L41_SPI_2) left speaker volume behavior incorrect: increasing volume mainly boosted highs while overall loudness stayed nearly flat.
> 
> Use ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS because it also applies the ASUS-specific rear-speaker pin setup and chains the headset-mic fixup on top of CS35L41 SPI amp init, which matches this platform better.

You seem to have forgotten your Signed-off-by tag?
Also, try to fold the lines in the patch description appropriately,
too.

Please resubmit with those corrections.


thanks,

Takashi
