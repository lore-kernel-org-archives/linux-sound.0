Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0013155342
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 07:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749455481; cv=none; b=IT9z6BCjcQrXXPKEuGiEuqP+YkLSNvE431591TL1aTTDNFh46mlOVZ2pnOnuVwSD45zpqppkzFdHwpbLpWYjBk1HK6DzdHlY0VaBjcwK8pzXLVNMsu6p1/guiDApH9U2ueAnUpQzV5hBktNqDjtHG+IB9/sdCABykgTrn9QamUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749455481; c=relaxed/simple;
	bh=7c6Pe1rbJkL8RTNQmIRtjlrg6HzPXS5Xtvhtu8DOiqg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q+5tk8lEDHgFOgUms9mLFZ1fwHJsAIAM46a1meI5ZF2KGj46EZbxgKOQG9qrWHSsp5PJ0VDuI28tt4tS1C8B794OM0NHMzmtOcY/vqlLCmL6NME62tswERfV5j9DlB3Yiz763uWpPbAlu0ubXcbwO7SwC3znUywQfkEYGt2vCcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kpPrHHxp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a4WHsikL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kpPrHHxp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a4WHsikL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kpPrHHxp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a4WHsikL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kpPrHHxp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a4WHsikL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 202371F38D;
	Mon,  9 Jun 2025 07:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749455478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1lrXk8hUi9xG3Y+wU4YNvnynWhYNDRNkjGGrORNR4Ro=;
	b=kpPrHHxpohlegMvtIxJPIR1D6QTbg1P0VuZMfoZ9IJZhkP117i6DRJwjKT6xx6t/Hk/9Rd
	Y+IioTEdD7anNTDSwEzO0VMUY9K2X3Lbi3RM9jgVi47qzW+Wj7af1KL4OtWBfU2xtrcfgn
	iLwosQH/bQZCSS/0u8TjI56zZqYFCm0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749455478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1lrXk8hUi9xG3Y+wU4YNvnynWhYNDRNkjGGrORNR4Ro=;
	b=a4WHsikLqEZGjaP8zKnBq/CRZgZIv6p+MNyk77gmd5iXdsKpB4PDldthlG7F3H595KxQVT
	idJeOimTomMPygBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kpPrHHxp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=a4WHsikL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749455478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1lrXk8hUi9xG3Y+wU4YNvnynWhYNDRNkjGGrORNR4Ro=;
	b=kpPrHHxpohlegMvtIxJPIR1D6QTbg1P0VuZMfoZ9IJZhkP117i6DRJwjKT6xx6t/Hk/9Rd
	Y+IioTEdD7anNTDSwEzO0VMUY9K2X3Lbi3RM9jgVi47qzW+Wj7af1KL4OtWBfU2xtrcfgn
	iLwosQH/bQZCSS/0u8TjI56zZqYFCm0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749455478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1lrXk8hUi9xG3Y+wU4YNvnynWhYNDRNkjGGrORNR4Ro=;
	b=a4WHsikLqEZGjaP8zKnBq/CRZgZIv6p+MNyk77gmd5iXdsKpB4PDldthlG7F3H595KxQVT
	idJeOimTomMPygBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ED4B713A1D;
	Mon,  9 Jun 2025 07:51:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hpqJOHWSRmgvfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Jun 2025 07:51:17 +0000
Date: Mon, 09 Jun 2025 09:51:17 +0200
Message-ID: <877c1l8ia2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
Cc: tiwai@suse.de,
	perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/ca0132: Enable hardware band EQ for Sound Blaster Core3D
In-Reply-To: <20250603125304.507-1-lucy.thrun@digital-rabbithole.de>
References: <20250603125304.507-1-lucy.thrun@digital-rabbithole.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 202371F38D
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 

On Tue, 03 Jun 2025 14:53:04 +0200,
Lucy Thrun wrote:
> 
> This patch enables the Hardware DSP-based 10-band hardware equalizer on
> Sound Blaster Core3D (CA0132) based cards for example the soundblaster z and soundblaster x-ae5,
> allowing fine-grained audio tuning via hardware registers.
> 
> Tested on Sound Blaster X-AE5. No regressions observed.
> 
> Signed-off-by: Lucy Thrun <lucy.thrun@digital-rabbithole.de>

As it's a bit risky change, I merged now to for-next branch for 6.16.


thanks,

Takashi
