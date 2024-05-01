Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3A84D9FD
	for <linux-sound@vger.kernel.org>; Wed,  1 May 2024 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714550194; cv=none; b=D4rupKaAQY25dsw9BzQZ3aubQ4bVzz/YmypD9s39ukSrKdeYPiyEPoVH9FM6hjUoAVvfWg7YQ3lOI7DSr0owt6tfT5DhzJLzQwMY/KTjIyW9KP1nuMR1o03nhpy3hvMK0MC9BLfq8Nle0ljCwDx4m3bR4Ybhz3r7cVQau7KjzMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714550194; c=relaxed/simple;
	bh=gwdIyEa5KnTIH9TjCdQLW1RthD6r6amy2at0A9QHilY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kKFOoMQKU4iV7gWOXXVpmLcUV1Qby0uYlng5oaTjgGcXDDZKQpOYcBM6xz98cM/eT4V3z2JTSHBeGJ8krXFpzxIVdlLJVPWIk/Y9WvyckpylJBrwxl6XKibtHzEAJr2xfpGsiHDFiMDnxE2/VwjwB4oUhkD8MwF8kJ2QFBAyr1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ao7lYAn1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N/zem7HC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ao7lYAn1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N/zem7HC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ao7lYAn1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N/zem7HC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ao7lYAn1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N/zem7HC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 384851F83F;
	Wed,  1 May 2024 07:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714550191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LbShhzRvkENSkAajAqPQX9B40UecySTKTXDv62B0uN8=;
	b=Ao7lYAn10PD+5FWN0jRiSPTtVBxL/ky3byfP5NL/poVBLSVp4FXesnvF67ifuKwFWsdaKD
	sZLwRAD09wb/QEpQmy1IxLibpuaaiwscptV3dTDmjId7LfJ/3VmIkPeXScNzY+HrWn01cK
	fvib3Hz1xo27rK1v4rJ08LV6zIQf2rA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714550191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LbShhzRvkENSkAajAqPQX9B40UecySTKTXDv62B0uN8=;
	b=N/zem7HCRmliPV3qv0CSc5qlI/2iAU1B5jORt8yTJHIm8irdfhv44+syE9KXtJyDECmabu
	yz1x6X+7P93z+0Cg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ao7lYAn1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="N/zem7HC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714550191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LbShhzRvkENSkAajAqPQX9B40UecySTKTXDv62B0uN8=;
	b=Ao7lYAn10PD+5FWN0jRiSPTtVBxL/ky3byfP5NL/poVBLSVp4FXesnvF67ifuKwFWsdaKD
	sZLwRAD09wb/QEpQmy1IxLibpuaaiwscptV3dTDmjId7LfJ/3VmIkPeXScNzY+HrWn01cK
	fvib3Hz1xo27rK1v4rJ08LV6zIQf2rA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714550191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LbShhzRvkENSkAajAqPQX9B40UecySTKTXDv62B0uN8=;
	b=N/zem7HCRmliPV3qv0CSc5qlI/2iAU1B5jORt8yTJHIm8irdfhv44+syE9KXtJyDECmabu
	yz1x6X+7P93z+0Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F287F13942;
	Wed,  1 May 2024 07:56:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HnsDOq71MWYyZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 May 2024 07:56:30 +0000
Date: Wed, 01 May 2024 09:56:43 +0200
Message-ID: <87le4ukls4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: alsa-devel@alsa-project.org,
	Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/1] ALSA: aoa: soundbus: i2sbus: pcm: use 'time_left' variable with wait_for_completion_timeout()
In-Reply-To: <20240430121028.30443-1-wsa+renesas@sang-engineering.com>
References: <20240430121028.30443-1-wsa+renesas@sang-engineering.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.84
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 384851F83F
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.84 / 50.00];
	BAYES_HAM(-2.83)[99.25%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]

On Tue, 30 Apr 2024 14:10:27 +0200,
Wolfram Sang wrote:
> 
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_completion_timeout() causing patterns like:
> 
> 	timeout = wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
> 
> Fix to the proper variable type 'unsigned long' while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied now to for-next branch.


Takashi
