Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0F6364E8D
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 11:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772106211; cv=none; b=C8c3LiGX9I0zGG8+y0HGDElswsZpiUxE/W02I8UO3WJAk8iRfA2vh0OOJLalPPBbrRe3Bk7Z0iscEHvap4B81hFYo9nu/g05hfswI/Jv8fbKmhdES280CKcjYK/DIPBAOnXHvzEjDqdkBGhkd0v/7SnwICG1KIcECxI8Zz8Xm2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772106211; c=relaxed/simple;
	bh=IMcfBnl8Dn2XPHNWH2j/EzETjiRVXe77hdhhRunGLp0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FcsqWfr18wCCYDMbimB4VclZLHznnhUhrs/KRQfzFLngNUZw4iui3bQbP/jDMs7W0lxu33p1/kQF7X3KeefT/4Nbdl8E9Umj8IiGfRbGef9Ji/HjKpBqOaXyl3vq2PinPihDqlppDUi4lUP4HR8CN3EhKSCpCpTuaaorqn/MkBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qw2SzPd4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JWz2M7Vb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qw2SzPd4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JWz2M7Vb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qw2SzPd4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JWz2M7Vb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qw2SzPd4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JWz2M7Vb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 145041FA7B;
	Thu, 26 Feb 2026 11:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772106208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MnBEYse4hbQLJuZNkPVzkVAbn2YLqM3hFob4S5OhI1U=;
	b=qw2SzPd4JZavTq995TDSB2U9seRDn+d+Z9ZJKvk4u8KeMMaj2nKk+DWcaide/cJ0W+pwDC
	i6kKnLfNJhVu38jsRgRqDq9MxoDSXYWdt0iJXjyko5ax9dNhCbRMcoim7LAdAcNjOh674j
	ZxKV3uycMLrKysfUcuQKDppavFQlBUs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772106208;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MnBEYse4hbQLJuZNkPVzkVAbn2YLqM3hFob4S5OhI1U=;
	b=JWz2M7VbJhUKrMEnt4RdqLWjhEDvs5BN+TKO34DMA3kuMJdsF6lRhTNBFH6QC2MXeU6b49
	behqOW3ycpFBjZDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772106208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MnBEYse4hbQLJuZNkPVzkVAbn2YLqM3hFob4S5OhI1U=;
	b=qw2SzPd4JZavTq995TDSB2U9seRDn+d+Z9ZJKvk4u8KeMMaj2nKk+DWcaide/cJ0W+pwDC
	i6kKnLfNJhVu38jsRgRqDq9MxoDSXYWdt0iJXjyko5ax9dNhCbRMcoim7LAdAcNjOh674j
	ZxKV3uycMLrKysfUcuQKDppavFQlBUs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772106208;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MnBEYse4hbQLJuZNkPVzkVAbn2YLqM3hFob4S5OhI1U=;
	b=JWz2M7VbJhUKrMEnt4RdqLWjhEDvs5BN+TKO34DMA3kuMJdsF6lRhTNBFH6QC2MXeU6b49
	behqOW3ycpFBjZDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DD6FE3EA62;
	Thu, 26 Feb 2026 11:43:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iJesNN8xoGlAaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Feb 2026 11:43:27 +0000
Date: Thu, 26 Feb 2026 12:43:27 +0100
Message-ID: <87y0kfbuhs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda: cs35l56: Fix signedness error in cs35l56_hda_posture_put()
In-Reply-To: <20260226111728.1700431-1-rf@opensource.cirrus.com>
References: <20260226111728.1700431-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,cirrus.com:email,suse.de:mid]
X-Spam-Flag: NO

On Thu, 26 Feb 2026 12:17:28 +0100,
Richard Fitzgerald wrote:
> 
> In cs35l56_hda_posture_put() assign ucontrol->value.integer.value[0] to
> a long instead of an unsigned long. ucontrol->value.integer.value[0] is
> a long.
> 
> This fixes the sparse warning:
> 
> sound/hda/codecs/side-codecs/cs35l56_hda.c:256:20: warning: unsigned value
> that used to be signed checked against zero?
> sound/hda/codecs/side-codecs/cs35l56_hda.c:252:29: signed value source
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: 73cfbfa9caea8 ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")

Applied now.  Thanks.


Takashi
