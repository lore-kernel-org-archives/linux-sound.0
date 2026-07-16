Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7912BEC23
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 06:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784183642; cv=none; b=hN6HwBDWpSnfN/TyyZpCalypI8tFBcrIfgImWPMVNMkXHiqAtP2AZNj1LpGcQcaDqapaVGQ7+SxrPbqbJbp8ABdpvNkb+7nkijfLajv68riUhA0IZGZ571Szejk07HdFy1huIZzFzKZ1PmiJlfAumR3UVwSHFh3xId5m1D6uHJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784183642; c=relaxed/simple;
	bh=a4TSKrvTToGVXqGZzgq6rOX8pxMje7ORiHgWrYMIhns=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O0jx5WpuK5dVe+DYPM4YaWkhFwWeJ5EnPcxr6OlSqUmFkXWI8hs15N08YQ0CP4RwklCvhUQW4uFaZlW4U3O2RBNxkwrpaMQ0K5rp4hUqHGk4X4gDmIjcNX++JF3rHxuAHWQ4uudgTjlT+0qg/PYYrcYZpuOrZiWJWulAuDITNx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ypK9CLx9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NeAqlGwp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=grkCqW24; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y7ou8z3v; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ypK9CLx9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NeAqlGwp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="grkCqW24";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y7ou8z3v"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6DD3F78809;
	Thu, 16 Jul 2026 06:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784183638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5G68yB5MuM0TyL5Ov5ENS46fGpedKwL57VXYLO+2bF0=;
	b=ypK9CLx9ngzZWg8/SgyDoWfthIn9823fkOc2J01akYUxiMDJ+d3T9y+kFGTr0Et9U6QBRo
	Qo/loFI5je3hYIhxhMs7Zj/wfasY3OL9WkXC8tYbw8S/XGW/KzUPMqzR6luA0zKCuCuZmG
	PtxSJBEwnRiiCPri6Of5VYmEJW9D3bw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784183638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5G68yB5MuM0TyL5Ov5ENS46fGpedKwL57VXYLO+2bF0=;
	b=NeAqlGwp2FSV+spLDhch71+lRBRlj8q/1KZ/vufyJg5+2txIawRLxw7KQF9Q3msP0YN/Wb
	RyfFI5gI2Oa4hdDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=grkCqW24;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=y7ou8z3v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784183637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5G68yB5MuM0TyL5Ov5ENS46fGpedKwL57VXYLO+2bF0=;
	b=grkCqW24zMdorZ17ADqrTK1++CFWruChjIB9I45H7W952sq6lKtB1XZCoA9J8snKqi2Fbv
	7sU2fhRrk3bgYAyyptTx271cd2+hPiC1hVyfITtVTGWhuS3kEUOshMJ/KFt1V6/OhEmG7q
	nRmcwMBNiZNVdKErJcSYmdSZJAwo6Jk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784183637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5G68yB5MuM0TyL5Ov5ENS46fGpedKwL57VXYLO+2bF0=;
	b=y7ou8z3vSBvsapCpuGsFQC/bfAiAj9PbHub/vb2Be/NXwn67KmvLepXBFd0yAfamfENIG8
	q9iYtFBjdqiH8XDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43193779AD;
	Thu, 16 Jul 2026 06:33:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X38vD1V7WGrRZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 16 Jul 2026 06:33:57 +0000
Date: Thu, 16 Jul 2026 08:33:56 +0200
Message-ID: <8733xjwii3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] ALSA: hda/realtek: Add inverted LED quirk for HP ZBook 8 G2a
In-Reply-To: <20260716023825.387532-1-chris.chiu@canonical.com>
References: <20260716023825.387532-1-chris.chiu@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,canonical.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6DD3F78809
X-Spam-Score: -3.51

On Thu, 16 Jul 2026 04:38:25 +0200,
Chris Chiu wrote:
> 
> HP ZBook 8 G2a 14 and 16 (SSIDs 0x103c:0x8f94, 0x103c:0x8f95) use the
> Realtek ALC245 codec with a TAS2781 amplifier via I2C. They share the same
> hardware configuration as the existing 0x8f40/0x8f41/0x8f42/0x8f62 models
> but have inverted speaker mute LED polarity, so the existing
> ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED quirk drives the LED backwards: off
> when muted and on when unmuted.
> 
> Add a dedicated quirk with inverted COEF values. These are speaker-only
> models without an HP pin, so the LED is driven directly through the
> vmaster_mute hook; there is no need to probe the HP pin at runtime since
> the configuration is static and known per SSID.
> 
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>

Applied now.  Thanks.


Takashi
