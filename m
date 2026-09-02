Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33476388E76
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 06:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331474; cv=none; b=Gj3/AuNC7GRSZZbTOtptzkJZopMkFXW7lj1Yq7I3VpqBnN0AW1BjrWvctD//XYgEaC9ZIhM86UQPyQG7yltwDjw6p9kyzpas+qKgcc0UkMDVo/JDoN9UTiauPIo4ehlqw0LzYBM24Uq/Pjx4c5HEpgZG/ms+VUfR2WaD7tX3N0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331474; c=relaxed/simple;
	bh=GXHZpIeBe3j2/DE3vNWBoC8rRW53KjIG2dhtuoW9k0g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gDbSN+/gDsRRWoaY2slpYqCf7wSe/WspKrTVhITpnmaxP7/A7QBrIAWLrXskM1vdnmCx5DjCEz7zhKWpbTGtwKtkUGrydbFq8lbnR9RGjA+LqvbvcX96lD8jQjXA3ch98F//I1qdJYfhriXsPxekNwkq6w0piQAPIQAmHV6t2TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OfRHVwt+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+ycOlvhG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rDDKTCN3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tjamup4D; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OfRHVwt+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+ycOlvhG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rDDKTCN3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tjamup4D"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C294221F1B;
	Wed,  2 Sep 2026 06:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788331466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F1cOAs96rveVWIlHjWvhQ25ERcXFHWsJh8TxjoMTleA=;
	b=OfRHVwt+1h30/s3D5z0wdyHIy3jAQJRRSOMAn+B2uUSrwEXHodaM909gh2NokA8XW48rPj
	2ja0W1k43l59m7x7nFtexNfwh1I2mr1UGXtozfp5OgbNtDZtBz89q/OkaefjloH2t1OdhH
	UPWtJ/XvyOWp51/g1XqXPBgJw7gWees=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788331466;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F1cOAs96rveVWIlHjWvhQ25ERcXFHWsJh8TxjoMTleA=;
	b=+ycOlvhGCe9DFYFcY1HvP246k6HY/V/8DrHp52AluOd7g3owM12496Bap/b4bQ0b/CBFo2
	gfRfNc49j0DDpfCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rDDKTCN3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tjamup4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788331462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F1cOAs96rveVWIlHjWvhQ25ERcXFHWsJh8TxjoMTleA=;
	b=rDDKTCN307o1ywuE1jQjTMxhblk6eDNr1yqCCRS72vO0SjleSn1HPJZyUp6/FX4f96sfQx
	FV6Wk0T8Suicczz2tf8nd4Q4wTvu4rR/QEmpQWgyfnWIJUQqbvvvxPW4Ob7LUEzf+txyMt
	o5BhkGTWvvgAGMyg+GC67/XynOamSz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788331462;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F1cOAs96rveVWIlHjWvhQ25ERcXFHWsJh8TxjoMTleA=;
	b=tjamup4DLeddQNlIK463kvin56k7DDs9jB/EnLFNpnzji9+xpKiO8O1OQkMgUJj3vKu9xB
	9GQsm+Ea0Eff+8Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 858C0136E6;
	Wed,  2 Sep 2026 06:44:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wHVVH8bFl2q2PQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Sep 2026 06:44:22 +0000
Date: Wed, 02 Sep 2026 08:44:22 +0200
Message-ID: <87ik4ob1a1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Allen Abraham <allenabraham713@gmail.com>
Cc: "tiwai@suse.com" <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 14-dv0xxx
In-Reply-To: <CACw2+N5x_DCXKj_k-iV8sQ=hcS7KxVyfRZsaR8PPx6qpRAFMug@mail.gmail.com>
References: <CACw2+N5x_DCXKj_k-iV8sQ=hcS7KxVyfRZsaR8PPx6qpRAFMug@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C294221F1B
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 01 Sep 2026 14:26:44 +0200,
Allen Abraham wrote:
> 
> 
> HP Pavilion 14-dv0054tu (PCI SSID 103c:87c9) with Realtek ALC287 codec
> controls the mute LED on the F5 key via GPIO 4 (mask 0x10).
> Add a quirk entry with ALC287_FIXUP_HP_GPIO_LED to enable the mute LED.
> 
> Signed-off-by: Allen <allenabraham713@gmail.com>

The patch isn't cleanly applicable, as your mailer likely broke the
spaces and tabs.  And, your Signed-off-by tag is incomplete; it must
be with a real name (or a known identity).

Please fix your mailer setup and resubmit with a proper Signed-off-by
tag.


thanks,

Takashi
