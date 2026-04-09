Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005444A23
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 05:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775711064; cv=none; b=cDleEuh6Q54KR5uFm1RbsKngwnLONqTQtDpqtXUu9qK88y2T6NvLbsdQC3AcL0zy4TTexXrOtz5BH9NPsnsaIKtpsaSxmztU2tCHNt8ROy/QO4XbBNrcfVjQV7Xah9VOemxZJSbFx96WM3Btwj2cjQezVThTBwOusOdbGkgvObk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775711064; c=relaxed/simple;
	bh=CdOARQ7xdKOTAz/gWlc7aLMoFrq3OZCQGPT7C3xGY7E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sLPR6sRiN4orDwG0bQQCo6d74bxE4smAutfRzAII8H2770/1JFvhz6NY3lb0mvWdNu2JJCEHSXJbQOZGDCqIqSuXQgJ2J/fV317Xp/u4MKaiDzKMAU/w6dNcDeMIk8/rfaB7YAl2/7V89XFLKcy0P0eOXJXVh3cHtRWIaGQtt9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f208/IiB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MW8Iu39d; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f208/IiB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MW8Iu39d; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f208/IiB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MW8Iu39d";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f208/IiB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MW8Iu39d"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 39AE85BCE6;
	Thu,  9 Apr 2026 05:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775711061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PowfDnVnjDbaEsC+/Y1jCiSqzUffPCN8GETcyH+Anfw=;
	b=f208/IiB+y3K/OFPxdwmcPB/cJvgPGEnM9w/Kcu6zY/XP71wjqxzBmbWS3W2erUVd+jksj
	U5IaAt/TcAuhDFH8daaKMxqRP5DVRRYLNCT1c0qHzXUdbp5pmO9jNEdUKw17jhCh++noym
	xGeTDhk9pCqE2yynZjudNSOywBLud1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775711061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PowfDnVnjDbaEsC+/Y1jCiSqzUffPCN8GETcyH+Anfw=;
	b=MW8Iu39dnrFLKwKRyDRZ2qLRB0u5u9rCGa3EUpivQWubbGFB48ze+guw+6fI67icv42H16
	RuzT+VXixrQ5IyDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="f208/IiB";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MW8Iu39d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775711061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PowfDnVnjDbaEsC+/Y1jCiSqzUffPCN8GETcyH+Anfw=;
	b=f208/IiB+y3K/OFPxdwmcPB/cJvgPGEnM9w/Kcu6zY/XP71wjqxzBmbWS3W2erUVd+jksj
	U5IaAt/TcAuhDFH8daaKMxqRP5DVRRYLNCT1c0qHzXUdbp5pmO9jNEdUKw17jhCh++noym
	xGeTDhk9pCqE2yynZjudNSOywBLud1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775711061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PowfDnVnjDbaEsC+/Y1jCiSqzUffPCN8GETcyH+Anfw=;
	b=MW8Iu39dnrFLKwKRyDRZ2qLRB0u5u9rCGa3EUpivQWubbGFB48ze+guw+6fI67icv42H16
	RuzT+VXixrQ5IyDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 14AB14A0B3;
	Thu,  9 Apr 2026 05:04:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b7XFA1Uz12l4QQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 05:04:21 +0000
Date: Thu, 09 Apr 2026 07:04:20 +0200
Message-ID: <874ilklo6j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.0-rc7
In-Reply-To: <20260408221922.6194F1AC52C7@finisterre.sirena.org.uk>
References: <20260408221922.6194F1AC52C7@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 39AE85BCE6

On Thu, 09 Apr 2026 00:19:17 +0200,
Mark Brown wrote:
> 
> The following changes since commit 591cd656a1bf5ea94a222af5ef2ee76df029c1d2:
> 
>   Linux 7.0-rc7 (2026-04-05 15:26:23 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.0-rc7
> 
> for you to fetch changes up to 6b6f7263d626886a96fce6352f94dfab7a24c339:
> 
>   ASoC: amd: acp: update DMI quirk and add ACP DMIC for Lenovo platforms (2026-04-08 17:04:47 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.0
> 
> A somewhat larger set of fixes than I'd like unfortunatey, not from any
> one place but rather spread out over different drivers.  We've got a
> bunch more fixes for the SDCA interrupt support, several relatively
> minor SOF fixes, a few more driver specific fixes and a couple more AMD
> quirks.

Pulled now.  Thanks.


Takashi
