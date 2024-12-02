Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E611F943E
	for <linux-sound@vger.kernel.org>; Mon,  2 Dec 2024 09:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733131387; cv=none; b=LS3BgJG5+kuqDgbNbSG1Cqzfw1Q0mMklPGOxPv5qFHMEbDhxz+0iRjlTnWG7O5VxR8SFCzF0Aof8BeEmxFjZ0GqLgWKBLVTLUDavvmNlrmF6pwiBF53h73y55DnqwPDvT4czIgMJFk+Y7u8uTVd+Pp4nx8E+cFAJjFVI+84uPA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733131387; c=relaxed/simple;
	bh=nxKFPOm9vf1EPmKxWxocgPbOiireAQbnt6ArYZf7B/I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qIA4XgofeBTKCDZPwPlgUnzu43y/0ci1a/f7LmZaA0y756seQfYSe0pVOmXYgqNwoOgz0226mLjTHU7R9SV5AcNlQ0omhee/OCNpLYetcYpkEoKK8PFV/abebQWjOrKJ3e7b/48kQ/bLODTTR3vKJOd+pGFMEO49L+AzMZCIdpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bLOTOkiR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MO0Xg8aN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bLOTOkiR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MO0Xg8aN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bLOTOkiR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MO0Xg8aN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bLOTOkiR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MO0Xg8aN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A5C85211D2;
	Mon,  2 Dec 2024 09:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733131383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xnp4p1heortn4sHHcaalsFAi3loJ5yCMZQgayFN9tHI=;
	b=bLOTOkiRUukAaFPurod1f7acadzh5q6fWK49L5ugnR3Uf3QjIM0SGoOqiD429mcOKYF27Z
	hdYCNNCUYH17vZjjNSSu/gGx/TYK9I8OkQVTZZ7oFYeEx6fY3Ekz3fCJwjDmeP7rPeHXjv
	FqdSiKOMfwH/7DyxNeroTdkagHVJTAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733131383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xnp4p1heortn4sHHcaalsFAi3loJ5yCMZQgayFN9tHI=;
	b=MO0Xg8aNLsmPg3mnYrovT4pnxNZxCWy0yV62Qfovr6t2veYN91Ddi4l04HELc8YxWeGHfl
	TX2ePvWe8BpbKhDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bLOTOkiR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MO0Xg8aN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733131383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xnp4p1heortn4sHHcaalsFAi3loJ5yCMZQgayFN9tHI=;
	b=bLOTOkiRUukAaFPurod1f7acadzh5q6fWK49L5ugnR3Uf3QjIM0SGoOqiD429mcOKYF27Z
	hdYCNNCUYH17vZjjNSSu/gGx/TYK9I8OkQVTZZ7oFYeEx6fY3Ekz3fCJwjDmeP7rPeHXjv
	FqdSiKOMfwH/7DyxNeroTdkagHVJTAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733131383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xnp4p1heortn4sHHcaalsFAi3loJ5yCMZQgayFN9tHI=;
	b=MO0Xg8aNLsmPg3mnYrovT4pnxNZxCWy0yV62Qfovr6t2veYN91Ddi4l04HELc8YxWeGHfl
	TX2ePvWe8BpbKhDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 813C2139C2;
	Mon,  2 Dec 2024 09:23:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aew4Hnd8TWeEOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Dec 2024 09:23:03 +0000
Date: Mon, 02 Dec 2024 10:23:03 +0100
Message-ID: <871pyqzbew.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sahas Leelodharry <sahas.leelodharry@mail.mcgill.ca>
Cc: "tiwai@suse.com" <tiwai@suse.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda/realtek: Add support for Samsung Galaxy Book3 360 (NP730QFG)
In-Reply-To: <QB1PR01MB40047D4CC1282DB7F1333124CC352@QB1PR01MB4004.CANPRD01.PROD.OUTLOOK.COM>
References: <QB1PR01MB40047D4CC1282DB7F1333124CC352@QB1PR01MB4004.CANPRD01.PROD.OUTLOOK.COM>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: A5C85211D2
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Mon, 02 Dec 2024 04:28:33 +0100,
Sahas Leelodharry wrote:
> 
> Fixes the 3.5mm headphone jack on the Samsung Galaxy Book 3 360 NP730QFG laptop.
> Unlike the other Galaxy Book3 series devices, this device only needs the ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET quirk. 
> Verified changes on the device and compared with codec state in Windows.
> 
> Signed-off-by: Sahas Leelodharry <sahas.leelodharry@mail.mcgill.ca>

Applied with white-space fixes.  Thanks.


Takashi
