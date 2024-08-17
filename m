Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FB813DDCD
	for <linux-sound@vger.kernel.org>; Sat, 17 Aug 2024 07:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723880664; cv=none; b=btdRxDQCrzOjr+yg1YTFlj+tlmT42CLsMvYT8kgg4sbjVtsSGHUhhFrq4QtynZYNvpsDleLY9VmjH9F044xe417i2MzCZRlgyPo2GvO1k7nWL2BaFAIliRMp4a+Oph3F+rXN5fNkNQm5/BgxUxOReTMo6vV1vWBUfz4rAqu1UMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723880664; c=relaxed/simple;
	bh=RUGGfYatZRZnk1U5MFvj0Gi0/PMuhb/Y/mXABqQp25s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RIoxCQY7BjwdQWsK4HOd0NTtdeIRSERezMHI1lHDz54wNDi8GjBb1sva7VXz3wYCOLkb61U/XuLS/5oCa3SzCxmyLcXFXvYSGtVX/Yd5io/9NgjqwuW7SPO0q0M1d05rcrDg2MU+wEgBxvF5xOLeivXB/THOKVZiKMloq56Rao4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zH4NIzWl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b8w8rr4v; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zH4NIzWl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b8w8rr4v; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zH4NIzWl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b8w8rr4v";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zH4NIzWl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b8w8rr4v"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A9D3F201FA;
	Sat, 17 Aug 2024 07:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723880660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/xvEPZkP2VnIptCsRFeWqaIcY7nBLVjS1F7Cu9JUa8k=;
	b=zH4NIzWlGMNXD6Wd/79QeJW5jr5hZKKTmGBeGP5MgBSMY4BKaDjmnX9YdpLlZuSTj5itxL
	IC088rMyyqbG9CcX3KAVt5BKcsGBcEoEmKiP3fErlqRUGfFOcv0tF3v6IBQZkxTy5Z1Q/Y
	vbA4kKimZoLwWDwC/8mNQZf3Cay3hT8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723880660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/xvEPZkP2VnIptCsRFeWqaIcY7nBLVjS1F7Cu9JUa8k=;
	b=b8w8rr4vb3LzgHjxmGAdiGHSf5weSzFPxe0jNZrObamM8yK7ehvDivyZBtLU+nXLrtkOop
	QsuZODJ+haUgt6BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723880660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/xvEPZkP2VnIptCsRFeWqaIcY7nBLVjS1F7Cu9JUa8k=;
	b=zH4NIzWlGMNXD6Wd/79QeJW5jr5hZKKTmGBeGP5MgBSMY4BKaDjmnX9YdpLlZuSTj5itxL
	IC088rMyyqbG9CcX3KAVt5BKcsGBcEoEmKiP3fErlqRUGfFOcv0tF3v6IBQZkxTy5Z1Q/Y
	vbA4kKimZoLwWDwC/8mNQZf3Cay3hT8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723880660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/xvEPZkP2VnIptCsRFeWqaIcY7nBLVjS1F7Cu9JUa8k=;
	b=b8w8rr4vb3LzgHjxmGAdiGHSf5weSzFPxe0jNZrObamM8yK7ehvDivyZBtLU+nXLrtkOop
	QsuZODJ+haUgt6BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5944C13991;
	Sat, 17 Aug 2024 07:44:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EBqEFNRUwGaEfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 17 Aug 2024 07:44:20 +0000
Date: Sat, 17 Aug 2024 09:45:01 +0200
Message-ID: <87y14v1tky.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	andriy.shevchenko@linux.intel.com,
	cujomalainey@chromium.org,
	lmajczak@google.com
Subject: Re: [PATCH v2 01/14] ALSA: hda: Move SST device entries to AVS
In-Reply-To: <ef967f55-fd8e-4491-84f6-76808d839dae@sirena.org.uk>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
	<20240814083929.1217319-2-cezary.rojewski@intel.com>
	<ef967f55-fd8e-4491-84f6-76808d839dae@sirena.org.uk>
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
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-Spam-Score: -3.30

On Sat, 17 Aug 2024 00:06:15 +0200,
Mark Brown wrote:
> 
> On Wed, Aug 14, 2024 at 10:39:16AM +0200, Cezary Rojewski wrote:
> > The avs-driver succeeds the skylake-driver. It suppots all
> > configurations of its predecessor and more. Reflect that in the existing
> > selection table.
> 
> Takashi, are you OK with this?

Sorry, I overlooked.

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

