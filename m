Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8FF1ADFE4
	for <linux-sound@vger.kernel.org>; Mon,  4 Nov 2024 09:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712607; cv=none; b=tN+M96kZtCeqG0DWRSqLz4w0W+ooS/rosQWoWm6nbglQJAaShiD5cxW1HDLII6xJHj0XGH1pkNlIXfYhhY/w9aX9RHwWYen41qpDiS9ZpsFdmPyB4xWjafLgZSPYCTjXtQ9PpA4LA4jLORI+9AEb6BbUhv2DPWnqZV3f3EvneTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712607; c=relaxed/simple;
	bh=wBP7ZYHgobRSMBkhoEuY8+vWGRQFJrQ0yJVuQgNAU1k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=texc6rShl5E3AlZHrJYcjke2I9fzqmxwwC4rwiXSNiD3rLusylUpkJfk+dfDib5kQSLRpmUZisdJuP2g5A06HpR1QGD11kk55Dd1WPRBZHET+xK79Ze532ISwZynOQfRDMxvlSb0Es0SmLwa5Lav8rtDr/eq9fMOtaDQMp3fNe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gqj+go1C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gqj+go1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730712604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wBP7ZYHgobRSMBkhoEuY8+vWGRQFJrQ0yJVuQgNAU1k=;
	b=Gqj+go1C3ow2H6J1kdL4nrAuGBEA87acUrUvkVx0IGJn5fWcQw0B+05tebBz8pNenAUY5G
	ZHia9ywLb7A094vU3vRYuMqYjsMkCbev3oUcOyHhHabXSkPyxl9T4nwQ9dNX4XhLzZscDN
	ov0W77B/oqVqqij0U1SnwEDJ3uAYR64=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-q4SafW3tN9aOIbvDs9mNNA-1; Mon, 04 Nov 2024 04:30:03 -0500
X-MC-Unique: q4SafW3tN9aOIbvDs9mNNA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4314f023f55so27440265e9.2
        for <linux-sound@vger.kernel.org>; Mon, 04 Nov 2024 01:30:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730712602; x=1731317402;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gKtfGtvu9QuGOQ+mF1Y/MWcBZGqBG4faf6TA4C8EU4U=;
        b=MTwrfgZzFIdsXZnyXuY4aKUkg9eOyOMXZU2qAz7c0T15OIfus5S34E2jEi9dYCLwO8
         bNObe7LbFrtuPgeawcYvgyrzvrzTLWlZFUUBho90VA+le/X+m+SRlbN9x/JQTpopJpJt
         9p2c9n8awmwYx6Fb8SiHirpM8Ov1YjBnYGX4pUSdvMbZDJzMK8iDsroOIihtoaXuFTCP
         qX4/7MH9Tole56czKZ4EYL5W1+R+94i4Slg8r2ns4HgeeEyh9Z7gbqGhoy6//4RoLJyC
         B54YHptLMYJX06PUsDHdR+Betnkwc7B5DvO6KiJy6naEgDLEcHFmXv60ZgqiqzDfWTxV
         vCiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4Bs7twHVddsyamC5lCqig6xgKqkgSLmqorVhD9CTpQ3Rtetdzy6MLbbIagUoWvrNaoyWm25RPtMXuww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkMrZxWuXiE92Isvnl6wToJLhAiSP74Fqp52BUqU5hioncABwo
	fbKdGImr6a1XssTNrOJsedXLohOdnqhH275S/8dhWTSZk2EiqCUwrceej+B11zILGskGH2JwGA4
	FWbulVWQOKncUXBTNMeGyjEIDxC3gN8vuMlwMGBXDuF3ik4TL7sPqx7cz9GML
X-Received: by 2002:a05:600c:3b9c:b0:42c:bb10:7292 with SMTP id 5b1f17b1804b1-4319ac70754mr289713265e9.1.1730712601965;
        Mon, 04 Nov 2024 01:30:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhkGRUsLKoGes7Q+Gaa4JMpFBwwQDw4NqRdOi0qUWkq4kjb4UQjFbDvmfNCttWq+TBxtSH/Q==
X-Received: by 2002:a05:600c:3b9c:b0:42c:bb10:7292 with SMTP id 5b1f17b1804b1-4319ac70754mr289713005e9.1.1730712601522;
        Mon, 04 Nov 2024 01:30:01 -0800 (PST)
Received: from ?IPv6:2001:16b8:2d7f:e400:7f8:722c:bb2e:bb7f? (200116b82d7fe40007f8722cbb2ebb7f.dip.versatel-1u1.de. [2001:16b8:2d7f:e400:7f8:722c:bb2e:bb7f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf447sm145387895e9.13.2024.11.04.01.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 01:30:00 -0800 (PST)
Message-ID: <a16dab7222bc1388f4a4d5b1baa6ce0c613d7933.camel@redhat.com>
Subject: Re: [PATCH] ALSA: hda: intel: Switch to pci_alloc_irq_vectors API
From: Philipp Stanner <pstanner@redhat.com>
To: Takashi Iwai <tiwai@suse.de>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, 
 "linux-pci@vger.kernel.org"
	 <linux-pci@vger.kernel.org>
Date: Mon, 04 Nov 2024 10:30:00 +0100
In-Reply-To: <87bjyzuyvz.wl-tiwai@suse.de>
References: <11c60429-9435-4666-8e27-77160abef68e@gmail.com>
	 <87bjyzuyvz.wl-tiwai@suse.de>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-11-01 at 09:44 +0100, Takashi Iwai wrote:
> On Thu, 31 Oct 2024 20:41:12 +0100,
> Heiner Kallweit wrote:
> >=20
> > Switch from legacy pci_msi_enable()/pci_intx() API to the
> > pci_alloc_irq_vectors API.
> >=20
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>=20
> So, this change looks conflicting with the pcim_intx() cleanup patch
> set from Philipp.=C2=A0 I think we can take this one and drop the
> corresponding one from Philipp's patch set.
>=20
> Bjorn, Philipp, does it sound OK?

Yes, that will be trivial to do. I'll just drop my hda_intel patch and
that's it.

Thanks,
P.

>=20
>=20
> thanks,
>=20
> Takashi
>=20
> > ---
> > =C2=A0sound/pci/hda/hda_intel.c | 21 ++++++++++++---------
> > =C2=A01 file changed, 12 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> > index 9fc5e6c5d..fc329b6a7 100644
> > --- a/sound/pci/hda/hda_intel.c
> > +++ b/sound/pci/hda/hda_intel.c
> > @@ -773,6 +773,14 @@ static void azx_clear_irq_pending(struct azx
> > *chip)
> > =C2=A0static int azx_acquire_irq(struct azx *chip, int do_disconnect)
> > =C2=A0{
> > =C2=A0=09struct hdac_bus *bus =3D azx_bus(chip);
> > +=09int ret;
> > +
> > +=09if (!chip->msi || pci_alloc_irq_vectors(chip->pci, 1, 1,
> > PCI_IRQ_MSI) < 0) {
> > +=09=09ret =3D pci_alloc_irq_vectors(chip->pci, 1, 1,
> > PCI_IRQ_INTX);
> > +=09=09if (ret < 0)
> > +=09=09=09return ret;
> > +=09=09chip->msi =3D 0;
> > +=09}
> > =C2=A0
> > =C2=A0=09if (request_irq(chip->pci->irq, azx_interrupt,
> > =C2=A0=09=09=09chip->msi ? 0 : IRQF_SHARED,
> > @@ -786,7 +794,6 @@ static int azx_acquire_irq(struct azx *chip,
> > int do_disconnect)
> > =C2=A0=09}
> > =C2=A0=09bus->irq =3D chip->pci->irq;
> > =C2=A0=09chip->card->sync_irq =3D bus->irq;
> > -=09pci_intx(chip->pci, !chip->msi);
> > =C2=A0=09return 0;
> > =C2=A0}
> > =C2=A0
> > @@ -1879,13 +1886,9 @@ static int azx_first_init(struct azx *chip)
> > =C2=A0=09=09chip->gts_present =3D true;
> > =C2=A0#endif
> > =C2=A0
> > -=09if (chip->msi) {
> > -=09=09if (chip->driver_caps & AZX_DCAPS_NO_MSI64) {
> > -=09=09=09dev_dbg(card->dev, "Disabling 64bit
> > MSI\n");
> > -=09=09=09pci->no_64bit_msi =3D true;
> > -=09=09}
> > -=09=09if (pci_enable_msi(pci) < 0)
> > -=09=09=09chip->msi =3D 0;
> > +=09if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64) {
> > +=09=09dev_dbg(card->dev, "Disabling 64bit MSI\n");
> > +=09=09pci->no_64bit_msi =3D true;
> > =C2=A0=09}
> > =C2=A0
> > =C2=A0=09pci_set_master(pci);
> > @@ -2037,7 +2040,7 @@ static int disable_msi_reset_irq(struct azx
> > *chip)
> > =C2=A0=09free_irq(bus->irq, chip);
> > =C2=A0=09bus->irq =3D -1;
> > =C2=A0=09chip->card->sync_irq =3D -1;
> > -=09pci_disable_msi(chip->pci);
> > +=09pci_free_irq_vectors(chip->pci);
> > =C2=A0=09chip->msi =3D 0;
> > =C2=A0=09err =3D azx_acquire_irq(chip, 1);
> > =C2=A0=09if (err < 0)
> > --=20
> > 2.47.0
> >=20
>=20

