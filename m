Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA293DE431;
	Sun, 16 Aug 2026 10:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786877124; cv=none; b=XvqJ+MzsnwoMDYB/oImTnQJcOTGEa/Xbb6qjZnztWyTNpHjoVhnLmYWR1jzUy8XbJLBBCKj+YJdo1MvZk0RFvLWzatARMoRkWdhhmgt+kNyz2NLMyqVShtjjvarSn7Vm5zADBEnZFyZkvxTXwFfdWHP4U5L+yF0RgBVRQkgjqa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786877124; c=relaxed/simple;
	bh=fkOg9DmI9WV4d8yBTIF3G/YQn+bniu4WBvHcZyP6y74=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GfN7naUybvHgQmu5q7ruIx3HXM9RP/5sbyThzxgU4+Th4yUBbguOjcxxo1xxLF5CflOk6AhKOzNc+UOI6ZwqA23qEvbX8LWulDmFRvQp9tgZ3OVoco57q15FB46HXz9qqad0gpKHgKtIZz9Ol5tkXTWte9i9ShHte7v8IYM7V8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yUZmGXKi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TA3TXGmd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q//FA7NU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pkcCgiNL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yUZmGXKi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TA3TXGmd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q//FA7NU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pkcCgiNL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 64B123E26;
	Sun, 16 Aug 2026 10:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786877115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Npe+l7sDwI12GUu0tf1QJN9xJ0kq7sr2w5gh6bPYel0=;
	b=yUZmGXKiP1YyDBZvaee1LGafwB4VyFv9v0I4La4YiCYicn77jMVICc2eLPUvX6HacNf94d
	hGkRhfQvX4zQuuh3yF3geQeI+zQdhYTQfZHN10JTNXU80ubfwo3l8ShoVrfsLleGOykwAZ
	EzjIyijcB5vCTekTVKgy0HVQLwZ9eqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786877115;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Npe+l7sDwI12GUu0tf1QJN9xJ0kq7sr2w5gh6bPYel0=;
	b=TA3TXGmdacmFDyoQ3nUE7BlO+l/aBgi9Bg8F/ousltrTGHy7FDBFjXpbVPfEsY9G8ZM2kJ
	OZYAZVXk1oEbCwAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Q//FA7NU";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pkcCgiNL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786877111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Npe+l7sDwI12GUu0tf1QJN9xJ0kq7sr2w5gh6bPYel0=;
	b=Q//FA7NUMtV0nQHlV9isaXb445XV7frLhCCXpokNV188JzV0JFlmitVRaACqRB1V9EdrlP
	P1OwLkwCZ6T5HPSub6aCRKEkQQhtFlthht1ki+18JffSfSOeiCurbM7PutKBW7FiBTXif6
	/9JFrd0WryfBBWvZ/ZuZAnzuNAJZfLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786877111;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Npe+l7sDwI12GUu0tf1QJN9xJ0kq7sr2w5gh6bPYel0=;
	b=pkcCgiNLlnV98pel10XQShsn+5u4vYaKRiCG3S88W1Op4ar44Nqy94d9LqGdGco4yegmyg
	czSWVQXPxg0VHnBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 31E1678E6D;
	Sun, 16 Aug 2026 10:45:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FVF7CreUgWoibQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 16 Aug 2026 10:45:11 +0000
Date: Sun, 16 Aug 2026 12:45:10 +0200
Message-ID: <87v79acpjd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix Lenovo Yoga Slim 7 14AKP10 quirk ordering
In-Reply-To: <20260814125937.788663-1-zhangheng@kylinos.cn>
References: <20260814125937.788663-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 64B123E26
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Fri, 14 Aug 2026 14:59:37 +0200,
Zhang Heng wrote:
> 
> The Yoga Slim 7 14AKP10 has a PCI SSID of 17aa:38b4 but a codec SSID of
> 17aa:391a. The current quirk table contains a PCI quirk for 17aa:38b4
> (for the Legion Slim 7 16IRH8) which matches first, so the codec-specific
> quirk for 17aa:391a is never applied.
> 
> This results in the wrong fixup being used (CS35L41_I2C_2 instead of the
> correct bass speaker fixup), leaving the internal speakers misconfigured
> or silent.
> 
> Move the 17aa:391a entry to a position before the 17aa:38b4 entry and
> change it from SND_PCI_QUIRK to HDA_CODEC_QUIRK, because it should match
> on the codec subsystem ID rather than the PCI SSID.
> 
> With this change, the correct ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN is
> applied, restoring speaker output and auto-mute functionality.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221298
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Could you put a comment line for the reason of unexpected positioning?


thanks,

Takashi
