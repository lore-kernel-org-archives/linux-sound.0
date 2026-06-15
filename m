Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C821C69D
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 13:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781531143; cv=none; b=bXf7QUNg29AcyQ/0Px4u30xl73xy+dDk5Lo2CA1tbMdlw9oNeto6WaUyDxH7SK8v8Ylbyvs2wXPWg3OBp16NuBojx6auYpEWLx+j/ntypWRoq+gDxYfVmtw6w33dPSbiqYAsEh5LjQunBds0ABTeOlo15X/CGU4+cAOyuIk7rCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781531143; c=relaxed/simple;
	bh=lmLzYvQo8EwL47D65M8U/U9KkKA/eRJIFnFsqzl0C1s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=csa1musmA/C8Ppx1e7Y/uVkR9L24F/oS0b576QYlOkQxn5omo1vzxEe/3skbKkVz3xoySmYAW6RjxqWOB4M/CoBuq/fchIbW55PnH7FJkkQ4du3eQVcTFRegsSi5oIlyFeKfBlG+xtE21YyQXDqGRs6KL6MPNKciJ2jHiOL/4Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yMjqmb6S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KN2n8SCz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yMjqmb6S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KN2n8SCz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yMjqmb6S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KN2n8SCz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yMjqmb6S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KN2n8SCz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4D16E758EA;
	Mon, 15 Jun 2026 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781531140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IaDbLekigmidYjI4couyKIRvsgcrj4QxU/4ep576v7M=;
	b=yMjqmb6SUPatcLu6KzxPf8eL4b9DZY6ad3t29ILKd/GdbznSO6tDa7sKrSHWgI2F8niOk7
	+mOk4WwKuQfe1St6EDUJnTQ1E3o/xY1saBeZ4qAxeWFOsPay9g4GVxZe8c2QmkfT6pIv4v
	ViB/7bPvflRm4XuZDlk9iHDqPUV/8V8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781531140;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IaDbLekigmidYjI4couyKIRvsgcrj4QxU/4ep576v7M=;
	b=KN2n8SCzDgDlQWMugDbFSMRb4aSAQ3nFzhkvi5J8zNvEq5K/FJ6XTqAwHOg8mOmYZ15Ktj
	Sy6V+9Bav/D2a2Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yMjqmb6S;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KN2n8SCz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781531140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IaDbLekigmidYjI4couyKIRvsgcrj4QxU/4ep576v7M=;
	b=yMjqmb6SUPatcLu6KzxPf8eL4b9DZY6ad3t29ILKd/GdbznSO6tDa7sKrSHWgI2F8niOk7
	+mOk4WwKuQfe1St6EDUJnTQ1E3o/xY1saBeZ4qAxeWFOsPay9g4GVxZe8c2QmkfT6pIv4v
	ViB/7bPvflRm4XuZDlk9iHDqPUV/8V8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781531140;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IaDbLekigmidYjI4couyKIRvsgcrj4QxU/4ep576v7M=;
	b=KN2n8SCzDgDlQWMugDbFSMRb4aSAQ3nFzhkvi5J8zNvEq5K/FJ6XTqAwHOg8mOmYZ15Ktj
	Sy6V+9Bav/D2a2Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 193B5779A7;
	Mon, 15 Jun 2026 13:45:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fg3mBAQCMGqSQgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 15 Jun 2026 13:45:40 +0000
Date: Mon, 15 Jun 2026 15:45:39 +0200
Message-ID: <87pl1rsyrg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for XIBERIA K03S
In-Reply-To: <TYUPR06MB621706287FE30F4D8EE4618BD2E62@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB621706287FE30F4D8EE4618BD2E62@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 4D16E758EA
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Mon, 15 Jun 2026 14:05:01 +0200,
ºúÁ¬ÇÚ wrote:
> 
> Setting up the interface when suspended/resumeing fail on this card.
> Adding a reset and delay quirk will eliminate this problem.
> 
> usb 1-1: New USB device found, idVendor=36f9, idProduct=c009
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> usb 1-1: Product: XIBERIA K03S
> usb 1-1: Manufacturer: Actions
> usb 1-1: usb_probe_device
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied now.  Thanks.


Takashi
