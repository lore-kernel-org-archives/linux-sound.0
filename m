Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6072C482F2
	for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 07:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758179551; cv=none; b=bcCTwLb0VQ5w/JjBr4VBe6S6p36MWyH66zk3q22gWBBU1PRG4c2oKQHrSA31W/HeZk0wwtJYNksoo8Y6M2aQW97Ku6jKASNUGJMqFlkWjeUeoqZvh7rULa54RCfN8Rx4SwxHmYnkYxe3n3jCadLfHg+Evp1749T6QtHpafgZX2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758179551; c=relaxed/simple;
	bh=Om9Jk9KC6drLUKKnEJVbtr3yEx3bul5wCXDUittPyE4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OeyDLU4B7o65IuoxMHGD/QLinFkS5Xfz2giPa3IysKWzS3XT5qur8Bo5q4sp/btYkyg1Bxe0ExfN7zcwG6cMIDJ4suszfOFZ3OyWJqD5nacaKx14/pvPQ6Hn/P8oXKY20O39aXals+xDPLMs72TzySCw+sJEjiUOqNHepTH0nnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jh+gaaB5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uBcXihjc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jh+gaaB5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uBcXihjc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jh+gaaB5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uBcXihjc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jh+gaaB5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uBcXihjc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 137D41F793;
	Thu, 18 Sep 2025 07:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758179544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v09DrijD3+v6vMYBdU/nDH+UzxrRUOgwbEZiz0WApYg=;
	b=jh+gaaB56glHXRq7JdL+k/3HplMI8qAc+tmfbPDA7QC8HFa1OaCS1jmOwh0ClaoGaZ3yc/
	K+2unYgpb/rN24JJgj5KJMopaqxk+W/mFA1hB7EW7bGr3s4/5yyxiZ7X6QAdDSpqZSwu+x
	jhcdwJSQ/5uSrPy1VfjtBEEhr/VA43M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758179544;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v09DrijD3+v6vMYBdU/nDH+UzxrRUOgwbEZiz0WApYg=;
	b=uBcXihjcSwRlYPC4F/EUBt+lwj2VgsTCh3szfAwaX+nX2OzOJQyCC5r+k3cJIr+C3+VORB
	njp+19ru+l1q9VDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jh+gaaB5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uBcXihjc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758179544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v09DrijD3+v6vMYBdU/nDH+UzxrRUOgwbEZiz0WApYg=;
	b=jh+gaaB56glHXRq7JdL+k/3HplMI8qAc+tmfbPDA7QC8HFa1OaCS1jmOwh0ClaoGaZ3yc/
	K+2unYgpb/rN24JJgj5KJMopaqxk+W/mFA1hB7EW7bGr3s4/5yyxiZ7X6QAdDSpqZSwu+x
	jhcdwJSQ/5uSrPy1VfjtBEEhr/VA43M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758179544;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v09DrijD3+v6vMYBdU/nDH+UzxrRUOgwbEZiz0WApYg=;
	b=uBcXihjcSwRlYPC4F/EUBt+lwj2VgsTCh3szfAwaX+nX2OzOJQyCC5r+k3cJIr+C3+VORB
	njp+19ru+l1q9VDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBD0B13A39;
	Thu, 18 Sep 2025 07:12:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7fIOG9Wwy2gdKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Sep 2025 07:12:21 +0000
Date: Thu, 18 Sep 2025 09:12:21 +0200
Message-ID: <87segkb5ey.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.17-rc6
In-Reply-To: <05d115d1cda935ba007c2835614cb320@kernel.org>
References: <05d115d1cda935ba007c2835614cb320@kernel.org>
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
X-Rspamd-Queue-Id: 137D41F793
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
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

On Thu, 18 Sep 2025 02:54:27 +0200,
Mark Brown wrote:
> 
> The following changes since commit 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c:
> 
>   Linux 6.17-rc5 (2025-09-07 14:22:57 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-rc6
> 
> for you to fetch changes up to 1dd28fd86c3fa4e395031dd6f2ba920242107010:
> 
>   ASoC: rt5682s: Adjust SAR ADC button mode to fix noise issue (2025-09-17 12:38:59 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.17
> 
> A pile of fixes that accumilated over the past few -rcs, this is all
> driver specifics including a small pile of quirks for new systems.

Pulled now.  Thanks.


Takashi
