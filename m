Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EECC35E929
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054580; cv=none; b=UlZ+CcBPSGblFKTZwsCseiF6mwBGqaTzrNfdCZILPEhkZ6BYFA1NEIDqp2ZJfogRgmGAa5IY5QgLU60I/VV2rCshriMa5Ujt5QU/qwpOLm8bXCrXcXVwBentq0UwnMta7gurFlCRJENUd8EDPxUoXsovY2O6+bd5vKOPQQV94IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054580; c=relaxed/simple;
	bh=xdgzzxNjoMKsjx2f71T9WWE4AHaQzac3vy9sjoI1TV4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TJxLWTx6iRe9mDszXA9qJv1jyK7AdYVq2VBMxkKB44CVkU6ccPaA7iJ/pMj1A167Pv2VEUmxwoqZghqlVbVz3NHRCegO8htrsTWHEVjLUdF05BNUl71jxSNsYJXXJucIY7Z6fxzmh+YIpn0yaLBF6eIfIfhj9sFZL0SMUf1Tg3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mx6ZwB32; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L9oZYij8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mx6ZwB32; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L9oZYij8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mx6ZwB32";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L9oZYij8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mx6ZwB32";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L9oZYij8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0A0386B024;
	Wed,  6 May 2026 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778054577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T283Try20+TmT8/+SiXcXw3umF7jE8AXSWGr6aJaUDo=;
	b=mx6ZwB32yTJrxLx2hq3Ng1HVlL2DHGdg+CBmNMzMlog35Ma7wK4z8Z1wQQLGEgN3wFZiza
	xq9jKiX6IikmBloGlIUqe17xaoPVw+v1gioBSIGkAllJaFDWiNQqNe11dljQYaaHdux5Q+
	QlGLEL5nE3qM1B+VU/cuInQXuSv9spc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778054577;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T283Try20+TmT8/+SiXcXw3umF7jE8AXSWGr6aJaUDo=;
	b=L9oZYij8VFY3vVy1zzhM/d8vyjU6CLq5ZLzFQJvtiwQoFBSHfjVEABgaY8zmp67GBwA6im
	lpK5bp67epwNpABA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mx6ZwB32;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=L9oZYij8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778054577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T283Try20+TmT8/+SiXcXw3umF7jE8AXSWGr6aJaUDo=;
	b=mx6ZwB32yTJrxLx2hq3Ng1HVlL2DHGdg+CBmNMzMlog35Ma7wK4z8Z1wQQLGEgN3wFZiza
	xq9jKiX6IikmBloGlIUqe17xaoPVw+v1gioBSIGkAllJaFDWiNQqNe11dljQYaaHdux5Q+
	QlGLEL5nE3qM1B+VU/cuInQXuSv9spc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778054577;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T283Try20+TmT8/+SiXcXw3umF7jE8AXSWGr6aJaUDo=;
	b=L9oZYij8VFY3vVy1zzhM/d8vyjU6CLq5ZLzFQJvtiwQoFBSHfjVEABgaY8zmp67GBwA6im
	lpK5bp67epwNpABA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CCDAB593A3;
	Wed,  6 May 2026 08:02:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BzfJMLD1+ml9KAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 May 2026 08:02:56 +0000
Date: Wed, 06 May 2026 10:02:56 +0200
Message-ID: <875x51t173.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rodrigo Faria <rodrigofilipefaria@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda/realtek: Add mute LED fixup for HP Pavilion 15-cs1xxx
In-Reply-To: <20260505185518.23625-1-rodrigofilipefaria@gmail.com>
References: <20260505185518.23625-1-rodrigofilipefaria@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0A0386B024
X-Spam-Level: 

On Tue, 05 May 2026 20:55:18 +0200,
Rodrigo Faria wrote:
> 
> Add a new fixup for the mute LED on the HP Pavilion 15-cs1xxx series
> using the VREF on NID 0x1b.
> 
> The BIOS on these models (tested up to F.32) incorrectly reports
> the mute LED on NID 0x18 via DMI OEM strings, which lacks VREF
> capabilities. This fixup overrides the LED pin to the correct
> NID 0x1b.
> 
> Signed-off-by: Rodrigo Faria <rodrigofilipefaria@gmail.com>

Applied now.  Thanks.


Takashi
