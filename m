Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B2D1E1A3B
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 06:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754460231; cv=none; b=uGCvgSxArCfnCKn3J08RkpRAieUf3fMgQVVMIoPh6o2F2dqbAyZCeGOmTwaqJDwJky8wUNQG+/OKkIVt/CqbgSogYIgxDW6uAj8miokA2yeHb7c3RJ/LPqZ9Mud2oazvE7dljgOQdtsx0OuSKcCH6MuNkGoOGNNd/0ZTrVjAxHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754460231; c=relaxed/simple;
	bh=e2msHwlFYRouZRxAqe3ltQ8g6qHBzNqDLkerXhQOkpE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K+KWCwranXZWSw7BpU6CMx0aKbpMc6TZZ7A27TsXIQmfnFoCs8o4EE5TVunr7nSj2+AU6xjPqeV6pbKbqxFX6P6HaRZQLaHBQogZx5pFqIHc+2o4QAqRkTgOojUdBB0BfX+uGUGmAUTsurm3TpTNz2CiOGZkeiRrJkWEnbBdzjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ypjr/18T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4RwLqGNl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fAwcgvi4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vGWHRAY9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ypjr/18T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4RwLqGNl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fAwcgvi4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vGWHRAY9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 28D5D1F393;
	Wed,  6 Aug 2025 06:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754460221; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IjZE9wwxw6BCjITPoKrGX8JutzOLwFdJDZI4E93oHt0=;
	b=ypjr/18TEIBYVFUKsF+2ojNqOzZLRkjmgBLl9MwqGDBulpiT5kE04sa6tfN9zGyeml0ywk
	bEKGYMAKFp51XLrG/0yvMkU2RtXNMylYRvS75G1crutFuoMQ7HVOaPRkmVKqdyox1MIOYi
	mK1OoxQfIYJI4GfdO7jESbZP4bZA4yI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754460221;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IjZE9wwxw6BCjITPoKrGX8JutzOLwFdJDZI4E93oHt0=;
	b=4RwLqGNllWsOuX7EIgm+MTiPpxZ5oXJNbTC9Z1Dk6A/26yRCK8MFJGgNHE33wrQXJ2AJe1
	UbIbY4C7K0DxKeBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754460220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IjZE9wwxw6BCjITPoKrGX8JutzOLwFdJDZI4E93oHt0=;
	b=fAwcgvi4UH4ffj87+nHqznEGMSTky38l4DCCERgn0VsFruiAgQF/W/Z/atjnkH+8mbvcaX
	qCpDQgdSci8l1T+nnefOnKYtuWuHd5GOacC1CP5g+S/Z6pe61deyiV46MddEU0iHBIM12h
	UEu8CJdfQ6iWDA3tiKbObi7hUNURonw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754460220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IjZE9wwxw6BCjITPoKrGX8JutzOLwFdJDZI4E93oHt0=;
	b=vGWHRAY9FcNH3fjICSH5Ha0jJYtCSkBW0pp12hVwt7pbMVnDqIHxd0J/W/FdS+B+ItoctL
	pjOizGhO+obXkyCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D60D313AB5;
	Wed,  6 Aug 2025 06:03:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /C3PMjvwkmhdWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 Aug 2025 06:03:39 +0000
Date: Wed, 06 Aug 2025 08:03:39 +0200
Message-ID: <87jz3hrnpg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Joe Perches <joe@perches.com>,
	Mark Brown <broonie@kernel.org>,
	stable@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: intel_hdmi: Fix off-by-one error in __hdmi_lpe_audio_probe()
In-Reply-To: <20250805234156.60294-1-thorsten.blum@linux.dev>
References: <20250805234156.60294-1-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid,linux.dev:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Wed, 06 Aug 2025 01:41:53 +0200,
Thorsten Blum wrote:
> 
> In __hdmi_lpe_audio_probe(), strscpy() is incorrectly called with the
> length of the source string (excluding the NUL terminator) rather than
> the size of the destination buffer. This results in one character less
> being copied from 'card->shortname' to 'pcm->name'.
> 
> Use the destination buffer size instead to ensure the card name is
> copied correctly.
> 
> Cc: stable@vger.kernel.org
> Fixes: 75b1a8f9d62e ("ALSA: Convert strlcpy to strscpy when return value is unused")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Changes in v2:
> - Use three parameter variant of strscpy() for backporting as suggested
>   by Sakari Ailus <sakari.ailus@linux.intel.com>
> - Link to v1: https://lore.kernel.org/lkml/20250805190809.31150-1-thorsten.blum@linux.dev/

Applied now.  Thanks.


Takashi
