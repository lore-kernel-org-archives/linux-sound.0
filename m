Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFBD28312F
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771516289; cv=none; b=UZitCkDBRIw3U8eq+4kvJ3CtWs2cVrPWivNhplJFva+uCLjdCazSmdw2W9SJJBj9xtfXUBaMSjCcqr9BzFOZ+AbWwBBDsusN0Qiw7EbwtO0Klclmjpj5FAwhs/SWIFgdNLOvqRNti+L8bcEESj/0Ta6uRBCDj4iY2mJ3l684lk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771516289; c=relaxed/simple;
	bh=BLZDzcTDV/pYopZvkeW+Li++lPM1psZE/hdxOdrSB7A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ez2N8rv/RfMARSGZnRWTwKCzNL6UR4ctqYbzvQq2ICkmRIhRIutkOeYkSRIz6zT1Wdnfvq+3EVVtYInqLlax24EHheYm+SZ1hg/X7SMRFIk7JW3JtD6NUNXFHy2aPSdR14kzfaH1xh0wI41ZVmk2XDZpOZRBeB5FKtE6LE3pJv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yAgeso2j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JI/RNTMn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yAgeso2j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JI/RNTMn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yAgeso2j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JI/RNTMn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yAgeso2j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JI/RNTMn"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3139B3E726;
	Thu, 19 Feb 2026 15:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771516281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nv9shJlGCWTqBOZOiwkH+iIQxKhSQsJvZRb/sgY9Yuo=;
	b=yAgeso2jm/pkXYPVfl1Z+kVEwqkgyKJYtSisSG982BKnsPQEN7E0RqRsTZJeCKJzCvpF7D
	V60U9j1Xs4tUIwwe6sWz5GTfRdLf6/2dffhqXczgIZkXSy/UsA45t1u2t7LQU5+8JP7kfS
	1Laf8NJGMoskOilRDQLzTMrnFIqR8Kw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771516281;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nv9shJlGCWTqBOZOiwkH+iIQxKhSQsJvZRb/sgY9Yuo=;
	b=JI/RNTMnrLmr/e1M8Tv8dgoKdtm56W8dd3KjKP7hsRvdg9hxPfPfokczez/lYaqD50HzyR
	agOaiCj+bL1GrWAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771516281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nv9shJlGCWTqBOZOiwkH+iIQxKhSQsJvZRb/sgY9Yuo=;
	b=yAgeso2jm/pkXYPVfl1Z+kVEwqkgyKJYtSisSG982BKnsPQEN7E0RqRsTZJeCKJzCvpF7D
	V60U9j1Xs4tUIwwe6sWz5GTfRdLf6/2dffhqXczgIZkXSy/UsA45t1u2t7LQU5+8JP7kfS
	1Laf8NJGMoskOilRDQLzTMrnFIqR8Kw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771516281;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nv9shJlGCWTqBOZOiwkH+iIQxKhSQsJvZRb/sgY9Yuo=;
	b=JI/RNTMnrLmr/e1M8Tv8dgoKdtm56W8dd3KjKP7hsRvdg9hxPfPfokczez/lYaqD50HzyR
	agOaiCj+bL1GrWAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 012FC3EA65;
	Thu, 19 Feb 2026 15:51:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uBRWOngxl2l2SwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 19 Feb 2026 15:51:20 +0000
Date: Thu, 19 Feb 2026 16:51:20 +0100
Message-ID: <87342wratj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.0-rockchip-i2s-tdm
In-Reply-To: <a3a96a98d6e168c6b044ce2b5671e648@kernel.org>
References: <a3a96a98d6e168c6b044ce2b5671e648@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Thu, 19 Feb 2026 16:45:55 +0100,
Mark Brown wrote:
> 
> The following changes since commit f8f774913b4b599169381073f6674e20976e5529:
> 
>   ASoC: SOF: ipc4-control: Set correct error code in refresh_bytes_control (2026-02-09 12:27:28 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.0-rockchip-i2s-tdm
> 
> for you to fetch changes up to 0783052534f547f8f201dd4554b1df9f1f8615b5:
> 
>   ASoC: rockchip: i2s-tdm: Use param rate if not provided by set_sysclk (2026-02-19 11:45:49 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Additional Rockchip fix for v7.0
> 
> One more ASoC fix, for a regression with the Rockchip I2S TDM support on
> a number of platforms.

Pulled now.  Thanks.


Takashi
