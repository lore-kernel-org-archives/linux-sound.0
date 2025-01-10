Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F45207A02;
	Fri, 10 Jan 2025 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736496671; cv=none; b=MhnHgR6YOilXxJ8AEWD4tP7xbaGY7iQO3/FcOH1TLwd3RoxgPpNUMlcSD5w09Ar4rtkw4HgOThB9lRbRe4CAd5cbozo4AACD54jBxblI+85pNPPLTXkM+EEKP7gA++ZPL2UGnFg7WbeP5lfGBBbO/F2o1F5+5seJYkBgUwSX7zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736496671; c=relaxed/simple;
	bh=g+QLKuwhBGOXW1BCy/UX44PZ6gkbMfXXDgz7Q55hvg8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oGQFWDkvfNHr1rngyn1DTGhwW/Xum72hDA8CXAvnfbMgjGhE/qXSWeQCWHfjKupSLPtF012vSMRAVZ8b6SzeyS9vVWlkqoFEQP1xR86gQamBnGs4KK1k2xrfQZFOltaUS1zptoyDRh14OnSLaDE6+YRaFaIRtRJomUxlNG59tG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2NqwZuwL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tznhesWH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XDt/qa8S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P3y5AqYK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2NqwZuwL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tznhesWH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XDt/qa8S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P3y5AqYK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EFED521125;
	Fri, 10 Jan 2025 08:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736496665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i7iC3omRci8GeNDrRIMGfUMgKevglzaDdqxxO/KbRuY=;
	b=2NqwZuwLvL8xmSx/8e+KgmtNdC0SdqSvbttYRlrBTdF0qD0YM2S8LTbQgEo+pETLOnc73i
	W7zu8g4Zm+sI8Qih1FlnI39j81RPIKJloCy/0CNwXKl4yH/h7SudjUfvhTaPOs2G0c3xWQ
	O9eFQLnem2ldAcg7r768BKKXmJgofD0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736496665;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i7iC3omRci8GeNDrRIMGfUMgKevglzaDdqxxO/KbRuY=;
	b=tznhesWHA6vmcpdngxu+W6XPXH6ZTkcFahSqhHhb/Uvlgi0yEqdjdHSPv/uGdgVD7OsZ4s
	4jEMcv2kHTR9zFDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="XDt/qa8S";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=P3y5AqYK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736496664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i7iC3omRci8GeNDrRIMGfUMgKevglzaDdqxxO/KbRuY=;
	b=XDt/qa8S9NWYil3YykbGyROrz85B4TNzZpuir6J0eE2dxP0KA1Q6xjh4GVjmknLwLX7rzI
	XJAY8XXyfz5kSnWn/+8GNWqSlZznSRyhveZB5wSN9zAvM/qPJaVpDqPbX1BdASXvxAkVkx
	85Achs1KgG/giRIr36ET0IuhRoJcthk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736496664;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i7iC3omRci8GeNDrRIMGfUMgKevglzaDdqxxO/KbRuY=;
	b=P3y5AqYKzenKDelv91kS1m8phpF7uck20mOgf/TiDGezs1LM3OVS3mKwRB6yzFY+G1sFkI
	uVSCtXoq6AYWvxBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD0EE13A86;
	Fri, 10 Jan 2025 08:11:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hhraLBjWgGc7eQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jan 2025 08:11:04 +0000
Date: Fri, 10 Jan 2025 09:11:04 +0100
Message-ID: <87seprum07.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1] ALSA: hda/realtek: Add support for Ayaneo System using CS35L41 HDA
In-Reply-To: <20250109165455.645810-1-sbinding@opensource.cirrus.com>
References: <20250109165455.645810-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: EFED521125
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 09 Jan 2025 17:54:48 +0100,
Stefan Binding wrote:
> 
> Add support for Ayaneo Portable Game System.
> 
> System use 2 CS35L41 Amps with HDA, using Internal boost, with I2C
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Thanks, applied now.

Takashi
