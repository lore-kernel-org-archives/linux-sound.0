Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEAE407CD3
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588738; cv=none; b=OVdSNXk/ld9lDWENcRLjBFumtAkJYAUCcUecT59q+nPseodM6fUnVTRE7ha84io/Tolr1huuNhL9nlujgYjsWw/2U8xjCvCHOqOvxZaabFhQGaNZkuIi7xI1M0d2/bnW1fNW8YxmQBd2LDjs3IDpFoC2fsVqgax9Ys8rWRDIKp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588738; c=relaxed/simple;
	bh=gg23Y43TsNSaQVmXpatAjH3JZVkY9J6lBx7LCHPAdkw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jt03WT3aqPfJ4Tymb/pcOBt6LU8o2neWfngN6qEGHy2X3WZhQICRCNIvrX0tb0Ej9v8NytZlS19BK5goJcoKYwW/fm4YtUhErVIUQ/MiePoQdujR9CU7z2URnxPVWshs0Fgi/QYXkviy5Yv6KkkYYbHj54ADZo+4yZ6cY5puXr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LgL3p3Gk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6eO53qZu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IlZ/rgl5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gx6n2TWF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LgL3p3Gk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6eO53qZu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IlZ/rgl5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gx6n2TWF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F42107609F;
	Thu,  9 Jul 2026 09:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783588733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wjpl5WEKrWy0zCDY8ol1pt9snAcHMAJZJFH9CtPFrfE=;
	b=LgL3p3GktcuBZU4UQ2SSuh5BUAPm/20Q6t4fw5QLbsja9GF2I8jHoKNmwKmZumFSfIDk21
	7uOrbCofyqsO/pqtaDfNQm2ICnwlmmgLp3Ehjg5+G5/sRwxs6cBTEsAlAZTN8zdgny5KeD
	g63F6I9Y+s26GCj+M7M8vJvMbZqUuDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783588733;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wjpl5WEKrWy0zCDY8ol1pt9snAcHMAJZJFH9CtPFrfE=;
	b=6eO53qZuLi2F/y207jGAr6xLYXy643BDouwLLbv02ey++GU+KMiXjFWJu855v4g35lYBrm
	hjrAnck869UnetAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783588732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wjpl5WEKrWy0zCDY8ol1pt9snAcHMAJZJFH9CtPFrfE=;
	b=IlZ/rgl5EzCQkQl1o/g810/bQJJtMbK+8hEy5BYpQ4H+aw07auD+j8L+mxiRmo/9Hy/zT7
	oBqcTBVWZp09LWmHoSC8TJVTn3DAkTSsT+NAwDOeaNOXaz0mjQrVxsYC/Dsw8zRUsbtVRt
	OoHL3l1Lq7vFRAD3EINlIge1+8NPjKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783588732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wjpl5WEKrWy0zCDY8ol1pt9snAcHMAJZJFH9CtPFrfE=;
	b=gx6n2TWFAP2cEVlurfK9ciGL8x7e3Q+A0DAcCZqD/GgJ6ZXvlb9dO72v8YoloeFXa0VmUR
	XVhVjsilVVRuW7Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0D74779AA;
	Thu,  9 Jul 2026 09:18:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZG3PLXtnT2qeNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Jul 2026 09:18:51 +0000
Date: Thu, 09 Jul 2026 11:18:51 +0200
Message-ID: <8733xs4j2c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Eckhart Mohr <e.mohr@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for TongFang X6xx45xU
In-Reply-To: <20260708132135.102680-1-wse@tuxedocomputers.com>
References: <20260708132135.102680-1-wse@tuxedocomputers.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,tuxedocomputers.com:email]
X-Spam-Level: 

On Wed, 08 Jul 2026 15:21:06 +0200,
Werner Sembach wrote:
> 
> From: Eckhart Mohr <e.mohr@tuxedocomputers.com>
> 
> Fix microphone detection on built in headphone jack for some devices.
> 
> Signed-off-by: Eckhart Mohr <e.mohr@tuxedocomputers.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>

Thanks, applied now.


Takashi
