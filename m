Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8DD332628
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 05:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169105; cv=none; b=vCfxVxgrJHtU7+ef11+NOqwRx826l34HarrsgA8cSyNh4i7fHkozniJG9zQjDppIV0P0DLcSA56YVTqVNRoEGjlizwsuX+KOft7+eqQ09BdyRjaKvt+6Hwr+8VBPuf6XVwcYwYiStC2MM8VwyPobo+/J1bO1bhqiILD0r0VGvOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169105; c=relaxed/simple;
	bh=wtTq5B5ETdJYHgXgiWf1G4oGVHeFcOr2hPxLlIgODCM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cuG7hFp4iCAmxCfsoS5HWUJOQv5HSpJ/1AYOaZ70y1TvYotXn8CLgETSIphzbrHcaQCNeDPUocaQiW4O3CNE8dXcgqYIoz6q6RMMi1Jga3XKLFELJC1Jjmqoom4zz6Um4gOPDr/cnF0gcG2rCxcWy4Eq4+JwAjRB0q4dWkFt8ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CNrtBSja; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pNPrMg3P; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CNrtBSja; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pNPrMg3P; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CNrtBSja";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pNPrMg3P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CNrtBSja";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pNPrMg3P"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8576B6AC8A;
	Tue, 19 May 2026 05:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779169102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XpKrNg0SiKrmx4FuppE5lCGdoP+7n1TZ12oGgkUn3/c=;
	b=CNrtBSjajYbWV/g6orKnUCB8LvsAcBc7UEg0nzykxFPOa9CAC6KplaLgXpk0AtbZnBMkyb
	/v4yUsi0fzxBHYzMo/yepgCWO+QocQSVgJMRPFigm2eHp2A2rUk/gkyyx5b3D0WJlWglP1
	idRi+1H4zmjvU0P6qB98hEkCD89ofEU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779169102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XpKrNg0SiKrmx4FuppE5lCGdoP+7n1TZ12oGgkUn3/c=;
	b=pNPrMg3PTyfpVYhYyerZyJNIxb84qEmO0h//rvvWwKCz5R0DQkxODBa5CcpA2VAK+aEG98
	FEWvecWe6OacuVBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779169102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XpKrNg0SiKrmx4FuppE5lCGdoP+7n1TZ12oGgkUn3/c=;
	b=CNrtBSjajYbWV/g6orKnUCB8LvsAcBc7UEg0nzykxFPOa9CAC6KplaLgXpk0AtbZnBMkyb
	/v4yUsi0fzxBHYzMo/yepgCWO+QocQSVgJMRPFigm2eHp2A2rUk/gkyyx5b3D0WJlWglP1
	idRi+1H4zmjvU0P6qB98hEkCD89ofEU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779169102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XpKrNg0SiKrmx4FuppE5lCGdoP+7n1TZ12oGgkUn3/c=;
	b=pNPrMg3PTyfpVYhYyerZyJNIxb84qEmO0h//rvvWwKCz5R0DQkxODBa5CcpA2VAK+aEG98
	FEWvecWe6OacuVBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A7AC593A8;
	Tue, 19 May 2026 05:38:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dd02GU73C2qjYwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 May 2026 05:38:22 +0000
Date: Tue, 19 May 2026 07:38:18 +0200
Message-ID: <87ecj83qnp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ice1724: Fix blocking open for independent surround PCMs
In-Reply-To: <20260518-ice1724-blocking-open-v1-1-1bfa3e5aa7cf@gmail.com>
References: <20260518-ice1724-blocking-open-v1-1-1bfa3e5aa7cf@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Mon, 18 May 2026 16:32:05 +0200,
Cássio Gabriel wrote:
> 
> The independent surround playback open path rejects a substream when the
> matching PDMA channel is reserved by the multi-channel PDMA0 stream. It
> currently returns -EBUSY for that case, although the driver has carried a
> FIXME noting that blocking mode is not handled properly.
> 
> ALSA PCM open waits and retries only when the low-level open callback
> returns -EAGAIN. Returning -EBUSY therefore makes blocking opens fail
> immediately, the same as nonblocking opens.
> 
> Return -EAGAIN for the temporary PDMA0 reservation conflict. The PCM core
> continues to report -EBUSY for O_NONBLOCK callers, while blocking callers
> sleep and retry.
> 
> Also wake the independent surround PCM wait queue when hw_free releases a
> PDMA reservation. The reservation can be released by the pro PCM, while
> waiters are sleeping on the independent surround PCM, so waking the current
> substream PCM is not sufficient for this cross-PCM reservation.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
