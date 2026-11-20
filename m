Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160202;
	b=SfC3M8AAeWGS0E1rPxg9VEAZlk8l+Egh02E6EHcE2SqqT5kmkk4A5St5ou0J1IXalT9Z
	 +EOif20TavXQPCsPbt1N2IXsf5SWEu7t1YosKpyYvFemRyWcZnqG/coK5pgZa7Sz7IuSp
	 RSvWhwAUX1OTDFo3Z3jRZOi8Aj82tRjAwhlfKDDqhoAdmdx9DwsezHqUKGJ0k4GMoOYyC
	 OQm9X1glzf5QUJZ0/U2/VQ5furz7hSBZvjS76InO1WSRJyWjsY5SyYaOQG4zGrU2JbO5P
	 HE0Ya0G5sFpt8NRwHNHgKPjGsyuUUP9RfcuIYY6MQ1JeW/qANlcJZK5rbqgm2gFHp9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160202;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=cRh1HYATXVNzgWhypno6VuZ+diVja1QSq9VuzmoGwAg=;
	b=W4zuW2Z61Ek0FYgCriNwlep4smRjsrj2rF374xG26OlzBvpXUxXdq9kEjzAEXGnKbDwM
	 zw76x7PDO3pOsVF/SfHO+/kqoFmNNwwrn7owsJX1FehAOQkUDePDO9tqeb5wryJhAwfjW
	 GKiDkN5+O4PXdExFoFZ88fNZPk0VyUd/U8smnRSRS00XnKaSUjbe0xeD7Fh/KK8Pv5zuS
	 erF0bgtr482YEVDJXnbv7cXygaohxyv3Ije7xxhy1zon/mKsRVndpxymGuO0goKHUadaZ
	 bshX8BQyTrbW3coyVO2DlOwkL4b7wi8NWJW2J3d2nUCUH8t26Ecb5seKwKLNhTKAi2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TxwieGTB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lf4c6zKs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TxwieGTB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lf4c6zKs;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013C5606A325
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 07:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 013C5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TxwieGTB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lf4c6zKs;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TxwieGTB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lf4c6zKs
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E855C1FB70;
	Fri, 20 Nov 2026 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795160200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cRh1HYATXVNzgWhypno6VuZ+diVja1QSq9VuzmoGwAg=;
	b=TxwieGTBirq+XNOwXc2LTb0QXHU9CeZVO25KA8TC1prUQNhMPrhuH8RjtmyKCAYeywI2J/
	Ilrce+Vlz/NBdxf78DjXORIjW13G2/6zIIi2UMDMjLdsW4kryxWLhu728I8kqDb0F2wGfY
	ugk1lTXr2xlgd3f7bpHDL5fByZziJ0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795160200;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cRh1HYATXVNzgWhypno6VuZ+diVja1QSq9VuzmoGwAg=;
	b=lf4c6zKsTA3X8f/pSkc7KnBCflEcTi7D6+AkLib1qJzrB7wcrnTSQWpPSNxnTsAZ27wFh8
	Y6BsA3Iefki1XFBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TxwieGTB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lf4c6zKs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795160200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cRh1HYATXVNzgWhypno6VuZ+diVja1QSq9VuzmoGwAg=;
	b=TxwieGTBirq+XNOwXc2LTb0QXHU9CeZVO25KA8TC1prUQNhMPrhuH8RjtmyKCAYeywI2J/
	Ilrce+Vlz/NBdxf78DjXORIjW13G2/6zIIi2UMDMjLdsW4kryxWLhu728I8kqDb0F2wGfY
	ugk1lTXr2xlgd3f7bpHDL5fByZziJ0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795160200;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cRh1HYATXVNzgWhypno6VuZ+diVja1QSq9VuzmoGwAg=;
	b=lf4c6zKsTA3X8f/pSkc7KnBCflEcTi7D6+AkLib1qJzrB7wcrnTSQWpPSNxnTsAZ27wFh8
	Y6BsA3Iefki1XFBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A42DA1348F;
	Fri, 20 Nov 2026 07:36:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KTu2HYf4/2pdBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Nov 2026 07:36:39 +0000
Date: Fri, 20 Nov 2026 08:36:39 +0100
Message-ID: <874idcned4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.4-rc3
In-Reply-To: <1d2dffbb27f822112be2ca68c0bcf7d8@kernel.org>
References: <1d2dffbb27f822112be2ca68c0bcf7d8@kernel.org>
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
X-Rspamd-Queue-Id: E855C1FB70

On Thu, 19 Nov 2026 23:41:25 +0100,
Mark Brown wrote:
> 
> The following changes since commit aebb7274476403040d582c61478df8f4a7bf9cd3:
> 
>   Linux 7.4-rc3 (2026-11-15 14:30:11 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.4-rc3
> 
> for you to fetch changes up to f66297be665c067d2e96da9ce1c5767b587e17b7:
> 
>   ASoC: tas2781: Avoid possible zero-division (2026-11-19 17:34:26 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.4
> 
> Quite a lot of fixes here together with a few quriks for new devices,
> mostly not particularly remarkable.  The Cirrus changes are relatively
> large but reasonably so, there's a bunch of data table updates and a
> couple of new functions needed and they come with clear reasonining.

Pulled now.  Thanks.


Takashi
