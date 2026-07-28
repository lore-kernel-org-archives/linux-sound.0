Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94D9372ECA
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 16:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256267; cv=none; b=tCUoB2azVXt6W8Gbn62BQ/Khq9TxWR+IPgR75Gu2qZWcoEKiGUhWRoBXXz+1i28+8cF4ctqD2XjftMPrxvunZ8dEM8I4uGbP1yE+TS+j934qAheRuFlGx29YTTz0RRrbuh1HBFHYuBcbR73dCABI9jMwkZpcvJzE/b0Ba9Wj99Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256267; c=relaxed/simple;
	bh=UhpzFEKN//SPjJQcpmHLNfanu3U8kGUi6w+07ywqOHk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=seHMnTOaI67Zu6ZCO8yko6vx7HpsFwyiZpft/puBxs2HAqh4s9AOlgRt+at87mxChWLZrsqtQ01jihh6H24cxlxY71+FlWG9+Y9Ffop7kUH0VN6NI5NA1Sc6oGl6t+0tFTTxRMOLapikE78E/jSFel/jfMII4JtWAKoQKZNNfUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zRlyip9p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5zvd+R1+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QdWSJWPU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YpG2nEnq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zRlyip9p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5zvd+R1+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QdWSJWPU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YpG2nEnq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B3E5A7C3D3;
	Tue, 28 Jul 2026 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785256259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X8KlKO/gwYrZ8tB2DwBXMAWEMiyOJwIKXyXW/lH/ZLY=;
	b=zRlyip9pxecCI91tOK1v1S8KE11b389dzSzQlSBMokpcs70yldaVFIZM26/jKlExcjDLwF
	7XzIwaKfgj8ChJLVzHaN9b1QQhLQQ3KCfugr7/3fYYIbQfpzqt+I3XHoh8PHWiTPnJzYaS
	XViAj19H1ZjhQC7cQALDPOVwvDfR0TI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785256259;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X8KlKO/gwYrZ8tB2DwBXMAWEMiyOJwIKXyXW/lH/ZLY=;
	b=5zvd+R1+ZPcwGC2bREjGQg9kn7B4Qjh/Oc1W7gidZaPaO6wpGysO7kAZx3/CNkbRFcf5Yg
	5jZgUxSyuxLOdxDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785256255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X8KlKO/gwYrZ8tB2DwBXMAWEMiyOJwIKXyXW/lH/ZLY=;
	b=QdWSJWPUT+6yV8upfZc7dNoz7pspmxH/icy2RThIi8aLQXAIhZqd3RnRk3NI+ngLa0cdA4
	G7G5I0W9OVIHO9eeTPq+8yKuFqyY80+2mJGOQJpUgEpXA7Bkt75DWBus1UTdfhO2PT2lx4
	aH91zBvQLZ+kDPBWQsfEEHuuPEJK4Jk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785256255;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X8KlKO/gwYrZ8tB2DwBXMAWEMiyOJwIKXyXW/lH/ZLY=;
	b=YpG2nEnqaoLskGKOdzdaMaP2HKyo4TlD5gDVusm4pPqmTRNi3mEPSx8j/Jn5AyNyxTbBYE
	zSKkKBwN+KhNRBCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 876B9779B1;
	Tue, 28 Jul 2026 16:30:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YpvZHz/ZaGp7DQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 Jul 2026 16:30:55 +0000
Date: Tue, 28 Jul 2026 18:30:55 +0200
Message-ID: <871pcn6pq8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Robert Abrahamse <denobyte2@gmail.com>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk for Corsair Virtuoso (later revision)
In-Reply-To: <20260728140314.11601-1-denobyte2@gmail.com>
References: <20260728140314.11601-1-denobyte2@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 28 Jul 2026 16:03:14 +0200,
Robert Abrahamse wrote:
> 
> Add USB mixer mapping quirk for later revisions of the Corsair Virtuoso
> headset with USB IDs 0x1b1c:0x0a43 (wired) and 0x1b1c:0x0a44
> (wireless). These devices exhibit the same mixer label collision as
> earlier Virtuoso variants: all controls are labelled "Headset", causing
> applications like PulseAudio to move the sidetone control instead of
> the main playback volume.
> 
> Signed-off-by: Robert Abrahamse <denobyte2@gmail.com>

Applied now.  Thanks.


Takashi
