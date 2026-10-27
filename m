Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086155;
	b=2aAr54CLaKUg2TLS3LgHInrPDC0/3M52RnD4YQcvkEHYxYWY9yXyw1saSWz2zNahuIT7
	 +50PEnuMRjbf+GQr57YVbGoUVQkl7TzrAHGTPeqqHGC7L1h54n95fZlg7j0/+BO9YyPbk
	 Ol6Hd0skq4Hl0BdCDKkrdjZ7PxwZ356oFGWCC1CflVmEcpi6C2y7shTA9OdEuAY4P/KhG
	 sl1+b9pE8j7phNT/mSywF7m0TkDAXJ3ZQg7n4oLtP+F/PkP1tUkLqiBBYurRl0TqEt2HR
	 yYoiuk4v6h8RTFTckBREbSrED7JBC3gnNwcJIrBUPxRPPl6onqOOsiAk9OAylvLCZbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086155;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=TE7Dk00WrxlMVtc721960S9z184DP9l5u3bUjBCHlBE=;
	b=5VtcpQ0fd+LPUNPqpzlpqKTJQVkHpY8T+QVL8Gxx4ps7cP1fOs/k1a/wft4ETCyYx8zi
	 7zhHOYaLwyDHGQNhr+iNSDK4CF8/pKFi/eKAU20jZH96staTXBscVyx86eG4BPdi45/Vj
	 rI3xQxD/BRekIyDzg3K8hzPKpz5uapgMm8uSu/SiRjjCBSi7SzdTszawu4W4eOopXkFTT
	 Br8FNrCcO3reFMNCAbfyRWu0d7JlsfudymgkzG66LSySoCQ5qwLXOxgUaI64yawyFACBe
	 auSq7nv4cwD8FzKiujJBVoNDH1GvaE14V4pyZZxpFNfKCUd7QuDaEEQFbofeAsGG/Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YGgepJXB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=24WdKLWG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YGgepJXB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=24WdKLWG;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA32B606A31B
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 07:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA32B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YGgepJXB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=24WdKLWG;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YGgepJXB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=24WdKLWG
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A656C21FAB;
	Tue, 27 Oct 2026 07:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793086152; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TE7Dk00WrxlMVtc721960S9z184DP9l5u3bUjBCHlBE=;
	b=YGgepJXB590QLHHLS77OLCUOjuWvwStTMrHzsaoN+gmY/3nDNMYXadAO6pliEb9kyT6s4k
	pZK49MXFUKy5Tak7lrDNKsOgRfYHnDUnKsKwE+W/Litz/MonfNEQFNCSNYO9nIPhRKIRlp
	lema89q4yoTY1BzCs0Nyj4eQWzANjBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793086152;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TE7Dk00WrxlMVtc721960S9z184DP9l5u3bUjBCHlBE=;
	b=24WdKLWGaWLKkt17Acdiosme7wjbuxYVqMQKlOUgGbA3/BBB2N/i6jYGUtUr9aNhrDDdbt
	qet/czILur9vPLAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793086152; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TE7Dk00WrxlMVtc721960S9z184DP9l5u3bUjBCHlBE=;
	b=YGgepJXB590QLHHLS77OLCUOjuWvwStTMrHzsaoN+gmY/3nDNMYXadAO6pliEb9kyT6s4k
	pZK49MXFUKy5Tak7lrDNKsOgRfYHnDUnKsKwE+W/Litz/MonfNEQFNCSNYO9nIPhRKIRlp
	lema89q4yoTY1BzCs0Nyj4eQWzANjBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793086152;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TE7Dk00WrxlMVtc721960S9z184DP9l5u3bUjBCHlBE=;
	b=24WdKLWGaWLKkt17Acdiosme7wjbuxYVqMQKlOUgGbA3/BBB2N/i6jYGUtUr9aNhrDDdbt
	qet/czILur9vPLAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 129BB13319;
	Tue, 27 Oct 2026 07:29:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9A8oNcdS4GqAUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Oct 2026 07:29:12 +0000
Date: Tue, 27 Oct 2026 08:29:11 +0100
Message-ID: <87se1r38l4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zak Brighton Knight <zakbrightonknight@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Skip probe-time interface setup for MSI MAG X570S ALC4080
In-Reply-To: <20261026140934.3575940-1-zakbrightonknight@gmail.com>
References: <20261026140934.3575940-1-zakbrightonknight@gmail.com>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Mon, 26 Oct 2026 15:09:34 +0100,
Zak Brighton Knight wrote:
> 
> The Realtek ALC4080 USB audio on the MSI MAG X570S Tomahawk Max WiFi
> (USB ID 0db0:a073, the same ID as the MAG X570S Torpedo Max mixer map)
> has six streaming interfaces with 68 altsettings in total. For each of
> them, __snd_usb_parse_audio_interface() switches the interface to alt 0,
> initialises pitch and the sample rate and switches back, which costs
> about 64 ms per altsetting here, mostly spent inside usb_set_interface().
> Probing the card therefore takes about 6.4 seconds, on every boot.
> 
> That setup is redundant with snd_usb_endpoint_prepare() at stream-open
> time, so set QUIRK_FLAG_SKIP_IFACE_SETUP for this device.
> 
> Tested on 7.2.11 with the equivalent quirk_flags=0db0:a073:skip_iface_setup
> module option, re-probing the device via its sysfs "authorized"
> attribute: probe time went from 6.45 s to 0.57 s, all 68 altsettings
> are still listed in /proc/asound/cardX/stream*, and playback and
> capture work.
> 
> Assisted-by: LLM
> Signed-off-by: Zak Brighton Knight <zakbrightonknight@gmail.com>

Applied now.  Thanks.


Takashi
