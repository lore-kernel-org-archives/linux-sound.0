Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6159920126A
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 06:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753340186; cv=none; b=JqcHSZJVt2lLE3Pw6YDgqUp2htOpFW4GhmkdsrY1uvOfvY589plmaPL/dqT2zMgxWr+PU5OmXW1yEzc1Y0Y05ftl43kLiTXwoSVI89hnFnHlPxi65+n8QDBx5nCsTPanq5ThxfcxFqeROBVhDXQf2aK+0iEGSSnZ+fA+z6Tn9AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753340186; c=relaxed/simple;
	bh=iyIZ52/ISnksgTCvAZA0XR+Jg1u3Pjp4Ej36ogAE7dY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d8gZ70w5oxUXgnBqCNSNp130CWko5HLyk/9G7hzz6akw9Q6Ed8Y9QvEze18aB050YfmJWoFnGQCyacNwJ1iWyJ7TvLjW7LQyEqK37Gq8qRvueWLPGQ+0gLXBHnjNS4/rcoqd0TdVcKfFRZHyN9Hi/ZL3kfmlMdtzhoeTjj0lsqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sL0rP8Tj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ht9wVDyW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sL0rP8Tj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ht9wVDyW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sL0rP8Tj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ht9wVDyW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sL0rP8Tj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ht9wVDyW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 689101F394;
	Thu, 24 Jul 2025 06:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753339856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nPlrkomo+MJHtTs/mnLLgiQBOEc5J1a9yqq/KFABJ+Q=;
	b=sL0rP8TjR8yD4A8CbD3NF2eFfcvC4rmfkIT33mfuOzu43/huv0dwu4DPFL7hkgJRFgshHN
	Z5dU+IhA5KjzQv0ss1bnmJP96oA0WBa2r6HJRvFTSLPgR9WmKGq567RAuTctfCd3lc5tak
	Ic2v28Tjy8l96X5fdTQmSD3seqG3Bzk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753339856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nPlrkomo+MJHtTs/mnLLgiQBOEc5J1a9yqq/KFABJ+Q=;
	b=Ht9wVDyWl/9oUp54UXwtSrxIr4cuK3/3WkjYH5UQRPM0DGLHDgAFlRYHksqOglbBpRKBYI
	qYD5gbg8tWJDMnBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sL0rP8Tj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ht9wVDyW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753339856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nPlrkomo+MJHtTs/mnLLgiQBOEc5J1a9yqq/KFABJ+Q=;
	b=sL0rP8TjR8yD4A8CbD3NF2eFfcvC4rmfkIT33mfuOzu43/huv0dwu4DPFL7hkgJRFgshHN
	Z5dU+IhA5KjzQv0ss1bnmJP96oA0WBa2r6HJRvFTSLPgR9WmKGq567RAuTctfCd3lc5tak
	Ic2v28Tjy8l96X5fdTQmSD3seqG3Bzk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753339856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nPlrkomo+MJHtTs/mnLLgiQBOEc5J1a9yqq/KFABJ+Q=;
	b=Ht9wVDyWl/9oUp54UXwtSrxIr4cuK3/3WkjYH5UQRPM0DGLHDgAFlRYHksqOglbBpRKBYI
	qYD5gbg8tWJDMnBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38825136DC;
	Thu, 24 Jul 2025 06:50:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dfuMDNDXgWhoJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 24 Jul 2025 06:50:56 +0000
Date: Thu, 24 Jul 2025 08:50:55 +0200
Message-ID: <87tt32krow.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.16-rc7
In-Reply-To: <bcb82e4ad25ee3af0e561906a507efa3.broonie@kernel.org>
References: <bcb82e4ad25ee3af0e561906a507efa3.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 689101F394
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.51

On Wed, 23 Jul 2025 19:20:13 +0200,
Mark Brown wrote:
> 
> The following changes since commit 7bab1bd9fdf15b9fa7e6a4b0151deab93df3c80d:
> 
>   ASoC: amd: yc: Add DMI quirk for HP Laptop 17 cp-2033dx (2025-07-16 11:50:33 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc7
> 
> for you to fetch changes up to 696e123aa36bf0bc72bda98df96dd8f379a6e854:
> 
>   ASoC: mediatek: common: fix device and OF node leak (2025-07-23 13:03:57 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.16
> 
> A few device specific fixes, none especially remarkable though all
> useful.

Pulled now.  Thanks.


Takashi
