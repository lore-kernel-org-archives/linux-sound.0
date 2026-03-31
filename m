Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F174438F64F
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 06:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774939938; cv=none; b=oo9koLHHmrbHwknwjl8FxA43NpHpZKrHeSMuLqJdRl2hcOFcEp+sMP+MslXdDGKbJT/wzGvH/wlOQJzbywebpB+FzQD2EVHkwOyt6CC2/fNnRhUfDCQaexOCho/ewzoU1OzA5VPbs1RvtkUgfpzbKrhyB50Qr0bt2/ensmgmpac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774939938; c=relaxed/simple;
	bh=HpIsRhD27yNSn3YWc/4Lw25/SfmWOm4zggDyhP/xD/o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ICeJu2dOOamr6qo1bAR7bR1YKG19oVjVaWAxEdyRMjC9Dyh7EgM+8yz50bH/I/rMeowN9e1fPKOt+9WsPrdIqGC/HGbGHsxa3rA0qXsxYe9+3Xr3tYQJ9CD2C4AA1iQDOvYIzC4nBtIr8LvQ/Ej22eqxWDB8032nrpAxR5xDsbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rlZg0li1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O+S8UZ9M; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rlZg0li1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O+S8UZ9M; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rlZg0li1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O+S8UZ9M";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rlZg0li1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O+S8UZ9M"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 414AF4D545;
	Tue, 31 Mar 2026 06:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774939935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vs15mokjaYPnmwRTJLEL8v7HgrKR/v+zqCdWcxDVtgI=;
	b=rlZg0li1oIFKLn6IvJcMMQbeTwImbXF/ArT/qNoKrrqGVXIQRwYVQdFp9JJyz9OqzRA8XR
	JQnlpDAEZywV6TSwJjICksk6X9DWeHh4sI4Lx+dSiVDFy3dmNObbfsqIWe9LxWQrFlksXx
	X7mcjQndKk8KqeACL9438UATDcEsCVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774939935;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vs15mokjaYPnmwRTJLEL8v7HgrKR/v+zqCdWcxDVtgI=;
	b=O+S8UZ9Mp1CGXUVScrTa07fBrX8dGplVF2IpFwq+yJoLALArbBZ9q1sHfw/xyL1fWsXZjK
	JSfJFaluyzlwB2DA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rlZg0li1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=O+S8UZ9M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774939935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vs15mokjaYPnmwRTJLEL8v7HgrKR/v+zqCdWcxDVtgI=;
	b=rlZg0li1oIFKLn6IvJcMMQbeTwImbXF/ArT/qNoKrrqGVXIQRwYVQdFp9JJyz9OqzRA8XR
	JQnlpDAEZywV6TSwJjICksk6X9DWeHh4sI4Lx+dSiVDFy3dmNObbfsqIWe9LxWQrFlksXx
	X7mcjQndKk8KqeACL9438UATDcEsCVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774939935;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vs15mokjaYPnmwRTJLEL8v7HgrKR/v+zqCdWcxDVtgI=;
	b=O+S8UZ9Mp1CGXUVScrTa07fBrX8dGplVF2IpFwq+yJoLALArbBZ9q1sHfw/xyL1fWsXZjK
	JSfJFaluyzlwB2DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12A364A0A2;
	Tue, 31 Mar 2026 06:52:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VOVCAx9vy2lcMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 31 Mar 2026 06:52:15 +0000
Date: Tue, 31 Mar 2026 08:52:14 +0200
Message-ID: <87341gtrs1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Garcicasti <andresgarciacastilla@gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga Slim 7 14AKP10
In-Reply-To: <20260331033650.285601-1-songxiebing@kylinos.cn>
References: <20260331033650.285601-1-songxiebing@kylinos.cn>
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
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,vger.kernel.org,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 414AF4D545

On Tue, 31 Mar 2026 05:36:50 +0200,
songxiebing wrote:
> 
> The Pin Complex 0x17 (bass/woofer speakers) is incorrectly reported as
> unconnected in the BIOS (pin default 0x411111f0 = N/A). This causes the
> kernel to configure speaker_outs=0, meaning only the tweeters (pin 0x14)
> are used. The result is very low, tinny audio with no bass.
> 
> The existing quirk ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN (already present
> in patch_realtek.c for SSID 0x17aa3801) fixes the issue completely.
> 
> Reported-by: Garcicasti <andresgarciacastilla@gmail.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221298
> Signed-off-by: songxiebing <songxiebing@kylinos.cn>

Applied now.  Thanks.


Takashi
