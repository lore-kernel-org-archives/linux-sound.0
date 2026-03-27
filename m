Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A670F3128A3
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774620791; cv=none; b=VuYt4TiXEKyxGolr/vHu/Lu+rfytJ/UpIlkJGugXMDLrEt677B8/u2Uysvyoxw1RNkFH92sqP3177TTC7fqEKc+e+te4QxWyJBveE33jil9BWSR5YPXRHZW2/vNqVY6m0hgrHsmE8gPE3xqi1ZoYjVuII//b+z6Ysjnotl+4eeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774620791; c=relaxed/simple;
	bh=81+sKQK83Oh1RJXPNYUAdQYvmvjO2TDWRd/oCdoRt8w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UJuK8sEeHQGZrYhqMu75kps6S5Xmo/UoRCDcuZbRaOmv88pj8p68b4dgKXmPRt070aVPCLP8ri4jZjxfip+fgSe2PT7Hf97AWA7nAq0ygrUtPz00nDcNA+hDbtw+IEhUvZ45FEcZhzskPyBczsd4UHfEfJr70G1QLRnw7UVKlvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aEfqoJW0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5Z0t7LGw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aEfqoJW0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5Z0t7LGw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aEfqoJW0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Z0t7LGw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aEfqoJW0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Z0t7LGw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CFDA35BDE4;
	Fri, 27 Mar 2026 14:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774620786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LtuyB160qPeJa8KYCBLM5Hi1D3BCuXIw9v66GAIS6k=;
	b=aEfqoJW0MRceA2DXcqlUXbzOpd12z2WDAWIEK+h6tKiFgS5A6MJfJcpq9zC/UdBAdEIrjF
	Zh3gQhkWaRt2AUPd0RQWYjjH4C0UlzJJ04UwJ6A2aVXMteZba4533Fgz7+0rCuCPdDWG0r
	QBMbXRcwsfO5TGXyBxvg3O3lZUeDOlE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774620786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LtuyB160qPeJa8KYCBLM5Hi1D3BCuXIw9v66GAIS6k=;
	b=5Z0t7LGwEBn2xSyq36EZZ61eA7D09P785l5qgNBhSUCF395N2HMYfJb6WzKR6H9wpY9tNX
	JrLgjGojC4TD2HAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774620786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LtuyB160qPeJa8KYCBLM5Hi1D3BCuXIw9v66GAIS6k=;
	b=aEfqoJW0MRceA2DXcqlUXbzOpd12z2WDAWIEK+h6tKiFgS5A6MJfJcpq9zC/UdBAdEIrjF
	Zh3gQhkWaRt2AUPd0RQWYjjH4C0UlzJJ04UwJ6A2aVXMteZba4533Fgz7+0rCuCPdDWG0r
	QBMbXRcwsfO5TGXyBxvg3O3lZUeDOlE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774620786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LtuyB160qPeJa8KYCBLM5Hi1D3BCuXIw9v66GAIS6k=;
	b=5Z0t7LGwEBn2xSyq36EZZ61eA7D09P785l5qgNBhSUCF395N2HMYfJb6WzKR6H9wpY9tNX
	JrLgjGojC4TD2HAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8CD84A0B1;
	Fri, 27 Mar 2026 14:13:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Mm4MKHKQxmnSQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 14:13:06 +0000
Date: Fri, 27 Mar 2026 15:13:06 +0100
Message-ID: <877bqxqs25.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: pcm: Serialize snd_pcm_suspend_all() with open_mutex
In-Reply-To: <20260327-alsa-pcm-suspend-open-close-lock-v2-1-cc4baca4dcd6@gmail.com>
References: <20260327-alsa-pcm-suspend-open-close-lock-v2-1-cc4baca4dcd6@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.23
X-Spam-Level: 
X-Spamd-Result: default: False [-3.23 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.13)[-0.674];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Fri, 27 Mar 2026 14:59:45 +0100,
Cássio Gabriel wrote:
> 
> snd_pcm_suspend_all() walks all PCM substreams and uses a lockless
> runtime check to skip closed streams. It then calls snd_pcm_suspend()
> for each remaining substream and finally runs snd_pcm_sync_stop() in a
> second pass.
> 
> The runtime lifetime is still controlled by pcm->open_mutex in the
> open/release path. That means a concurrent close can clear or free
> substream->runtime after the initial check in snd_pcm_suspend_all(),
> leaving the later suspend or sync-stop path to dereference a stale or
> NULL runtime pointer.
> 
> Serialize snd_pcm_suspend_all() with pcm->open_mutex so the runtime
> pointer stays stable across both loops. This matches the existing PCM
> runtime lifetime rule already used by other core paths that access
> substream->runtime outside the stream lock.
> 
> Suggested-by: Takashi Iwai <tiwai@suse.com>
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
> Changes in v2:
> - Update funtion description (updates kerneldoc).
> - Link to v1: https://lore.kernel.org/r/20260320-alsa-pcm-suspend-open-close-lock-v1-1-b5992a120335@gmail.com

Applied to for-next branch now.  Thanks.


Takashi
