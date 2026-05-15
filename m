Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5898A381B0D
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 06:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828199; cv=none; b=c/v3PbXJJGYnkLW1LXAdoW50fx51pg6PnnZyyC6pHXV5Tbh+HdatQRZ5EqvRbr4ODHuATnw64gRgL09tml9hJmQhhwqvtV9iUiteM2TJGapES0x9+RGck2Wmui5U+Bp7U5On6VTTQPF2jxCL9SfPI7pyfVdbgyz4kOWNZIj/YJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828199; c=relaxed/simple;
	bh=YL6Bp1Oyhn0SC6X7BkXMCasNiDfokc9I9cF2wwbjgkY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XQggqyCFtq/0EBfOL3oesJZxeJzhoYRhMr4YIBDMsTm0wwyuKgXnbaVd9re6MydwrR8Y+3PwOZiCtOSy7FyVQbuV2V5u3xnsJ8pscTllzaLi55E7NecL/wrToJa7Pvvrx+9Y9OEct4UFq+kGr/6R7ghNuEKSVwWptme/wJDrOA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CEP9TFZX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/BjtwFRd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CEP9TFZX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/BjtwFRd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CEP9TFZX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/BjtwFRd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CEP9TFZX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/BjtwFRd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 878FC6B2A1;
	Fri, 15 May 2026 06:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778828196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JvqbyyVDXc7AcPhnRcdjHz6Y6rpqp3QFaun4ds4oSWU=;
	b=CEP9TFZXbQX6kSeSAemvVmsAbtW/AiyKdPdR2Mr+NwgSYCaeoB83WwjTRz+MOSkv99c3k5
	rXhXeE8CTx3aLtVpvojankhIG3mLeuk56mt0SE10bOkc3e6Yb1IHbEW9XTaLhY4M6uneoJ
	DEHlk/It5tDWPYfYd3whustd74zbFbA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778828196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JvqbyyVDXc7AcPhnRcdjHz6Y6rpqp3QFaun4ds4oSWU=;
	b=/BjtwFRdE5aCbaCaiLSzdHJYflh6oesv53UReTUdW7RTW32g4l/hqYsNMgSMX/6lcFlb4a
	j6a03jMG8uI/4vDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CEP9TFZX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/BjtwFRd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778828196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JvqbyyVDXc7AcPhnRcdjHz6Y6rpqp3QFaun4ds4oSWU=;
	b=CEP9TFZXbQX6kSeSAemvVmsAbtW/AiyKdPdR2Mr+NwgSYCaeoB83WwjTRz+MOSkv99c3k5
	rXhXeE8CTx3aLtVpvojankhIG3mLeuk56mt0SE10bOkc3e6Yb1IHbEW9XTaLhY4M6uneoJ
	DEHlk/It5tDWPYfYd3whustd74zbFbA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778828196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JvqbyyVDXc7AcPhnRcdjHz6Y6rpqp3QFaun4ds4oSWU=;
	b=/BjtwFRdE5aCbaCaiLSzdHJYflh6oesv53UReTUdW7RTW32g4l/hqYsNMgSMX/6lcFlb4a
	j6a03jMG8uI/4vDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D3AA593A9;
	Fri, 15 May 2026 06:56:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id udJdFaTDBmqvUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 06:56:36 +0000
Date: Fri, 15 May 2026 08:56:35 +0200
Message-ID: <877bp5upng.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] ALSA: ctxfi: Use flexible array for SRCIMP imappers
In-Reply-To: <20260511230026.28488-1-rosenp@gmail.com>
References: <20260511230026.28488-1-rosenp@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 878FC6B2A1
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 12 May 2026 01:00:26 +0200,
Rosen Penev wrote:
> 
> Store the SRCIMP imapper entries in the SRCIMP resource allocation
> instead of allocating a separate array.
> 
> This keeps the mapper table tied to the SRCIMP lifetime and removes
> the extra allocation and cleanup paths.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
