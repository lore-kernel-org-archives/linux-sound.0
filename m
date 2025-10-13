Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4531EDA02
	for <linux-sound@vger.kernel.org>; Mon, 13 Oct 2025 19:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760382249; cv=none; b=LiAcufiToObaWkYZTOMpJp9agfdOybOljic/w1h8jFZZxcWq1N6v+I5KQ1q3cK88b6068lUoMI3JKjud16lv2UYTw5b9baGOSt5EqJ1ZXp2YwbGfc9mH4ZEyZsQWmN4A1zK8MQLsxSessOPh+6Hh+RXalmaxshucIfRn4AN9mMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760382249; c=relaxed/simple;
	bh=PFpRI8q30Gr4F9PAlDtVRZZ7i+Rk+d1ShYLcWQZYE4o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WOw8MgjgfbECrJl82XnFPvakNnyc+huAzzVbMFNBclT8qyHWNnwiJ64hiWQZawLFOg34ubSlkK6wRJ2wi71p8DELqVTzdgl8kRY6xJhwATfrWNAFiih1lgVrlkTUC6QvfPp1pSUnaTksiqALKV+mVeslanVPXZYZiFC4bOF31Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yl9S8MeH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7jnFHV+5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a9+aWCgQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9258aH5c; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yl9S8MeH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7jnFHV+5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a9+aWCgQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9258aH5c"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D48D621222;
	Mon, 13 Oct 2025 19:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760382243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q+4C/RUUwRebhBJxbPX1nu6PHPWN+jMJsXkFnCGPddw=;
	b=yl9S8MeHTQTOAWbwRV3xWjMWQSlWiSNwEELlK+bR7m+jxHDnZT3P3P/MJJgvaMcHzgh6G7
	MO/5l9IM67iyu/9VgGyc9xJf7yWZ5Tgya8Of/w1AmB6k8PIB3ryxL2Ucntb6bB5AX0zZb/
	eZFHexF6FvxO8+f3wvnX5e8TsWdOH78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760382243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q+4C/RUUwRebhBJxbPX1nu6PHPWN+jMJsXkFnCGPddw=;
	b=7jnFHV+59DQG/CJqk6219zd5Izac7TxntTKSjUE2FMS23ZZB/npX0N/ptkrhNFsXXMXsAD
	t8YPqZi59ZusckAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=a9+aWCgQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9258aH5c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760382242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q+4C/RUUwRebhBJxbPX1nu6PHPWN+jMJsXkFnCGPddw=;
	b=a9+aWCgQm+nxTpngpzW8o/yMDRZZLWP000PkOQ8AJebnmZ71Rqc50DlGlo0CVeS3t2j8Oj
	dI2fOwlK6KaT/JhS0z5NO/zaTxYe582dcxXNuici+vys/jtej6RFKh42YpvmiB3SFu61GG
	3E5zycwYZTLBA5kTeTLDL4oq9ZyQNpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760382242;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q+4C/RUUwRebhBJxbPX1nu6PHPWN+jMJsXkFnCGPddw=;
	b=9258aH5cNVCG+UKX5KJSYBCxj/tc5xsnKEJZMgcEI5kfHBLaEH45rttj/LltkDqd2t7KcL
	mRarXnYRoIGCqOBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A4E7E1374A;
	Mon, 13 Oct 2025 19:04:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y3mTJiJN7WjMJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Oct 2025 19:04:02 +0000
Date: Mon, 13 Oct 2025 21:04:02 +0200
Message-ID: <87a51u8vz1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pauli Virtanen <pav@iki.fi>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: add mixer_playback_min_mute quirk for Logitech H390
In-Reply-To: <72c83ff44985b3de59ad35189e6757212bb3998c.1760375830.git.pav@iki.fi>
References: <72c83ff44985b3de59ad35189e6757212bb3998c.1760375830.git.pav@iki.fi>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: D48D621222
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 13 Oct 2025 19:33:06 +0200,
Pauli Virtanen wrote:
> 
> ID 046d:0a8f Logitech, Inc. H390 headset with microphone
> is reported to have muted min playback volume. Apply quirk for that.
> 
> Link: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4929
> Signed-off-by: Pauli Virtanen <pav@iki.fi>

Applied now.  Thanks.


Takashi
