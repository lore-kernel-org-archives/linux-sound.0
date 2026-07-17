Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1DA332913
	for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 06:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784268996; cv=none; b=qDBACUJ/FYB87d0W6roMXWoqvQJg9p6E18T1DVCDDkT0tf/qbx8zQIe3F7ZZZzO60BhN/Vn0pTl8OdhNtAu6VlVwINrhrBhd/LO1KGJhVInBYq5hJXd3gHsxTh6Ycn+7sS+pVZiLrMbyOhC4BJymMRZm2dXTxZV2SD9pw6z8npg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784268996; c=relaxed/simple;
	bh=G9dQnTtE6B2elZOhdyNlV+3TIWahYCiVKVknRe3uSxE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s0WjUmN6Uu66VrOgaeg0QC7CVDc0FQKEUwsyQ7VKX2GmfDPUzwrsUNXNOMfjdejN+Hi0if/u6P2LoA1qiSLwJ3X2xcuo+J9d600lDOkIyKUuz6OJT9ol1yIyidppuc7c/t5RF/1aTQwqaaqH1NOSNMplrPeESZHx3qScaSKx4zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Bk+j3hdf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4PPkRrq8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OXn+Q6iZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rbl6GlU7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Bk+j3hdf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4PPkRrq8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OXn+Q6iZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rbl6GlU7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE33678D50;
	Fri, 17 Jul 2026 06:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784268993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hkhYMVoDfzP/uEe9wacNczRJmfyg0WwLPfhhbgc/xc8=;
	b=Bk+j3hdfWMAuTsBxJ/g+WrKxViwlAmy7rGl4hwfzvftbWdWK/60qRzUxcS9HCq3g422tuB
	xD12XPCQ10OsOq8KqTiT65jVmrpQ/M8KWWzW0XxOKM2iUzIDUI2vAMc4srNTkfddgEVaHs
	iI+ozqsM73degFe4yTpQ37yK1O8z8qg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784268993;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hkhYMVoDfzP/uEe9wacNczRJmfyg0WwLPfhhbgc/xc8=;
	b=4PPkRrq8w0X1ZT7UoXe35QglkSy8iGLcFw/BjNm/LYuR10LB+ddOZzO7ptY6sd3xiUnf4w
	rngvuWX2j/Z7IpAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OXn+Q6iZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rbl6GlU7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784268991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hkhYMVoDfzP/uEe9wacNczRJmfyg0WwLPfhhbgc/xc8=;
	b=OXn+Q6iZvzCqKDxG6iHjnzgH8BbIYbfWOZJBw0we2G1dAoTeYzBpdklqptkvBBVOb3c6Dw
	3ItZdnJ6oTUioZF3WPNCoPeoLaGPK2wSAT0wPJE3p5eWokv8RXxcb+7MKPXHHIRz9E3AGe
	TY7z6yLAUoCXfvuWXPerSTxpQmu0Hk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784268991;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hkhYMVoDfzP/uEe9wacNczRJmfyg0WwLPfhhbgc/xc8=;
	b=rbl6GlU7Y2+79Z6F4z/WDhOyttzLSOqnNfedqsG5Ak/hsU4bBMbox4fNYdUs0mFHhS1YiL
	EX0xI1acKibxTYDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 88C58779AA;
	Fri, 17 Jul 2026 06:16:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p27uH7/IWWo0PwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 17 Jul 2026 06:16:31 +0000
Date: Fri, 17 Jul 2026 08:16:31 +0200
Message-ID: <87qzl2ta2o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.2-rc3
In-Reply-To: <e11aad798859896a3f0388f99de32bc0@kernel.org>
References: <e11aad798859896a3f0388f99de32bc0@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AE33678D50
X-Spam-Score: -3.51

On Thu, 16 Jul 2026 18:41:39 +0200,
Mark Brown wrote:
> 
> The following changes since commit 3238c634725afbb2a137fdda762208510828f71d:
> 
>   ASoC: tas2562: fix deprecated 'shut-down' GPIO always cleared after lookup (2026-07-09 00:33:20 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.2-rc3
> 
> for you to fetch changes up to efd80de2de9d06ddf0eee55ca11b04e39bfc7cd8:
> 
>   ASoC: Intel: sof_sdw: Add quirks for new Dell laptops (2026-07-16 17:18:08 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.2
> 
> A fairly standard collection of device specific fixes and quirks,
> nothing particularly remarkable.

Pulled now.  Thanks.


Takashi
