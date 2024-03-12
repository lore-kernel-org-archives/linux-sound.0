Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA78D1419B4
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 18:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710269966; cv=none; b=VQ1uIclc6MJ5w72JaT21w3Tw1N5RYYqEXaq69fvDo7crk79qDvA0e8WERpVGmBJLYg2ulA8dqAO5uOjm6yhhioUys+zfefPlkNzAEiI8l9rvKIRPm67UfjRORpL4bKtY0/dqXtJmweER6zhJlcNX/W2xH43Og5XctH6vnO28yGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710269966; c=relaxed/simple;
	bh=1EqSReACOkb4X0JwerF6ekitRgvzEegA8Gsys4SPN/4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lYjrHBaA6/HoBNbx3ym6ZAkJP7sL22ymxQzZY0NIoQVSmta4ZuIjMNEZZuAd6UDcHcXO7vB4x5O3fMkXPqPFRYr+jXcMHza4Jugdq/SkDvhMOqrDqXbXTZ92sHG9pnt7XeolvaWSnnr0dqw3S+hbE1UNEk4qbFq7oEhz3f3aNpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1rubmYXx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CtqnRhPS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X2+3Tv8m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kVYppCAC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1rubmYXx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CtqnRhPS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X2+3Tv8m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kVYppCAC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EAC7B21BF2;
	Tue, 12 Mar 2024 18:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710269962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l7kf9PDLBhziNCVN23ZKmMbmG5jExsrqeSeMuIn4Ygw=;
	b=1rubmYXxi+R0fSaP28xZM0Aj66uyFh/IYQRNvy5FzS/ZL7S2BB6NxICaa363utfSUtSckP
	QoCz/GuqoKcGheQKd4R+20R+fB4a8GD5gwGAa4X26reEqhAK3IID0sL3mhpeV3OXZW3841
	9yB3503O7gOfs4tQsS7+ylluzOlg/SA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710269962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l7kf9PDLBhziNCVN23ZKmMbmG5jExsrqeSeMuIn4Ygw=;
	b=CtqnRhPSzB/+7gg8G2z8ILJ/rXOc0+MgjzUYpckhBhrhNArW2KgAzUiVGQBXRuhNmihjcP
	7iAUdnQgT2EO6TCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710269959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l7kf9PDLBhziNCVN23ZKmMbmG5jExsrqeSeMuIn4Ygw=;
	b=X2+3Tv8mV9S90lh//urYA97SO0msxJ2D9T2Sgcu2XkEpDLyf6VevNCS1gLFBXa871ABe7q
	uX8PTsLnbf/A5N/OqZwSOm9rIeKeGApxti2mqDtrlLMvz1Lscd8uETVNbWx5Wp8fG9aTug
	Wp74J2UTWkysX05wTn8Ccsh/YFkZNSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710269959;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l7kf9PDLBhziNCVN23ZKmMbmG5jExsrqeSeMuIn4Ygw=;
	b=kVYppCACeKsxxkCLE1PyJGGG2gltt7PAwRjXCUBiImJk6HCN6IOepbmsRsr5a8R/9RbSgl
	oLIEpxx1wNZfUcCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C150613795;
	Tue, 12 Mar 2024 18:59:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KaXaLQem8GV6ewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 12 Mar 2024 18:59:19 +0000
Date: Tue, 12 Mar 2024 19:59:19 +0100
Message-ID: <87msr3p988.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Gergo Koteles <soyer@irl.hu>,
	Shenghao Ding <shenghao-ding@ti.com>
Subject: Re: [PATCH] ALSA: hda/tas2781: remove unnecessary runtime_pm calls
In-Reply-To: <20240312161217.79510-1-pierre-louis.bossart@linux.intel.com>
References: <20240312161217.79510-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=X2+3Tv8m;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kVYppCAC
X-Spamd-Result: default: False [-5.63 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 URIBL_BLOCKED(0.00)[suse.de:dkim,intel.com:email];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.82)[99.22%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: -5.63
X-Rspamd-Queue-Id: EAC7B21BF2
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Tue, 12 Mar 2024 17:12:17 +0100,
Pierre-Louis Bossart wrote:
> 
> The runtime_pm handling seems to have been loosely inspired by the
> cs32l41 driver, but in this case the get_noresume/put sequence is not
> required.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks, applied.


Takashi
