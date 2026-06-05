Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11D5495505
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 08:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780646987; cv=none; b=kUSg5sh1boYSmPrTD0giHAHqVQx2LqhbmNZcPh3woJzV5vD6yPWT37e7oonnfLRySWeo3QN9wPUPh/jO5oKjDrmX/tmCSbS3QuJL5g6f/iFKguS8tq09ene3CYXkqaDtz52RgbnoUIN3i6LEK972fYjdQANj1AUPks5IK8bDYr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780646987; c=relaxed/simple;
	bh=EUH+LRBh0rJE1W5iuiTSTKef/8wqvBFxnbBUZEO7WMk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iZ8d9L/A0Hra7xIvit0WzvKCdl95simld4RQ8nxfy75AnF4aCKJ4YDWSTIJnTunXFdFKdAxOzoF9SyJLIg75ZBq5X/xVY418lDtDlFLWHRPIMvXWsqAJCWA6s8QdAz40mu7+ZLOpfphbIopGuXChAL94ENJZubBhNml8S3tx3Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ET0SVxgq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1ftyWUkN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ET0SVxgq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1ftyWUkN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ET0SVxgq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1ftyWUkN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ET0SVxgq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1ftyWUkN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 20A7775A3D;
	Fri,  5 Jun 2026 08:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780646984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+aX/dY2icTuDWriKObJboT6lrtTBEdCOjN58ZZXRA4=;
	b=ET0SVxgq/i86t4Swmbo+eeIme+LYpWYcrbktCtqcgoPvF5dnli3xxKIKNrR/oAQjDsBWYs
	sPlaO++38hMtO/ZnWFuAY2a+yM2JdINOH0yZMmCRjbPioqX0BsJNMT3jKaXKAy6qXRtAdm
	O8n8RTZnSYglBsZPU4AJMuvN4uaNVXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780646984;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+aX/dY2icTuDWriKObJboT6lrtTBEdCOjN58ZZXRA4=;
	b=1ftyWUkNa3ancLSJJy5c4inzAXYYp0bZyuTP4HjEgJjfYXSv/B2gwG12I5DNl7nU0gPckX
	lTT+EtJdpFd9R/Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ET0SVxgq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1ftyWUkN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780646984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+aX/dY2icTuDWriKObJboT6lrtTBEdCOjN58ZZXRA4=;
	b=ET0SVxgq/i86t4Swmbo+eeIme+LYpWYcrbktCtqcgoPvF5dnli3xxKIKNrR/oAQjDsBWYs
	sPlaO++38hMtO/ZnWFuAY2a+yM2JdINOH0yZMmCRjbPioqX0BsJNMT3jKaXKAy6qXRtAdm
	O8n8RTZnSYglBsZPU4AJMuvN4uaNVXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780646984;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+aX/dY2icTuDWriKObJboT6lrtTBEdCOjN58ZZXRA4=;
	b=1ftyWUkNa3ancLSJJy5c4inzAXYYp0bZyuTP4HjEgJjfYXSv/B2gwG12I5DNl7nU0gPckX
	lTT+EtJdpFd9R/Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 00F26779A8;
	Fri,  5 Jun 2026 08:09:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gAAWOkeEImqWWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 05 Jun 2026 08:09:43 +0000
Date: Fri, 05 Jun 2026 10:09:43 +0200
Message-ID: <87ecilv260.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kyle Zeng <kylebot@openai.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: seq: dummy: fix UMP event stack overread
In-Reply-To: <20260605080204.32045-1-kylebot@openai.com>
References: <20260605080204.32045-1-kylebot@openai.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,openai.com:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 20A7775A3D
X-Spam-Score: -3.51

On Fri, 05 Jun 2026 10:02:04 +0200,
Kyle Zeng wrote:
> 
> The dummy sequencer port forwards events by copying an incoming
> struct snd_seq_event into a stack temporary, rewriting source and
> destination, and dispatching the temporary to subscribers. That legacy
> event storage is smaller than struct snd_seq_ump_event.
> 
> When a UMP event reaches the dummy client, the copy leaves the UMP flag
> set but only provides legacy-sized stack storage. The subscriber
> delivery path then uses snd_seq_event_packet_size() and copies a
> UMP-sized packet from that stack object, reading past the end of the
> temporary.
> 
> Use the existing union __snd_seq_event storage and copy the packet size
> reported for the incoming event before rewriting the common routing
> fields. This preserves the full UMP packet for UMP events while keeping
> legacy event handling unchanged.
> 
> Fixes: 32cb23a0f911 ("ALSA: seq: dummy: Allow UMP conversion")
> Signed-off-by: Kyle Zeng <kylebot@openai.com>

Applied now.  Thanks.


Takashi
