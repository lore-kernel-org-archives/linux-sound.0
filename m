Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424472;
	b=eztE6KOucSv3iV/D81byFQSPN1VWDJTQMSiUG3cofB4fTbzL2eG27p0pgkCI1AsRMmAN
	 ckmSy4OLUtxXkG270EHtJa84ZOx0429c3CnWwVUC6nPbxJwm9jWig1O0Qj9EpEAXt5AmL
	 1otEbsu5Le2qH2qIFYCqnPE6VrpEk37J+TVT03nZeXpX5QCM6YiwI2t3PjS4llKR5Twnx
	 MdHt/vZSYaYGQWyuOsgZUJ0hlEaCNSfqu3fx31fNUtd3jxWUiRhlW86Ry7iCL+tqQElXO
	 IPngbXUPCSfKnHsJtKGdMzPRpuv0IGz+m7/Ew0xu5A3hZElJrEGkOB/z2hiLbjEUxKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424472;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=GPKuiebTOMTZA3+Q3iiM8iAQHdnCND3GFTW4KP41mRg=;
	b=S3i3hXYgYVqAt6tJwzeW2gaiDodMaR2cYDEAKAfFmPKsCgYxc4ept6np/a9DIweRupMF
	 Q0bwCXMvvfQAhRfx30fW7TDduxTcfu9Zizpkls9A+uAE6az1olCmT8XkAQtwzbI8Bza81
	 ZZQk6JnfxNoml4BH9QoSlfoIBOSnNEfLc0uxQFCgjLHB4gTQx+nb18akRvWmxs0QdYQvI
	 VqcUX/iWYqSi8TpalXPWcE7ecv19nnpvP4o8q/VoT62uLgynYKw2oi1RYzHuFKtaS63hq
	 GRQkoE2nDMT5vZeQ+b7Li4+emclolFVUVt1sYndY/0K8hJAjYHjE0gHTmzppp32NGRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aKqZZlf9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oQ3Jz723;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aKqZZlf9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oQ3Jz723;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC2A606A6BE;
	Mon, 23 Nov 2026 09:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC2A606A6BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aKqZZlf9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oQ3Jz723;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aKqZZlf9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oQ3Jz723
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 161C521F6D;
	Mon, 23 Nov 2026 09:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795424470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GPKuiebTOMTZA3+Q3iiM8iAQHdnCND3GFTW4KP41mRg=;
	b=aKqZZlf9cpT/HUTyEhdVqfnknQIQlyrhghHo4n2xkNbvzmYYfRPHr0m7QDFY3EhillmMuy
	NsKnjP5KJgzlgd+w0/BmxK4Tksp8L20OGWfv9Aav5WVWoCOs8YHBgcRKPMmva10yO0goZ4
	YPp+nTZyD1gqjSOIORzq1Jwf0wFoNyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795424470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GPKuiebTOMTZA3+Q3iiM8iAQHdnCND3GFTW4KP41mRg=;
	b=oQ3Jz723Q8yYZvjITKVw+kky7mz/C6vJuzcMTYs1Toaz8NpGsVVbhgdfdwDZVBiWcBeiUX
	SZyZ2Qix2A4L2bAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aKqZZlf9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oQ3Jz723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795424470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GPKuiebTOMTZA3+Q3iiM8iAQHdnCND3GFTW4KP41mRg=;
	b=aKqZZlf9cpT/HUTyEhdVqfnknQIQlyrhghHo4n2xkNbvzmYYfRPHr0m7QDFY3EhillmMuy
	NsKnjP5KJgzlgd+w0/BmxK4Tksp8L20OGWfv9Aav5WVWoCOs8YHBgcRKPMmva10yO0goZ4
	YPp+nTZyD1gqjSOIORzq1Jwf0wFoNyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795424470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GPKuiebTOMTZA3+Q3iiM8iAQHdnCND3GFTW4KP41mRg=;
	b=oQ3Jz723Q8yYZvjITKVw+kky7mz/C6vJuzcMTYs1Toaz8NpGsVVbhgdfdwDZVBiWcBeiUX
	SZyZ2Qix2A4L2bAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C29221352B;
	Mon, 23 Nov 2026 09:01:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iaPBJNUABGscBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Nov 2026 09:01:09 +0000
Date: Mon, 23 Nov 2026 10:01:09 +0100
Message-ID: <87y0ajdiqy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: William Alberto Jimenez =?ISO-8859-1?Q?Mu=F1oz?=
 <alberto1192456@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for ASUS VivoBook X509UA
In-Reply-To: <20261123035053.12487-1-alberto1192456@gmail.com>
References: <20261123035053.12487-1-alberto1192456@gmail.com>
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
X-Rspamd-Queue-Id: 161C521F6D
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -12.51

On Mon, 23 Nov 2026 04:50:53 +0100,
William Alberto Jimenez Muñoz wrote:
> 
> The internal microphone on ASUS VivoBook X509UA (subsystem ID
> 0x1043:0x1961) records only silence without a quirk entry. Add
> ALC256_FIXUP_ASUS_MIC_NO_PRESENCE to fix the issue.
> 
> Verified on the hardware by booting with snd_hda_intel.model=1043:1271,
> which selects the same fixup: the internal microphone then records
> normally.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=222320
> Signed-off-by: William Alberto Jimenez Muñoz <alberto1192456@gmail.com>

Applied now.  Thanks.


Takashi
