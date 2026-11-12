Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502554;
	b=W+/FN/ls0XnXMYvMQa3WvdngXsObZPmlzrIHh3KxYdFYBI+03Pr8f0VYbFGj/GBockuC
	 BPEx/RJMcstuTl+m6MJ9s736PDNC/hUI2rWJU6AQg83rU9jrYm4c6FoFzL+i2NfpdZisB
	 0MfkDQn/ZFjbilMT+gUP+TIpYc0KQ7MvwmbsTNiYfE61G6FO/ckM9LqShInRaOP7yrCua
	 mmcb+qxvSFhyIODXY01otWW6zmOUAbRxekXt4EIidjHY392dPV4N14OI5J93GzFAJY6fG
	 rZSjjBEBwteCm0SBHJjiItu1UrnP/QZkigtRNoM8O1e47n2FjPBIlUGpfqlHmCCr5ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502554;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=nvBQSyyOqSRXv7/f5yKicoOyU+Ht+VLIPusGOHMy888=;
	b=sTtQjSS2sMEBavD/DDQOheUX+3QqthuJwOX4XGygYAYzTbWtoZX1DrNbI41Zy2vb7ob/
	 JJWxVbN2FtQ9vleHDRddmutQ338y6CSt1YH4ClUveIqZsTaumrlK0qZlfWInimSy1Bplp
	 R2nzhR9h3d9RQ2TAD9lfW0fdx7G6wRxWyNttucETk1YrYnIKSRIPGrYCRxotTWjK3mHOF
	 SNzkz9sjYooDqY6D/aPR51NmkYKiMsdEOjY61ZAYYTc8vJmBwfPIVIY2q1CEN1qpkz1dB
	 VkDMFefjAF7o4M94gMJxmMN82Sq62dEmbk3OAuREskD0kX0jetXY4F9ggzSE4tx8b4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PN4vYuwE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="VjABWD//";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="Iam7/2Is";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tBNJVEzm;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4952D606A323
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 16:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4952D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PN4vYuwE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VjABWD//;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Iam7/2Is;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tBNJVEzm
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E76BD1F7C6;
	Thu, 12 Nov 2026 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794502552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nvBQSyyOqSRXv7/f5yKicoOyU+Ht+VLIPusGOHMy888=;
	b=PN4vYuwEtkCY2mMQWnra+XWXc954Ac2EvCiGHsflxHMXAiWzmDoo8RJyET6C8Xr24CFjwW
	l40y1nTwxMLZ7w6DNEV8Jg71QpkoVoP0SZPGBbH8WIBgzFdCTnzO6D3CBHwSg5Y0SPLMK8
	TsFs6aGlmG8uCJPNy4Qfd2E8IFEc52E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794502552;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nvBQSyyOqSRXv7/f5yKicoOyU+Ht+VLIPusGOHMy888=;
	b=VjABWD//9bW1V+OJkuag76bVTsXXAunmnd47X7HnKOMqApwGEz1a9t577ATRrXVqGiOkOA
	bSaPv5+fdJJfXbBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Iam7/2Is";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tBNJVEzm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794502551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nvBQSyyOqSRXv7/f5yKicoOyU+Ht+VLIPusGOHMy888=;
	b=Iam7/2Is4uafEgnKkd7g0GqshjDTGFyOzIpQNTFy8NxwxvQzjlZk1bzPZRoV2JHPnqlKfY
	lJFuWfwet4aQh3zyfFa3XNHgP2oWHvHDE8KhWBD9ERxtP2+yHaj7FdHJQBstuSsxGV+SdU
	N1AGqWKe5fG9wEe9xS+ZS6uZnnZ25V0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794502551;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nvBQSyyOqSRXv7/f5yKicoOyU+Ht+VLIPusGOHMy888=;
	b=tBNJVEzmkWCD8qNpwRwHXsOdBmJpqJrXpiEBHExETb9CDDojaxqRWS7l+LPXEqg4OyIrSO
	EeQwgqg374msJBAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3A3C13432;
	Thu, 12 Nov 2026 16:55:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id phScHpfv9WrDXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Nov 2026 16:55:51 +0000
Date: Thu, 12 Nov 2026 17:55:51 +0100
Message-ID: <87se16q99k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: ferringb@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Subject: [PATCH 0/2] ALSA: usb-audio: Mixer quirks for ASRock X870E Taichi
In-Reply-To: <20261108-alc4082-taichi-v1-0-942558088157@gmail.com>
References: <20261108-alc4082-taichi-v1-0-942558088157@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: E76BD1F7C6
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.51

On Sun, 08 Nov 2026 19:58:36 +0100,
Brian Harring via B4 Relay wrote:
> 
> The ASRock X870E Taichi / Taichi Lite onboard audio (26ce:0a0b, Realtek
> ALC4082) has its headphone volume control misassigned to the rear
> output, resulting in the rear output being full volume and only
> mutable, and the headphones falling back to software control.
> 
> Patch 1 uses the existing ALC4080 map to correct the assignment. This is
> a fix: the headphones get their actual hardware control, and the rear
> output falls back to software.
> 
> Patch 2 adds a hardware volume control for the rear output through the
> ESS ES9219 DAC behind it.
> 
> Validation was against alsa-ucm-conf 1.2.16 and a 7.3.3 kernel. The
> resultant changes to the PipeWire sinks are below:
> 
> 7.3.3:
>   SPDIF       HARDWARE HW_MUTE_CTRL DECIBEL_VOLUME LATENCY
>   Speaker     HARDWARE HW_MUTE_CTRL HW_VOLUME_CTRL DECIBEL_VOLUME LATENCY
>   Headphones  HARDWARE DECIBEL_VOLUME LATENCY
> 
> with remap:
>   SPDIF       HARDWARE HW_MUTE_CTRL DECIBEL_VOLUME LATENCY
>   Speaker     HARDWARE HW_MUTE_CTRL DECIBEL_VOLUME LATENCY
>   Headphones  HARDWARE HW_MUTE_CTRL HW_VOLUME_CTRL DECIBEL_VOLUME LATENCY
> 
> with remap + ES9219:
>   SPDIF       HARDWARE HW_MUTE_CTRL DECIBEL_VOLUME LATENCY
>   Speaker     HARDWARE HW_MUTE_CTRL HW_VOLUME_CTRL DECIBEL_VOLUME LATENCY
>   Headphones  HARDWARE HW_MUTE_CTRL HW_VOLUME_CTRL DECIBEL_VOLUME LATENCY
> 
> Signed-off-by: Brian Harring <ferringb@gmail.com>
> ---
> Brian Harring (2):
>       ALSA: usb-audio: Use ALC4080 mixer map for ASRock X870E Taichi
>       ALSA: usb-audio: Add ES9219 speaker volume for ASRock X870E Taichi

There have been a couple of issues reported by Sashiko.
Could you take a look?


thanks,

Takashi
