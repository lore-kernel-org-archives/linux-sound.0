Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B0E3AA1AE
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777893850; cv=none; b=ZyS5mmrE2y+yCuNBClBRuMVQuOJzQlaf05TUEoqv1QppnSEOEOsRMpvj5TejijI2ZKXRNmYT0a+RfohG6sNEDVuJwBls8Z1c1iJsVEqixvofKWlRFcnV5S9P3nm7K8zjjCIpA0n/zyDDwm++LIQrEbCJZMVtvBOP0vkZ9wBBzcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777893850; c=relaxed/simple;
	bh=/xaRA6a1bUVZB1/i6gV2MdT9Vcl46+6tYmBOdyVqw3M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NROkVCYbY6HfyKSwMwi8C1cwx51y3vyW7ewPkW5yzwezFoTtKHt0WXVLFfpD4swaotOHxJ0VNzV3JeKBmafX8/9j0BZ4nZZig+4RluCGZG3bwkyroEsa/duUaAiuSUDa6hCw67pPAikaJPv2yPvhQMO5DrbSKlBIFxkfz6GA/6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JWZlRS9w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=orhLlNc+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JWZlRS9w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=orhLlNc+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JWZlRS9w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="orhLlNc+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JWZlRS9w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="orhLlNc+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5D7B06B0E1;
	Mon,  4 May 2026 11:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777893844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GWLZdEOwl+7I++CBf8st7gDRkn4xT+9j0ccUdZpMlJs=;
	b=JWZlRS9wOljbNm72xAwT/P3urDszD1bgh6+WqvY0ygUK1141kdDgiL08I/vEEpUy/gny2i
	dLQ8hiCds/J9l3YE5eP0EFqy6nSSJjPVulH0x/V1bjstfc24OE4LcYJoFb6NXlMqzFq5iu
	EiW7G+UJJNocY2V6PiTVm9B0lrRZumU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777893844;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GWLZdEOwl+7I++CBf8st7gDRkn4xT+9j0ccUdZpMlJs=;
	b=orhLlNc+BkBPQpgJxOA3N4U8/16r5n0MHKudn7zCB2n5a96nBjTzSa8F5fRhvNjiTdwH46
	uI9dZW6HqWP3HYCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JWZlRS9w;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=orhLlNc+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777893844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GWLZdEOwl+7I++CBf8st7gDRkn4xT+9j0ccUdZpMlJs=;
	b=JWZlRS9wOljbNm72xAwT/P3urDszD1bgh6+WqvY0ygUK1141kdDgiL08I/vEEpUy/gny2i
	dLQ8hiCds/J9l3YE5eP0EFqy6nSSJjPVulH0x/V1bjstfc24OE4LcYJoFb6NXlMqzFq5iu
	EiW7G+UJJNocY2V6PiTVm9B0lrRZumU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777893844;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GWLZdEOwl+7I++CBf8st7gDRkn4xT+9j0ccUdZpMlJs=;
	b=orhLlNc+BkBPQpgJxOA3N4U8/16r5n0MHKudn7zCB2n5a96nBjTzSa8F5fRhvNjiTdwH46
	uI9dZW6HqWP3HYCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7F96593A3;
	Mon,  4 May 2026 11:24:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id da6NL9OB+GlQGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 May 2026 11:24:03 +0000
Date: Mon, 04 May 2026 13:24:03 +0200
Message-ID: <871pfrzacs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,	Kees Cook
 <kees@kernel.org>,	=?ISO-8859-1?Q?C=E1ssio?= Gabriel
 <cassiogabrielcontato@gmail.com>,	Jihed Chaibi
 <jihed.chaibi.dev@gmail.com>,	Pengpeng Hou <pengpeng@iscas.ac.cn>,	Chandra
 Mohan Sundar <chandramohan.explore@gmail.com>,	Thorsten Blum
 <thorsten.blum@linux.dev>,	Wentao Liang <vulab@iscas.ac.cn>,	Julia Lawall
 <Julia.Lawall@inria.fr>,	Alok Tiwari <alok.a.tiwari@oracle.com>,	tanze
 <tanze@kylinos.cn>,	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org,	Markus
 Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH] ALSA: Consistently define pci_device_ids using named initializers
In-Reply-To: <20260430135255.279393-2-u.kleine-koenig@baylibre.com>
References: <20260430135255.279393-2-u.kleine-koenig@baylibre.com>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,renesas.com,kernel.org,gmail.com,iscas.ac.cn,linux.dev,inria.fr,oracle.com,kylinos.cn,linaro.org,vger.kernel.org,baylibre.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,baylibre.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 5D7B06B0E1
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 

On Thu, 30 Apr 2026 15:52:53 +0200,
Uwe Kleine-König (The Capable Hub) wrote:
> 
> ... and PCI device helpers.
> 
> The various struct pci_device_id arrays were initialized mostly by list
> expressions, some of them using the PCI_DEVICE macros. This isn't easily
> readable if you're not into PCI. Using named initializers is more
> explicit and thus easier to parse. Also use PCI_DEVICE* helper macros to
> assign .vendor, .device, .subvendor and .subdevice where appropriate and
> skip explicit assignments of 0 (which the compiler takes care of).
> 
> The secret plan is to make struct pci_device_id::driver_data an
> anonymous union (similar to
> https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylibre.com/)
> and that requires named initializers. But it's also a nice cleanup on
> its own.
> 
> This change doesn't introduce changes to the compiled pci_device_id
> array. Tested on x86 and arm64.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> the mentioned follow-up quest allows to do
> 
>  		PCI_DEVICE_SUB(HPI_PCI_VENDOR_ID_TI, HPI_PCI_DEV_ID_DSP6205,
>  			       HPI_PCI_VENDOR_ID_AUDIOSCIENCE, PCI_ANY_ID),
> -		.driver_data = (kernel_ulong_t)HPI_6205,
> +		.driver_data_ptr = HPI_6205,
> 
> which gets rid of a bunch of casts and so brings a little bit more type
> safety. This patch is a preparation for that.
> 
> I assume a single patch for all of sound is fine. If not please instruct how I
> should split the patch. (per driver?)

As it's a systematic change and no conflict is found, I took to
for-next branch as is now.


thanks,

Takashi
