Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EC62DC770
	for <linux-sound@vger.kernel.org>; Thu,  1 May 2025 08:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087913; cv=none; b=cCLtmtnOYU01hbCxWLkx7lP1hKd5tu4KRZR/1kxFsJqqu/HCgtKpK2SUR/JF++RaPnk4lOGEPrk6BN1RPr4D9VxPeXObDbwwkjr9it8kULG83luyWDJWkif+w2QeS2SwWE0/k8s1Benaweh6pNJ6pwep/6ZqD0c9KXP5X7KGzes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087913; c=relaxed/simple;
	bh=sptQtAXLNggzFT/BRvEoh+959POyE8mfee9awE2DIVQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uy7M4hJVBhF7IdTjSm2MBWgLfcMjXltCJq4EXqq+Rvp7BYuKe0zyPf+BwV3SStKND/yRTc4rPyqpK8JydxY4IYNntHh9RDW/SIqcTWQMMpXn1eilzeJPEwrkG5ieTyK3DtDMbhStGEN1cMA5MN+Xqq1wH1xODhJjqqTQ3m8ONzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=goM0dbtp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=46DQ74ja; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=goM0dbtp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=46DQ74ja; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="goM0dbtp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="46DQ74ja";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="goM0dbtp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="46DQ74ja"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D5D641F388;
	Thu,  1 May 2025 08:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746087909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fr87GwYKmv4fSxKSzNYdplpYxl6u5wFZPAToK9TBDgA=;
	b=goM0dbtpEZH08Td5lTo2hSDDfFM8Q7TG9iKvqEykcLc3kgrVaFVzfZzgHzQAfZ5A4x/3No
	wI6SsN8mKxSweRVnxjQfrM+xu09cFZcL1RjTNummz1rhJVTL8hZ7YmCpV6kCE9QAyQ3iX6
	MfuhVBTITQGrZmVA3yF8a2m7w/pTlWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746087909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fr87GwYKmv4fSxKSzNYdplpYxl6u5wFZPAToK9TBDgA=;
	b=46DQ74jaNk954h6KXpWKdzKBi0EOIOl33dYJeNpbs8ZMQSYkZFDFKif0Ozadg5/uVcKwdj
	Ne8T9Papkdpz4RDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746087909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fr87GwYKmv4fSxKSzNYdplpYxl6u5wFZPAToK9TBDgA=;
	b=goM0dbtpEZH08Td5lTo2hSDDfFM8Q7TG9iKvqEykcLc3kgrVaFVzfZzgHzQAfZ5A4x/3No
	wI6SsN8mKxSweRVnxjQfrM+xu09cFZcL1RjTNummz1rhJVTL8hZ7YmCpV6kCE9QAyQ3iX6
	MfuhVBTITQGrZmVA3yF8a2m7w/pTlWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746087909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fr87GwYKmv4fSxKSzNYdplpYxl6u5wFZPAToK9TBDgA=;
	b=46DQ74jaNk954h6KXpWKdzKBi0EOIOl33dYJeNpbs8ZMQSYkZFDFKif0Ozadg5/uVcKwdj
	Ne8T9Papkdpz4RDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC41513931;
	Thu,  1 May 2025 08:25:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id joWcKOUvE2i2CQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 May 2025 08:25:09 +0000
Date: Thu, 01 May 2025 10:25:09 +0200
Message-ID: <87o6wcbuvu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.15-rc4
In-Reply-To: <a6bd31a7255c121ca11bbdf066134f83.broonie@kernel.org>
References: <a6bd31a7255c121ca11bbdf066134f83.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
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
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Thu, 01 May 2025 08:44:37 +0200,
Mark Brown wrote:
> 
> The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:
> 
>   Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-rc4
> 
> for you to fetch changes up to 315c84567001aec7f7b74a0dbd4fce3e1c5cbd87:
> 
>   ASoC: intel/sdw_utils: Add volume limits to CS35L56 (2025-05-01 14:43:52 +0900)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.15
> 
> A moderately large batch of fixes for v6.15, many driver specific
> including cleanups for the enabling of the Cirrus KUnit tests and a fix
> for a nasty crash on resume on AMD systems.  We also have one core fix,
> for an ordering issue between DAPM and DPCM which could leave things
> incorrectly unpowered.

Pulled now.  Thanks.


Takashi
