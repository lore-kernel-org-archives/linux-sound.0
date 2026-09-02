Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32337330B3F
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356607; cv=none; b=BhOhsdTqILhqXATANByX3aoC4lzAoNRrA8RBnDLEwINPuu3ve/sSfPfZWVtw5x/12f5tkdaQQlgJTYQ8fPTFx/xQlst6rSyS21ycDcB4qI7B+nBGNKu+9uO8bUzBWu+s+uf4U08+e6RjpNtdmTC88goYnTnKe0VXdVgNzbv8M8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356607; c=relaxed/simple;
	bh=QwRgy5EAbLJ4PqgtNrvkB73Ob/6xShDJINHYkCN8ORA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S2RgiFmRYaEDye8WGM5w1Dt5lz9ZXlQpnYP7em7s7ap5CQhEEKo1uqGKG2lsWp16jkJFXaDvw+mAVgg1V+fQOJPgYk5/86VcvgXXQT8VCihTbR3iqskK1eszs+wvdnK/y4O6mjFstT9Fm8tuBtycHPK672fPTXWn4ttEyTjOWUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s8oQu6Rp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i5q4VoT+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gT/q0UP/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fU4Qb6ha; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s8oQu6Rp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i5q4VoT+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gT/q0UP/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fU4Qb6ha"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DE6C821D35;
	Wed,  2 Sep 2026 13:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788356600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hqNTp31wL9yJMCbEC12eSUmjsZyAarJkWM4Wv9A4LlQ=;
	b=s8oQu6Rpe645REFzVZ8Ks3E13Kt5BJ8ZcD3kBAMSrwPRf3MphE2F98TpvUS0+md7VClPYo
	g3waUEd5s121ghAmWGMlUw6TDnIhf8NUGFNV31/DRGe1VUXA9odMBY0JWQ+dNCwe9puB7k
	PzER0lEhjCtL2SXGeSnAG7uvXWrQGfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788356600;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hqNTp31wL9yJMCbEC12eSUmjsZyAarJkWM4Wv9A4LlQ=;
	b=i5q4VoT+CKG0NXQBTuK7o8d5c+slOLgB5N5lK6OxOu4d/mIboUTwIZdgA7wI35odqXGBhn
	9iIdbV6vxKWa06Bg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="gT/q0UP/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fU4Qb6ha
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788356595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hqNTp31wL9yJMCbEC12eSUmjsZyAarJkWM4Wv9A4LlQ=;
	b=gT/q0UP/xs9UIWOcCgtxqXHSQp/GjIVURoRaDfiYUUcnIkKvqggOXbebwmGZlXxE0ATF/w
	TQ3Th7UU1xTApt/HGJInYBA6uNt2HzVPXIvVZuTsYzEDXj31ubjeC7U8fiNZV7Uk6lZsmJ
	PZl5hU8cbtrQd2yp6JHEZ4N+A6+g8+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788356595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hqNTp31wL9yJMCbEC12eSUmjsZyAarJkWM4Wv9A4LlQ=;
	b=fU4Qb6haHaeCgq4n0rSiq/mFsTE8yptKNfq5ltfzjPyktrPRo9TxJoYHC02MZ2hy1Pnkpf
	XOlTs8Usir9G3VAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A6D713736;
	Wed,  2 Sep 2026 13:43:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hrhrJPMnmGrXZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Sep 2026 13:43:15 +0000
Date: Wed, 02 Sep 2026 15:43:15 +0200
Message-ID: <87ik4nahvw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 01/10] ALSA: hda: ext: Clean up links if their initialization fails
In-Reply-To: <20260902081814.1590883-2-cezary.rojewski@intel.com>
References: <20260902081814.1590883-1-cezary.rojewski@intel.com>
	<20260902081814.1590883-2-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DE6C821D35
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid,intel.com:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Wed, 02 Sep 2026 10:18:05 +0200,
Cezary Rojewski wrote:
> 
> snd_hdac_ext_bus_get_ml_capabilities() allocates the hlink nodes
> one-by-one but the procedure may fails due to -ENOMEM in the middle of
> it. Clean up the list before returning the error code to simply the
> function usage.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

In case the series go through Mark's tree:

Acked-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
