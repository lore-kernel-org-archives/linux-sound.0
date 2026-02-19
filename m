Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DF61E8320
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 10:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771495768; cv=none; b=AEBFuIzBPdFGHW1TPSgvfVIbakzwcHnOAcH0OtN+VWralyDC+q94vz1o0qkAub85hGlLhAmBaFqTdI4VB+TvmXEmAA8OdTjenQi3FsJrk71zfSveZlg/dKh0jJmLQqPyh18VpLrc2EjzdQK5LOAHIX968AD3am7o0qRQnhFzAAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771495768; c=relaxed/simple;
	bh=B2rARY+RtiBLGsWHpq7A1eXmjPiwk0LC1S1lDF4U2EA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sW+2I0CxBSZrOPpKUNsvvyyBUi5paM2KcZ6nIBFQ0+yjPbkvTrTeRW+7SQqh6ske+g0zzPw1KIcp8+IBzsx1Sul7gqARqE1pWt6llBeMTJ2ibq7x81wO74xch1BH/TVkODizsVn1f9m/cg8cBu3YPB1XTQWY42qgRdfCDTEX9fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qjBAIm+A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4smmKVnI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qjBAIm+A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4smmKVnI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qjBAIm+A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4smmKVnI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qjBAIm+A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4smmKVnI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0F0303E6DE;
	Thu, 19 Feb 2026 10:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771495766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1dlPbHQ/y3qC3pdWDUoWct3GJkN4g3Bh5xSRbkjJdc=;
	b=qjBAIm+AgR8jJF4044jmnJbjb/UhrSzaILYbu3cDI4UGWfUczfUc5pLcpVojWZswu6vtfJ
	5/azMjAIanCq4UuKEYubho51pj1P2eQ6nMaenHVXxC7lz7Z+7abLbIZyEg8DqQG5zTV5Ki
	sRxwN97HZRt8wDY8CDvmAjhrxFlEwNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771495766;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1dlPbHQ/y3qC3pdWDUoWct3GJkN4g3Bh5xSRbkjJdc=;
	b=4smmKVnIyn3Y34ud53akcfeLmXWYIvXTuchhhROWqkHeDeAXJXiQH44vZKjWPcySmnOyAM
	MQMtezpaXBGccxBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771495766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1dlPbHQ/y3qC3pdWDUoWct3GJkN4g3Bh5xSRbkjJdc=;
	b=qjBAIm+AgR8jJF4044jmnJbjb/UhrSzaILYbu3cDI4UGWfUczfUc5pLcpVojWZswu6vtfJ
	5/azMjAIanCq4UuKEYubho51pj1P2eQ6nMaenHVXxC7lz7Z+7abLbIZyEg8DqQG5zTV5Ki
	sRxwN97HZRt8wDY8CDvmAjhrxFlEwNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771495766;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1dlPbHQ/y3qC3pdWDUoWct3GJkN4g3Bh5xSRbkjJdc=;
	b=4smmKVnIyn3Y34ud53akcfeLmXWYIvXTuchhhROWqkHeDeAXJXiQH44vZKjWPcySmnOyAM
	MQMtezpaXBGccxBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1BE83EA65;
	Thu, 19 Feb 2026 10:09:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ghgnLlXhlmnXWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 19 Feb 2026 10:09:25 +0000
Date: Thu, 19 Feb 2026 11:09:25 +0100
Message-ID: <87wm09qc2y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com,
	broonie@kernel.org,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v5] ALSA: control: Verify put() result when in debug mode
In-Reply-To: <87y0kpqc4z.wl-tiwai@suse.de>
References: <20260219094614.504459-1-cezary.rojewski@intel.com>
	<87y0kpqc4z.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 19 Feb 2026 11:08:12 +0100,
Takashi Iwai wrote:
> 
> On Thu, 19 Feb 2026 10:46:14 +0100,
> Cezary Rojewski wrote:
> > --- /dev/null
> > +++ b/sound/core/control_trace.h
> > @@ -0,0 +1,49 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#undef TRACE_SYSTEM
> > +#define TRACE_SYSTEM snd_pcm
> 
> It doesn't look like a right place?

Also, it'd be more helpful if you put example outputs in the
description, too.  Then one can have a clue what to look for.


Takashi
