Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882022701CB
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 18:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773512568; cv=none; b=Rv26gtIU/3RU0GHErP1n39dyCVVGx5xOQIO1SkTRT3JFqGiEHluUYXWeBqoq9buOHgu1i3sSmH2VTMiCYJOrwhxpuxnmIg1NOpG47WHRQ3TCGeR3mfnL7JxFrxMluiFArK9g2o8r3KjrguUJW4aa+RntAWGWGFtXY8+S+4WckNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773512568; c=relaxed/simple;
	bh=MdmXY2GXew3PZuMW9rQw+epMoKON3b5tfGh93QdDJkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYLTgUBGf2fZVPum1zTZOywoYJhBfBYzZDLhDQJdUXftlUqvmQoEcK6HoRCchGiF43iFncEIDOai2CekPqrZEUOkIGvPnt7hlKT5XI77XM7hgIG4vIMAcABuoNwIFqUCVeqFn4xi5Ioxwh+eLYGVSaDrC7/S5jh6eq+WT3fhR5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+1/y/GS; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+1/y/GS"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12732e6a123so1832110c88.1
        for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 11:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773512567; x=1774117367; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NZy4YaOyfC8HFH6Zek8NYX9XPjKHBMRjSMS52NotXW0=;
        b=X+1/y/GSYGygcvV+QVm8woFRFuPszmxCQF71E3wFg30OUUj6zEf3feTy1EFWTUL51T
         0SfB6JBO3Em7ol9bFGviF+exu+YnPUfaGXbDtr1elyZhdSCpEOCMOAmsKRK3qYooXiGa
         Ft4U4DzW0aFic8re5RT/4wEU6pOgGJI+N2heOrYoTFzBoDx1OIF+OEJE/vByFm7ozlsW
         utBkbw/UDSWF7JJAkdrmWa5GpvGfk9NSpogWwf6UP6ZeF15LCFcim2vjlrMs3jwAV3X4
         udEKJ8TrMjTHhyUF2r1amhKuyWhxkMvjuwob8itSEck0LHuQnARgyobMBtvXLyN2RnH6
         CBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773512567; x=1774117367;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZy4YaOyfC8HFH6Zek8NYX9XPjKHBMRjSMS52NotXW0=;
        b=NMXKxuKJjCVMXWyviwHKo7h1yOh/1JE8za9I3FwuLM+pbdTOrm0Y/V9djRYhq01vni
         Kr38jk8oW3ZW4xzQ+JoG02BuK17xSxzpeh8lfR8z6loLzI1MQGILVbnqtxA8tCRpGmhG
         FHtdZ5oDAl56NdzbYQIbZGVouspWDL7l22XX70eAARxF19wp3NaorOCDqfqwUrQJsZzx
         Y/pJnEmm8C4nLZm74U27rF8luqX4Zen49podWHw06ZAG8zqMwxD44d9tY3CcXZzxooZq
         zfgAeCTsLibqSCrB2AlLl9grkOSjxSe0GlZBpqWj1qvdGcesONj09mLVmClqpAuA6swc
         1lsA==
X-Forwarded-Encrypted: i=1; AJvYcCVuH6cF1/Rv2rW3RDdK8L2ehvi8oMJj2YYYd+KNCDQ+0IUH0urdysoEr4ileXHe6l+Mtd1K2nMgb6W+4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEUDt6Ft2tQ9ZMLQGm8OQi0ed7yKBuX6VaWiJJ8A1QcLS3HnxO
	71cq8VpsnQ7OGdNWVb5piLxm6UfBBlYqvMMRlaDgtgBUdleqNBokzPDK
X-Gm-Gg: ATEYQzwp+GPikOYuG1vQKNnpfLfTrEgBPV33vXKDU/ALbyb9hsR5ipDwK6At0bUhW/g
	GCnSXVJMZu6r+7HlF4zVlkPHEP6rDwWD4D/pWrVGG8IOjM8UWhnqpZBIHl1MVcmgE4km32gjMCX
	jZDXR/IT1NW89uXRlGBAxh6p/mAJHuo3R3C7ioqBZBAZOSFBGdY3TKt3qiDcfFh5kmpFJRXqmcz
	skhCfg1eR4b3rb32UbPCQKYxXfKdpJee7EWF6Zb0dVd15yJx17w1FEXZ/g/IPwALKLJRh9lUDM2
	AUOGXzOzgv7wscQjd2GIlN+GFh3x/KFpdreW3gxPy3LrM/PJIQEo/S4/H18KRhbOVaDK77BDHcj
	xpkorxPI/sjNMOoqJUy8yLLoF51pSSFmVNBwHUXiLTWqt+wDx8I0ePSUqgQKtN2uBydv8QTtWsb
	hZOCSuBpy3kiVJyWx9CbrPZNwuA5a++3aI6Wff17qSdn8jgPVkED9qMPFfF794VoEJVzHQPugy6
	hnRGVdI
X-Received: by 2002:a05:7022:684:b0:124:9e46:82d6 with SMTP id a92af1059eb24-128f3dc59dfmr3469949c88.25.1773512566456;
        Sat, 14 Mar 2026 11:22:46 -0700 (PDT)
Received: from localhost (177-4-161-109.user3p.v-tal.net.br. [177.4.161.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3a156bsm7615443eec.4.2026.03.14.11.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 11:22:45 -0700 (PDT)
Date: Sat, 14 Mar 2026 15:22:41 -0300
From: =?utf-8?Q?C=C3=A1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
	Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: validate full match when resolving
 quirk aliases
Message-ID: <abWms_JJJrU8ThwV@ortodist>
References: <20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com>
 <87sea2a5hz.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sea2a5hz.wl-tiwai@suse.de>

On Sat, Mar 14, 2026 at 02:46:16PM +0100, Takashi Iwai wrote:
> On Sat, 14 Mar 2026 04:34:46 +0100,
> Cássio Gabriel wrote:
> > 
> > get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
> > usb_audio_ids[], but it currently checks only the vendor/product pair.
> > 
> > This can make an aliased ID pick the first entry with a matching
> > vid:pid even when that entry also depends on interface descriptor
> > fields that do not match the actual device or interface.
> > 
> > Fix it by re-checking each aliased candidate with usb_match_one_id()
> > against the real interface before returning the quirk.
> > 
> > Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> > ---
> >  sound/usb/card.c | 21 ++++++++++++++++-----
> >  1 file changed, 16 insertions(+), 5 deletions(-)
> > 
> > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > index 270dad84d825..ff4418017763 100644
> > --- a/sound/usb/card.c
> > +++ b/sound/usb/card.c
> > @@ -870,17 +870,28 @@ static void find_last_interface(struct snd_usb_audio *chip)
> >  
> >  /* look for the corresponding quirk */
> >  static const struct snd_usb_audio_quirk *
> > -get_alias_quirk(struct usb_device *dev, unsigned int id)
> > +get_alias_quirk(struct usb_interface *intf, unsigned int id)
> >  {
> >  	const struct usb_device_id *p;
> > +	struct usb_device_id id_alias;
> >  
> >  	for (p = usb_audio_ids; p->match_flags; p++) {
> > -		/* FIXME: this checks only vendor:product pair in the list */
> >  		if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) ==
> >  		    USB_DEVICE_ID_MATCH_DEVICE &&
> >  		    p->idVendor == USB_ID_VENDOR(id) &&
> > -		    p->idProduct == USB_ID_PRODUCT(id))
> > -			return (const struct snd_usb_audio_quirk *)p->driver_info;
> > +		    p->idProduct == USB_ID_PRODUCT(id)) {
> > +			/*
> > +			 * Re-check the aliased entry against the actual
> > +			 * interface descriptors instead of matching only
> > +			 * the vendor/product pair.
> > +			 */
> > +			id_alias = *p;
> > +			id_alias.idVendor = USB_ID_VENDOR(id);
> > +			id_alias.idProduct = USB_ID_PRODUCT(id);
> > +
> > +			if (usb_match_one_id(intf, &id_alias))
> 
> Hmm, is this really a correct logic?
> 
> In this case, USB_ID_VENDOR(id) and USB_ID_PRODUCT(id) are very same
> as p->idVendor and p->idProduct, hence id_alias and *p are identical,
> i.e. you're basically comparing against *p.
> 
> I suppose you wanted to substitute the original device vendor/product
> IDs there instead?

Hi,

Yes, what I actually wanted was to keep the alias lookup by vid:pid, but
validate the additional match fields from the candidate entry against
the real device and interface descriptors.

I was thinking of keeping the initial lookup by the aliased vid:pid and
then explicitly checking only the remaining match bits, such as DEV_CLASS,
DEV_SUBCLASS, DEV_PROTOCOL, INT_CLASS, INT_SUBCLASS, INT_PROTOCOL, INT_NUMBER,
and bcdDevice_lo/hi. Another option would be to build the match object
from the original device ID instead of the aliased one.

I think the first option would be simpler and more direct here, since
the problem is that the current code resolves the alias only by
vendor/product, even though some quirk table entries also depend
on extra descriptor fields. The quirk table already has such entries,
for example USB_DEVICE_VENDOR_SPEC() and USB_AUDIO_DEVICE(), so explicitly
checking those extra fields in get_alias_quirk() seems to fit
the intended logic better.
