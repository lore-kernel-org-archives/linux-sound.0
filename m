Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524311;
	b=NLHd+vHXsJoyuT9J781uIInYag7h25e6b+apIXb1ufzeFjhoEl/8v+SiP2pfYSDxGVyn
	 bnAnjV4Ldc01eGCey4VXxZWnxRSIiYVz4pgKxlGELiaY9k4th5mJO0t3Z6nBqg3np6TOE
	 4DmmPHUw2vQtQWtVat85d7IhrIb9ei0SUxQRy8KtWEMHYxZ3udPu4rpXyPr5gbZy8/hb5
	 gW+6/EnaAgeYxehasPApX0Gg99NyhLxiC0assNNMNobozZXl4N0R8M5yIbz9t5wMlr6+S
	 v570COA3gBy00i4fxVG2HxBgA/ddDREmQvNRHE8MeHtsXqjVwnoVEvxduVTIZZEAwpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524311;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=+11gQFSIVFHvdaeLaogu836s9h4g1aU5YXTIp+Xdbz8=;
	b=PBdEinymOnusUKId2nUIQJ8n1Y5iPeaEBzL9nSXWtNRiS2Y5+G4gsGcXV1HqICOYaRzt
	 U3eqctymS//yey/FhiqG1+fZVo4LEJUsMLjyN06Nb6V9KyRSkFZlK41nBPN5R+ZBJHvAI
	 I2Yd+xF5/uzuHHy1iv4zkfM9R2Gt3M3Vu8XJBEh1hAD6Ur2Ouv97erlvToIGZlS6GkZGw
	 /VoYpABGni2OARdzqNvpuWy3K2qgGqN3TpUZcoS39CJ/DZx4BH/mXIrqfgH6n2vG8fSQY
	 v4Cr9r0JYsvdCLKxbSwp0uQkwPaR7cagAutPtZxWGzo8Bp7bNZ4ttUFBqN39pcyP+Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PYxCK20O;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JQI62XDL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PYxCK20O;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JQI62XDL;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6579F606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 12:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6579F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PYxCK20O;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JQI62XDL;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PYxCK20O;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JQI62XDL
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A55E1F7A0;
	Tue, 24 Nov 2026 12:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+11gQFSIVFHvdaeLaogu836s9h4g1aU5YXTIp+Xdbz8=;
	b=PYxCK20OuaD2dz7e7342yQvN/7ix7jZB1EgKo7CI/qcSI12YYr9pocPVuZKUiH7hfSAcUg
	Ra7cSJsCGnZyid3hFcp2YLqreRXDFsGz6ZuVFhqlhEI3gJONoMv3GGM39EBzXf3qeO5VkG
	1bdzecupnSuk2d1vjyIVYLihr6lHQYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+11gQFSIVFHvdaeLaogu836s9h4g1aU5YXTIp+Xdbz8=;
	b=JQI62XDLhHQXSvr9vRFv8JmMkK+DakwXw+WhUBvyIzyXjzCnbMJVfe8lTXHDSwcfOPYXjb
	ZySXqv2y9IMihZAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PYxCK20O;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JQI62XDL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+11gQFSIVFHvdaeLaogu836s9h4g1aU5YXTIp+Xdbz8=;
	b=PYxCK20OuaD2dz7e7342yQvN/7ix7jZB1EgKo7CI/qcSI12YYr9pocPVuZKUiH7hfSAcUg
	Ra7cSJsCGnZyid3hFcp2YLqreRXDFsGz6ZuVFhqlhEI3gJONoMv3GGM39EBzXf3qeO5VkG
	1bdzecupnSuk2d1vjyIVYLihr6lHQYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+11gQFSIVFHvdaeLaogu836s9h4g1aU5YXTIp+Xdbz8=;
	b=JQI62XDLhHQXSvr9vRFv8JmMkK+DakwXw+WhUBvyIzyXjzCnbMJVfe8lTXHDSwcfOPYXjb
	ZySXqv2y9IMihZAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54F7B1339F;
	Tue, 24 Nov 2026 12:45:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Rgc4DNWGBWtvFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Nov 2026 12:45:09 +0000
Date: Tue, 24 Nov 2026 13:45:08 +0100
Message-ID: <871p8abdpn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: SungHwan Jung <onenowy@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Fix mic mute LED on Acer Predator PHN16-71
In-Reply-To: <20261124094923.36856-1-onenowy@gmail.com>
References: <20261124094923.36856-1-onenowy@gmail.com>
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
X-Rspamd-Queue-Id: 8A55E1F7A0
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -12.51

On Tue, 24 Nov 2026 10:49:23 +0100,
SungHwan Jung wrote:
> 
> The mic mute LED on the Acer Predator PHN16-71 does not work and
> remains off regardless of the microphone mute state.
> 
> Switch the existing quirk to ALC245_FIXUP_ACER_MICMUTE_LED, which
> includes the existing headset mic fixup and also fixes the mic mute
> LED.
> 
> Fixes: d54c3cc224da ("ALSA: hda/realtek: Add quirk for Acer Predator PHN16-71")
> Signed-off-by: SungHwan Jung <onenowy@gmail.com>

Applied now.  Thanks.


Takashi
