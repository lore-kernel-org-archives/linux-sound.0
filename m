Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091260;
	b=1fFdhWKglN6oX3cTOOGL+TGjGQ/PJpfVEoaFw9G5tn4/thzz5CDGabMJTqy+rBCpr/N2
	 vS0TmgbK9/d9leZKaGcs09T9M+XCmlNn/cfXlU+h7q4tKnyjkvooSr3o0npJapS28RXaQ
	 ORfvBqKe03bhfhcEMe1KrAdSBzPoZ3mcYKZSU8L6/VAWPK38kJNF1CGLGsVxEgPS7GkjU
	 yt5pO11GagY25r7ZrfaEHRDS1XdubCmls1Pw7Y3BNDXzcxkfH2S0Uw4FwIOjiCpfqjnte
	 r0p2cDVtp0wAJKqLsBUdp6KUu/DTUEFnrBLiP1gGqQ98Ah+BSBF3LHUt+0QKxtKMToQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091260;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=X1VvEG6+uRk98MiJJgVck2wIv5kxCMv9LX1FbTkKKvY=;
	b=lS/N1np3v7S+JZO8z8PJDiYAF8iWNQzBAyDVn6klQpJryU4L8TBlENAKdVKlH8AhIkqK
	 s+B6qzwGrnpJYbs1mqLHVVTH2q1fePDmBQ/LW5Pkj3pu+cW/rDF/rArmrIhKkkGzpzLAn
	 0Dekp+CD1vY98Lwu8fVBXAVriJPYuGM039EuSjIRJOzx1YFvskq9DPcs9iuvzVnOrr92W
	 2oH+zXQn2U/tXRgnEnr/7G9pT9G8nN2K4l8bx6iP6vlZejam7M5nkPL5oPC8KjnGVjpiY
	 ShOAvAynqatRYBk4BAyyxS+/Och1nmSybQ78BZ0v/zj+bKo+pcnljfrexcC3+hAEr0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bXZWbAUY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SzNh+M64;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=i81iJusv;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BuAoOAYm;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064D8606A33E;
	Thu, 19 Nov 2026 12:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064D8606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bXZWbAUY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SzNh+M64;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=i81iJusv;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BuAoOAYm
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E7DD01F794;
	Thu, 19 Nov 2026 12:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795091258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X1VvEG6+uRk98MiJJgVck2wIv5kxCMv9LX1FbTkKKvY=;
	b=bXZWbAUYv0+UPnJIbuvOSAy4l4TK4tGo3jFe+JBFfs4AA0QyjJTN3+1K+03uKkzuzgSsg+
	eHhBuxeyD8itew19hDyyAmAG69FjkZpQwdkaJK+9fCL0h4KLhMG00fpodUIjhbVWNZUsik
	fB+e7m5s3q5acWKK7LUF2VKrOjyzths=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795091258;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X1VvEG6+uRk98MiJJgVck2wIv5kxCMv9LX1FbTkKKvY=;
	b=SzNh+M64hK0169RRrl3CdVyeCQQgAbD4lcVzFw3VlaajUoWrDMpju0a/ON0OoF5mk4Y9z3
	npG5WSkEFmNQjrAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=i81iJusv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BuAoOAYm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795091256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X1VvEG6+uRk98MiJJgVck2wIv5kxCMv9LX1FbTkKKvY=;
	b=i81iJusvkDzYemDMWEOsrdPmDj8jWNQTFK9BqX5xLsxP57a9mudYTD8AoFE47qyXL+Bzk3
	GCPDHwZ3k8IzCbgY3CgkqJ8Pt6ZtOG7QtB1hBEa5gtPAxQGLHihmhpwcA8dl5VFIgTSjNN
	Vv2TpP2CAuGk2ekNNpCRicw5ROXhh48=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795091256;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X1VvEG6+uRk98MiJJgVck2wIv5kxCMv9LX1FbTkKKvY=;
	b=BuAoOAYmn2unXkyKavOQ1l2qaXLfBrbxU4pBO96h+OVokMu1tbyuEJ8FkTBwy3hOjVRuK8
	ZBI4Gx2oFlff0PDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A4AB1342D;
	Thu, 19 Nov 2026 12:27:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fVsJFDjr/moOCwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 19 Nov 2026 12:27:36 +0000
Date: Thu, 19 Nov 2026 13:27:36 +0100
Message-ID: <87wlq9uhtz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dirk Su <dirk.su@canonical.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Kailang Yang <kailang@realtek.com>,
	Eric Naim <dnaim@cachyos.org>,
	Matej Sochan <matej.sochan@gmail.com>,
	Denis Yakovlev <mfthesun@vivaldi.net>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add LED fixup for HP ZBook Ultra G1a Laptops
In-Reply-To: <20261119060604.31205-1-dirk.su@canonical.com>
References: <20261119060604.31205-1-dirk.su@canonical.com>
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
X-Rspamd-Queue-Id: E7DD01F794
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kylinos.cn,gmail.com,realtek.com,cachyos.org,vivaldi.net,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,canonical.com:email]
X-Spam-Score: -11.01

On Thu, 19 Nov 2026 07:05:49 +0100,
Dirk Su wrote:
> 
> The HP ZBook Ultra G1a laptops requires specific LED control method
> ALC285_FIXUP_HP_GPIO_LED to work
> 
> Signed-off-by: Dirk Su <dirk.su@canonical.com>

Applied now.  Thanks.


Takashi
