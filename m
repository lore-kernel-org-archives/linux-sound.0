Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006415;
	b=Qd1k7+Rp/hT8hM9ZbUVsfnVFVGXPqpJl4fz+2qgBp3lugq5Ymzn+8uswcz+SKZ1CHL/6
	 sBbxbj4Py92gcIs3ubps5s7zA/4riwlSII1enj4pIQGdJAZP64UA9Zl0Tf8oFMLZa9lC8
	 pUgM9oOuyt/th0irbfXP9nis1N1TPTW1Qp/5rqofWD8mrrFx+z+3dhHs2Zp5fFzBYIMCn
	 YKBewy7pSf/u656dkD3iX47e6XynoZvtZTDDCwhxnssP5OWZJMedLTCJAW8sO6VgeTp0o
	 1yBZ2oIkT+Fw8vL5DcDSayFM0PnH7WWhci2ZYPQxC0IczP9YE3P1/ZrOTi48gbk1AVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006415;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=3xVfRIoljHeBRJEtdztkdVIGB2qCFbHZguFIBJAiZbc=;
	b=N3aGiVkqf/SIXv+0Rv481HA7tJEed53WAuSL3NsXHLhERXrVjZq5knQYygRtyz/ybtL5
	 nhjtFTZHME3u8/hRK706BaXj0O/WQ/EMcn1fKyUDT27bK2lcS51H9qn2trKiGcZ1KLp9u
	 XNxXYRJCaVqKjDIZfjaOPPddvffFJ8++6EnCX7fn/Z9gh3jf5CeJnEMEfxmrdWiZv8GhQ
	 tftBqwLxsq6sRyAAGHNzVsDkcQSou/48ORXhjI48NPo4seua3g3u4X57MoNueebe1Vzq0
	 WnPLb3Vm/XM/3h/mMXDwSwHOuzdNfcZO+aWHsEIFohSz4NCq4zT4NVzehGf9hAUkyyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oZTy542C;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8c9S0CGH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oZTy542C;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8c9S0CGH;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC3A606A320;
	Wed, 18 Nov 2026 12:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC3A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oZTy542C;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8c9S0CGH;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oZTy542C;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8c9S0CGH
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4EBF31FB54;
	Wed, 18 Nov 2026 12:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3xVfRIoljHeBRJEtdztkdVIGB2qCFbHZguFIBJAiZbc=;
	b=oZTy542CgjkRKyOVaw7IXtFTFc3f/P9g/cLvwuJOBx2DVDCbqkm4vHKqXgOxnRu2G9drMF
	U0PvSMDFT35JE2Sykg/5+VysTfjLhrG0ZzZfjG/gNMhZYK4Min68SgoMDGyB/pzcgD/voi
	y/6RMvsNONBc3W9wsTXA8gTxlfZ7FLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006413;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3xVfRIoljHeBRJEtdztkdVIGB2qCFbHZguFIBJAiZbc=;
	b=8c9S0CGHinkSc/CYbC2vehToTpXrf14LIjmxazdoLI4uoUj+73uPEWXzApM9N6l8Y8oe4j
	eHRhG8KqDWLKXJAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oZTy542C;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8c9S0CGH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3xVfRIoljHeBRJEtdztkdVIGB2qCFbHZguFIBJAiZbc=;
	b=oZTy542CgjkRKyOVaw7IXtFTFc3f/P9g/cLvwuJOBx2DVDCbqkm4vHKqXgOxnRu2G9drMF
	U0PvSMDFT35JE2Sykg/5+VysTfjLhrG0ZzZfjG/gNMhZYK4Min68SgoMDGyB/pzcgD/voi
	y/6RMvsNONBc3W9wsTXA8gTxlfZ7FLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006413;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3xVfRIoljHeBRJEtdztkdVIGB2qCFbHZguFIBJAiZbc=;
	b=8c9S0CGHinkSc/CYbC2vehToTpXrf14LIjmxazdoLI4uoUj+73uPEWXzApM9N6l8Y8oe4j
	eHRhG8KqDWLKXJAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F37FF134F6;
	Wed, 18 Nov 2026 12:53:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7VJJMsyf/WpRWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Nov 2026 12:53:32 +0000
Date: Wed, 18 Nov 2026 13:53:32 +0100
Message-ID: <87wlqawbar.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sungwoo Kim <iam@sung-woo.kim>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dave Tian <daveti@purdue.edu>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda: remove unused chain_id entries from fixups
In-Reply-To: <20261117214157.2815179-2-iam@sung-woo.kim>
References: <20261117214157.2815179-2-iam@sung-woo.kim>
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 4EBF31FB54

On Tue, 17 Nov 2026 22:41:57 +0100,
Sungwoo Kim wrote:
> 
> Several HDA fixups specify a chain_id without setting the chained
> flag, so the chained fixups are never executed.
> 
> Remove these unused chain_id entries.
> 
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Sungwoo Kim <iam@sung-woo.kim>

Applied to for-next branch.  Thanks.


Takashi
