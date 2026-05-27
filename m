Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5073829BDBB
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 05:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779859762; cv=none; b=g6skCW0FcE5hQ/oLXaVC4NpngKwx9wjW71t9yJ69Wr1SBlb3t+UxfaipUakbiWlHPz7NEcxU8bp0Mt3OaM3o1ML2AfG38HFevcz+8DFUQREAyIvmLoE8VBMMg38wr9dQmLvxpq019V4buG5BbTM4lCqhNJRz40NbzfVuRcpenM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779859762; c=relaxed/simple;
	bh=PLHJJxmSkpDNFH43nZx6lAe8QfwvQbuzPnIQsQzUCfc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MDzxsGC221rcAj64lrBJLCPpWi6xGLmua5Jiq2fGag07Xm3uTOvDO4NO4VBeQC965wzElae5MUUhXGcHwwl9pRtlqQ6uz7ZbPsSCHUZ3Ekb1wd9BHwyUjifIdcyl0r+tBin68/B2MxAEVJ6ZfyyhQKau40Tf9Qt3zAwSV/Ou9ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hWxMEwfm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/c9o9AeZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hWxMEwfm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/c9o9AeZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hWxMEwfm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/c9o9AeZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hWxMEwfm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/c9o9AeZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 513BB6B16B;
	Wed, 27 May 2026 05:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779859759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svuX77SW8vnbvuY432YXCcgyEAAoT9OnatmzUJsU5Pk=;
	b=hWxMEwfmpqMqKDMjXAi52ezDrZCFmGq8YvEz6dwU7w3z6No1nM0gIJpp8cNEwRmlPlz83r
	y3SwZqzfiu74rXVgK4K7ae0pVwtLeXBwr/1bzfQ6qs1HPRMrKcqUbAO+roq8rIC/k6lIVO
	nHfFonC9cV9Z5kM2yDmYlk70Iz1noJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779859759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svuX77SW8vnbvuY432YXCcgyEAAoT9OnatmzUJsU5Pk=;
	b=/c9o9AeZx/AgzOkNrdfyls5JuD0cV+Xo7TSwUxhCRyyZrMIKWJwdWkWqNfFDbC9nnWed+Y
	Zk+hBmRZXb1sZ+Dg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hWxMEwfm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/c9o9AeZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779859759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svuX77SW8vnbvuY432YXCcgyEAAoT9OnatmzUJsU5Pk=;
	b=hWxMEwfmpqMqKDMjXAi52ezDrZCFmGq8YvEz6dwU7w3z6No1nM0gIJpp8cNEwRmlPlz83r
	y3SwZqzfiu74rXVgK4K7ae0pVwtLeXBwr/1bzfQ6qs1HPRMrKcqUbAO+roq8rIC/k6lIVO
	nHfFonC9cV9Z5kM2yDmYlk70Iz1noJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779859759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svuX77SW8vnbvuY432YXCcgyEAAoT9OnatmzUJsU5Pk=;
	b=/c9o9AeZx/AgzOkNrdfyls5JuD0cV+Xo7TSwUxhCRyyZrMIKWJwdWkWqNfFDbC9nnWed+Y
	Zk+hBmRZXb1sZ+Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 18F825A669;
	Wed, 27 May 2026 05:29:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bW+UBC+BFmqDJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 May 2026 05:29:19 +0000
Date: Wed, 27 May 2026 07:29:18 +0200
Message-ID: <87y0h5whch.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Jaroslav Kysela <perex@perex.cz>,
	xen-devel@lists.xenproject.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: xen-front: Fix event channel stream lifetime bugs
In-Reply-To: <20260526-alsa-xen-event-channel-fixes-v1-0-91d3a6a50778@gmail.com>
References: <20260526-alsa-xen-event-channel-fixes-v1-0-91d3a6a50778@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 513BB6B16B
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]

On Tue, 26 May 2026 14:48:25 +0200,
Cássio Gabriel wrote:
> 
> Fix two related event-channel issues in the Xen ALSA frontend.
> 
> The first patch resets the event channel's expected incoming event
> id when a stream is cleared, and drops stale queued events from
> the previous stream instance.
> 
> The second patch keeps the request channel connected from .open(),
> where it is needed for hw-rule queries and stream open requests,
> but delays the event channel until after a successful .prepare().
> This prevents current-position events from reaching the ALSA position
> handler before runtime buffer and period geometry are valid.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
> Cássio Gabriel (2):
>       ALSA: xen-front: Reset event channel state on stream clear
>       ALSA: xen-front: Connect event channel after stream prepare

Applied both patches now to for-next branch.  Thanks.


Takashi
