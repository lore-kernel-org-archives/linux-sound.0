Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC4749A3CC
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 11:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593708; cv=none; b=mxNxCA4VSSoT6/vf33WHX1u4BX6uuAtP+OcBE1Vg331XaoHzNHK5QQ5ElNpi3u98RcRVeFukbn4ajJCgMrBhdz2GqGZyHIshyTeIw/kdcqpShnv1995/ivTvmlWBbqp8dAbCFiqzV2mxrkF5s4ivFKpzdO28ezKcsoGZ/8g3Zoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593708; c=relaxed/simple;
	bh=XRbra9gsbQA7Ak581qxDpxCaZg+AakdNhToC0+SfUl4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QMb2ooD3GtGxrsEY4XpSWOFEwOQbyrqOYEAbRW3Ml9SHyxHnSIcrY8PeBODZcd9M9ZDd7wlAddqIorNes8CgIXebkXdiEY83BVqaDBG+txU929AzG4sOl1XhgbAGkTH6ZL+kDGcVMzd1ztgNz6ZbpwI6bIaVFeAInd/4aNewRdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hKQJYNrN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tkNiLUpF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bhA9gsWl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DsC0pK6d; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hKQJYNrN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tkNiLUpF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bhA9gsWl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DsC0pK6d"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 23AF5226EE;
	Mon, 28 Sep 2026 11:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790593701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jqiPlK6XEc5gh2PWdsdk23lHEzQktJxdGmzGHlg+k8=;
	b=hKQJYNrNoOWk707+uTN7qXGCndMaWhFdnmWSo2mJGtVvrsVBAYU7RK0i2WgqVNyXsdvbc/
	jeBt3xw5ING8L13wHwd1mi+Qem6H2LdLQNKvj6Acg/0CEmwadNGP2SBePtZngFh/9eq/LH
	UibYeMEFE/TjcSGOipvbxItqGPnacw0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790593701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jqiPlK6XEc5gh2PWdsdk23lHEzQktJxdGmzGHlg+k8=;
	b=tkNiLUpFbLyy1dMSYc24bvdcrIhbrfJxX080/xFDug5EeDwD5DLYg413qAo6i+qUvV9NrU
	ClpeZWM2mR2CLPBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bhA9gsWl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DsC0pK6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790593697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jqiPlK6XEc5gh2PWdsdk23lHEzQktJxdGmzGHlg+k8=;
	b=bhA9gsWl8tMJuKuO5WQ9ykE2VHfVCnsLfHlVExWLoVJictoPWE0qWQcm+EvFxnXpFQ+Dyr
	HTXoV9n8M2InjiZ7FB/27dVjfEHoXjnd/zh6eoAosbhGTIt6VNAjQ7n3mCuOxCi7z6x2jy
	rRquOsU/Kn9ffEVTc7N39KWcqki1YH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790593697;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jqiPlK6XEc5gh2PWdsdk23lHEzQktJxdGmzGHlg+k8=;
	b=DsC0pK6dZ/3LEm59S75qBaDNpt0HJMliK29Et3KbdN5fWAM7pyMjApViPunmMR8Hbl34ko
	AEfGFzDFsCtOZSDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B1078133F1;
	Mon, 28 Sep 2026 11:08:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RuzGIaBKumptKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 11:08:16 +0000
Date: Mon, 28 Sep 2026 13:08:16 +0200
Message-ID: <87bj9h7hwf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com,
	broonie@kernel.org,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Fix struct hdac_bus documentation
In-Reply-To: <20260918111610.3589324-1-cezary.rojewski@intel.com>
References: <20260918111610.3589324-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 23AF5226EE
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Fri, 18 Sep 2026 13:16:10 +0200,
Cezary Rojewski wrote:
> 
> Spelling fix so the description makes sense.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Applied to for-next branch.  Thanks.


Takashi
