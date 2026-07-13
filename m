Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD9037A84A
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 10:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783937046; cv=none; b=buRpL0XhnvPVeK4w2Dm5U8+plIowXqi/r7a+vbd8tsZTsf0UeM4V4VRXGd/xsmr2uQC8mGtBtO+22Aj42/awNBCYaMqlf+J+7X+zILOTpsD6RAn1/dXbkZhPiVSlzPJPON6g/f2ivYe4yvs4N4gs9Xt2UJ3fwA1LcPbiBJSF/Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783937046; c=relaxed/simple;
	bh=nsiQDWw6qn2cuG/a6803zAkmFU1CfUHwA5zMmWbzxLo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dYBFZMiEq2x21IdU6fZv9j8HcFD/GgTThsD70vFqsuiBE3M4JliVnMG+pQ7xK2SjkQjxNIm7gwjlfHRhguM9t6V1HvEx5ZxwGDjzWogm4Ae/yX4vHgbcYOlJPQXtCpxsaKWs3sQCLOkxH6DdDpJYMCxrUTQbo4pf1ger8+eZcbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wTq2f56J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YVVIMg6l; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wTq2f56J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YVVIMg6l; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wTq2f56J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YVVIMg6l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wTq2f56J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YVVIMg6l"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C2CC577417;
	Mon, 13 Jul 2026 10:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783937042; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YlYC51kvenfR0M5hJrJKQZ3iYgJHAlfL/Vwq/8hYEUw=;
	b=wTq2f56J4uJlWutAAOuhPZ48fNHNGHYjiKfv5oaGKQ92Wi5J/FWEk/xHNVlLkNQM9YmeGs
	DUXAAdxdKLlucSAWURBUwSn9eKictJC4HX5LJFeJmOkQtq8zyCIdqXW7q4e63KmMAY/iwG
	V28cytlIW1UPglTR2VFCon9mldpDjyo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783937042;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YlYC51kvenfR0M5hJrJKQZ3iYgJHAlfL/Vwq/8hYEUw=;
	b=YVVIMg6l309toGyUko7UaN1ov5j0mNZlprOX6UmoPZ+ghM7a4f1W0KTDvtA7sLCM8UTaI2
	6qabqgG94Mjw4hBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wTq2f56J;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YVVIMg6l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783937042; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YlYC51kvenfR0M5hJrJKQZ3iYgJHAlfL/Vwq/8hYEUw=;
	b=wTq2f56J4uJlWutAAOuhPZ48fNHNGHYjiKfv5oaGKQ92Wi5J/FWEk/xHNVlLkNQM9YmeGs
	DUXAAdxdKLlucSAWURBUwSn9eKictJC4HX5LJFeJmOkQtq8zyCIdqXW7q4e63KmMAY/iwG
	V28cytlIW1UPglTR2VFCon9mldpDjyo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783937042;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YlYC51kvenfR0M5hJrJKQZ3iYgJHAlfL/Vwq/8hYEUw=;
	b=YVVIMg6l309toGyUko7UaN1ov5j0mNZlprOX6UmoPZ+ghM7a4f1W0KTDvtA7sLCM8UTaI2
	6qabqgG94Mjw4hBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91203779AE;
	Mon, 13 Jul 2026 10:04:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LbcSIhK4VGoQHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Jul 2026 10:04:02 +0000
Date: Mon, 13 Jul 2026 12:04:02 +0200
Message-ID: <87v7ajyzn1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda: cs35l56: Fail if wmfw file is missing
In-Reply-To: <20260709161211.686498-1-rf@opensource.cirrus.com>
References: <20260709161211.686498-1-rf@opensource.cirrus.com>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C2CC577417
X-Spam-Score: -3.51

On Thu, 09 Jul 2026 18:12:06 +0200,
Richard Fitzgerald wrote:
> 
> Fail cs35l56_hda_fw_load() and log an error if it didn't find a wmfw file
> and the BIOS didn't patch the firmware already. Also remove a section of
> code from cs35l56_hda_request_firmware_files() that attempted to find a
> .bin if a .wmfw was not found.
> 
> The CS35L56 ROM can only provide default audio in SoundWire mode. A wmfw
> is needed to enable I2S audio. Also none of the customer-specific .bin
> files are compatible with the ROM firmware. So a .wmfw file is always
> required.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Applied now.  Thanks.


Takashi
