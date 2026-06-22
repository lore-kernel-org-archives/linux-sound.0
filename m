Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBCD379C23
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 10:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782125707; cv=none; b=GWmJl4mi9bcfvha64UXBplj5i5pEr7XbNadqNPjUuKAB8ofh236nBQGOqpOy1I8n80k4GP1wgwsPwMzXshAYnQlAz5l64tuhtaa1tUpgIx9pIf6Fl2nZlUBnwLr8aZdpJm9wfjmqwioyEvDnJzPWZw+yGJP/272n+2lxzQlId9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782125707; c=relaxed/simple;
	bh=EqepRnY5eXPOrd85S9xUcxfrbZzfloYe0FfAFwLyh08=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YZIAsvchL+Wcbwz+gwsYD+V1Be1Ey7bEgR6S7n0u1CUv2xkCFsqxSqqCNiuinp1iyH4Mmsibs4qDUN30MfIydb8lqEq5vdm7RgB4ahC31ZaVNmp/MPyWd/9PwyJTagG+akKAdNXJNjQjQf91kOVnSO9rQEGc4F6PAeb64Bxmg3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZDpwbT8M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IIx+r23K; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZDpwbT8M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IIx+r23K; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZDpwbT8M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IIx+r23K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZDpwbT8M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IIx+r23K"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5B43875C31;
	Mon, 22 Jun 2026 10:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782125703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ozs7NmZ5uYsqBgRy1arrUj6tZM4X1ES90piSm47idlY=;
	b=ZDpwbT8Mqg0TXfd60wK3PaITYTP6BZDx1dSMZlRdhJz2AACWapNJ0KPX5wGbIHFI8Nz647
	2epQCJj3Z59i73NIgnGzq+mq1sxlkEJZFmtgbYfej0VRYCnBacF+sVCOSKk9QC0T2Pka1R
	hQiw5Wu483YXZlFzEFfm4mXGgqJ73QY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782125703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ozs7NmZ5uYsqBgRy1arrUj6tZM4X1ES90piSm47idlY=;
	b=IIx+r23KqIx05hKMdk1ZEaflVuXE+CjmHarZI8DkJUtz3TnA0sQ/eTvESy4IHN4Dm91AwV
	NqAyNfdGGSSks8CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZDpwbT8M;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IIx+r23K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782125703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ozs7NmZ5uYsqBgRy1arrUj6tZM4X1ES90piSm47idlY=;
	b=ZDpwbT8Mqg0TXfd60wK3PaITYTP6BZDx1dSMZlRdhJz2AACWapNJ0KPX5wGbIHFI8Nz647
	2epQCJj3Z59i73NIgnGzq+mq1sxlkEJZFmtgbYfej0VRYCnBacF+sVCOSKk9QC0T2Pka1R
	hQiw5Wu483YXZlFzEFfm4mXGgqJ73QY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782125703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ozs7NmZ5uYsqBgRy1arrUj6tZM4X1ES90piSm47idlY=;
	b=IIx+r23KqIx05hKMdk1ZEaflVuXE+CjmHarZI8DkJUtz3TnA0sQ/eTvESy4IHN4Dm91AwV
	NqAyNfdGGSSks8CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 24540779A8;
	Mon, 22 Jun 2026 10:55:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uJ2oB4cUOWr0DAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jun 2026 10:55:03 +0000
Date: Mon, 22 Jun 2026 12:55:02 +0200
Message-ID: <87echyetfd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Aaron Erhardt <aer@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda/realtek: Fix noisy mic for Clevo V6xxAW
In-Reply-To: <79bf40d3-6f77-4bf0-93c1-ba48220d7d9a@tuxedocomputers.com>
References: <20260519155047.106096-1-wse@tuxedocomputers.com>
	<87ecj6lj7u.wl-tiwai@suse.de>
	<79bf40d3-6f77-4bf0-93c1-ba48220d7d9a@tuxedocomputers.com>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5B43875C31
X-Spam-Score: -3.51

On Mon, 22 Jun 2026 12:17:00 +0200,
Werner Sembach wrote:
> 
> Hi,
> 
> Am 20.05.26 um 07:53 schrieb Takashi Iwai:
> > On Tue, 19 May 2026 17:49:48 +0200,
> > Werner Sembach wrote:
> >> From: Aaron Erhardt <aer@tuxedocomputers.com>
> >> 
> >> Add a PCI quirk to reduce the volume of the internal microphone to prevent
> >> extremely noisy signal.
> >> 
> >> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
> >> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> >> Cc: stable@vger.kernel.org
> > Applied now.  Thanks.
> 
> Quick question: To which branch exactly? I can't find it here:
> https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/

Hm, it seems slipped into a crack by some reason.
I applied the patch now again to for-linus branch.
Thanks for noticing it.


Takashi
