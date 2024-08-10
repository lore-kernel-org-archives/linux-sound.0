Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A4B14C582
	for <linux-sound@vger.kernel.org>; Sat, 10 Aug 2024 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723279207; cv=none; b=mJdxAffIRKpCb9a5oBCbUhxmjn9j++5bPuwAneehR1eRpOJAKaPljBxLFHsCEDJcnt3mZOW09XF0KKO2/LXcH3KwGsj+UD9HrotmsunZCHyYq0Id+fjFn0sp8+2212sEMwNj9WjUQ/rxJ8PtCs/Dtk8lyyH2ITB7uX53TB7d1Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723279207; c=relaxed/simple;
	bh=VVSco3vYS8WWrGbnthVzRi0qDvUix1WgC7S3UJNFm0A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ttNPiCjLhpTQ+PFsyY3p+8GmURk65GEuCCWinhf3CPrb4Yfkjm28QKqHBfzdPadSh38M129Zei8+BI7Szdr9u92s6MRwNyC4D6lIpCVme8S3odgB3TQYx1CtSTAR3AlbTZZdZrh+D0//jZoUFHPwe5CHooD/m5oGBFeWTFOTCXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HAxoN83Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3277D2WZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HAxoN83Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3277D2WZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HAxoN83Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3277D2WZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HAxoN83Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3277D2WZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F3B8E220E0;
	Sat, 10 Aug 2024 08:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723279203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kZnSAma0caL6cylESrM2iYGcbCAcUFjrE1NFH/ED2UM=;
	b=HAxoN83QvWMWOR+xXfJ6SJjTij0kd52+QN+ylf71E7a1+f02c4jb/deWSAZq7enRmoxc68
	GBDF4JfjMF075NIISlUXO1Y6WvT8/mXqPmCyIUi+QfQC4Zn5s4f31TWuRA+IEIBaqQlUJu
	RC52gvSEOC1hC2qiwyX4IZc0ul3sR/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723279203;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kZnSAma0caL6cylESrM2iYGcbCAcUFjrE1NFH/ED2UM=;
	b=3277D2WZBvZMaMAxkh35mZ9qWxA1OEl/t/PwLtmxAZTe2X4aSP+rS4ZOfLI4ZCW0RTXb87
	gDYTIJweR2CG6jDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723279203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kZnSAma0caL6cylESrM2iYGcbCAcUFjrE1NFH/ED2UM=;
	b=HAxoN83QvWMWOR+xXfJ6SJjTij0kd52+QN+ylf71E7a1+f02c4jb/deWSAZq7enRmoxc68
	GBDF4JfjMF075NIISlUXO1Y6WvT8/mXqPmCyIUi+QfQC4Zn5s4f31TWuRA+IEIBaqQlUJu
	RC52gvSEOC1hC2qiwyX4IZc0ul3sR/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723279203;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kZnSAma0caL6cylESrM2iYGcbCAcUFjrE1NFH/ED2UM=;
	b=3277D2WZBvZMaMAxkh35mZ9qWxA1OEl/t/PwLtmxAZTe2X4aSP+rS4ZOfLI4ZCW0RTXb87
	gDYTIJweR2CG6jDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD6C313704;
	Sat, 10 Aug 2024 08:40:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UDYLMGInt2Z4JAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 10 Aug 2024 08:40:02 +0000
Date: Sat, 10 Aug 2024 10:40:42 +0200
Message-ID: <87bk20lqid.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Stistrup <sstistrup@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH v3] ALSA: usb-audio: Add input gain and master output mixer elements for RME Babyface Pro
In-Reply-To: <20240809204922.20112-1-sstistrup@gmail.com>
References: <20240809204922.20112-1-sstistrup@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-0.30 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -0.30

On Fri, 09 Aug 2024 22:49:22 +0200,
Stefan Stistrup wrote:
> 
> Add missing input gain and master output mixer controls for 
> RME Babyface Pro.
> 
> This patch implements:
> 
> 1. Input gain controls for 2 mic and 2 line inputs
> 2. Master output volume controls for all 12 output channels
> 
> These additions allow for more complete control of the Babyface Pro under
> Linux.
> 
> Signed-off-by: Stefan Stistrup <sstistrup@gmail.com>
> ---
> Changes in v3:
>  - Use checkpatch.pl without -f flag.
>  - Fix remaining style issues from checkpatch.pl
> 
> Changes in v2:
>  - Check invalid negative values in snd_bbfpro_gain_put
>  - Remove blank line in snd_bbfpro_gain_update and fix checkpatch.pl errors

Thanks, applied now to for-next branch.


Takashi
