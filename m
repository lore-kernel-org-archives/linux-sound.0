Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4146C15A868
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 08:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729846586; cv=none; b=J7DyeclrGkhxetC/a2NMCvlFh421wAdeeInbR3s0U46QTWoZyLz59QI3nBlHu0K+0PkPn1/v3r5UaexjWIbsJxIj7kz5V6TDLm54GmSe1j/feZn6xadsEFv88OzxE5FtYnwPzdDa8EibUwE+bzKU7IowWq58ze2s2ze2RQ9NVdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729846586; c=relaxed/simple;
	bh=tZyX2fl1/Ql9bQnnA8Eti/Z+MYmve/GwcakR1O3abHA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nlHVTwwOQ5cCOuv1RO6biFfkQSuiuKrHs7XQB9gArnt5l6FU+5amin9sLF07APt/vtQRq/AQh47qfyM+tWOw60X5QCUn180nJRRVsxNlnvIN/Vxn3s2p6jPmxO+5teOO7UmVT7J3f/VTqBxrQqU2qwYJjfnT3kiYLu9H8B41+kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZolxMF7v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0W7NVhe6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZolxMF7v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0W7NVhe6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZolxMF7v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0W7NVhe6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZolxMF7v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0W7NVhe6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 313BD1F7D6;
	Fri, 25 Oct 2024 08:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729846582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tdKUtQv4VgtoLe6/K9eN01gwAJexE2AgcxmS2JcyVwo=;
	b=ZolxMF7vqHz3jtjOlpw2nhimCFFli+m/pC+BLBCscVMbM3qIXmWzJEKBd6vBOs25DsV+sV
	OJybB+/YL4cFhTGADKQ1fAu4iK7ZmpUnyxlDysv/3sWATVWeijkPcILF5ZAJEEUlsTkl6V
	2wqc0WkjYtRoCK5RFMm7hBSXzk3Mp5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729846582;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tdKUtQv4VgtoLe6/K9eN01gwAJexE2AgcxmS2JcyVwo=;
	b=0W7NVhe6VpCZm+kcgUURV9eVjxR0u96xCxaIY15MQYamE0tPFOjJh+xQQbM9mMAz+Z+Fw/
	VcFdicQRMaTF6tCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZolxMF7v;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0W7NVhe6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729846582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tdKUtQv4VgtoLe6/K9eN01gwAJexE2AgcxmS2JcyVwo=;
	b=ZolxMF7vqHz3jtjOlpw2nhimCFFli+m/pC+BLBCscVMbM3qIXmWzJEKBd6vBOs25DsV+sV
	OJybB+/YL4cFhTGADKQ1fAu4iK7ZmpUnyxlDysv/3sWATVWeijkPcILF5ZAJEEUlsTkl6V
	2wqc0WkjYtRoCK5RFMm7hBSXzk3Mp5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729846582;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tdKUtQv4VgtoLe6/K9eN01gwAJexE2AgcxmS2JcyVwo=;
	b=0W7NVhe6VpCZm+kcgUURV9eVjxR0u96xCxaIY15MQYamE0tPFOjJh+xQQbM9mMAz+Z+Fw/
	VcFdicQRMaTF6tCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E669813B16;
	Fri, 25 Oct 2024 08:56:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FEaANjVdG2fcawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 25 Oct 2024 08:56:21 +0000
Date: Fri, 25 Oct 2024 10:57:23 +0200
Message-ID: <875xpgtv9o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Linux Sound ML <linux-sound@vger.kernel.org>,	Mark Brown
 <broonie@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,	Nicolas
 Dufresne <nicolas@ndufresne.ca>,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v6] ALSA: compress_offload: introduce accel operation mode
In-Reply-To: <87seso2pgm.wl-tiwai@suse.de>
References: <20241002093904.1809799-1-perex@perex.cz>
	<87seso2pgm.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 313BD1F7D6
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,ndufresne.ca,linux.intel.com,linux.dev];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,intel.com:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 22 Oct 2024 16:15:53 +0200,
Takashi Iwai wrote:
> 
> On Wed, 02 Oct 2024 11:39:04 +0200,
> Jaroslav Kysela wrote:
> > 
> > There is a requirement to expose the audio hardware that accelerates various
> > tasks for user space such as sample rate converters, compressed
> > stream decoders, etc.
> > 
> > This is description for the API extension for the compress ALSA API which
> > is able to handle "tasks" that are not bound to real-time operations
> > and allows for the serialization of operations.
> > 
> > For details, refer to "compress-accel.rst" document.
> > 
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> > Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> > Cc: Amadeusz S³awiñski <amadeuszx.slawinski@linux.intel.com>
> > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> 
> Are there any objections to this extension?
> Otherwise I'd like to pick up for 6.13.

Now the patch got merged to for-next branch for 6.13.

I opened a topic branch "topic/compress-accel" that is cleanly based
on 6.12-rc4.  The further development can be based on this one.


thanks,

Takashi
