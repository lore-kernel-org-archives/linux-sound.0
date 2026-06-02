Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2812FDC28
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 17:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780422887; cv=none; b=Y5PL5hVLbX0kK7h+KqVfIKqogAczMJImbir71ljGsx4uRZRpgJYCQfg56um/8JLLVe/NWchaZhEtYLs7SFG6hMFx3NIxuZYXeqhFWr8HvWeZmtCd2xZq4BEwDIxa3ea0M/mD18i0Njal9sdNnIaAWEYKqryPxEQToWQTk7eggo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780422887; c=relaxed/simple;
	bh=Cy+0I+GZGcQ+E0vAjUKeF4orIMOx3vdO0ZlpWRH91Bo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCaK6R5GmXrBaRshn8FEng6j6SLYHjlmn1TUz1JfS826B1PmykW7YkWqZWE6vceYGAppy3Et+lc/65IVO8k9oYuM3aDpi2ZTII75zV72/Mb27P0lFp2KmnoCp7oMaoT9PXDrWlBY2BbJr5uNUqz8ZG14RE0QluGmnKW9h7UeSWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hSMFkHtG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TSbmbgpW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hSMFkHtG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TSbmbgpW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hSMFkHtG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TSbmbgpW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hSMFkHtG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TSbmbgpW"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5ABAF6BC71;
	Tue,  2 Jun 2026 17:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780422884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SfKVo2I9h/iiO0LCKRHVKKs+hcYiya2C4P+A49qnu38=;
	b=hSMFkHtGisHrTh4igmB7TGlodri4PK8dfHfGJYTk6hzq9fApsuYSQ4PxUOOycnu23qcQ5Q
	/usR4k543RHzIQ0Rqo+ggkZs7fyRC+++BmUF05ljzwlt2L3hT0vEyknlT1Pa1JIVeW7mQQ
	dLDSYzeiqyFSPSW38QWEmMt598rn1Ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780422884;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SfKVo2I9h/iiO0LCKRHVKKs+hcYiya2C4P+A49qnu38=;
	b=TSbmbgpWIMvxekfElnFcnk5KrBPL74ETmmnPDEoETy7TZ4/Cj4/H0A2ZY7h3KG7QaWOoZy
	VHs7SclmvW4TpsCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780422884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SfKVo2I9h/iiO0LCKRHVKKs+hcYiya2C4P+A49qnu38=;
	b=hSMFkHtGisHrTh4igmB7TGlodri4PK8dfHfGJYTk6hzq9fApsuYSQ4PxUOOycnu23qcQ5Q
	/usR4k543RHzIQ0Rqo+ggkZs7fyRC+++BmUF05ljzwlt2L3hT0vEyknlT1Pa1JIVeW7mQQ
	dLDSYzeiqyFSPSW38QWEmMt598rn1Ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780422884;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SfKVo2I9h/iiO0LCKRHVKKs+hcYiya2C4P+A49qnu38=;
	b=TSbmbgpWIMvxekfElnFcnk5KrBPL74ETmmnPDEoETy7TZ4/Cj4/H0A2ZY7h3KG7QaWOoZy
	VHs7SclmvW4TpsCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 29352779A7;
	Tue,  2 Jun 2026 17:54:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4hjYCOQYH2r8OwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Jun 2026 17:54:44 +0000
Date: Tue, 02 Jun 2026 19:54:43 +0200
Message-ID: <87tsrkygik.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	notify@kernel.org
Subject: Re: [PATCH] ALSA: seq: Restore created port information after insertion
In-Reply-To: <20260602-alsa-seq-create-port-info-fix-v1-1-eec0280131e9@gmail.com>
References: <20260602-alsa-seq-create-port-info-fix-v1-1-eec0280131e9@gmail.com>
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
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Tue, 02 Jun 2026 12:55:46 +0200,
Cássio Gabriel wrote:
> 
> Commit 2ee646353cd5 ("ALSA: seq: Register kernel port with full
> information") split sequencer port creation from list insertion so a
> port can be filled before it becomes visible.
> 
> However, snd_seq_ioctl_create_port() still copies port->addr back to the
> ioctl argument before snd_seq_insert_port() assigns the final port
> number. A successful SNDRV_SEQ_IOCTL_CREATE_PORT without
> SNDRV_SEQ_PORT_FLG_GIVEN_PORT can therefore report port -1 to userspace.
> 
> Move the ioctl address copy after successful insertion, and keep the
> default "port-%d" name assignment from overwriting a caller-provided port
> name. This restores the observable behavior from before the split while
> keeping the port populated before publication.
> 
> Fixes: 2ee646353cd5 ("ALSA: seq: Register kernel port with full information")
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Thanks, applied now to for-next branch.


Takashi
