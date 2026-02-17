Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD5A32B9B4
	for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 12:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771331670; cv=none; b=srOwIHyheHdlIOIv14RLp5bA5w7A7S5vNSuTH2M//55PzF5D5nQnvTD+WETUIFtn43pieRzbVWulxyokH8L6kYuuZRBN0apaQcnjZhGx+2KILDvb40wj+mW3xnLWUCichrptrfTVW5YMxJ9YCpfh+SnFc7YCPUrrdYa5l2oLllU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771331670; c=relaxed/simple;
	bh=i0/r1ZXrTxzpSQyDRJyCej0k6Wn3W2q42XGTqpI+VH4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sc5yKSkcTtuB4vYsGfxjLPW67YOHaLVuKGltOPgh7wdwLRDCxxP0HQjy9gyZRUunuHWvV9Miz/AgccrmJ4OLVNsX6W7pyPvUAVBs03RPB1fktOWjHgm56cRjaWlfxSXKdsjY3NtiBigyRUfIynCThZwDG52/JHk+C2zfwTswSYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dCPkvp1m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=23R4MnMz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dCPkvp1m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=23R4MnMz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dCPkvp1m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="23R4MnMz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dCPkvp1m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="23R4MnMz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B00785BCFC;
	Tue, 17 Feb 2026 12:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771331667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gTGpuOWN75IH3kOLIKaCMG3LO4nTn/VZInPqqvqXpP4=;
	b=dCPkvp1mjluONheZf/QPBkNSR68XOTmFsDQQmDgzL1FMJW/qy0ATZYK99gLnB+sTSEWa7A
	5CflyqnMzvSTFHwQxbD8wyL5AowBmHEgavIYxnlsUvQ97UMIvPO3knLI2tuM/fgvf+GqDO
	9Mqxn+nIEWDNSJBmUoRuC+vTRUadshc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771331667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gTGpuOWN75IH3kOLIKaCMG3LO4nTn/VZInPqqvqXpP4=;
	b=23R4MnMzC/4FJpVuqMGgq/zJO+tTDABRR8oAr0/niGopUnheFZhlXMU9ewSNVEua0U+xOh
	54QTA4x4eZ9MNXBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dCPkvp1m;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=23R4MnMz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771331667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gTGpuOWN75IH3kOLIKaCMG3LO4nTn/VZInPqqvqXpP4=;
	b=dCPkvp1mjluONheZf/QPBkNSR68XOTmFsDQQmDgzL1FMJW/qy0ATZYK99gLnB+sTSEWa7A
	5CflyqnMzvSTFHwQxbD8wyL5AowBmHEgavIYxnlsUvQ97UMIvPO3knLI2tuM/fgvf+GqDO
	9Mqxn+nIEWDNSJBmUoRuC+vTRUadshc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771331667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gTGpuOWN75IH3kOLIKaCMG3LO4nTn/VZInPqqvqXpP4=;
	b=23R4MnMzC/4FJpVuqMGgq/zJO+tTDABRR8oAr0/niGopUnheFZhlXMU9ewSNVEua0U+xOh
	54QTA4x4eZ9MNXBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 806853EA65;
	Tue, 17 Feb 2026 12:34:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l3+8HlNglGlUegAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 17 Feb 2026 12:34:27 +0000
Date: Tue, 17 Feb 2026 13:34:23 +0100
Message-ID: <87pl63v99s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Erik Sanjaya <sirreidlos@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	chris.chiu@canonical.com
Subject: Re: [PATCH] ALSA: hda/realtek: Fix headset mic on ASUS Zenbook 14 UX3405MA
In-Reply-To: <20260217102112.20651-1-sirreidlos@gmail.com>
References: <20260217102112.20651-1-sirreidlos@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B00785BCFC
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Tue, 17 Feb 2026 11:21:12 +0100,
Erik Sanjaya wrote:
> 
> The ASUS Zenbook 14 UX3405MA uses an ALC294 codec with CS35L41
> amplifiers over SPI. The existing quirk for this model only configured
> the amplifiers, leaving the headset microphone on the combo jack
> non-functional.
> 
> Introduce a new fixup that configures pin 0x19 as headset mic input
> and chains to ALC245_FIXUP_CS35L41_SPI_2 to preserve speaker
> functionality.
> 
> Similar to the fix done for the UM3406HA in commit 018f659753fd
> ("ALSA: hda/realtek: Fix headset mic on ASUS Zenbook 14").
> 
> Signed-off-by: Erik Sanjaya <sirreidlos@gmail.com>

Applied now.  Thanks.


Takashi
