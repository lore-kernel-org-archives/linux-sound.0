Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E7838FF18
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 13:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768310088; cv=none; b=mIFMJ4DCglB43Yw656sBzy1UzzAG+DiFVs2ry1u4vbbVoOZW4f6C99/21o2Bm7Owd5UfyROJsoVJMIW8ybRSfl0wAICSX/BnJ11LsxHfr5qEo//f1n5Kes/uHNwu0cfL19eAmuS1oxEA8KLIxQ46WpTQffKTRjgBfIwYtyRIYtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768310088; c=relaxed/simple;
	bh=KMFLpFp4I3/asoQyXYB05OsNosdxiTavq56j3pfiofA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZlLbojXl+7LlQoX5Gd86WSs158hIDjWwNhx5prQETVn2FwyNcT9sEqUQfJa6QRjXQ6k9lu2L4xi8PdtAHWsZuHZWnQfZ2qOTN8MPyXwU9tm1e3oj7yx8v4Cv8j6vYPGKhJjHgL7cLeZy+azYVCIUEzqMmTkK2eq9aOSbK09JTQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=soloNGuE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4YTAetbE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=soloNGuE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4YTAetbE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="soloNGuE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4YTAetbE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="soloNGuE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4YTAetbE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3CEEB5BCE9;
	Tue, 13 Jan 2026 13:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768310085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vh7sDl0E6CirIh7woOSgM6fI2bPonC2mkgdKC8CnyqY=;
	b=soloNGuE90tcE5Rq0/vWDP8j+1ESRDiKyObb5coIcxLkTdk5PT0+jHQD6c7DDdPFhi6m+5
	nT6QtZZdJO1ztXuToHOWAF5A8vhtBc5zxOiaFPVies9L8O48qrblT8UK//DyNlnFVHW64R
	Gs6UBABz3VfOSuMCNicOdDijADdKWXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768310085;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vh7sDl0E6CirIh7woOSgM6fI2bPonC2mkgdKC8CnyqY=;
	b=4YTAetbEvJRz1Xvi7cikNS9QUlYsaGHf1/dgpq/LohFR9dHOIPxcI4ydB6Fe4d1Z1T6a+4
	fTfAFEJNc13VgNAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=soloNGuE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4YTAetbE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768310085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vh7sDl0E6CirIh7woOSgM6fI2bPonC2mkgdKC8CnyqY=;
	b=soloNGuE90tcE5Rq0/vWDP8j+1ESRDiKyObb5coIcxLkTdk5PT0+jHQD6c7DDdPFhi6m+5
	nT6QtZZdJO1ztXuToHOWAF5A8vhtBc5zxOiaFPVies9L8O48qrblT8UK//DyNlnFVHW64R
	Gs6UBABz3VfOSuMCNicOdDijADdKWXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768310085;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vh7sDl0E6CirIh7woOSgM6fI2bPonC2mkgdKC8CnyqY=;
	b=4YTAetbEvJRz1Xvi7cikNS9QUlYsaGHf1/dgpq/LohFR9dHOIPxcI4ydB6Fe4d1Z1T6a+4
	fTfAFEJNc13VgNAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 075373EA63;
	Tue, 13 Jan 2026 13:14:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YDHiAEVFZmntAwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Jan 2026 13:14:45 +0000
Date: Tue, 13 Jan 2026 14:14:39 +0100
Message-ID: <87zf6hpscg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda/cirrus_scodec_test: Fix incorrect setup of gpiochip
In-Reply-To: <20260113130954.574670-1-rf@opensource.cirrus.com>
References: <20260113130954.574670-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 3CEEB5BCE9
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Tue, 13 Jan 2026 14:09:54 +0100,
Richard Fitzgerald wrote:
> 
> Set gpiochip parent to the struct device of the dummy GPIO driver
> so that the software node will be associated with the GPIO chip.
> 
> The recent commit e5d527be7e698 ("gpio: swnode: don't use the
> swnode's name as the key for GPIO lookup") broke cirrus_scodec_test,
> because the software node no longer gets associated with the GPIO
> driver by name.
> 
> Instead, setting struct gpio_chip.parent to the owning struct device
> will find the node using a normal fwnode lookup.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: 2144833e7b414 ("ALSA: hda: cirrus_scodec: Add KUnit test")

Applied now.  Thanks.


Takashi
