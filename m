Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F23F371D17
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 07:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776412219; cv=none; b=gKnqNuo9XbEZmaftl4wWURkBYGw5ZbGtgxt+uDA6YRmKjGimXtQZOMNvEvw6V4RdkMoKEdhylqwiXJ/5Dp20LCZfjHG6HAYt/Gjhgyuy8PkosSdoP7SKYYf+O3s3M7gAbVlRf0ndJzC0IRlDa12iubqMqR3gKv/hAfFo1eAFD8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776412219; c=relaxed/simple;
	bh=YGdYuXDZnLbS8giv9oyWY2XZfq+Jd01qnEuqZX8vwpM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hSYNv3mQjICGnweHYNnMp48GHRNckrK6anH60rwJUh4lNgD2jTE/XfJj2cSKeRdpAYoATnM5M0UHze57vhVQkoUYOc6AjtbLPY6NuLBP2YmOvXB92l6m6eGa1GMjbfG1KU2vXNMPEg4d6tHl3B5LHblxRDNlxJ1/00NnjRa0zL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i5R66aVY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RQDJSPMz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i5R66aVY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RQDJSPMz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i5R66aVY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RQDJSPMz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i5R66aVY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RQDJSPMz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4E4A15BE21;
	Fri, 17 Apr 2026 07:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776412212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=12w9l57skmvfdtkbtDHqxIb4PgT4pGOILKqcPczfAiE=;
	b=i5R66aVYqpirNxcDY1P5/4NUvFzY9CqHO6dNauK0yaPOXN/ERMXd01IwFJ26Y7L+GoSIt6
	1qBXURGmDjFbr0XZ1dncbvIySYWT2/asv8KkhgL5wjthTPU9bPS/OASIQOu5n9Y+suPIzY
	+ZXb+YNTU4AZc4TRtNMutH4LmzuKS70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776412212;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=12w9l57skmvfdtkbtDHqxIb4PgT4pGOILKqcPczfAiE=;
	b=RQDJSPMzssrg50sYdV8AIjbScUuC/zdcIqmU2OLnlMAPNWe8JH5dVAYQD+GpAp539tkIXX
	VH0qqpCa8nxQy+BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776412212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=12w9l57skmvfdtkbtDHqxIb4PgT4pGOILKqcPczfAiE=;
	b=i5R66aVYqpirNxcDY1P5/4NUvFzY9CqHO6dNauK0yaPOXN/ERMXd01IwFJ26Y7L+GoSIt6
	1qBXURGmDjFbr0XZ1dncbvIySYWT2/asv8KkhgL5wjthTPU9bPS/OASIQOu5n9Y+suPIzY
	+ZXb+YNTU4AZc4TRtNMutH4LmzuKS70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776412212;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=12w9l57skmvfdtkbtDHqxIb4PgT4pGOILKqcPczfAiE=;
	b=RQDJSPMzssrg50sYdV8AIjbScUuC/zdcIqmU2OLnlMAPNWe8JH5dVAYQD+GpAp539tkIXX
	VH0qqpCa8nxQy+BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 25402593AE;
	Fri, 17 Apr 2026 07:50:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NKDdBzTm4WkGFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 17 Apr 2026 07:50:12 +0000
Date: Fri, 17 Apr 2026 09:50:11 +0200
Message-ID: <87ldemdo0c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Johnathan Penberthy <johnathan.penberthy@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk entries for NexiGo N930W webcam
In-Reply-To: <20260417010123.3080904-1-johnathan.penberthy@gmail.com>
References: <20260417010123.3080904-1-johnathan.penberthy@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Fri, 17 Apr 2026 03:01:23 +0200,
Johnathan Penberthy wrote:
> 
> The NexiGo N930W 60fps webcam (USB ID 3443:930d) hits the same
> 'cannot get freq at ep 0x84' error in snd-usb-audio as its sibling
> N930AF (1bcf:2283). Without QUIRK_FLAG_GET_SAMPLE_RATE the ADC clock
> is never configured and the microphone streams only zero samples.
> 
> Testing on Linux 6.17 with QUIRK_FLAG_GET_SAMPLE_RATE |
> QUIRK_FLAG_MIC_RES_16 (via quirk_alias=3443930d:1bcf2283) confirmed
> the microphone captures real audio after a cold USB re-enumeration.
> Adding a native quirk_flags_table entry avoids the alias workaround.
> 
> Signed-off-by: Johnathan Penberthy <johnathan.penberthy@gmail.com>

Applied now.  Thanks.


Takashi
