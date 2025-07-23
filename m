Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2A72F4326
	for <linux-sound@vger.kernel.org>; Wed, 23 Jul 2025 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753281661; cv=none; b=seNuv0WggWpgS4AJc/PRoDcBTYkDazw53SQA5Qt5wvEHs4fwM69lA3LoipT1SYT0zyl8wZkPkfd90N7vAJNYgE0ExOpoFuLSQXaH+DesTmTTOg4xizU9+OudWjD1qYPiDFUcpdbYTmoVJQukP2MXmTmm9y/2F03oQuqQaNcWIh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753281661; c=relaxed/simple;
	bh=zLAJGGmUP95OahWpwjf9yZbRc4D7/Z4m30jxRY/IDec=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CEw4S/BFqYIjcLbjTShUuLmsyELJHQQk7/Z+hVwCXM14YYThEyMP2Zw5jLeQ33BHsh02qWJwY8VKx3EE1FUIuvCvIZH18ChxgNGEfTG3GTfselAOdmPa9XpszmMhlYGR/ZwKCYk3sIUFgWFWH+Ey06v2kdldlBz49ztDhueBc2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=My3UvYNc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EZX3CF1M; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=My3UvYNc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EZX3CF1M; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="My3UvYNc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EZX3CF1M";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="My3UvYNc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EZX3CF1M"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6372F21901;
	Wed, 23 Jul 2025 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753281657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qGgoliSEG61NIVwEYiwumN7ypd1yaYTj8dnibkQ2s+U=;
	b=My3UvYNccadCldt2MAAlZeTCEd28HsJMg6rVhWZiHvD+gqkcxcmOr6peZvR8cxIrN3TA3X
	Lwu3AH8JnUOqWdhqPPFue2Xzis5iXaNYtMu/ROnzV6NRMgPZKaZ2w9YiQ1B4AxXn+Ic9RK
	jmFFIZAf3cBxpABEyzfHluNnzJMY4BE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753281657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qGgoliSEG61NIVwEYiwumN7ypd1yaYTj8dnibkQ2s+U=;
	b=EZX3CF1MomUg0EWtXMC0+62AfKLCxL3SiXbxlUyBApHsP3SDYG0Be3giEcCWjY2vCbHM/7
	nh7RmCVBGD93TkBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=My3UvYNc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EZX3CF1M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753281657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qGgoliSEG61NIVwEYiwumN7ypd1yaYTj8dnibkQ2s+U=;
	b=My3UvYNccadCldt2MAAlZeTCEd28HsJMg6rVhWZiHvD+gqkcxcmOr6peZvR8cxIrN3TA3X
	Lwu3AH8JnUOqWdhqPPFue2Xzis5iXaNYtMu/ROnzV6NRMgPZKaZ2w9YiQ1B4AxXn+Ic9RK
	jmFFIZAf3cBxpABEyzfHluNnzJMY4BE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753281657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qGgoliSEG61NIVwEYiwumN7ypd1yaYTj8dnibkQ2s+U=;
	b=EZX3CF1MomUg0EWtXMC0+62AfKLCxL3SiXbxlUyBApHsP3SDYG0Be3giEcCWjY2vCbHM/7
	nh7RmCVBGD93TkBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2360F13302;
	Wed, 23 Jul 2025 14:40:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I25BB3n0gGhhNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 23 Jul 2025 14:40:57 +0000
Date: Wed, 23 Jul 2025 16:40:56 +0200
Message-ID: <87bjpbm0lj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>,
	<13916275206@139.com>,
	<v-po@ti.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ALSA: hda: Add TAS2770 support
In-Reply-To: <20250723142423.38768-1-baojun.xu@ti.com>
References: <20250723142423.38768-1-baojun.xu@ti.com>
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
X-Rspamd-Queue-Id: 6372F21901
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,alsa-project.org,ti.com,139.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Wed, 23 Jul 2025 16:24:23 +0200,
Baojun Xu wrote:
> 
> Add TAS2770 support in TI's HDA driver. And add hda_chip_id for
> more products. Distinguish DSP and non-DSP in firmware
> loading function.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Applied now, thanks.


BTW, is include/sound/tas2770-tlv.h used by any other driver?
(Also include/sound/tas2781-tlv.h).

If those are used only by tas2781-hda-i2s/spi drivers, the files can
be moved to sound/hda/codecs/side-codecs as local headers.

In general, include/sound is rather for public headers that are read
by multiple drivers in different places.


thanks,

Takashi
