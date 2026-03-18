Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A382368977
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 07:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818480; cv=none; b=D3BBPXOJnCm+YLjjn+vKI3eGixzlNQ6pQcf1l0BVuPfLYSgilYVAGkdeWIO1fiN5nsXn0ofeqlQ7sSTK8Kt1+uY71BBhZYAdH/rVAue4bxm8cgVPY9SFLPH5Tb+a4eqKdErVpOsjy1m9/Y06SlPM9GP3ZlRpcpNlm0ozm21HnLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818480; c=relaxed/simple;
	bh=h7vTZgrYwSGJaOZAsFdjgCPnalEbpzzG1QWv06hdsJ4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mnpr0E0yYyMQZRW+Pu6CahYasHZPo9+5aIhLRGUXoZ/dilXqyCLK9ueryhb1RHaNPe23d94pqnC2Kg9ECyh9f9CN066wJUWKmC8j+FYWqCuCSG+/N7HM2KUObSGwSA1FGXbCywsHDbDWS2bbVMM9tA2d6mH2QyqfSzYo76CUE5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OPHKMqyl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Qc6+E89r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OPHKMqyl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Qc6+E89r; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OPHKMqyl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qc6+E89r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OPHKMqyl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qc6+E89r"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 86ABC4D3D3;
	Wed, 18 Mar 2026 07:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773818477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zne4QIvpr//0EV2xCmjDgBY/715HbR6ox3iuJCyYtKA=;
	b=OPHKMqylD2hgNEYeocMGh78U4euQlLDdnps7sFgfy8Z4ZaX8k/P834vTal0bHT3Q3CN7/y
	a2tAY/mdjo5YmTub2V/X/UDg/CFJjcIwQa/hS0SoPJQGUD0G5wS2mCzS5s5sul+fbFBz4k
	oKANCSfiO+uScPrRjS18XolHcYR2C3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773818477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zne4QIvpr//0EV2xCmjDgBY/715HbR6ox3iuJCyYtKA=;
	b=Qc6+E89rYRL96ML9sFdrg9SEW0VnBGTXfoINCovDLZQ7y4CbcJtgSKqbNGpJQyJU2/xUVF
	8BCLIA4OCyfp0zDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OPHKMqyl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Qc6+E89r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773818477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zne4QIvpr//0EV2xCmjDgBY/715HbR6ox3iuJCyYtKA=;
	b=OPHKMqylD2hgNEYeocMGh78U4euQlLDdnps7sFgfy8Z4ZaX8k/P834vTal0bHT3Q3CN7/y
	a2tAY/mdjo5YmTub2V/X/UDg/CFJjcIwQa/hS0SoPJQGUD0G5wS2mCzS5s5sul+fbFBz4k
	oKANCSfiO+uScPrRjS18XolHcYR2C3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773818477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zne4QIvpr//0EV2xCmjDgBY/715HbR6ox3iuJCyYtKA=;
	b=Qc6+E89rYRL96ML9sFdrg9SEW0VnBGTXfoINCovDLZQ7y4CbcJtgSKqbNGpJQyJU2/xUVF
	8BCLIA4OCyfp0zDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61D184273B;
	Wed, 18 Mar 2026 07:21:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lWlGFm1Summ4KAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Mar 2026 07:21:17 +0000
Date: Wed, 18 Mar 2026 08:21:16 +0100
Message-ID: <871phheh77.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Exclude Scarlett 2i2 1st Gen from SKIP_IFACE_SETUP
In-Reply-To: <abmsTjKmQMKbhYtK@m.b4.vu>
References: <abmsTjKmQMKbhYtK@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 86ABC4D3D3
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Tue, 17 Mar 2026 20:32:30 +0100,
Geoffrey D. Bennett wrote:
> 
> The Focusrite Scarlett 2i2 1st Gen (1235:8006) produces
> distorted/silent audio when QUIRK_FLAG_SKIP_IFACE_SETUP is active, as
> that flag causes the feedback format to be detected as 17.15 instead
> of 16.16.
> 
> Add a DEVICE_FLG entry for this device before the Focusrite VENDOR_FLG
> entry so that it gets no quirk flags, overriding the vendor-wide
> SKIP_IFACE_SETUP. This device doesn't have the internal mixer, Air, or
> Safe modes that the quirk was designed to protect.
> 
> Fixes: 38c322068a26 ("ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP")
> Reported-by: pairomaniac [https://github.com/geoffreybennett/linux-fcp/issues/54]
> Tested-by: pairomaniac [https://github.com/geoffreybennett/linux-fcp/issues/54]
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>

Applied now.  Thanks.


Takashi
