Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589586;
	b=ZlUsnpig70BrvbFL1kSfwKhp4Sgik7QhAfAjeGW1EOpUsi/61GWqVX9W0Benpca6ZWil
	 0zkjEmDjh4P3oxhRUa6baUYxdqRc1lGZBcequw5J83XI06WGDjl2iqzEVL2PM3XjJ0upv
	 vnBL8LvpTWtxunrpoaPPntBruzO8SpR7J8StrICUEY4BUORGvZQyApmg1cF8fF/yteF4c
	 7wtsLeCTE4lwrl7dVmN9rE7Zkt2yR3XG9O30o3hOsl8zVoahmX7ZuacbIZxHaRMAofliV
	 dxv08u4+gVAGdsUZU60+PcG0yGS4glaNgUTQrTWhNXsFUyKDyy1U0/Y/zCQiQOAGL6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589586;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=yAEyUZPW0axDGdgt8ckfx568lDtVprerPBNWmCaPnjs=;
	b=MvjgSFs2TysEWbrlibaHNXHa9H26uRWTrYMv5zhjTFVHtgjfhywufyVXFhxGoKOk7nUr
	 xOvPylkx2CEeBATn9sM+VDdDJ7Xd4ievgQ8xILrlbV6F8v9b6W2DjIn/LWSYSGRNvBoh2
	 m1BFYx/KdD3rtNDF8c7QBIrxXy+rF/u7XgU8vQHoZ7xoVRR7CQXaTWlq1KvRQGvx9MlnK
	 9LJCBQfxajUsR+w2ga/niGIKGs2/ZpfKUC/MHhjPEvTg8PRx91QRvoSFG+i+yRxFCAYgI
	 q3gmdHH86w8tyR2FBjOw8mc9EfQS3hc4OS0abTnNMA4TCPw52oJOO1H/SStRbm2NPaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Hs0ELGaT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PER+JzZV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bAa4LEuh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cli3Smul;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A918606A31E;
	Wed, 25 Nov 2026 06:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A918606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Hs0ELGaT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PER+JzZV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bAa4LEuh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cli3Smul
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EC7AA22306;
	Wed, 25 Nov 2026 06:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795589584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yAEyUZPW0axDGdgt8ckfx568lDtVprerPBNWmCaPnjs=;
	b=Hs0ELGaTy6Nsrj+Nc4C8PcfFLpmbtD3NcUhKQzAjslBHBRwQAiaFCWzZh3j9sCYsxUc8On
	xTH/OpArcJrTPJYqlyqvOKy2Rg8b/ZMHLyqC8WsM4uw4G1MNVGwXQx8tDKONnyNxr9kj3C
	y95btzuJauINUk+CYE+xKg6ihS6uMCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795589584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yAEyUZPW0axDGdgt8ckfx568lDtVprerPBNWmCaPnjs=;
	b=PER+JzZVfW5Ts19xnhPYhtuOOr9zRngFgNDlHuy8NRKEHJauYqIu5Z86bcqqrj33tYdnay
	hwKMjRDDbCjC6LCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bAa4LEuh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cli3Smul
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795589582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yAEyUZPW0axDGdgt8ckfx568lDtVprerPBNWmCaPnjs=;
	b=bAa4LEuhTeOkXZeVb+7pk70Bw2MQpNOa2RYOo45DAXl8WGwp+F6yG+quG+0JwqwWtWY9TQ
	JTYrOL/s9xrtbDN4VFS8qtmXhjH+f1zqGEAT0TXm5jRVIJwnfICxv2PI9M0Q31D9QD/dud
	w2CQS5yLMNM6R6tkPpqg/rAgT0Ong2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795589582;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yAEyUZPW0axDGdgt8ckfx568lDtVprerPBNWmCaPnjs=;
	b=cli3Smulkq/c+Ye5RBTWquYPLK30DTPnfFiPFtyaTaUD+0rBO8B6ko50WjIpKCz2D6Bj4o
	Bd6BtrPZlGZEkQDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1576134CA;
	Wed, 25 Nov 2026 06:53:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OAofHs6FBmugCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 06:53:02 +0000
Date: Wed, 25 Nov 2026 07:53:02 +0100
Message-ID: <87v75l8ks1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: hello@dennis.gg
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add generic implicit feedback quirk for Elgato Wave:3
In-Reply-To: <20261124-b4-implicit-fb-v1-1-99c0526a01f0@dennis.gg>
References: <20261124-b4-implicit-fb-v1-1-99c0526a01f0@dennis.gg>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: EC7AA22306
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,dennis.gg:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Tue, 24 Nov 2026 22:20:43 +0100,
Dennis Rijsdijk via B4 Relay wrote:
> 
> From: Dennis Rijsdijk <hello@dennis.gg>
> 
> The Elgato Wave:3 (0fd9:0070) records digital silence from its
> microphone when capture is started while playback to its headphone
> jack is already running. Starting capture first works. With PipeWire
> this makes the microphone go silent when an application starts
> recording while audio is playing.
> 
> The Elgato XLR Dock had the same problem and was fixed by enforcing the
> generic implicit feedback mode. The same flag fixes the Wave:3: with it,
> capture returns audio in both start orders. One case remains at 96 kHz,
> which the device advertises but Elgato's specifications do not list
> (only 48 kHz): when playback starts first right after the device ran at
> 48 kHz, capture is still occasionally silent (2 of 10 tries, against
> every try without the flag). At a steady rate, and at 48 kHz in all
> cases tried, it did not happen.
> 
> Add a quirk entry for the device.
> 
> The patch and this description were prepared with an AI coding
> assistant (Claude Code, Claude Opus 5.5); I reproduced the problem and
> tested the fix on the device.
> 
> Link: https://lore.kernel.org/all/CAOUQ8cqoTYm-0xeh1jk6bPo7Qd81+rFBz+my-ByMudzZ_6E0wQ@mail.gmail.com/
> Signed-off-by: Dennis Rijsdijk <hello@dennis.gg>

Applied now.  Thanks.


Takashi
