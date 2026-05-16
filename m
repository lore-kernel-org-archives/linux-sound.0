Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224B01DE8BE
	for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 13:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778939012; cv=none; b=eHsXSh5kDy40YUVtwsAEQJ6grF42TBlDthVphBgi6zRdguVTXRZZaJG96SlP+VyYnZBKXjZEdsxkbLa0KAyRAwYLaK2rA47wvOnSG8l1H8jI9VIvfiYjaA9K/J/X1Pr+zJ8DaKmSG9i4O7BFi/EPhGwO2Ao28XVtNaLGkaaH0Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778939012; c=relaxed/simple;
	bh=J5+ywiN0AY4xf/fBVMlWcmOeGsmiexXmZtagZuR5rc8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nkxsElulzzLdAnflUGl90GKzbqPIxIFvLHddKUO/ZM9MIPOFa+M4ucaqY3rGVTB0JOiGGi8J2CO8F5S8y0AhfpcrHcT/MJB02ZRfb2Crbsf+QFuFt5cC2Dor1K/ZRgJiWIvHKA0aDXy/5CYDeveHYy/DWoKAiqsNMi2LW3D8kT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LfYoQeye; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bFomtplD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZstmohhP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ukxBplcz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LfYoQeye";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bFomtplD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZstmohhP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ukxBplcz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 86D3661926;
	Sat, 16 May 2026 13:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778939009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8H6XuCdt7JNnpFUl6T8Orc2rm9/MRRcTFmc5x7Om2lA=;
	b=LfYoQeyeWana8UXZjNyQ54NbMv10sp7c5OVE3c0j/t/WDiDHZkMOXKCcOcwqLUSift1FYI
	mG6oBoybMt+PHlwxKd8iKZa6CkaNXLhYW3r6FuV1b4Gc7WSbh80xXKG9NDAwE+7+vSrWMH
	r3Xoi3NvE/iqeqdquhjt8Ho5JAebXrc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778939009;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8H6XuCdt7JNnpFUl6T8Orc2rm9/MRRcTFmc5x7Om2lA=;
	b=bFomtplDyPDJj6NJ90bWztZ5F7TXD1Nq6h6Sbm/DXdUVprpe/Y/KaoHAAm+hXeMbQmRRJw
	gfRuTKqytFMCE5CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778939007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8H6XuCdt7JNnpFUl6T8Orc2rm9/MRRcTFmc5x7Om2lA=;
	b=ZstmohhP0E5w2/HCVaaLRMGeOR83F3TLHXh95QwcBpoupJ1R3E3FsYqmlXCzfeG3GDQa+U
	cttFPlLfAJtMct+6LpFXmuoDtFqUs1MjaptWDFolKmXzqA9Mlc/v9MGzJmeSp8cc/YU/pb
	zyvXsuL8BXphZht0+7zi/kFSJror1FQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778939007;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8H6XuCdt7JNnpFUl6T8Orc2rm9/MRRcTFmc5x7Om2lA=;
	b=ukxBplcznS8ucsX33wVnqHaoiA+J+h0gEFsgoPbsD7TyhfAsKZ9oy7b2i/WxG62kgUZo8U
	TuobrsdBjByAcvCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A96B593A8;
	Sat, 16 May 2026 13:43:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id z2LjDH90CGqdYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 16 May 2026 13:43:27 +0000
Date: Sat, 16 May 2026 15:43:26 +0200
Message-ID: <87qznbxyf5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Eric Naim <dnaim@cachyos.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Use ALC287_FIXUP_TXNW2781_I2C for ASUS Strix Gxx5
In-Reply-To: <20260516111532.111463-1-dnaim@cachyos.org>
References: <20260516111532.111463-1-dnaim@cachyos.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cachyos.org:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Sat, 16 May 2026 13:15:31 +0200,
Eric Naim wrote:
> 
> These devices were incorrectly using the ALC287_FIXUP_TAS2781_I2C quirk
> leading to errors:
> 
> [ 18.765990] Serial bus multi instantiate pseudo device driver TXNW2781:00: error -ENXIO: IRQ index 0 not found
> [ 18.768153] Serial bus multi instantiate pseudo device driver TXNW2781:00: error -ENXIO: IRQ index 0 not found
> [ 18.768476] Serial bus multi instantiate pseudo device driver TXNW2781:00: error -ENXIO: IRQ index 0 not found
> [ 18.768899] Serial bus multi instantiate pseudo device driver TXNW2781:00: Instantiated 3 I2C devices.
> 
> Use the ALC287_FIXUP_TXNW2781_I2C quirk instead to fix this and restore
> speaker audio on affected devices.
> 
> Fixes: 1e9c708dc3ae ("ALSA: hda/tas2781: Add new quirk for Lenovo, ASUS, Dell projects")
> Link: https://lore.kernel.org/59fd4aa4-76b9-4984-8db9-a60e55ec6e80@losource.net/
> Closes: https://lore.kernel.org/CACB9z7kjs8rhLstEc8fV29BCTb5dd881JwGozoKdO5cwCb=YwQ@mail.gmail.com
> Signed-off-by: Eric Naim <dnaim@cachyos.org>

Applied now.  Thanks.


Takashi
