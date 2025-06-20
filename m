Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DBE1E7C32
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406373; cv=none; b=JNdl20zVZ6Rc+bKFV6HfzFPp9TJOQ1mFk7xlcziCxQ+fA4CW9HFMy3ClbMYNZSLdzh+fqt2351OXKcg42J078ADDVA+XqE7RymDJg5X2UpoobuxijnpPL9FmMZBF/a+/xNnqY48mUbfmPeJsMhICz6sFnBkP/Ft/zb94lonVpfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406373; c=relaxed/simple;
	bh=cxZILK5ddgd6MIVc5S+ZVPxVfC0dd942p8mbpOqKR5g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OBr/sPiyrnuP8lKaCcnsNsWC+UmZUUYgkCVgijaWaKoAQIpsQrYd1fpS+OXyea8c2ll1ptM21tXM8yUI5c/OA9G0AGhmXAYvAdekYMDCdXWYkoHAIfQqjp4n5eOJyhb0AFehQ6ri4UCcdnAZBhv/B3rU2Sa7Hnrx9S4ksb94WQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sSmhq2m8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CQtVdggq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sSmhq2m8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CQtVdggq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sSmhq2m8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CQtVdggq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sSmhq2m8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CQtVdggq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 822752123F;
	Fri, 20 Jun 2025 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750406369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Snggjm3dbfsxurTU2JoZyR5NpDrE6maiDGBTdupgSiY=;
	b=sSmhq2m8jtprklvJ6q7kxy1KEwPRJSaKNj/IusSeHeDHPptmAMV6xo3SD1a2AKlQO6AikU
	PQzXLzJC/POEMx8Q5v06hZ7Insh//4KFsA9nzEekqWDQ8z/QChmk9ywv2m36uEXpeLKMvU
	7zTbexLBozMKVt8v1eLg8DXxIVRj1KA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750406369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Snggjm3dbfsxurTU2JoZyR5NpDrE6maiDGBTdupgSiY=;
	b=CQtVdggqaOLuJKWC6tIgDstPNNp2MQox5MOoSrJ/rTcEs1UbmrV9LQWy70zsB9nwy/xNqt
	6py85jgkSvPlidBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750406369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Snggjm3dbfsxurTU2JoZyR5NpDrE6maiDGBTdupgSiY=;
	b=sSmhq2m8jtprklvJ6q7kxy1KEwPRJSaKNj/IusSeHeDHPptmAMV6xo3SD1a2AKlQO6AikU
	PQzXLzJC/POEMx8Q5v06hZ7Insh//4KFsA9nzEekqWDQ8z/QChmk9ywv2m36uEXpeLKMvU
	7zTbexLBozMKVt8v1eLg8DXxIVRj1KA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750406369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Snggjm3dbfsxurTU2JoZyR5NpDrE6maiDGBTdupgSiY=;
	b=CQtVdggqaOLuJKWC6tIgDstPNNp2MQox5MOoSrJ/rTcEs1UbmrV9LQWy70zsB9nwy/xNqt
	6py85jgkSvPlidBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A2CC13736;
	Fri, 20 Jun 2025 07:59:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iWhxFOEUVWgGWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Jun 2025 07:59:29 +0000
Date: Fri, 20 Jun 2025 09:59:28 +0200
Message-ID: <87wm96x2qn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.16-rc2
In-Reply-To: <fc4f65933b6ff395ce609f920dab47fc.broonie@kernel.org>
References: <fc4f65933b6ff395ce609f920dab47fc.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Fri, 20 Jun 2025 01:37:07 +0200,
Mark Brown wrote:
> 
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc2
> 
> for you to fetch changes up to 16ea4666bbb7f5bd1130fa2d75631ccf8b62362e:
> 
>   ASoC: Intel: sof-function-topology-lib: Print out the unsupported dmic count (2025-06-19 15:44:42 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.16
> 
> A relatively large collection of fixes and updates that came in since
> the merge window.  Of note are a couple of Cirrus ones which change the
> firmware naming for some newly added devices, and a fix from Laurentiu
> for issues booting firmwares on the DSPs on i.MX8 SoCs.

Pulled now.  Thanks.


Takashi
