Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720D24500E
	for <linux-sound@vger.kernel.org>; Fri, 22 Nov 2024 12:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732277379; cv=none; b=mRJvzLpdyUni5Z8y4mbl6qR5Z8+3ak7JLSjp9LYmsr974G1jPn7kguSVux8MK7AlsLC9ghfGyzvTFAtRfBM+Qt0a+ociUptpEPmYumKGHHRfNVT0TfGdXUJVAq1MCT6/tG7k3skonNzHA90qqVrCd7pTXDz1NpbbYJZ44qL9ZK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732277379; c=relaxed/simple;
	bh=AgrMGtDEVNAMO4WGPw2r8cs9r+ngUe8ADqIe96ugll0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nHzudc3yJ9MiW+zWCjv5Mx2Ufd9whZlkgL0mfMHLjtkd3sS+esw3XGNvSEsQjp/TeDT8NTeLs4n8GQ2X4lvbbeEO9ktUusb0dND5PXWwHbzbIjx+PArhHfmbvmitv6bCMW/ajOAlExK0ud0Ugvfr5AJQaEuZuyzhgLtw75bK9xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YNPEVB3D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gsTI0ahb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YNPEVB3D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gsTI0ahb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YNPEVB3D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gsTI0ahb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YNPEVB3D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gsTI0ahb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7EBAB1F396;
	Fri, 22 Nov 2024 12:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732277375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2Quh3j/8bkF3f+01yFkmWz1/le3qT2iXjoKgD8rODc=;
	b=YNPEVB3DfHqouXyHKsFv+D912wLRGP0Z9ivfVRC7SSIJaPgAjXLZ+CvomapNTYOFA1rVeo
	URsyin4SWMRLT96YT+SFeG6e0aoU/oCWL5RoVXOHflt1ZyicWE1bl4i9kqvwBOkDmFM/bI
	JnIyRVP/wjPXX1q+J0WBcpBvzxWVrCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732277375;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2Quh3j/8bkF3f+01yFkmWz1/le3qT2iXjoKgD8rODc=;
	b=gsTI0ahbfp4XAY+y51aNa8FQ3iQCVRAzsOOOVM/ZZnl2UlteGu5bQuex6WSVWsqq65AoUk
	qIWOJtX2VqSMD0CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YNPEVB3D;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gsTI0ahb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732277375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2Quh3j/8bkF3f+01yFkmWz1/le3qT2iXjoKgD8rODc=;
	b=YNPEVB3DfHqouXyHKsFv+D912wLRGP0Z9ivfVRC7SSIJaPgAjXLZ+CvomapNTYOFA1rVeo
	URsyin4SWMRLT96YT+SFeG6e0aoU/oCWL5RoVXOHflt1ZyicWE1bl4i9kqvwBOkDmFM/bI
	JnIyRVP/wjPXX1q+J0WBcpBvzxWVrCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732277375;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2Quh3j/8bkF3f+01yFkmWz1/le3qT2iXjoKgD8rODc=;
	b=gsTI0ahbfp4XAY+y51aNa8FQ3iQCVRAzsOOOVM/ZZnl2UlteGu5bQuex6WSVWsqq65AoUk
	qIWOJtX2VqSMD0CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5661A138A7;
	Fri, 22 Nov 2024 12:09:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xnPPE390QGfKPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 22 Nov 2024 12:09:35 +0000
Date: Fri, 22 Nov 2024 13:09:34 +0100
Message-ID: <87frnj1ncx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Beno=EEt?= Sevens <bsevens@google.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix out of bounds reads when finding clock sources
In-Reply-To: <CAGCho0Ueh4cVZy+nUrzCiXZm1VoHNXRya8oU-F2Q7k0ggUEnsA@mail.gmail.com>
References: <20241121140613.3651-1-bsevens@google.com>
	<877c8w3aez.wl-tiwai@suse.de>
	<CAGCho0Ueh4cVZy+nUrzCiXZm1VoHNXRya8oU-F2Q7k0ggUEnsA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7EBAB1F396
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Fri, 22 Nov 2024 11:06:57 +0100,
Benoît Sevens wrote:
> 
> Hi Takashi,
> 
> Thank you for the review. Except for one question below, this patch
> looks good to me. Would you like me to send your patch as a revised
> patch to this mailing list?

I'm going to submit the proper patch if the fix works for you.

> On Thu, 21 Nov 2024 at 15:53, Takashi Iwai <tiwai@suse.de> wrote:
> > @@ -65,13 +73,23 @@ static bool validate_clock_selector(void *p, int id, int proto)
> >  {
> >         union uac23_clock_selector_desc *cs = p;
> >
> > -       return GET_VAL(cs, proto, bClockID) == id;
> > +       if (!DESC_LENGTH_CHECK(cs, proto))
> > +               return false;
> > +       if (GET_VAL(cs, proto, bClockID) != id)
> > +               return false;
> > +       /* additional length check for baCSourceID, bmControls and iClockSelector */
> > +       if (proto == UAC_VERSION_3)
> > +               return cs->v3.bLength >= sizeof(cs->v3.bLength) + cs->v3.bNrInPins + 6;
> 
> Why can't we just do this here?
> 
>  return cs->v3.bLength >= sizeof(cs->v3) + cs->v3.bNrInPins;

Argh, it was just a wrong check.

But the clock selector descriptor must have two more fields in
addition to baCSourceID array.  Those two are 6 bytes (= 4 bytes for
bmControls + 2 bytes for wCSelectorDescrStr) for UAC3, while...

> > +       else
> > +               return cs->v2.bLength >= sizeof(cs->v2.bLength) + cs->v2.bNrInPins + 2;
> 
> And same question here, why not:
> 
>  return cs->v2.bLength >= sizeof(cs->v2) + cs->v2.bNrInPins;

... for UAC2, they are 2 bytes (= 1 byte for bmControls + 1 byte for
iClockSelector).  So those numbers appeared in the patch.

Below is the revised patch.  Let me know if this works for you.


thanks,

Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: usb-audio: Fix out of bounds reads when finding clock sources

The current USB-audio driver code doesn't check bLength of each
descriptor at traversing for clock descriptors.  That is, when a
device provides a bogus descriptor with a shorter bLength, the driver
might hit out-of-bounds reads.

For addressing it, this patch adds sanity checks to the validator
functions for the clock descriptor traversal.  When the descriptor
length is shorter than expected, it's skipped in the loop.

For the clock source and clock multiplier descriptors, we can just
check bLength against the sizeof() of each descriptor type.
OTOH, the clock selector descriptor of UAC2 and UAC3 has an array
of bNrInPins elements and two more fields at its tail, hence those
have to be checked in addition to the sizeof() check.

Reported-by: Benoît Sevens <bsevens@google.com>
Link: https://lore.kernel.org/20241121140613.3651-1-bsevens@google.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/clock.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 8f85200292f3..842ba5b801ea 100644
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
 
@@ -65,13 +73,27 @@ static bool validate_clock_selector(void *p, int id, int proto)
 {
 	union uac23_clock_selector_desc *cs = p;
 
-	return GET_VAL(cs, proto, bClockID) == id;
+	if (!DESC_LENGTH_CHECK(cs, proto))
+		return false;
+	if (GET_VAL(cs, proto, bClockID) != id)
+		return false;
+	/* additional length check for baCSourceID array (in bNrInPins size)
+	 * and two more fields (which sizes depend on the protocol)
+	 */
+	if (proto == UAC_VERSION_3)
+		return cs->v3.bLength >= sizeof(cs->v3) + cs->v3.bNrInPins +
+			4 /* bmControls */ + 2 /* wCSelectorDescrStr */;
+	else
+		return cs->v2.bLength >= sizeof(cs->v2) + cs->v2.bNrInPins +
+			1 /* bmControls */ + 1 /* iClockSelector */;
 }
 
 static bool validate_clock_multiplier(void *p, int id, int proto)
 {
 	union uac23_clock_multiplier_desc *cs = p;
 
+	if (!DESC_LENGTH_CHECK(cs, proto))
+		return false;
 	return GET_VAL(cs, proto, bClockID) == id;
 }
 
-- 
2.43.0

