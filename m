Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF111C862F
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 08:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138722; cv=none; b=akO6tr1PwnZPp7YaG4iVUWmxOfrQjvwUx+oCJAhd1JhWqaM/KwLxKtbSMwnnNFrqWf/ScdJdrV3Frus9jpeCoCiU26O97S5D72eNO6LUGHlteZTEQIrCmWH7T/2hDwe9Tund7FUoGSq11ZllZZ/FvSb6flJS03zkDRRX4lnNoPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138722; c=relaxed/simple;
	bh=hjGERS7dBQ36yWmG/biNVVGJgmZoPckuBYC5IqVQvEU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GuGCQS2PSb1XowuciPkp0/HzaOFcd9tEDe3r2FQi7AFJIT+Lk7YhI1HS8xLQGniCtM2HKYPfbGdQY5WIylCAwONzaGiB3a/YnSYl3jepSDxrhj4jyqgfH5S7cH/N1TtdgiWl44/mJegP7FDvhzU8xTVrVM32X/wOrfFsA/wOjwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D5nnw96I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cEk3bk8O; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BpctyDsG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8h6PvDrc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D5nnw96I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cEk3bk8O";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BpctyDsG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8h6PvDrc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 654D221C35;
	Fri, 16 Oct 2026 08:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792138718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mesTICA/E59m+Ts9uRvlFeEwgxIinDhNmUh9VyVSUyE=;
	b=D5nnw96I5/lgf1AFv0S7NG2COjD7eO8hYl/UXDpYCP7JlIoYSR4tExvT9PvThvyZMOqThn
	ZFNPeDwYUN0CIsA9jiyHP4849WLtk8f65CnOvvWUu1bmB/VlFMKWM448cdivQFkYUew4xM
	jpgeYt5Q27caELergak4+uWUBTlD84E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792138718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mesTICA/E59m+Ts9uRvlFeEwgxIinDhNmUh9VyVSUyE=;
	b=cEk3bk8OspqC9W2ZmZwlGXgThNvlGmXNwL+qJHglLP9vLBlRYlBF4cDPbQby/cqMleFeov
	VcY/veIxIDbeHpBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BpctyDsG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8h6PvDrc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792138717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mesTICA/E59m+Ts9uRvlFeEwgxIinDhNmUh9VyVSUyE=;
	b=BpctyDsGFvKKA3SjRS0RT5hYXzKrXT9sLtFKW++u2ami0Sh/UiQs+ngu+aPKoiwsegKE5V
	m8tWYdws4w6FzoNpTsAGBrU+RcPv3DX3dDGQtz1F9IkbTEP1El/SLkl+4b1D79U4Y31zTT
	KmM7BDNPM18w2Yf1yGp9LeJerMaSCo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792138717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mesTICA/E59m+Ts9uRvlFeEwgxIinDhNmUh9VyVSUyE=;
	b=8h6PvDrc7eNc44/riYOE8MYign1O7xTO+MWqn7WD2FxKB8Wq/b2unGAp+SFNHQMYCirnfz
	tJrYD0N2y+njWHBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 298A81339F;
	Fri, 16 Oct 2026 08:18:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dhLzAN3d0Wq7UAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Oct 2026 08:18:37 +0000
Date: Fri, 16 Oct 2026 10:18:36 +0200
Message-ID: <87qzhq5a8z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jurica Vukadin <jura@vukad.in>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add mic volume quirk for Logitech Brio 100
In-Reply-To: <20261015201820.10278-1-jura@vukad.in>
References: <20261015201820.10278-1-jura@vukad.in>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 654D221C35
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vukad.in:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Thu, 15 Oct 2026 22:18:20 +0200,
Jurica Vukadin wrote:
> 
> Like several other Logitech webcams, Brio 100 reports a 6144 step
> volume resolution:
> 
> usb 5-3: new high-speed USB device number 4 using xhci_hcd
> usb 5-3: New USB device found, idVendor=046d, idProduct=094c, bcdDevice=99.14
> usb 5-3: New USB device strings: Mfr=0, Product=2, SerialNumber=1
> usb 5-3: Product: Brio 100
> usb 5-3: SerialNumber: 2349LZ51Y668
> usb 5-3: Warning! Unlikely big volume step count (=6144), linear volume or wrong cval->res?
> usb 5-3: [5] FU [Mic Capture Volume] ch = 1, val = 1536/7680/1
> 
> Signed-off-by: Jurica Vukadin <jura@vukad.in>

Applied to for-next branch.  Thanks.


Takashi
