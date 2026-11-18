Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006350;
	b=caGCFDOQaw/EeVUEJ7NMtfixnkwQ2y9Mpc6uhbopS5FQr+ViwhH1tengnTPPVa2TIg3h
	 Qj27vimWdyXJfG29nygtgQcdd/Wht5z4V4Dg3dc4N8x03HEM2dGpNM9cRrBwiBSqn6DHJ
	 evAFGNodAefsi+wyB0In7hX57AVOMhLrAaxfnu5EdBEjxVVh5NRh97Z9xA43Oq6ZgU88A
	 1RqU2/2TtOhtND9tS2aTNfIdvWaBoMhUH3fq3HKmnhirYd0C58anOYMn3zjSSqOG5oBUS
	 b9QWiLMH6CMlhS+jxHawqG5gWCfWpkHjjq8tNcCBzz4uHyeIYn2o10BbEjp/dPiicRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006350;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=LqoytvQBEvdhmatfXk26/boGuxDGBy8HsRRl2H2tnRs=;
	b=s/t/xd87kFdkWo+slwzerVC4qV/JpgpjgVUhy8+w+vpR58IuTNs4N8Epw7x9ygSgYHpA
	 jwk32oYICjdE4w7Ke97dxzmbISRhJPgZs0lBdrjaj6hvS3wgpCblemxfIe4Q9AsJXxW9f
	 80tVms0dZgSjP+UjakVQkx1DxyP7jUzQ6MZBbe+G63EtpLeX8b2jaP/8jQLdN1L5QEAIL
	 GLu+/0iy1Q8VUip1sDykMbj27YYnOnATOq9pOvZWIwutMFDIqzt46cL3Scz/rhyqxTtqd
	 6fL7BOWb9p1WlRkhzViu9GwesIKHZnPvOs23SAeRcrutq36/V80AVCVztVtLzknppyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rDwAY5Cm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xTTeiKt3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rDwAY5Cm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xTTeiKt3;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18357606A31C;
	Wed, 18 Nov 2026 12:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18357606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rDwAY5Cm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xTTeiKt3;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rDwAY5Cm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xTTeiKt3
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2CDB722171;
	Wed, 18 Nov 2026 12:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LqoytvQBEvdhmatfXk26/boGuxDGBy8HsRRl2H2tnRs=;
	b=rDwAY5CmAvhlPE858Ls3CKhE/sbT1UgKfdmwamMnyM6dylSiu14u3h0+itWS729bGhuISx
	eNS8n8tXPXjs5Gc+JzD4893xSqACgij3FZ2bv3AwMFhthJst8xl36DpwQDpVp8OITGrw+w
	S2Kg2bbxGRL15IbSgKdQcsRb7H+Sj3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006348;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LqoytvQBEvdhmatfXk26/boGuxDGBy8HsRRl2H2tnRs=;
	b=xTTeiKt38Z3xcVn8Qqrl9YJf+Z2NjDHgMmjMz4rrI0r2t0kYHubqOWtBfe1xnfZSHhgCZ9
	Va/3hyDH08aGxGAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rDwAY5Cm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xTTeiKt3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LqoytvQBEvdhmatfXk26/boGuxDGBy8HsRRl2H2tnRs=;
	b=rDwAY5CmAvhlPE858Ls3CKhE/sbT1UgKfdmwamMnyM6dylSiu14u3h0+itWS729bGhuISx
	eNS8n8tXPXjs5Gc+JzD4893xSqACgij3FZ2bv3AwMFhthJst8xl36DpwQDpVp8OITGrw+w
	S2Kg2bbxGRL15IbSgKdQcsRb7H+Sj3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006348;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LqoytvQBEvdhmatfXk26/boGuxDGBy8HsRRl2H2tnRs=;
	b=xTTeiKt38Z3xcVn8Qqrl9YJf+Z2NjDHgMmjMz4rrI0r2t0kYHubqOWtBfe1xnfZSHhgCZ9
	Va/3hyDH08aGxGAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA099134E9;
	Wed, 18 Nov 2026 12:52:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /ZT8K4uf/WpeVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Nov 2026 12:52:27 +0000
Date: Wed, 18 Nov 2026 13:52:27 +0100
Message-ID: <87zev6wbck.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Fix potential device leak on partial registration failure
In-Reply-To: <20261117-571e631490-alsa-pcm-0@mail.sdu.edu.cn>
References: <20261117-571e631490-alsa-pcm-0@mail.sdu.edu.cn>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 2CDB722171

On Tue, 17 Nov 2026 15:47:05 +0100,
Guangshuo Li wrote:
> 
> If capture registration fails after playback was registered, the PCM
> remains in the BUILD state. Card teardown therefore skips its disconnect
> callback, leaving the playback device registered and holding its parent
> card reference.
> 
> Unregister previously registered streams and release their timers before
> returning the registration error.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: ef46c7af93f9 ("ALSA: pcm: Embed struct device")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Applied to for-next branch.  Thanks.


Takashi
