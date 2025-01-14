Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D14236A96
	for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 13:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736860575; cv=none; b=NFyBj7SO1V5VchVOzjRvnPhsMfYSYEhxGmmRWu2SdmYlJZm+YPwCJCvVn35fgp1bO5vztS0urf83YFe4eVdwaTYu+Pv20ofaRR4p3gfP3keRYNWKJG90qAcHOQrs+Hca33INtdF3AiqtBpAMbqj1wuZ7omwGjy0Wdn/OfnNAYfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736860575; c=relaxed/simple;
	bh=WO19nlWM7CGc0Reml8TCdKXJIFLBSYNZScA7c9gIx3o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N1PSAlpeA43mAU3AHOQL9lG73ta5vFkvS/NitSQsQjHBALv9FQqEo7YjH06XMd8+fblmmbENnK//hIw6Eutq8MOqTPwf5CH9KFG+5gdNE0MwQVyRWTuzUFHLOa9QONWCKmg1IzjITqZt0ikyX0INpBxJ4x4GG4+tyO6V2R56UBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OTCf0OKA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pNKWE+9h; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OTCf0OKA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pNKWE+9h; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OTCf0OKA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pNKWE+9h";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OTCf0OKA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pNKWE+9h"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1BC921F37C;
	Tue, 14 Jan 2025 13:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736860572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fnAyL4u1c0ou59iKgOiab/oM33gIxTY1zK7p1ZoOexU=;
	b=OTCf0OKAcM3aTZ1vNpf1vjCGBMdn00YvnjwFGYwmFO6wcnVjPdERfPDPGks80vptWPnelJ
	M64atg2xGTjNFZWENvx7u8YXGBgBdyMXQYA5T7x25//QAbIKCUpMmFk2UGKt2ljZxZFV84
	pIKPu7OUN2U9OHpQrgcM/Y0g/ARNmFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736860572;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fnAyL4u1c0ou59iKgOiab/oM33gIxTY1zK7p1ZoOexU=;
	b=pNKWE+9hrN62nFio/z5fWTw8wAn32tpIJrd9km8nLo1tuc9Wm2nMbTzrMHe19aXTuFBd/l
	j+txIQBY/tyd8tBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OTCf0OKA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pNKWE+9h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736860572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fnAyL4u1c0ou59iKgOiab/oM33gIxTY1zK7p1ZoOexU=;
	b=OTCf0OKAcM3aTZ1vNpf1vjCGBMdn00YvnjwFGYwmFO6wcnVjPdERfPDPGks80vptWPnelJ
	M64atg2xGTjNFZWENvx7u8YXGBgBdyMXQYA5T7x25//QAbIKCUpMmFk2UGKt2ljZxZFV84
	pIKPu7OUN2U9OHpQrgcM/Y0g/ARNmFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736860572;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fnAyL4u1c0ou59iKgOiab/oM33gIxTY1zK7p1ZoOexU=;
	b=pNKWE+9hrN62nFio/z5fWTw8wAn32tpIJrd9km8nLo1tuc9Wm2nMbTzrMHe19aXTuFBd/l
	j+txIQBY/tyd8tBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F13961384C;
	Tue, 14 Jan 2025 13:16:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nmXBOZtjhmdrQgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 13:16:11 +0000
Date: Tue, 14 Jan 2025 14:15:56 +0100
Message-ID: <87ed15zgc3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda: Transfer firmware in two chunks
In-Reply-To: <20250114125813.11567-1-cezary.rojewski@intel.com>
References: <20250114125813.11567-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 1BC921F37C
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 14 Jan 2025 13:58:13 +0100,
Cezary Rojewski wrote:
> --- a/include/sound/hdaudio.h
> +++ b/include/sound/hdaudio.h
> @@ -577,6 +577,8 @@ struct hdac_stream *snd_hdac_get_stream(struct hdac_bus *bus,
>  
>  int snd_hdac_stream_setup(struct hdac_stream *azx_dev, bool code_loading);
>  void snd_hdac_stream_cleanup(struct hdac_stream *azx_dev);
> +int snd_hdac_stream_setup_bdle(struct hdac_stream *azx_dev, struct snd_dma_buffer *dmab,
> +			       struct snd_pcm_runtime *runtime);

Will you use this function by other driver in future?
Otherwise it makes little sense to export this function.


thanks,

Takashi
