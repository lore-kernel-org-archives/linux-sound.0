Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D5434D39B
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 12:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772712382; cv=none; b=rBevdjo0KRAGtyHhc1WpPyN2H3WhJNmeKcJLZC5B7d2tEZJ4BO3lueK6fQkTmZPTAACUTbi6TLTjINvRDwUN88iwyw/utKyoAvpWyBh3TGiGB2uXkaGJ3sbxZGGjYgWoFLmwacOQdP5IABoDMnea2nUIihr2N8x3k9BNHXNx2Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772712382; c=relaxed/simple;
	bh=Anla+cJ3kITCraJksjzttG4Cf6VRU36PV/A6JPi2MYc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CKhSz5vu2i6Wor11RuNzWWeDhFDMo1CfOMra480zumhYufEm2Gn5W0DoLrtPCYXLA7CS3CZccMUsjCVUR6pBpZltt3C4wHvgpo9MLIkjB0TZYEkUJKy9YQBxrN78Ix+SRJaFWnPid0ESte5TgmiTE7GsLVKRqBhd5sihQm5AIOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RGl8OapF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qUUgRgB0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RGl8OapF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qUUgRgB0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RGl8OapF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qUUgRgB0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RGl8OapF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qUUgRgB0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2B8923F8B9;
	Thu,  5 Mar 2026 12:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772712378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gJXTdx1MKMMJfyk0njEpoROsLmNc1AYKWhDHTGqMYgU=;
	b=RGl8OapFItQ7G/VlbMqObQdNxYkA6vW5MvTXPuZaoD9MoakF0w7J8F4Y/7M+OkkbORJkn3
	xkHfWGlZdASXfGDLhHlKn+flDbFoZ/SjlAGO3eUugV2ZX3/e1ORG00kI4V0Ex9BBXIVk1c
	UfkAibk4I/WUcTC2ZK59bc91Ik7w6fM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772712378;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gJXTdx1MKMMJfyk0njEpoROsLmNc1AYKWhDHTGqMYgU=;
	b=qUUgRgB0T4Em8RtpQH4FIIxfP7aPReTCoYly74VYDr4wjNF3qW70H7BexXXoIoZOL1ME9s
	/bUKjc8YRXG5pbAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RGl8OapF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qUUgRgB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772712378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gJXTdx1MKMMJfyk0njEpoROsLmNc1AYKWhDHTGqMYgU=;
	b=RGl8OapFItQ7G/VlbMqObQdNxYkA6vW5MvTXPuZaoD9MoakF0w7J8F4Y/7M+OkkbORJkn3
	xkHfWGlZdASXfGDLhHlKn+flDbFoZ/SjlAGO3eUugV2ZX3/e1ORG00kI4V0Ex9BBXIVk1c
	UfkAibk4I/WUcTC2ZK59bc91Ik7w6fM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772712378;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gJXTdx1MKMMJfyk0njEpoROsLmNc1AYKWhDHTGqMYgU=;
	b=qUUgRgB0T4Em8RtpQH4FIIxfP7aPReTCoYly74VYDr4wjNF3qW70H7BexXXoIoZOL1ME9s
	/bUKjc8YRXG5pbAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C9F313EA68;
	Thu,  5 Mar 2026 12:06:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id F9QPMLlxqWk3WQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Mar 2026 12:06:17 +0000
Date: Thu, 05 Mar 2026 13:06:17 +0100
Message-ID: <874imuxyyu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Terry Junge <linuxsound@cosmicgizmosystems.com>
Cc: Rong Zhang <i@rong.moe>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Arun Raghavan <arunr@valvesoftware.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH 4/9] ALSA: usb-audio: Support string-descriptor-based quirk table entry
In-Reply-To: <b59da54a-9c80-4212-a337-c5ea98da52d1@cosmicgizmosystems.com>
References: <20260301213726.428505-1-i@rong.moe>
	<20260301213726.428505-5-i@rong.moe>
	<b59da54a-9c80-4212-a337-c5ea98da52d1@cosmicgizmosystems.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2B8923F8B9

On Thu, 05 Mar 2026 07:13:32 +0100,
Terry Junge wrote:
> 
> 
> 
> On 3/1/26 1:37 PM, Rong Zhang wrote:
> > Some quirky devices do not have a unique VID/PID. Matching them using
> > DEVICE_FLG() or VENDOR_FLG() may result in conflicts.
> > 
> > Add two new macros DEVICE_STRING_FLG() and VENDOR_STRING_FLG() to match
> > USB string descriptors (manufacturer and/or product) in addition to VID
> > and/or PID, so that we can deconflict these devices safely.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> >  sound/usb/quirks.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 82 insertions(+)
> > 
> > diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> > index c6a78efbcaa30..495dd46ce515c 100644
> > --- a/sound/usb/quirks.c
> > +++ b/sound/usb/quirks.c
> > @@ -2,8 +2,10 @@
> >  /*
> >   */
> >  
> > +#include <linux/build_bug.h>
> >  #include <linux/init.h>
> >  #include <linux/slab.h>
> > +#include <linux/string.h>
> >  #include <linux/usb.h>
> >  #include <linux/usb/audio.h>
> >  #include <linux/usb/midi.h>
> > @@ -2135,16 +2137,39 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
> >  /*
> >   * driver behavior quirk flags
> >   */
> > +struct usb_string_match {
> > +	const char *manufacturer;
> > +	const char *product;
> > +};
> > +
> >  struct usb_audio_quirk_flags_table {
> >  	u32 id;
> >  	u32 flags;
> > +	const struct usb_string_match *usb_string_match;
> >  };
> >  
> >  #define DEVICE_FLG(vid, pid, _flags) \
> >  	{ .id = USB_ID(vid, pid), .flags = (_flags) }
> >  #define VENDOR_FLG(vid, _flags) DEVICE_FLG(vid, 0, _flags)
> >  
> > +/* Use as a last resort if using DEVICE_FLG() is prone to VID/PID conflicts. */
> > +#define DEVICE_STRING_FLG(vid, pid, _manufacturer, _product, _flags)	\
> > +{									\
> > +	.id = USB_ID(vid, pid),						\
> > +	.usb_string_match = &(const struct usb_string_match) {		\
> > +		.manufacturer = _manufacturer,				\
> > +		.product = _product,					\
> > +	},								\
> > +	.flags = (_flags),						\
> > +}
> > +
> > +/* Use as a last resort if using VENDOR_FLG() is prone to VID conflicts. */
> > +#define VENDOR_STRING_FLG(vid, _manufacturer, _flags)			\
> > +	DEVICE_STRING_FLG(vid, 0, _manufacturer, NULL, _flags)
> > +
> >  static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
> > +	/* Device and string descriptor matches */
> > +
> >  	/* Device matches */
> >  	DEVICE_FLG(0x001f, 0x0b21, /* AB13X USB Audio */
> >  		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
> > @@ -2414,6 +2439,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
> >  	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
> >  		   QUIRK_FLAG_ALIGN_TRANSFER),
> >  
> > +	/* Vendor and string descriptor matches */
> > +
> >  	/* Vendor matches */
> >  	VENDOR_FLG(0x045e, /* MS Lifecam */
> >  		   QUIRK_FLAG_GET_SAMPLE_RATE),
> > @@ -2558,14 +2585,69 @@ void snd_usb_apply_flag_dbg(const char *reason,
> >  	}
> >  }
> >  
> > +#define USB_STRING_SIZE 128
> > +
> > +static inline int snd_usb_get_strings(struct snd_usb_audio *chip,
> > +				      char *manufacturer, char *product)
> 
> Hi Rong,
> 
> This function is not necessary.
> Both the manufacturer and product strings can be found in struct usb_device.
> 
> If the device has a manufacturer string then chip->dev->manufacturer points to it.
> Otherwise chip->dev->manufacturer is null.
> 
> Likewise, chip->dev->product points to the product string if there is one, else null.
> 
> > +{
> > +	int ret;
> > +
> > +	if (manufacturer) {
> > +		ret = usb_string(chip->dev, chip->dev->descriptor.iManufacturer,
> > +				 manufacturer, USB_STRING_SIZE);
> > +		if (ret < 0) {
> > +			usb_audio_warn(chip, "failed to get manufacturer string: %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	if (product) {
> > +		ret = usb_string(chip->dev, chip->dev->descriptor.iProduct,
> > +				 product, USB_STRING_SIZE);
> > +		if (ret < 0) {
> > +			usb_audio_warn(chip, "failed to get product string: %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	return 1; /* ok */
> > +}
> > +
> >  void snd_usb_init_quirk_flags_table(struct snd_usb_audio *chip)
> >  {
> >  	const struct usb_audio_quirk_flags_table *p;
> > +	char manufacturer[USB_STRING_SIZE];
> > +	char product[USB_STRING_SIZE];
> > +	int got_usb_strings = 0; /* <0: error, 0: pending, >0: ok */
> >  
> >  	for (p = quirk_flags_table; p->id; p++) {
> >  		if (chip->usb_id == p->id ||
> >  		    (!USB_ID_PRODUCT(p->id) &&
> >  		     USB_ID_VENDOR(chip->usb_id) == USB_ID_VENDOR(p->id))) {
> > +			if (!p->usb_string_match)
> > +				goto apply; /* DEVICE_FLG or VENDOR_FLG */
> > +
> > +			/* DEVICE_STRING_FLG or VENDOR_STRING_FLG */
> > +			if (!got_usb_strings) {
> > +				got_usb_strings = snd_usb_get_strings(chip,
> > +					p->usb_string_match->manufacturer ? manufacturer : NULL,
> > +					p->usb_string_match->product ? product : NULL);
> > +			}
> 
> No need to get the strings as they can be found at chip->dev->manufacturer and chip->dev->product
> if the device declared them.
> 
> > +
> > +			BUILD_BUG_ON(!got_usb_strings);
> > +
> > +			if (got_usb_strings < 0)
> > +				continue;
> > +
> > +			if (p->usb_string_match->manufacturer &&
> > +			    strcmp(p->usb_string_match->manufacturer, manufacturer))
> > +				continue;
> 
> Examples and intent:
> 
> DEVICE_STRING_FLG(vid, pid, "acme", "alpha", flags) // match vid, pid, "acme", and "alpha" strings
> DEVICE_STRING_FLG(vid, pid, "acme", "", flags) // match vid, pid, "acme", and device has no product string
> DEVICE_STRING_FLG(vid, pid, "acme", 0, flags) // match vid, pid, "acme", and any product string
> DEVICE_STRING_FLG(vid, pid, 0, "alpha", flags) // match vid, pid, any manufacturer string, and "alpha"
> DEVICE_STRING_FLG(vid, pid, "", "alpha", flags) // match vid, pid, no manufacturer string, and "alpha"
> DEVICE_STRING_FLG(vid, pid, "", "", flags) // match vid, pid, no manufacturer, and no product strings
> 
> This test would change to something like
> 
> 	if (p->usb_string_match->manufacturer &&
> 	    strcmp(p->usb_string_match->manufacturer, chip->dev->manufacturer ? chip->dev->manufacturer : ""))
> 		continue; 
> 
> > +
> > +			if (p->usb_string_match->product &&
> > +			    strcmp(p->usb_string_match->product, product))
> > +				continue;
> 
> Same here but product instead of manufacturer.

Thanks, that's good to know!

Rong, could you submit the cleanup patch?  I already applied your
series, so write on top of sound.git tree for-next branch.

I'll work on a clean up of the other existing code in USB-audio, too.


Takashi
