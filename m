Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614303;
	b=YbolGJqHG7HXHIldaej674ic1qeXiWvg9O9H5AT978yqzP2m58VIZTXlhIr+zkQ6OkRt
	 kQhpUMGnb1pvd5YzI2xGwd/7nRAAWQLwo47pcQPg8fayuAwLaPnQX3pRwGyv/OuyEg5qJ
	 +CYQ8vLZAF97ZB4m8xFXcSCNxmsp1UVLW6DDJO6b4XulvP7CvWuh22iZVW8MCilCDeqvI
	 kWVnIXcT4TbM3cLzSMUwX3UajGiBpeThR8cgr43kGCs4T05dytA4+mUOUc/6X5hWLxYze
	 W+qRHv2h4nXEYTyKtBQ6acAeQJuhXXI3FMx7hkSxIvyHSLIFdub6NOS8cI59nOFUhuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614303;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=4BOMgWMFsAhs5fJQSBaCRPBMz4+XYXKa9pwnxGQtZvM=;
	b=JM3Mneac/r+qAHbU9ANM29HovFBcsgGwbRuHcIElUwN48Z2GMdu8we6eraC14jcOoE5k
	 Knt+xZR4a5r6BGyZ89gZahw6UOLX9dToaS1FFfjO/i933PqrKGC3P+NfteED8gP/jDErH
	 11UqrI9QCGIGJVIsfxQB3Dttek6wFzVJKsD3SwPS3DmfZmFd5q7I7Xwy3jFiR/ra10A50
	 tU3v5QofmMs8oLeMPq3FovZionHCLjEwIY/NlcsJx7iWodebX4DtWBYrHJDgF8xkv7k1G
	 2fSdBWCewERlgdYZVlXiUSViuIqm+xMIMYtMf3+BaMwomqH6dHWkocc7qwvrtsGLzKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="nBA/xL+c";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Crj0w8V1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=D6htfCCM;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ERnHtC36;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841B2606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 13:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 841B2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nBA/xL+c;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Crj0w8V1;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=D6htfCCM;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ERnHtC36
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A20351F790;
	Wed, 25 Nov 2026 13:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795614300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4BOMgWMFsAhs5fJQSBaCRPBMz4+XYXKa9pwnxGQtZvM=;
	b=nBA/xL+c6NfYoOpsFAfL9GnVDB7CmMzk2Q4D03HNtwDYWLc5EFZb8LBoMyK7HokySnvSTD
	4TeL2TmFJGk+rRGPWzbRbp0/+CLW5n5O7U6XtKCFo5b2owRdKdAzeDjIeZSHbeL52ELPU8
	RwApNrTVKKXVvNP7+abET7NJ9C302nU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795614300;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4BOMgWMFsAhs5fJQSBaCRPBMz4+XYXKa9pwnxGQtZvM=;
	b=Crj0w8V1ADaKEX286FoCnu+oFqYKGJEPeHL0wITHGGnS+Fkzmp5Nj0kOOBzESdczCDUrgQ
	/+5JJOORMZAmSKDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=D6htfCCM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ERnHtC36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795614299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4BOMgWMFsAhs5fJQSBaCRPBMz4+XYXKa9pwnxGQtZvM=;
	b=D6htfCCMVUJ+XKFF2wXjoTZJ4TTR5uF7k68Ig6HNZUmhTixyPsZ76wcXJsfAd6iv9Y6RZk
	/6OFOSEBb0cF/AniOk5Bs7CHJ/cAxeKKevBomeYN21s0JQcm8saRLKuskYuk9LTQrBpf9K
	er59NEHVR2VEPl43EfA5fVfKhYk7Y1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795614299;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4BOMgWMFsAhs5fJQSBaCRPBMz4+XYXKa9pwnxGQtZvM=;
	b=ERnHtC36L4b7NZ2nStor7jJ662gnnNl7qQr/9Dh2GzSW2cPyiT6G0+UJbjE6vcbGgOkbL0
	dNypqk+PfdDo3FBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 592371339F;
	Wed, 25 Nov 2026 13:44:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id r3mlDFvmBmtMNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 13:44:59 +0000
Date: Wed, 25 Nov 2026 14:44:58 +0100
Message-ID: <87v75l6n51.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yannick =?ISO-8859-1?Q?M=FCller?= <mail@ynnk.dev>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: usb-audio: Limit recursion depth when walking audio units
In-Reply-To: <20261124132551.137134-1-mail@ynnk.dev>
References: <20261124132551.137134-1-mail@ynnk.dev>
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
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A20351F790
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Tue, 24 Nov 2026 14:25:49 +0100,
Yannick Müller wrote:
> 
> Fix a bug that makes it possible to overflow the kernel stack by
> specifying a long chain of unique nested audio units. The current
> implementation lets an external device specify up to 255 audio units,
> which results in a stack overflow, as walking through all of them
> recursively leads to too many nested calls.
> 
> Limit the recursion depth to 16 nested units so that a device can no
> longer exhaust the kernel stack with a long chain.
> 
> Yannick Müller (2):
>   ALSA: usb-audio: Limit the depth of the clock topology walk
>   ALSA: usb-audio: Limit the unit nesting depth in the mixer parser

Applied both patches to for-next branch.  Thanks.


Takashi
