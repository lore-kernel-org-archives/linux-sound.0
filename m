Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3619D3914EB
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 15:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909736; cv=none; b=SBcbie9ANvJQvtzvIorHBK7T30PgRpyTdAXh2htny7MFgD3tfqWlBXjCYIgSsj3legyQPUHrHVhlh+uhlqoRsjiUKYsQUPVzDo1Qa1ROwqQ14Y+EfNP5dJ2xe77gc3t1TdGXw2c982mP6s4025xZ9EAo7ZS55+Fy+w3xOuXMmqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909736; c=relaxed/simple;
	bh=q2IIArR/2qeAxaSKkysgHBHIrIxkbBoA2+WLHnqKAZo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uoPloSyYMRmPL+IXb4JNuFZnhYk10guuwGMFdFDDIvUkBnb5kyXlXqD3z6QU4DVSCdDmEgb8bekZx6/l7gx5l9Nr2D0SlF8PGFzxtQplhR87s/7ZBBa8cpMKy990/J5uEoFbqbU8p0/JmVUrTz6hL3yS1PB0/frvbj6oYe38POU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=obGA3GiO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AWs0BU4t; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=obGA3GiO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AWs0BU4t; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="obGA3GiO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AWs0BU4t";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="obGA3GiO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AWs0BU4t"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7D2616B26D;
	Mon,  4 May 2026 15:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777909733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9VQB90Cq/vCFtqXEepfg0xyR4qrorBGAXYwxdl/PBOI=;
	b=obGA3GiOxdkQ6dcRaG5XvpnTKy8IXtlJ21Idq8n7hLtzFeasbV7SUti1x1MGQVpV3zEif2
	M0wT1VxIpmhyQde5pm2ZwUspWpIDr2fr2dX44IHvHDW0dluqrXiqYIMtQgAwm8KrIZC1WT
	jd65h/lVsOy3QfEFpP6MjLaJwkqhTdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777909733;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9VQB90Cq/vCFtqXEepfg0xyR4qrorBGAXYwxdl/PBOI=;
	b=AWs0BU4tB6Kmb49gv7KW5jm2su+L8WwqduT9WbjeguSG5Q58mwBKLXcxN3a6d6vzL/1y3C
	wR1hS8nvlnz97TDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777909733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9VQB90Cq/vCFtqXEepfg0xyR4qrorBGAXYwxdl/PBOI=;
	b=obGA3GiOxdkQ6dcRaG5XvpnTKy8IXtlJ21Idq8n7hLtzFeasbV7SUti1x1MGQVpV3zEif2
	M0wT1VxIpmhyQde5pm2ZwUspWpIDr2fr2dX44IHvHDW0dluqrXiqYIMtQgAwm8KrIZC1WT
	jd65h/lVsOy3QfEFpP6MjLaJwkqhTdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777909733;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9VQB90Cq/vCFtqXEepfg0xyR4qrorBGAXYwxdl/PBOI=;
	b=AWs0BU4tB6Kmb49gv7KW5jm2su+L8WwqduT9WbjeguSG5Q58mwBKLXcxN3a6d6vzL/1y3C
	wR1hS8nvlnz97TDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45CC2593A3;
	Mon,  4 May 2026 15:48:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mbiCD+W/+GkeKwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 May 2026 15:48:53 +0000
Date: Mon, 04 May 2026 17:48:52 +0200
Message-ID: <87v7d3w4yj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: fer.antunez24antonio@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP Envy X360 15-fh0xxx
In-Reply-To: <20260504-hpenvy-muteled-fix-v3-1-5567fd9b3d25@gmail.com>
References: <20260504-hpenvy-muteled-fix-v3-1-5567fd9b3d25@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-0.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -0.80

On Mon, 04 May 2026 15:33:26 +0200,
Fernando Antunez Antonio via B4 Relay wrote:
> 
> From: Fernando Antunez Antonio <fer.antunez24antonio@gmail.com>
> 
> This enables the mute and mic-mute LEDs on the HP Envy X360 15-fh0xxx
> 2-in-1 laptops.
> The quirk 'ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX' has been created and
> is now enabled for this device.
> 
> This is my first patch, and I'm still getting to grips with the code,
> so there's probably a better way to implement this fix.
> I apologize for any inconvenience caused by the constant release of
> new versions of this patch.
> 
> Signed-off-by: Fernando Antunez Antonio <fer.antunez24antonio@gmail.com>

Sigh, I already merged v2 patch.  But now I scratched it and applied
this v3 patch now.


thanks,

Takashi
