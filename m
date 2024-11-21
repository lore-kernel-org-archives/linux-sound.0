Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1581CB331
	for <linux-sound@vger.kernel.org>; Thu, 21 Nov 2024 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732200841; cv=none; b=A9UHl6RwIAkXts58HjAqiWqSP1xAW2j+QqHM6BHifhbUS7WoxjfBU7q+pxWeZXJ5FHPjMd08+PPohAM9p4PCyRPl0YqERy7IAEMpuRFk7tjiv852U+1Y19S/MYsiO6aN6Mcp7lXelz0JwgzIx79dtR8NDhB/lvQwuq11AwTEVqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732200841; c=relaxed/simple;
	bh=sFVPZVVT7utBoZ/AX9636Nf7a8OuZVapaWPgUnXEQFM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l77rHMBlcflNwM0DAyUoF9usGmhHpbeJCtO3CLFr3AFjjcCi8H96drEotgcITQNvD0UjIQe1curE34L6JRP01wFeGbLfPrQK29u4ibCDcUucCi1zz8jXTvFyoix9xK/Yra9Yuj6bDzR9DDQcKcnM5a2jNF3jB3OI40F/iM4dlMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HJ314Xtb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v56Ebpl6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HJ314Xtb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v56Ebpl6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HJ314Xtb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v56Ebpl6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HJ314Xtb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v56Ebpl6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 681E1219C4;
	Thu, 21 Nov 2024 14:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732200837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2zxnhwWheWpBzUGcF5OUKspjfjGFD2vYChkG9giDnCA=;
	b=HJ314Xtbk2QRw1YnVjAplOcmEbI+M6TpThjmKU8CoyneCSsBKlBEcR4Fx05HMeK38MxnzV
	X5pEfSVeGhlDRDayRZFxl+BhV+fXXDHWCfIjPjwkQeCnM9WGUrr+dUib4pSXRvuJzOc/c5
	z1S2bFVyRcG+vaHZDnX+SZMMqjw6RAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732200837;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2zxnhwWheWpBzUGcF5OUKspjfjGFD2vYChkG9giDnCA=;
	b=v56Ebpl6hao5E+d9lqikDXJUxqdPsa/6ZjilNtGk5LDYReNySDehWuBkI+ciK/fUj10ORq
	lJ9VnxPYn2ZoVJDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HJ314Xtb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=v56Ebpl6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732200837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2zxnhwWheWpBzUGcF5OUKspjfjGFD2vYChkG9giDnCA=;
	b=HJ314Xtbk2QRw1YnVjAplOcmEbI+M6TpThjmKU8CoyneCSsBKlBEcR4Fx05HMeK38MxnzV
	X5pEfSVeGhlDRDayRZFxl+BhV+fXXDHWCfIjPjwkQeCnM9WGUrr+dUib4pSXRvuJzOc/c5
	z1S2bFVyRcG+vaHZDnX+SZMMqjw6RAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732200837;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2zxnhwWheWpBzUGcF5OUKspjfjGFD2vYChkG9giDnCA=;
	b=v56Ebpl6hao5E+d9lqikDXJUxqdPsa/6ZjilNtGk5LDYReNySDehWuBkI+ciK/fUj10ORq
	lJ9VnxPYn2ZoVJDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40FFE137CF;
	Thu, 21 Nov 2024 14:53:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uXuZDoVJP2d4QgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 21 Nov 2024 14:53:57 +0000
Date: Thu, 21 Nov 2024 15:53:56 +0100
Message-ID: <877c8w3aez.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22Beno=EEt_Sevens=22?= <bsevens@google.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix out of bounds reads when finding clock sources
In-Reply-To: <20241121140613.3651-1-bsevens@google.com>
References: <20241121140613.3651-1-bsevens@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 681E1219C4
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 21 Nov 2024 15:06:13 +0100,
Benoît Sevens wrote:
> 
> A bogus device can provide a clock selector descriptor that contains a
> bNrInPins that is larger than the actual size of baCSourceID. This can
> lead to out-of-bound reads in __uac_clock_find_source. These out-of-bound
> values can be leaked back to the device via the uac_clock_selector_get_val
> calls.
> 
> Fixes: 79f920fbff56 ("ALSA: usb-audio: parse clock topology of UAC2 devices")
> CC: stable@kernel.org
> Signed-off-by: Benoît Sevens <bsevens@google.com>
> ---
>  sound/usb/clock.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/usb/clock.c b/sound/usb/clock.c
> index 8f85200292f3..94fb628f116e 100644
> --- a/sound/usb/clock.c
> +++ b/sound/usb/clock.c
> @@ -270,7 +270,7 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
>  	union uac23_clock_source_desc *source;
>  	union uac23_clock_selector_desc *selector;
>  	union uac23_clock_multiplier_desc *multiplier;
> -	int ret, i, cur, err, pins, clock_id;
> +	int ret, i, cur, err, length, pins, clock_id;
>  	const u8 *sources;
>  	int proto = fmt->protocol;
>  	bool readable, writeable;
> @@ -301,11 +301,19 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
>  
>  	selector = snd_usb_find_clock_selector(chip, entity_id, fmt);
>  	if (selector) {
> +		length = GET_VAL(selector, proto, bLength);
>  		pins = GET_VAL(selector, proto, bNrInPins);
>  		clock_id = GET_VAL(selector, proto, bClockID);
>  		sources = GET_VAL(selector, proto, baCSourceID);
>  		cur = 0;
>  
> +		if (length < sizeof(selector) + pins) {

This happens to be correct because the size of both
uac_clock_selector_descriptor and uac3_clock_selector_descriptor are
same.  Otherwise we'd have to pass sizeof() of the corresponding
struct depending on the proto value.  So it's worth to comment here.

BTW, now I noticed that we didn't check the size at traversing the
descriptors.  This means that the driver might read at a wrong
position even before the point this patch addresses.  For covering it,
we need additional checks in the validator code.  And this size check
of clock selectors can be put there, too.

That is, something like below (totally untested).

It'll lead to a different behavior from your patch, though; currently,
when no suitable clock selector is found, it check the multiplier and
this might match.  So I'm not entirely sure, but just wanted to tell
you that it's another option.


thanks,

Takashi

--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -36,6 +36,12 @@ union uac23_clock_multiplier_desc {
 	struct uac_clock_multiplier_descriptor v3;
 };
 
+/* check whether the descriptor bLength has the minimal length */
+#define DESC_LENGTH_CHECK(p, proto) \
+	((proto) == UAC_VERSION_3 ? \
+	 ((p)->v3.bLength >= sizeof((p)->v3)) :	\
+	 ((p)->v2.bLength >= sizeof((p)->v2)))
+
 #define GET_VAL(p, proto, field) \
 	((proto) == UAC_VERSION_3 ? (p)->v3.field : (p)->v2.field)
 
@@ -58,6 +64,8 @@ static bool validate_clock_source(void *p, int id, int proto)
 {
 	union uac23_clock_source_desc *cs = p;
 
+	if (!DESC_LENGTH_CHECK(cs, proto))
+		return false;
 	return GET_VAL(cs, proto, bClockID) == id;
 }
 
@@ -65,13 +73,23 @@ static bool validate_clock_selector(void *p, int id, int proto)
 {
 	union uac23_clock_selector_desc *cs = p;
 
-	return GET_VAL(cs, proto, bClockID) == id;
+	if (!DESC_LENGTH_CHECK(cs, proto))
+		return false;
+	if (GET_VAL(cs, proto, bClockID) != id)
+		return false;
+	/* additional length check for baCSourceID, bmControls and iClockSelector */
+	if (proto == UAC_VERSION_3)
+		return cs->v3.bLength >= sizeof(cs->v3.bLength) + cs->v3.bNrInPins + 6;
+	else
+		return cs->v2.bLength >= sizeof(cs->v2.bLength) + cs->v2.bNrInPins + 2;
 }
 
 static bool validate_clock_multiplier(void *p, int id, int proto)
 {
 	union uac23_clock_multiplier_desc *cs = p;
 
+	if (!DESC_LENGTH_CHECK(cs, proto))
+		return false;
 	return GET_VAL(cs, proto, bClockID) == id;
 }
 
