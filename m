Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8161F374192
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 07:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065517; cv=none; b=tCaF6VTG9CUBeE2Bzr4yS8Yd86G2nqho5rp9zeTMznHUl6NaYSb1m4LriEaCSlIkFJLL2uRDh79JVbrV4BPVwrzjzTsyOI7C3kI02U3oMpzIwzXChHgkMLBnFfnXV1K8lCIlXwfS/EykBGnkQbhVM5Gtk5WvtQUu2W7YrjaunCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065517; c=relaxed/simple;
	bh=44E7u6ZEEdpwoVVTGNSAuLxYwE6+OWofpEHGszjKH20=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s9KcUwpCpHbYXiyeiIpwNDBsBERSyh2KgAPmPVgeeD7v+GxwlmxB6ErdpoShVZvgxVBoI6F8BJ/o8eBciu68foIOL6Z0dzEuxY0vXoI0ZVOB6KL4FfXxJ/UKTFhJm4hLAjaOTPYxRKB0zwbfBIjipsL+UU4WhaszhqCtU5WOoL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B4X9N+WV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+wiUMWMo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B4X9N+WV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+wiUMWMo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B4X9N+WV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+wiUMWMo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B4X9N+WV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+wiUMWMo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 982B96A88E;
	Mon, 13 Apr 2026 07:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776065512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CRfIe2elxNFYHpfoab2a1Os6Y7HuK1Wf+lPzXgosBAQ=;
	b=B4X9N+WV3IF2Adw19zvekoLfOwO5Jvl5/SJHnL4IzI8gw27lGoTydAQRN2G1yEaZeaf3+d
	7wiBhtAeU/E24YBeZwKnWaVc6sV+WZT3tBJagLYJcQoHd/5beGmzqjoPgqmaQbtA1uWYqf
	aEAAUBp4fIqAjGUNKpb0AOZA1DrYqF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776065512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CRfIe2elxNFYHpfoab2a1Os6Y7HuK1Wf+lPzXgosBAQ=;
	b=+wiUMWMoDtDqrvPKMaOYibx/JXG3fz5EixgLXZfwSWpqgYhgDBhJFhXuqGZuRZuz+RdJ01
	u+QaxiPL5LZ3d8Cw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=B4X9N+WV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+wiUMWMo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776065512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CRfIe2elxNFYHpfoab2a1Os6Y7HuK1Wf+lPzXgosBAQ=;
	b=B4X9N+WV3IF2Adw19zvekoLfOwO5Jvl5/SJHnL4IzI8gw27lGoTydAQRN2G1yEaZeaf3+d
	7wiBhtAeU/E24YBeZwKnWaVc6sV+WZT3tBJagLYJcQoHd/5beGmzqjoPgqmaQbtA1uWYqf
	aEAAUBp4fIqAjGUNKpb0AOZA1DrYqF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776065512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CRfIe2elxNFYHpfoab2a1Os6Y7HuK1Wf+lPzXgosBAQ=;
	b=+wiUMWMoDtDqrvPKMaOYibx/JXG3fz5EixgLXZfwSWpqgYhgDBhJFhXuqGZuRZuz+RdJ01
	u+QaxiPL5LZ3d8Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65E834AD81;
	Mon, 13 Apr 2026 07:31:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fqCtF+ib3Gm2UwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Apr 2026 07:31:52 +0000
Date: Mon, 13 Apr 2026 09:31:51 +0200
Message-ID: <87a4v7wc2g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>,	Arnd
 Bergmann <arnd@arndb.de>,	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: interwave: fix build warnings with CONFIG_PM=n
In-Reply-To: <20260413071217.3830320-1-arnd@kernel.org>
References: <20260413071217.3830320-1-arnd@kernel.org>
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
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,arndb.de,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 982B96A88E

On Mon, 13 Apr 2026 09:12:11 +0200,
Arnd Bergmann wrote:
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Parts of the newly added power management code are identified
> as unused by gcc:
> 
> sound/isa/gus/interwave.c:489:13: error: 'snd_interwave_restore_memory' defined but not used [-Werror=unused-function]
>   489 | static void snd_interwave_restore_memory(struct snd_gus_card *gus)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sound/isa/gus/interwave.c:483:13: error: 'snd_interwave_restore_regs' defined but not used [-Werror=unused-function]
>   483 | static void snd_interwave_restore_regs(struct snd_gus_card *gus)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from sound/isa/gus/interwave-stb.c:3:
> sound/isa/gus/interwave.c:489:13: error: 'snd_interwave_restore_memory' defined but not used [-Werror=unused-function]
>   489 | static void snd_interwave_restore_memory(struct snd_gus_card *gus)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sound/isa/gus/interwave.c:483:13: error: 'snd_interwave_restore_regs' defined but not used [-Werror=unused-function]
>   483 | static void snd_interwave_restore_regs(struct snd_gus_card *gus)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Add an #ifdef check around these to match the callers.
> 
> Fixes: 6f800c3397b7 ("ALSA: interwave: add ISA and PnP suspend and resume callbacks")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks, this should have been already fixed on sound git tree by the
commit b7feba842c0d5f6c5b01592f80d164e974767501
    ALSA: interwave: guard PM-only restore helpers with CONFIG_PM


Takashi
