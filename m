Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251B0246770
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 13:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160440; cv=none; b=bu9ng8+WkrpQuwisw3M55+Omu2Iz5XEzLTCbHx79WFghRUmoQnq4ItNaPSKCAVjrlyufhq5KP1TiCwA6y1Qj5wl/Q6Lo4BO4EEfBcMlbgCVNDY9cCsMF8qPAUyyZpji8Drd9Qa6y43bix94iFSgguQw1HIO9Aq+pqE6zL7xw6zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160440; c=relaxed/simple;
	bh=vUxGzwX6AezQt9nTPkcBlxkL/uNdLyFcvaE2cQUDAi4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GLJ5pusQkIlbB0d6leSzapnOtn9+JcKMjDAVRugLqymkVvniu48+jZ5fiq8vkLKQfgkCRQ71dpB311O7ESn6YV6lAmxgzfztDvuc/sku3PAKdrxjBKzOpLVKz2/xj3Kldkb7eySk+ILmElMnj95bh1cidhVkOgvP34na8c8a3hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VFurO3+V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FmFK9zkY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bwvIliIG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cHsP4PFt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VFurO3+V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FmFK9zkY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bwvIliIG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cHsP4PFt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D833D7C658;
	Mon, 27 Jul 2026 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785160432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GxHEeG3YQMn4blWguCEyzekrtbHLlE2MfYjY9XCqpe4=;
	b=VFurO3+VxfwwrEjCTcSkBb/yc04h+HY1UMjCpjISdGppWXahMmuntymFC3qhp698jcKsFe
	JAci8FXq47sjdc4uXuULo8ozSVuJV2v7J4/nv8CkHsss0TAkvXvAhuRJlrBlpGhqlTJMjL
	WatqW2UlGxMY2gL6xIUWuuA/+pM+9iA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785160432;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GxHEeG3YQMn4blWguCEyzekrtbHLlE2MfYjY9XCqpe4=;
	b=FmFK9zkYdpoW2GtOcDsbhtjERdDRir7wh5cU5NBVH/xDHDX3OEV8KX6jNLu68B88DcTl6j
	mjTyRY9iUQWq+XBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785160427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GxHEeG3YQMn4blWguCEyzekrtbHLlE2MfYjY9XCqpe4=;
	b=bwvIliIGQcFudjY6Ou4LOOM2o5xOd6CxPi+vcEtdI7RK4ol7pAJ2c2DIdq/VDAWs0VLGwq
	Kd2cFLp84c3OuqZWqHyF2VtnSL0WeG3cEAy3ISitk0owx7SY/FeSG4o+P6dVla36zjZuSo
	GpqLwYiWC7c2Zt3hMSl1+VgUEyxE0tw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785160427;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GxHEeG3YQMn4blWguCEyzekrtbHLlE2MfYjY9XCqpe4=;
	b=cHsP4PFtL4DkrLRU6VTK07sqw33kBssSoWQmLa2CLcOPcan48elIEVFyQair1WABSotWho
	mpoWo5Eyu6XY10DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 80B80779C1;
	Mon, 27 Jul 2026 13:53:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JJUpHutiZ2rxIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Jul 2026 13:53:47 +0000
Date: Mon, 27 Jul 2026 15:53:47 +0200
Message-ID: <87o6fs8ro4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jackie Dong <xy-jackie@139.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	zhangheng@kylinos.cn,
	kailang@realtek.com,
	damien.dagorn29@gmail.com,
	sean@starlabs.systems,
	chris.chiu@canonical.com,
	huanglei@kylinos.cn,
	dnaim@cachyos.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA:hda/realtek:ALC269 fixup for Legion 7 15ASH11 Mic Mute LED
In-Reply-To: <20260727080048.13254-1-xy-jackie@139.com>
References: <20260727080048.13254-1-xy-jackie@139.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: 1.70
X-Spam-Level: *
X-Spamd-Result: default: False [1.70 / 50.00];
	SEM_URIBL(3.50)[139.com:email];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[139.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kylinos.cn,realtek.com,gmail.com,starlabs.systems,canonical.com,cachyos.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Mon, 27 Jul 2026 10:00:48 +0200,
Jackie Dong wrote:
> 
> Lenovo Legion 7 15ASH11 with AMD RYZEN AI MAX+ 392 (Strix Halo, ACP
> 7.0) uses Realtek ALC287 series codec. Its audio subsystem adopts a 
> hardware design similar to that of the Yoga Pro 7 15ASH11.
> 
> It shares PCI SSID 17aa:38f9 with Thinkbook 16P Gen5. 
> Therefore, use HDA_CODEC_QUIRK to apply ALC287_FIXUP_LENOVO_YOGA_PRO7 
> for identification.  
> 
> After added the HDA_CODEC_QUIRK quirk special for Lenovo Legion 7
> 15ASH11, the mic mute LED works well.
> 
> Signed-off-by: Jackie Dong <xy-jackie@139.com>

Applied now.  Thanks.


Takashi
