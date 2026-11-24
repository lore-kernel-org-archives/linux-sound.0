Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524494;
	b=Q4dMdB65BDkxGGnTfPDpnA2W8oNdgM/WSf0eGTaSqOGKy9iQuafUgJSMJ3RkKSKQRcwN
	 zKKSFhLSn4xAvg2YZ55T3KCWR1lVDDCC1rV24h430pPPCi4tlXgdwb+D3+p05vZlkKnVC
	 XgSUSHXf78Poavggs2sKA/gjqbeEhNItud7q4HFUHhDLwkkBr5dGnEaJ3Fgcm5Qpfjanm
	 Z/AfzoTK4LoBFrCWSPVn1EKET386rNYzcrKq6vM+U1+xo8F/IBG7cwZGImZpA2D7J/exD
	 OGp34Cjj0wQ+Hy5N24LyCD56Q/z4nM0IAxK4R2LawOCHTnPzUHtctRj085aXUJwEy7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524494;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=DVCNnYLJZY3e50i2E0AcjEM5G+l/ZQuX7ihheHT8Xsg=;
	b=bpEd4n+0UWKXFf+MhtJbur9jeilCBSQcLUDpn8kNOl/JruKbxiFLYiiT+BElIgX4qUwI
	 zn3fbu1edwvUO8Np0JhtvcsJye6NjIUYPN3xAYsN1rrXCsA469Q/pF/tENJ6/UtLx7ISk
	 yz4ITQYoGfzmwFLDO6ofNHTAP0Q3JZAQwe1exOMkDYdOEMurkA18aVPTth7ykdc8WH+nW
	 wIIxA80jY+A2shFDPLeVTrDZLZxfcN1aTiBXzb/j7ffCmwUhs3kC6h4XbzAsePA1xGloR
	 nj4mtRqDxh4bTlqYXYUg6+6WuOt+hSh/SaeYFT9ZtRX86bPFawuwX9GnsbC+U8Cj4IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VIJrtD2Z;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=DckehWoY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VIJrtD2Z;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=DckehWoY;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96167606A331;
	Tue, 24 Nov 2026 12:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96167606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VIJrtD2Z;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=DckehWoY;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VIJrtD2Z;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=DckehWoY
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DDE2C1F7A0;
	Tue, 24 Nov 2026 12:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DVCNnYLJZY3e50i2E0AcjEM5G+l/ZQuX7ihheHT8Xsg=;
	b=VIJrtD2Z4Y3waGoOlu+yxgBDR/tIJsGzZyVvy6jJ9fsoLq+Y+DJD+NA1RW4av10gzXhpMf
	q+8QGxrqBASvqARqIUM0WBS1Wsey/JAAHtOnFpua8s2HMq2JxNYNio+5Q5EBmuS3CFJGxh
	pNsbYHx8mZWoN+bbeMkIrHRmXWmk0Zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DVCNnYLJZY3e50i2E0AcjEM5G+l/ZQuX7ihheHT8Xsg=;
	b=DckehWoYaKTUXjaT8lvEStmnoQ4A0gpO3ilH0WfyijB2YEQVqt3YVffQh8vfvMirMWBICj
	5i0s9b0WgZKQkCDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DVCNnYLJZY3e50i2E0AcjEM5G+l/ZQuX7ihheHT8Xsg=;
	b=VIJrtD2Z4Y3waGoOlu+yxgBDR/tIJsGzZyVvy6jJ9fsoLq+Y+DJD+NA1RW4av10gzXhpMf
	q+8QGxrqBASvqARqIUM0WBS1Wsey/JAAHtOnFpua8s2HMq2JxNYNio+5Q5EBmuS3CFJGxh
	pNsbYHx8mZWoN+bbeMkIrHRmXWmk0Zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DVCNnYLJZY3e50i2E0AcjEM5G+l/ZQuX7ihheHT8Xsg=;
	b=DckehWoYaKTUXjaT8lvEStmnoQ4A0gpO3ilH0WfyijB2YEQVqt3YVffQh8vfvMirMWBICj
	5i0s9b0WgZKQkCDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A2ED41339F;
	Tue, 24 Nov 2026 12:48:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b0qDHouHBWugGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Nov 2026 12:48:11 +0000
Date: Tue, 24 Nov 2026 13:48:11 +0100
Message-ID: <87v75m9z04.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: abhirajdutta7@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix duplicate LEDs on HP Spectre x360 16-f2xxx
In-Reply-To: <20261123-hp-spectre-16-f2-led-fix-v1-1-a2a333dceeb5@gmail.com>
References: <20261123-hp-spectre-16-f2-led-fix-v1-1-a2a333dceeb5@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Tue, 24 Nov 2026 03:17:57 +0100,
Abhiraj Dutta via B4 Relay wrote:
> 
> From: Abhiraj Dutta <abhirajdutta7@gmail.com>
> 
> The EU0XXX fixup already sets up the mute and mic-mute LEDs, so chaining
> ALC245_FIXUP_HP_X360_MUTE_LEDS after it registers both LEDs twice
> (hda::mute_1 and hda::micmute_1 appear). Use the EU0XXX fixup directly.
> 
> The original commit message also got the SSID wrong: under SOF the PCI
> SSID is 103c:891e, not 103c:0000.
> 
> Fixes: e30ec632e1f0 ("ALSA: hda/realtek: Add quirk for HP Spectre x360 2-in-1 Laptop 16-f2xxx")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhiraj Dutta <abhirajdutta7@gmail.com>

Applied now.  Thanks.


Takashi
