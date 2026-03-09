Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20D03A4F2C
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 12:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057692; cv=none; b=dR0JUuMwVW503cmsG1iQSddxa1469peNEIYMHj0H/LHr0yFM0xrMMWZwDJL0lEP4Ek99c8Onps1zk9JazagUd7sk38CLnosQA6aw5CKSkSBLh2JbQtk6X03f3XLe6EFSHIBpCAxzeX5SjJCSKwhLTlz2h0lOTiXVxrwYWhtVx5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057692; c=relaxed/simple;
	bh=mmLyXfP07gR3UN9EzdKPKDyjGA/rDfwpTNRolWecbRM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uUHUZKqLzU3zDiNq66u+MsqKZ6HgNPYPjz9OdjME70jOZeleW9X8DGo/f9JC/MsKA2RxedUKXDY2omlF4L8cPjU7lBazFdMXcDjjCs2bsdR4hv1RQOJxTm3dNMauPBMUOnF31UkSh1UmAkDPyavx+n584Hm5F10QPSrhGY5aJBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YTWPbU1N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TRTyifD5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lnINt/Vj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vfyszGUH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YTWPbU1N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TRTyifD5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lnINt/Vj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vfyszGUH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 56E804D1FA;
	Mon,  9 Mar 2026 12:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773057689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ViRCqXIVL9/SG/xFEH4HDBlB/Jc0cSJsQMZkI8Au4sY=;
	b=YTWPbU1NW4KefcINaRanCZ4+Bh11LKgcIJuu5hFUTcES82w24GXbAkA2Lbotg45XXODzqQ
	Yij1Nx+v25sfonywjZDq0M92LyGCJF7vMXQmURikof4CV4L5987aaDIE2H3QSvFeEyPEkO
	wz3zE0Vn8n5ZVXNlUsyy2EOWt7Jeg4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773057689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ViRCqXIVL9/SG/xFEH4HDBlB/Jc0cSJsQMZkI8Au4sY=;
	b=TRTyifD5E9DPlWDjC8kQ6ZfiErEwMWjufMZdPUHZ7epGUkrcX7zvqrgzy9ZqS4DTFkZDDR
	s8oPNO9tzfOF/MCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="lnINt/Vj";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vfyszGUH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773057688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ViRCqXIVL9/SG/xFEH4HDBlB/Jc0cSJsQMZkI8Au4sY=;
	b=lnINt/VjR2cmcyqK1/TMQFDpCYU5rEmv4OL1BL3DKPqCOiyCalVCkJoVAoyqwkifqUOql9
	IYvxnm1F8pUmiGUG0PNLkF3OZXxI1/aD+BsyqeiAkc785cTcEnB1C0BvcJkLVy5K3AP/uk
	YG0thQQpK303OfufeHwAk74+7Y6K9P8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773057688;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ViRCqXIVL9/SG/xFEH4HDBlB/Jc0cSJsQMZkI8Au4sY=;
	b=vfyszGUH92+1fXFnq+rx3Dp0fPhIwtCdN4lCNPNYh02LzQ6ezs4vQuckt9Wx9uv61wMnzc
	L5FEv68FWdkAMfDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3237E3EEB0;
	Mon,  9 Mar 2026 12:01:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LkUHC5i2rmm8HwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Mar 2026 12:01:28 +0000
Date: Mon, 09 Mar 2026 13:01:27 +0100
Message-ID: <87wlzlmctk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Frederic Popp <frederic.l.popp@t-online.de>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: usb-audio: add Studio 1824 support
In-Reply-To: <20260308153334.50433-2-frederic.l.popp@t-online.de>
References: <20260308153334.50433-2-frederic.l.popp@t-online.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[t-online.de];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[t-online.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 56E804D1FA

On Sun, 08 Mar 2026 16:22:16 +0100,
Frederic Popp wrote:
> 
> Adapt the already implemented support for the Studio 1824c
> audio interface to the predecessor Studio 1824.
> 
> Basically just a change adding the
> different hardware ID in the relevant places.
> 
> Tested as much as possible.
> All implemented functionality seemingly works.
> 
> Signed-off-by: Frederic Popp <frederic.l.popp@t-online.de>

Applied to for-next branch now.  Thanks.


Takashi
