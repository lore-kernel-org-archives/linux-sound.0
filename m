Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1042928C84D
	for <linux-sound@vger.kernel.org>; Wed, 31 Dec 2025 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767196091; cv=none; b=hwvU2h6kvQ94K9vZ6IneC5412vFly29as/HHdMMXYLDGqLJhu6MnNXZysG4qfhpdDvBs2Q7Sso0TrDrbdexjFpK5XeJkGKb1wxC0ACj6rDCOjOrUc3VFFBzF3io9ZJRcjh9arZdgv7b1VRFUxeUYiT/iR7bITGw/s8EYBB8zLzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767196091; c=relaxed/simple;
	bh=R/CGX2Ui4SKK4S2hJ/4XlqkhtQ8M5Teu6O6zssrCWec=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QduwgCmfg+A2tziOLVIz+DVqq0J3RJBCwy9YB3Y6aan2XEsbFzuu8wIehl8b3lFpdIs6eng+qM4cx/UqRQsXEICq89qwEIsEEAay9/qJ6+DFHd4unlbHDFIe45sR/vJQTBns3Gttaeu0JLxSTgrflZ0kaDrm3lQ02D1GNs0mGxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RMf8C3Qo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u7livqw+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RMf8C3Qo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u7livqw+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RMf8C3Qo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u7livqw+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RMf8C3Qo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u7livqw+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2179B336EF;
	Wed, 31 Dec 2025 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767196082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+E2ke8451e2Jjj0zOWkfQ2f2ZD4oCNu/wPdA6FI1Cu0=;
	b=RMf8C3QoTKF8FQ5FJFIHGttmn/npZ07RHkFYb07uV6hxNxdNLRJJxyN5rpQZFzBdoJdLy0
	e8fpXRSErFuQboEWOyBhXNMDmjKTp6fxc0w66EbkNnEHrMXHtu8rR98CjVkLMr6Jc+cf0z
	3tdbFnMX7HKwiaVeLj1OjDqvZVntRQQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767196082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+E2ke8451e2Jjj0zOWkfQ2f2ZD4oCNu/wPdA6FI1Cu0=;
	b=u7livqw+JmDmUGmdKR2IplEozjXgrLBDFTm60b8B9ql+n4lBTcEkreBGswjbmCdZuYXPh5
	BH1oIs5Hszr+ATBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RMf8C3Qo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=u7livqw+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767196082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+E2ke8451e2Jjj0zOWkfQ2f2ZD4oCNu/wPdA6FI1Cu0=;
	b=RMf8C3QoTKF8FQ5FJFIHGttmn/npZ07RHkFYb07uV6hxNxdNLRJJxyN5rpQZFzBdoJdLy0
	e8fpXRSErFuQboEWOyBhXNMDmjKTp6fxc0w66EbkNnEHrMXHtu8rR98CjVkLMr6Jc+cf0z
	3tdbFnMX7HKwiaVeLj1OjDqvZVntRQQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767196082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+E2ke8451e2Jjj0zOWkfQ2f2ZD4oCNu/wPdA6FI1Cu0=;
	b=u7livqw+JmDmUGmdKR2IplEozjXgrLBDFTm60b8B9ql+n4lBTcEkreBGswjbmCdZuYXPh5
	BH1oIs5Hszr+ATBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF770137FE;
	Wed, 31 Dec 2025 15:48:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OqlcObFFVWkgagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Dec 2025 15:48:01 +0000
Date: Wed, 31 Dec 2025 16:48:01 +0100
Message-ID: <878qeiy7ny.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.19-rc3
In-Reply-To: <20251231124837.C972C1AC5681@finisterre.sirena.org.uk>
References: <20251231124837.C972C1AC5681@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
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
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 2179B336EF
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Wed, 31 Dec 2025 13:48:31 +0100,
Mark Brown wrote:
> 
> The following changes since commit 56d953a8d0da5e53c2594edde23465ec49385b1c:
> 
>   ASoC: Intel: mtl-match: Add 6-amp matches for CS35L56 (2025-12-19 13:25:16 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-rc3
> 
> for you to fetch changes up to 3572ad82201baeed840f1959787e0e1281e7f937:
> 
>   ASoC: drop bogus container_of() error handling (2025-12-22 22:13:03 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.19
> 
> A small collection of driver speciifc fixes, mostly relatively minor,
> plus an adjustment to the topology file naming for Intel systems with
> Bluetooth required for disambiguation.

Pulled now.  Thanks.


Takashi
