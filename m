Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798E11DB14D;
	Wed, 15 Jan 2025 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736934368; cv=none; b=YlrB3gx+/b0Fono/bUKs+akDXt09elRCTTYNseUm1+t/0EoEXLaJdShaIY4jCNLSl8xdJ/udS+JPgN5pRTJJVW2ssASsdoQMcez/Vy2W84Jfuq1Y9RwF6u4TJXbnAF/mGWtDnL7HlgwdjoidyNdnqom6YBRx+8ecctjKbUsVF0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736934368; c=relaxed/simple;
	bh=Nl8ttS2dAE0+uDsZubWsST5mwD5AD8aLoOGQyRLbuyw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JL/oNDSsnBs9HUC1Znxfg0QoDKcg2q8UMNKCLjnKZeTYxnLorqBeC9HqxXkjhGFe7SifjcIGH20OnQc5NuN9BWL4i/q8Kj57lDuTWgdEH6ozE04tT/mMO9Ts5xm9P/K49RrVZME4f5jtJKaYkpyscUP6vP6s2TDFSkUGuhzkkn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vyczfTq9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bRk8k1ED; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vyczfTq9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bRk8k1ED; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vyczfTq9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bRk8k1ED";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vyczfTq9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bRk8k1ED"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 758D421259;
	Wed, 15 Jan 2025 09:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736934364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ci14qA/N78JrOII+AwqkFbbC9ymPm60DGmiIuk6CJ9Q=;
	b=vyczfTq91pCnEnJSp9+FXvClJx8HnxaSZBZ3lHH0ngD4Yi27d36g8Sek4ZMZCwSLtFuAqt
	ReyAbUB7+6H0b+3znayxO/XjDqpHRSbgyCKcnaiO/QMuE3QXDGlsDtu+JVyl1V6L831SDI
	fZxXxvspg7cb1Gy+RXaVczgYgGuUJZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736934364;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ci14qA/N78JrOII+AwqkFbbC9ymPm60DGmiIuk6CJ9Q=;
	b=bRk8k1EDHP9QqRLalr4nhnu1nEBhf9RS0oKvI+y1Se2DxwrejskgD0B4MDK6FbKhwKFn6m
	P0daNMOPSaqxOnBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vyczfTq9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bRk8k1ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736934364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ci14qA/N78JrOII+AwqkFbbC9ymPm60DGmiIuk6CJ9Q=;
	b=vyczfTq91pCnEnJSp9+FXvClJx8HnxaSZBZ3lHH0ngD4Yi27d36g8Sek4ZMZCwSLtFuAqt
	ReyAbUB7+6H0b+3znayxO/XjDqpHRSbgyCKcnaiO/QMuE3QXDGlsDtu+JVyl1V6L831SDI
	fZxXxvspg7cb1Gy+RXaVczgYgGuUJZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736934364;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ci14qA/N78JrOII+AwqkFbbC9ymPm60DGmiIuk6CJ9Q=;
	b=bRk8k1EDHP9QqRLalr4nhnu1nEBhf9RS0oKvI+y1Se2DxwrejskgD0B4MDK6FbKhwKFn6m
	P0daNMOPSaqxOnBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2158E139CB;
	Wed, 15 Jan 2025 09:46:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hiTYBtyDh2cnHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Jan 2025 09:46:04 +0000
Date: Wed, 15 Jan 2025 10:46:03 +0100
Message-ID: <87zfjsjtpg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"lina@asahilina.net" <lina@asahilina.net>,
	"mbarriolinares@gmail.com"
	<mbarriolinares@gmail.com>,
	"wangdicheng@kylinos.cn"
	<wangdicheng@kylinos.cn>,
	"cyan.vtb@gmail.com" <cyan.vtb@gmail.com>,
	"dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
	"bsevens@google.com"
	<bsevens@google.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ALSA: usb-audio: Add delay quirk for USB Audio Device
In-Reply-To: <TYUPR06MB6217E94D922B9BF422A73F32D2192@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217E94D922B9BF422A73F32D2192@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 758D421259
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,asahilina.net,gmail.com,kylinos.cn,linaro.org,google.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 15 Jan 2025 10:32:35 +0100,
ºúÁ¬ÇÚ wrote:
> 
> From: Lianqin Hu <hulianqin@vivo.com>
> 
> Audio control requests that sets sampling frequency sometimes fail on
> this card. Adding delay between control messages eliminates that problem.
> 
> usb 1-1: New USB device found, idVendor=0d8c, idProduct=0014
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> usb 1-1: Product: USB Audio Device
> usb 1-1: Manufacturer: C-Media Electronics Inc.
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Thanks, applied now.


Takashi
