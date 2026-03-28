Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5962823DD
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 09:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774690597; cv=none; b=PxXdVt4SQeWTrzUnf85mzeDAaAnGcUpKFSC5SMQDjic7bQwda/ZerJBUkLDzUQqQF4/5g2U4c/nmFtFwaikZSNQEluKIdBifFLT01NKCs/zaVkZ3fMcnqUxqyG7OXlzPFRRGL3cvDAny94cPyvh/UEUd9dNcGDtaQvFkwUtu1B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774690597; c=relaxed/simple;
	bh=bZB8TbQJ9QKRiEP35jKrkEgn0vOLEv1ArTh0NohvMfo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nPH3B5Db2ka/PLAc427poWkTb+FopCvVwsuryRf7uXESGamqOJHpUlyf4xw6vPn6XvcX3dfJotv2v9ZYKzx38DpmnGhF3v2tUlHLaPD06jNjThx8hAVFej2uhi8zlG5cYbQHgUSBuPinmSt8ZWahLkbbHQWbX7Us0PQLK6X3Xqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d0foVGgh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q8OEQdla; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=thKibmeB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ENTuSk6B; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d0foVGgh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q8OEQdla";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="thKibmeB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ENTuSk6B"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D454A4D38A;
	Sat, 28 Mar 2026 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774690593; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAUJiasi8In4heL6xDO9MRtgsXFLFl18EAYhlsHAtJQ=;
	b=d0foVGghuydgg2nfULKrWLgpwc2qRV49JNwRZo90fdWW0R5eP/PVTWVHmrMVbmteHwDiRR
	v9+bqmsoS5IGJz1I11+jCp0GNCNNm0K00dpzPO0wEFdxCrtZ8i9OLckA8icQB7j0fj76Wu
	lFJEvVDnXh3rdoroEpRMmkoxcIAAyHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774690593;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAUJiasi8In4heL6xDO9MRtgsXFLFl18EAYhlsHAtJQ=;
	b=q8OEQdla6cdWB6XcZikF/hqDoAyvL5EhCLMw9M2Ru86HjLcgtoVN+JOrKpoNLOescccUpB
	PJlqH8JHrSctM9DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=thKibmeB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ENTuSk6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774690591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAUJiasi8In4heL6xDO9MRtgsXFLFl18EAYhlsHAtJQ=;
	b=thKibmeB+peuHJilQHrt88bEDTPcL0b6ZdDW6R59+0UB8N+/CvqgRNIPiBKgYocTw1pMNn
	NvhlAVrp8mHZ8FH9P8Jhp1mZw8wtiIQiPiiLlhtQSyPWk0NJItfKHcmqF0ixlbCG2ELIda
	ufl879B6jruvK5ShLEj1KoRsDO5/Bhw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774690591;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAUJiasi8In4heL6xDO9MRtgsXFLFl18EAYhlsHAtJQ=;
	b=ENTuSk6BEvFR/Z1kP+8DZ36QTSbrpEAJw3XWnDHmbFAbWhFXxSPJlp9rtMPCzi1NkT6Yb9
	TBb8cLAe129fr6Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A2D614A0A3;
	Sat, 28 Mar 2026 09:36:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zyejJR+hx2nkNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 28 Mar 2026 09:36:31 +0000
Date: Sat, 28 Mar 2026 10:36:31 +0100
Message-ID: <87a4vswb1c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH] ALSA: hda/intel: Add MSI X870E Tomahawk to denylist by DMI ID
In-Reply-To: <20260327155737.21818-2-stuart.a.hayhurst@gmail.com>
References: <20260327155737.21818-2-stuart.a.hayhurst@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
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
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: D454A4D38A
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 

On Fri, 27 Mar 2026 16:57:36 +0100,
Stuart Hayhurst wrote:
> 
> This motherboard uses USB audio instead, causing this driver to complain
> about "no codecs found!".
> Add it to the denylist to silence the warning.
> 
> The first attempt only matched on the PCI device, but this caused issues
> for some laptops, so DMI match against the board as well.
> 
> Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>

Although this could be addressed in BIOS, it won't hurt much to take a
workaround for now.  So I applied this one.


thanks,

Takashi
