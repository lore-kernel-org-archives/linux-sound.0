Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2EB1C862D
	for <linux-sound@vger.kernel.org>; Thu,  5 Feb 2026 08:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770279581; cv=none; b=sMR4utoak/Mm+t8oJOAaqy0fY7qeWJtcICHRM7wVHSK61zs/wue5W5EM4tGI51tGaidW0tk4VbARyO/u5eynWKRDRAhGJopzxYo/Pnt/bjU/J/8iyDUpgP/d2njaHkhWemPZaZSIYzKWg+70f+1I+u2Am54+6wiAGQGX+t3MG3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770279581; c=relaxed/simple;
	bh=THjjVjQ1qxtufBnOH/mIKUOw9vTUo5MA2VprMmEwj8w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HyfC5gtcTDaug0Aq+iw08lDcLnh+chUpm4N585XTKtTVbL9P4KIj4CbjermcabGJwzR+mHD/6fW5SOzXYjHW7OIqqoojvrYvuL2y6KMU+/Ks2IF0r5de1m0eUp3IVWdTxU1/TFUFTaK4+/xj24ezH8kz9o+nnFON6Z4tZMjO4qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lppGwh//; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fbzQvbLN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yGt5WDds; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yRaDCkzE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lppGwh//";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fbzQvbLN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yGt5WDds";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yRaDCkzE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D56663E779;
	Thu,  5 Feb 2026 08:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770279574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MnPWttCJ9CzHcwO05zCq6cgVpB3qu4Hybl/ccJPwql4=;
	b=lppGwh//BJACb1Be144998g/j8wh4TVAEjcwGvn3qp/0rN/GxHbDSRNcrBFcIV5gslCdvL
	9yP5BVKRvmsJoOYbMExjc5r96foC9wLKJmsM5xajj2d/sIY+Es/1dXyYLG/1hemOr5I3Lr
	Nb+cR++FRShM8z9DutpnIvLHDbkDIpI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770279574;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MnPWttCJ9CzHcwO05zCq6cgVpB3qu4Hybl/ccJPwql4=;
	b=fbzQvbLNjHaAzYf5m8yDzO9T1oaLixVAukCNbDBrNQx+XcmBaUUMqg2R5WLBvc7F5vjPyH
	W6flISNmdycgkOBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yGt5WDds;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yRaDCkzE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770279573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MnPWttCJ9CzHcwO05zCq6cgVpB3qu4Hybl/ccJPwql4=;
	b=yGt5WDds2/NjDvnX/b1EEnENbaM2ISWXKb0e9LeFW5RwIVeuV5x3cYWmO4j1Fd4dGWhynJ
	d1X2ESO3DWbIxllxzkrM2ZS8WdMz7ICvE4oY23z+2HuK7+gnZQHPsT7YaxVcrHcsp12fkB
	O6jxt2U4SaUhwZcadSuao0VC80ZePDw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770279573;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MnPWttCJ9CzHcwO05zCq6cgVpB3qu4Hybl/ccJPwql4=;
	b=yRaDCkzEMohb3bxfWkOqGzd2AjSH67rN4vOgt3hywVNkVwDVzuDp3rDZgKDR7xkgjJK5Iz
	tEAf/jqcnXrxgKCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A57BE3EA63;
	Thu,  5 Feb 2026 08:19:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id faA7J5VShGlXKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Feb 2026 08:19:33 +0000
Date: Thu, 05 Feb 2026 09:19:33 +0100
Message-ID: <87pl6jd2lm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Breno Baptista <brenomb07@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: hda/realtek: Enable headset mic for Acer Nitro 5
In-Reply-To: <20260205024341.26694-1-brenomb07@gmail.com>
References: <20260205024341.26694-1-brenomb07@gmail.com>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: D56663E779
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Thu, 05 Feb 2026 03:43:41 +0100,
Breno Baptista wrote:
> 
> Add quirk to support microphone input through headphone jack on Acer Nitro 5 AN515-57 (ALC295).
> 
> Signed-off-by: Breno Baptista <brenomb07@gmail.com>

Applied now.  Thanks.


Takashi
