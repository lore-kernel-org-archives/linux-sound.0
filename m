Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35685480DD2
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 11:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906669; cv=none; b=dU7XeYGF0ouRw5cds0iGv4EduvJ5RjqLomQzjnlACa8nCXxMpVKnoAjS35PE3ESXaHnVNeSolR1pOlw5kYiLRsp6L9ZJ99CXgOezGcVxRUMy9yI99wHfbUopA1rH0ppoWxw+qJGHXhBWOZDUoBuM3mskyKjEUJz+UKMeyxBevTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906669; c=relaxed/simple;
	bh=yC1CZzg/3fqqnuY41klr84pWOyt1eGqDQIwbsSVrT8U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iXpIsLbtyUl5hdDuswaTZhKipUZGFt5P0zNlCUKRWAD60tCteVupzwVO2le7jGX+zOEx7AbMwsXa+q7uzErm1o16jnHyZr3oJjqR+7y7U9H+BGpZKF6C9ra7AbX1mdzkt1RuGpFAW4auJ42/a6UJQV+ZIFAS3OnTJehnC2qQqi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qf69D3gK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nV84afN3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rUgUijO2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tUqhtkHC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qf69D3gK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nV84afN3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rUgUijO2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tUqhtkHC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BDE3073A75;
	Wed,  1 Jul 2026 11:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782906664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m9p1kGSBG25NzeXwA0AFI8Vp3Y4a+TK3KJ3BnKXqKfM=;
	b=Qf69D3gK3uQ+GqP0RoSVP5uXzvP8yIg4SQvrp5SuXRe3vjSP/YzllIs9PKd9ctfd0A05Ci
	1xznvT4h1MUulDgx6rFzDz71/3L2qqkCizf34weab99lMXC6xLqyB/ohPa5coX2n3dB+fo
	9EC06Iug1kdP6Q1bIKPFeXqWBnSlxUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782906664;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m9p1kGSBG25NzeXwA0AFI8Vp3Y4a+TK3KJ3BnKXqKfM=;
	b=nV84afN3EpV2gdgLQjbey6f3m55RUwYbDqadtwZ1lE/nxIYrciYFVHis8cfcYe1GbQphjP
	k/EZgqEKTZ2z+SCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rUgUijO2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tUqhtkHC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782906662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m9p1kGSBG25NzeXwA0AFI8Vp3Y4a+TK3KJ3BnKXqKfM=;
	b=rUgUijO2mHEElNMf1QsBQzAwWSMTDwDek9obG/zLUzYyC5wGYXl5WX7Y/nua55UBVvfsuy
	dZ89dg/0xU2lemSeWUJvLNZlODYR8aBB+5pAWOxCqA/pNQYqgr+D3v471W4qTJN26uMx/q
	8Xdmege1S+zv7FfA0P7VWZabs1oypdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782906662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m9p1kGSBG25NzeXwA0AFI8Vp3Y4a+TK3KJ3BnKXqKfM=;
	b=tUqhtkHCY5R6vR4n+amsyDeFyY4+wh4J5PBxTkWy0Cao7b6JJg0coqtgjMSHzjj1nsrHRT
	5wOfbmIRDjmcezDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8377E779AA;
	Wed,  1 Jul 2026 11:51:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k8TfHib/RGpfJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 Jul 2026 11:51:02 +0000
Date: Wed, 01 Jul 2026 13:51:02 +0200
Message-ID: <875x2zudw9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/17] ALSA: hda/core: Add include defining struct hda_device_id
In-Reply-To: <1da60e376d9ef64b79d898c54fa58fef53d8168e.1782490566.git.u.kleine-koenig@baylibre.com>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
	<1da60e376d9ef64b79d898c54fa58fef53d8168e.1782490566.git.u.kleine-koenig@baylibre.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: BDE3073A75
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Fri, 26 Jun 2026 20:00:32 +0200,
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
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

> ---
>  include/sound/hdaudio.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
> index f11bfc6b9f42..e268ff9e9aa0 100644
> --- a/include/sound/hdaudio.h
> +++ b/include/sound/hdaudio.h
> @@ -11,6 +11,7 @@
>  #include <linux/io.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/iopoll.h>
> +#include <linux/mod_device_id/hda.h>
>  #include <linux/pci.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/timecounter.h>
> -- 
> 2.47.3
> 
