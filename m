Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D104768ED
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 13:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706103789; cv=none; b=FE/LgpYx3EmzoIhJJTiiQceaHA8u1Ay62OfkLIkZ11Zko7/G/F5flQ+Jv6Cx+FBqrSCwcTV91HfJ5z2WD8PaoVCfDXvYyEBP8i4IV2Dty254MBb0omHWcHdOcnC9wfLrkx2j1eAKy953kqmc4INXljcqTZOZ/Cn3JoDRkWP9EnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706103789; c=relaxed/simple;
	bh=nkAotLyZ5Ng/DaPYsWK9QeaLF+wn6esNxN8Mwt3b7f8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aIF7t22/+36+3764/F5fK0COWs72YdHdfvlgQoLhQiD5eZh3MrzXkNuPLSQunvnBF1yJviJUiaz9zWC9y/3jppnHlmqNrNbuAmzWTjJXoRjmubt2z8YQHjV3N5R7I1a7gGWNv7dY+4SfC9O49yDeM01hv01GBeoQBY2VB+9eYZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XDicCsap; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jbgfGNAx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XDicCsap; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jbgfGNAx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XDicCsap";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jbgfGNAx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XDicCsap";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jbgfGNAx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A4A942207B;
	Wed, 24 Jan 2024 13:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706103785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1anflcwFcVwLIVQvPiwYBJsTkzqqW8iu01FAwWfbepk=;
	b=XDicCsapv3FJVKgbsEBG53FM8XB/oPRwwIR2Ax9PIXe+XbZ1aPlll2cNIwoE1LIbzzJaCX
	oWIJmHPaJFMrs8b20rWFtyY3kTASXQohnmz+aohJhXzYfP8NkZTaYhEeCdYOw9Uym7mJlY
	pSonHPCx1t1kLpvyofGx/wRwCgTwn5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706103785;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1anflcwFcVwLIVQvPiwYBJsTkzqqW8iu01FAwWfbepk=;
	b=jbgfGNAxj9NcUKeGnXxRY32tYyJpzBjSEQB0DRWC0nC3Z/SS6qkp/J5RNbTNqTRNkBLbFI
	DbiB/osmNU7XDbAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706103785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1anflcwFcVwLIVQvPiwYBJsTkzqqW8iu01FAwWfbepk=;
	b=XDicCsapv3FJVKgbsEBG53FM8XB/oPRwwIR2Ax9PIXe+XbZ1aPlll2cNIwoE1LIbzzJaCX
	oWIJmHPaJFMrs8b20rWFtyY3kTASXQohnmz+aohJhXzYfP8NkZTaYhEeCdYOw9Uym7mJlY
	pSonHPCx1t1kLpvyofGx/wRwCgTwn5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706103785;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1anflcwFcVwLIVQvPiwYBJsTkzqqW8iu01FAwWfbepk=;
	b=jbgfGNAxj9NcUKeGnXxRY32tYyJpzBjSEQB0DRWC0nC3Z/SS6qkp/J5RNbTNqTRNkBLbFI
	DbiB/osmNU7XDbAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65D8E13786;
	Wed, 24 Jan 2024 13:43:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nO4cF+kTsWUQSwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 24 Jan 2024 13:43:05 +0000
Date: Wed, 24 Jan 2024 14:43:04 +0100
Message-ID: <87r0i6ludz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jacob Siverskog <jacob@teenage.engineering>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: fix typo
In-Reply-To: <20240124101827.35433-1-jacob@teenage.engineering>
References: <20240124101827.35433-1-jacob@teenage.engineering>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-1.80 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.70)[98.69%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.80

On Wed, 24 Jan 2024 11:18:24 +0100,
Jacob Siverskog wrote:
> 
> fix typo in midi fallback log.
> 
> Signed-off-by: Jacob Siverskog <jacob@teenage.engineering>

Applied now.  Thanks.


Takashi
