Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF8C17B50F
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520068; cv=none; b=CmOa3eGVezt98KUUos18tJ5bITYAOkd0t7xx6nvT/GzifE5ngYhNosceXU/AuTcMsYGV0IqxpJxIaKADdH4vWxMT4EUYeqIAYy4UBtojqHKR5VvDjw/tkd8MzpOaLl7F05ZGnxs/gRxc+JbezTWcCmy31R5q0sKsC7NPOLXsrmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520068; c=relaxed/simple;
	bh=rimOVgngoN1WAtay3fMITow4YjVgVxKsOO0+274eNbI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OFQRhXCb5otN9aJPf4vFkQ+Nv1rgbpoSuCdyGLqrK0srczOwH4P8gncisWSC2lOz1j9MpA7Fx5u7Vf1YCrkXw4FDevrztatyJWXYGNUh5H1zMBCjgcN6lK1iSxZSSTX8uI8h7zBpnXFWFaSo48/LKPgxWsm0aPi748fQV4gFPaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hvI5afwj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NSYcBQJL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v2wvozya; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yf2ncch/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hvI5afwj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NSYcBQJL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v2wvozya";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yf2ncch/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3840F3E49;
	Wed, 12 Aug 2026 07:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786520061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KqdU16c0AhH8rl2CM6awZue2CoT+bYJAdbEoeDpxylE=;
	b=hvI5afwjA9JQpnQr8aWeNF1sAOOtKcCR7JfcXmg+R+Z0tRatZd+/EpeTB2LmR5YTe0rkhf
	uZg90/MnALvf3BvoVrsm2UO2wTk9SxNaKhxPtuCz4x4h6WmPmdhKlMbCQ4FVYrjgrb2G0h
	1qgjrJMqUZyCkGTMp3zUiJybjpFYqkk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786520061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KqdU16c0AhH8rl2CM6awZue2CoT+bYJAdbEoeDpxylE=;
	b=NSYcBQJL76XXPQFTtdSv+5vau6HpZYWBLIVaFNeer/h0LyzTUWqv5OPDw6Hju3OWxXmpNz
	WG1ZnOoZ1+yzbxDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786520057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KqdU16c0AhH8rl2CM6awZue2CoT+bYJAdbEoeDpxylE=;
	b=v2wvozyaQSB+jhoxJRxjFIhhNF6OIan5ab0YgYa/f7XeVXQjGnoBsDZGUgzEU5XAAS46el
	wpcGKwSKj8iIp1hUHF1Roa/V2RCx8FKspoKoXaaIv+yDONHgELCnhnrqmTxW9M7VGhomxB
	CwdnIsg9o9tp37+QJIqH9zIoTmK4myY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786520057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KqdU16c0AhH8rl2CM6awZue2CoT+bYJAdbEoeDpxylE=;
	b=yf2ncch/oGdsGQKGoB4fdrQJbeCnY0U2a6062iPx7yTv13w6bQAGJBZUiB4SWx2/wMuIbG
	CTnoPm9GIVMwuEBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB501779B3;
	Wed, 12 Aug 2026 07:34:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JOgnOPghfGo+DwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 07:34:16 +0000
Date: Wed, 12 Aug 2026 09:34:16 +0200
Message-ID: <87ecg323nr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH 00/14] ALSA: Drop __bitwise and __force prefix
In-Reply-To: <5491df9f-f531-40c6-9491-07241b0cc703@intel.com>
References: <20260812060557.80445-1-tiwai@suse.de>
	<5491df9f-f531-40c6-9491-07241b0cc703@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,baylibre.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Wed, 12 Aug 2026 09:27:21 +0200,
Cezary Rojewski wrote:
> 
> On 8/12/2026 8:04 AM, Takashi Iwai wrote:
> > Hi,
> > 
> > this is a series of cleanup patches to kill the infamous __bitwise and
> > __force prefix usage for some PCM and control parameter types.
> > They were added ages ago just for code safety, but its effect is quite
> > limited, while the drawback is significant.  Let's drop them.
> Thank you for cleaning this up. For the series:
> 
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> 
> sidetopic: Had to review via web browser as only 2 patches (00 and 12)
> went through to my inbox for whatever reason.

It was intentional, I tried to reduce Cc only for a relevant patch and
a cover letter, as people often complaining when receiving unrelated
patches.  The whole series should be available via ML, though.


thanks,

Takashi
