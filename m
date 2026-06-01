Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F06832B120
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 09:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780306177; cv=none; b=sALzHWyai21ODcygr3VqanRgkRDHS0fRsaDpH44VHQbhW+MwRJrluZ+qbBH/U3+ogZvHsKYFDE4Bv44AmYbt2MnPgbH81vL+S2mlzYl/hkWQPrVe7V485XH5rPo12RYalt+v/zavH1JoWXYbfwQ4wLk0apoZAKe0IijK2lS7Bo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780306177; c=relaxed/simple;
	bh=WhYvNNRL0g04ZHJmfg7icUCXOG8aLxlebLRp6fF1ZEo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=odVn9lO958E8db/VoWbDmgDMFUpWI//VJAs8xpH1usL8KIQoWIQH7coqPTXSO5+gxqp0MISK5VNVLlk1JJtY2dMIAm+/E0QNwNCZwF9H4fqzrsaB3JMsvANAFcaMoMTjCgpbBskRnppILSlqmZRChriHy3NGSKA75h9FnBZjgu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yg2skk8Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cQsuCPf4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yg2skk8Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cQsuCPf4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yg2skk8Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cQsuCPf4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yg2skk8Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cQsuCPf4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8ADE66AD53;
	Mon,  1 Jun 2026 09:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780306173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dbI73ihfjn57oVNBM7XCBvCUN/UwkgAd1s+JSHVtjL4=;
	b=Yg2skk8QL98Q/9zY3BNnqLr+jJLvbESD5ekN72HGoQXPhZPT+G7GzevJQ4bMMiTbKmJkmJ
	tiT1ZkcyUlG9Oc+SxKzDUlpRjNgbKmd6lJzCE9fU0pkJ6DTT3qt0Dr8Fn82H5SD2NZ9Uvm
	gSmo5PJ/ybhuFLEQJGoceiRjY7ByzmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780306173;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dbI73ihfjn57oVNBM7XCBvCUN/UwkgAd1s+JSHVtjL4=;
	b=cQsuCPf4qE04VQ/9lUDev0wtPWQKbUaaBR1E7TCGbdOlWA5CTo/I6o/e19Z51XsIZrVwco
	aVD8p7FjhoHVlmBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Yg2skk8Q;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cQsuCPf4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780306173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dbI73ihfjn57oVNBM7XCBvCUN/UwkgAd1s+JSHVtjL4=;
	b=Yg2skk8QL98Q/9zY3BNnqLr+jJLvbESD5ekN72HGoQXPhZPT+G7GzevJQ4bMMiTbKmJkmJ
	tiT1ZkcyUlG9Oc+SxKzDUlpRjNgbKmd6lJzCE9fU0pkJ6DTT3qt0Dr8Fn82H5SD2NZ9Uvm
	gSmo5PJ/ybhuFLEQJGoceiRjY7ByzmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780306173;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dbI73ihfjn57oVNBM7XCBvCUN/UwkgAd1s+JSHVtjL4=;
	b=cQsuCPf4qE04VQ/9lUDev0wtPWQKbUaaBR1E7TCGbdOlWA5CTo/I6o/e19Z51XsIZrVwco
	aVD8p7FjhoHVlmBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D7C5779A7;
	Mon,  1 Jun 2026 09:29:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MnjJEf1QHWoMUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 01 Jun 2026 09:29:33 +0000
Date: Mon, 01 Jun 2026 11:29:32 +0200
Message-ID: <87v7c21udf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	notify@kernel.org
Subject: Re: [PATCH v2] ALSA: core: Use flexible array for card private data
In-Reply-To: <20260531-alsa-card-private-flex-array-v2-1-e4ff67f5bd23@gmail.com>
References: <20260531-alsa-card-private-flex-array-v2-1-e4ff67f5bd23@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8ADE66AD53
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 01 Jun 2026 03:23:35 +0200,
Cássio Gabriel wrote:
> 
> snd_card_new() and snd_devm_card_new() allocate struct snd_card
> together with optional driver-private storage. The storage is currently
> described only by open-coded sizeof(*card) + extra_size arithmetic, and
> snd_card_init() reaches it by manually adding sizeof(struct snd_card) to
> the card pointer.
> 
> Make the trailing storage explicit with a flexible array member. Use
> kzalloc_flex() for the regular allocation path and struct_size() for the
> devres allocation size. This documents the layout and avoids open-coded
> variable-size object arithmetic.
> 
> Align the flexible array to unsigned long long so the driver-private area
> does not become less aligned than the old sizeof(struct snd_card) tail
> address on 32-bit ABIs.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
