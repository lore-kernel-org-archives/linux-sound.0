Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C06E78F39
	for <linux-sound@vger.kernel.org>; Sun, 11 May 2025 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746973479; cv=none; b=CJtkfcxW51mP9XN1tjLRHeD0dGdXc+vlQMS4FphHWAKmGVRWfqKyOLWmHeW7hCF6X+YLln/1JPISrKBWJmHzFSlkc5fW3Nv18MUvEBKELQ41xlf873XS8S/jYWslQtI8Q+r250/P3Jy833L5xTlrf7Krtf8rtBiZCr4RhuCk244=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746973479; c=relaxed/simple;
	bh=O8q2iKca2yCj+QkEGYNYLD+AdOqZhoAibXBpB0yHb88=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WMetg9kkLQ2s+OzrrYsSWw7Lmk9VhpRMvbHnjnTWunzSZcQfbJCWalafp21WYMvQI00B2pVWSmW56jLq4SZWZ+l+L1LcX9d/KqkScp1PZw7cYXUGBd2vUHmauwUgUPvUyzZRu1e55rlCYk+ogmhNaW4wMHK5iZ1D7+wwvZCQiyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tuJx2lAo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OV+6Evu7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tuJx2lAo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OV+6Evu7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tuJx2lAo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OV+6Evu7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tuJx2lAo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OV+6Evu7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 901821F397;
	Sun, 11 May 2025 14:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746973475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f6c0mRH2QqowHwXo2iwBVoeAQ9DqlMfUdpVdSXYmgRA=;
	b=tuJx2lAo8qxNr37OOoBJOUW+RsQ67MZnYz/a6rvNQYN1F5zkmep1TmUhP3VmAx+MkUHo7Q
	xP5SK0lwkW4xEavjLpkSVrk0wAk5PeduqvnluI/q3EIjL7emMJecYmBJCQtVYKeOChshkb
	9tL7eFPRrLeJdmN4EYU/mi1sj2fiQGQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746973475;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f6c0mRH2QqowHwXo2iwBVoeAQ9DqlMfUdpVdSXYmgRA=;
	b=OV+6Evu7uzdJKd/hBY3Kt3aK3Ts/POzimjpuYFsQ4KiOiUQHO6H3sWiM4IIaghzMiytwEL
	ejO24iiWclih5iDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tuJx2lAo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OV+6Evu7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746973475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f6c0mRH2QqowHwXo2iwBVoeAQ9DqlMfUdpVdSXYmgRA=;
	b=tuJx2lAo8qxNr37OOoBJOUW+RsQ67MZnYz/a6rvNQYN1F5zkmep1TmUhP3VmAx+MkUHo7Q
	xP5SK0lwkW4xEavjLpkSVrk0wAk5PeduqvnluI/q3EIjL7emMJecYmBJCQtVYKeOChshkb
	9tL7eFPRrLeJdmN4EYU/mi1sj2fiQGQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746973475;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f6c0mRH2QqowHwXo2iwBVoeAQ9DqlMfUdpVdSXYmgRA=;
	b=OV+6Evu7uzdJKd/hBY3Kt3aK3Ts/POzimjpuYFsQ4KiOiUQHO6H3sWiM4IIaghzMiytwEL
	ejO24iiWclih5iDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6FD4E13690;
	Sun, 11 May 2025 14:24:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dRrrGSOzIGgqcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 11 May 2025 14:24:35 +0000
Date: Sun, 11 May 2025 16:24:35 +0200
Message-ID: <87jz6nxm1o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: isa/gus: remove snd_gf1_lfo_xxx()
In-Reply-To: <87o6w2pqm8.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6w2pqm8.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 901821F397
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action

On Fri, 09 May 2025 02:36:15 +0200,
Kuninori Morimoto wrote:
> 
> There is no snd_gf1_lfo_xxx() implementation, and no one is using it.
> Let's remove it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Applied now.  Thanks.

I hesitated to drop this kind of stuff, but it's really outdated and
better to clean up.


Takashi
