Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3F33DC4DC
	for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 11:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387951; cv=none; b=IsT4KQvY2WKjQ9ZlxqfQEiMzouQ31y4ON9vouM3UjZbuiH3+ZpKO8/GzxopX/DT89kPZAZtuZ9A/BJmyRahswJ1BPOBrb1D5yGINfukzKr46bepTuu6PW/Odjv+eKFw1gklEdulfXgSQBF+EYs9Y1D6dOW7IdE0oIlFwSSIAcIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387951; c=relaxed/simple;
	bh=wJcjURJMRqAXTqFZEqKXVrmtlTVrAceMOIvDT2aJJ1Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O6ncRP8AAcI+lftzHvh8QIvMyphG1Wejs/mSF91+IWwv4FOrLo3k+xJIVhBd9K3F2TPfdws3A5w4jI2lIbOrD9lanfdIxXlxqRcNgjULTvDsddF2kX9jNoWqM0j53LI6gIwaDk222qlnUtrQpW92gZvb8HL/j4OSqhn+PJ3Y+g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nyU6vHoX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rvlHVjTq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nyU6vHoX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rvlHVjTq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nyU6vHoX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rvlHVjTq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nyU6vHoX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rvlHVjTq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B97F276297;
	Thu, 25 Jun 2026 11:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782387947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GIM9uQiAIlSoE3DTTWhBQtzLYHg5Sbzy4ULxpGdh62I=;
	b=nyU6vHoX32hzdHqXHIT4ixAluKwThZ60ewJHEeU5jgh7GrO/OYS9n6mSlbSZFEhDVtQ/4i
	ehbAje4daRh/ghxgt/56Mkz/7XwgyHxLJSvMAmP9WLSvRQ1EIRPBos0C4vZzVmZ+42eJIy
	QqJDObXqgejT1X6TRb1yWclDfO95veE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782387947;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GIM9uQiAIlSoE3DTTWhBQtzLYHg5Sbzy4ULxpGdh62I=;
	b=rvlHVjTqOOitJohJveLAUhXzbQiMwKfiO3bZjd6fwFB2f+GWcLLoU6pTE0W9b0I5epph+S
	u/0UBs439nm+U5Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nyU6vHoX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rvlHVjTq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782387947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GIM9uQiAIlSoE3DTTWhBQtzLYHg5Sbzy4ULxpGdh62I=;
	b=nyU6vHoX32hzdHqXHIT4ixAluKwThZ60ewJHEeU5jgh7GrO/OYS9n6mSlbSZFEhDVtQ/4i
	ehbAje4daRh/ghxgt/56Mkz/7XwgyHxLJSvMAmP9WLSvRQ1EIRPBos0C4vZzVmZ+42eJIy
	QqJDObXqgejT1X6TRb1yWclDfO95veE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782387947;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GIM9uQiAIlSoE3DTTWhBQtzLYHg5Sbzy4ULxpGdh62I=;
	b=rvlHVjTqOOitJohJveLAUhXzbQiMwKfiO3bZjd6fwFB2f+GWcLLoU6pTE0W9b0I5epph+S
	u/0UBs439nm+U5Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B07E779A8;
	Thu, 25 Jun 2026 11:45:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zgHcJOsUPWrNdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Jun 2026 11:45:47 +0000
Date: Thu, 25 Jun 2026 13:45:47 +0200
Message-ID: <87cxxevo5w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oleg4260 <oleg.kucheryavenko2018@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Acer Nitro ANV15-41
In-Reply-To: <20260624191301.10162-1-oleg.kucheryavenko2018@gmail.com>
References: <20260624191301.10162-1-oleg.kucheryavenko2018@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B97F276297
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Wed, 24 Jun 2026 21:13:01 +0200,
Oleg4260 wrote:
> 
> From: Oleg Kucheryavenko <oleg.kucheryavenko2018@gmail.com>
> 
> The Acer Nitro ANV15-41 laptop with ALC245 codec does not
> detect the headset microphone in the combo jack by default.
> Apply the ALC2XX_FIXUP_HEADSET_MIC quirk to fix it.
> 
> Signed-off-by: Oleg Kucheryavenko <oleg.kucheryavenko2018@gmail.com>

Applied now.  Thanks.


Takashi
