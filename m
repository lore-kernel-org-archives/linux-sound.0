Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EEC30F94B
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 12:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700363; cv=none; b=hmkff/iPKe+TYAtDKa7n9amm6xu+vRoC02jwjjiNAG4AqQV+pyDgmxV+P2OJt5UFAdxqG9qbeRrr6WRPFHVbGKFEqas32LOCZZ46LgHCuw6FVxGgyiwI7Og2XKvNYxZjR/iYCvumuii6ZbNfxlrzmf62SqZFyry2QP8c/Lfvz70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700363; c=relaxed/simple;
	bh=i9g03N7D54yF9sMe8RFTPPjmtQpwyzES9iFfzpB/bNE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=As63BYJQqq27rsO7U5mKSyu/fxKMXRXrjakRDQrkVTMb2UUIRzZxUH5WhMCT73Mh8Z/Yyi2+btkVCc0xXkGRfdPfvdMDPIhUJXrAdrJp04WDhB21YzaAYw5J036RFuzjs5Hk+U3lvX7Yn7/WrutWATif75OVFgEqU5fw8P3pquo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cPkMsXm4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CIn1342z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PjlJk0Bu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EX30Sbw6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cPkMsXm4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CIn1342z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PjlJk0Bu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EX30Sbw6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0FE716BEE1;
	Wed, 17 Jun 2026 12:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781700360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=54f14rgX1uReFjEZaR6JrLIQuS9s9nMHHXdq5+cl6BA=;
	b=cPkMsXm42Av7ObcG7zlKURDL7zGlGHtBKnrkSzVn2AAyTYvlh+BhZL9JKM8VaI0ac1DwiS
	qy0PeOqWQ571JUB0h6BoV4+3gRKyaHqy/uGbTs5oJrjhrc5w5IZh4BjG2gTjHj02XjphRi
	MWD9+PZ5w8ZFiUIFmrnrSndAuKAxLD0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781700360;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=54f14rgX1uReFjEZaR6JrLIQuS9s9nMHHXdq5+cl6BA=;
	b=CIn1342zffcqAStzX289sMKUo1kyIhbBz0IBIuCaIul2mAnCkjX9RdKgIuZvzO/696PgWF
	5NVwn7jUJMQGptBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PjlJk0Bu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EX30Sbw6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781700359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=54f14rgX1uReFjEZaR6JrLIQuS9s9nMHHXdq5+cl6BA=;
	b=PjlJk0BuYRYdJbomYgNp5TSQ4FfRcf5g3U8BafpHAUo208kocRVRUtEKmMjHapRV2RZdTc
	wN/SeDbpSd/oEhlmKGQjAZmrLPAtdmMkhVUp/iX27NSODzrVi5LptEelJ6A06E8VL20KBF
	u3itS3/GFVru1JDY4kAAnuGOzUO+TkY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781700359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=54f14rgX1uReFjEZaR6JrLIQuS9s9nMHHXdq5+cl6BA=;
	b=EX30Sbw6L7ze/oBRrUcJ4c9WBJPP+QDw0LOJHAcKlPNPKXRHca4KgoJLZSd+vPl8oynIS+
	GI25UYbsmlx7+wBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D6E42779A8;
	Wed, 17 Jun 2026 12:45:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7vk7MwaXMmqJNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Jun 2026 12:45:58 +0000
Date: Wed, 17 Jun 2026 14:45:58 +0200
Message-ID: <87eci5pc6x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Daniel Mack <zonque@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: ALSA: caiaq: possible out of bounds read in Traktor Kontrol S4 dispatch
In-Reply-To: <178169970022.2950989.3295624331262791202@maoyixie.com>
References: <178169970022.2950989.3295624331262791202@maoyixie.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0FE716BEE1
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
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
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Wed, 17 Jun 2026 14:35:00 +0200,
Maoyi Xie wrote:
> 
> Hi all,
> 
> I think the Traktor Kontrol S4 input path in sound/usb/caiaq/input.c can read
> past the end of the URB buffer when the device sends a reply whose length is
> not a multiple of 16. I would appreciate it if you could take a look.
> 
> The dispatch loop walks the reply in fixed 16 byte blocks.
> 
> 	while (len) {
> 		unsigned int i, block_id = (buf[0] << 8) | buf[1];
> 		...
> 		len -= TKS4_MSGBLOCK_SIZE;
> 		buf += TKS4_MSGBLOCK_SIZE;
> 	}
> 
> Each pass reads up to buf[15] and then does len -= 16. But len is the raw
> device length. It comes straight from urb->actual_length in
> snd_usb_caiaq_ep4_reply_dispatch and there is no check that it is a multiple
> of 16. The X1 and Maschine arms in that same handler do bound check the
> length, but the S4 arm does not.
> 
> If len is not a multiple of 16, say 8, the final len -= 16 underflows because
> len is unsigned. The loop condition while (len) then stays true and the walk
> keeps consuming 16 byte blocks far past the end of the buffer. That is an out
> of bounds read. The buffer is cdev->ep4_in_buf of size EP4_BUFSIZE.
> 
> The attacker model is a malicious or emulated USB device that claims the
> Native Instruments Traktor Kontrol S4 id and returns a short reply on its bulk
> in endpoint once the input device is opened.
> 
> I reproduced this under KASAN on 7.1-rc7. A length of one whole block runs the
> loop once and reads nothing past the buffer. A length of 8 underflows and
> KASAN reports a slab out of bounds read just past the allocation.
> 
> The fix I tried is to only consume a block when a whole block is present.
> 
> 	-	while (len) {
> 	+	while (len >= TKS4_MSGBLOCK_SIZE) {
> 
> That stops the decrement from underflowing and drops any trailing partial
> block.
> 
> Does this look like a real bug to you? If the direction is right I am happy to
> send a proper patch with a Fixes tag pointing at 15c5ab607045 ("ALSA:
> snd-usb-caiaq: Add support for Traktor Kontrol S4").

Yes, feel free to submit the patch.

BTW, it seems that there are lots of other places missing the length
check, and we'd need to paper over them, too:
snd_caiaq_input_read_analog(), snd_caiaq_input_read_erp(),
snd_caiaq_input_read_io(), and snd_usb_caiaq_maschine_dispatch().


thanks,

Takashi
