Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124C120F07D
	for <linux-sound@vger.kernel.org>; Wed,  2 Apr 2025 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594811; cv=none; b=Erv8L6ynwy/xs42N8nxu40AqR+WpcfPWmpX49p3Fh8JicuFa0cuGREm0Sb9dJbHuUMPZlykiel+/igr1fbkfNesKzZt3w6yp/KATzRjSumoFlFuFrOC1QTL+mIEIF/tm3CvCXf35cVZhvkJdF9WYs8WtHZKy+7gEbt/CSKYGbQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594811; c=relaxed/simple;
	bh=RMOv3DaEmF6fI8ceobOV6aiQe/9gSqP8mk6DNTOXFsM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DBHUSW4VqAmakYzVFoA83vY0toiLupcE4tHPVUn/vozBYctZUhzL0J8ut8/lUVWj95FJjWphpN+zLK+iLA6ZWxufQcdQKG+HkoyhsMoHwaBkZGypGNZsBhdFFOxfTmPfUxRX37lkPnhmavq53PnP5h4c18S4BUPx3V+04k+4g9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DWhUBeWN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y8ck08qJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DWhUBeWN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y8ck08qJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DWhUBeWN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y8ck08qJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DWhUBeWN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y8ck08qJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 40CF92118C;
	Wed,  2 Apr 2025 11:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743594808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=egAFCBt8LLG/j9udOR4VBVORYE8oQuNQol5CkaX7POs=;
	b=DWhUBeWNwSLIZFUH73NA993YdXNc4xJGr9/m4G9KNompz8Ji+6cBIVlkvXb1zM+7dpVlOU
	p6aNo+LTG8sdwfo+d6Ggr7nZC+Ef22ihNNMFOOvmBXdnbv/k72Iz7G0PN6k22W2sWOtxRT
	EgFXv/WOZ41+1fdWVscR+1seiX84qkI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743594808;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=egAFCBt8LLG/j9udOR4VBVORYE8oQuNQol5CkaX7POs=;
	b=Y8ck08qJM1DYVFEXPCsrv04/eZJNpMSJNBZ2b8ulJQ/txWV700j6LSsEXiMQB4ZseS3uic
	17St3kkGm7cSTODg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DWhUBeWN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Y8ck08qJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743594808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=egAFCBt8LLG/j9udOR4VBVORYE8oQuNQol5CkaX7POs=;
	b=DWhUBeWNwSLIZFUH73NA993YdXNc4xJGr9/m4G9KNompz8Ji+6cBIVlkvXb1zM+7dpVlOU
	p6aNo+LTG8sdwfo+d6Ggr7nZC+Ef22ihNNMFOOvmBXdnbv/k72Iz7G0PN6k22W2sWOtxRT
	EgFXv/WOZ41+1fdWVscR+1seiX84qkI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743594808;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=egAFCBt8LLG/j9udOR4VBVORYE8oQuNQol5CkaX7POs=;
	b=Y8ck08qJM1DYVFEXPCsrv04/eZJNpMSJNBZ2b8ulJQ/txWV700j6LSsEXiMQB4ZseS3uic
	17St3kkGm7cSTODg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E96DB13A4B;
	Wed,  2 Apr 2025 11:53:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kxuvNzcl7WdWdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Apr 2025 11:53:27 +0000
Date: Wed, 02 Apr 2025 13:53:27 +0200
Message-ID: <87iknmye2w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if resume is not supported
In-Reply-To: <87mscyyfaq.wl-tiwai@suse.de>
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
	<87r02cym1c.wl-tiwai@suse.de>
	<9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
	<87jz83ztn7.wl-tiwai@suse.de>
	<206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
	<87h637znpp.wl-tiwai@suse.de>
	<35d35586-4ffb-4d97-963e-a57323f634d3@perex.cz>
	<8734eryn21.wl-tiwai@suse.de>
	<ad064c22-320f-401a-b173-36a5df6df0ed@perex.cz>
	<1417b256-b9e8-4256-b14f-fdee86e202c1@linux.intel.com>
	<87mscyyfaq.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 40CF92118C
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,gmail.com,kernel.org,suse.com,vger.kernel.org,linux.intel.com,linux.dev,intel.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Wed, 02 Apr 2025 13:27:09 +0200,
Takashi Iwai wrote:
> 
> ... The difference is that it's evaluated in the
> driver only by the suspended state,

Here I meant "only by the resume operation".

> but it's free for user-space to
> read this out from the output of snd_pcm_status ioctl.
> How seriously it needs to be a different question, but there is a
> possibility of breakage.


Takashi
