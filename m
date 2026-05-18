Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B447371CE9
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111847; cv=none; b=khjScULwxTAgHyVa60d37vU2xehVpNwJfeG/daLhDIohF4avH5gwBFJp/kwk/na/G2ELhivSSv7DJiJKHyTBbti0ZAvi8OWiomLmVxBaBDYjdpweYdCazgZcdwfSpSmRQLsKEHZdpgKHaHuMHbplpeUETVTm5wf/1cxISw4Gi34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111847; c=relaxed/simple;
	bh=lisFD8tNpnFQQzbgfBvNft6crD3KBxdKIHzPrVzDzUI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jma5+yL3KaiiItwUmnPzA3Ayvnj7gT+btSFZ4MxlJAvsKmMgiaZm1GI/FxpF05fosuengp/qr9Pq9paSajV+TwAWXR3lwTsLbCVsgbnWsIrS2mHF9gqgJd6Mn9zO+MAqlUS2o8S7X/ArgDV/uYe6pVZ2VXcnZaGEsPSwfawslcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xc7XQiVr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a3XOAZTj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xc7XQiVr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a3XOAZTj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xc7XQiVr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a3XOAZTj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xc7XQiVr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a3XOAZTj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6B65D63E72;
	Mon, 18 May 2026 13:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779111844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kbrL1tfHyq4Q9AP5yfmg1aFz2ZDhQS+A5oqlJlOHe8g=;
	b=xc7XQiVrMRJgZzWOT4j/rY+Pny5ojYA4W/fB0cOw201Vv3ax1dyiZ8qXrmcTdUOwbmGWbT
	835ZN2/fXLKbiulWU3Bwjcy0nm2S5uB2GmOpXPKQr96+iT9EUbFABS4z+WQ7o/2W379U+R
	6JIgoZhxr4BAndWDjVJixct094VuESE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779111844;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kbrL1tfHyq4Q9AP5yfmg1aFz2ZDhQS+A5oqlJlOHe8g=;
	b=a3XOAZTjqVKYrg1egnXfJxZW6U4Njp1j9CROWf+CchRp8UH/mUHA5ZF+vqp1c6Nr+fUxUX
	6IJ2uZ6YxrByv9Cg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xc7XQiVr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=a3XOAZTj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779111844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kbrL1tfHyq4Q9AP5yfmg1aFz2ZDhQS+A5oqlJlOHe8g=;
	b=xc7XQiVrMRJgZzWOT4j/rY+Pny5ojYA4W/fB0cOw201Vv3ax1dyiZ8qXrmcTdUOwbmGWbT
	835ZN2/fXLKbiulWU3Bwjcy0nm2S5uB2GmOpXPKQr96+iT9EUbFABS4z+WQ7o/2W379U+R
	6JIgoZhxr4BAndWDjVJixct094VuESE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779111844;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kbrL1tfHyq4Q9AP5yfmg1aFz2ZDhQS+A5oqlJlOHe8g=;
	b=a3XOAZTjqVKYrg1egnXfJxZW6U4Njp1j9CROWf+CchRp8UH/mUHA5ZF+vqp1c6Nr+fUxUX
	6IJ2uZ6YxrByv9Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 055BC593A8;
	Mon, 18 May 2026 13:44:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Bj6mAKQXC2oJXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 18 May 2026 13:44:04 +0000
Date: Mon, 18 May 2026 15:43:55 +0200
Message-ID: <87se7o4yuc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ctxfi: Keep line/mic notification controls per mixer
In-Reply-To: <20260517-alsa-ctxfi-mixer-kctls-v1-1-6e4f81f6b658@gmail.com>
References: <20260517-alsa-ctxfi-mixer-kctls-v1-1-6e4f81f6b658@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 6B65D63E72
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 18 May 2026 04:33:49 +0200,
Cássio Gabriel wrote:
> 
> ctxfi stores the Line Capture Switch and Mic Capture Switch controls in
> a file-scope kctls[] array so do_line_mic_switch() can notify the
> opposite control when the shared line/mic input selection changes.
> 
> That storage is shared by all ctxfi cards. If more than one X-Fi card is
> present, a later card can overwrite the pointers saved by an earlier one.
> A control update on one card can then use another card's kcontrol object
> for snd_ctl_notify(). If that other card is removed, the saved pointer can
> also become stale.
> 
> Store those notification targets in struct ct_mixer instead. The mixer is
> per-card state and matches the lifetime of the controls created for that
> card.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied now.  Thanks.


Takashi
