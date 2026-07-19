Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6E67261A
	for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 17:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784483594; cv=none; b=FdbgEJHgcEx9+Owx18v8zKmZX6AlAsDT7qGQUwTqdmHjJE2eFagx6KvRGQ+0Qgit9zmCbOKQdmSyJ6zhVUD/KK19A6wc5la4q4xldZySG5/ZzvtW6BlprndlcGY5GfUzGOgFRQVezrblEw7XlIKo6fImrtSuvG0qQdxGzC0ANbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784483594; c=relaxed/simple;
	bh=NedTn8GZmFn9qg70CUuqapZuifsVwAVTjptO0fpxZ8Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I2RNzyTFldSPLQyauDxwZbOgtes/HvMCtNNYdmx7KSRIywNx9kCilDowvmhSanM6Sc+qSDADaKnGV9uit7XYcCiD+a5Fmk13Gqi4tAx7rHHDB3oF5AEPxX+6iK3HjdZV7IaqgQCwXcEQQg3SMAFfAXhADUgD89FY8LQv1gzRnwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FiiEcszu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cej03Z63; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FiiEcszu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cej03Z63; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FiiEcszu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cej03Z63";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FiiEcszu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cej03Z63"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 20D6A79AD8;
	Sun, 19 Jul 2026 17:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784483194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OnOe03SFB8373XUdAejM/MnIVej7/sysVAVbwwjQ07U=;
	b=FiiEcszuiverqkOLuYMYC9hf7hbWhxfCJGYaQ65kY20mC6qLtBAfClTXGekDpaO8KzPkn/
	q+Zy5WRm+eLTeCPkFePijyVBh1V0xMRWlt5usk6dfnQIo0GVZzSUdidSAI1PPEHCuiO20S
	mSEQuIBjha0i0WvuVyvcnLdDzt1edjU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784483194;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OnOe03SFB8373XUdAejM/MnIVej7/sysVAVbwwjQ07U=;
	b=cej03Z63zcXbDLoSGHkvvmO/d/sxJZW/Ch/j7c9KAx9kLp/1gn6usJj+9GriZKaXIqBdNm
	Bhn748KWHAIVAnCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FiiEcszu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cej03Z63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784483194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OnOe03SFB8373XUdAejM/MnIVej7/sysVAVbwwjQ07U=;
	b=FiiEcszuiverqkOLuYMYC9hf7hbWhxfCJGYaQ65kY20mC6qLtBAfClTXGekDpaO8KzPkn/
	q+Zy5WRm+eLTeCPkFePijyVBh1V0xMRWlt5usk6dfnQIo0GVZzSUdidSAI1PPEHCuiO20S
	mSEQuIBjha0i0WvuVyvcnLdDzt1edjU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784483194;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OnOe03SFB8373XUdAejM/MnIVej7/sysVAVbwwjQ07U=;
	b=cej03Z63zcXbDLoSGHkvvmO/d/sxJZW/Ch/j7c9KAx9kLp/1gn6usJj+9GriZKaXIqBdNm
	Bhn748KWHAIVAnCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB605779AA;
	Sun, 19 Jul 2026 17:46:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6cffM3kNXWrQMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 19 Jul 2026 17:46:33 +0000
Date: Sun, 19 Jul 2026 19:46:33 +0200
Message-ID: <87y0f6rhxi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Daniel C. Ribeiro" <dcoutinho.96@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	d.r.ribeiro@outlook.com
Subject: Re: [PATCH] ALSA: usb-audio: Add FIXED_RATE quirk for JBL Quantum650 Wireless
In-Reply-To: <20260719090037.40149-1-dcoutinho.96@gmail.com>
References: <20260719090037.40149-1-dcoutinho.96@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 20D6A79AD8
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,vger.kernel.org,outlook.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Sun, 19 Jul 2026 11:00:37 +0200,
Daniel C. Ribeiro wrote:
> 
> JBL Quantum650 Wireless (0ecb:2125) requires the same workaround that
> was used for JBL Quantum610 and Quantum810 for limiting the sample rate.
> Without it, the capture (microphone) stream fails to work.  Setting the
> QUIRK_FLAG_FIXED_RATE flag, as done for the sibling models, makes both
> playback and capture work correctly.
> 
> Signed-off-by: Daniel C. Ribeiro <dcoutinho.96@gmail.com>

Applied now.  Thanks.


Takashi
