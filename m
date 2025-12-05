Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5B8309F14
	for <linux-sound@vger.kernel.org>; Fri,  5 Dec 2025 14:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764944877; cv=none; b=M4Fi4l0tiJqIO08PGC8GoUdDiL4djc1+/nmXLWhqksSLcaI961NVc+a5XLm1+w3gCc07KKfz/8JXune52NlGitYis3vzJ/j6HeNvjhaqYbBND5vZG+Wj/Y2zvHEmX2mEKRxJyVtsPMydERgTUKB4JXIk83PpXTAbbCmbjvawvVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764944877; c=relaxed/simple;
	bh=Tye4Kegqe8/+XqxFUkpwLpLdLNJ2tDRCsWClecqLMA8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qne83K941u5hJZDGEtUrzETFZEHUeV1POp5aKrsusxvLkNDfUpajTNQ4vjsMBuDn29/74MqFcDqZpkQCD9VfjiLGmxaXCknKzMbbkIvK7ot+xtKbiNeFRkRJ1OtzEnvm+P7DZSGYCdnFKnzdvBlloimmyBUf/qW3WNevEg8VHI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s6OPkFjF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e5vaElZr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fuemJAmj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xYZFFhOd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s6OPkFjF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e5vaElZr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fuemJAmj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xYZFFhOd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B11C75BCDA;
	Fri,  5 Dec 2025 14:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764944873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GV8Sz6/oMBuW7uErm7FpTg0gPSeApLKOwmRX+CStyQY=;
	b=s6OPkFjF/EpMN9GBx2q5iB4skaGI3LWFKaFvLCrxxAhjOe2nQWHlAxH5hT+g+9ko2huo2H
	RSSPbXLlSpt2jQbLWtEqdCtiJ6AnB3cJ9yLMRbvBNRk/uT8e4iBqsAODFjtftMx8b8oMSG
	DrtuAuFh/jGpQnooJ4W0lbmnAXfiKm0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764944873;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GV8Sz6/oMBuW7uErm7FpTg0gPSeApLKOwmRX+CStyQY=;
	b=e5vaElZrkfjWitYS+HJVnAyTk0aMW7KKcak+K9RBm6S3vXjda9BHXv1q/DoEQs4cT+EAiY
	63m72n4rOifU70AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fuemJAmj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xYZFFhOd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764944871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GV8Sz6/oMBuW7uErm7FpTg0gPSeApLKOwmRX+CStyQY=;
	b=fuemJAmjQW4RkVjOZ+8pPYdDKBy8lYNO3Fb88nYlTgWzerd1yOkUjjh1szaIoQIl9XNxtr
	kLp3mzfnflHsPZPGN7F+rOQ4tNJ2aIqF47n7SpDD+hmVQsx2IRr0OfNIhoHLBzEh1WdUrf
	Zx1J+6F1POl7h2lg6lCbE/rsiNgO/c4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764944871;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GV8Sz6/oMBuW7uErm7FpTg0gPSeApLKOwmRX+CStyQY=;
	b=xYZFFhOdther+vVOzvfd0Rtk4wAjPFir0JdYzyZcSeXOP7rjIPrbMDIS4z9nJEaDQ1C53f
	r6A6C1tdkP8fgXBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7662B3EA63;
	Fri,  5 Dec 2025 14:27:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VkXDG+frMmmEBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 05 Dec 2025 14:27:51 +0000
Date: Fri, 05 Dec 2025 15:27:50 +0100
Message-ID: <87qzt9vw9l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Junrui Luo <moonafterrain@outlook.com>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuhao Jiang <danisjiang@gmail.com>
Subject: Re: [PATCH] ALSA: firewire-motu: fix buffer overflow in hwdep read for DSP events
In-Reply-To: <SYBPR01MB78810656377E79E58350D951AFD9A@SYBPR01MB7881.ausprd01.prod.outlook.com>
References: <SYBPR01MB78810656377E79E58350D951AFD9A@SYBPR01MB7881.ausprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ladisch.de,sakamocchi.jp,perex.cz,suse.com,suse.de,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: B11C75BCDA
X-Spam-Flag: NO
X-Spam-Score: -4.51

On Wed, 03 Dec 2025 05:27:03 +0100,
Junrui Luo wrote:
> 
> The DSP event handling code in hwdep_read() could write more bytes to
> the user buffer than requested, when a user provides a buffer smaller
> than the event header size (8 bytes).
> 
> Fix by using min_t() to clamp the copy size, This ensures we never copy
> more than the user requested.
> 
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Reported-by: Junrui Luo <moonafterrain@outlook.com>
> Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>

Applied now.  Thanks.

BTW, the code there has another bug; the loop of put_user() above your
change doesn't check whether it has an enough remaining size.  When
count isn't aligned with 4 bytes, it might cause a similar overwrite.
It has to be corrected, too.


Takashi
