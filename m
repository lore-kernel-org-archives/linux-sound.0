Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CA63314A1;
	Tue, 11 Aug 2026 06:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428818; cv=none; b=RjKrJa62aqn42+BX1FV1scHEOqMaO0smqJnoC1pot+cZ2lvfuGUNjVNDvOtHYOuQJOJwOK0X8Pc4ByOjYnb2R/R5RxyqThI0SttCzCbaxWvol5HV1s6RevpNQ8Cmo3rEHisbTtpXdVuddicAYSCkxtTXo9/04pm6kz0QxKE25nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428818; c=relaxed/simple;
	bh=v+dvg6ILmExsNizIXj4Wh8+k2nCjmvjHw1ihngqdc54=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uqI2YxrmlAas62bDoIaLmbd25TSTpvbTQxvU6jKN+WH75swRnVNM4koSgCCF0P79CTidPzD8S4ujBVehqJfZtzGbF7uKjCQLz/BtO3ClkXJpJf3PiMvBb1WvUIKg3IXMQAYRhn+rjfPTNs0N2Pb+/KXXuItcmcfFoCQjYrzHg4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i4s2/0/v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=14hCAet1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wc6Ai+Qj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LHxV2Pzz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i4s2/0/v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="14hCAet1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wc6Ai+Qj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LHxV2Pzz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9C307818AF;
	Tue, 11 Aug 2026 06:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786428810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J9J6/wUxwiwldlUtUZKOyVAfALfCK1S6IPtxaNxbIFE=;
	b=i4s2/0/vH0/uwCmrHosa11pBjRQxkHQC7JOtOIpkAkrV16FrM+zF5611xRT/r1tMakSKxO
	FHtOuP8xJHfZSW6kdkHX3jcJutcjyBjyzZ5bHIbnv050ZAB9yrh5EbS4TPwEpO6YJXQDwG
	QPNH5fHU90FJDPkY+d+XBL7akyMKcq4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786428810;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J9J6/wUxwiwldlUtUZKOyVAfALfCK1S6IPtxaNxbIFE=;
	b=14hCAet1SNq3AsD9aPlLBM6NlvlFZTfxfIywczchgqrEdDUxVzCw4CXusoK/TRzJ3PG8d4
	u7EVHDEDWnxsxsCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Wc6Ai+Qj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LHxV2Pzz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786428806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J9J6/wUxwiwldlUtUZKOyVAfALfCK1S6IPtxaNxbIFE=;
	b=Wc6Ai+Qj/df3R29/ss27sDVlqpO2lb7OVaNvwowTncF8zpy3W+tRq6Xc2yx2R+aWKLwQS/
	LFoM9d3n0EpUlKni7jsgcsNtoLSZMpowA6iKlDAEGARq5K+mFOpt2k7tYejNbjgxVA9u2p
	wF4Peh827l0aYI1UvQjjyTKn8vSGEkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786428806;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J9J6/wUxwiwldlUtUZKOyVAfALfCK1S6IPtxaNxbIFE=;
	b=LHxV2Pzz2jjFR542iSdhkzek7yIjmsgJej0/2MOSd6ok116il5khmeaOCSp6IaR8VU1/+Y
	qYxO5wkwfk5aZyAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D8E3779B2;
	Tue, 11 Aug 2026 06:13:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IPOOGYa9emqsPgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 11 Aug 2026 06:13:26 +0000
Date: Tue, 11 Aug 2026 08:13:26 +0200
Message-ID: <87cxvpb2wp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,	perex@perex.cz,	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,	Efe =?ISO-8859-3?Q?Y=B9lmaz?=
 <efe.tcyilmaz@gmail.com>
Subject: Re: [PATCH 3/4] ALSA: hda/realtek: Add quirk for Lenovo Legion Pro 5 16ADR10
In-Reply-To: <20260811024902.134457-3-zhangheng@kylinos.cn>
References: <20260811024902.134457-1-zhangheng@kylinos.cn>
	<20260811024902.134457-3-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-3
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9C307818AF
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Tue, 11 Aug 2026 04:49:01 +0200,
Zhang Heng wrote:
> 
> The Lenovo Legion Pro 5 16ADR10 (codec SSID 0x17aa:0x3926) suffers from
> distorted/crackling speaker output, as only one speaker pin is driven
> without proper COEF/amp initialization.
> 
> Add HDA_CODEC_QUIRK applying ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN
> to enable both speaker pins and proper amp initialization, restoring
> clean audio output at all volume levels.
> 
> Tested: Both internal speaker pairs are now driven correctly and
> distortion is gone; headphone output remains unaffected.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221595
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> Tested-by: Efe Y¹lmaz <efe.tcyilmaz@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
