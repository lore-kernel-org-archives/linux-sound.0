Received: from us-smtp-delivery-172.mimecast.com (us-smtp-delivery-172.mimecast.com [170.10.129.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9121B39B94D
	for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 18:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787165591; cv=none; b=IjkROcIpR3HAXKUessTIF+eQQwPcI8C6CEsfGDSWRGirg4JiiAWtv/8w3XzSKhgbouiL1N4azzW7iT5Td/wZmaHTS3aQSmQz8MF+OFnTh7urBaf3WD0bqibAOwIR27R3BFWDj4AvxV+bQNc6s9lJEDAXt9SWljch7ctIicbRD+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787165591; c=relaxed/simple;
	bh=1qAOvNZgVmcuvAJId147pga5ENFXm/tiBBA+2C2pG1g=;
	h=MIME-Version:Date:Message-ID:To:CC:Subject:From:References:
	 In-Reply-To:Content-Type; b=mD8bkRAIbb7GYYU1U32VaaQGIuLjuGanHwadwJDCp3U/CWFeP+aVcZhogbyulXVtPLH8/irf7iHsG/fCanppujpj2qUX2I8XOWIlQFZ1tjBH0EqJW6jM7zMtNOrLeBoAuCHDhudgVc23kr1pajiJHfcwm8O9Fm2yhQw4CQxQswE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=valvesoftware.com; spf=pass smtp.mailfrom=valvesoftware.com; dkim=pass (1024-bit key) header.d=valvesoftware.com header.i=@valvesoftware.com header.b=UFEEjl+p; arc=none smtp.client-ip=170.10.129.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=valvesoftware.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valvesoftware.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valvesoftware.com header.i=@valvesoftware.com header.b="UFEEjl+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valvesoftware.com;
	s=mc20150811; t=1787165587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B0uAh3GlGfDUZsZW3VBAZNg4H1yd30fAthoQHZ9o0Zk=;
	b=UFEEjl+plulJeozc4LYwB1LDBnJM99wJuzRcahD+ZQ4fqV+HqvOZatX4iFp1/12OTAlg56
	hUVVlBcwTZIdOJr6S/ksWDO1SH0k/6rZsa4nmXuQi4qSsIm6BjExVIa0F2S9C4zpuZgiZv
	I5fefSC+dwDbhW9l0dMi8BJyus+vLV4=
Received: from smtp-01-tuk3.valvesoftware.com
 (smtp-01-tuk3.valvesoftware.com [208.64.203.181]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-465-GjJyPD3eOmW8PApxd-JZdw-1; Wed, 19 Aug 2026 14:53:05 -0400
X-MC-Unique: GjJyPD3eOmW8PApxd-JZdw-1
X-Mimecast-MFC-AGG-ID: GjJyPD3eOmW8PApxd-JZdw_1787165584
Received: from antispam.valve.org ([172.16.1.107])
	by smtp-01-tuk3.valvesoftware.com with esmtp (Exim 4.97)
	(envelope-from <arunr@valvesoftware.com>)
	id 1wwlPM-0000000Amp9-0dqq;
	Wed, 19 Aug 2026 11:53:04 -0700
Received: from antispam.valve.org (127.0.0.1) id hgntp00171s9; Wed, 19 Aug 2026 11:53:04 -0700 (envelope-from <arunr@valvesoftware.com>)
Received: from mail2.valvemail.org ([172.16.144.23])
	by antispam.valve.org ([172.16.1.107]) (SonicWall 10.0.15.7233)
	with ESMTP id o202608191853030038413-5; Wed, 19 Aug 2026 11:53:03 -0700
Received: from localhost (172.18.17.18) by mail2.valvemail.org (172.16.144.23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Aug
 2026 11:53:03 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 19 Aug 2026 11:53:03 -0700
Message-ID: <DKT5BQW7XPHP.2KNASR1XE11UD@valvesoftware.com>
To: Takashi Iwai <tiwai@suse.de>, Arun Raghavan <arunr@valvesoftware.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Arun
 Raghavan" <arun@arunraghavan.net>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [External Mail] Re: [PATCH] ALSA: hda/core: Log stream DMA
 errors on interrupt
From: Arun Raghavan <arunr@valvesoftware.com>
X-Mailer: aerc 0.21.0
References: <20260803-master-v1-1-9bcedb736978@valvesoftware.com>
 <87tspai11y.wl-tiwai@suse.de> <DKGCFDZL0ZPJ.WU7CLZ8ZJKOI@valvesoftware.com>
 <87wlu5hhpv.wl-tiwai@suse.de> <DKHB6RQ5IKR0.K989KLA76JRV@valvesoftware.com>
 <87zeyzep6n.wl-tiwai@suse.de>
In-Reply-To: <87zeyzep6n.wl-tiwai@suse.de>
X-ClientProxiedBy: mail2.valvemail.org (172.16.144.23) To mail2.valvemail.org
 (172.16.144.23)
X-Mlf-DSE-Version: 7582
X-Mlf-Rules-Version: s20260812222146; ds20230628172248;
	di20260806160452; ri20160318003319; fs20260819180548
X-Mlf-Smartnet-Version: 20210917223710
X-Mlf-Envelope-From: arunr@valvesoftware.com
X-Mlf-Version: 10.0.15.7233
X-Mlf-License: BSV_C_AP_T_R
X-Mlf-UniqueId: o202608191853030038413
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MPg9BVliO8erVx3wKT9ZsVE52sJySJvDFcUFEMPoJII_1787165584
X-Mimecast-Originator: valvesoftware.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Aug 5, 2026 at 11:30 PM PDT, Takashi Iwai wrote:
> On Wed, 05 Aug 2026 22:56:40 +0200,
> Arun Raghavan wrote:
>>=20
>> On Tue Aug 4, 2026 at 11:18 AM PDT, Takashi Iwai wrote:
>> > On Tue, 04 Aug 2026 19:42:17 +0200,
>> > Arun Raghavan wrote:
>> >>=20
>> >> On Tue Aug 4, 2026 at 4:21 AM PDT, Takashi Iwai wrote:
>> >> > On Tue, 04 Aug 2026 00:07:52 +0200,
>> >> > Arun Raghavan wrote:
>> >> >>=20
>> >> >> The stream descriptor status register reports FIFO and descriptor
>> >> >> errors, but these are currently cleared silently along with the re=
st
>> >> >> of the interrupt status. Log them, rate-limited, so DMA problems a=
re
>> >> >> visible instead of only manifesting as audible glitches.
>> >> >>=20
>> >> >> Observed on some AMD GPU HDMI audio controllers under specific low=
 power
>> >> >> circumstances.
>> >> >>=20
>> >> >> Signed-off-by: Arun Raghavan <arunr@valvesoftware.com>
>> >> >> Cc: Arun Raghavan <arun@arunraghavan.net>
>> >> >
>> >> > Applied now to for-next branch.
>> >> >
>> >> > It's interesting at which situation you get the error bit and which
>> >> > one.  If it can be used *reliably* for catching a streaming error, =
the
>> >> > driver could notify XRUN or error appropriately, too.
>> >>=20
>> >> Ah, I should have mentioned that in the commit message. The error bit
>> >> that was signalled was SD_INT_FIFO_ERR -- the status byte was read as
>> >> (SD_STS_FIFO_READY | SD_INT_FIFO_ERR).
>> >>=20
>> >> We are still working on pinning down the precise cause in this case, =
but
>> >> it seems to be related to issues in some specific setups during lower
>> >> frequency memory clock transitions. The error manifests as a short
>> >> dropout caused by what appears to be a stall or missed transfer. The
>> >> frequency of dropouts varies from several per minute to one every few
>> >> minutes.
>> >>=20
>> >> In such a case, the existence of XRUNs might be good to know further =
up
>> >> the stack, though it isn't clear that there is much that userspace ca=
n
>> >> autonomously do to mitigate the it.
>> >
>> > When we do stop the stream as XRUN and notifies to user-space, usually
>> > it tries to recover / restart -- something like below.
>> >
>> > But it's hard to judge whether we should do this, or it can lead
>> > rather to misbehavior.  We need experiments.
>> >
>> >
>> > thanks,
>> >
>> > Takashi
>> >
>> > -- 8< --
>> > diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
>> > index aa994d6e6d35..615e48ecb009 100644
>> > --- a/include/sound/hdaudio.h
>> > +++ b/include/sound/hdaudio.h
>> > @@ -412,7 +412,9 @@ void snd_hdac_bus_link_power(struct hdac_device *h=
dev, bool enable);
>> >  void snd_hdac_bus_update_rirb(struct hdac_bus *bus);
>> >  int snd_hdac_bus_handle_stream_irq(struct hdac_bus *bus, unsigned int=
 status,
>> >  =09=09=09=09    void (*ack)(struct hdac_bus *,
>> > -=09=09=09=09=09=09struct hdac_stream *));
>> > +=09=09=09=09=09=09struct hdac_stream *),
>> > +=09=09=09=09    void (*error)(struct hdac_bus *,
>> > +=09=09=09=09=09=09  struct hdac_stream *));
>> > =20
>> >  int snd_hdac_bus_alloc_stream_pages(struct hdac_bus *bus);
>> >  void snd_hdac_bus_free_stream_pages(struct hdac_bus *bus);
>> > diff --git a/sound/hda/common/controller.c b/sound/hda/common/controll=
er.c
>> > index afec5c5546ec..329854c9fe92 100644
>> > --- a/sound/hda/common/controller.c
>> > +++ b/sound/hda/common/controller.c
>> > @@ -1058,6 +1058,15 @@ static void stream_update(struct hdac_bus *bus,=
 struct hdac_stream *s)
>> >  =09}
>> >  }
>> > =20
>> > +static void stream_error(struct hdac_bus *bus, struct hdac_stream *s)
>> > +{
>> > +=09struct azx_dev *azx_dev =3D stream_to_azx_dev(s);
>> > +
>> > +=09spin_unlock(&bus->reg_lock);
>> > +=09snd_pcm_stop_xrun(azx_stream(azx_dev)->substream);
>> > +=09spin_lock(&bus->reg_lock);
>> > +}
>> > +
>> >  irqreturn_t azx_interrupt(int irq, void *dev_id)
>> >  {
>> >  =09struct azx *chip =3D dev_id;
>> > @@ -1082,7 +1091,8 @@ irqreturn_t azx_interrupt(int irq, void *dev_id)
>> > =20
>> >  =09=09handled =3D true;
>> >  =09=09active =3D false;
>> > -=09=09if (snd_hdac_bus_handle_stream_irq(bus, status, stream_update))
>> > +=09=09if (snd_hdac_bus_handle_stream_irq(bus, status, stream_update,
>> > +=09=09=09=09=09=09   stream_error))
>> >  =09=09=09active =3D true;
>> > =20
>> >  =09=09status =3D azx_readb(chip, RIRBSTS);
>> > diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
>> > index 78855ac357c6..67bb74c618bf 100644
>> > --- a/sound/hda/core/controller.c
>> > +++ b/sound/hda/core/controller.c
>> > @@ -676,8 +676,10 @@ EXPORT_SYMBOL_GPL(snd_hdac_bus_stop_chip);
>> >   * Returns the bits of handled streams, or zero if no stream is handl=
ed.
>> >   */
>> >  int snd_hdac_bus_handle_stream_irq(struct hdac_bus *bus, unsigned int=
 status,
>> > -=09=09=09=09    void (*ack)(struct hdac_bus *,
>> > -=09=09=09=09=09=09struct hdac_stream *))
>> > +=09=09=09=09   void (*ack)(struct hdac_bus *,
>> > +=09=09=09=09=09       struct hdac_stream *),
>> > +=09=09=09=09   void (*error)(struct hdac_bus *,
>> > +=09=09=09=09=09=09 struct hdac_stream *))
>> >  {
>> >  =09struct hdac_stream *azx_dev;
>> >  =09u8 sd_status;
>> > @@ -692,6 +694,8 @@ int snd_hdac_bus_handle_stream_irq(struct hdac_bus=
 *bus, unsigned int status,
>> >  =09=09=09=09dev_warn_ratelimited(bus->dev,
>> >  =09=09=09=09=09=09"stream %u dma error: 0x%02x\n",
>> >  =09=09=09=09=09=09azx_dev->index, sd_status);
>> > +=09=09=09=09if (error)
>> > +=09=09=09=09=09error(bus, azx_dev);
>> >  =09=09=09}
>> >  =09=09=09if ((!azx_dev->substream && !azx_dev->cstream) ||
>> >  =09=09=09    !azx_dev->running || !(sd_status & SD_INT_COMPLETE))
>> > diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
>> > index 1a53856c2ffb..6a5a6e526c2c 100644
>> > --- a/sound/soc/intel/avs/core.c
>> > +++ b/sound/soc/intel/avs/core.c
>> > @@ -270,7 +270,8 @@ static irqreturn_t avs_hda_interrupt(struct hdac_b=
us *bus)
>> >  =09u32 status;
>> > =20
>> >  =09status =3D snd_hdac_chip_readl(bus, INTSTS);
>> > -=09if (snd_hdac_bus_handle_stream_irq(bus, status, hdac_update_stream=
))
>> > +=09if (snd_hdac_bus_handle_stream_irq(bus, status, hdac_update_stream=
,
>> > +=09=09=09=09=09   NULL))
>> >  =09=09ret =3D IRQ_HANDLED;
>> > =20
>> >  =09spin_lock_irq(&bus->reg_lock);
>>=20
>> This did work to surface the errors to userspace as XRUNs.
>>=20
>> Of course, because this is an actual error in the transfer between the
>> CPU and controller, it does not help mitigate the actual problem itself.
>
> So what's the best option for users if this happens?
> That is, what happens if we don't restart the stream?  Is it a
> temporary fail-out and the hardware recovers / resync by itself while
> streaming further?  If so and it's short, it might be better to leave
> it as is.  OTOH, if it's a fatal error that needs some manual
> recovery, a notification to user-space for recovery is required (if
> any).

Unfortunately, there doesn't appear to be much users can do in this
state. The warnings we have introduced should at least point to a cause,
but the issues seem to be around GPU clocks and power management, for
example like in this issue:

  https://gitlab.freedesktop.org/drm/amd/-/work_items/4517

-- Arun

