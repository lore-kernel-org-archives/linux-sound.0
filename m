Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802695;
	b=R+qEHpvXuG/9XxM1wT4X8X0af41wOcKYh7HiQNNLilX2UkJm1uRZnxHEp8oMUXr/9BUR
	 Jimg3MT0bWwA+wpFXqsk0JfGc5I5DMwmafH3ymTpCaRAF6Jal/gSqtWPmh51XQXe8+hi2
	 45J8Y26IxopUfuKb8NIvFK1d6XYtfOUjEzeEuZb33Wlryrlz9S0wHRsEzWYAyP10zZMOV
	 f3jWvL+JMflisefnNh6eJ4WzSEELgwmRHA66qaEH3PFZKucSGn/ilqjOAo/PmVXMhwxG9
	 xWSFjIjjIIjS3GMmGHIt1w7E8pYqGe1ZurHL0Z8HEwmDJyHXYGYq613WwaeZr/08KzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802695;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=dqhfopeIIdx/ZFcwSsGvUOMgVj9Wd0KqSgqXjdNPhNs=;
	b=s20kiP71SdQm21Q5ieTLXPhR3tDGuV/qRitC4YZqHwfaXfI8UR7hv2kLG5Q6cMYb9osz
	 eZUSi0X78kjw0l/HP0jLQRUmuFCNYINNLN5rPDlIOK86QmvAtBTWwz7SB10gFlMc3NL88
	 l7BPv15LN6rkpDD2CrTirPbuPv9MP2mG1UtF2a2F5nyMuDsQ5tTiCF89zDhelWe4UNBa5
	 Rg7+0T41mvoZYvJg/5M+HkDGtyFbFz0yi3m8afHIxtpE3ey0gBQNyXi9VHzkxQ0uvZ1WZ
	 Z4DdJbuI8Cbbd2FrcO8wSOos3b3Bg6Hjx+2WtSpBuR4CzHnA6xTi5QesSoX+Tq4vtDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iC++uAVN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zsB4adBT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iC++uAVN;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zsB4adBT;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81748606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 14:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81748606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iC++uAVN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zsB4adBT;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iC++uAVN;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zsB4adBT
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B24D421E27;
	Wed,  4 Nov 2026 14:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793802692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dqhfopeIIdx/ZFcwSsGvUOMgVj9Wd0KqSgqXjdNPhNs=;
	b=iC++uAVNXPj5CSyLlinlH26a/tVCYNikpLeVRlP9fp2k4Wr1NKsUEfPPm6hqbiNenXDaHR
	Ml67003enu+Okoe6HMv+I7+kcMW5tlKockM9gwhFy4jvk+ae0WsfSKuHJFvUOq98kCT9y5
	vSnHrPc+S2Zbtj1boaF8/OcjQkRZoh8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793802692;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dqhfopeIIdx/ZFcwSsGvUOMgVj9Wd0KqSgqXjdNPhNs=;
	b=zsB4adBT5yR8N9vClMEVZI3I8qvW6LTF3q5PO+x8Zhqi54rTsvf3lTjxC0ojMPu5Pol6yz
	2ov0DfcAQecp9YDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iC++uAVN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zsB4adBT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793802692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dqhfopeIIdx/ZFcwSsGvUOMgVj9Wd0KqSgqXjdNPhNs=;
	b=iC++uAVNXPj5CSyLlinlH26a/tVCYNikpLeVRlP9fp2k4Wr1NKsUEfPPm6hqbiNenXDaHR
	Ml67003enu+Okoe6HMv+I7+kcMW5tlKockM9gwhFy4jvk+ae0WsfSKuHJFvUOq98kCT9y5
	vSnHrPc+S2Zbtj1boaF8/OcjQkRZoh8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793802692;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dqhfopeIIdx/ZFcwSsGvUOMgVj9Wd0KqSgqXjdNPhNs=;
	b=zsB4adBT5yR8N9vClMEVZI3I8qvW6LTF3q5PO+x8Zhqi54rTsvf3lTjxC0ojMPu5Pol6yz
	2ov0DfcAQecp9YDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 707D1134F0;
	Wed,  4 Nov 2026 14:31:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /V8NFMRB62rXcAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 14:31:32 +0000
Date: Wed, 04 Nov 2026 15:31:32 +0100
Message-ID: <875wycvfaz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Daniel Mack <zonque@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: caiaq: free the EP4 URB when input setup fails
In-Reply-To: <20261104025341.1527407-1-vulab@iscas.ac.cn>
References: <20261104025341.1527407-1-vulab@iscas.ac.cn>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,iscas.ac.cn:email,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: B24D421E27

On Wed, 04 Nov 2026 03:53:41 +0100,
Wentao Liang wrote:
> 
> The three controllers that use the EP4 input URB allocate it before
> checking the endpoint type and before registering the input device. On
> failure they jump to exit_free_idev, which clears cdev->input_dev but
> leaves cdev->ep4_in_urb set. The card teardown then calls
> snd_usb_caiaq_input_free(), which returns early because input_dev is
> NULL, so the URB is never freed.
> 
> Release the URB before dropping the input device on the error path.
> 
> Fixes: 6da7a2aa899f ("ALSA: usb/caiaq: Add support for Traktor Kontrol X1")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Applied now.  Thanks.


Takashi
