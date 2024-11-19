Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4941CBA12
	for <linux-sound@vger.kernel.org>; Tue, 19 Nov 2024 14:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732027437; cv=none; b=Lw8zOk1TamJFAw0yKY7jaMnvDsFt2br72Scr3SfZFi8p/sZ/GqE9JltUwKcgfFq/swV9796I5OQ+17LS8XS/UrgOwyeOYI49YpKDi7pVrs+AvDPDp1032r4orxPNG4Am3GujQqSer+4cIwCRQaNzGYoG60Sd4tpWS1mLiep/j3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732027437; c=relaxed/simple;
	bh=KU8ic4lac9rcBLpJELesfnnUQXUZBSYvaTRIdfg21to=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JycpIdrKwW92cuboUaeHW0lRC26Q6+S0QFQvo8NyDu+DAQbgF6q4mZVlxpWalT8YdZiEAi77H449XmRNTs/B1Sir5oqVi8s5N7f48b5bs8y4mmWEdkLMdid6N1q5K7kczWQV/WZdUnDDdsEMnxbl63F/9Ij6ChZEMDfSIthpnSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ljk8i6jp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0ho7o80w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ljk8i6jp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0ho7o80w; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ljk8i6jp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0ho7o80w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ljk8i6jp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0ho7o80w"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1D1AE1F79C;
	Tue, 19 Nov 2024 14:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732027434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bbDPDyKpdqpSv0lUSkoqpDp3Y0JHVss6xZLZX3wwYSE=;
	b=ljk8i6jpKpJsXA/yJUzBv4of+CWfrDb1qzTD3Sgj+zR6sd4F4kGYGoWz9+09FWPfod9HYh
	JN2g40EJGvKUpyfhQyUhBeK7M2AHjJgfhHr6rppKfPUB3GM4G8Onqnz+1nx4gQHLwLHm8W
	IMwTckOQ8mghnPcnBdXwKqf/RCeMM/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732027434;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bbDPDyKpdqpSv0lUSkoqpDp3Y0JHVss6xZLZX3wwYSE=;
	b=0ho7o80wKvqXhly52xEZ7f/D9scKhKPvJ3mpOy6CMbcb6vkbAngPDTnu6Qpow+6XM26JlU
	Bm3w51fbwRX93DAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ljk8i6jp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0ho7o80w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732027434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bbDPDyKpdqpSv0lUSkoqpDp3Y0JHVss6xZLZX3wwYSE=;
	b=ljk8i6jpKpJsXA/yJUzBv4of+CWfrDb1qzTD3Sgj+zR6sd4F4kGYGoWz9+09FWPfod9HYh
	JN2g40EJGvKUpyfhQyUhBeK7M2AHjJgfhHr6rppKfPUB3GM4G8Onqnz+1nx4gQHLwLHm8W
	IMwTckOQ8mghnPcnBdXwKqf/RCeMM/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732027434;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bbDPDyKpdqpSv0lUSkoqpDp3Y0JHVss6xZLZX3wwYSE=;
	b=0ho7o80wKvqXhly52xEZ7f/D9scKhKPvJ3mpOy6CMbcb6vkbAngPDTnu6Qpow+6XM26JlU
	Bm3w51fbwRX93DAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB4561376E;
	Tue, 19 Nov 2024 14:43:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9AtBOCmkPGcPFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 Nov 2024 14:43:53 +0000
Date: Tue, 19 Nov 2024 15:43:53 +0100
Message-ID: <87mshv5lna.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22Beno=EEt_Sevens=22?= <bsevens@google.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: Fix potential out-of-bound accesses for Extigy devices
In-Reply-To: <20241119142813.3528722-1-bsevens@google.com>
References: <20241119142813.3528722-1-bsevens@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1D1AE1F79C
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 19 Nov 2024 15:28:13 +0100,
Benoît Sevens wrote:
> 
> A bogus devices can provide a bNumConfigurations value that exceeds the
> initial value used in usb_get_configuration for allocating dev->config.
> 
> This can lead to out-of-bounds accesses later, e.g. in
> usb_destroy_configuration.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@kernel.org
> Signed-off-by: Benoît Sevens <bsevens@google.com>
> ---
> v2:
>  - Also add sanity checks to snd_usb_mbox2_boot_quirk and 
>    snd_usb_mbox3_boot_quirk

Thanks for the revised patch.

Although we should fix better in a long term, a duct-tape fix like
this wouldn't hurt.

But one thing I'm considering is...

> @@ -565,8 +566,11 @@ static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_interfac
>  				      0x10, 0x43, 0x0001, 0x000a, NULL, 0);
>  		if (err < 0)
>  			dev_dbg(&dev->dev, "error sending boot message: %d\n", err);
> +		num_configs = dev->descriptor.bNumConfigurations;
>  		err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
>  				&dev->descriptor, sizeof(dev->descriptor));
> +		if (dev->descriptor.bNumConfigurations > num_configs)
> +			dev->descriptor.bNumConfigurations = num_configs;

IMO, we can get the new descriptor locally, then do
compare-and-store.  If bNumConfiguration is unexpectedly large, it can
return an error without modifying the original descriptor.


Takashi
