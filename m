Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD074AA573
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 11:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595335; cv=none; b=Z2UjasxfUJnRofPXKJn7Y1j5nC6qUxjlo+ti1c59oYaflnS61sq1fsovuoKGIRQlvsKJQctZmy8BVv8rLfzfTsZR8RS9uNGwudvFkQCQ7GV7ebaH9gzHdQFazajf8tnfRFc9jv72trNKtJmR62gOdGL2FfEkrvdcmXkPbuLXtwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595335; c=relaxed/simple;
	bh=yWySZ/lxWun2M2D+jBAVzIKXrI2pNVBsNOAoN1jMg9I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KaOfAKxX8yEvUEKxKvbrzqIrKG0MZ/9a8ecviDaIRhUcBDTi24Nct0ShkU6vIBfrLhaEy78sNHNUoXJjbsmtlnj99t28IJ8C0drz+nlu1kYMLXme2qG1yVjLDnY1Ub6fMRoJ3mvYYikbFg0rF+WepZkFg74i30PvHYSWKrno0gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PNR1pgtf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0+u06xEl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rGpN9hxc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Swqm1316; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PNR1pgtf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0+u06xEl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rGpN9hxc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Swqm1316"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 35EAE21BE9;
	Mon, 28 Sep 2026 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790595328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rcMOyyztws5ugI0wyHT8EtQ5qg+ZuwowXjfy46QMFvw=;
	b=PNR1pgtfupePivY6uNfO9lvRKO/YN6E+0hhqaddw0HpbX6SBE2+0lL1T0t/TZMzIJFKa2x
	tRG06x4Olgvvx23VcFrD1efZeVuyQ08CIL5mQnVIoiorrIs0cs0p+V1QHlRWrEmjXE7UR4
	gXS5coSSQYzxvagACobMSkAnkSkr/yk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790595328;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rcMOyyztws5ugI0wyHT8EtQ5qg+ZuwowXjfy46QMFvw=;
	b=0+u06xEl2WuvFfCyQqgx3ETRM7tZLn01XCgdyhoppKDsKB9JpVaILXgNNzw1RSap0AstJg
	eAYQWVI02swnydDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rGpN9hxc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Swqm1316
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790595324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rcMOyyztws5ugI0wyHT8EtQ5qg+ZuwowXjfy46QMFvw=;
	b=rGpN9hxc87Z3EkKP6RRLIgg5SxZAtGavSuKInlAOSvWtN7b9VSBMEZ9eZIpqY0nFa7lhwK
	sjydi2R83PTV9uXj1fQ3P5YXZsHjgBhoHvjjvkynlLVpoz0qRoxTWe8yWfQR1ZV3/ae+cM
	I8/5JRemaKcgjDWnmNXKrKcEzPNjVyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790595324;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rcMOyyztws5ugI0wyHT8EtQ5qg+ZuwowXjfy46QMFvw=;
	b=Swqm1316gnXcLqvRtNrZCt5Q+gEccsmCjyID3hT2uWhspjb0i+wtdjaiosjA5W8YAkHSZv
	uGpkmQwTljqutMBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE9291340F;
	Mon, 28 Sep 2026 11:35:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qbi5KvtQumoCRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 11:35:23 +0000
Date: Mon, 28 Sep 2026 13:35:23 +0200
Message-ID: <87y0cl622s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: KIM MinWoo <phrimm136@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	shenghao-ding@ti.com
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo ThinkBook 16p Gen 3 ARH (21EK)
In-Reply-To: <20260923013756.106033-1-phrimm136@gmail.com>
References: <20260923013756.106033-1-phrimm136@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 35EAE21BE9
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Wed, 23 Sep 2026 03:37:56 +0200,
KIM MinWoo wrote:
> 
> The ThinkBook 16p Gen 3 ARH (SSID 17aa:3871) has a TI TAS2563
> amplifier device on I2C, exposed by ACPI as INT8866, the same
> arrangement as the Yoga 7 14ARB7 (SSID 17aa:3870). Without a quirk,
> the codec falls back to the vendor-wide Lenovo quirk
> (ALC269_FIXUP_LENOVO_XPAD_ACPI), the amplifier is never bound, and the
> internal speakers stay silent while the headphone output works.
> 
> Reuse the Yoga 7 14ARB7 fixup, which binds the INT8866 device as a side
> codec. ALC287_FIXUP_TAS2781_I2C does not work on this machine because it
> looks for a TIAS2781 device.
> 
> Assisted-by: LLM
> Signed-off-by: KIM MinWoo <phrimm136@gmail.com>

Applied now.  Thanks.


Takashi
