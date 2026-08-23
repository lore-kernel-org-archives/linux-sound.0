Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37624351C0B;
	Sun, 23 Aug 2026 08:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787475126; cv=none; b=NaGklp2SoUaI+Xzr0uD6tDgosKi2HUArFrgkjK245X/dRj+CRjaynsS12axerpHjYzHCQ0/bYqjNjvqs9qFlve6ABW8fIKTy1Ua701C5r9g5RZH8lWrzDyErPVL4KRw6UUtLwyHskAi3S7Iatoo0u7dMvhV3iOAskyWLOBEIXUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787475126; c=relaxed/simple;
	bh=CHfXVpPJUg7uU7ZQbVlF9CBZC0vjOOx6ffhCjDvdNy4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P7SLmFkPLgwviZ26n61TXQGvBVYvYvukGQ3SCXJxxuar4rvDtugtBzNXfF2Ow2mKtpcjpZqnFFJOX8Glk0lAXxEEPR2RhzzcMZwSrrqeRDjWR+V+2VVrrI0yknT54IjHx5ta1g9MTRvlZpRkhSVbdLLyBBbH8aaXhYc81I9d9B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eFo84i6G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1glnLvCF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G7x0gwOU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jOmMh8I7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eFo84i6G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1glnLvCF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G7x0gwOU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jOmMh8I7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3186F3F2B;
	Sun, 23 Aug 2026 08:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787475059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xqxX6IWbYVmstyCyk/F4//Y8i3AOl8osKcwZDPZAy04=;
	b=eFo84i6GZpDFLu46P5gIbSzH3ogAd7fv8lB2h5HoQUOb8drjKuN3+DsTgRo3+JwMN5pbMi
	qz3wGVqpzmS/Sy3XYPcpEXwqS9qerPM2+Xy87VHCVP2qTDt/7Wgi9erPfugIBujDh4xD7d
	ECG3okyW25oF/dBu9B9PeGf+Nqiw2Do=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787475059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xqxX6IWbYVmstyCyk/F4//Y8i3AOl8osKcwZDPZAy04=;
	b=1glnLvCFNvhU6h6Td+OXuWAPt2+1+TT+Ep26zkqIx/wLPbldpHcLKvFz0fIOwCFc+VKgmt
	y54303pYv12PeyDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787475055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xqxX6IWbYVmstyCyk/F4//Y8i3AOl8osKcwZDPZAy04=;
	b=G7x0gwOURU+wZAQ6v9LDvoCrngt668ywVba4xj7e+tlJQr5vWc6rAtzkVGUON8PYBuCBWN
	ZIXaEZicJ1HkkKjP8yl5nkKZDL6IW+V44CbGPQbcO408OBmH45Qp7jGJHLgdurzV4XEn4H
	lQtmcGVROySXirfsnAybtQkSbgtkHmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787475055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xqxX6IWbYVmstyCyk/F4//Y8i3AOl8osKcwZDPZAy04=;
	b=jOmMh8I7wiW8UfYp/izR1gUnNjw86RIQLVxzU0I+lbx7yLAeqaYZ1PcYasBc222QyAiz0+
	AyQBSJm1k08odcBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E831B13332;
	Sun, 23 Aug 2026 08:50:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jLdwN260impoAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 23 Aug 2026 08:50:54 +0000
Date: Sun, 23 Aug 2026 10:50:54 +0200
Message-ID: <87mrudw781.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Csaba Budai <ilyr73@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix ALC700 audio on Intel Hades Canyon
In-Reply-To: <20260821102514.11194-1-ilyr73@gmail.com>
References: <20260821102514.11194-1-ilyr73@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.990];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Fri, 21 Aug 2026 12:25:14 +0200,
Csaba Budai wrote:
> 
> On Intel Hades Canyon systems with an ALC700 codec, analog audio can
> become unusable after rebooting from Windows into Linux.
> 
> The affected system uses codec subsystem ID 8086:2073. In the broken
> state, Realtek coefficient 0x1b has value 0x4a4b. Setting bit 0x0400
> changes it to 0x4e4b and immediately restores normal analog playback.
> 
> The BIOS also sets this bit after disabling and re-enabling onboard
> audio, while Windows may leave it cleared. Linux currently does not
> restore it during codec initialization.
> 
> Add a machine-specific fixup for Intel Hades Canyon which sets only
> bit 0x0400 of coefficient 0x1b during HDA_FIXUP_ACT_INIT.
> 
> The fix has been verified across Windows -> Linux reboots on an Intel
> NUC8i7HNB with an ALC700 codec.
> 
> Signed-off-by: Csaba Budai <ilyr73@gmail.com>

Applied now.  Thanks.


Takashi
