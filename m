Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1976A3876B7
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 07:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781076385; cv=none; b=Bt8K6E52VrbsXVbzAYu43emNbp4DxUiTJAcaskmBObNx4R6i94SynERs5GIkJtK1pcU1JIuUP+IsNr/af5uu/6BWVKUDYvaz8zHIu1RJRa436ppEyBMrdsjI5YEGpS2jN4mwbR6+G5dupKxgM3eeYPMUJJVUXNieKixdchJDYhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781076385; c=relaxed/simple;
	bh=H+bg+E6P/tdk5FY4WpHj1bA3gH4mehb+F/ZGzU1E0SU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h3I2PrkgWZx+i24Skv0bk5k7ochxngLx96zOL0N7ipPq+W7k1tMqFbbFDGi2WsuZ1hlw/OrqP+liMBfgEcUnXiZ3wWMf6pUKO4e1dhNy2/tuOyxK28gVrDfP1sSsr2SOTUgt4RkwL6mncVrQTuK8Hzm+mfCbOQVfcgGUzaFR/L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f3shgDVp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E8K0VYWD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f3shgDVp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E8K0VYWD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f3shgDVp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E8K0VYWD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f3shgDVp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E8K0VYWD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 50B416AC65;
	Wed, 10 Jun 2026 07:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781076382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=42yBvqWz0T5buHPr3bPCo+C8AJ1Iktry46hKmaRY+h8=;
	b=f3shgDVpkiOCymCO/L39qzDNaPUYUxb1z0FAdG+GO3AmnNVlSIKV/5+D24Dn4VoT8k03eB
	TnnLxD/P613C2BlYDeNJagluF3jbhJJEmqBorCRWNIaYLI6NEO6EOjjzxRFp0fvp996whI
	ZzgyXfo7ZwJaFBkzQjxaNIQMFeuBsok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781076382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=42yBvqWz0T5buHPr3bPCo+C8AJ1Iktry46hKmaRY+h8=;
	b=E8K0VYWDlbs3e5HpvOzut1iODA+SMpaabY1xhlYLKwRK/FtxrVsDFpLWYoZDNXaNbSc+98
	taLgW8mO0tO8nABA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f3shgDVp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=E8K0VYWD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781076382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=42yBvqWz0T5buHPr3bPCo+C8AJ1Iktry46hKmaRY+h8=;
	b=f3shgDVpkiOCymCO/L39qzDNaPUYUxb1z0FAdG+GO3AmnNVlSIKV/5+D24Dn4VoT8k03eB
	TnnLxD/P613C2BlYDeNJagluF3jbhJJEmqBorCRWNIaYLI6NEO6EOjjzxRFp0fvp996whI
	ZzgyXfo7ZwJaFBkzQjxaNIQMFeuBsok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781076382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=42yBvqWz0T5buHPr3bPCo+C8AJ1Iktry46hKmaRY+h8=;
	b=E8K0VYWDlbs3e5HpvOzut1iODA+SMpaabY1xhlYLKwRK/FtxrVsDFpLWYoZDNXaNbSc+98
	taLgW8mO0tO8nABA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BDB2779A7;
	Wed, 10 Jun 2026 07:26:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IRNBCZ4RKWrtQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Jun 2026 07:26:22 +0000
Date: Wed, 10 Jun 2026 09:26:21 +0200
Message-ID: <87se6u6ele.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: furstblumier <seal@furst.blue>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz
Subject: Re: [PATCH RESEND] ALSA: hda/realtek: Add quirk for HP 255 15.6 inch G9 Notebook PC
In-Reply-To: <20260609201706.502075-1-seal@furst.blue>
References: <20260609201706.502075-1-seal@furst.blue>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 50B416AC65
X-Spam-Score: -3.51

On Tue, 09 Jun 2026 22:17:06 +0200,
furstblumier wrote:
> 
> The HP 255 15.6 inch G9 Notebook PC (PCI SSID 103c:8a1b) uses the
> ALC236 codec but lacks an entry in the quirk table, causing the kernel
> to fall back to a null SSID match (103c:0000) and skip the necessary
> fixup. Add a quirk entry using ALC236_FIXUP_HP_MUTE_LED_COEFBIT2,
> matching the HP 255 G8 which uses the same codec and fixup. This fixes
> the mute-button LED and fixes an issue with unplugging and replugging a
> headset jack not being recognized as an audio sink.
> 
> Signed-off-by: Furst Blumier <seal@furst.blue>

Applied to for-next branch now.  Thanks.


Takashi
