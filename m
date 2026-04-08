Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555A63B7741
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 11:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775648486; cv=none; b=EQAfhustmFxl6zk81hTOgvUdfEOFLNSjCe0jqffVyn8VwHClbLRYWKMvfwUIy3d+3MPTGLIT7903W8jwzkdBGY0j0F4i9WG02CtMtcQfCIz9CjqiZ7sZ5k8DrfafS8+VSyuGxWWD3jZadL3OEE1RsvSvD119Gkgr1heMIp0nyfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775648486; c=relaxed/simple;
	bh=TMG9/fNi9jRb+irbP1wQM+1VkWhxHPkaXZvja4WZakY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pzho/rxu1WS/4l/9YM5CHF9/8PJuW4SR/dTv8v6l9vFHThvm7RoxB0utk24dbMhP4Fceqar/VokvoyO0oJYGUnIUPditOFNG/+8tCfHN1d/bn0Wr7H1dKKXKA2eYQNKajpJ5Ee7YwYg+IixAsdWborlx8vCb6qDiRHjIHZu+oag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NCkY18P1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wMmWrDDx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NCkY18P1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wMmWrDDx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NCkY18P1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wMmWrDDx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NCkY18P1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wMmWrDDx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 93CE45BCE1;
	Wed,  8 Apr 2026 11:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775648483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VXSQNr91CVe40jvG7ZYNv7XzA/U7xJmaknCtWTFRIdQ=;
	b=NCkY18P12Vc4seAXTbhJPUXXn6Yu22Nc3aaVNBm39hRrKkI5KWBUP82SI95zFlRFos7ue8
	eD/tRZEwtGE1Z1yPCH3amFcmVqRBNfA/3TSa94mW6n32YBPzul4ggIP4DgRyuD9Aroyo9n
	67biJd6M0XWJtve98UD9DtBCiDCc0M8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775648483;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VXSQNr91CVe40jvG7ZYNv7XzA/U7xJmaknCtWTFRIdQ=;
	b=wMmWrDDxbi9hmf5ShoNy8vT39wtY0iqSrUHUualnLehlsyVtukGg4ncWIDx1ITq4X7tsLX
	bP3j+mI+E5FCHQAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NCkY18P1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wMmWrDDx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775648483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VXSQNr91CVe40jvG7ZYNv7XzA/U7xJmaknCtWTFRIdQ=;
	b=NCkY18P12Vc4seAXTbhJPUXXn6Yu22Nc3aaVNBm39hRrKkI5KWBUP82SI95zFlRFos7ue8
	eD/tRZEwtGE1Z1yPCH3amFcmVqRBNfA/3TSa94mW6n32YBPzul4ggIP4DgRyuD9Aroyo9n
	67biJd6M0XWJtve98UD9DtBCiDCc0M8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775648483;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VXSQNr91CVe40jvG7ZYNv7XzA/U7xJmaknCtWTFRIdQ=;
	b=wMmWrDDxbi9hmf5ShoNy8vT39wtY0iqSrUHUualnLehlsyVtukGg4ncWIDx1ITq4X7tsLX
	bP3j+mI+E5FCHQAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3579D4A0B3;
	Wed,  8 Apr 2026 11:41:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T5G7C+M+1mmyOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 Apr 2026 11:41:23 +0000
Date: Wed, 08 Apr 2026 13:41:22 +0200
Message-ID: <87jyuhllwd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	stable@vger.kernel.org,
	liam.r.girdwood@intel.com
Subject: Re: [PATCH for 7.0 0/2] ALSA/SOF Intel: Enforce stricter period size for NVL
In-Reply-To: <20260408084514.24325-1-peter.ujfalusi@linux.intel.com>
References: <20260408084514.24325-1-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,suse.de,vger.kernel.org,linux.dev,intel.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 93CE45BCE1

On Wed, 08 Apr 2026 10:45:12 +0200,
Peter Ujfalusi wrote:
> 
> Hi,
> 
> NVL and NVL-S (ACE4) needs to use stricter period size constraint to
> meet the address alignment for each BDLE buffer (start of each period in
> the continuous ALSA buffer) set in the HDA specification.
> 
> It would be great if these can be sent for 7.0 as last minute if it is
> doable, I left out the Fixes tag from the first patch as that is
> introduced in 7.0.

Mark, shall I pick up both patches to my tree for the next PR (planned
for tomorrow or on Friday)?
Basically both patches are independent, and I can apply the first one
in anyway.


thanks,

Takashi

> 
> Regards
> Peter
> ---
> Kai Vehmanen (2):
>   ALSA: hda/intel: enforce stricter period-size alignment for Intel NVL
>   ASoC: SOF: Intel: hda: modify period size constraints for ACE4
> 
>  sound/hda/controllers/intel.c |  7 +++++--
>  sound/soc/sof/intel/hda-pcm.c | 14 ++++++++++++--
>  2 files changed, 17 insertions(+), 4 deletions(-)
> 
> -- 
> 2.53.0
> 
