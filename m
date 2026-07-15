Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12703C4171
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 07:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101732; cv=none; b=Bbr7Q0GW8KF1sKt8vsaXLfieiXUrxxeO6z+RBW7RnFjUnygoWNAxtBiE2so5OiSoAebPt0v6f8m3drzTblYHyyoIIc1VdW+xJ4aQqGd2oMZh/sUspBIuIVOfjdzycUeesuHFCShqaUNikMM1+mcXi04vasZvHcSEwEMguOqKqHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101732; c=relaxed/simple;
	bh=hnUFa/jefIaRA5+mPB+2jnK284+XSNereqfzyUswr70=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r75Jz2uevfGJvqcgwasAZCtC0C5w6jyQCg2l0XfHcdVndeYVAxOUVqgacXK3BfsSeZK9s0y0Raw6H/3Jd7W38YTLvA8Bae3MAXr6cLxU2RXfIsxDsGon5/BBdxSWU6zqMAPvu8GZLnSL8G5dJprnWTqrMY3kNS1hR9BdtUWBOZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z7/Vki/E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HMEvQieU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z7/Vki/E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HMEvQieU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z7/Vki/E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HMEvQieU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z7/Vki/E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HMEvQieU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8ABD4782B3;
	Wed, 15 Jul 2026 07:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784101722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+mV7Fwz0c9KOtYFmaXheVjwX3in6XQQExhizwLdRXhA=;
	b=z7/Vki/EM4OnpMUhATt/3a1i5mw4aS32m2YFst07x61s5zV+5knB4Ksxp+y5KQUxovDBxp
	OctsJO2NtkPwnd5TQ0CTVLy/ts3UH/PiofdjjesrUUrpG66g1CU1HfTZRrK/nHkSdLJPeL
	Y9z+DcGD9OTuWKC+3i8ezq1uFGdBUT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784101722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+mV7Fwz0c9KOtYFmaXheVjwX3in6XQQExhizwLdRXhA=;
	b=HMEvQieUXQOK9xCLTNmG/R1IvNGyRYzsdDxb4UGXu0mMY54YjdwLF9Zut61c+RMxWl6ZCQ
	3GoJB3m1ww4fwMCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="z7/Vki/E";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HMEvQieU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784101722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+mV7Fwz0c9KOtYFmaXheVjwX3in6XQQExhizwLdRXhA=;
	b=z7/Vki/EM4OnpMUhATt/3a1i5mw4aS32m2YFst07x61s5zV+5knB4Ksxp+y5KQUxovDBxp
	OctsJO2NtkPwnd5TQ0CTVLy/ts3UH/PiofdjjesrUUrpG66g1CU1HfTZRrK/nHkSdLJPeL
	Y9z+DcGD9OTuWKC+3i8ezq1uFGdBUT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784101722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+mV7Fwz0c9KOtYFmaXheVjwX3in6XQQExhizwLdRXhA=;
	b=HMEvQieUXQOK9xCLTNmG/R1IvNGyRYzsdDxb4UGXu0mMY54YjdwLF9Zut61c+RMxWl6ZCQ
	3GoJB3m1ww4fwMCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64670779AD;
	Wed, 15 Jul 2026 07:48:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id z7xlF1o7V2q6NQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Jul 2026 07:48:42 +0000
Date: Wed, 15 Jul 2026 09:48:42 +0200
Message-ID: <87pl0oy9ph.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marcel =?ISO-8859-2?Q?K=B3os?= <marcel@marmak.net.pl>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP EliteBook 830 G8 (8AB8) to enable mute LEDs
In-Reply-To: <4dab5622-9100-4730-8c99-b58da939549b@marmak.net.pl>
References: <4dab5622-9100-4730-8c99-b58da939549b@marmak.net.pl>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	URIBL_BLOCKED(0.00)[marmak.net.pl:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8ABD4782B3
X-Spam-Score: -3.51

On Tue, 14 Jul 2026 21:36:26 +0200,
Marcel K³os wrote:
> 
> The sound and microphone mute LEDs do not function on this newer
> revision of the board (8AB8) while they do on the older 880D models.
> I have verified this on another laptop which was manufactured before
> the one with the issue.
> Added the ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED from a G9 model, which
> uses the same codec, to make it work. Tested on kernel version 7.1.3 on
> the aforementioned newer revision notebook. 
> 
> Signed-off-by: Marcel K³os <marcel@marmak.net.pl>

Applied now.  Thanks.


Takashi
