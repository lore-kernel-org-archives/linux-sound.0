Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF7124FC09
	for <linux-sound@vger.kernel.org>; Thu, 14 Aug 2025 06:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755153582; cv=none; b=ZOONTuDGDqEYmFlI3IPBpST2z/fdC628P/Ts8xXUCzwPdRSIXQcUT3/vzsMIFP5kSxfCEOtFzt7WlCTDBR6JrqEkSocP0a30X8F+7be5heSjjtvgs9cPpTslfMANkA5Kdwy4+h36qAhxd2G3d9W9/JK9xNf4BH/dBJVBQUcIY1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755153582; c=relaxed/simple;
	bh=mGW/HodW9xBEmfuTEU/wkHCkGm86pBvSHs+xQZVStdI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f5oOiqUMhesJ+OQtQI1ufr87aCEsAQqCnjsOP7N5lwxxHz/I225jS0gH4P2M6+1ikbA8YUUkswxaFj2Y/5FFyIy9wxMl5i5IGQqxqUKD7PSsZ5zafutAx7v/6OmIBC6Rrnw7FRLfT4DBGOjiCBaydbF3E+PhKgSylYsdmZqsXKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YkNlKrcN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eY3spXzB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YkNlKrcN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eY3spXzB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YkNlKrcN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eY3spXzB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YkNlKrcN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eY3spXzB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 16A7821ACD;
	Thu, 14 Aug 2025 06:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755153579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7BRVub62wVD02ZX0YzZg5cTnunaDMOHaQS1KN25LDQc=;
	b=YkNlKrcNpQgoMlg322b7ryoesPSjKH1RHFiDrFaS4br/QBVNckU22+B2PSuF19nlI/7wBK
	vCzxrK7ZnSJZ7zDhhOPlHGxOqzqVi0kZgdWeV8eXmP2k+fJEcmXiNeOSz9P7u14oHSZ6s0
	Mg/qHMiKp8hp2PoXJ+SIS3oSb3t8eXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755153579;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7BRVub62wVD02ZX0YzZg5cTnunaDMOHaQS1KN25LDQc=;
	b=eY3spXzBHzIhDF5bke4vz08ug7Ix0Ze9ejh4Bueh+GqV5iL36PgobRYxi08xQKQR5/D0+S
	fVPt6MA2tiXtJiDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YkNlKrcN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eY3spXzB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755153579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7BRVub62wVD02ZX0YzZg5cTnunaDMOHaQS1KN25LDQc=;
	b=YkNlKrcNpQgoMlg322b7ryoesPSjKH1RHFiDrFaS4br/QBVNckU22+B2PSuF19nlI/7wBK
	vCzxrK7ZnSJZ7zDhhOPlHGxOqzqVi0kZgdWeV8eXmP2k+fJEcmXiNeOSz9P7u14oHSZ6s0
	Mg/qHMiKp8hp2PoXJ+SIS3oSb3t8eXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755153579;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7BRVub62wVD02ZX0YzZg5cTnunaDMOHaQS1KN25LDQc=;
	b=eY3spXzBHzIhDF5bke4vz08ug7Ix0Ze9ejh4Bueh+GqV5iL36PgobRYxi08xQKQR5/D0+S
	fVPt6MA2tiXtJiDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E476B1368C;
	Thu, 14 Aug 2025 06:39:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KKBANqqEnWiWbgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 14 Aug 2025 06:39:38 +0000
Date: Thu, 14 Aug 2025 08:39:38 +0200
Message-ID: <87zfc2v239.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.17-rc1
In-Reply-To: <c50400ae698f3d9f5d0a46ad05fbd0fa.broonie@kernel.org>
References: <c50400ae698f3d9f5d0a46ad05fbd0fa.broonie@kernel.org>
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
X-Rspamd-Queue-Id: 16A7821ACD
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
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Wed, 13 Aug 2025 21:46:40 +0200,
Mark Brown wrote:
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-rc1
> 
> for you to fetch changes up to 47ed64db8c17eb16541098add865178fb7e68744:
> 
>   ASoC: tas2781: Normalize the volume kcontrol name (2025-08-13 15:52:53 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.17
> 
> A reasonably small collection of fixes that came in since the merge
> window, mostly small and driver specific plus a cleanup of the menu
> reorganisation to address some user confusion with the way the generic
> drivers had been handled.

Pulled now.  Thanks.


Takashi
