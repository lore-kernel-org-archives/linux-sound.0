Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0FB43784C
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620494; cv=none; b=Og5OWLzqZqj6KOKdDodimgUQXo1pQZQyG0hK4YCHjZG2m5d2lmfASwEM21vsB9nsUga/UrSMiVSnfSiz7vb12RkZbHYD/6zIfRR11Ntn/KUsf+M52Mmz7JD/Fw0UhgWUeOo5mDf65b8H/cKuvzSueeFSotEoTcm/zNC9jSYZNyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620494; c=relaxed/simple;
	bh=WQ1HSbXk3hnK9zfDFfQ6TOWMU9nYdcBfHxBIl35AjX0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OPklvFY+1A2gukABGeRxrTT0gw1U/+g2e8PYmttjSlDsl/L45hS9eH8xj/88+G+Vp/ip+OGHx8IkeHm/cSquuD7ZwVEc2w5on5Y0rYvSccGuasulSPt5hi40UN+UZ+/B+0818Vobl8xrsuigXVPt61TD70CNl3JJ6HGDBlh9E2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zxu82QXb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TU5I8JhM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zxu82QXb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TU5I8JhM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zxu82QXb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TU5I8JhM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zxu82QXb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TU5I8JhM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 225D57A483;
	Tue, 21 Jul 2026 07:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784620491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C1ebN0J6hAHE1fD0yc9pVknfeXeYE053eu7vo4cSUxc=;
	b=zxu82QXbGOOj+K0tB32ldoXUNk2wjMsI29dRX9i2jZACWytoKgaI2AQEZsu7NgY/lchnBb
	3YIUIS0SvyUdr8rzK0EhhhEk1ZdDnyzdE8UAnhwvMLUxUEIVbFpqO0Z/8568VjRzOLgOOl
	704h5O1Gz6MzWlxwg6KVD1Jz7gt83ac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784620491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C1ebN0J6hAHE1fD0yc9pVknfeXeYE053eu7vo4cSUxc=;
	b=TU5I8JhMzvBEssUWwwxgiAq1xD26ivPSCoBae2NNbDpByCxXXYBTpzwmVVWrgnP5qh64rt
	yaCe8zBioCy56hDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zxu82QXb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TU5I8JhM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784620491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C1ebN0J6hAHE1fD0yc9pVknfeXeYE053eu7vo4cSUxc=;
	b=zxu82QXbGOOj+K0tB32ldoXUNk2wjMsI29dRX9i2jZACWytoKgaI2AQEZsu7NgY/lchnBb
	3YIUIS0SvyUdr8rzK0EhhhEk1ZdDnyzdE8UAnhwvMLUxUEIVbFpqO0Z/8568VjRzOLgOOl
	704h5O1Gz6MzWlxwg6KVD1Jz7gt83ac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784620491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C1ebN0J6hAHE1fD0yc9pVknfeXeYE053eu7vo4cSUxc=;
	b=TU5I8JhMzvBEssUWwwxgiAq1xD26ivPSCoBae2NNbDpByCxXXYBTpzwmVVWrgnP5qh64rt
	yaCe8zBioCy56hDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA615779AA;
	Tue, 21 Jul 2026 07:54:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4ZEdM8olX2ouOQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 21 Jul 2026 07:54:50 +0000
Date: Tue, 21 Jul 2026 09:54:50 +0200
Message-ID: <87ik68pyk5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: ALSA: hda/realtek - Add quirk for Dell Pro QC1255
In-Reply-To: <e13d08e96ac449b6994d56dfe6ce3f5c@realtek.com>
References: <e13d08e96ac449b6994d56dfe6ce3f5c@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 225D57A483
X-Spam-Score: -3.51

On Tue, 21 Jul 2026 09:46:50 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> Vendor want to add more SSID.
> They forgot to list all the supported SSIDs.

Thanks, applied now (with the correction to Fixes tag).


Takashi
