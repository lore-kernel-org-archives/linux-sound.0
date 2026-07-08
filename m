Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517E042B722
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 10:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508083; cv=none; b=CUmas8F+B5Lsm8WW71VsANOlczVM0McxcKIeuY3xtREdmT6ObmcTy8n/IAisiRvAlFE5bMel1Rvy751OePmuw0nMowAdgJbpEP3A4qVTEX8wnwGG3ANjK9urELS6QXMRiL1XnPBnGhxnU4DBr9dadlyIL6dZGp8DRnSVMoXMDBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508083; c=relaxed/simple;
	bh=p+CDXCZzjOMBQ1PHwxoOHfDOaU7+kdCiWfy51Zazzds=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZW9Ou/a/r7Fm6w1M1ZYuAqpccqh4tTklkod716Nm6XGUKb+Xyk64uac3dyJ8Ny4+B0RPKatKP7/gz0PFKPKWO2C1TFtZxuN+U+ii5Qfb1nF03BdOpQuVCv8jhPHbwfgE8L61J7ETQuJTBUEWyj1kzDlW0oMSj4Ta2Mph9d1fSds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J60MkYk7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rdMsf1Cx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J60MkYk7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rdMsf1Cx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J60MkYk7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rdMsf1Cx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J60MkYk7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rdMsf1Cx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DE6F3758C3;
	Wed,  8 Jul 2026 10:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783508076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MV+KT9Q6gA/FC+sDTZrMMCwZHl/E+GQ/ErbBLm590NE=;
	b=J60MkYk7WpFBlHq2tO9ZCkfRvXYd0BeTp700m/ap2p5TFRmc1AQOEFJwJEi7fm8ottMPbV
	nrTbfz97TmDt/lX+h2FdhekTd1+JkIWjYXvC6NQeaN8FLXdFnd8MaqYp4q2ZwhJ9+Q2kJQ
	jMo12P4bOy0o31eqiKsLki6QJeNxvMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783508076;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MV+KT9Q6gA/FC+sDTZrMMCwZHl/E+GQ/ErbBLm590NE=;
	b=rdMsf1CxDjMZB60vTgg7sPqb3n2OrsyVvI7pAzOJi026YUVAIajcUKSD8GW1CDSTQprc55
	mvQRaJ3o3Dx+kxAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783508076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MV+KT9Q6gA/FC+sDTZrMMCwZHl/E+GQ/ErbBLm590NE=;
	b=J60MkYk7WpFBlHq2tO9ZCkfRvXYd0BeTp700m/ap2p5TFRmc1AQOEFJwJEi7fm8ottMPbV
	nrTbfz97TmDt/lX+h2FdhekTd1+JkIWjYXvC6NQeaN8FLXdFnd8MaqYp4q2ZwhJ9+Q2kJQ
	jMo12P4bOy0o31eqiKsLki6QJeNxvMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783508076;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MV+KT9Q6gA/FC+sDTZrMMCwZHl/E+GQ/ErbBLm590NE=;
	b=rdMsf1CxDjMZB60vTgg7sPqb3n2OrsyVvI7pAzOJi026YUVAIajcUKSD8GW1CDSTQprc55
	mvQRaJ3o3Dx+kxAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8FD3779AE;
	Wed,  8 Jul 2026 10:54:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5zQKKGwsTmqEKwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 Jul 2026 10:54:36 +0000
Date: Wed, 08 Jul 2026 12:54:36 +0200
Message-ID: <87tsq94uqb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Leo Tsai <antivirus621@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	leo.tsai@cmedia.com.tw,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [PATCH v1] ALSA: hda/cm9825: Add IBP support for DFI
In-Reply-To: <20260708035552.44429-1-antivirus621@gmail.com>
References: <20260708035552.44429-1-antivirus621@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -3.30

On Wed, 08 Jul 2026 05:55:52 +0200,
Leo Tsai wrote:
> 
> The IBP project is an DFI platform with a fixed audio
> configuration consisting of headset(headphone and mic-in).
> The audio routing and pin assignments are defined according to
> the board-level hardware design and are not intended to be
> dynamically changed.
> 
> Signed-off-by: Leo Tsai <antivirus621@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
