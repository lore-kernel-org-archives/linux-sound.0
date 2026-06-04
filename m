Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340D2332EA0
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 15:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586913; cv=none; b=XxhdMkj/VCIzIpNiOK8+txre9pB1TY9hFG3Nyj0fQAV1e1kfTcsGKOm8Nw7yQMYuL76LvhG8g5lcbA8tFkkSTOMIYBy4QF9HJagAVxVgOXUub4gf+gykkNtSMU6nxmR+yVlGTSm93zBVlz//9sTH+bVDUHYxZ06QvoS1S4c2v0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586913; c=relaxed/simple;
	bh=2tB27pKWyrOqXTzLU81B9xXIhKxaCByWSiM+zpcB1aU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kgaxIarbjRUxq7JMj+frHSRO5s5nWxIE2LcKesLOI3KZCwJYoF8qSqW8W6w9OOcmi5iXLv+lzqIkgE53tJ3N0eAqbc8Z7rC5ORVohBxXSdyg+m1CClhh+kknWOqheWIh676tKRgNTUkPArX4Ew6AFsWD5pLUkh+J8gDzu+fADDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WZsxDNsZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SzmH6x4p; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c0o6VCqD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YMSmkv7E; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WZsxDNsZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SzmH6x4p";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c0o6VCqD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YMSmkv7E"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 94B8F6B1F5;
	Thu,  4 Jun 2026 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780586910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHcjFpWdmCxmjEV6gXrsY9L9ZDCd3/bqhQYxDUGhEqk=;
	b=WZsxDNsZuR9xGVYr7sT7TsmFwZuDibR+6CGoP0QfyS1tfhVm0mo6W6vYH684yoc9bueEfV
	tNDM+Pl0UAFa0i6ICGV280yN0UK0PEU3K/PEvXOWQvOcmV3c+q40HNDVPveePgeAEStTfQ
	i0zf1egMxI7cd36Cx9XZ6ndz49mdjQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780586910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHcjFpWdmCxmjEV6gXrsY9L9ZDCd3/bqhQYxDUGhEqk=;
	b=SzmH6x4ppuKqGSGovvJZpE2oQcAzUSWZZqnnk/TiqkGz/u5ioJGTAGT4Kcn7hZyJrFUYaY
	ymqA13lRdmn/JRBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=c0o6VCqD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YMSmkv7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780586909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHcjFpWdmCxmjEV6gXrsY9L9ZDCd3/bqhQYxDUGhEqk=;
	b=c0o6VCqDnAM19NjSckTq5JhXg5byNJ8t0jRByMeXSJIFTuamjnOhFm4eQFltGYmNOTxIwR
	TXpdlfUaSawcHrthzK/0ETRLB4n/LbGzRnbSdtNxMlgu7IEC6UyzuYIAMk4ihZgXUKhgBf
	J6GF8APBMiKwD0P1rTEj3uvw8fj+OEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780586909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHcjFpWdmCxmjEV6gXrsY9L9ZDCd3/bqhQYxDUGhEqk=;
	b=YMSmkv7EwcS6H1jHiyTayItBYbq7meVjgCoBUmt1UMvN9CS0A7WRBd8gQwXDjfvo6q3fZc
	DU3533up6rKeBuDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E281779A8;
	Thu,  4 Jun 2026 15:28:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HMuMDZ2ZIWoHKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 04 Jun 2026 15:28:29 +0000
Date: Thu, 04 Jun 2026 17:28:28 +0200
Message-ID: <87se72uxyb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	"pav@iki.fi" <pav@iki.fi>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for AB13X USB Audio
In-Reply-To: <TYUPR06MB62174610061C213260E1A992D2102@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB62174610061C213260E1A992D2102@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 94B8F6B1F5
X-Spam-Score: -3.51

On Thu, 04 Jun 2026 14:40:28 +0200,
ºúÁ¬ÇÚ wrote:
> 
> Setting up the interface when suspended/resumeing fail on this card.
> Adding a reset and delay quirk will eliminate this problem.
> 
> usb 1-1: new full-speed USB device number 2 using xhci-hcd
> usb 1-1: New USB device found, idVendor=3c20, idProduct=3d21
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: AB13X USB Audio
> usb 1-1: Manufacturer: Generic
> usb 1-1: SerialNumber: 20210726905926
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied now.  Thanks.


Takashi
