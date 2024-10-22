Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F5A19F10A
	for <linux-sound@vger.kernel.org>; Tue, 22 Oct 2024 14:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729606497; cv=none; b=p6vYoDUt8u8AYGH9CfI+ToYYo/dTocjpCzOcDl0hdfu85TB9zO8dEzE7TFarT1yl35mB/ClOBY0HCOD/KhXmerWvniWEOdB4yoEYkYJ0buGFW8TtzVYii7VF6WWyPA31JmLcvt8+YOv7qdt/uv+ypd7CHRct33A8Kd2DV/KImoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729606497; c=relaxed/simple;
	bh=PYnKEPS+QCRqajw4t4Y4LKoMQKDdeFh/sPGwhyOfNWs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c/IFK5aXzAWXncpbN24pJd9xhcnTGnGgFZhbJ0ezCQaIEbXV3E8MeANm2bCtf9HWCJ2vqqJcj/FLnwQcv6xOWsxaDTJJb6KjSfIKY0H0HinrtDcy+/Walkkn852CYOE7jVyHHiXlnrIzZc6+SXH9l2weqe6rxTxv1OrUR1/FO4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bwdnyHc5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O77EFVEM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bwdnyHc5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O77EFVEM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bwdnyHc5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O77EFVEM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bwdnyHc5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O77EFVEM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 377EE1FD15;
	Tue, 22 Oct 2024 14:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729606493; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=he4aHzTTnPQf07XjgjhNfP1pEquhJMh3tzlhKP0seeM=;
	b=bwdnyHc5WJ0FdvRGszOvL/ipBizoD7Qnzukv3rI5RWnBPNlbsJTJ1TALWEtVb1VjcIPV8U
	+umKvJ3xcXGO+DatNaAQaUotK0m/qjJ/wVUAJhRuNnRVNnIlZltlgTsF5QVr91Y9Dv6Fq0
	S2Q/acBhYuutyja1DrR7Qx8/BoeIRhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729606493;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=he4aHzTTnPQf07XjgjhNfP1pEquhJMh3tzlhKP0seeM=;
	b=O77EFVEM1f9EJFrm4WWkgrKp2xiSgXxmIkBP2JMPdlUO1gZuGxzIXT65IIqCby5Di75OH2
	91rxkJ1//JKi/5Aw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bwdnyHc5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=O77EFVEM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729606493; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=he4aHzTTnPQf07XjgjhNfP1pEquhJMh3tzlhKP0seeM=;
	b=bwdnyHc5WJ0FdvRGszOvL/ipBizoD7Qnzukv3rI5RWnBPNlbsJTJ1TALWEtVb1VjcIPV8U
	+umKvJ3xcXGO+DatNaAQaUotK0m/qjJ/wVUAJhRuNnRVNnIlZltlgTsF5QVr91Y9Dv6Fq0
	S2Q/acBhYuutyja1DrR7Qx8/BoeIRhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729606493;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=he4aHzTTnPQf07XjgjhNfP1pEquhJMh3tzlhKP0seeM=;
	b=O77EFVEM1f9EJFrm4WWkgrKp2xiSgXxmIkBP2JMPdlUO1gZuGxzIXT65IIqCby5Di75OH2
	91rxkJ1//JKi/5Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 187D613894;
	Tue, 22 Oct 2024 14:14:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hzleBV2zF2cCbgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 22 Oct 2024 14:14:53 +0000
Date: Tue, 22 Oct 2024 16:15:53 +0200
Message-ID: <87seso2pgm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Linux Sound ML <linux-sound@vger.kernel.org>,	Takashi Iwai
 <tiwai@suse.de>,	Mark Brown <broonie@kernel.org>,	Shengjiu Wang
 <shengjiu.wang@gmail.com>,	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v6] ALSA: compress_offload: introduce accel operation mode
In-Reply-To: <20241002093904.1809799-1-perex@perex.cz>
References: <20241002093904.1809799-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 377EE1FD15
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.de,kernel.org,gmail.com,ndufresne.ca,linux.intel.com,linux.dev];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Wed, 02 Oct 2024 11:39:04 +0200,
Jaroslav Kysela wrote:
> 
> There is a requirement to expose the audio hardware that accelerates various
> tasks for user space such as sample rate converters, compressed
> stream decoders, etc.
> 
> This is description for the API extension for the compress ALSA API which
> is able to handle "tasks" that are not bound to real-time operations
> and allows for the serialization of operations.
> 
> For details, refer to "compress-accel.rst" document.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> Cc: Amadeusz S³awiñski <amadeuszx.slawinski@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>

Are there any objections to this extension?
Otherwise I'd like to pick up for 6.13.


thanks,

Takashi
