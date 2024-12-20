Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2065E1A3AB8;
	Fri, 20 Dec 2024 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734684616; cv=none; b=UAYo4cZ1K77bkwWFixCYQz7ILkujjpSH7PUPcdWoPfS7sP7YyCzM7MHzAD+LxuiBUB19A4Xzw/Sgu6lv03xQFHySJ2bnF1vjowjwrbJCTD5KdUpSrHwYI8r0mjxtZPrSyX7H4FoPuWWzo5Qx9dwAU+H9HuL9nRjkopncb25S0SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734684616; c=relaxed/simple;
	bh=YWx8+XlVNZ1d20bZ7IP8TCMOp1ztXZ8SzY8r60lRDk0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dUHV4z59ICLfr5z/vpd7tgY0c/rCzenwWu5WIxgMtv9ZAa8ZRTTm3lGfkiH20eGsoBjkFbdIh6ZwjjCmGVuaexlCcRmu0fwMXbXS33PkKmN1RJWZjemeGPaVrqGahbZMyW2tkdtW8CWTNQhxft1ExCTlNBSilKyaZlCcWCgYYKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NfLOdIEX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8II2EwQ9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NfLOdIEX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8II2EwQ9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NfLOdIEX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8II2EwQ9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NfLOdIEX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8II2EwQ9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 341C721137;
	Fri, 20 Dec 2024 08:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734684612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ye4Ge4tDiwwPSDgrWSAvNNyLpRL05IPYpAA8fXZLTuM=;
	b=NfLOdIEXZ3b5wpQdmGtTNjIwPHdjyraTiU/GAmDg49BN0SklpVbtb8KLjqRtkLQQavRUoo
	TEUkxToYF/B9U3ntsz6c7TWmaiXPb6TNAee0tutlXTGZxuYgaMgo1/yBSWNMDkbijQBpul
	uPaQNrBi9hhILG3FcE2Z6UmsJz/wxkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734684612;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ye4Ge4tDiwwPSDgrWSAvNNyLpRL05IPYpAA8fXZLTuM=;
	b=8II2EwQ93htGrCZjfpzJNAZLtpyJM/3iQsc1t/s2cb+yMNdx4yHnei/tC4iieLHPwkb3hG
	TS+spdl3WNyC+TDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734684612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ye4Ge4tDiwwPSDgrWSAvNNyLpRL05IPYpAA8fXZLTuM=;
	b=NfLOdIEXZ3b5wpQdmGtTNjIwPHdjyraTiU/GAmDg49BN0SklpVbtb8KLjqRtkLQQavRUoo
	TEUkxToYF/B9U3ntsz6c7TWmaiXPb6TNAee0tutlXTGZxuYgaMgo1/yBSWNMDkbijQBpul
	uPaQNrBi9hhILG3FcE2Z6UmsJz/wxkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734684612;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ye4Ge4tDiwwPSDgrWSAvNNyLpRL05IPYpAA8fXZLTuM=;
	b=8II2EwQ93htGrCZjfpzJNAZLtpyJM/3iQsc1t/s2cb+yMNdx4yHnei/tC4iieLHPwkb3hG
	TS+spdl3WNyC+TDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 727FB13A63;
	Fri, 20 Dec 2024 08:50:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DEbKF8MvZWfWagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Dec 2024 08:50:11 +0000
Date: Fri, 20 Dec 2024 09:50:06 +0100
Message-ID: <87cyhmrb5t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Arnd Bergmann <arnd@arndb.de>,	Yu
 Jiaoliang <yujiaoliang@vivo.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: compress_offload: import DMA_BUF namespace
In-Reply-To: <20241216093410.377112-1-arnd@kernel.org>
References: <20241216093410.377112-1-arnd@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 16 Dec 2024 10:33:40 +0100,
Arnd Bergmann wrote:
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The compression offload code cannot be in a loadable module unless it
> imports that namespace:
> 
> ERROR: modpost: module snd-compress uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
> ERROR: modpost: module snd-compress uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
> ERROR: modpost: module snd-compress uses symbol dma_buf_fd from namespace DMA_BUF, but does not import it.
> 
> Fixes: 04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Sorry for the delay, as I've been (still) off.
Applied both patches now.  Thanks!


Takashi
