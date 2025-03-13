Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9462AD22
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 06:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741849048; cv=none; b=h0qEDNAAmTu5jomI2n0TpFOnJnpBNy83VEBZFAhaZZrWksFRAW+hrcFLMR7Icq1KDa3+PuVYqLsUoVhl2V+RM/2KCgqg1+x1m2FmIDv2ilw0xRQCgyE5xzikX+BALFQTOjYVGF4rvJV5t3FvZ/vcFnCLdZwDEQ9VdomdfIDw79E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741849048; c=relaxed/simple;
	bh=RyzX0gqeNI4pWmr6/VdoInZ+dlZM318ZYcc1JnRbd2I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MxpL4xgEPrYvvd6TZHVaeeXkhsKJPbu2LI5u6A1zHDHOGv8ATA4fLU6Wq09fN2MZZiTlbOE9sT0CjSkiXG190ZjZnpposbEvppus7oeKR8zL+rpHvhN39Id5kDKdm/hXtTQrePSZEcYM28w9obziXzzD3sl3KOxK1rEvJI4QCbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CENqAGom; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1ghLI7Ir; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CENqAGom; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1ghLI7Ir; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CENqAGom";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1ghLI7Ir";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CENqAGom";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1ghLI7Ir"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 383A021193;
	Thu, 13 Mar 2025 06:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741849044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2yySvAzL35jEYrk+KYZ/qRhD+Mdd7XYQh/Qld9fWks=;
	b=CENqAGomiNOp5irRFGX2vMycpjJtFekrdIiU6glwmbMr64pWS0KJ19VcQ9p9oIxuRayzNj
	pp7fEE6BVPzan9o6c+pWjMxo6jNgebyJVrFXaKf8xvJak5qrrnSDRR92C3jzwJf8No1sKD
	vS0M4zRZ+SEjkoHp50OoIuNv840z3Wk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741849044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2yySvAzL35jEYrk+KYZ/qRhD+Mdd7XYQh/Qld9fWks=;
	b=1ghLI7IrYA6lXBD17S3Ecuz0Z7mC6R9+8+HEdQqd/SgiXwzwXil7dxgahP0ScJnyhbs9AB
	XJXt652weEIsVBDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741849044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2yySvAzL35jEYrk+KYZ/qRhD+Mdd7XYQh/Qld9fWks=;
	b=CENqAGomiNOp5irRFGX2vMycpjJtFekrdIiU6glwmbMr64pWS0KJ19VcQ9p9oIxuRayzNj
	pp7fEE6BVPzan9o6c+pWjMxo6jNgebyJVrFXaKf8xvJak5qrrnSDRR92C3jzwJf8No1sKD
	vS0M4zRZ+SEjkoHp50OoIuNv840z3Wk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741849044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2yySvAzL35jEYrk+KYZ/qRhD+Mdd7XYQh/Qld9fWks=;
	b=1ghLI7IrYA6lXBD17S3Ecuz0Z7mC6R9+8+HEdQqd/SgiXwzwXil7dxgahP0ScJnyhbs9AB
	XJXt652weEIsVBDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12ECC13797;
	Thu, 13 Mar 2025 06:57:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7e9lA9SB0mdsCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 06:57:24 +0000
Date: Thu, 13 Mar 2025 07:57:23 +0100
Message-ID: <87plilxvsc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.14-rc6
In-Reply-To: <4a8fded6716eb0c56b8d3ce2c862df33.broonie@kernel.org>
References: <4a8fded6716eb0c56b8d3ce2c862df33.broonie@kernel.org>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Thu, 13 Mar 2025 00:03:17 +0100,
Mark Brown wrote:
> 
> The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:
> 
>   Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc6
> 
> for you to fetch changes up to 658fb7fe8e7f4014ea17a4da0e0c1d9bc319fa35:
> 
>   ASoC: cs42l43: convert to SYSTEM_SLEEP_PM_OPS (2025-03-12 16:12:24 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.14
> 
> The bulk of this is driver specific fixes, mostly unremarkable.  There's
> also one core fix from Charles, fixing up confusion around the limiting
> of maximum control values.

Pulled now.  Thanks.


Takashi
