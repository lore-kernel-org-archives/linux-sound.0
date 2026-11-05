Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894501;
	b=YCEycd59GQJy5pTvErJsLTeZE6ATn/MkwUFEJbZJaNZW8VbWQar5lAx7/I0uwPe8ha+t
	 sVsIxYGH5YXHsJ3R5XXml91Wgf//9b03tMIJXT7X6ktTQKX1wRQ+8+iMDl/Iaf6XWgMgj
	 BghzTmiimfSwS9scW8CpH63LUsRZxbtR661CAk+/xL3MVrdi9AFYTqeoqs5v3+sgaJYWY
	 PdGkek/WzqdCwi1WPbVkzfpIb1Vc+1si0+q0oy+lphGPci/B+x55KdIz2i9vBR5ujVArn
	 2yIJo5EgUBa/pQBQk398REsrHRswn3esmZ+wU+RPTOiQpowvjgY5Ya7n7TUvIqYtoAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894501;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=bCAXsQYTn+ro7wQ3X5+sSRZ5vAY/PJ6i1XVSyLlK874=;
	b=fR9C0XqaaUVEg5pJZuvnzKpAy2yOOO6WNL4w+x3l7c1QlMYLoJ0GF9QIthAf6obEOn14
	 dFuh6ZHS1SSzD/kls3s8r6ximIUz3UbuAmUfjSFKeRiVaFeQ5pxOAhuf+Mcu/OE95AHWQ
	 zhG2AtL6sGVc5kZUrnu8UjYD8xC+fzn6pYWo7BTdWSatl0i07t0pItOHIgVQOxAs8lk1L
	 eYEAAOVmkzkzc1b6qNK5Wb2z/F7hnDSNB/p3YehqzdJTqDUqc3Sb98XofE0/ov5jsKk/A
	 pbyjIL83Xgv+ylJMtXo6nYetI95rPHb3wTU6tcIZLC+S6JJH77bt3f8T40LXEuHUrbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gGxO0SHx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HKTQbMwv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gGxO0SHx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HKTQbMwv;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9E5606B442
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 16:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A9E5606B442
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gGxO0SHx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HKTQbMwv;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gGxO0SHx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HKTQbMwv
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 74CF81F749;
	Thu,  5 Nov 2026 16:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793894497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bCAXsQYTn+ro7wQ3X5+sSRZ5vAY/PJ6i1XVSyLlK874=;
	b=gGxO0SHxJ1lggBgMepmGGMhM37Zk6ZbGTZjUGvYd+f5ND44PnkydwOpHOH2EhbF9IV+ZS5
	Ij1G5YHY8D4iat7e5sSDU1af8bacUr1Supq8MGxYYc+IgY0ayPux1lfzBWEGkMH1PF8KaG
	Uh+ltF6pcVN89+fAV1jtyIp7+FdYAlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793894497;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bCAXsQYTn+ro7wQ3X5+sSRZ5vAY/PJ6i1XVSyLlK874=;
	b=HKTQbMwvEsex35AwmI7QAHHEdbUROjIJdJ3mSKzJ5J1LCujAdlx+JFwYI3lWWLAybS0Bjw
	wzk6bqu6/5F6WEBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gGxO0SHx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HKTQbMwv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793894497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bCAXsQYTn+ro7wQ3X5+sSRZ5vAY/PJ6i1XVSyLlK874=;
	b=gGxO0SHxJ1lggBgMepmGGMhM37Zk6ZbGTZjUGvYd+f5ND44PnkydwOpHOH2EhbF9IV+ZS5
	Ij1G5YHY8D4iat7e5sSDU1af8bacUr1Supq8MGxYYc+IgY0ayPux1lfzBWEGkMH1PF8KaG
	Uh+ltF6pcVN89+fAV1jtyIp7+FdYAlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793894497;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bCAXsQYTn+ro7wQ3X5+sSRZ5vAY/PJ6i1XVSyLlK874=;
	b=HKTQbMwvEsex35AwmI7QAHHEdbUROjIJdJ3mSKzJ5J1LCujAdlx+JFwYI3lWWLAybS0Bjw
	wzk6bqu6/5F6WEBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 354B7134F4;
	Thu,  5 Nov 2026 16:01:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Yv/wA2Go7Gq9CgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Nov 2026 16:01:37 +0000
Date: Thu, 05 Nov 2026 17:01:36 +0100
Message-ID: <87v76bqnbz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.4-rc1
In-Reply-To: <e5aded615cb3e714bfe90050876a9f98@kernel.org>
References: <e5aded615cb3e714bfe90050876a9f98@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 74CF81F749

On Thu, 05 Nov 2026 16:52:47 +0100,
Mark Brown wrote:
> 
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.4-rc1
> 
> for you to fetch changes up to cf09d02dc0c49593fdd9e0ec2f17251cba39a94e:
> 
>   ASoC: amd: yc: drop duplicated DMI quirk entries (2026-11-05 00:25:11 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.4
> 
> More fixes that have come in since -rc1, a lot of this is quirks but
> there's some bug fixes as well.  The bug fixes should mostly be those
> that seem to be affecting actual users rather than just being pure
> static analysis work.  I also took some fixes for missing Kconfig
> dependencies which won't have any runtime impact.

Pulled now.  Thanks.


Takashi
