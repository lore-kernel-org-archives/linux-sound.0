Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9BC22E407
	for <linux-sound@vger.kernel.org>; Wed, 15 Jan 2025 07:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736927896; cv=none; b=tcBxOuYAOWW2nwUFo43GpsMZAfjid4avrads8/LptbmgYuq4vK2eLEnzDtfM6PpuG0EWTrS03v+5Oa8tyJJvucdfMsJ90jhRueOWOWG4qkE+DQh/2u36LSFLW6fFQWriLYfsVHbnWR8G5SsoXzFLJ7TCryXGGIwMICUV/waeNiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736927896; c=relaxed/simple;
	bh=5918sD3e9gHaDwFRxaWiWSp4I1TF39GIwFWAK0k5sJY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uqUATG2Y/D8pC4RRRRKtIEI2Y2f6yhFxwjBVXx7/XPYJZyhAR9g94MSwXpXQipe/O7zGkbwz6/RTlqqsJYEheu9oXSXsdp97ROTZwZEotzPRL3BALeOnVTVj+NOI7xgJV8znBC0c5VLkkIXSLBGE+C6VOdc1ZVfaTWLwlszXavA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X/iToGUg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TJ+sUg05; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X/iToGUg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TJ+sUg05; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X/iToGUg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TJ+sUg05";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X/iToGUg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TJ+sUg05"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 423722121C;
	Wed, 15 Jan 2025 07:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736927893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8m/WvhcciwvhOGD/TI/KiG7BiJAIEcTRM3rXzXdlPxU=;
	b=X/iToGUg58ZZTq7Zn0r4xmIeSJjJmAn8kncbKAo6ZOq9u9YWChd+q+h+b71DzUheeO18MU
	pPjW0FnCpAHFKPc51A5f6x2hS2W4+fSOFQRbq7h4GjNk2wor6aCl4EmV1nD/uF0yNdu+ne
	OmL8Nq232AWaB/2vJnHKqvHXkDfaE2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736927893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8m/WvhcciwvhOGD/TI/KiG7BiJAIEcTRM3rXzXdlPxU=;
	b=TJ+sUg05uwK2zadUgX7sxASh43Se3af37csjduqu+gBxXfHgOPYtDtrGPEOrngUd6nMkvS
	YploQktedFP6Y7CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736927893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8m/WvhcciwvhOGD/TI/KiG7BiJAIEcTRM3rXzXdlPxU=;
	b=X/iToGUg58ZZTq7Zn0r4xmIeSJjJmAn8kncbKAo6ZOq9u9YWChd+q+h+b71DzUheeO18MU
	pPjW0FnCpAHFKPc51A5f6x2hS2W4+fSOFQRbq7h4GjNk2wor6aCl4EmV1nD/uF0yNdu+ne
	OmL8Nq232AWaB/2vJnHKqvHXkDfaE2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736927893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8m/WvhcciwvhOGD/TI/KiG7BiJAIEcTRM3rXzXdlPxU=;
	b=TJ+sUg05uwK2zadUgX7sxASh43Se3af37csjduqu+gBxXfHgOPYtDtrGPEOrngUd6nMkvS
	YploQktedFP6Y7CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E385139CB;
	Wed, 15 Jan 2025 07:58:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CgnkAZVqh2cRcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Jan 2025 07:58:13 +0000
Date: Wed, 15 Jan 2025 08:58:12 +0100
Message-ID: <87a5bsld9n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v4] ALSA: hda: Transfer firmware in two chunks
In-Reply-To: <20250114184239.120002-1-cezary.rojewski@intel.com>
References: <20250114184239.120002-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[6]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Tue, 14 Jan 2025 19:42:39 +0100,
Cezary Rojewski wrote:
> 
> As per specification, SDxLVI shall be at least 1 i.e.: two chunks to
> perform a valid transfer. This is true for the PCM transfer code but
> not firmware-transfer one.
> 
> Technical background:
> - the LVI > 0 rule shall be obeyed in PCM transfer
> - HW permits LVI == 0 when transfer is SW-controlled (SPIB)
> - FW download is not a PCM transfer and is SW-controlled (SPIB)
> 
> The above is the fundament which AudioDSP firmware loading functions
> have been built upon and worked since 2016. The presented changes are to
> align the loading flows and avoid rising more questions in the future.
> 
> Achieve the goal by splitting snd_hdac_stream_setup_periods() into
> substream-dependent and -independent part. Let snd_hdac_dsp_prepare()
> utilize the latter so that both DSP-loading and PCM flows utilize same
> BLDE setup loop which already takes care of cutting the buffer based on
> azx_dev->period_bytes.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Applied now.  Thanks.


Takashi
