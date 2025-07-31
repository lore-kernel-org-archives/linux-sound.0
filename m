Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4403C2BFC8F
	for <linux-sound@vger.kernel.org>; Thu, 31 Jul 2025 12:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753965463; cv=none; b=Ya4HfQChp2yp0O9ClLFO9WgXILh5uqbUIq3KQWG2WCGe74JEeuds46Nun+vCYMYhPiVMSeNzKcdCQedORmbQZH6t69TWXH4G6T1VZGUO8GJWA14xZYJ0hk65X+uAL6vzRe/6UxyqeaZzc5Qv75TwKrJTKO5je5SOZa07ZhhUuP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753965463; c=relaxed/simple;
	bh=QSThmTv2cL/cUkSTo88u0nGKHczgV+5JqxDSU6mNKcw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rpq0CpNSqVY4EU8AGNXedDh4ZSj8y9yfdbrfHXyK9Pnl2nTqtkiHzPOITtJIdzHmOSrXjFimxBuv2fj8Brwy4euevogn/lnYe1MoTZ5G6aPT7qAYsTcvJAsRaq6fWDZe4uWRUpHcqYdEg/DGbjq+yzZvgd2kvXoN7QwUHgar3PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UClNw5DM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q2fYeiXL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UClNw5DM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q2fYeiXL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UClNw5DM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q2fYeiXL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UClNw5DM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q2fYeiXL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 287E11FC83;
	Thu, 31 Jul 2025 12:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753965458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6aDI3BXAXkguIYp1CGsSWtykjtTqLj55lZ41VA8Ch0Q=;
	b=UClNw5DMC7ZdBfPexR9FQEAjfT/y/X/Ejj4sV3+7dLiBzFbJiz7C6ljLvPkqo+re88yLAT
	5oQctRJzgjWEZBFIyY+8nQ4wX9s4alRlzOnniSMuWmKkL1dbE4eYVr6ZtJxUFEDgd9jWsi
	RsT6QSyI/JDNHbUq+GJqOuzmIu88CvY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753965458;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6aDI3BXAXkguIYp1CGsSWtykjtTqLj55lZ41VA8Ch0Q=;
	b=Q2fYeiXLUk3YX11Fs9AX7hUM1QxKqeGTu022p7Ei/RjeH1nfQxA7VnzrIMCpNjEQZ6wKk+
	U55nPAn13Cz8lCDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UClNw5DM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Q2fYeiXL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753965458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6aDI3BXAXkguIYp1CGsSWtykjtTqLj55lZ41VA8Ch0Q=;
	b=UClNw5DMC7ZdBfPexR9FQEAjfT/y/X/Ejj4sV3+7dLiBzFbJiz7C6ljLvPkqo+re88yLAT
	5oQctRJzgjWEZBFIyY+8nQ4wX9s4alRlzOnniSMuWmKkL1dbE4eYVr6ZtJxUFEDgd9jWsi
	RsT6QSyI/JDNHbUq+GJqOuzmIu88CvY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753965458;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6aDI3BXAXkguIYp1CGsSWtykjtTqLj55lZ41VA8Ch0Q=;
	b=Q2fYeiXLUk3YX11Fs9AX7hUM1QxKqeGTu022p7Ei/RjeH1nfQxA7VnzrIMCpNjEQZ6wKk+
	U55nPAn13Cz8lCDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D206713876;
	Thu, 31 Jul 2025 12:37:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z9wDMpFji2jWWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 31 Jul 2025 12:37:37 +0000
Date: Thu, 31 Jul 2025 14:37:37 +0200
Message-ID: <87v7n8r0xa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arthur Marsh <arthur.marsh@internode.on.net>
Cc: tiwai@suse.de,
	amadeuszx.slawinski@linux.intel.com,
	baojun.xu@ti.com,
	bo.liu@senarytech.com,
	cezary.rojewski@intel.com,
	kai.vehmanen@linux.intel.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	rf@opensource.cirrus.com
Subject: Re: ALC887-VD line-in not visible
In-Reply-To: <20250731123201.6220-1-user@am64>
References: <877bzoudpk.wl-tiwai@suse.de>
	<20250731123201.6220-1-user@am64>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 287E11FC83
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[internode.on.net];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[internode.on.net];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.51

On Thu, 31 Jul 2025 14:32:01 +0200,
Arthur Marsh wrote:
> 
> Thanks, I found the discussion with Linus about options and enabled:
> 
> CONFIG_SND_HDA_CODEC_ALC882
> 
> It still gets confusing that 
> 
> CONFIG_SND_HDA_CODEC_ALC882
> 
> also applies to other ALC88* codecs.

There are hundreds of different Realtek HD-audio codecs and we can't
put all in the driver names :)  Basically the driver is for ALC882 and
its compatible codecs.

> I also enabled:
> 
> CONFIG_SND_HDA_CODEC_ALC882
> 
> even though I generally don't use HDMI out on this machine.

Your problem is rather specific to Realtek codec, so it's only about
CONFIG_SND_HDA_CODEC_ALC882.  I'm not sure what made Linus' system
broken, but my wild guess is that the lack of specific HDMI codec
support caused the user-space side configuration mismatched somehow.


Takashi
