Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9364537D111
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 10:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775126930; cv=none; b=J0EGlX2YdUoN3ftlv9Dp2h9yp/OF+xk1OUDfeqiadmz3AkcpP1O1FYj2IYOPeC36O1P0ig1sopYnEW/dD2GZufhP0c77R0QGIR0ru2pOOPMtdS9mbfMnm2Lz/vDl7NkV8V/KctPwdUddJQrVJHlY+FZqOZNC4zAi2czvcpxt6jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775126930; c=relaxed/simple;
	bh=+GiowJop7UwN08oH2dRlL1RYykBls6T5BVF7GFzOhrk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FHUs9rlsFac0BKzvYoB56tcouOGpWrDMw92fafEIcGpyUb7q/WQn2qbe4FxhxwB9Ew0JKY4x5jvo19HAuOjqzziJ+FRVafXGKNQMAaOkBL7BEEljhX9w0wwSzvnqN0g42SG5Z4yz/ShqIubvMyQfBpI2vDkC5+0pr6ruUCBFTqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ij9F/BCZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QZ12Fua5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ij9F/BCZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QZ12Fua5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ij9F/BCZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QZ12Fua5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ij9F/BCZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QZ12Fua5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 71AD54D325;
	Thu,  2 Apr 2026 10:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775126926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JAkFi1TrJtj9Q6Z7Vgiipb7scc7gXp3/Mj6TLow5q6I=;
	b=ij9F/BCZbGG+lv4AXFQHSpRHFyaIdsKnYvbppugUq4YDGSs6c8R9djneDw23Fd9dIWwdXr
	648G/DGMPelObcBEsZa5B/p0oqmdHsN4K+uCjxcpRqxd8aOv/4Ei0xoIZnAwKlx3IoiLES
	4BrKH4XAibv6Ci6KqSZC9N9zG27c0Eg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775126926;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JAkFi1TrJtj9Q6Z7Vgiipb7scc7gXp3/Mj6TLow5q6I=;
	b=QZ12Fua582ViSyswOuiiT33ZE6pdY1GcAgIIgwDiZLzp0grD9atFZZToYiGddCrQRuYUDQ
	03L3Ke1cJzsuASBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ij9F/BCZ";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QZ12Fua5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775126926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JAkFi1TrJtj9Q6Z7Vgiipb7scc7gXp3/Mj6TLow5q6I=;
	b=ij9F/BCZbGG+lv4AXFQHSpRHFyaIdsKnYvbppugUq4YDGSs6c8R9djneDw23Fd9dIWwdXr
	648G/DGMPelObcBEsZa5B/p0oqmdHsN4K+uCjxcpRqxd8aOv/4Ei0xoIZnAwKlx3IoiLES
	4BrKH4XAibv6Ci6KqSZC9N9zG27c0Eg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775126926;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JAkFi1TrJtj9Q6Z7Vgiipb7scc7gXp3/Mj6TLow5q6I=;
	b=QZ12Fua582ViSyswOuiiT33ZE6pdY1GcAgIIgwDiZLzp0grD9atFZZToYiGddCrQRuYUDQ
	03L3Ke1cJzsuASBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0DDC64A0B0;
	Thu,  2 Apr 2026 10:48:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0M4iAo5JzmmTOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 02 Apr 2026 10:48:46 +0000
Date: Thu, 02 Apr 2026 12:48:45 +0200
Message-ID: <87qzoxiqnm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cryolitia PukNgae <cryolitia.pukngae@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,	niecheng1@uniontech.com,	kernel@uniontech.com,
	=?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>,	Kagura <me@mail.kagurach.uk>,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: apply quirk for MOONDROP JU Jiu
In-Reply-To: <20260402-syy-v1-1-068d3bc30ddc@linux.dev>
References: <20260402-syy-v1-1-068d3bc30ddc@linux.dev>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 71AD54D325

On Thu, 02 Apr 2026 07:36:57 +0200,
Cryolitia PukNgae wrote:
> 
> It(ID 31b2:0111 JU Jiu) reports a MIN value -12800 for volume control, but
> will mute when setting it less than -10880.
> 
> Thanks to my girlfriend Kagura for reporting this issue.
> 
> Cc: Kagura <me@mail.kagurach.uk>
> Cc: stable@vger.kernel.org
> Signed-off-by: Cryolitia PukNgae <cryolitia.pukngae@linux.dev>

Applied to for-next branch now.

> ---
> Btw, is it a good idea for turn the volume_control_quirks from
> switch-case to a table and sort it accroding to USB VID&PID?

Yeah, this might be better, indeed.

But the quirk isn't really straightforward for those, maybe we need a
matching of USB id plus kctl id name string, then update the cval
fields conditionally with flags.  Let me cook later...


thanks,

Takashi
