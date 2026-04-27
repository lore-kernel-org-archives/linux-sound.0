Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A743101D4
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 11:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290552; cv=none; b=IxgqGmha1XLSGoonl5dPwzwTI3vdDHWZ4WQ+fxQO1J7cpGg0uPxRAwJrE7mdINTdDYIEf/S+xuiXTSOwCsHAo/GRtGyU+mMDSHEHF7WZz9d8Tb75m2r2OfGxGkIMFXb49xE/Nft4tbZYDRIepEKfjXh8yhw1ctIoys7SH/BXWw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290552; c=relaxed/simple;
	bh=aPs9t7S5uWBkvtSUvJho9ZkM7zYr3cmtSHeKY07ACr4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=REGs+RYc6vunQaow4xv8F7eFJjITv6QDyc9HO04aw+sSQ6k68jpf2ubH/UUHf/3B74N6BNNi7ywE4DQfeDnNVQ+Uq49seaLNoymC1cPvuflkGR/3BafRLR6Z0GIZ3ohKvyOmyPege55GZq32LoXkCd+2Uy2vP//PyRhWjf2aO+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u9tZXhmi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5F7E815C; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u9tZXhmi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5F7E815C; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u9tZXhmi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5F7E815C";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u9tZXhmi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5F7E815C"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1651D5BCD3;
	Mon, 27 Apr 2026 11:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777290548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jyWh/1nPDTzXDr48Mt+2DrAPuoCXDfKecpIJHGSU3Ow=;
	b=u9tZXhmiCmWg+iDs0ZilFNi6F0R2uEiGBBpRsly4aOMdxPc9d9qkkNEyhN51Fbz2YVHSuZ
	ApMeRojKM8L2pyCY/2KRTJgtrj9l3bFqWbpOAY0x8plM7QrO5pcIcx9n4M+OaG6O5eozRQ
	R5uWwSnvGg9x8jM6IMjG+r1JumQSC2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777290548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jyWh/1nPDTzXDr48Mt+2DrAPuoCXDfKecpIJHGSU3Ow=;
	b=5F7E815CWYwMqwzjKuYzuviiPd0/goGM2nVhowjUVg8mGceKKV0aETEkXyQvEv5ImmKvza
	PjO9HGCabLej34DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777290548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jyWh/1nPDTzXDr48Mt+2DrAPuoCXDfKecpIJHGSU3Ow=;
	b=u9tZXhmiCmWg+iDs0ZilFNi6F0R2uEiGBBpRsly4aOMdxPc9d9qkkNEyhN51Fbz2YVHSuZ
	ApMeRojKM8L2pyCY/2KRTJgtrj9l3bFqWbpOAY0x8plM7QrO5pcIcx9n4M+OaG6O5eozRQ
	R5uWwSnvGg9x8jM6IMjG+r1JumQSC2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777290548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jyWh/1nPDTzXDr48Mt+2DrAPuoCXDfKecpIJHGSU3Ow=;
	b=5F7E815CWYwMqwzjKuYzuviiPd0/goGM2nVhowjUVg8mGceKKV0aETEkXyQvEv5ImmKvza
	PjO9HGCabLej34DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9274593B0;
	Mon, 27 Apr 2026 11:49:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hbjXJzNN72nBbwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 11:49:07 +0000
Date: Mon, 27 Apr 2026 13:49:07 +0200
Message-ID: <87o6j4zkr0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: cs35l56: Propagate ASP TX source control errors
In-Reply-To: <20260423-alsa-cs35l56-asp-tx-source-errors-v1-1-17ea7c62ec31@gmail.com>
References: <20260423-alsa-cs35l56-asp-tx-source-errors-v1-1-17ea7c62ec31@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO

On Thu, 23 Apr 2026 15:11:31 +0200,
Cássio Gabriel wrote:
> 
> cs35l56_hda_mixer_get() ignores regmap_read() and
> cs35l56_hda_mixer_put() ignores regmap_update_bits_check().
> 
> This makes the ASP TX source controls report success when a regmap
> access fails. The write path returns no change instead of an error,
> and the read path continues after a failed read instead of aborting
> the control callback.
> 
> Propagate the regmap errors, matching the posture and volume controls
> in this driver.
> 
> Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied now.  Thanks.


Takashi
