Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D817D1E9B1A
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 17:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768922; cv=none; b=SmqO3JwVfRQ29uaKgAJcWskMQIiYS1QJNLNZsgKXIHpTXcMkHNfpydBVGDZRzJgwF55guJfnCxT7jGnKevMwwcBPzqi089eNnOgPky4t7a2KYUPZt0WSCjx92Ryt7grqEFmPTQhgYx9AiRLLhCaXuWMDWCILnOZChFTJ46F6a4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768922; c=relaxed/simple;
	bh=bbyP0zDglMxDyEthHK2Wrlc+5c6i/7FLXGX7aZA4o4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9nBwMwz4Xm9byGQO8Yoa/8W6oiq7PnTYjAf/xRzKdtQC/FjdzG6vTVoQbS0GUOBcA04qBWLN785ZhO+dRKj71Ol8kW0vVOrsre3REGSXVqEhRArPxG8ikq7Ty7EeYAVBiTCEx6mdyf65RjcJx1XX0JKcTmm7vNFmEAXDxZLTdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k21jPG1e; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k21jPG1e"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c0bdf1988cso4542407eec.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 10:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773768920; x=1774373720; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PmeQ4Gu7cUOx49kFMbZ+6xRvgevZWes4Jn1cxhIfbz4=;
        b=k21jPG1eYLskZ75zvDeaNAib6IFfIP4rE4bNUNQcwBTeQSScalAMaX8yjg+bIfTR+9
         UsFv1xITSsetO5CaiSjaLKLbFkdpLZA93P6UBnla8WyXK2WmOc9OyyDJ6LlCZIJ2woQ4
         hBYePbB8bPMX7Ed1QUnxX+8DVJwNyPOUSq764bz5y5XVItygvMlprS8of0zomJA6YQEc
         yEAfLi1lp/yZrqiSy1OE7Oeb1TQ8cShVJR7k47jvgenKpZ1a9BP/FRx4uVwmyW1YJqx8
         GHPyH7Wf5W7I8GcY02p6G3LgWDrpawzhNQWEcxGnpfbDD2H65ny4szEDI1/XpFhbPXaN
         X0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768920; x=1774373720;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PmeQ4Gu7cUOx49kFMbZ+6xRvgevZWes4Jn1cxhIfbz4=;
        b=dMiKRMagSuDXPN2VW/gRGEMUltbdZ+Z332i+d2sOLd6YfhElRXEr8y2FSPw3swbnsY
         9Ahsyta/m91YhrY7Pptgpm3xcNLMKY4BHtFQIEGx5xLkHAsANspimIwJRwCwYkLn6lR6
         zEn0EvkaqVJENWek2wNkhV27HqK01/+aOLAN6uOXIbdopDoyhC/XP3gYyPY17xPF4cXY
         vAAUhUcm/GzCIOKRTlbLmwDiFKnVj+DMR02qgXjNViOtCMRjbvsoeVdLjXdDKNmcsnml
         F0kP0mFUzhiIZYZ1rMYppVZbJAuzr+5zBWelYMDG6spmTuV8WotzSosS1SX32lqIza9K
         /OAA==
X-Forwarded-Encrypted: i=1; AJvYcCUU97l8lsAMhMPLbgzhT1W+4mdLtU6FbHq7RMgUPG7sEJc37U+ACBSe3RpVjdhyjlD4lEXz8w5iww+dXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy35cSpt0cQKPL0Zf38Lxvcs4V/H7JforvKAErOdTroFnzoZKjV
	az0PVUuXvUZHEYnK3bjuHtAY5qfy3Y7WEESGrx5c9KjTZX2Pl+MtbQp5
X-Gm-Gg: ATEYQzxghw7U3VPCfm8lpP2+ATc8O61fbcW9pUucRy02Nnl4ZwwWKCPL1vGj4vu6B1O
	vDR45tQ9sQyT1wcA4Fk73diALbG3orgSQG4KUCdY2yF2GrF6cBkyh8diIyWuwXBD6VUJ/RGn6i7
	ptOY4QeVQ2XmQgP0ub8XgMlUl5zqha1oVMnB+5e8/ss6zpAgWhqwr5pPz3S/Cs3fqDbsMY6eIgX
	rXjBnJsY8IOuafAu/W2ED8rR2Yv4OdioiI8cSlGYQmegR4KWwNt2PPRsrm8NNvI3qAesowalMzx
	LzC3hPNoWAwAY5i1L0ARk62cErCGCapuc3MDnlucnLEgqMnn5J9WLxrix2bHzmUobnAcZMUf/JV
	KumcyRWvSf99nW1Qq8Z4X7fAJ6MPFvRU5fbEr/7BarfPQQbk9ohUqiES0aNfA+LYtAC//EgA+c8
	vZ9nW1MIVYG+tQNhkXiquaH86+JcXNDnvNaMizez8cpAP6Hqgb4wUSdLxJjNRVdkCCsDCxaA==
X-Received: by 2002:a05:7301:9bc8:b0:2be:8216:57c8 with SMTP id 5a478bee46e88-2c0e5115c54mr117337eec.30.1773768919780;
        Tue, 17 Mar 2026 10:35:19 -0700 (PDT)
Received: from localhost (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e51dd413sm235640eec.0.2026.03.17.10.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:35:19 -0700 (PDT)
Date: Tue, 17 Mar 2026 14:35:16 -0300
From: =?utf-8?Q?C=C3=A1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: validate full match when resolving
 quirk aliases
Message-ID: <abmJV97A1kaxP4Xv@ortodist>
References: <20260317-alsa-usb-fix-quirk-alias-v2-1-6e531c67f0c8@gmail.com>
 <878qbqg75d.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878qbqg75d.wl-tiwai@suse.de>

On Tue, Mar 17, 2026 at 10:03:10AM +0100, Takashi Iwai wrote:
> On Tue, 17 Mar 2026 05:22:04 +0100,
> Cássio Gabriel wrote:
> > 
> > get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
> > usb_audio_ids[], but it currently checks only the vendor/product pair.
> > 
> > This is weak for quirk table entries that also depend on additional
> > USB_DEVICE_ID match fields, such as device or interface class,
> > subclass, protocol, interface number, or bcdDevice range.
> > 
> > Rework the alias lookup so that it still uses the aliased vid:pid as
> > the initial lookup key, but validates the remaining match_flags
> > constraints of each candidate entry against the real device and
> > interface descriptors before returning the quirk.
> > 
> > Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> > ---
> > Changes in v2:
> > - drop the temporary usb_device_id reconstruction approach
> > - validate only the remaining match_flags explicitly
> > - pass struct usb_interface * to get_alias_quirk()
> > - Link to v1: https://lore.kernel.org/r/20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com
> > ---
> >  sound/usb/card.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 64 insertions(+), 8 deletions(-)
> > 
> > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > index fd81f32a66fb..153085a77d43 100644
> > --- a/sound/usb/card.c
> > +++ b/sound/usb/card.c
> > @@ -864,21 +864,77 @@ static void find_last_interface(struct snd_usb_audio *chip)
> >  	usb_audio_dbg(chip, "Found last interface = %d\n", chip->last_iface);
> >  }
> >  
> > +/*
> > + * Match aliased vid:pid first, then validate remaining fields against
> > + * the real device and interface descriptors.
> > + */
> > +static bool snd_usb_match_alias_entry(struct usb_interface *intf,
> > +				      const struct usb_device_id *id,
> > +				      u32 alias_id)
> > +{
> > +	struct usb_device *dev = interface_to_usbdev(intf);
> > +	const struct usb_host_interface *alt = intf->cur_altsetting;
> > +	const struct usb_interface_descriptor *intfd = &alt->desc;
> > +	const struct usb_device_descriptor *devd = &dev->descriptor;
> > +	u16 bcd = le16_to_cpu(devd->bcdDevice);
> > +
> > +	/* Match aliased vendor/product */
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_VENDOR) &&
> > +	    id->idVendor != USB_ID_VENDOR(alias_id))
> > +		return false;
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_PRODUCT) &&
> > +	    id->idProduct != USB_ID_PRODUCT(alias_id))
> > +		return false;
> > +	/* Match real device descriptor constraints */
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_LO) &&
> > +	    bcd < id->bcdDevice_lo)
> > +		return false;
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_HI) &&
> > +	    bcd > id->bcdDevice_hi)
> > +		return false;
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_CLASS) &&
> > +	    devd->bDeviceClass != id->bDeviceClass)
> > +		return false;
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_SUBCLASS) &&
> > +	    devd->bDeviceSubClass != id->bDeviceSubClass)
> > +		return false;
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_PROTOCOL) &&
> > +	    devd->bDeviceProtocol != id->bDeviceProtocol)
> > +		return false;
> > +	/* Match real interface descriptor constraints */
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_CLASS) &&
> > +	    intfd->bInterfaceClass != id->bInterfaceClass)
> > +		return false;
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_SUBCLASS) &&
> > +	    intfd->bInterfaceSubClass != id->bInterfaceSubClass)
> > +		return false;
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_PROTOCOL) &&
> > +	    intfd->bInterfaceProtocol != id->bInterfaceProtocol)
> > +		return false;
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_NUMBER) &&
> > +	    intfd->bInterfaceNumber != id->bInterfaceNumber)
> > +		return false;
> > +
> > +	return true;
> > +}
> 
> Hrm, it became larger than I wished.
> You compared with another implementation and decided to choose this
> version?
> 

Hi,

I went with the explicit matching path in v2 because I wanted to keep
the alias lookup based on the aliased vid:pid while validating the
remaining match_flags against the real descriptors.

> An alternative would be to have a copy of usb_device_id like your
> previous version, and clear match_flags bits with
> ~USB_DEVICE_ID_MATCH_DEVICE.  If match_flags becomes 0, it passes.
> Otherwise call usb_match_one_id().

thanks, that makes sense.

What do you think about this approach?
```
static const struct snd_usb_audio_quirk *
get_alias_quirk(struct usb_interface *intf, unsigned int id)
{
        const struct usb_device_id *p;
        struct usb_device_id match_id;

        for (p = usb_audio_ids; p->match_flags; p++) {
                if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) !=
                    USB_DEVICE_ID_MATCH_DEVICE)
                        continue;

                if (p->idVendor != USB_ID_VENDOR(id) ||
                    p->idProduct != USB_ID_PRODUCT(id))
                        continue;

                match_id = *p;
                match_id.match_flags &= ~USB_DEVICE_ID_MATCH_DEVICE;
                if (!match_id.match_flags || usb_match_one_id(intf, &match_id))
                        return (const struct snd_usb_audio_quirk *)
                                p->driver_info;
        }

        return NULL;
}
```

Thanks,
Cássio.
