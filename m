Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB8A3FF8A9
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 17:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780422903; cv=none; b=TXQCKx3P7iuSbVN+qPzHjxZTmqa00XiTPs13WmCxWHodSdxuoMaTGrXJwzTDm4+vMNHX6LHu5D1gS3maSfotLLWUfXjezPd3ofAkGCtq2NHduC2T77Adt+MVHYhHjvunLn/ID+/emrQFxHf8JKMpkX6Jl1bP7YAfH9mrYv+y/Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780422903; c=relaxed/simple;
	bh=DV+zMTRJ9iZh2ylR8IqMGHxh4MRkM16mmBvyvOjE7zE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O+VQ2N5dt9kDb1X87zdl9GBOcHA6wFEOBTWkuCmh+jJ7e7kks6t9H4iuhD6GYKVTFDBMkoWpn2xyVO4fEKdf/6bRlVvL5EkyALnJAYKE8wHEAtwrP7hVIyFm3o5QpIyXREdaCrFYT02l1XM2PnmOQR2To/Q0FWePt81fmrfHfmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e+9EtyVn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xJkJQO6k; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e+9EtyVn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xJkJQO6k; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e+9EtyVn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xJkJQO6k";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e+9EtyVn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xJkJQO6k"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9D7AB75B36;
	Tue,  2 Jun 2026 17:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780422898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zfLIqfm1Ri2x+tfsnvcwjuPyecpR1hVA2qQ9S3hpppY=;
	b=e+9EtyVnHiMethDJ8h98rruGEQhw+KG/QjFVSvKqxRw0RRI5OFHFi+5cYGHoj3SJjPcMUj
	GDwUWk+3O/e1CxWFwHOLbBioQSp7FmF0NPYFId//XDDAhCCRHsJgwpctW2Vs/3XM+UPHiv
	QWQdYjE+T9rhAZh1m2csfuzUSlafj5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780422898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zfLIqfm1Ri2x+tfsnvcwjuPyecpR1hVA2qQ9S3hpppY=;
	b=xJkJQO6kswKzfkb0HdEHxN3HM0NF2ijBFlJoc/fut3jLqCjJurBbnIMGyK3hjwqA5/pAfj
	WG314KQBUYtg+wDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=e+9EtyVn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xJkJQO6k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780422898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zfLIqfm1Ri2x+tfsnvcwjuPyecpR1hVA2qQ9S3hpppY=;
	b=e+9EtyVnHiMethDJ8h98rruGEQhw+KG/QjFVSvKqxRw0RRI5OFHFi+5cYGHoj3SJjPcMUj
	GDwUWk+3O/e1CxWFwHOLbBioQSp7FmF0NPYFId//XDDAhCCRHsJgwpctW2Vs/3XM+UPHiv
	QWQdYjE+T9rhAZh1m2csfuzUSlafj5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780422898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zfLIqfm1Ri2x+tfsnvcwjuPyecpR1hVA2qQ9S3hpppY=;
	b=xJkJQO6kswKzfkb0HdEHxN3HM0NF2ijBFlJoc/fut3jLqCjJurBbnIMGyK3hjwqA5/pAfj
	WG314KQBUYtg+wDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6BA78779A7;
	Tue,  2 Jun 2026 17:54:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pLgGGfIYH2oHPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Jun 2026 17:54:58 +0000
Date: Tue, 02 Jun 2026 19:54:58 +0200
Message-ID: <87se74ygi5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	notify@kernel.org
Subject: Re: [PATCH] ALSA: seq: oss: Reject reads that cannot fit the next event
In-Reply-To: <20260602-alsa-seq-oss-read-size-check-v1-1-10e59b1742e0@gmail.com>
References: <20260602-alsa-seq-oss-read-size-check-v1-1-10e59b1742e0@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 9D7AB75B36
X-Spam-Score: -4.51

On Tue, 02 Jun 2026 13:18:39 +0200,
Cássio Gabriel wrote:
> 
> snd_seq_oss_read() checks whether the next queued OSS sequencer event
> fits in the remaining userspace buffer before removing it from the read
> queue.
> 
> The check is inverted. It currently stops when the event is smaller than
> the remaining buffer, so a normal 4-byte event is not copied for an
> 8-byte read buffer. Conversely, an 8-byte event can be copied for a
> smaller read count.
> 
> Break only when the remaining userspace buffer is smaller than the next
> event, and report -EINVAL if no complete event has been copied. This
> prevents an undersized read from looking like end-of-file while leaving
> the event queued for a later read with a large enough buffer.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
