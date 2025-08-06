Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B7D1A0BFD
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754504510; cv=none; b=oV1PJhBRvCfqT359UGuJNi8KfzbMhlYzYzAvOzhfPcAl/X2BrlrIXuIckb+VGu4hQNs5svzzr6YtDQWJv+wmCjuNDH/t8ciII7P99qF8Htx77mbb9CNLUBkwArQ/4V6Y1mC7+CWkoNSMgnPYu4Q1prmJ30yhwBbhVC826Yh8UvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754504510; c=relaxed/simple;
	bh=Zk2ZtTHqvJTrS+ZkX9n/x+P0MFuQQeD4YV6wwI1iCXY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aajZroBzUdUjqGwBGhpWY81hZGUhXduLMdDzwVwUCJG2nN+7177wvYmszoqLSAP75SEx0Egf05P/WFCigc48iy51tn3p9p/dVijVZ7ZGXFdUwRaYfTglgnLsPEuuUkxpGmDr1VAZFTO2XAh/mmMdu+J7czbZBYlREHIL3G3P/nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OrvmbIpA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bmmIMUXl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OrvmbIpA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bmmIMUXl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OrvmbIpA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bmmIMUXl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OrvmbIpA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bmmIMUXl"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3FA912065F;
	Wed,  6 Aug 2025 18:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754504506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b0fmjtkAecwqd7+oUf8k4SEcD73eAscErBAtrWqq82g=;
	b=OrvmbIpA4Ftl3PeYgzNArM4mS7B9KyeFlBd29SLC5X/QDDz8VgU8g8vkKlaEZQ7W7qH9zs
	vbJ5qRACMQWmTmUJUe3GjrTdLogjDxjXHdO5q3FGEiNNZ2J30QFN69yzLhopYa5ywYi1ss
	KUlqgwj2oFgH0R8dQe9hTicoF6njBYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754504506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b0fmjtkAecwqd7+oUf8k4SEcD73eAscErBAtrWqq82g=;
	b=bmmIMUXlkt10Wo6ImTeU0931fjfa38zoUaW08k2gR5lS3k5jxPjRYcgkvNoWCyNDI07OjV
	iqDCEz7/+r5XiGCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754504506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b0fmjtkAecwqd7+oUf8k4SEcD73eAscErBAtrWqq82g=;
	b=OrvmbIpA4Ftl3PeYgzNArM4mS7B9KyeFlBd29SLC5X/QDDz8VgU8g8vkKlaEZQ7W7qH9zs
	vbJ5qRACMQWmTmUJUe3GjrTdLogjDxjXHdO5q3FGEiNNZ2J30QFN69yzLhopYa5ywYi1ss
	KUlqgwj2oFgH0R8dQe9hTicoF6njBYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754504506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b0fmjtkAecwqd7+oUf8k4SEcD73eAscErBAtrWqq82g=;
	b=bmmIMUXlkt10Wo6ImTeU0931fjfa38zoUaW08k2gR5lS3k5jxPjRYcgkvNoWCyNDI07OjV
	iqDCEz7/+r5XiGCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0CD2413AA8;
	Wed,  6 Aug 2025 18:21:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XqwfATqdk2hFRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 Aug 2025 18:21:46 +0000
Date: Wed, 06 Aug 2025 20:21:45 +0200
Message-ID: <87pld81fba.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.17-merge-window
In-Reply-To: <97abce5e5d42120dc07961f73b548c7d.broonie@kernel.org>
References: <97abce5e5d42120dc07961f73b548c7d.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Wed, 06 Aug 2025 19:14:43 +0200,
Mark Brown wrote:
> 
> The following changes since commit e95122a32e777309412e30dc638dbc88b9036811:
> 
>   ASoC: codecs: Add acpi_match_table for aw88399 driver (2025-07-25 13:44:29 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-merge-window
> 
> for you to fetch changes up to 614d416dd8aee2675fb591c598308a901a660db8:
> 
>   ASoC: SOF: Intel: hda-sdw-bpt: fix SND_SOF_SOF_HDA_SDW_BPT dependencies (2025-08-06 12:02:32 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.17
> 
> This is a relatively small set of fixes and device quirks that came in
> during the merge window, the AMD changes adding support for ACP 7.2
> systems are all just adding IDs for the devices rather than any
> substantial code - the actual code is the same as for prior versions of
> the platform.

Pulled now.  Thanks.


Takashi
