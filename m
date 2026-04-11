Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BC82EC09F
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775894882; cv=none; b=iePtWw0IZoxYOlFj397O25LOLJ5UCqZ+KCaaG3jrpArTCPVqUR5PTCieeP+FhcthKGlnCGOyIlJvrRDpoHyO5Wr8vEaIwZALatvDs4gLQIaFWkMiRK7Y/Z39XFmhqe9T9hIWYlvjQQvaivhgC3/IZJJKc64HYAPZ9+QMif1MdxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775894882; c=relaxed/simple;
	bh=IIx4GlMwTxalbSg3aPM1xIG0JHREmXjes9sLb6p3g0k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D/K9CzG5WkQOJFey0Th62MCgu7whcOnVi6Ne7Kq2dXuzMjuH1/qYTBujsSmas5uGqa1BJX1RAd3iNb1vuLMLShaNr205yp4GGeBeF+g2uGFS0s2CYDLG00sfbGyVVIdrc4ktSDmp2wF1rnG9yYTr8BcO+0/EDGrmVuOen4UdD+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zHdC8b0t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ukx/ajEA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zHdC8b0t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ukx/ajEA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zHdC8b0t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ukx/ajEA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zHdC8b0t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ukx/ajEA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 397B86A7FD;
	Sat, 11 Apr 2026 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775894879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fzxPE+EXH4wu8An0kWWEEx7erljYxSx6W6aClNFBbP0=;
	b=zHdC8b0tPXmjGVhbXWndCEL8VJP/KzeaBsKYRyKUey1+8JaslnU1wuLR/kie/9l/zaTxW+
	4PssdFp0QyuUku3Zw2gy2M/UJ2NxdK/Pz7KWFf4sW4jDkJVUiG3oDP3+5xxQVX3TakPSq0
	Bu1YPmEK5aMHcAarusHrQcUf4wAckp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775894879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fzxPE+EXH4wu8An0kWWEEx7erljYxSx6W6aClNFBbP0=;
	b=Ukx/ajEA8ZfvCjlqFfGhGVHHJG1C9KY8USBTfEXjCNBVD2sS3CjpN1ddN9IcBIOkpfq744
	BHRwqggH2nbdOIAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zHdC8b0t;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Ukx/ajEA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775894879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fzxPE+EXH4wu8An0kWWEEx7erljYxSx6W6aClNFBbP0=;
	b=zHdC8b0tPXmjGVhbXWndCEL8VJP/KzeaBsKYRyKUey1+8JaslnU1wuLR/kie/9l/zaTxW+
	4PssdFp0QyuUku3Zw2gy2M/UJ2NxdK/Pz7KWFf4sW4jDkJVUiG3oDP3+5xxQVX3TakPSq0
	Bu1YPmEK5aMHcAarusHrQcUf4wAckp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775894879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fzxPE+EXH4wu8An0kWWEEx7erljYxSx6W6aClNFBbP0=;
	b=Ukx/ajEA8ZfvCjlqFfGhGVHHJG1C9KY8USBTfEXjCNBVD2sS3CjpN1ddN9IcBIOkpfq744
	BHRwqggH2nbdOIAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05A4D4A0A3;
	Sat, 11 Apr 2026 08:07:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iEpsOl4B2mlfXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 11 Apr 2026 08:07:58 +0000
Date: Sat, 11 Apr 2026 10:07:58 +0200
Message-ID: <87a4v9gbs1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: sscape: Cache per-card resources for board reinitialization
In-Reply-To: <20260411-alsa-sscape-pm-v1-1-3058d988783a@gmail.com>
References: <20260411-alsa-sscape-pm-v1-0-3058d988783a@gmail.com>
	<20260411-alsa-sscape-pm-v1-1-3058d988783a@gmail.com>
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 397B86A7FD

On Sat, 11 Apr 2026 06:54:29 +0200,
Cássio Gabriel wrote:
> +/*
> + * Restore the SoundScape's MIDI control state after the firmware
> + * upload has made the host interface available again.
> + */
> +static int sscape_restore_midi_state(struct soundscape *sscape)
> +{
> +	int err = 1;
> +
> +	guard(spinlock_irqsave)(&sscape->lock);
> +	set_host_mode_unsafe(sscape->io_base);
> +	err &= host_write_ctrl_unsafe(sscape->io_base, CMD_SET_MIDI_VOL, 100);
> +	err &= host_write_ctrl_unsafe(sscape->io_base, sscape->midi_vol, 100);
> +	err &= host_write_ctrl_unsafe(sscape->io_base, CMD_XXX_MIDI_VOL, 100);
> +	err &= host_write_ctrl_unsafe(sscape->io_base, sscape->midi_vol, 100);
> +	err &= host_write_ctrl_unsafe(sscape->io_base, CMD_SET_EXTMIDI, 100);
> +	err &= host_write_ctrl_unsafe(sscape->io_base, 0, 100);
> +	err &= host_write_ctrl_unsafe(sscape->io_base, CMD_ACK, 100);
> +	set_midi_mode_unsafe(sscape->io_base);
> +
> +	return err ? 0 : -EIO;

The above means it checks only the error of the last write.
Is it intentional?


thanks,

Takashi
