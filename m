Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFAA386C17
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 06:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775803066; cv=none; b=Y5j2CdCoZRHbCv8Qv9PDqPyt1hc+dnyVBTNFdwYyicpAwswr5KCWvU7K2UAl8lRQtTATqM9IBVyZisLhyP+PbYkfmKcMpuZ/6upOW4meRsRm8wUBHWgoiomPCNVAUeIN3rRFbaCAeTPuU8SMAF9zn5TBNCmHm29ZNXUhqnQ6SDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775803066; c=relaxed/simple;
	bh=x4xjrqyX6jGyur8cEsXawJNLSSIR6QJ7U2Pgi+biDRE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oo206QqhWixh3L24ZuJJJFz/gerCXSzxYTL7a5T022HijCdLEX6lrPku8WcWIzuVqg5LrzX4E9qc8pdemZ1N3EZ6NwnENhcqiMbctI9K98yeCqf8zl3YJq3vYa/DdqopiCMU/aAXCBOGuTcZ0y8WDq4rFQoaOpZu6EPGNkjoU/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=krTaewHQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d1OP2E4Q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=krTaewHQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d1OP2E4Q; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="krTaewHQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d1OP2E4Q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="krTaewHQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d1OP2E4Q"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 84C416A7DF;
	Fri, 10 Apr 2026 06:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775803063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rb9t3QZIuSzscdipRK1n3ddHqdMDyDb6F7pF69QnaeI=;
	b=krTaewHQlHdDLKpMO7Zfvp7i8j9oQVmB54lMTJarGnrkC/rduzXchyUWBzkT28d9lb8LK4
	BRLyo27NOkT6GKNObPo1tB0VWdffF3eQMpiVjlrviGFXKaGD3uJPlsdvEvFueZzHf5AVkv
	HJDc3bG329wEc670ufMJjFejFsYQBVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775803063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rb9t3QZIuSzscdipRK1n3ddHqdMDyDb6F7pF69QnaeI=;
	b=d1OP2E4QbBZHtAbW4LxqJ1GM4eEySLK9eEMyf+HQhD0OpEk0gYFcQ9iFaTaIH2W/JTHmWf
	AiKWibdHsr4VJpDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775803063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rb9t3QZIuSzscdipRK1n3ddHqdMDyDb6F7pF69QnaeI=;
	b=krTaewHQlHdDLKpMO7Zfvp7i8j9oQVmB54lMTJarGnrkC/rduzXchyUWBzkT28d9lb8LK4
	BRLyo27NOkT6GKNObPo1tB0VWdffF3eQMpiVjlrviGFXKaGD3uJPlsdvEvFueZzHf5AVkv
	HJDc3bG329wEc670ufMJjFejFsYQBVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775803063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rb9t3QZIuSzscdipRK1n3ddHqdMDyDb6F7pF69QnaeI=;
	b=d1OP2E4QbBZHtAbW4LxqJ1GM4eEySLK9eEMyf+HQhD0OpEk0gYFcQ9iFaTaIH2W/JTHmWf
	AiKWibdHsr4VJpDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 50FBB4A0B2;
	Fri, 10 Apr 2026 06:37:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Va9FErea2GlOFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Apr 2026 06:37:43 +0000
Date: Fri, 10 Apr 2026 08:37:42 +0200
Message-ID: <87qzongw21.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Helt <krzysztof.h1@poczta.fm>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: sc6000: fix board configuration state and resume handling
In-Reply-To: <20260410-alsa-sc6000-pm-v1-0-4d9e95493d26@gmail.com>
References: <20260410-alsa-sc6000-pm-v1-0-4d9e95493d26@gmail.com>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,poczta.fm];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,poczta.fm,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 10 Apr 2026 05:54:31 +0200,
Cássio Gabriel wrote:
> 
> The SC-6000 driver has to program board-level DSP routing before the
> WSS codec can operate correctly. Today that setup has two related
> problems.
> 
> First, the probe path may auto-select IRQ and DMA resources, but the
> SC-6000 soft configuration is still derived from the raw module
> parameter arrays. When irq=auto or dma=auto is used, the WSS codec can
> be created with the selected live resources while the board itself is
> programmed with unresolved values.
> 
> Second, the driver still lacks suspend/resume support. The WSS layer can
> save and restore codec registers, but the SC-6000-specific DSP routing
> and MSS initialization are done only during probe and are not replayed
> after resume.
> 
> This series fixes the probe-time resource mismatch first and then reuses
> that cached board state to restore the hardware on resume. Keeping the
> board programming in a shared helper also keeps the old/new DSP split in
> one place so probe and resume cannot drift apart.
> 
> - Patch 1 stores the computed SC-6000 board state in card-private data and
> builds it from the live resources selected at probe time.
> - Patch 2 wires ISA suspend/resume callbacks and restores the cached
> board setup before the WSS codec resume path runs.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
> Cássio Gabriel (2):
>       ALSA: sc6000: Keep the programmed board state in card-private data
>       ALSA: sc6000: Restore board setup across suspend

Applied both patches now.  Thanks.


Takashi
