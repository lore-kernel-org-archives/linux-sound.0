Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF5138A70C
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126433; cv=none; b=D5/tbqDUqScL1pRHf5wzblmNBTrLBj9wP7950QOHsuEuQpmgmzJW7XmvJkhDRWDuf53pjUX35ZIsf6tIuT4QqjVW8SvjS5x9D6O4mBpgkAjPT3w0uBWsTRLtJs1SQJn/Upfs7ejBvIIY+q/fkHtPLy5m5qEWiLQfERh6XAZ6WQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126433; c=relaxed/simple;
	bh=mG7yGiYJExfcvid/6fIJecmJNO2bPPrIfNmnfWEszrI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p3cL1CmyBp9L76LbRVmyTVNayqMk5l4uxLKlRis6i9dcKQyxTzgAVCDnQfXuUCm7bVa2u2wcWC+ETE0bqWOf/8tADsTPxG6iBVUMlQGJdLcSJxPjQGFpS6MhY/PaoDcK8wyYrw1YlM8NQGPmpe5MRzZxr0R/I76QW7hDh1LdtZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uWbbFYEo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=53pi+Pvl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dOVwmHni; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F1bSQlml; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uWbbFYEo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="53pi+Pvl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dOVwmHni";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F1bSQlml"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B393E76501;
	Wed, 15 Jul 2026 14:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784126429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=djfNfy3Q0HSGJduLSoHVV8LopqoXednpiRXPavd9wb8=;
	b=uWbbFYEoJe1u7KSeHduexRFF9M+TtN5A5VGiuSqU5z0+kjjGS4CMcD0XRTMEAbrlPnckgy
	EptJiLt9SrY10z2JGb14eFth+DEyNosEzu+Qz2gJxEn8p8oDhu9w/xImBDTjnKzlTQo/Ny
	M2fhl+rP+uJLwDIAJtlr3MQAunAK83Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784126429;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=djfNfy3Q0HSGJduLSoHVV8LopqoXednpiRXPavd9wb8=;
	b=53pi+Pvl0CD8UvS3lYZRsmTYveINArnQ2tqdmwBeWNNlD5YSQLyaS5tAiJAg1Dye8spbs2
	vE+Vi76hxirImaBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dOVwmHni;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=F1bSQlml
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784126428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=djfNfy3Q0HSGJduLSoHVV8LopqoXednpiRXPavd9wb8=;
	b=dOVwmHniZ4w3spKDv9xn3zY/VNRY9kI71ubj79o5yBx9hjLrZWOlypX/RmUiqYOhyZN+uK
	peQu7acP9bDrIL/EhV7sHpwDUVbTRI40vgJhaApKSo2dJu+540g8CrsFycPjdUZOeReglw
	yvvChl0v8dmty6D60K4+k7AhzNUNI58=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784126428;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=djfNfy3Q0HSGJduLSoHVV8LopqoXednpiRXPavd9wb8=;
	b=F1bSQlmlvm8X4YMAr5gvIf9MmxrM8o//JzzfM105h19lARnelWSfkyHQNugtXkAFrkonS/
	HqZg+4qJOUZMLSCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78AE1779AD;
	Wed, 15 Jul 2026 14:40:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dhVeHNybV2pZXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Jul 2026 14:40:28 +0000
Date: Wed, 15 Jul 2026 16:40:28 +0200
Message-ID: <87o6g8wc2r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: cs35l41: validate and free ACPI mute object
In-Reply-To: <20260708113625.752913-1-lgs201920130244@gmail.com>
References: <20260708113625.752913-1-lgs201920130244@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B393E76501
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Wed, 08 Jul 2026 13:36:25 +0200,
Guangshuo Li wrote:
> 
> cs35l41_get_acpi_mute_state() evaluates a _DSM method to get the ACPI
> mute state and reads the first byte from the returned object.
> 
> However, the returned ACPI object is owned by the caller and is never
> freed after use, so each successful query leaks the _DSM result object.
> 
> The code also assumes that the returned object is a buffer with at least
> one byte. A malformed firmware response can return a different object
> type or an empty buffer, and the direct ret->buffer.pointer dereference
> can then access an invalid pointer.
> 
> Use the typed _DSM helper, validate that the returned buffer contains at
> least one byte, and free the ACPI object after reading it.
> 
> Fixes: 447106e92a0c ("ALSA: hda: cs35l41: Support mute notifications for CS35L41 HDA")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Applied now.  Thanks.


Takashi
