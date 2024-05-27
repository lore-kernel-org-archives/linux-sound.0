Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80431249FF
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716808228; cv=none; b=NHFf9jT23VnQZfbb2+XxESkB5cjlCi2LCXDAzZo1xXcV7QcIvl7tfU/EfVlFrQk+xm673Eu9h7/PX/mE6ZcocdmmFRlsD8ncDnr4gmRUAkdlJydevpF99TlpUWE3YoEvwbMCn4gGFTYpBeejWjJ0pModfWr/SF5tsapbR+rqur4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716808228; c=relaxed/simple;
	bh=wtpeaW55fV0OLlpEZiF9PDVIefmmwDlwziBwOGCYm/w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j03YmOqz4gWJbUS/QRuu9fKgyOxYkx9Tj+Wg12odLFWB0W9RQEE1rqC7hDW8BzPeJEcOZGDQAQB5LkdU1+WngimgZdz02mRx/yler1m3xewevSP3SZOgJyCSyLoUV6zpjJO0h9mnpJZCJiKzqFVbb+eCG8uLN/ShTLk5MkK3bDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zxl//wC0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UmvTve5Z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zxl//wC0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UmvTve5Z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zxl//wC0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UmvTve5Z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zxl//wC0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UmvTve5Z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7611D1FD6D;
	Mon, 27 May 2024 11:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716808225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D8JMVQLtuMAcXmvHa5OsCuhX/Qmw5MGQXTxfSpDGCPk=;
	b=zxl//wC0uPKpInZFmiAremqJiFI2rO9ONRArn1QHTsC9Wy7nbQGMpiS9y1OFxOp4HzM+22
	Vy9DSBwzy2dC3+kJ9uHU1hG6qdNzY40THDRzNLMD5sgZ0baqhe2OBIndfPBl9r05XKbUId
	3r8sPywrxI1mxfGvrATci4fpcWpBBZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716808225;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D8JMVQLtuMAcXmvHa5OsCuhX/Qmw5MGQXTxfSpDGCPk=;
	b=UmvTve5ZUb/d5MTVZVFwztWK8gKFLpeY52spoWOfRRW8HZep2s0MTSD291R7f+mmY4xT9G
	KDmxb1x6xXFV0MDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="zxl//wC0";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UmvTve5Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716808225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D8JMVQLtuMAcXmvHa5OsCuhX/Qmw5MGQXTxfSpDGCPk=;
	b=zxl//wC0uPKpInZFmiAremqJiFI2rO9ONRArn1QHTsC9Wy7nbQGMpiS9y1OFxOp4HzM+22
	Vy9DSBwzy2dC3+kJ9uHU1hG6qdNzY40THDRzNLMD5sgZ0baqhe2OBIndfPBl9r05XKbUId
	3r8sPywrxI1mxfGvrATci4fpcWpBBZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716808225;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D8JMVQLtuMAcXmvHa5OsCuhX/Qmw5MGQXTxfSpDGCPk=;
	b=UmvTve5ZUb/d5MTVZVFwztWK8gKFLpeY52spoWOfRRW8HZep2s0MTSD291R7f+mmY4xT9G
	KDmxb1x6xXFV0MDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A5A513A6B;
	Mon, 27 May 2024 11:10:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xhoCCSFqVGZwZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 May 2024 11:10:25 +0000
Date: Mon, 27 May 2024 13:10:46 +0200
Message-ID: <87ed9na4sp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [RFC PATCH] ALSA: compress_offload: introduce passthrough operation mode
In-Reply-To: <e5300791-e702-4868-a442-94162f2e1a97@linux.intel.com>
References: <20240527071133.223066-1-perex@perex.cz>
	<e5300791-e702-4868-a442-94162f2e1a97@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.56 / 50.00];
	BAYES_HAM(-2.55)[97.98%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,vger.kernel.org,suse.de,kernel.org,gmail.com,ndufresne.ca,linux.intel.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7611D1FD6D
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.56

On Mon, 27 May 2024 12:13:30 +0200,
Amadeusz S³awiñski wrote:
> 
> > +static int snd_compr_task_status(struct snd_compr_stream *stream,
> > +					struct snd_compr_task_status *status)
> > +{
> > +	struct snd_compr_task_runtime *task;
> > +
> > +	task = snd_compr_find_task(stream, status->seqno);
> > +	if (task == NULL)
> > +		return -EINVAL;
> > +	status->output_size = task->output_size;
> > +	status->active = task->active ? 1 : 0;
> > +	status->finished = task->finished ? 1 : 0;
> 
> Not sure, but access to ->active and ->finished, feels to me like
> something that may require locking.

Or better to make it a single state field?


thanks,

Takashi
