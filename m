Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B401F4177
	for <linux-sound@vger.kernel.org>; Thu,  5 Jun 2025 07:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749108974; cv=none; b=d1XPJCKnnfUzCN1MMdub4tpv+vIDnNLzCg8teHHzovCwDRVo+mYGkNkq/j3+5o01kqVfIeFU6x41ba0n9e12kUosa8soyGdl9TStz+WH7yJJ8ELrenV+nyOuSPPhoeGLmUJQe/j0AfpH7DXZBWdPchl03eXzhPvk9s8v28h5KiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749108974; c=relaxed/simple;
	bh=mBCiZStFEKfyItB2O9JaocMvKHymSBR3/G1LNuS43VA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cYGGZrmsUTCce86Cb8/+IsEM6Tt/WR98AlE7H4hHm8kfMX0p4eOzq+s2xSFSZ+m7KnPvSqtYomelvngnoBU7IViMZ2e9vk59Kp9X5K130TBH3jOk/RJoZlgY0bXpH9jrVW6m1Qq5Lb0ANVBxD8VG/w9nIRAROV1x4EJv/FZe8qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W9O71jxw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uSLzPHHl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Km7ZHptm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mPfAfSBy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W9O71jxw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uSLzPHHl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Km7ZHptm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mPfAfSBy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E56EF5BE00;
	Thu,  5 Jun 2025 07:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749108970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jsmwj41+Xbk+lllWASIfDWcIZGRvT7ATPv1wiuHr0IA=;
	b=W9O71jxwJxziD0jqeGaLu1bM/Fv9Rrvs03Obo8ZdattuRxchvmyZNpvO9hBlx3GtOrM7iI
	ZkuYQdzkrK91+EgiFzwK2dM7oMfmFMqIRTbJ4yZGRBj55uLvgBc5GsMUHGdsgy3chq8KAT
	5Us+g0zplI6/TC0IBP9aBLOHBOi/C6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749108970;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jsmwj41+Xbk+lllWASIfDWcIZGRvT7ATPv1wiuHr0IA=;
	b=uSLzPHHlAKd7HLPv/95ZEbvuTDldEiqvbWS+wd2fRjPYZCTgohQxVwGMTHqvX375F9/f0i
	0L4gYGdRvGzDLFCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Km7ZHptm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mPfAfSBy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749108969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jsmwj41+Xbk+lllWASIfDWcIZGRvT7ATPv1wiuHr0IA=;
	b=Km7ZHptmSMw47X3xhY8orMnZLHklMb7C/XEGfh7KVueOt5UrKqbPNb4CXDJ+eNNsIbE2Tp
	5gbzIWOugNL5AAAPl5/ADFbheicJdbJkuXgrSku1bRja2ZrQgAPPTp5WDyNoq1xFKFSEoU
	t1FqnvND+eRE+cFkCw36SMOVYYL5tqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749108969;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jsmwj41+Xbk+lllWASIfDWcIZGRvT7ATPv1wiuHr0IA=;
	b=mPfAfSBySnCbKHjzkCVD0t7xLt5nniH75f/NmSxHux7TuwHZQBJA1ZNLsXHSIRgoCum/P+
	9KY3mf/TtA6TQuBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0E5D1373E;
	Thu,  5 Jun 2025 07:36:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id f+HsLelIQWhvLwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Jun 2025 07:36:09 +0000
Date: Thu, 05 Jun 2025 09:36:09 +0200
Message-ID: <871pryprme.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.16-merge-window
In-Reply-To: <b1d4ad0e144128a16f88faa924f41432.broonie@kernel.org>
References: <b1d4ad0e144128a16f88faa924f41432.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E56EF5BE00
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 

On Wed, 04 Jun 2025 13:31:09 +0200,
Mark Brown wrote:
> 
> The following changes since commit 43a38a0ff8c63ee156d997cd13063c63cd55d812:
> 
>   ASoC: codecs: add support for ES8375 (2025-05-23 16:52:28 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-merge-window
> 
> for you to fetch changes up to b7188a1c0d2d7b04f4558e10293651d49fcb2398:
> 
>   ASoC: Intel: avs: boards: Fix rt5663 front end name (2025-06-03 17:04:32 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.16
> 
> A bunch of fixes, including a big batch for the Intel AVS driver, and
> one new device ID.  It's all device specific.

Pulled now.  Thanks.


Takashi
