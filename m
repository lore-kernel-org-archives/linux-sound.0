Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38960494820
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 15:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817522; cv=none; b=ivrDhkqF+BFgWivYARDfgG7owwgbjijjDD6q+HrJXc4J8vzAYh2Ps8+DYpba7M1hDSFKYOqQWbEsSTy+9k7XxIcKN7xRwkeFh3uG9eZtBd+w7D7ZHh7hO50z2ebJaimr3lvStu2AKRYwUshmtLIedVKBIqm0NN+tOS+8LGJ+MKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817522; c=relaxed/simple;
	bh=HEyKuX/wB10mresDeRGp/L/SuvK4/zzFa6ZXe9satPA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EGFHA2PBe95SCOqq02whlYEFTWSIDNo6TUkND272JwXN63vkRh1bi4JKLhEw3DQYBLD6B8/+XDUUDkVemxDzR/rT1LPTz++7gngD7RJhzzh3s+HlQug0RM+GaLx6fYqTgRnA6uMd9lCTCLZ0Y5tEToDpt/xNFMYYLgj4xOrbZSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u33u7+Cb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5wXEXB23; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RWo40DhA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HQXLI9So; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u33u7+Cb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5wXEXB23";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RWo40DhA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HQXLI9So"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EE5F621E9F;
	Mon, 12 Oct 2026 15:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791817519; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6hCRYvW2uZCGCR56NmGFocHJ7UUlNjemmLMuarTcR8o=;
	b=u33u7+CbDnCnmkudocQ/BSoypvRXsk7iO1bfA7j00KWUthjZ+uMysLqUQOKJJoeKFnWF42
	ZdGmVPNwJgUq5fAO5sezok6YLnlo79sunyfcKOXjh6xWY3sHsJaSI1HeusGN9/dBfLNbSY
	j6exUHQQwXxhVflbgoEBfcxOMsexv5k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791817519;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6hCRYvW2uZCGCR56NmGFocHJ7UUlNjemmLMuarTcR8o=;
	b=5wXEXB23HNvwDxS+oqGRgJLf3JRPZ6L/5OsOUENm/eTko83v31Hy2DEWQ1O5vvFVED4vYI
	aCR9HGP/CGsao+DA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RWo40DhA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HQXLI9So
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791817517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6hCRYvW2uZCGCR56NmGFocHJ7UUlNjemmLMuarTcR8o=;
	b=RWo40DhAd4CNSopBZArsc1XAVO/lDAu3DeDVbWss86dPBNYiAsqTKU17Gbc26xM+P2ufmB
	TCGAKs60+q1pWmJfK5feCL1tBys4mAEM5PaiLwjttmwJIWFwtK3e9IB7uQJQVR3MDo4qxm
	/Zdo0KNCwgqmwAcddRa+Vpznfrhlk9A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791817517;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6hCRYvW2uZCGCR56NmGFocHJ7UUlNjemmLMuarTcR8o=;
	b=HQXLI9SoDr/RLpUWkxcXYqtzNKVgPg2nCPKeCDDVLp2zGmAfL6JT+l5Ho/uP510JX6HWbT
	CjWobtzdyJhbhvBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ABAA313408;
	Mon, 12 Oct 2026 15:05:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XJfXHy33zGrLWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Oct 2026 15:05:17 +0000
Date: Mon, 12 Oct 2026 17:05:17 +0200
Message-ID: <87bj8zgdsi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Gon=E7alo?= Miranda <me@goncalom.dev>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: Re: [PATCH v2] ALSA: hda/conexant: Add quirk for Acer Aspire Go 16 mic mute LED
In-Reply-To: <20261012110024.25310-1-me@goncalom.dev>
References: <20261012110024.25310-1-me@goncalom.dev>
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
X-Spam-Score: -3.51
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,goncalom.dev:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: EE5F621E9F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Mon, 12 Oct 2026 13:00:24 +0200,
Gonçalo Miranda wrote:
> 
> The Acer Aspire Go 16 (AG16-71P) uses a Conexant SN6180 codec
> (subsystem ID 0x1025:0x1937) with the microphone mute LED wired
> to GPIO4. Add a quirk entry so the kernel drives the LED in sync
> with the microphone mute state.
> 
> The fixup reuses the existing cxt_setup_mute_led() helper with
> mask 0x10, matching the behavior verified on the hardware.
> 
> Changes in v2:
> - Moved the quirk entry to the correct position in PCI SSID sort
>   order, as requested by Takashi Iwai.
> 
> Signed-off-by: Gonçalo Miranda <me@goncalom.dev>

Applied to for-next branch now.  Thanks.


Takashi
