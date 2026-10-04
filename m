Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEEB46982B
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 18:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791138416; cv=none; b=SqXEwZTP0gNwARBFJuED2LVzxGLzH8yU7fZiO3d6TeojkGSBJJKAPuKI/WzgrZB+vWtvGhPld8fHjuGbqBcxFLDoMPhKVEzV7TMQigowr+mYXpcn7LrUJ9ZfMtDkU/jhzt4XgRfWg0JHn4Dzl5YcWaHpqnVR9XHeigzOO3JM3YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791138416; c=relaxed/simple;
	bh=2DHXQiLJXcGGqNSvh6uQ+cRd5aeBs+pi0Gk8QzSTLrQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mZ4UeujsjZ9ToKtrtgeJx9CrhBwwwPuR7FMPy2IhyzwKNqahvicvyrjrFrOtOFTrwEcI2d0Y05+OPn+d/NpF213ukSBpqTHi4WRWy/HJOB+7vCmpvQSk/lW/iR11L50DTJwETMZkwyyYWutqovHQeOkZEpHzQq4lYS0+I9rdG8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dHwMoiPG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9VW+eop5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qy15Z41g; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b4W329D9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dHwMoiPG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9VW+eop5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qy15Z41g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b4W329D9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F3B051F444;
	Sun,  4 Oct 2026 18:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791138409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLYCHzmlz45Xw1JnmVwiqhPvihBPAf82xirGZLhLols=;
	b=dHwMoiPGKsEzzgrhmAjj+DFfLlzMT38bmizDao/kMGqV1onFrQSnL52tXe1/gkZ0Gk1lX0
	sxLslPhCGnN7N7xUScouG/YN1aAdNrEberZHbSU0MQDUmcTDfvON8ixOYQ7hfRazKC2N06
	/CYXMZAJDhrxOoIAdKlPFKhgmSU4aBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791138409;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLYCHzmlz45Xw1JnmVwiqhPvihBPAf82xirGZLhLols=;
	b=9VW+eop5olmhjQZKSBBJyKyfIPoLfhiZIcM9U7xk0kFteHNp4e1lfYRwbJO2z4k2oE9mM8
	EtfBQ6KDUHJos8Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Qy15Z41g;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=b4W329D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791138405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLYCHzmlz45Xw1JnmVwiqhPvihBPAf82xirGZLhLols=;
	b=Qy15Z41g9Wgo2fbKyJke8Rr344gXbwuYpNmwcZfOBl5lq6Z6UhdkFCSxVtUu3W/MuijMaW
	k3gXOHLeLth85ah1yHjGS7LHjqoa1JRs1TxqgkgteibvylwUSwULMEq78WnM93pTy9kqCB
	iNLMTYbzsVsz2Y8XlIqX86iCOoqPuf0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791138405;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLYCHzmlz45Xw1JnmVwiqhPvihBPAf82xirGZLhLols=;
	b=b4W329D9tSP0WuXusponliTHkqOiNb5Y7/eeYl6iT/+cL3vNZrfJqeUoC8NVmefnsPaWq2
	Ya9mBiSawHVwcgAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65F56133CF;
	Sun,  4 Oct 2026 18:26:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HOn8DmSawmpPUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 04 Oct 2026 18:26:44 +0000
Date: Sun, 04 Oct 2026 20:26:40 +0200
Message-ID: <87cxtpiaov.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: dchristensen8 <dchristensen8@proton.me>
Cc: "tiwai@suse.com" <tiwai@suse.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2] ALSA: hda/ca0132: Add Sound BlasterX AE-5 external RGB LED strip support
In-Reply-To: <qOF5tUXvi5MWOfDFTuE8fU0Wiqk3eTZMHhdWpsxR-JFuTXCwEeayR_yxgYmAQ6SIHogQmMkvtM8otTM9z1Wi4KIujjj6LtQPORGuegUuRmM=@proton.me>
References: <I690osvh2wujN3P04R4abtKFqOqtIiC-qin2ZEFs9q8kKU7-qfIg2cya4BuHS7Vg83Wkon6BCJGtVIxeJVfRZ8nG07laTUlv-fJjELMgp1Y=@proton.me>
	<87ik3kyy0h.wl-tiwai@suse.de>
	<qOF5tUXvi5MWOfDFTuE8fU0Wiqk3eTZMHhdWpsxR-JFuTXCwEeayR_yxgYmAQ6SIHogQmMkvtM8otTM9z1Wi4KIujjj6LtQPORGuegUuRmM=@proton.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: F3B051F444
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Sat, 03 Oct 2026 03:41:51 +0200,
dchristensen8 wrote:
> 
> Hi Takashi,
> 
> Thanks for the review! I moved the dma-mapping.h include into the main header block, added the s->opened check to ae5_strip_find_stream(), wrapped all the strip code in IS_ENABLED(CONFIG_SND_HDA_DSP_LOADER) with a no-op stub when it's disabled, and updated the put callbacks to return 1 when the values actually change.

This looks like a patch on top of the previous one?
Please submit a complete single patch.  Also, can you try to submit
without an attachment, at best, with git-am?  If it's difficult, it's
fine with an attachment as a fallback, though.

> One other thing: I was talking with the maintainer of openrgb and he suggested a patch to make zone0 led's work via the same mechanism (this card has onboard led's at zone0 and external led's at zone1). Should I add that to this patch or submit a separate patch after this one is completed?

Let's make a separate path.  The current one looks already enough, and
if any, we can change incrementally.


thanks,

Takashi
