Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F014921B7
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 13:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785333512; cv=none; b=Khu83mxwYcXc9npRLu1XUfJRVNnahj8BlE6DXhdnmW5CW8b4NJAvXVJbdIgwjP6cSJ9ChG4fPfZTFqd70Y+Dc137tAiRvUf/AiOm6pytz8zuLiFouye71nGULNmAYXcO8E71YsHab5qtSAqb01x1IEN+YrL1NuYrw+KVtYQUbgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785333512; c=relaxed/simple;
	bh=YjNFQzTQhwL6V00wLmDFU3YBaChZBq529dvKp9UOIMA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TuF4VGdhBMRURlc5gCI7e5tM5UoEqySWNx+tvMbbxOD2IfcA6BZ9XsvhYXuqonyuRVWLXPAB0LLNTBjtU2QrNJJ5IwnwYjePU9/nwm2yoC3x0rcgi7Kteqi/DTCmya2cDfzHNenQtr2wUXnQp6/BM+bZjIpG+N1V64bCcitnpZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IWtMwgcG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lgalo5Hu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oaAt6LN0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YQ9DuZbT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IWtMwgcG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lgalo5Hu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oaAt6LN0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YQ9DuZbT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AC9337B806;
	Wed, 29 Jul 2026 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785333500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DsI2MST9B4hlCI+O195lfswO/o1LOYgdD/vzi5OmKLg=;
	b=IWtMwgcGarfVoKP5yRtBPM86QHlafbpLyitVRU4NgRRtzWsmTH0mKcrzEc1jcKj36Egyrp
	RodBQlGVMbifCQrGJOGunkHitQH+KMQ6sQRewxR2K4tlYtJcZRQbMVVZw3N3utOu6kD4WR
	VfavR1betBkZBW4dXsHunxi4azuOyk8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785333500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DsI2MST9B4hlCI+O195lfswO/o1LOYgdD/vzi5OmKLg=;
	b=lgalo5Hu+vEgzZs21pc5+li8rLXXS91Rle6gQ+b6oV7T9CgPbBB8iojHMhT2/iDR/Gf6Cs
	Knh0ZPI+AuD/B0Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785333496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DsI2MST9B4hlCI+O195lfswO/o1LOYgdD/vzi5OmKLg=;
	b=oaAt6LN0vDGt//jYdDJ/zklacgBndBX2iInAFlxIw+9xZHcwhBQp7M3l2e+7sCvFqYwPzk
	BtrIAe8jRFxkwsdInJ4P82kpkb1POR8sHQdFm/mA1CKNS2Va4BoA3dYWNkzsK+qZkOz70P
	3g0Db5X8lRWWPJB9dwwHYvltrnDpyts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785333496;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DsI2MST9B4hlCI+O195lfswO/o1LOYgdD/vzi5OmKLg=;
	b=YQ9DuZbTDP/9XurBQ1wCrUahfg6pSaxYeuWbR1ZnbPh17/tsMyrI9/q61TWhkaHvKXMKfu
	r5R4Nqj6pHAHg9Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86F3F779A1;
	Wed, 29 Jul 2026 13:58:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RXxSH/gGamq0GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 13:58:16 +0000
Date: Wed, 29 Jul 2026 15:58:16 +0200
Message-ID: <87fr11524n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/intel: Add Star Lite Mk II/III to power_save_denylist
In-Reply-To: <20260729125544.539067-1-zhangheng@kylinos.cn>
References: <20260729125544.539067-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Wed, 29 Jul 2026 14:55:44 +0200,
Zhang Heng wrote:
> 
> The Star Lite Mk II (0x10ec, 0x111e) exhibits a pop sound
> when the speakers are used after a period of inactivity.
> 
> This can be resolved by disabling the HDA power save feature
> via "options snd-hda-intel power_save=0". Add the device to
> the power_save_denylist to apply this workaround automatically.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206623
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Is the problem verified with the latest kernel?  The report above
looks very old, and it's not sure whether the problem really persists
or not.

In general, the power-save deny-list is a kind of last resort.
Usually the pop noise problem could be resolved in the codec driver
side.


thanks,

Takashi
