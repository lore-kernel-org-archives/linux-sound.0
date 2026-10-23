Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762460;
	b=z3YxavfqSvK+9GLApUTFj0cdSv4/Vjas39FMcxvaMeb4sCYJLUl5Ipuq1ljeCsv+ggsh
	 C27mBNezq83lQ8/6JJl17C+cKBqk21/I1ghPmphpjmR+GqgOsxVGiB07Up5itbBeVLmjd
	 23n4n+VGftMew5O2ufo5PAkJK93Mh8S/Zn2S0dB9g6Hmpl76jX6GfWt6tUqvr6UOwqE61
	 svjOSP2EnuJh68oaE0Ji2D6W1EFuTO/EfzjGGpz7u212V0VMiVCZvdYqDhDsnCBrjVa/B
	 QjJEZQmYMzafPMRo1mOmQS1kcg2nUZDSRFWn5iTqweh5L5Bzty/oiQuoMR0n57enXkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762460;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=gEzwcrQP0uzAqbAtj27nDxIiz86TjFP33Cl2g1Mlte0=;
	b=AqglAXq6bkSpM3boIRssIrKjrYAoVSlJd5F0HJAaIJSOcJVJ02+Pz8k1UDuTBAhW75zj
	 rTdJi7V8ZBRScUsh+EE1v6dxj+52vuJXym2a9j7GrKACmQowzvUgAIoU22C56JqsnfA7O
	 mw2wHUyCoOpJLD9jdGv6CK95z24Dl+FpFIIbwwxFULNs9XxC0Ff7Hi39gpdSB+uts8uk4
	 T8q89YAX2IPzRBT4fr4WQcRNmabl5Vx2MJrf0McvBNUK1FBcGkkng9+th77/QmIr7WH8y
	 ObHfDvgPOHuLDilkRC9qK3gCqM2VLlPubERGJaXsaI0r26Uyn1cbudmhTNVvcV9l8zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iTkuvGDS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="Brstu7d/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iTkuvGDS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="Brstu7d/";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E379A606A31A
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 13:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E379A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iTkuvGDS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Brstu7d/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iTkuvGDS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Brstu7d/
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 655A1220DC;
	Fri, 23 Oct 2026 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gEzwcrQP0uzAqbAtj27nDxIiz86TjFP33Cl2g1Mlte0=;
	b=iTkuvGDSzurr1Plh+V1RbiKeOWkGZX41TCY80tsnzUZfNnmhP7sjEGHhxb2Qw5TkKAItkA
	MVGcjLfxv6FLZKUvuk/asUd8YhrlzwCDy0+IzfeapDqLnQFkKz1FWBEN5d4Gv9gHPte8FA
	f0DocZebM0rwCJhMZQ1slLw0/DIYyo8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762458;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gEzwcrQP0uzAqbAtj27nDxIiz86TjFP33Cl2g1Mlte0=;
	b=Brstu7d/T53ShQ19/6/A/qVkS3rV8bWe8m/nijmoLlgu8ewex8ZS7ZR1OQ4qk0062pyEeX
	qrVd3dUfheALVNBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iTkuvGDS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Brstu7d/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gEzwcrQP0uzAqbAtj27nDxIiz86TjFP33Cl2g1Mlte0=;
	b=iTkuvGDSzurr1Plh+V1RbiKeOWkGZX41TCY80tsnzUZfNnmhP7sjEGHhxb2Qw5TkKAItkA
	MVGcjLfxv6FLZKUvuk/asUd8YhrlzwCDy0+IzfeapDqLnQFkKz1FWBEN5d4Gv9gHPte8FA
	f0DocZebM0rwCJhMZQ1slLw0/DIYyo8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762458;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gEzwcrQP0uzAqbAtj27nDxIiz86TjFP33Cl2g1Mlte0=;
	b=Brstu7d/T53ShQ19/6/A/qVkS3rV8bWe8m/nijmoLlgu8ewex8ZS7ZR1OQ4qk0062pyEeX
	qrVd3dUfheALVNBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 291F5133F6;
	Fri, 23 Oct 2026 13:34:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5+38AFpi22p6TwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Oct 2026 13:34:18 +0000
Date: Fri, 23 Oct 2026 15:34:17 +0200
Message-ID: <87fqxwa6cm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shahab Ghodsi <shahab16774@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de,
	kailang@realtek.com
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for ASUS ExpertBook B3402FVA
In-Reply-To: <20261022090149.304576-1-shahab16774@gmail.com>
References: <20261022090149.304576-1-shahab16774@gmail.com>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 655A1220DC

On Thu, 22 Oct 2026 11:01:49 +0200,
Shahab Ghodsi wrote:
> 
> The ASUS ExpertBook B3402FVA (PCI SSID 1043:1e03) uses an ALC256
> codec. Headphone output is extremely quiet and distorted, with only
> the loudest parts audible. The BIOS does not enable the headphone
> depop circuit.
> 
> Reuse ALC256_FIXUP_ASUS_HPE, which sets COEF 0x0f to 0x7778 to
> enable the headphone depop circuit. This fixup is already used for
> the ASUS TM420 and B1400CEPE.
> 
> The COEF write was verified manually with hda-verb on this machine;
> headphones become loud and clear. The chained pin change on 0x19 was
> also applied manually; the headset microphone worked before and after,
> and audio playback was unaffected.
> 
> Closes: https://github.com/thesofproject/linux/issues/5996
> Signed-off-by: Shahab Ghodsi <shahab16774@gmail.com>

Applied now.  Thanks.


Takashi
