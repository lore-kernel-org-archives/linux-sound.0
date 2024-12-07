Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B94C256D
	for <linux-sound@vger.kernel.org>; Sat,  7 Dec 2024 13:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733576650; cv=none; b=pUXkbxzU9EoBt4DxLcS+Tq83pN333kb8lgYP6bfiKQ9Nx19UXbEyuesSXhqRnU4adlCJVhNf8Wh/Y1zw0h9NUeycEwHTgzj/i2elL6DrK3MnpPpm1zJy/QDFBTU/xXJIeQqx0d06gZAbHPnz8xsHn6AzuQNEJzL0gSrg6s/ilBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733576650; c=relaxed/simple;
	bh=WFXPVtY9w4kltCBC3H2hR+M92fVApU8OJpxfx66qj0w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QJDdLLb+/BvN1SvIpyXfB8GJ9w9Bx+/jNiTGn9HlnmSmd59ZBUQawpZeFZU18Z1ejrZLb4twPo6JxWVM6NcUAsFjJlX+I21YZGfTceuoqWU0TqAQvivkVQFqDibJteAwxwrhrlIIr5S+hEi27HBdqEGXZVjGMcwohhJmaU/Eh0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0cYwIZFo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MIw5fLvv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0cYwIZFo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MIw5fLvv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0cYwIZFo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MIw5fLvv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0cYwIZFo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MIw5fLvv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1617C1F394;
	Sat,  7 Dec 2024 13:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733576640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lDSFYATpn0W78pJ/kXb6Hw3/cDeVaqenCq1M4kEUJjg=;
	b=0cYwIZFoTGm+k0y+vvu33LI0vUVeTo/3VJ6X7SymPo/wpOdl6bHM2gWagUazcgdBbE/sxL
	aTGDRdrYzW50qUwi4WtVwu8cBtNNVWZ806AJdT6OEOJmAz2zhIxE9Kca2fZy3o7nvgZXAD
	iIBoc8E2jQ/AIV1uNAvzdU/E4M98OVY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733576640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lDSFYATpn0W78pJ/kXb6Hw3/cDeVaqenCq1M4kEUJjg=;
	b=MIw5fLvv7DCoB7Rok7gVzif2jg0VQec0TRD2w4ySgyYTUmsI/TdxO83UAdYnB4E4oW85Ez
	gKPq49xZhfQtrcDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0cYwIZFo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MIw5fLvv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733576640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lDSFYATpn0W78pJ/kXb6Hw3/cDeVaqenCq1M4kEUJjg=;
	b=0cYwIZFoTGm+k0y+vvu33LI0vUVeTo/3VJ6X7SymPo/wpOdl6bHM2gWagUazcgdBbE/sxL
	aTGDRdrYzW50qUwi4WtVwu8cBtNNVWZ806AJdT6OEOJmAz2zhIxE9Kca2fZy3o7nvgZXAD
	iIBoc8E2jQ/AIV1uNAvzdU/E4M98OVY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733576640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lDSFYATpn0W78pJ/kXb6Hw3/cDeVaqenCq1M4kEUJjg=;
	b=MIw5fLvv7DCoB7Rok7gVzif2jg0VQec0TRD2w4ySgyYTUmsI/TdxO83UAdYnB4E4oW85Ez
	gKPq49xZhfQtrcDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D900A138A7;
	Sat,  7 Dec 2024 13:03:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9t5ZM79HVGdNOQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Dec 2024 13:03:59 +0000
Date: Sat, 07 Dec 2024 14:03:59 +0100
Message-ID: <8734izr6f4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaakko Salo <jaakkos@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH] ALSA: usb-audio: Add implicit feedback quirk for Yamaha THR5
In-Reply-To: <20241206164448.8136-1-jaakkos@gmail.com>
References: <20241206164448.8136-1-jaakkos@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 1617C1F394
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Fri, 06 Dec 2024 17:44:48 +0100,
Jaakko Salo wrote:
> 
> Use implicit feedback from the capture endpoint to fix popping
> sounds during playback.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=219567
> Signed-off-by: Jaakko Salo <jaakkos@gmail.com>

Thanks, applied now.


Takashi
