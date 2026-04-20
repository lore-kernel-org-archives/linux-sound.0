Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40A42F290A
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 07:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776668930; cv=none; b=Rssy0VlfMcMOh9NuWdkzIfaOv+b16yC+u1BuOEHJttqf7d1nGwMVeQBeEovJj4CpPQ6nd89Oo0OBWDwWCroEvdd7Immh8LucXP1BCqP2ObIutRT6SPnVGUPeVoO9KfzDCrkfCXCd2C0Bbv8mDMygqyArIzXi47YD5zOdXZgWv6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776668930; c=relaxed/simple;
	bh=2mUeGA8gbL2l/fHcHQTaxCFXNMdWjqcid5mmb7m5F5Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pqUDTXRlsyasGZw2lXXBAK1Y/Vu6TStNG8xGeQtIGALrn7rQ7QtkChewXkzTQJBrReIZdj1DigrXDpyWq1hz3TKs8iiWtjv/+pBj5RZqtatZ/NvpX325hOlH2X5hnE+bTdvHJV+g8SFR6GGYmbaeNO44xgAxHgM47UyvJWDDz64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0V8H+jHz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oZOEytHb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0V8H+jHz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oZOEytHb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0V8H+jHz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oZOEytHb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0V8H+jHz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oZOEytHb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 734C16A7CF;
	Mon, 20 Apr 2026 07:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776668921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D5OxvHdbQbSqmo7kkjob6NCjguVdYkfHAJpTcp70qK0=;
	b=0V8H+jHzsrms5Uj7ZvzYnWu+SfdAACJ0xgt6J3mENDAR+Xv7/lcbEcN/+rHYFisP19rw7Z
	Y2XnzB3L6/baMeRTcrbNFb9X6HzULSAHo9tLhiHJRdLIMTKaePgIW1uPuuEfkZ3/BWjrf5
	ToMF8Jkx1c1JHylE2jMR71JVXdGaG7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776668921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D5OxvHdbQbSqmo7kkjob6NCjguVdYkfHAJpTcp70qK0=;
	b=oZOEytHbdZ9cAqKqZur28ONfKIAAcF/A7q1PiVNj8Mid2dpeSf8ZADBruMtSEQuT27QxEz
	eYDINSA4t+zKuaDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0V8H+jHz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oZOEytHb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776668921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D5OxvHdbQbSqmo7kkjob6NCjguVdYkfHAJpTcp70qK0=;
	b=0V8H+jHzsrms5Uj7ZvzYnWu+SfdAACJ0xgt6J3mENDAR+Xv7/lcbEcN/+rHYFisP19rw7Z
	Y2XnzB3L6/baMeRTcrbNFb9X6HzULSAHo9tLhiHJRdLIMTKaePgIW1uPuuEfkZ3/BWjrf5
	ToMF8Jkx1c1JHylE2jMR71JVXdGaG7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776668921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D5OxvHdbQbSqmo7kkjob6NCjguVdYkfHAJpTcp70qK0=;
	b=oZOEytHbdZ9cAqKqZur28ONfKIAAcF/A7q1PiVNj8Mid2dpeSf8ZADBruMtSEQuT27QxEz
	eYDINSA4t+zKuaDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A28A593AE;
	Mon, 20 Apr 2026 07:08:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ECvqDPnQ5WlrQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Apr 2026 07:08:41 +0000
Date: Mon, 20 Apr 2026 09:08:40 +0200
Message-ID: <87se8qaz2f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: als4000: Fix capture trigger chip->mode race
In-Reply-To: <20260417-als4000-capture-trigger-race-v1-1-daeffc2feb67@gmail.com>
References: <20260417-als4000-capture-trigger-race-v1-1-daeffc2feb67@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 734C16A7CF

On Fri, 17 Apr 2026 22:30:18 +0200,
Cássio Gabriel wrote:
> 
> snd_als4000_capture_trigger() updates chip->mode under mixer_lock,
> while snd_als4000_set_rate() and snd_als4000_playback_trigger()
> serialize the same rate-lock state with reg_lock.
> 
> The PCM core serializes callbacks only per acted-on substream, or for an
> explicitly linked group, so unlinked playback and capture streams can
> run concurrently.
> 
> That leaves two races on ALS4000 rate-lock state:
> - playback and capture trigger callbacks can concurrently update
>   chip->mode and lose one of the SB_RATE_LOCK bits
> - snd_als4000_set_rate() can observe chip->mode without the capture
>   lock bit set and reprogram the shared sample rate while capture is
>   being started
> 
> Fix this by taking reg_lock as the outer lock in
> snd_als4000_capture_trigger() and nesting mixer_lock only for the CR1E
> write. This keeps chip->mode serialized with the rest of the ALS4000
> rate-lock users while preserving the existing CR1E programming
> sequence.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied now.  Thanks.


Takashi
