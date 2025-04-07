Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF63B20011B
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040423; cv=none; b=dMAmoTDeaQj8Hem8i3T3xIaNKJL3NZ/ur6QeOkY+0lj4wlDru0fs3cXWNFzSk0R0W2+A3sGSagJrK0Y3RAPRWJLMEm/SZGhRH2M0R5OaalHuVSSY077nVkzy0c28NsugXBOACLc9wKdHZxcdmm3M1bEgizUZpEAnvebT8G37s0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040423; c=relaxed/simple;
	bh=EtV6UG8MD2MF6tzfwi+zFO31yGc5I4dZwiFPYptN2qU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oXefrCPY+EXntObdRlV15jzZCq9WL4i2cZvIki4mhCslqy1ZJbiXKiqm1GN18M+rN3qINMPCUcnYIE2bXhpkfJQLEGKv6lnfimSE4J8mFtSJdoEjUMmr02YRmtw2i1340cah1kglUQaJeYWK7MMeoWJwx1XgjUmp9nE/jvJEi0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jHWROt9E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HMZmTPwX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jHWROt9E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HMZmTPwX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jHWROt9E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HMZmTPwX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jHWROt9E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HMZmTPwX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 943951F78D;
	Mon,  7 Apr 2025 15:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744040419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mEENYZn6d7uOFdGC8dohbv5AIC4029g7MavASOmNHMo=;
	b=jHWROt9EuXUqVlO+yhLvMnd0Q2qL02Au5La8+YnXvKChsiXC1T37aw4WNG92TFKsjeJz3k
	12+JxxQQt4NavtEIi16YHjSGkJTx+w6QzCGu1cEIsiTlP5fqfKS95dsuC5/ODih/hs+3pO
	abnZow6WW2i51MAPfLksZlpeftEgtqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744040419;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mEENYZn6d7uOFdGC8dohbv5AIC4029g7MavASOmNHMo=;
	b=HMZmTPwX06plHpM2duVxMGPXe/NifkE098HlBVPN97H0WldIty+drrO/r4QF1y/4qUaYEL
	fnGe9xZLAV8G2ABA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jHWROt9E;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HMZmTPwX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744040419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mEENYZn6d7uOFdGC8dohbv5AIC4029g7MavASOmNHMo=;
	b=jHWROt9EuXUqVlO+yhLvMnd0Q2qL02Au5La8+YnXvKChsiXC1T37aw4WNG92TFKsjeJz3k
	12+JxxQQt4NavtEIi16YHjSGkJTx+w6QzCGu1cEIsiTlP5fqfKS95dsuC5/ODih/hs+3pO
	abnZow6WW2i51MAPfLksZlpeftEgtqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744040419;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mEENYZn6d7uOFdGC8dohbv5AIC4029g7MavASOmNHMo=;
	b=HMZmTPwX06plHpM2duVxMGPXe/NifkE098HlBVPN97H0WldIty+drrO/r4QF1y/4qUaYEL
	fnGe9xZLAV8G2ABA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C6E513A4B;
	Mon,  7 Apr 2025 15:40:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1IkLFePx82e7QQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 07 Apr 2025 15:40:19 +0000
Date: Mon, 07 Apr 2025 17:40:18 +0200
Message-ID: <871pu4c74t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: xiaopeitux@foxmail.com
Cc: ivan.orlov0322@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	Pei Xiao <xiaopei01@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ALSA: kunit: fix build warning in test_card_set_id
In-Reply-To: <tencent_7F01F2D14BF724692ECBF5346283DB9BCA05@qq.com>
References: <tencent_7F01F2D14BF724692ECBF5346283DB9BCA05@qq.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 943951F78D
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[foxmail.com];
	FREEMAIL_ENVRCPT(0.00)[foxmail.com,gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org,kylinos.cn,intel.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,intel.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Mon, 07 Apr 2025 11:21:36 +0200,
xiaopeitux@foxmail.com wrote:
> 
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> build W=1 warning:
> sound/core/sound_kunit.c: In function 'test_card_set_id':
>    include/linux/printk.h:455:44: warning: '%s' directive argument is null [-Wformat-overflow=]
> 
> Fix -Wformat-overflow warning when card->id could be NULL.
> The kunit_info() call with "%s" format specifier may receive a NULL
> pointer from card->id. Add a ternary conditional to safely handle
> potential NULL values by substituting "(null)" when card->id is NULL.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504050922.ZzbkiojG-lkp@intel.com/
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Thanks, applied now.  I added Fixes tag manually
(Fixes: 3e39acf56ede ("ALSA: core: Add sound core KUnit test"))

But at the next time, please try to put the proper Fixes tag.


Takashi
