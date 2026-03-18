Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A936F3ACEFF
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835580; cv=none; b=OaQN7f3KbxjEO30Eefwfxhf3Aq4VCyaxF5j+s9KLUs98veO/mV8oKnRbHIaGsJmOfbguxf2SKErXjVWf5MpcaCY+QjMEeSoZMV+8lO1620tUmvkmKBvAFmZrI1jYk71tQr9jbja9rOs/xxMXOI/ggG9UYxDqt72Z0wRx7zPAfLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835580; c=relaxed/simple;
	bh=tjVDPwLUWk5i5HJR18PgJWAbXJj+sXaHBNSOnK2FdS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGLFEo/nRLiKglGro6uYV+YpdPqkkzxy3VnWVJb158nsgoqxRDE9g0Tn66qaqFuuFe9XxnK8CAWOytdzfPr+q7wlVZSRCO8jbJySnEP/PszT7hymD7g1VQPnH162MkCTk7asoGzbpAqgIrZXpSCIdff2td8OMpy/pSCJQCWfcYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBXcpmF6; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBXcpmF6"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12732e6a123so1942232c88.1
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 05:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773835578; x=1774440378; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=svCuu5hiHF3rG9YIC6pMeTrIz+mExhcKjar8Tc2eNgs=;
        b=LBXcpmF6vdpRwb8ULWKFvtzppC8SEjSvj/Bhm3mG4nwh906UN+miMawM7rFLZH0CI9
         kpmdsZ6dQeMUzSORUMyo4UT20nj5nrDymI9jj3p71SXcxwTJaFuRbA55+e6edGKwgJQ9
         vXE74wKFMA+IA4IEhQCbQ5S1SGbVPhWHmecxcMaYGiKymWCrJaRRBrDu77o5KEGqeB5Z
         OViqd/kSlsJW/HgPNcWtqOEYG5xqAE6j8GVnnWqkSuYNNcZL2zvnWr8YXxOBHHuM3NJL
         3WDTG9GHT48zE6FrTXqtbxMCibZOGCJAFRJoOvSvJ56Er/rMAsHN3qPKykM27AuVOpU8
         P+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773835578; x=1774440378;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=svCuu5hiHF3rG9YIC6pMeTrIz+mExhcKjar8Tc2eNgs=;
        b=nzTeHHFf5NkkdP7/ecOH/vqt9jDe6rUp+f9Vxjr+UhYo3+yJQs/UcDtaIiz6oEb3pm
         EKXn25AK3xOsZiL31+fa2q53zRdqz5svq58Io9N+5BqZtmFzN0j0eoILI5vOoOcVufe4
         PE3fftZUPcvbNqEwtm+BiRw0KWz8NSVPea5TTHecWAS3ihVb5i3+xT9BJKU1Nl+0gYW0
         6XkeUJEt1nENj/UK6AdHS5Q9369XIpn4Ide2bgpinXLhDkM4yd83widNt2m07xKIz4zv
         2z//8XbO6i1RCCXCwdHIZLJ+8YTXAWBiijJCxORX31Pp0fn+cK+t+bVqNlHn54/Iu1tL
         LXUw==
X-Forwarded-Encrypted: i=1; AJvYcCWKBGTG/D2yayMCfl7FdNv/9Dah7irM3l+s3G0HtUFFpyFUIkM1yjoM45j2ay0S475FH1HUkfPlBSNjIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1KhEp0nYAJx/vhFGssKb4c8q/Q4Onw2s5GOpvlF2dxMR71mWh
	pcRP3m06vZdnNwsk/WlWxTDjCUj+LuIMltJyrhk22xAuZMDp8+xM3zX3
X-Gm-Gg: ATEYQzyJ5ikWsTQVcG1hjPOGQms+XCxwRE0chjJ6cwbphXmUTOjCBB3oYrnJM8y3CN6
	Lu2KsXXq/X+WEJsp8AHYdXcFBSlgTolzhWaIFh40tJrDS/OHg0h0kEcztTokQZyvuPvxnX/RpCC
	a4eL260DtrYASSndppRKVL+/VG4i9XpHg2IVcJAhAD41TtTywe6w2f2JJeMhGcxr7/DWR2u+f06
	ugxDAk+nrk347rBR6yFuLGNS6YU241oIX6HdwcnSLjYkalW8ghDSbjVxhO+TrEyIVs6GltKI3Jx
	IQZlErRFXBoTcV0uTsF463tIbf3UDgg65COEIAVD6VDvV0yNct2QSu4yBv27PsmiHAMM0CC5OQr
	6qhOloG/PY/7NTZ/K60FPE6ufgAgKHq2mjUSubRrAYlMQ36Fl65KfNTWoHxbrV4NWVh6rkv1kEd
	ZIS+zrfAw88JnuqZxh8wof4SWXIy/KypLoV9ktIQgjsWrMz6ACQC23euwpTyuWXDsYBI8q5A==
X-Received: by 2002:a05:7022:523:b0:11d:fd26:234e with SMTP id a92af1059eb24-129a7115f7bmr1513888c88.16.1773835577535;
        Wed, 18 Mar 2026 05:06:17 -0700 (PDT)
Received: from localhost (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129a723f829sm3893781c88.1.2026.03.18.05.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:06:16 -0700 (PDT)
Date: Wed, 18 Mar 2026 09:06:13 -0300
From: =?utf-8?Q?C=C3=A1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: validate full match when resolving
 quirk aliases
Message-ID: <abqU93qDlsjK5ZHS@ortodist>
References: <20260317-alsa-usb-fix-quirk-alias-v2-1-6e531c67f0c8@gmail.com>
 <878qbqg75d.wl-tiwai@suse.de>
 <abmJV97A1kaxP4Xv@ortodist>
 <87341xeh9w.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87341xeh9w.wl-tiwai@suse.de>

On Wed, Mar 18, 2026 at 08:19:39AM +0100, Takashi Iwai wrote:
> On Tue, 17 Mar 2026 18:35:16 +0100,
> Cássio Gabriel wrote:
> > 
> > On Tue, Mar 17, 2026 at 10:03:10AM +0100, Takashi Iwai wrote:
> > > On Tue, 17 Mar 2026 05:22:04 +0100,
> > > Cássio Gabriel wrote:
> > > > 
> > > > get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
> > > > usb_audio_ids[], but it currently checks only the vendor/product pair.
> > > > 
> > > > This is weak for quirk table entries that also depend on additional
> > > > USB_DEVICE_ID match fields, such as device or interface class,
> > > > subclass, protocol, interface number, or bcdDevice range.
> > > > 
> > > > Rework the alias lookup so that it still uses the aliased vid:pid as
> > > > the initial lookup key, but validates the remaining match_flags
> > > > constraints of each candidate entry against the real device and
> > > > interface descriptors before returning the quirk.
> > > > 
> > > > Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> > > > ---
> > > > Changes in v2:
> > > > - drop the temporary usb_device_id reconstruction approach
> > > > - validate only the remaining match_flags explicitly
> > > > - pass struct usb_interface * to get_alias_quirk()
> > > > - Link to v1: https://lore.kernel.org/r/20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com
> > > > ---
> > > >  sound/usb/card.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++-------
> > > >  1 file changed, 64 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > > > index fd81f32a66fb..153085a77d43 100644
> > > > --- a/sound/usb/card.c
> > > > +++ b/sound/usb/card.c
> > > > @@ -864,21 +864,77 @@ static void find_last_interface(struct snd_usb_audio *chip)
> > > >  	usb_audio_dbg(chip, "Found last interface = %d\n", chip->last_iface);
> > > >  }
> > > >  
> > > > +/*
> > > > + * Match aliased vid:pid first, then validate remaining fields against
> > > > + * the real device and interface descriptors.
> > > > + */
> > > > +static bool snd_usb_match_alias_entry(struct usb_interface *intf,
> > > > +				      const struct usb_device_id *id,
> > > > +				      u32 alias_id)
> > > > +{
> > > > +	struct usb_device *dev = interface_to_usbdev(intf);
> > > > +	const struct usb_host_interface *alt = intf->cur_altsetting;
> > > > +	const struct usb_interface_descriptor *intfd = &alt->desc;
> > > > +	const struct usb_device_descriptor *devd = &dev->descriptor;
> > > > +	u16 bcd = le16_to_cpu(devd->bcdDevice);
> > > > +
> > > > +	/* Match aliased vendor/product */
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_VENDOR) &&
> > > > +	    id->idVendor != USB_ID_VENDOR(alias_id))
> > > > +		return false;
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_PRODUCT) &&
> > > > +	    id->idProduct != USB_ID_PRODUCT(alias_id))
> > > > +		return false;
> > > > +	/* Match real device descriptor constraints */
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_LO) &&
> > > > +	    bcd < id->bcdDevice_lo)
> > > > +		return false;
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_HI) &&
> > > > +	    bcd > id->bcdDevice_hi)
> > > > +		return false;
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_CLASS) &&
> > > > +	    devd->bDeviceClass != id->bDeviceClass)
> > > > +		return false;
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_SUBCLASS) &&
> > > > +	    devd->bDeviceSubClass != id->bDeviceSubClass)
> > > > +		return false;
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_PROTOCOL) &&
> > > > +	    devd->bDeviceProtocol != id->bDeviceProtocol)
> > > > +		return false;
> > > > +	/* Match real interface descriptor constraints */
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_CLASS) &&
> > > > +	    intfd->bInterfaceClass != id->bInterfaceClass)
> > > > +		return false;
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_SUBCLASS) &&
> > > > +	    intfd->bInterfaceSubClass != id->bInterfaceSubClass)
> > > > +		return false;
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_PROTOCOL) &&
> > > > +	    intfd->bInterfaceProtocol != id->bInterfaceProtocol)
> > > > +		return false;
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_NUMBER) &&
> > > > +	    intfd->bInterfaceNumber != id->bInterfaceNumber)
> > > > +		return false;
> > > > +
> > > > +	return true;
> > > > +}
> > > 
> > > Hrm, it became larger than I wished.
> > > You compared with another implementation and decided to choose this
> > > version?
> > > 
> > 
> > Hi,
> > 
> > I went with the explicit matching path in v2 because I wanted to keep
> > the alias lookup based on the aliased vid:pid while validating the
> > remaining match_flags against the real descriptors.
> > 
> > > An alternative would be to have a copy of usb_device_id like your
> > > previous version, and clear match_flags bits with
> > > ~USB_DEVICE_ID_MATCH_DEVICE.  If match_flags becomes 0, it passes.
> > > Otherwise call usb_match_one_id().
> > 
> > thanks, that makes sense.
> > 
> > What do you think about this approach?
> > ```
> > static const struct snd_usb_audio_quirk *
> > get_alias_quirk(struct usb_interface *intf, unsigned int id)
> > {
> >         const struct usb_device_id *p;
> >         struct usb_device_id match_id;
> > 
> >         for (p = usb_audio_ids; p->match_flags; p++) {
> >                 if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) !=
> >                     USB_DEVICE_ID_MATCH_DEVICE)
> >                         continue;
> > 
> >                 if (p->idVendor != USB_ID_VENDOR(id) ||
> >                     p->idProduct != USB_ID_PRODUCT(id))
> >                         continue;
> > 
> >                 match_id = *p;
> >                 match_id.match_flags &= ~USB_DEVICE_ID_MATCH_DEVICE;
> >                 if (!match_id.match_flags || usb_match_one_id(intf, &match_id))
> >                         return (const struct snd_usb_audio_quirk *)
> >                                 p->driver_info;
> >         }
> > 
> >         return NULL;
> > }
> > ```
> 
> Yes, that's what I had in mind.
> 
> 
> thanks,
> 
> Takashi

Nice, I'm going to send you the v3 patch with the fixes.


Thanks,
Cássio.
