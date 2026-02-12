Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757EE28F5
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 07:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770881813; cv=none; b=F2kRVkY5RkX7xSrLnRkvH45DmhH2xNHJV1u++sCBZ5ltVTK7dYHnySYEzWSKmsmaSPFu5XNjMmEQJxlqh4cyH/z1OJ7d6Hiyyfsv+DC8QLKjIy36eGwN8bVeTl1SwQpyq+sNxzkF425Vuzh90uCfHPpyGEXEBoRWD83LhAwAaJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770881813; c=relaxed/simple;
	bh=B7g+WgqyPiliNjIcZ17kUXoulONTHQDh2v4Dsy562eg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UtSAdwYEekVrGKcnG43KApLbtn8FWYBZvKn1Gru4RFCI+Z7cv7vSVYzTsxGO8Xj3KfI2VqEyZbcQtaL33BjSNq3iguDwzCbfQWIi+ul3N64MVpzXAp9t19i6I+qdThKYYX3qQ/yonYMvl+OQrF+kHTdHSz6NTsIHvohO2r0Mbls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NspZKnjj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XUtKukFh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NspZKnjj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XUtKukFh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NspZKnjj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XUtKukFh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NspZKnjj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XUtKukFh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A9A633E6F2;
	Thu, 12 Feb 2026 07:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770881810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/SNuoaAS9RgmNWTKkhBODBH8ze0MXOsDjKJvHxN6EQI=;
	b=NspZKnjjEqiX6TCIfINMzPbboWG205Oes8M9J1A6ecQp0IKnTyZ1rvOFTVtmVIfnc3SuCd
	Z9/BGinnKhfRPDYPL1Aat/+2cU/dQPuRcRZemhqFXuV17tSXe/I2uX19hUmuY/aOUnF4zK
	xVMuRJsGogrtd+Eq59Ll9blMkt40kGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770881810;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/SNuoaAS9RgmNWTKkhBODBH8ze0MXOsDjKJvHxN6EQI=;
	b=XUtKukFhJeIe4ehf/vVJ1Kv7SNs2qcnEn/LiNaJTEwH4K0ucHUVVRIaug9YHPMMNV8eE7J
	Kf16Rx0m/ustLjDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770881810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/SNuoaAS9RgmNWTKkhBODBH8ze0MXOsDjKJvHxN6EQI=;
	b=NspZKnjjEqiX6TCIfINMzPbboWG205Oes8M9J1A6ecQp0IKnTyZ1rvOFTVtmVIfnc3SuCd
	Z9/BGinnKhfRPDYPL1Aat/+2cU/dQPuRcRZemhqFXuV17tSXe/I2uX19hUmuY/aOUnF4zK
	xVMuRJsGogrtd+Eq59Ll9blMkt40kGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770881810;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/SNuoaAS9RgmNWTKkhBODBH8ze0MXOsDjKJvHxN6EQI=;
	b=XUtKukFhJeIe4ehf/vVJ1Kv7SNs2qcnEn/LiNaJTEwH4K0ucHUVVRIaug9YHPMMNV8eE7J
	Kf16Rx0m/ustLjDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5BB763EA62;
	Thu, 12 Feb 2026 07:36:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id m2/rFBKDjWlOUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Feb 2026 07:36:50 +0000
Date: Thu, 12 Feb 2026 08:36:49 +0100
Message-ID: <87ldgywgz2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	"pav@iki.fi" <pav@iki.fi>,
	"jussi@sonarnerd.net"
	<jussi@sonarnerd.net>,
	"roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for GHW-123P
In-Reply-To: <TYUPR06MB62176831E47899AB98902012D260A@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB62176831E47899AB98902012D260A@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,uniontech.com,iki.fi,sonarnerd.net,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 12 Feb 2026 05:20:36 +0100,
ºúÁ¬ÇÚ wrote:
> 
> Setting up the interface when suspended/resumeing fail on this card.
> Adding a reset and delay quirk will eliminate this problem.
> 
> usb 1-1: New USB device found, idVendor=0020, idProduct=0b21
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: GHW-123P
> usb 1-1: Manufacturer: Generic
> usb 1-1: SerialNumber: 20210726905926
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied now.  Thanks.


Takashi
