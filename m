Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB54F438FEE
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 11:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906756; cv=none; b=qmyce7CrCjn3UGw5tpLu8F0zWxioGFB6TUFEw89e8Jx585tni9XBylrlo7Ctk/t6EiUz+Fmuzn7yi8W0YzMWEBhtgrmEKP4XLth5rFyyoZagcWCNdgdwsxHM2h4lVEMXRlsusopYi+6bpgy9SkQAS6VehC7Qj8FyWsQQT/SbX4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906756; c=relaxed/simple;
	bh=WYqGCtMjRBH5nQAdcg9j3M+Xv7tIq/k+n7Qtb/aSp+8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G7FD2Os+K0KQbmz5IbWmSRnIkTzBj5FZhWg6mr2HrACClGoWd94TcbcPu6raoE8O5Vg2MdxlIqP0bTioO5kwu4tfRnibCvGR/06PPkpmDTAXOShU4AsirAXSVua1sF1UixBasfsNmic+OGq9wZK2dP0iph9hsFcKXAQIBBWtPuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r7esUFOI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Og5nedzN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r7esUFOI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Og5nedzN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r7esUFOI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Og5nedzN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r7esUFOI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Og5nedzN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 18BB375880;
	Wed,  1 Jul 2026 11:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782906753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ELG4MR8Ti3Kr23B6GOfj2OWCfOyIrss1QUnVlVkse4s=;
	b=r7esUFOIIw3FyKwepyl61RREniEICLP1sRpmdQnx69RkefThaotmOAKowbf68TZTu+jge/
	6WJ4NDDQhLK8WHZVAc+sqLJQ7d7myVzn9jg98SxyrGfW+QWlJ5Bz+gzYBwCXH64lo+60y1
	hY2NFXXKpAZx2JJHo3rPCZocmX7NwIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782906753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ELG4MR8Ti3Kr23B6GOfj2OWCfOyIrss1QUnVlVkse4s=;
	b=Og5nedzNA2Z5Mr1RONvlJQDxZfwlLC6JHIyhs4J1/U2173o0VaXE85yTAYqULAPWmYZscw
	Q1UNtNLBnbHONBBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782906753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ELG4MR8Ti3Kr23B6GOfj2OWCfOyIrss1QUnVlVkse4s=;
	b=r7esUFOIIw3FyKwepyl61RREniEICLP1sRpmdQnx69RkefThaotmOAKowbf68TZTu+jge/
	6WJ4NDDQhLK8WHZVAc+sqLJQ7d7myVzn9jg98SxyrGfW+QWlJ5Bz+gzYBwCXH64lo+60y1
	hY2NFXXKpAZx2JJHo3rPCZocmX7NwIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782906753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ELG4MR8Ti3Kr23B6GOfj2OWCfOyIrss1QUnVlVkse4s=;
	b=Og5nedzNA2Z5Mr1RONvlJQDxZfwlLC6JHIyhs4J1/U2173o0VaXE85yTAYqULAPWmYZscw
	Q1UNtNLBnbHONBBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E0F4779AA;
	Wed,  1 Jul 2026 11:52:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KoGoHoD/RGreJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 Jul 2026 11:52:32 +0000
Date: Wed, 01 Jul 2026 13:52:31 +0200
Message-ID: <874iijudts.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 12/16] ALSA: hda/core: Add include defining struct hda_device_id
In-Reply-To: <2e365146b67ced2a1897785fcc0c222c382f14fb.1782682124.git.ukleinek@kernel.org>
References: <cover.1782682124.git.ukleinek@kernel.org>
	<2e365146b67ced2a1897785fcc0c222c382f14fb.1782682124.git.ukleinek@kernel.org>
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
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,baylibre.com:email,suse.de:email,suse.de:mid]
X-Spam-Level: 

On Sun, 28 Jun 2026 23:58:47 +0200,
Uwe Kleine-König (The Capable Hub) wrote:
> 
> Traditionally all *_device_id were defined in a single header
> <linux/mod_devicetable.h>. This was split now with the objective that
> only the relevant bits are included. So including <linux/pci.h> won't be
> enough to get a definition of (the unrelated to pci) struct
> hda_device_id.
> 
> Add an explicit include for the header defining struct hda_device_id to
> keep working when <linux/pci.h> stops providing this defintion.
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

I sent wrongly to v2, so again:

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

> ---
>  include/sound/hdaudio.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
> index f11bfc6b9f42..aa994d6e6d35 100644
> --- a/include/sound/hdaudio.h
> +++ b/include/sound/hdaudio.h
> @@ -11,6 +11,7 @@
>  #include <linux/io.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/iopoll.h>
> +#include <linux/device-id/hda.h>
>  #include <linux/pci.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/timecounter.h>
> -- 
> 2.47.3
> 
