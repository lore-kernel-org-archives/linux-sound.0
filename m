Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8674A21CC5A
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 14:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775831824; cv=none; b=cR1WvlOH43M4QnBdC+yZrfPKuSiC+hhEgNkUSfuxtmfhdjkw1y/RpWCJ69vmXWft/JWgw8Cwmr22hrD7MLPPoKJ2eaze0rCUgXZ+ardKq7RgMaSBRs+0+uSx7SKs/CDGChTayEwZQE836im2gjsXip7AlWr/7LamM8aORr58uGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775831824; c=relaxed/simple;
	bh=gJhtv/OAQ1uPvdtOzqKH00TVUfLtvf5PQ3kEEwliOP0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CDG2SWKUAOpcpUUtSrX0JAFJMrlYFU6jyxliChA9qRh8T2NK3/dLhuIVJEnqsBs+zosp1mP47jB9dnC3k+YqeY3TmiTH2+RaVTm0c7PE9rZbkMBbx1jgsjVbQ8Pk0cpeiX5NSiG8LaIy0ygWbDL16Gl/Tu9speIvFJPTvuy0XD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M4xb7Eru; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sHs/KipL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M4xb7Eru; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sHs/KipL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M4xb7Eru";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sHs/KipL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M4xb7Eru";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sHs/KipL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C7B785BCD5;
	Fri, 10 Apr 2026 14:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775831821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9uku6XStpVgbu5ta6/txn+YujhayIjSzOITeRgusdM4=;
	b=M4xb7EruRpqQAYnRsenUIoy7JBN3iXz1yWJQ7hjOBu3UxebrwNIZ1lddQFDycvFRHxuEWx
	91VuFQap8Tlve/HnADTa7V6sDn5qbaTZa9KOPIjQsM7EBPCk6/ZmhhrPD7OG02QbIfvSa/
	Z2J1OE/aehOH5EaMmpi50LkTBnEzmHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775831821;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9uku6XStpVgbu5ta6/txn+YujhayIjSzOITeRgusdM4=;
	b=sHs/KipL5LN5669MOzKtcja26Q1UAfEda1A3CMTQ9dyVaxeZFN2dYeHpvnYLevAcC2Yvvt
	9Getg97HS0+0ASAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775831821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9uku6XStpVgbu5ta6/txn+YujhayIjSzOITeRgusdM4=;
	b=M4xb7EruRpqQAYnRsenUIoy7JBN3iXz1yWJQ7hjOBu3UxebrwNIZ1lddQFDycvFRHxuEWx
	91VuFQap8Tlve/HnADTa7V6sDn5qbaTZa9KOPIjQsM7EBPCk6/ZmhhrPD7OG02QbIfvSa/
	Z2J1OE/aehOH5EaMmpi50LkTBnEzmHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775831821;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9uku6XStpVgbu5ta6/txn+YujhayIjSzOITeRgusdM4=;
	b=sHs/KipL5LN5669MOzKtcja26Q1UAfEda1A3CMTQ9dyVaxeZFN2dYeHpvnYLevAcC2Yvvt
	9Getg97HS0+0ASAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98A164A0B2;
	Fri, 10 Apr 2026 14:37:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Sv0cJA0L2WlUcAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Apr 2026 14:37:01 +0000
Date: Fri, 10 Apr 2026 16:37:01 +0200
Message-ID: <87ldeug9v6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ALSA: interwave: guard PM-only restore helpers with CONFIG_PM
In-Reply-To: <20260410-alsa-interwave-pm-warning-fix-v1-1-434d14c9c262@gmail.com>
References: <20260410-alsa-interwave-pm-warning-fix-v1-1-434d14c9c262@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 10 Apr 2026 15:56:52 +0200,
Cássio Gabriel wrote:
> 
> The InterWave PM patch added snd_interwave_restore_regs() and
> snd_interwave_restore_memory() as static helpers, but both are used only
> from the resume path under CONFIG_PM.
> 
> On configurations without CONFIG_PM, such as alpha allyesconfig, this
> leaves both helpers unused and triggers -Wunused-function warnings with
> W=1.
> 
> Move the PM-only helpers into the existing CONFIG_PM section. Keep
> __snd_interwave_restore_regs() outside the guard because it is also used
> during probe-time initialization.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604101958.x16oNkfo-lkp@intel.com/
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied now.  Thanks.


Takashi
