Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FD9416D1D
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781103385; cv=none; b=H0AmNtXHWc9/QHT1fuMeud0ChBAXh7Z8HWKgrqV682swTbABOHT3p9sDpVtR8WYFRuxmc8ZjNCoeXhBhrRn8cRlWNMbChWBGRGmSxKMxwIvu/0OAV6xc9byI60nl1PzYbTFFLfuAO7OVKDaxt9jZAtwATwbVPPtBDKnfMedxYC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781103385; c=relaxed/simple;
	bh=uh+Q6h8Vmd+PcfdjRNrYje6JcnkcwbdiF4UAYNPevaw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P1JUBmXac0yYLhQOXZ8TACUQsoLgH9Ss3HmfF2mId3C9GQD2tF3dMQFRjaFVTmS0RJnAE/yP6JIr2L+ZB/E7Ya/Nm/etrksDI+MpYcvEVG9ZXTIuxtB2yJwOPf+g2jd3HopjZY1ZMDaYYaDQrbqUx+0PpcgPB7P6zx0/qQMRSlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L8mZOpee; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VZG97ti7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ckRGtWom; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=39PiOX+z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L8mZOpee";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VZG97ti7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ckRGtWom";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="39PiOX+z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 913C175985;
	Wed, 10 Jun 2026 14:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781103381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1keMmcB2uzbU1w/GK2KZf+kAqHPKG2WPDPvORAhtF1U=;
	b=L8mZOpeeNiJ9nqnyg540QryGuT+Mj45ixGYo8UHop/nlYY5MO09d8lqXHmvsRLh28pEnbb
	fcqC7d1u6bJstFStbjgfIDUQZOp1teg1biT9vdGpf1XW00NzGXfUVdDek0gzC9jtyj4poG
	ZuCYZW9VHEuM3K6LnAa0pz0g+bvd95Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781103381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1keMmcB2uzbU1w/GK2KZf+kAqHPKG2WPDPvORAhtF1U=;
	b=VZG97ti7/4ZE/+AwPJMC/fBRmBCxV29bq0AoIyk2J3yADU2rh2TRpaf9vaBpsMvZNhvHKZ
	ysVFGgEuIb3QENAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ckRGtWom;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=39PiOX+z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781103379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1keMmcB2uzbU1w/GK2KZf+kAqHPKG2WPDPvORAhtF1U=;
	b=ckRGtWomPpfJ5jNo2zD4a8BUBrburM8/Jnja177m7HuHdDTJH89I57zLamGUt11b3+Cv1+
	oBznl9oAZ7el/7lawwM433ZB1SAGnnhnYRuv2CAXHXo5qWmczLixr765LFpQfqToQdFO6v
	5aeDKhfmSGS/IB1FlbfxoJXX0h4Y9ko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781103379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1keMmcB2uzbU1w/GK2KZf+kAqHPKG2WPDPvORAhtF1U=;
	b=39PiOX+zcs8sunagYj6YsbiwYH/2e+6yMMqARi6dbRQoNCZVLkziSh95jBW44vPv2UVDgO
	0fT16Cdihy8kxpCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E9C4779A9;
	Wed, 10 Jun 2026 14:56:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J/b/FRN7KWp+AQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Jun 2026 14:56:19 +0000
Date: Wed, 10 Jun 2026 16:56:19 +0200
Message-ID: <87wlw64f70.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	notify@kernel.org
Subject: Re: [PATCH] ALSA: pcm: Fix unlocked state reads in read/write file ops
In-Reply-To: <20260610-alsa-pcm-read-write-state-helper-v1-1-93b7b992db09@gmail.com>
References: <20260610-alsa-pcm-read-write-state-helper-v1-1-93b7b992db09@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 913C175985
X-Spam-Score: -3.51

On Wed, 10 Jun 2026 13:31:30 +0200,
Cássio Gabriel wrote:
> 
> The PCM read/write and readv/writev file operations reject streams in
> OPEN or DISCONNECTED state before accessing the configured runtime
> parameters. However, each operation reads runtime->state without the
> PCM stream lock.
> 
> PCM state updates are serialized by the stream lock and may occur
> concurrently from IRQ context. Use a local predicate based on
> snd_pcm_get_state() to take a locked state snapshot for these VFS entry
> checks.
> 
> This also consolidates the duplicated OPEN and DISCONNECTED tests. The
> conditions and returned errors remain unchanged.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
