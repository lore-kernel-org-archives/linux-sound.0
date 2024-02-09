Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03BD69949
	for <linux-sound@vger.kernel.org>; Fri,  9 Feb 2024 10:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707474256; cv=none; b=HV6R3EaR/hnWbqbarFtCsbd5xxYqySbsbxKQkV/74eVzeH0P3ebsDxI6rblEI4rqi8vKqUL51HfvV4M67lGJNYP5mD/lVg1VH797qWPwp/VbMRTJFpGUzLVr7vCwP1IZLaHckXDwTdgaIHh2DM3l2S9DyWaQbV/MPT/tctUotUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707474256; c=relaxed/simple;
	bh=rhUKBC3ZoFw6TKeK6W2g9pnGOQCUeKxm4CcsWITxwJ0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mn7QiZV/J8br57kHtaGsmLWzbiM22v+fGtZI3XMbfk4khet51KSNInlNy9XKs+yLMMTmQHBxYkC7ULCBhoM7P7IN/WhwlbYkntkyU8fw50cOWl28DILJTLKYrigGQVj3x1tAh5bWK60JYlfD6FRS1UmI1vlghzBCTU+Daoe+tXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lWpwKFI1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MJbzWaRe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lWpwKFI1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MJbzWaRe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lWpwKFI1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MJbzWaRe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lWpwKFI1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MJbzWaRe"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 170FF1F7F9;
	Fri,  9 Feb 2024 10:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707474253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJGoREx3oNd9iQNrnxhvNgyZufx3AbDH02QXNG6LokA=;
	b=lWpwKFI1NmwJF2JydkOvFclhtSA/7TvhJru09cQCD2YNfnso7pjk6i1kCyvf8KxcBCz0RZ
	Ws3vmjN5jo0AztshOub7VGED5xbPjzZDALFDNwzzMg3FwxmKmLYsLLpOzaoYHIo16K0TAT
	TV5xLw86KU1Dv0O/Seqtb7SKJSiECaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707474253;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJGoREx3oNd9iQNrnxhvNgyZufx3AbDH02QXNG6LokA=;
	b=MJbzWaReHr1RAl3UEXustT2VYWed+pvFUwXvyOkERdNysJ9dYpVBtuoij0bXzAQtSAH1Hw
	yG163bABQMFiDBAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707474253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJGoREx3oNd9iQNrnxhvNgyZufx3AbDH02QXNG6LokA=;
	b=lWpwKFI1NmwJF2JydkOvFclhtSA/7TvhJru09cQCD2YNfnso7pjk6i1kCyvf8KxcBCz0RZ
	Ws3vmjN5jo0AztshOub7VGED5xbPjzZDALFDNwzzMg3FwxmKmLYsLLpOzaoYHIo16K0TAT
	TV5xLw86KU1Dv0O/Seqtb7SKJSiECaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707474253;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJGoREx3oNd9iQNrnxhvNgyZufx3AbDH02QXNG6LokA=;
	b=MJbzWaReHr1RAl3UEXustT2VYWed+pvFUwXvyOkERdNysJ9dYpVBtuoij0bXzAQtSAH1Hw
	yG163bABQMFiDBAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D2F091326D;
	Fri,  9 Feb 2024 10:24:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D3TdMUz9xWWIIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 09 Feb 2024 10:24:12 +0000
Date: Fri, 09 Feb 2024 11:24:12 +0100
Message-ID: <871q9m2awj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org,	alsa-devel@alsa-project.org,
	broonie@kernel.org,	"Sayed, Karimuddin" <karimuddin.sayed@intel.com>,
	=?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add "Intel Reference board" SSID in the ALC256.
In-Reply-To: <20240208163904.92977-1-pierre-louis.bossart@linux.intel.com>
References: <20240208163904.92977-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lWpwKFI1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MJbzWaRe
X-Spamd-Result: default: False [-1.72 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.41)[97.30%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 170FF1F7F9
X-Spam-Level: 
X-Spam-Score: -1.72
X-Spam-Flag: NO

On Thu, 08 Feb 2024 17:39:04 +0100,
Pierre-Louis Bossart wrote:
> 
> From: "Sayed, Karimuddin" <karimuddin.sayed@intel.com>
> 
> Add "Intel Reference board" SSID in the alc256.
> Enable "power saving mode" and Enable "headset jack mode".
> 
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Sayed, Karimuddin <karimuddin.sayed@intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks, applied.


Takashi
