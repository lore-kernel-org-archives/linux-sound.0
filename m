Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AA31DEFE9
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 08:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765786832; cv=none; b=I4JpA3A/AeU4qX6t3KMEfYyw3omm4NNmZjll+kiT01+fASsvTBY0kJtFDXfU/dUWTRlnZX1+yYU2zjoMEBjuz9eN4ENPIlAKTeoxdM65cwhTJwL9T3ev84HTC+nue7TbXeTC8RDK3rtvgDcdwSc4avEV/o22uoVrTOpwBAWlnjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765786832; c=relaxed/simple;
	bh=WkHX4gH70eM5lopMMMiNTuhlvOvT1ZsKDsNwm6oqgHo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kn6c+vKrlNl36fUaY9jIZkhBJlbCFTAgG6gYhcVhhc/QkbaS3JVdlTRtTi+zjk/YJBYSzHqzA4veCWRV9rk2kNzPDrHpxv03UewKnjD1Q1/ketWTW3rdhya1a+LvKfILr3YVgNvXgZ5thVuUnkTiEGnWMbdwxUYSLj0BLqnGUZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TRfNYm6c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rokonRtq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dXkF1LiI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4kycAA8r; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TRfNYm6c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rokonRtq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dXkF1LiI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4kycAA8r"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2771F5BD16;
	Mon, 15 Dec 2025 08:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765786826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2HzkrZfuYCJ5RiG/9edG/apmG6suECKTkflKptgt/Ng=;
	b=TRfNYm6cMQJh0M4tFSqWAtzyWnUYHwYYUMkazjcT95367ZUOngeaT3tb5P9AD9EqRJnZeV
	OqeSPtTO+w5NtlVJ79Rp+E1BVQ3isVHqgnWn58fcyXMZNUWwlcIPt/XFe4FVmltOusBVgt
	7vljtXpebo9F7UuqgR73HfzpPS2alkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765786826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2HzkrZfuYCJ5RiG/9edG/apmG6suECKTkflKptgt/Ng=;
	b=rokonRtq0XgZL7lHtJETJumpqmqzkq0p1JEP5p2u0eq8+hAt4vCpMTQGVr7/aXlLMY4wlg
	NTe24fYYNWgyE8Cg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dXkF1LiI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4kycAA8r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765786825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2HzkrZfuYCJ5RiG/9edG/apmG6suECKTkflKptgt/Ng=;
	b=dXkF1LiIJb+ZNGhAPBsQNTsDQW+cOlThRsKLNNPSjLLGTOblhutNlTY607xcD+e9X0CXp+
	WeJTyqk1kjOLzIpcTORYugQwmbDyySq0dswhOEnZ049t41nRxMOXU8Pr/o85ApaMhdSvlq
	ifSG3PtKPronPdGpHu7Rrj4YKq2Mvbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765786825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2HzkrZfuYCJ5RiG/9edG/apmG6suECKTkflKptgt/Ng=;
	b=4kycAA8rMz3/3PHF1vcNlQzipKEpcmQy2pf/rdoa78efsTbJQljSKQrugisT73XbgleLtZ
	JOBOezbENts1PQCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF7063EA63;
	Mon, 15 Dec 2025 08:20:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +TcsOcjEP2naTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 15 Dec 2025 08:20:24 +0000
Date: Mon, 15 Dec 2025 09:20:24 +0100
Message-ID: <87v7i86trr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: vxpocket: Fix resource leak in vxpocket_probe error path
In-Reply-To: <20251215042652.695-1-vulab@iscas.ac.cn>
References: <20251215042652.695-1-vulab@iscas.ac.cn>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 2771F5BD16
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 15 Dec 2025 05:26:52 +0100,
Haotian Zhang wrote:
> 
> When vxpocket_config() fails, vxpocket_probe() returns the error code
> directly without freeing the sound card resources allocated by
> snd_card_new(), which leads to a memory leak.
> 
> Add proper error handling to free the sound card and clear the
> allocation bit when vxpocket_config() fails.
> 
> Fixes: 15b99ac17295 ("[PATCH] pcmcia: add return value to _config() functions")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Applied now.  Thanks.

I guess a similar bug is present in
sound/pcmcia/pdaudiocf/pdaudiocf.c, too.
Care to fix it as well? ;)


Takashi
