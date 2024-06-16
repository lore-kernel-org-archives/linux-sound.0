Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1822119066A
	for <linux-sound@vger.kernel.org>; Sun, 16 Jun 2024 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718539490; cv=none; b=TianN5mYKjIFtTZCZ+2/rNENptjN9feGLkT1JP/P0ABvmmVjwOHW0oaz7NK/VOFNxCxegZhT/xd/tBeW7cvGgM/qLY4Ha7JNQbvR8udFaVIrn0Lp3lny7cLpMOo56dTsSKsTFqMEpOzHVptz+5ZArMZLFBGbFq614doCenraM90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718539490; c=relaxed/simple;
	bh=brVuMLtaDl3FnmcY6A8XtouW5SuXS09eNdXuo3HHiYw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TTsulmI3a0hw5zqIoEqmP+8h94S4J1kfJCWCIMXaK4WMxABcR2anY6PxJ3vFfl7+yJ8b/3/fEj5NqqvpYeBmxSURc+UNbv6iIinhVkpBoe9LAGft+2ck/CVwNNNy0FvrGCkE0CRfWB9XE3xzKMqQANOeGh4dmOIaAvUFo3I1Zlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G4+mIgix; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lY+myNvg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G4+mIgix; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lY+myNvg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G4+mIgix";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lY+myNvg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G4+mIgix";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lY+myNvg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 094D5353B4;
	Sun, 16 Jun 2024 12:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718539486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XyqF7jdaz/yB+twFEBxfLYZqkHufkhPrXH9cWco4nUc=;
	b=G4+mIgixagMPlZeOfzuuBYQnSO1DOq7hqHekvmKYgz8WFkE4x5iM2kKgeMm3++gauBCwXA
	8c6LBLFzQnHoSZ7zJB/X6B+e9S1izvG0pFCetE0itVw+m4eeP+4Ixla4O4NYwJZcyG6WJv
	e1AtYRg6FJwvaR3s1Kmh5aWoVe0XcIM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718539486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XyqF7jdaz/yB+twFEBxfLYZqkHufkhPrXH9cWco4nUc=;
	b=lY+myNvgGuWA/YBP5KPbhUgoCiMq2C2oWP9fDaSPmzvSIGX+/jGEj/nLCH1bH/8fknTTaq
	/AEhig0DHxup+bBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=G4+mIgix;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lY+myNvg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718539486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XyqF7jdaz/yB+twFEBxfLYZqkHufkhPrXH9cWco4nUc=;
	b=G4+mIgixagMPlZeOfzuuBYQnSO1DOq7hqHekvmKYgz8WFkE4x5iM2kKgeMm3++gauBCwXA
	8c6LBLFzQnHoSZ7zJB/X6B+e9S1izvG0pFCetE0itVw+m4eeP+4Ixla4O4NYwJZcyG6WJv
	e1AtYRg6FJwvaR3s1Kmh5aWoVe0XcIM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718539486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XyqF7jdaz/yB+twFEBxfLYZqkHufkhPrXH9cWco4nUc=;
	b=lY+myNvgGuWA/YBP5KPbhUgoCiMq2C2oWP9fDaSPmzvSIGX+/jGEj/nLCH1bH/8fknTTaq
	/AEhig0DHxup+bBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDDA613AB9;
	Sun, 16 Jun 2024 12:04:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DbFzMN3UbmbPRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 16 Jun 2024 12:04:45 +0000
Date: Sun, 16 Jun 2024 14:05:11 +0200
Message-ID: <8734pd5c08.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergely Meszaros <meszaros.gergely97@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Gergo Koteles <soyer@irl.hu>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ARP8
In-Reply-To: <20240616085233.16922-1-meszaros.gergely97@gmail.com>
References: <20240616085233.16922-1-meszaros.gergely97@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.91 / 50.00];
	BAYES_HAM(-2.90)[99.57%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	URIBL_BLOCKED(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 094D5353B4
X-Spam-Flag: NO
X-Spam-Score: -1.91
X-Spam-Level: 

On Sun, 16 Jun 2024 10:52:33 +0200,
Gergely Meszaros wrote:
> 
> Similarly to other Lenovo laptops these also have a dual speaker
> setup with a shared amplifier.
> The model also seems to have a conflicting PCI SSID with the codec SSID for
> the Legion Y9000X 2022 IAH7. Only tested on the Yoga Pro 7, as I don't have
> access to the other laptop.
> 
> Signed-off-by: Gergely Meszaros <meszaros.gergely97@gmail.com>
> ---
> V1 -> V2: Use existing ALC285_FIXUP_SPEAKER2_TO_DAC1 instead of ALC287_FIXUP_YOGA_PRO_7_14ARP8_BOTH_SPK_TO_DAC2.
>           Include legion IAH7 in fixup and function name.
> 
> Resend with git-send-email, to not mangle line-breaks.

Thanks, applied now.


Takashi
