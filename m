Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961CE33B970
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761826508; cv=none; b=Ee0UdtBloJpqyy6aI8mZ9OcCg87ryXCzTRiXrTRjuXDgUmh14HZJa7Cygg8hnThRs/9To46Vo0qvvTqwntwD1CMgay/w3FKj3veoDcXkalgCJ+I9XQ7eeSur+eL9rg0aocd6k4rUI0/wSc50otmA/vAmWoTn0J1XdfIoj0kaP2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761826508; c=relaxed/simple;
	bh=Vj6PUElPGayChEpPWQ2eEgzp4BXKsChYP4EWdfTxIi4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=di8jAltR8yNkwWpANVlaEYNyLyNjaL1FgA2gcI6AeQmZ9IgLG9BPzDPenZtDNwuVAbhhJScI0gVIroBMPLtm2dQ6ze9YEQ3alsS2N7GsEQlP1o7QyJLdrgpZiiIudgnh/JahisQY6DYdomtlFGGDlnDDeacoN5b55KOPkkF/Mu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XbcPJjI/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iqb4dEwo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XbcPJjI/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iqb4dEwo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XbcPJjI/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iqb4dEwo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XbcPJjI/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iqb4dEwo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A5A8C336EE;
	Thu, 30 Oct 2025 12:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761826502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z78nra1OKSF9B3K845Ru7uXjqwIS15ZMXjrd21p8e+s=;
	b=XbcPJjI/YaN6+M6xPDKl4dqP/4uVptu+42B57h+QhaP9lH0vLOSbWN+R8G3QxoWkpkhjzk
	vUH4QBB83ksTES/2QcvtU/z8XTqnWy3rq9w3Y4Hiuo4p3dGZcFlq7pMcUbuyPw/QFg13nB
	sYRAAq7NS1fcBlHEni8G0/c4ehEG7dM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761826502;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z78nra1OKSF9B3K845Ru7uXjqwIS15ZMXjrd21p8e+s=;
	b=iqb4dEwoUBNz9r/C/MNThXASwW1P6Z3ZwhJa8FO1Ac3t+ZlwvBNqJaZkLtmvvnIgnILFqb
	RGysrcdLOrJIgpBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="XbcPJjI/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iqb4dEwo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761826502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z78nra1OKSF9B3K845Ru7uXjqwIS15ZMXjrd21p8e+s=;
	b=XbcPJjI/YaN6+M6xPDKl4dqP/4uVptu+42B57h+QhaP9lH0vLOSbWN+R8G3QxoWkpkhjzk
	vUH4QBB83ksTES/2QcvtU/z8XTqnWy3rq9w3Y4Hiuo4p3dGZcFlq7pMcUbuyPw/QFg13nB
	sYRAAq7NS1fcBlHEni8G0/c4ehEG7dM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761826502;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z78nra1OKSF9B3K845Ru7uXjqwIS15ZMXjrd21p8e+s=;
	b=iqb4dEwoUBNz9r/C/MNThXASwW1P6Z3ZwhJa8FO1Ac3t+ZlwvBNqJaZkLtmvvnIgnILFqb
	RGysrcdLOrJIgpBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E3A91396A;
	Thu, 30 Oct 2025 12:15:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I9IlIsZWA2nCGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Oct 2025 12:15:02 +0000
Date: Thu, 30 Oct 2025 13:15:02 +0100
Message-ID: <87tszg37sp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.18-rc2
In-Reply-To: <741e6973e073ce0ea4f6e17d7b1b080e@kernel.org>
References: <741e6973e073ce0ea4f6e17d7b1b080e@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: A5A8C336EE
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 30 Oct 2025 12:33:11 +0100,
Mark Brown wrote:
> 
> The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:
> 
>   Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.18-rc2
> 
> for you to fetch changes up to 5e5c8aa73d99f1daa9f2ec1474b7fc1a6952764b:
> 
>   ASoC: dt-bindings: pm4125-sdw: correct number of soundwire ports (2025-10-29 14:54:47 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.18
> 
> A bigger batch of fixes than I'd like, things built up due to holidays
> and some last minute issues which caused me to hold off on sending a pul
> request.  None of these are super remarkable, and there's a few new
> device IDs in here too including a relatively big block of AMD devices.
> 
> The Cirrus Logic CS530x support subject line is actually a fix that was
> on the start of that series and got pulled in here, I forgot to fix the
> subject up when merging.

Pulled now.  Thanks.


Takashi
