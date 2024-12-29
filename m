Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38C04D8A3;
	Sun, 29 Dec 2024 10:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735469155; cv=none; b=BvCOUMdvBEU32jloe+VZ1V/u62iNBlCEtofGIu4hYISmMWpdrKST10v2kD+CTcxbuw6NyNi1vubt3qYawUwh/qWSkbfb1diCoA2HVozSfe/DpLsn+44hDZQt7byH6ojzvK3XBoa6Nav6R66dqRXIEDYO9ACHDeJW90Z+t+mdBiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735469155; c=relaxed/simple;
	bh=DPSaPk53InamwdJ4FzGY9JBqFMO9LOFhUFbNrxOdm3U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eEvJ/vKIA2VUKMEagjiR3iBvso+ss+ET6R96aa+u74eTFP8mVquprcA0KGtZ/H/eFFlDmTnZ1QK8wOcQmr9DuiF6JybEQj6xGViAmeM/uN08EbzXJZRx7KbbVdu9Scq84jOLGwpOkiFmFHnBwgH9iYmzNb4Jp87d9zMBsDiu2KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OXS9CeX0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LT4CeOXn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OXS9CeX0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LT4CeOXn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OXS9CeX0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LT4CeOXn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OXS9CeX0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LT4CeOXn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 832C95C72D;
	Sun, 29 Dec 2024 10:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735469150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XhHPC8W+Rp34wDyrhlq0DLHtOBvaUbxDBpfdPfmEyoM=;
	b=OXS9CeX0EL3yYDwXZrYUgZyfMGs21HT56E/iWPOZ59FW7gU+mK/pZ9MyAgZxe/pxJIjkG+
	kN37SlAudp89cd3mEFt0q6pp5ucpqIG2EoPDBdQnEmLsXM+8xsZOE/leyX7vTVW1fqdL9S
	KV55CRXs/IHDmK4MLjTuzOcf2EN8ejY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735469150;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XhHPC8W+Rp34wDyrhlq0DLHtOBvaUbxDBpfdPfmEyoM=;
	b=LT4CeOXnXlk043A/OCF1SY//iN33cMNTFec1kA85QCwNvFvUURvCBS5ITcXyhtoiOMod69
	yPDqSHAIWjBcraDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OXS9CeX0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LT4CeOXn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735469150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XhHPC8W+Rp34wDyrhlq0DLHtOBvaUbxDBpfdPfmEyoM=;
	b=OXS9CeX0EL3yYDwXZrYUgZyfMGs21HT56E/iWPOZ59FW7gU+mK/pZ9MyAgZxe/pxJIjkG+
	kN37SlAudp89cd3mEFt0q6pp5ucpqIG2EoPDBdQnEmLsXM+8xsZOE/leyX7vTVW1fqdL9S
	KV55CRXs/IHDmK4MLjTuzOcf2EN8ejY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735469150;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XhHPC8W+Rp34wDyrhlq0DLHtOBvaUbxDBpfdPfmEyoM=;
	b=LT4CeOXnXlk043A/OCF1SY//iN33cMNTFec1kA85QCwNvFvUURvCBS5ITcXyhtoiOMod69
	yPDqSHAIWjBcraDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4CF7E139D0;
	Sun, 29 Dec 2024 10:45:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LFg6EV4ocWe/XQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Dec 2024 10:45:50 +0000
Date: Sun, 29 Dec 2024 11:45:49 +0100
Message-ID: <87ed1qydgi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kun Hu <huk23@m.fudan.edu.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"jjtan24@m.fudan.edu.cn" <jjtan24@m.fudan.edu.cn>
Subject: Re: Bug: slab-out-of-bounds in snd_seq_oss_synth_sysex
In-Reply-To: <B1CA9370-9EFE-4854-B8F7-435E0B9276C6@m.fudan.edu.cn>
References: <2B7E93E4-B13A-4AE4-8E87-306A8EE9BBB7@m.fudan.edu.cn>
	<B1CA9370-9EFE-4854-B8F7-435E0B9276C6@m.fudan.edu.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 832C95C72D
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Wed, 25 Dec 2024 06:37:47 +0100,
Kun Hu wrote:
> 
> Hello,
> 
> > BUG: KASAN: slab-out-of-bounds in snd_seq_oss_synth_sysex+0x5d1/0x6c0 sound/core/seq/oss/seq_oss_synth.c:516
> 
> We further analyzed the issue at line 516 in ./sound/core/seq/oss/seq_oss_synth.c. 
> The slab-out-of-bounds crash occurs in line 509, when sysex->len = 128. Specifically, the write operation to dest[0] accesses memory beyond the bounds of sysex->buf (128 byte).
> To resolve this issue, we suggest adding 6 lines of code to validate the legality of the address write to sysex->buf before entering the loop:
> 
> if (sysex->len >= MAX_SYSEX_BUFLEN) { 
>    sysex->len = 0; 
>    sysex->skip = 1; 
>    return -EINVAL;  /* Exit early if sysex->len is out of bounds */ 
> }

The only place incrementing sysex->len is that loop and it has already
the bounce check which resets sysex->len to 0.  That is, the likely
reason of the buffer overflow is rather the racy calls of this
function.

If so, a potential fix would be rather to protect the concurrency,
e.g. a simplest form is something like below.
Could you check whether it addresses your problem?


thanks,

Takashi

-- 8< --
--- a/sound/core/seq/oss/seq_oss_synth.c
+++ b/sound/core/seq/oss/seq_oss_synth.c
@@ -66,6 +66,7 @@ static struct seq_oss_synth midi_synth_dev = {
 };
 
 static DEFINE_SPINLOCK(register_lock);
+static DEFINE_MUTEX(sysex_mutex);
 
 /*
  * prototypes
@@ -497,6 +498,7 @@ snd_seq_oss_synth_sysex(struct seq_oss_devinfo *dp, int dev, unsigned char *buf,
 	if (!info)
 		return -ENXIO;
 
+	guard(mutex)(&sysex_mutex);
 	sysex = info->sysex;
 	if (sysex == NULL) {
 		sysex = kzalloc(sizeof(*sysex), GFP_KERNEL);
