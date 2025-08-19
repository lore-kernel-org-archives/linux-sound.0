Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2E5254B1B
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 09:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755595915; cv=none; b=a86aLjT4xYawBz4Uff2cCo0tieQQpaMpSjWiveBLUuuzBWFKlb+NcI51K6tcfipmfR/A8Non/SPapJkwnH7UB5iatTEO84ZDa4NkHMjZF7q5EVfx35++vNFRHU0meTPNs30OZZkksuW2Qgy/Sy6ZB6Sy5JHsNFNyk1MYMIouPUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755595915; c=relaxed/simple;
	bh=ntTUiuTFO9kzVzbgPWBohAMOJWAmigeURkZvbEcT4PQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HVLeSzrSzXfcBVuWnhObdIf9pGg/8yMJzD5LKrPmYQGSlba9x89iHL21vT+cfNFcCaHd2s9HnDFdBGDLKyMDEG9rs0JJeiKWsO7E0CckfDv92iDW3wk9F5zEi1rqsk1E6+ixJrbaycDb8SFMdFBjxMX5J5hv/OZCllP/ogrCo0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RhDrtTUS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ifq8Tc1l; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RhDrtTUS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ifq8Tc1l; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RhDrtTUS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ifq8Tc1l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RhDrtTUS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ifq8Tc1l"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CFF8C1F785;
	Tue, 19 Aug 2025 09:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755595911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzPfgd2lt4J7fPTHeWDtQnnzyX/xppMs0Znex3xXsXs=;
	b=RhDrtTUSCvuT/Y00ht/Ag1K7fF2W1f4+bX/7uHp61qh+ni8oE6e6cMWka3pCUaPVCPUaU9
	FvSd8wdRL3txQIPwsKJWOkDFbcYC0H/aNYaL4GDBliqvfL3V4SfjgFPrwFGyCH8Gu0v3k/
	dV05xqpA5YYB2XWuapY4ftgNp8VkMZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755595911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzPfgd2lt4J7fPTHeWDtQnnzyX/xppMs0Znex3xXsXs=;
	b=Ifq8Tc1lxFjxVvEWbIGd8LKBbH+VqjXsDz4Z3bNUM+gnp6WQjb/y3DM+NfjvTzqhJmW/Ix
	Bm6m6NmvwP8Dm9Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755595911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzPfgd2lt4J7fPTHeWDtQnnzyX/xppMs0Znex3xXsXs=;
	b=RhDrtTUSCvuT/Y00ht/Ag1K7fF2W1f4+bX/7uHp61qh+ni8oE6e6cMWka3pCUaPVCPUaU9
	FvSd8wdRL3txQIPwsKJWOkDFbcYC0H/aNYaL4GDBliqvfL3V4SfjgFPrwFGyCH8Gu0v3k/
	dV05xqpA5YYB2XWuapY4ftgNp8VkMZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755595911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzPfgd2lt4J7fPTHeWDtQnnzyX/xppMs0Znex3xXsXs=;
	b=Ifq8Tc1lxFjxVvEWbIGd8LKBbH+VqjXsDz4Z3bNUM+gnp6WQjb/y3DM+NfjvTzqhJmW/Ix
	Bm6m6NmvwP8Dm9Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5EBA13686;
	Tue, 19 Aug 2025 09:31:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UQ3gK4dEpGidRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 Aug 2025 09:31:51 +0000
Date: Tue, 19 Aug 2025 11:31:51 +0200
Message-ID: <87h5y3verc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?=A9erif?= Rami <ramiserifpersia@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ALSA: usb-audio: us144mkii: Use le16_to_cpu() for product ID comparison
In-Reply-To: <20250819075118.9221-1-ramiserifpersia@gmail.com>
References: <20250819075118.9221-1-ramiserifpersia@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
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
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Tue, 19 Aug 2025 09:51:17 +0200,
©erif Rami wrote:
> 
> The `us144mkii.c` driver was generating sparse warnings due to direct
> comparisons of `dev->descriptor.idProduct` (a `__le16` type) with
> integer constants. This commit resolves these warnings by explicitly
> converting `idProduct` to a CPU-endian integer using `le16_to_cpu()`
> before comparison.
> 
> This ensures correct handling of endianness and eliminates the sparse
> warnings:
> - `restricted __le16 degrades to integer`
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508190811.tjQJZI1X-lkp@intel.com/
> Signed-off-by: ©erif Rami <ramiserifpersia@gmail.com>

Thanks, I applied now with Fixes tag.


Takashi
