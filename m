Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451E339A06A
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 08:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773735464; cv=none; b=o/Jt1PSWrTyi7F99EomEsES0RWy7gpNuW/whpidhknJXHXzoIPxSWL0ffUfaZBE3wi5Vwic9XsewPZtJZbXVO55G0IC4uJ/i8VemZpN3x9fQC/5dRsl/fep0dnM+pBSrQpVSAmA7yNz7VjC08JO1zWCVRajGMtWlmq72UEzmqQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773735464; c=relaxed/simple;
	bh=bFTzv91evNc363ZZu/E3siFf53zlEmCqWjnosuPdaRU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OzhkiYaNKQST4oa8YjPI7ehVKWVTOhaLHf4xUJeHgoGQsPvfgkjY6yGyoU6bgQeSw3vQDaIMQkG7eUZ/7mnIMGB+FOeQoceKy5cCuwun0q4ypNo1AC4vpAo5IrOnHvQHN53lJaELmrk8s3rghnKq30TiI0X04hfHrXToZyutxYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BCQa2YS9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uKt5sKhK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BCQa2YS9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uKt5sKhK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BCQa2YS9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uKt5sKhK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BCQa2YS9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uKt5sKhK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 404AB4D240;
	Tue, 17 Mar 2026 08:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773735454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/oQ1Sh8uOHuT5EZkDfrcHHC5giMdFeXlmIadcfvfhts=;
	b=BCQa2YS9uQSasgHdatiJ7ph810udgwdnJAmGvjX3Pvs5uLJS7ldv0UcqOVDJsPhQGgoYqr
	P06/fSXZIngujTImA9FsWwI/nx6kL2p1eW8JHQcInA8acOnJkrZNpwszg2FLzRh2X0NYKL
	wQ6MUvAIqUMYU2JZBoqJMaB87n0eKik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773735454;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/oQ1Sh8uOHuT5EZkDfrcHHC5giMdFeXlmIadcfvfhts=;
	b=uKt5sKhK78voZ4DAT1xewnszlqjH75nDY0g+Oj4e4zdE7/wJOnCKaGQlobO1tqotg4bdbm
	7RRbKrfBysLpgZAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BCQa2YS9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uKt5sKhK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773735454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/oQ1Sh8uOHuT5EZkDfrcHHC5giMdFeXlmIadcfvfhts=;
	b=BCQa2YS9uQSasgHdatiJ7ph810udgwdnJAmGvjX3Pvs5uLJS7ldv0UcqOVDJsPhQGgoYqr
	P06/fSXZIngujTImA9FsWwI/nx6kL2p1eW8JHQcInA8acOnJkrZNpwszg2FLzRh2X0NYKL
	wQ6MUvAIqUMYU2JZBoqJMaB87n0eKik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773735454;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/oQ1Sh8uOHuT5EZkDfrcHHC5giMdFeXlmIadcfvfhts=;
	b=uKt5sKhK78voZ4DAT1xewnszlqjH75nDY0g+Oj4e4zdE7/wJOnCKaGQlobO1tqotg4bdbm
	7RRbKrfBysLpgZAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0CB324273C;
	Tue, 17 Mar 2026 08:17:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TNW1AR4OuWmSXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 17 Mar 2026 08:17:34 +0000
Date: Tue, 17 Mar 2026 09:17:33 +0100
Message-ID: <87bjgmg99e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: timer: keep a list of open masters for slave lookup
In-Reply-To: <20260316-alsa-timer-master-list-v1-1-fb95e547110a@gmail.com>
References: <20260316-alsa-timer-master-list-v1-1-fb95e547110a@gmail.com>
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
	ASN(0.00)[asn:32098, ipnet:2800::/6, country:US];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 404AB4D240
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 16 Mar 2026 14:39:38 +0100,
Cássio Gabriel wrote:
> 
> snd_timer_check_slave() still walks all registered timers and all open
> timer instances to find a matching master for a newly opened slave.
> 
> Maintain a global list of open master instances that can accept slave
> links and use it for the slave lookup path instead. This keeps the
> existing matching semantics while avoiding the nested walk over
> snd_timer_list and each timer open_list_head.
> 
> The reverse path in snd_timer_check_master() already scans only the
> pending slave list, so this makes both lookup paths closer in shape
> without changing the master/slave linking logic.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Thanks, applied to for-next branch now.


Takashi
