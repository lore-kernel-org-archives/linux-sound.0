Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A380832AAA8
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 07:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779953973; cv=none; b=VQoAQYu0MBT+WHJxnCTCNtm9gJZaEQYLeuSbQARyx6szqnkrRnyt8kMuYree3hcizI9SVl2dIwCPOcOWNlnAvCxKYBUUCmj9Bu8BpZopH0b0I69HdYD3uP+DhaWo6pd+zrBLAk3Wyfo/Y2/HQIfJzdj04oyqIgopZ0bCev1eQMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779953973; c=relaxed/simple;
	bh=SPz0RVLaKisGJ+zsoRueoBesjcq5EX/CwfqfyScxap8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQLTQtdilQjwSlPbVGymJa88Oj/kGnkUvEC+0x6yVy/vRdAQ3MR9Ea7JFxYLBikejO3z1r8FJ4K5w9nWXbHzEQor+rkDmOZPBnJchZq4izN5AXclmTyfCHNaKjUdMyHxuYXPFij5aKW9YN6xn650VIL/fQmngUuDBTfj6eGU11g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jI2m43r7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=md268n2f; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jI2m43r7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=md268n2f; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jI2m43r7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="md268n2f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jI2m43r7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="md268n2f"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0CE346A91B;
	Thu, 28 May 2026 07:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779953969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KIpAXJSqdtkhqgrJikbLokLX+ICuPRAs5ufXv/e9Sy8=;
	b=jI2m43r7yCnz/x/S1Nw/73oebHArv7apGsKYJeW9RATXW39XpUhwiFe04xN6Dq6xl9upxO
	uF5lRtMS0nGIbei+zAnTi6CsAgeHFuDWpHcXeoS4tuIPhMX9VR77vtJU5Efpa1CiPs3dTk
	leGRh/eVYE7fG/SIua60hrCopf72uVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779953969;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KIpAXJSqdtkhqgrJikbLokLX+ICuPRAs5ufXv/e9Sy8=;
	b=md268n2fwQPQxPJnViuBpkJMHAsrbHDTLuHDhXoQk7Pqb/Y67IIxZkX2uRuI++POKbOaAI
	Yy9FMdRo3kbVSYBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779953969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KIpAXJSqdtkhqgrJikbLokLX+ICuPRAs5ufXv/e9Sy8=;
	b=jI2m43r7yCnz/x/S1Nw/73oebHArv7apGsKYJeW9RATXW39XpUhwiFe04xN6Dq6xl9upxO
	uF5lRtMS0nGIbei+zAnTi6CsAgeHFuDWpHcXeoS4tuIPhMX9VR77vtJU5Efpa1CiPs3dTk
	leGRh/eVYE7fG/SIua60hrCopf72uVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779953969;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KIpAXJSqdtkhqgrJikbLokLX+ICuPRAs5ufXv/e9Sy8=;
	b=md268n2fwQPQxPJnViuBpkJMHAsrbHDTLuHDhXoQk7Pqb/Y67IIxZkX2uRuI++POKbOaAI
	Yy9FMdRo3kbVSYBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C170C5AC8A;
	Thu, 28 May 2026 07:39:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 13nhLDDxF2oaWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 May 2026 07:39:28 +0000
Date: Thu, 28 May 2026 09:39:28 +0200
Message-ID: <878q94ugnj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jackie Dong <xy-jackie@139.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	zhangheng@kylinos.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA:hda/realtek:ALC269 fixup for Yoga Pro 7 15ASH11 mic mute LED
In-Reply-To: <20260527130353.5658-1-xy-jackie@139.com>
References: <20260527130353.5658-1-xy-jackie@139.com>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[139.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Wed, 27 May 2026 15:03:53 +0200,
Jackie Dong wrote:
> 
> Lenovo Yoga Pro 7 15ASH11 with AMD RYZEN AI MAX+ 388 (Strix Halo, ACP
> 7.0) uses Realtek ALC287 series codec. The ALC269_FIXUP_LENOVO_XPAD_ACPI
> in alc269_fixup_vendor_tbl[] can load lenovo_wmi_hotkey_utilities module
> by default in this laptop, but the driver doesn't control mic mute LED.
>  
> If users run below command and the mic mute LED can work normally.
> 
> $sudo echo 'Capture Switch' >/sys/class/sound/ctl-led/mic/card1/attach 
> 
> After added the SND_PCI_QUIRK quirk special for Lenovo Yoga Pro 7
> 15ASH11, the mic mute LED works well.
> 
> Signed-off-by: Jackie Dong <xy-jackie@139.com>

Applied to for-next branch now.


thanks,

Takashi
