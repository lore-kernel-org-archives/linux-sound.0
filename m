Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A98F30596F
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 05:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779860348; cv=none; b=i4mB1GUYRyVfk6/YVH4av1PDYJdDoimSxkzuc67B2LfFOhhtCk8FXLPVPp427FE7sDt6sJDkoKt+GC7hAfWZ+rFJjWFzlxZFvP6Q8yzpIKHLgb3A6etU0Aw+a48zxuWwSgxpa7XJ/o3rod/FoFwRm68kWTlFuanlDLmhAQcLdsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779860348; c=relaxed/simple;
	bh=FJCUwRXpftyTN/caX3XSDG3i8hQTps8JFw6TOW58jow=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gNCjwyYqJ0rwzNcq02m7AFVwZcGOlBHs10S6lhZLcaXgrYomfGOanBTsn4Bh1Vics6GJtmn7FtSgJXbgxN2Z7nCMWX6L9vqQK0A8BhHrabudMh6utecYFt++ewHROn/ETOPuB9gWCIWUwGaSqoru7LjeDyFRsVaIRzsqWjAMMTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Uj+XZvXT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CJsV2ReZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Uj+XZvXT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CJsV2ReZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Uj+XZvXT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CJsV2ReZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Uj+XZvXT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CJsV2ReZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8A4F36B40A;
	Wed, 27 May 2026 05:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779860344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJwq/vgCKD7KGEA7fiR7PflvwNoU/Xvs0cY+jnYRuYM=;
	b=Uj+XZvXTP8Fb+U14wx5kdrye06R3OCtXWZE5P76PwdHfupO9Exee+AOJBlfvwmGNxsYRw8
	whJNrxYY3RaHlyLVi4RaSbXQ4s0hYQeSnNqL4UCbQYfKU2Rq4kuWdR6Hlrm/o7ztDPVrCm
	KtVn2tWq86KYMF9tDwmdwuvykM2OiLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779860344;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJwq/vgCKD7KGEA7fiR7PflvwNoU/Xvs0cY+jnYRuYM=;
	b=CJsV2ReZtF2HRr26OBzOOYTUJPNGNJ2JhXbq2+T58Ta9n3kJk9vwUqyHIK1lBvNrW0g8uG
	bTYFYy0lG9csjmDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Uj+XZvXT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CJsV2ReZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779860344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJwq/vgCKD7KGEA7fiR7PflvwNoU/Xvs0cY+jnYRuYM=;
	b=Uj+XZvXTP8Fb+U14wx5kdrye06R3OCtXWZE5P76PwdHfupO9Exee+AOJBlfvwmGNxsYRw8
	whJNrxYY3RaHlyLVi4RaSbXQ4s0hYQeSnNqL4UCbQYfKU2Rq4kuWdR6Hlrm/o7ztDPVrCm
	KtVn2tWq86KYMF9tDwmdwuvykM2OiLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779860344;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJwq/vgCKD7KGEA7fiR7PflvwNoU/Xvs0cY+jnYRuYM=;
	b=CJsV2ReZtF2HRr26OBzOOYTUJPNGNJ2JhXbq2+T58Ta9n3kJk9vwUqyHIK1lBvNrW0g8uG
	bTYFYy0lG9csjmDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4AAA05A67B;
	Wed, 27 May 2026 05:39:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G9TNEHiDFmp+RQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 May 2026 05:39:04 +0000
Date: Wed, 27 May 2026 07:39:03 +0200
Message-ID: <87qzmxwgw8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	"pav@iki.fi" <pav@iki.fi>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for TAE1159 USB Audio
In-Reply-To: <TYUPR06MB621736D7C85D43200E54E740D2082@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB621736D7C85D43200E54E740D2082@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 8A4F36B40A
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]

On Wed, 27 May 2026 05:33:08 +0200,
ºúÁ¬ÇÚ wrote:
> 
> Setting up the interface when suspended/resumeing fail on this card.
> Adding a reset and delay quirk will eliminate this problem.
> 
> usb 1-1: new full-speed USB device number 2 using xhci-hcd
> usb 1-1: New USB device found, idVendor=25aa, idProduct=600b
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: TAE1159
> usb 1-1: Manufacturer: Generic
> usb 1-1: SerialNumber: 20210726905926
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied now.  Thanks.


Takashi
