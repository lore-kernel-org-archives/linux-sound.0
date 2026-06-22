Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E471B3947AC
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 08:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118607; cv=none; b=daRK3YYwEEB8cZVqYX4QWw0HCZ15pGfzcqJzGFfhFl4vvF8cdMTRWkv7GWZ5ghtkcwWB57H8Crg7drcRJmnc7vGeZ7Yh9NrYPf40kax3QVaHfRxu3VZXPJZrC5xgn4G8LkGopen3GRh1DM9rLf9ke9C1mVVgQQMKeVnn1DwpVhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118607; c=relaxed/simple;
	bh=oP08ua8wtLlLy9yvTfOc7NcfExVDC7phOcpI0zTOrfI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jtD1FY1QMabVMxf/4JqjgzSbJ6FkEaWCAjdOpZSCN6bEqBWdbG9+bHpWAXsY2fdIZWSavRBO4d67SEmdhFcknh0M1F3gUenotVIRHZp6YmUKf0k8aRaSWQfi8ZEWczrrRbYG9I68KqSBnqdtYbAZq2EliHCymc0ERfaSWTU3M0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fX/k9Gyx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CHeEMFOQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fX/k9Gyx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CHeEMFOQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fX/k9Gyx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CHeEMFOQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fX/k9Gyx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CHeEMFOQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A7539759B3;
	Mon, 22 Jun 2026 08:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782118596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+sVj4H6A9SurVqyI0ArkRDJnAi9VTHTK/hWdggTimTw=;
	b=fX/k9GyxwO88llC74Ta9qG+h4gI+1UM3jNtF2FG1TJvyxOag2MiRdIA+XOs9eEvRf43FjP
	TLoSGx75k8EnZhQBRIsdagQCFRiBkueuFrq8XYt4aq1+oqDBa566mOkfZikdL6qC0PH5CZ
	wtofXHiLrzFV8Y9U6i+mfMAgAffJPdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782118596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+sVj4H6A9SurVqyI0ArkRDJnAi9VTHTK/hWdggTimTw=;
	b=CHeEMFOQzDqST0MkSjrokg7z6CWmK48rXC//ZrRv2Z8SuOODcluQBzKVLb+Sh8xH7due1D
	U1B7iiUAfe5ug+AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782118596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+sVj4H6A9SurVqyI0ArkRDJnAi9VTHTK/hWdggTimTw=;
	b=fX/k9GyxwO88llC74Ta9qG+h4gI+1UM3jNtF2FG1TJvyxOag2MiRdIA+XOs9eEvRf43FjP
	TLoSGx75k8EnZhQBRIsdagQCFRiBkueuFrq8XYt4aq1+oqDBa566mOkfZikdL6qC0PH5CZ
	wtofXHiLrzFV8Y9U6i+mfMAgAffJPdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782118596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+sVj4H6A9SurVqyI0ArkRDJnAi9VTHTK/hWdggTimTw=;
	b=CHeEMFOQzDqST0MkSjrokg7z6CWmK48rXC//ZrRv2Z8SuOODcluQBzKVLb+Sh8xH7due1D
	U1B7iiUAfe5ug+AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D126779A8;
	Mon, 22 Jun 2026 08:56:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FgdeHcT4OGomFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jun 2026 08:56:36 +0000
Date: Mon, 22 Jun 2026 10:56:36 +0200
Message-ID: <87jyrrdkcb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chris Aherin <chrisaherin@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga 7 16IAP7
In-Reply-To: <20260622001210.20553-1-chrisaherin@gmail.com>
References: <20260622001210.20553-1-chrisaherin@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Mon, 22 Jun 2026 02:12:10 +0200,
Chris Aherin wrote:
> 
> The Yoga 7 16IAP7 (board LNVNB161216, codec SSID 17aa:386a) has pin
> complex 0x17 (bass speakers) wrongly reported as unconnected, causing
> only one of four speaker pins (0x14) to be configured and resulting in
> mono/tinny audio.
> 
> SOF corrupts the PCI subsystem ID to 17aa:0000, preventing SND_PCI_QUIRK
> from matching. HDA_CODEC_QUIRK is used instead, which matches against
> codec->core.subsystem_id read directly from the HDA codec register and
> unaffected by the SOF bug.
> 
> Applies ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN, the same fixup used for
> the Yoga 7 14IAL7, which corrects pin 0x17's default configuration and
> enables both speaker pairs.
> 
> Signed-off-by: Chris Aherin <chrisaherin@gmail.com>

Applied now.  Thanks.


Takashi
