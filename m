Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3211FD4
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 14:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764685031; cv=none; b=uITlIDMHDYfsKYf3J47SRUiv3uOx7wNy9ciUTMIxRrw/tSVQ2rsVJUf4C1j2tta7sapwe2kuT+62rfcUKhFJkJ0jrWdBsj6V0tfEO5jvqtM+LF57pDMoWqlR8ZW+wf+qBzu+lTCH5IXCm2mAPKQznnEfEWrfoylUgcbX6sQ/riA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764685031; c=relaxed/simple;
	bh=rrqZ8lZwhPrWHjtJT2TtYHMwmwiD28LdUpzTU/mKZjg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m5MH7gzadZs+Quhxvb1E7vhaKh+uZQvNsGihraOttBPwoNdFRWhjj5BamG9lP3uKZunXqkOAnhRyl3rjbuBlY7dV1CDiko7SnUGkKWDgmBCz85YpgikDlnXYFxi7+3wKtBPFOZBK6HVHB2NlQbVdX9obY4MAqx7uLRXeZWVVpGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kNRHKDFB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=G6XYWFaC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xqs1t7/k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mJicuDSZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kNRHKDFB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G6XYWFaC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xqs1t7/k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mJicuDSZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6CFCD5BD4E;
	Tue,  2 Dec 2025 14:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764685026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+eyJyhEKeRvgN6L1OAae9fcdlhnSZg5TA1PbS6jsJM=;
	b=kNRHKDFBQpTWnWN9Pjock31EKjrDIXKrMtGT7AKKIbZl0EJJthTuMi+lbyvVwYW3eWsS7z
	aVjjFoDLlJCbWpuIyr1norpKRz/Djai3mzvfoBvQl76qXTTPujh5O9ydhFDj8qp5xmdBaj
	d1HdI/hIl868vwpzgY7boSPCpRBhAcA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764685026;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+eyJyhEKeRvgN6L1OAae9fcdlhnSZg5TA1PbS6jsJM=;
	b=G6XYWFaCnAK13fzoqQz1ivwGbG9quDSvvAKxtip3+Hr8j8ZizjzhOx1f70MQGedrYpDV0q
	jdPRZ73XJImuWvAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="xqs1t7/k";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mJicuDSZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764685025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+eyJyhEKeRvgN6L1OAae9fcdlhnSZg5TA1PbS6jsJM=;
	b=xqs1t7/ksDZo1TuQMheBpZVlD57QkZhbfnbWqW/1n2nXbYQmWRr3e/47TR0ALKp++Z3gtI
	CyCvZjNxH38uOvDy14goIJesm7s1c3wtD0UID8KepMwWpHSlnwC+acyx2CAgwGElgTBgI2
	7XI2tYrIFGamODqphDgJJg7u7zNRmHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764685025;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+eyJyhEKeRvgN6L1OAae9fcdlhnSZg5TA1PbS6jsJM=;
	b=mJicuDSZJd0W5snu55u+hBInRyXWjSym92DlK1jnJdJxZLQc7c/pubQGndZcVyJBkkw8EQ
	t9FS2tGwSEMtGSCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 559C83EA63;
	Tue,  2 Dec 2025 14:17:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iEReFOH0LmmtawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Dec 2025 14:17:05 +0000
Date: Tue, 02 Dec 2025 15:17:05 +0100
Message-ID: <87v7ipt1cu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/9] ALSA: seq: Use bus specific probe and remove
In-Reply-To: <cover.1764677854.git.u.kleine-koenig@baylibre.com>
References: <cover.1764677854.git.u.kleine-koenig@baylibre.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 6CFCD5BD4E
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 02 Dec 2025 13:35:49 +0100,
Uwe Kleine-König wrote:
> 
> Hello,
> 
> for the quest to drop .probe(), .remove() and .shutdown() from struct
> device_driver, this patch set converts all seq drivers to use bus type
> callbacks.
> 
> The dependencies here are:
>  - patches #2 - #8 depend (only) on patch #1
>  - patch #9 depends on #1 - #8
> but I guess this series will go in in a single go and there is no need
> to coordinate merging.
> 
> This series is compile tested only, as I have no access to seq devices.
> Still I'm reasonably sure that there is no user-visible effect when this
> series is applied. (There is a runtime warning introduced by patch #1
> that goes away with patches #2-#8 again. So future bisections suffer a
> tiny bit.)

It looks OK though a quick glance, but since it's a bit too late for
6.19, I'll postpone this series for 6.20, unless those are urgently
required for any reason.


thanks,

Takashi

> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (9):
>   ALSA: seq: Use bus specific probe and remove
>   ALSA: seq: midi: Convert to snd_seq bus probe mechanism
>   ALSA: seq: ump: Convert to snd_seq bus probe mechanism
>   ALSA: opl3: Convert to snd_seq bus probe mechanism
>   ALSA: opl4: Convert to snd_seq bus probe mechanism
>   ALSA: sb: Convert to snd_seq bus probe mechanism
>   ALSA: emu10k1: Convert to snd_seq bus probe mechanism
>   ALSA: seq: oss: Convert to snd_seq bus probe mechanism
>   ALSA: seq: Refuse to probe seq drivers with non-bus probe or remove
> 
>  include/sound/seq_device.h         |  2 ++
>  sound/core/seq/oss/seq_oss.c       |  4 ++--
>  sound/core/seq/oss/seq_oss_synth.c | 12 ++++--------
>  sound/core/seq/oss/seq_oss_synth.h |  4 ++--
>  sound/core/seq/seq_midi.c          | 15 ++++++---------
>  sound/core/seq/seq_ump_client.c    | 11 ++++-------
>  sound/core/seq_device.c            | 26 +++++++++++++++++++++++++-
>  sound/drivers/opl3/opl3_seq.c      | 13 +++++--------
>  sound/drivers/opl4/opl4_seq.c      | 10 ++++------
>  sound/isa/sb/emu8000_synth.c       | 13 +++++--------
>  sound/pci/emu10k1/emu10k1_synth.c  | 13 +++++--------
>  11 files changed, 64 insertions(+), 59 deletions(-)
> 
> 
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> -- 
> 2.47.3
> 
