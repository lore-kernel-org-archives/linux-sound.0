Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F52369992
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768829452; cv=none; b=Xzd7gWOt+7/tK5+d/ZlCu3CjSQRORY8Lw+Ze5afXtG/XuQqXF7VjI3uddFnEdXq09x2HS7VF0pF9qiM7HORnBSOKM0Js70rwkwMiLWY9EJDRy9SYjTRFqRoteBE+wBSXQE2B3+LG0nPK07FUJvD7uI6cns72mLqLQE78BafClYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768829452; c=relaxed/simple;
	bh=9CgxN3y6zWyGbBGOGTBIAJu5Z6u7BYw/mzaV92py8ys=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IwYAOT2uh7MXAURuj/c6cjY2hMmtUtQMcOEWSTxvPQ/Esr5DckAFpr+xT+rfJHwY/Gh6wYSMjREIxl1EN5Wfat4GvhtLwbn+gieKmFh9ryqho5N9QYMBYJrLHU8yM5NRukd09bAE3YULVTN2Ka4cp/fzED4lJxTbfu7nWYWyXFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZXv6a251; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d/Nz1YlM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZXv6a251; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d/Nz1YlM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZXv6a251";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d/Nz1YlM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZXv6a251";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d/Nz1YlM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 94C8D5BDB1;
	Mon, 19 Jan 2026 13:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768829449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kyJwmqzs/Q/lPOGBCd8vZo1IxJQttRaSNIwtK/A0IKY=;
	b=ZXv6a251Vh+NZq3b0F+PZXTnqmjRa+mYKdkgOEoplOxXVgdzCJFvGT3Ls29cEkpAyu+kre
	dfb9lLO+TlLSKQYdZY14Y4Wl+zZC6eVhPHWh4SzCzl180QC7u2S+9QwfQ2H7K2hkZRveOZ
	mKqAclG+JPpJs+JKWM3Gyo9XX44MSes=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768829449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kyJwmqzs/Q/lPOGBCd8vZo1IxJQttRaSNIwtK/A0IKY=;
	b=d/Nz1YlM2aXIscf6lpoDVtzwvILbUEt7+ud6+Thhk3wm3m1wVf00CNnzL2jZoJdJehIKNL
	WQziVb/zTW+CwDAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZXv6a251;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="d/Nz1YlM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768829449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kyJwmqzs/Q/lPOGBCd8vZo1IxJQttRaSNIwtK/A0IKY=;
	b=ZXv6a251Vh+NZq3b0F+PZXTnqmjRa+mYKdkgOEoplOxXVgdzCJFvGT3Ls29cEkpAyu+kre
	dfb9lLO+TlLSKQYdZY14Y4Wl+zZC6eVhPHWh4SzCzl180QC7u2S+9QwfQ2H7K2hkZRveOZ
	mKqAclG+JPpJs+JKWM3Gyo9XX44MSes=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768829449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kyJwmqzs/Q/lPOGBCd8vZo1IxJQttRaSNIwtK/A0IKY=;
	b=d/Nz1YlM2aXIscf6lpoDVtzwvILbUEt7+ud6+Thhk3wm3m1wVf00CNnzL2jZoJdJehIKNL
	WQziVb/zTW+CwDAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4825C3EA63;
	Mon, 19 Jan 2026 13:30:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hdvbDwkybmmQRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Jan 2026 13:30:49 +0000
Date: Mon, 19 Jan 2026 14:30:48 +0100
Message-ID: <87y0lt7mrb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Karsten Hohmeier <linux@hohmatik.de>
Cc: tiwai@suse.de,
	1121535@bugs.debian.org,
	carnil@debian.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	waxhead@dirtcellar.net
Subject: Re: Bug#1121535: UBSAN: array-index-out-of-bounds in [...]sound/pci/ctxfi/ctamixer.c:347:48
In-Reply-To: <20260118184823.26480-1-linux@hohmatik.de>
References: <87pl7lgzd7.wl-tiwai@suse.de>
	<20260118184823.26480-1-linux@hohmatik.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
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
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 94C8D5BDB1
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Sun, 18 Jan 2026 19:48:23 +0100,
Karsten Hohmeier wrote:
> 
> Hello Takashi,
> 
> Your second patch works. Boot messages are gone and the soundcard still works as usual.
> Thumbs up from me for upstreaming this.

Good to hear.  I'm going to submit a proper patch for the upstream
inclusion.


thanks,

Takashi
