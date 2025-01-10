Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811C4212B3F
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 16:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736527666; cv=none; b=KsX3KnZUwiAQ6BQfBWZLrYZ7pRzaVBN8XwIhjs5cqGqndkdBozng2kA06D46sIqwkICOrauj2WyN+TEWYa/e1HcW4ceH4htemNblBTh1z6bbw3Dtavyn9Jflw5VsCkjKrYVKT4CVxeAaRTyfJ6MgH7t00W7KQEsOBDT+bJy1gRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736527666; c=relaxed/simple;
	bh=WdynzYF5BND1iMEq6vXtOfMw81LY/A+PsvjjGqSDkkw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EVBIDD5PBhGQhve5GIxzOVvuV15SieEsDb8fU4ecT8NZzLFMybLwUqkpsuffe/zBsu8EyADN8qxz1P42YSFIFHzYnwEfPcbVZvQ5M7FF7LcewqKa/2XnXB0efM/cwGlM4O8ywg3J7XGLlFJPx+KL7msKIOvgroxK+gAMw0FO9DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bgAEDk9l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3NVX84Zk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bgAEDk9l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3NVX84Zk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bgAEDk9l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3NVX84Zk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bgAEDk9l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3NVX84Zk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8857C1F45B;
	Fri, 10 Jan 2025 16:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736527662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NN0qYNexuDOOZo9HOUTm7Ox2qwsHz6q7qt71JI22LZE=;
	b=bgAEDk9lvPQNdg6mU8+XgM+UtW3arkMxBxTrx/xic36k/XEsBNmUxcEq9Pf8FJyuBZiYRl
	A756KO2fA7q2s0BTtSZfxYwaP4GbqwbDphp423DXAvUgGjdU+ahG9Ag0IIzBajLaCsoSvv
	+gP0z+7MlmLK74eKz3Rn42zE8UnkDvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736527662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NN0qYNexuDOOZo9HOUTm7Ox2qwsHz6q7qt71JI22LZE=;
	b=3NVX84ZkDS1zG6xiYf4ukCGj7C9+PRyNyWt+e6kdQtWpzkvuta5Xwz+pBD7Sj7NqnzOaso
	WzHDmKT9/WHm5HCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bgAEDk9l;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3NVX84Zk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736527662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NN0qYNexuDOOZo9HOUTm7Ox2qwsHz6q7qt71JI22LZE=;
	b=bgAEDk9lvPQNdg6mU8+XgM+UtW3arkMxBxTrx/xic36k/XEsBNmUxcEq9Pf8FJyuBZiYRl
	A756KO2fA7q2s0BTtSZfxYwaP4GbqwbDphp423DXAvUgGjdU+ahG9Ag0IIzBajLaCsoSvv
	+gP0z+7MlmLK74eKz3Rn42zE8UnkDvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736527662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NN0qYNexuDOOZo9HOUTm7Ox2qwsHz6q7qt71JI22LZE=;
	b=3NVX84ZkDS1zG6xiYf4ukCGj7C9+PRyNyWt+e6kdQtWpzkvuta5Xwz+pBD7Sj7NqnzOaso
	WzHDmKT9/WHm5HCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5587313763;
	Fri, 10 Jan 2025 16:47:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /winEy5PgWfkIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jan 2025 16:47:42 +0000
Date: Fri, 10 Jan 2025 17:47:41 +0100
Message-ID: <87wmf2ty36.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com
Subject: Re: [PATCH v2 1/2] ALSA: hda: Fix compilation of snd_hdac_adsp_xxx() helpers
In-Reply-To: <e07e56da-4259-4a4f-a2b2-2482fc511e01@sirena.org.uk>
References: <20250110113326.3809897-1-cezary.rojewski@intel.com>
	<20250110113326.3809897-2-cezary.rojewski@intel.com>
	<871pxavdhx.wl-tiwai@suse.de>
	<e07e56da-4259-4a4f-a2b2-2482fc511e01@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 8857C1F45B
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 10 Jan 2025 17:31:33 +0100,
Mark Brown wrote:
> 
> On Fri, Jan 10, 2025 at 05:29:30PM +0100, Takashi Iwai wrote:
> 
> > I can take this, but as it touches ASoC stuff, need an ack from Mark.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> 
> I tend to just not look at stuff with ALSA: on it since I get copied on
> lots of HDA patches.

Heh, that's why I asked explicitly at this time ;)

Now applied the patch 1 to for-next branch.
I leave patch 2 for further discussion.


thanks,

Takashi
