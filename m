Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992121EE7D5
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777640590; cv=none; b=BFhqk0Cgghx4ErHm+v7X5hhEe4QNBklkA3BB96S7HA9M3sg8+ifWdsYE/rOfUASZStEQuf4ELYmMDV+lnAUid7KM5l7fcAVC+2Ej5QhhCfEBno+XXIq2x1efZR+gLbxAe0gu5v0mFvsnnTuIT9endRw3b8viSbje4eZTQfyvZRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777640590; c=relaxed/simple;
	bh=oWI+ljjXfhADMNI5fSnsTVI11GbjZ1QTUZGRTGOj7gY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hEbC1oshHtmCN2FBIfoYrQNKwuxy9QuLGUlMOtQTfG6yFWDNrkz5gA4JB9Y3qg8x2TzSuMgYBJcqnvyL+g47k7mCOIJqRC8oaIXM0Y9LVpEWmqjvrimVnImVu7HPgGUUhwPdZQoDidHdR3ocA/4wafq0UDS92t2MmEyQGPsMCEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zv821D3x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ux4Nsvba; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vkI6L8Dr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HPw1pTip; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zv821D3x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ux4Nsvba";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vkI6L8Dr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HPw1pTip"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 464785BD44;
	Fri,  1 May 2026 13:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777640582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fb6PUISBiQAVZc8Gb0V2m2vwu/U9SJ5PMAdOtBH19Qc=;
	b=Zv821D3xUOj+9Cktso00ZVrbXs8d/oHEKyeP4DrHxdNNo2iVQmeI5G0GvmJpqysmMVIzYH
	waEqSPEiiHqlmrsXnhMRsacdl4IZjvLt9EbnaN7HnDeGQ4Ykr4ETEyHH/6q1EKQ2eFKUC4
	cT7WoAxb9T+AJYJHdacOXNclrm3Ur4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777640582;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fb6PUISBiQAVZc8Gb0V2m2vwu/U9SJ5PMAdOtBH19Qc=;
	b=ux4NsvbaPDWfbk7mFJ4bIHW6nbiz7nMoqEKNBAbYKB/pkmx8ODE8T9c052jm2CTFYy3DQ6
	wXQbET3VJ/Zh9gCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vkI6L8Dr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HPw1pTip
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777640581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fb6PUISBiQAVZc8Gb0V2m2vwu/U9SJ5PMAdOtBH19Qc=;
	b=vkI6L8DrJSWE3ME+F2M4tMWishgv6wY+Y6HAxOXBzSqihmY9GX/LTmqklMT8jnotQZH4aX
	Es3LYsH2KY/Ico5H4EuhS2pKCj3RsZu2/bfFKAursBSp8+rs3mitC1rxENx+Ph8dXGLSgH
	7vTjII4L3oKiblKiTSg/Ra49aNggYKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777640581;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fb6PUISBiQAVZc8Gb0V2m2vwu/U9SJ5PMAdOtBH19Qc=;
	b=HPw1pTipP4j2N/bXZ487TiFWg/WIhP/Jwf8hxDCopDM70MzQbSVb00wmEKvnQRx16vvEaU
	6C6ZJOiJNDEOtxBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13A70593B0;
	Fri,  1 May 2026 13:03:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ra6FA4Wk9GmgeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 01 May 2026 13:03:01 +0000
Date: Fri, 01 May 2026 15:03:00 +0200
Message-ID: <87ecjvl1tn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pauli Virtanen <pav@iki.fi>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: add min_mute quirk for Razer Nommo V2 X
In-Reply-To: <94449577332d14d7974864903825f27e5824ddbc.1777579951.git.pav@iki.fi>
References: <94449577332d14d7974864903825f27e5824ddbc.1777579951.git.pav@iki.fi>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,gitlab.freedesktop.org:url,suse.de:dkim,suse.de:mid,iki.fi:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 464785BD44
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 30 Apr 2026 22:49:50 +0200,
Pauli Virtanen wrote:
> 
> ID 1532:055e Razer USA, Ltd Razer Nommo V2 X
> is tested to have muted min playback volume. Apply quirk for that.
> 
> Link: https://gitlab.freedesktop.org/pipewire/pipewire/-/work_items/5235
> Signed-off-by: Pauli Virtanen <pav@iki.fi>

Applied now.  Thanks.


Takashi
