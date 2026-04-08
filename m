Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759493BB9FD
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 12:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775650234; cv=none; b=uzXEyOhY5NZzaodmlqCyF8jseM7ZY/Jt7lmtbi+vDD5dVZZdQ1UVMMxdMDpRZQtf+5E46w6YOYE4XJWJWB7YEkZ8kBqEpz6O4pnQ7kz161CjKL6Soyt6xNh6OGa2oExK3eyKut8EhP9lWNm5QaEj+XOEfMZFuQLQfvPzIPzkZqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775650234; c=relaxed/simple;
	bh=FbvyjDOONu4Y6gB5HRN9Dr/B47aAoJsoy9pG1kRjusw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iXGJ4NEfoO9o/Q/VSjM/D/By86yFEglPKOwFq/wxjIxbsRb8kBbA/IjQFD4nYlZDwWQZQThrD6Q+zPIfNE0HhWFL8VVPYhN6A7/+v0LWddsLVdVZBguWw/sWFZ+3//V4TPBgu1srcgZteuU8KhCPpmPRHfL3Tv6m1BSt9dIIZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Jm87BSeP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LIsLadj0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Jm87BSeP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LIsLadj0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jm87BSeP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LIsLadj0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jm87BSeP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LIsLadj0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8688C5BD6B;
	Wed,  8 Apr 2026 12:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775650229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FDeys2nWetKCR+bZ6jYvtytH0CNJe6n73oyJ7kGB6GY=;
	b=Jm87BSePOCXNhUNk4HF5ohwz7GHkzY/ln9gnKNHXLa7vJChPx6iJJ8JSmeoRBoxbE7d1sg
	rO/NCDKgdRtj+ZqmMBjhfF+VgGXoqqLzIXjercdCFjhFOH2c/yDjFrs2Pga7C0YbH+O3+w
	od2toYhzKj5vbpmKygmV6qtJi92iW60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775650229;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FDeys2nWetKCR+bZ6jYvtytH0CNJe6n73oyJ7kGB6GY=;
	b=LIsLadj0md2WS3UB6Q5FJiEYxZTTASy993whfGfF+f5+ZHaNHM+9u7cFgOvW6SxBlRYOO8
	iHgnBA2yi8rcxECA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Jm87BSeP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LIsLadj0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775650229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FDeys2nWetKCR+bZ6jYvtytH0CNJe6n73oyJ7kGB6GY=;
	b=Jm87BSePOCXNhUNk4HF5ohwz7GHkzY/ln9gnKNHXLa7vJChPx6iJJ8JSmeoRBoxbE7d1sg
	rO/NCDKgdRtj+ZqmMBjhfF+VgGXoqqLzIXjercdCFjhFOH2c/yDjFrs2Pga7C0YbH+O3+w
	od2toYhzKj5vbpmKygmV6qtJi92iW60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775650229;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FDeys2nWetKCR+bZ6jYvtytH0CNJe6n73oyJ7kGB6GY=;
	b=LIsLadj0md2WS3UB6Q5FJiEYxZTTASy993whfGfF+f5+ZHaNHM+9u7cFgOvW6SxBlRYOO8
	iHgnBA2yi8rcxECA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F2514A0B3;
	Wed,  8 Apr 2026 12:10:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v+wxDrVF1ml7VQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 Apr 2026 12:10:29 +0000
Date: Wed, 08 Apr 2026 14:10:28 +0200
Message-ID: <87fr55lkjv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	stable@vger.kernel.org,
	liam.r.girdwood@intel.com
Subject: Re: [PATCH for 7.0 1/2] ALSA: hda/intel: enforce stricter period-size alignment for Intel NVL
In-Reply-To: <20260408084514.24325-2-peter.ujfalusi@linux.intel.com>
References: <20260408084514.24325-1-peter.ujfalusi@linux.intel.com>
	<20260408084514.24325-2-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,suse.de,vger.kernel.org,linux.intel.com,linux.dev,intel.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 8688C5BD6B
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Wed, 08 Apr 2026 10:45:13 +0200,
Peter Ujfalusi wrote:
> 
> From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> 
> Intel ACE4 based products set more strict constraints on HDA BDLE start
> address and length alignment. Modify capability flags to drop
> AZX_DCAPS_NO_ALIGN_BUFSIZE for Intel Nova Lake platforms.
> 
> Fixes: 7f428282fde3 ("ALSA: hda: controllers: intel: add support for Nova Lake")
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>

Applied this one now (with Cc to stable).


thanks,

Takashi
