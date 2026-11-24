Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528636;
	b=msPnlIIP3as2n3Rm7b86Eey7O+1oDQIsaGrZIv2cob37+qUwtUM5IXTVDS+5wWLn5pjn
	 ujtVAQZA2yS1G52W3+w9ZkMXuvTMtMare93Gg/Rdbhv67Ouf6AyPUJlG18UFuEbqez/B9
	 GnlSkgfPl2Gk8Gk2jCBPFyDXr0Q7xFQXPWXhzFF8EtMdWxLWNnhG1hKv5ww8u/QRpJrXz
	 2A4T8FAAhvjeR20tii2qCQK63nQ5ZFYTjQ8xLIRN9NjYH4MP0lAfTURTcNYnaQAVCeR/9
	 kbi+h6EyMojRqP8BoMduDc5o7+cDztTsvbgQ1FsMjYUKO2BA4fJD1u758BApfakzHSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528636;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=aMgBPS0VttTs0uWQ8O9FVSYefd2Z+89IofAQkH25+8w=;
	b=rjQPjYH3uMah9hbeChKHd1PjVu16kjjg8bhIqrl3xRo42fLj3d/ZitvLGHsh755fl/Qy
	 pGEneGY331smqYQ8ukVW1SZlZZQQln324rB4n3HTGSRnM7UWcrXA0oZ0T1SDbedVGtkl2
	 a7bPkkl7NvNl4vtahkU6f33pKPeptOIELvUHhOAqN4val6sgA7Ds/UJWvoLxGpuiucECS
	 wSDpgRicJ7bKOV/WFMFzLLrP1E53oGJRqbHf0rlIEuumoJGeBZidcmVztXwYgpjL4ydz2
	 vlycL03KucKxZvIJSezorMoovLb6Zp5ou/fgSovLuoiUB3akQhh0HhPhY9IGx+cLMew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UR15ghQm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oyQqgNoP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UR15ghQm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oyQqgNoP;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7063B606A31E;
	Tue, 24 Nov 2026 13:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7063B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UR15ghQm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oyQqgNoP;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UR15ghQm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oyQqgNoP
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8A27022040;
	Tue, 24 Nov 2026 13:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795528633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aMgBPS0VttTs0uWQ8O9FVSYefd2Z+89IofAQkH25+8w=;
	b=UR15ghQmSC9ZyjbSZ4KwXQopbetXOS5WPYkhFeIEkyG83X3Gr5GQKw+MLteoOU8dEhvvNP
	0/9geCalNj7zVZ1X6xy3zYvZxCUjHTASqBrSNu1vVZdJFs5+FSxhGhZl4MTlHldPsy5QKX
	zyPgZkGS7Usje6+OAa7FDoDJyxjkc04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795528633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aMgBPS0VttTs0uWQ8O9FVSYefd2Z+89IofAQkH25+8w=;
	b=oyQqgNoP1XKSj84lp5mL3oQAUjqlmmwWAf18HVfigXDoCHaPQ/BwdDPwOCt9Ivdb08DsQE
	iiFtNa8ELVyywrBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795528633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aMgBPS0VttTs0uWQ8O9FVSYefd2Z+89IofAQkH25+8w=;
	b=UR15ghQmSC9ZyjbSZ4KwXQopbetXOS5WPYkhFeIEkyG83X3Gr5GQKw+MLteoOU8dEhvvNP
	0/9geCalNj7zVZ1X6xy3zYvZxCUjHTASqBrSNu1vVZdJFs5+FSxhGhZl4MTlHldPsy5QKX
	zyPgZkGS7Usje6+OAa7FDoDJyxjkc04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795528633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aMgBPS0VttTs0uWQ8O9FVSYefd2Z+89IofAQkH25+8w=;
	b=oyQqgNoP1XKSj84lp5mL3oQAUjqlmmwWAf18HVfigXDoCHaPQ/BwdDPwOCt9Ivdb08DsQE
	iiFtNa8ELVyywrBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C99013505;
	Tue, 24 Nov 2026 13:57:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id u9agDrmXBWtSEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Nov 2026 13:57:13 +0000
Date: Tue, 24 Nov 2026 14:57:05 +0100
Message-ID: <87ld6i9vta.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arshdeep Singh <chahalarsh342@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP Pavilion 15-cs3xxx
In-Reply-To: <20261124132056.57345-1-chahalarsh342@gmail.com>
References: <20261124132056.57345-1-chahalarsh342@gmail.com>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
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
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 24 Nov 2026 14:20:56 +0100,
Arshdeep Singh wrote:
> 
> The HP Pavilion 15-cs3006tx (ALC295, subsystem 103c:86e2) has no
> working mute LED by default. Booting with model=hp-mute-led-mic3
> makes the LED work on this machine, so add a quirk entry for this
> SSID that applies the same fixup,
> ALC269_FIXUP_HP_MUTE_LED_MIC3.
> 
> Testing: verified on the hardware with model=hp-mute-led-mic3, which
> selects the same fixup as this entry. alc269.o builds and
> checkpatch.pl --strict is clean. I have not booted a kernel built
> with this patch.
> 
> Tooling: the working model option was found by manual testing,
> guided by an AI chat assistant (Claude). The table entry and this
> changelog were prepared with a coding agent (OpenAI Codex); I
> reviewed both.
> 
> Signed-off-by: Arshdeep Singh <chahalarsh342@gmail.com>

Applied now.  Thanks.


Takashi
