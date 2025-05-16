Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A376B1DFDE
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 12:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399902; cv=none; b=V/Dmfris+G2+GW36pdWX8edQbBJp8rDDPdvEdDLAiGCcvDs3Q4c0Ysqz4m868YgF46Mtm///8E62zWG80zf53k+JD9Z7dCp25cJEVg4O9qzhafTETuZ5lBm7L5FQgTRN47KsOsU2gNntaFIuWjxkfsTrLAoj8PAflW+N7l5Vclc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399902; c=relaxed/simple;
	bh=8++W/j25JW8gS+qeHHzZJZOpbAKuGZ6y0Pg9JqRvv1o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kd5aKn7HwRT4kUeivue7720iyG4LPy7xyeVTrZN1VzpSxJZFsaZ9cZ9j6r5xHqWhdNXR7lZlokNpTfayITwnN5iejFZfYLv/fG5s0q+fNTQzfD8MLaqzAgMCwvs6fBJmrvoPmBh39BKE4IJJ9N5jPyQ7NEwvBd/XxKFHp1RZ1TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xwPgHa8d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zuzeNtK7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xwPgHa8d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zuzeNtK7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xwPgHa8d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zuzeNtK7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xwPgHa8d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zuzeNtK7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8D3D5219CD;
	Fri, 16 May 2025 12:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747399898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FcnoJFECh3cpSzX6pznfYKEtVRvIoTCjSS4LIpNB5Ps=;
	b=xwPgHa8d48SKRAD2ZlvVlTkwKcFFfO/DNjpqBUTv82y8XwH9rUDO+jRodD1/773yyHBsT4
	U7/CymIorjcckUNYlOCrqjg5AGAy1t66whrTOGtDC3vdrp5JvepBzI+1thcHjk+Z8hckYh
	641TD759B2et6kHSeBkE1C8PMixhTM8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747399898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FcnoJFECh3cpSzX6pznfYKEtVRvIoTCjSS4LIpNB5Ps=;
	b=zuzeNtK7cTbE3ULFVBkpiUb5fRn1R9DueG42Z6fYD7yCPADq8RGlvbaSDB2o3x0FW/wbzw
	wWYn9lZhoVr6cMAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xwPgHa8d;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zuzeNtK7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747399898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FcnoJFECh3cpSzX6pznfYKEtVRvIoTCjSS4LIpNB5Ps=;
	b=xwPgHa8d48SKRAD2ZlvVlTkwKcFFfO/DNjpqBUTv82y8XwH9rUDO+jRodD1/773yyHBsT4
	U7/CymIorjcckUNYlOCrqjg5AGAy1t66whrTOGtDC3vdrp5JvepBzI+1thcHjk+Z8hckYh
	641TD759B2et6kHSeBkE1C8PMixhTM8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747399898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FcnoJFECh3cpSzX6pznfYKEtVRvIoTCjSS4LIpNB5Ps=;
	b=zuzeNtK7cTbE3ULFVBkpiUb5fRn1R9DueG42Z6fYD7yCPADq8RGlvbaSDB2o3x0FW/wbzw
	wWYn9lZhoVr6cMAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 441C013411;
	Fri, 16 May 2025 12:51:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G0g8D9o0J2hdLwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 May 2025 12:51:38 +0000
Date: Fri, 16 May 2025 14:51:37 +0200
Message-ID: <877c2glnvq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.15-rc6
In-Reply-To: <cd5ce2c2c94d383d4347692c0366dddd.broonie@kernel.org>
References: <cd5ce2c2c94d383d4347692c0366dddd.broonie@kernel.org>
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
X-Rspamd-Queue-Id: 8D3D5219CD
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Fri, 16 May 2025 13:31:12 +0200,
Mark Brown wrote:
> 
> The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:
> 
>   Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-rc6
> 
> for you to fetch changes up to 7dd7f39fce0022b386ef1ea5ffef92ecc7dfc6af:
> 
>   ASoC: SOF: Intel: hda: Fix UAF when reloading module (2025-05-14 16:34:48 +0200)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.15
> 
> A collection of driver specific fixes that built up over the past few
> weeks, plus one core patch which fixes handling of topology files where
> some DAI names are substrings of others.

Pulled now.  This slipped from the PR I already sent this morning, so
will be likely in a PR in the next week for the 6.15-final.


thanks,

Takashi
