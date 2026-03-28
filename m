Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7D531B837
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 08:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774688380; cv=none; b=lgaBe5f2vR0bDKVvi3YbkqkdU6UnslzWiMGCvzV0y4x3mqlPy+sBMQjzN78dg7OSJHBxIQY9UgJVoXDe5KX0FWfV/EWx8WEjHogcwcR+9vXjw9cZsi27zLdlefAO1czPopRV+Qqu57aRsKBc605WN4mos0sNVcjXaNGmQKbBAdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774688380; c=relaxed/simple;
	bh=wfGGJnrtFIK9qAOrtT0AZsYZMqy5rCRffZFwP7RZHjI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NNg8BGLC6kGRKD3MVanpjRcOZCZmWr5IWP05QqJ2vTxnEpg+kyMblldPrsZmBHMMXrFN5KpETyaFFFz48RbGCcO+DD8gwk/OAI7P40RZmKD9WmIGO33Ex1qFczNihI8NyW5vr9wwQKXV9dSI0YF5TbqLsDQnoN9inH/jkFjNa4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NmKvMysf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AAWkeLGI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NmKvMysf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AAWkeLGI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NmKvMysf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AAWkeLGI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NmKvMysf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AAWkeLGI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6C1695BDB1;
	Sat, 28 Mar 2026 08:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774688377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0AiNqSe9WK2JO/23F84AMCJBsjGGDloq5/5VNUmly/8=;
	b=NmKvMysfD48p/TIyLvGYEpYFiVOUcH9BZrd9L4nKhMA7DGe5/6v8xpzSWmlB71gsRUeTmk
	yxTIUjf1efNhFHMDAMaPQfke4dqUuxNG1aUA+m89ZgtJisl+LOInY3B4kBAH5HgihopMAM
	AA0cGdhqZG6em8L1opGyzxCcnCYVZjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774688377;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0AiNqSe9WK2JO/23F84AMCJBsjGGDloq5/5VNUmly/8=;
	b=AAWkeLGIroMYC+nRB19/kKpzQ/ApzlTRslSFOkW4MyEjPauHMg2gzn9OLBuJaba4lAbKHK
	HIMSTDnmv5Fx07AA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NmKvMysf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AAWkeLGI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774688377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0AiNqSe9WK2JO/23F84AMCJBsjGGDloq5/5VNUmly/8=;
	b=NmKvMysfD48p/TIyLvGYEpYFiVOUcH9BZrd9L4nKhMA7DGe5/6v8xpzSWmlB71gsRUeTmk
	yxTIUjf1efNhFHMDAMaPQfke4dqUuxNG1aUA+m89ZgtJisl+LOInY3B4kBAH5HgihopMAM
	AA0cGdhqZG6em8L1opGyzxCcnCYVZjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774688377;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0AiNqSe9WK2JO/23F84AMCJBsjGGDloq5/5VNUmly/8=;
	b=AAWkeLGIroMYC+nRB19/kKpzQ/ApzlTRslSFOkW4MyEjPauHMg2gzn9OLBuJaba4lAbKHK
	HIMSTDnmv5Fx07AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 399574A0A3;
	Sat, 28 Mar 2026 08:59:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uTbDDHmYx2k2EQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 28 Mar 2026 08:59:37 +0000
Date: Sat, 28 Mar 2026 09:59:36 +0100
Message-ID: <87ecl4wcqv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Phil Willoughby <willerz@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Yue Wang <yuleopen@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2] ALSA: usb-audio: Fix quirk flags for NeuralDSP Quad Cortex
In-Reply-To: <20260328080921.3310-1-willerz@gmail.com>
References: <20260328080921.3310-1-willerz@gmail.com>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.com:email]
X-Rspamd-Queue-Id: 6C1695BDB1
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Sat, 28 Mar 2026 09:07:34 +0100,
Phil Willoughby wrote:
> 
> The NeuralDSP Quad Cortex does not support DSD playback. We need
> this product-specific entry with zero quirks because otherwise it
> falls through to the vendor-specific entry which marks it as
> supporting DSD playback.
> 
> Cc: Yue Wang <yuleopen@gmail.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Signed-off-by: Phil Willoughby <willerz@gmail.com>

Applied now.  Thanks.


Takashi
