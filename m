Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F5F423A68
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 17:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471063; cv=none; b=X7/28TmeSZ8vz/O6HWZkQsDOGbU75x2Ak2Eh+UJ9xxcZJDEijR5sB6LhHImQPQ6xMiqp+MEGnH/c/2ov4VDWROAyrsMx1iokkF7Gn2lTebtcgazugn0L4mb+M87D1SfDSpI15i21KzjEIGnDhPWx6KRkStTtxklXTwPHX18Zx+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471063; c=relaxed/simple;
	bh=rMPX+RYXKIH/ovfRGKE1yMKM7BKuzVxRqioYivI0yoo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yc/FFTWUi7/XJ77c3Xh5D4s5EbRqPfdFJcgzIfuUaIoHAWPH2gzk5tH/ReE/cxnPGRVQmrg7ip4EkHImUCOYUahowqkAIysJsB886oXKxzCjocsTRXhkxwqdjPsAgVO7x8augt510/xR60daxBgmsLcEB4+N1ZUmxniJ+Ez84Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=syVVroUz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IfCTMp0Z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=syVVroUz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IfCTMp0Z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="syVVroUz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IfCTMp0Z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="syVVroUz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IfCTMp0Z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 166C05BD7E;
	Mon,  2 Mar 2026 17:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772471060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KUAZ8qs2fNmePU7RMBxB0psk4efvvBkHHmTwsA5XqNo=;
	b=syVVroUzXIpeRd5Ydkd0S6fe1N8h6DXLaf1LDY9vPiNzbY21U7BBKzLI7MZ46gPyrUG0Kz
	TZN8MA2Bh8I7TbBveshyATc7mlX1e9ktN0BrrWLA55AJ80O1HTzFr/lE3P/L5IQWo3Nys+
	J5ka78p2ehT4Be8mbyL/rQGwWYNs7Uc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772471060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KUAZ8qs2fNmePU7RMBxB0psk4efvvBkHHmTwsA5XqNo=;
	b=IfCTMp0ZOKW1zno7ChKxU3oP9wnweYLO8n42c7ypnSvXODvFHsGNBD+NcjfP0IKzeotkNK
	zFxoPP9nYYGGG9Bw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=syVVroUz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IfCTMp0Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772471060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KUAZ8qs2fNmePU7RMBxB0psk4efvvBkHHmTwsA5XqNo=;
	b=syVVroUzXIpeRd5Ydkd0S6fe1N8h6DXLaf1LDY9vPiNzbY21U7BBKzLI7MZ46gPyrUG0Kz
	TZN8MA2Bh8I7TbBveshyATc7mlX1e9ktN0BrrWLA55AJ80O1HTzFr/lE3P/L5IQWo3Nys+
	J5ka78p2ehT4Be8mbyL/rQGwWYNs7Uc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772471060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KUAZ8qs2fNmePU7RMBxB0psk4efvvBkHHmTwsA5XqNo=;
	b=IfCTMp0ZOKW1zno7ChKxU3oP9wnweYLO8n42c7ypnSvXODvFHsGNBD+NcjfP0IKzeotkNK
	zFxoPP9nYYGGG9Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E73053EA69;
	Mon,  2 Mar 2026 17:04:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id m8EsNxPDpWnCXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Mar 2026 17:04:19 +0000
Date: Mon, 02 Mar 2026 18:04:19 +0100
Message-ID: <87ldgakvsc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
In-Reply-To: <CAOKSTBtpqPEnihFhopocV_RC8VR_RribXctUayEkUCav3omr3g@mail.gmail.com>
References: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
	<87qzq2kxrc.wl-tiwai@suse.de>
	<CAOKSTBtpqPEnihFhopocV_RC8VR_RribXctUayEkUCav3omr3g@mail.gmail.com>
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
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 166C05BD7E

On Mon, 02 Mar 2026 17:56:48 +0100,
Gilberto Ferreira wrote:
> 
> Hi there...
> 
> When I boot with kernel 7 RC1/RC2, I see the Firefox playing and there
> is audio activity, but no sound on TV speakers.
> When I switch to the onboard card, it works fine.
> When I boot with kernel 6.19.5, both cards work fine. In fact, it has
> worked since 6.19-RC2.
> 
> This the output of the commands:
> 
> With kernel 7.0 RC2:
> 
> $ cat /proc/asound/cards
> 0 [Generic        ]: HDA-Intel - HD-Audio Generic
>                      HD-Audio Generic at 0xfccc8000 irq 71
> 1 [Generic_1      ]: HDA-Intel - HD-Audio Generic
>                      HD-Audio Generic at 0xfccc0000 irq 72
> $ aplay -i

Not -i but -l.

But this doesn't matter much now, as the HDMI audio devices seem
enumerated. 

> ALSA lib pcm_dmix.c:1000:(snd_pcm_dmix_open) [error.pcm] unable to open slave
> aplay: main:850: erro ao abrir áudio: Arquivo ou diretório inexistente
> 
> I tried with kernel 6.19.X and got the same output.
> 
> This is the onboard sound card:
> 
> cat /proc/asound/Generic_1/codec#0  | more
> Codec: Conexant CX11970
> Address: 0
> AFG Function Id: 0x1 (unsol 1)
> Vendor Id: 0x14f120d0
> Subsystem Id: 0x278212c2
> Revision Id: 0x100001
> 
> This is the HDMI port:
> 
> Codec: ATI R6xx HDMI
> Address: 0
> AFG Function Id: 0x1 (unsol 0)
> Vendor Id: 0x1002aa01
> Subsystem Id: 0x00aa0100
> Revision Id: 0x100700
> 
> I am using KDE Plasma Desktop 6.6.1 with alsa, pulseaudio, pipewire
> and wireplumber installed.
> But I don't think this is something to do because everything works
> fine with the 6.19 series.

So, have you compared kernel logs from both working and non-working
cases?

In anyway, there haven't been so many changes in HD-audio driver
between 6.19 and 7.0 about HDMI audio.  Maybe the only relevant change
would be the commit cb9b6f9d2be6bda1b0117b147df40f982ce06888
    ALSA: hda/intel: Make MSI address limit based on the device DMA limit

Please try to revert this and check whether it brings any difference.

If not, most likely the regression is rather in the graphics driver.
But, it'd be best to do git-bisect to figure out the culprit.


Takashi
