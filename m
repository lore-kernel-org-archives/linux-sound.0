Received: from us-smtp-delivery-172.mimecast.com (us-smtp-delivery-172.mimecast.com [170.10.129.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18403D6CA5
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 20:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785963410; cv=none; b=rjgE4d29PsVhktDNPNIXvQsUYFC44hcb3CL92uOsr6idJfX3Z2GWzUAoTkaJjfJVgDAOAU7VWEE6Elz8Bg4lWMp0DJAb0PpP/YeOOCLuDZnml5CmJleVG8/zChv7PGbP5tGps8Yx5Zcc54iKSW7DHtpSeIuYynOyNjxxulhMsdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785963410; c=relaxed/simple;
	bh=iDJvvQnlXYLA7hYkUB+2iaLBczEv3C6HzrQAl8ztdHs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=lCi5FqG43A7mWU4gWtYlkp/OVWcrIQ5CkdzykR6vDtMK83YYieYugqOcHcxEroCkUE4j2Pr9tYd+Z1WEnmEyLOxB9knCRD7iYc+oUnQX/CVJKdi9rOdmUjG1qt8HFcjkILJs7GMRgr0CjEK5XhKhTS2tB2bq/+MitMXU967w00s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=valvesoftware.com; spf=pass smtp.mailfrom=valvesoftware.com; dkim=pass (1024-bit key) header.d=valvesoftware.com header.i=@valvesoftware.com header.b=a/0cCUDa; arc=none smtp.client-ip=170.10.129.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=valvesoftware.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valvesoftware.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valvesoftware.com header.i=@valvesoftware.com header.b="a/0cCUDa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valvesoftware.com;
	s=mc20150811; t=1785963405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x3kgyEA4Hjk+0QX89/0liagD95T4QNFIzSqnN1mhMEk=;
	b=a/0cCUDa3kFwFgMf/yq/ZD/qrWsvL5fezw2eiKPiAygJZFdqifD7TUojmx4BBqU6zYh7Ou
	FeMPSCJe8UYENgrXQq971TMPm/higqw6C7aFy4rbDNNLEGVjV8KxscMX3eWzOxekr41Q86
	lz+m6Wetwc5hIOAWqEZcX6JDX0ehP4s=
Received: from smtp-01-tuk3.valvesoftware.com
 (smtp-01-tuk3.valvesoftware.com [208.64.203.181]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-493-pldUlWbBM8abfOKl6kpBHw-1; Wed, 05 Aug 2026 16:56:43 -0400
X-MC-Unique: pldUlWbBM8abfOKl6kpBHw-1
X-Mimecast-MFC-AGG-ID: pldUlWbBM8abfOKl6kpBHw_1785963402
Received: from antispam.valve.org ([172.16.1.107])
	by smtp-01-tuk3.valvesoftware.com with esmtp (Exim 4.97)
	(envelope-from <arunr@valvesoftware.com>)
	id 1wrifK-0000000Gb7F-0YLQ;
	Wed, 05 Aug 2026 13:56:42 -0700
Received: from antispam.valve.org (127.0.0.1) id heehok0171sn; Wed, 5 Aug 2026 13:56:42 -0700 (envelope-from <arunr@valvesoftware.com>)
Received: from mail2.valvemail.org ([172.16.144.23])
	by antispam.valve.org ([172.16.1.107]) (SonicWall 10.0.15.7233)
	with ESMTP id o202608052056410095169-5; Wed, 05 Aug 2026 13:56:41 -0700
Received: from localhost (172.18.17.18) by mail2.valvemail.org (172.16.144.23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 5 Aug
 2026 13:56:41 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 5 Aug 2026 13:56:40 -0700
Message-ID: <DKHB6RQ5IKR0.K989KLA76JRV@valvesoftware.com>
Subject: Re: [External Mail] Re: [PATCH] ALSA: hda/core: Log stream DMA
 errors on interrupt
From: Arun Raghavan <arunr@valvesoftware.com>
To: Takashi Iwai <tiwai@suse.de>, Arun Raghavan <arunr@valvesoftware.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Arun
 Raghavan" <arun@arunraghavan.net>
X-Mailer: aerc 0.21.0
References: <20260803-master-v1-1-9bcedb736978@valvesoftware.com>
 <87tspai11y.wl-tiwai@suse.de> <DKGCFDZL0ZPJ.WU7CLZ8ZJKOI@valvesoftware.com>
 <87wlu5hhpv.wl-tiwai@suse.de>
In-Reply-To: <87wlu5hhpv.wl-tiwai@suse.de>
X-ClientProxiedBy: mail2.valvemail.org (172.16.144.23) To mail2.valvemail.org
 (172.16.144.23)
X-Mlf-DSE-Version: 7580
X-Mlf-Rules-Version: s20260801042314; ds20230628172248;
	di20260728152631; ri20160318003319; fs20260805153815
X-Mlf-Smartnet-Version: 20210917223710
X-Mlf-Envelope-From: arunr@valvesoftware.com
X-Mlf-Version: 10.0.15.7233
X-Mlf-License: BSV_C_AP_T_R
X-Mlf-UniqueId: o202608052056410095169
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HUeSufcJ4LxbBbrHFNOTtKi8Vh7EppxSRAqhKO08aBk_1785963402
X-Mimecast-Originator: valvesoftware.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Aug 4, 2026 at 11:18 AM PDT, Takashi Iwai wrote:
> On Tue, 04 Aug 2026 19:42:17 +0200,
> Arun Raghavan wrote:
>>=20
>> On Tue Aug 4, 2026 at 4:21 AM PDT, Takashi Iwai wrote:
>> > On Tue, 04 Aug 2026 00:07:52 +0200,
>> > Arun Raghavan wrote:
>> >>=20
>> >> The stream descriptor status register reports FIFO and descriptor
>> >> errors, but these are currently cleared silently along with the rest
>> >> of the interrupt status. Log them, rate-limited, so DMA problems are
>> >> visible instead of only manifesting as audible glitches.
>> >>=20
>> >> Observed on some AMD GPU HDMI audio controllers under specific low po=
wer
>> >> circumstances.
>> >>=20
>> >> Signed-off-by: Arun Raghavan <arunr@valvesoftware.com>
>> >> Cc: Arun Raghavan <arun@arunraghavan.net>
>> >
>> > Applied now to for-next branch.
>> >
>> > It's interesting at which situation you get the error bit and which
>> > one.  If it can be used *reliably* for catching a streaming error, the
>> > driver could notify XRUN or error appropriately, too.
>>=20
>> Ah, I should have mentioned that in the commit message. The error bit
>> that was signalled was SD_INT_FIFO_ERR -- the status byte was read as
>> (SD_STS_FIFO_READY | SD_INT_FIFO_ERR).
>>=20
>> We are still working on pinning down the precise cause in this case, but
>> it seems to be related to issues in some specific setups during lower
>> frequency memory clock transitions. The error manifests as a short
>> dropout caused by what appears to be a stall or missed transfer. The
>> frequency of dropouts varies from several per minute to one every few
>> minutes.
>>=20
>> In such a case, the existence of XRUNs might be good to know further up
>> the stack, though it isn't clear that there is much that userspace can
>> autonomously do to mitigate the it.
>
> When we do stop the stream as XRUN and notifies to user-space, usually
> it tries to recover / restart -- something like below.
>
> But it's hard to judge whether we should do this, or it can lead
> rather to misbehavior.  We need experiments.
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
> index aa994d6e6d35..615e48ecb009 100644
> --- a/include/sound/hdaudio.h
> +++ b/include/sound/hdaudio.h
> @@ -412,7 +412,9 @@ void snd_hdac_bus_link_power(struct hdac_device *hdev=
, bool enable);
>  void snd_hdac_bus_update_rirb(struct hdac_bus *bus);
>  int snd_hdac_bus_handle_stream_irq(struct hdac_bus *bus, unsigned int st=
atus,
>  =09=09=09=09    void (*ack)(struct hdac_bus *,
> -=09=09=09=09=09=09struct hdac_stream *));
> +=09=09=09=09=09=09struct hdac_stream *),
> +=09=09=09=09    void (*error)(struct hdac_bus *,
> +=09=09=09=09=09=09  struct hdac_stream *));
> =20
>  int snd_hdac_bus_alloc_stream_pages(struct hdac_bus *bus);
>  void snd_hdac_bus_free_stream_pages(struct hdac_bus *bus);
> diff --git a/sound/hda/common/controller.c b/sound/hda/common/controller.=
c
> index afec5c5546ec..329854c9fe92 100644
> --- a/sound/hda/common/controller.c
> +++ b/sound/hda/common/controller.c
> @@ -1058,6 +1058,15 @@ static void stream_update(struct hdac_bus *bus, st=
ruct hdac_stream *s)
>  =09}
>  }
> =20
> +static void stream_error(struct hdac_bus *bus, struct hdac_stream *s)
> +{
> +=09struct azx_dev *azx_dev =3D stream_to_azx_dev(s);
> +
> +=09spin_unlock(&bus->reg_lock);
> +=09snd_pcm_stop_xrun(azx_stream(azx_dev)->substream);
> +=09spin_lock(&bus->reg_lock);
> +}
> +
>  irqreturn_t azx_interrupt(int irq, void *dev_id)
>  {
>  =09struct azx *chip =3D dev_id;
> @@ -1082,7 +1091,8 @@ irqreturn_t azx_interrupt(int irq, void *dev_id)
> =20
>  =09=09handled =3D true;
>  =09=09active =3D false;
> -=09=09if (snd_hdac_bus_handle_stream_irq(bus, status, stream_update))
> +=09=09if (snd_hdac_bus_handle_stream_irq(bus, status, stream_update,
> +=09=09=09=09=09=09   stream_error))
>  =09=09=09active =3D true;
> =20
>  =09=09status =3D azx_readb(chip, RIRBSTS);
> diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
> index 78855ac357c6..67bb74c618bf 100644
> --- a/sound/hda/core/controller.c
> +++ b/sound/hda/core/controller.c
> @@ -676,8 +676,10 @@ EXPORT_SYMBOL_GPL(snd_hdac_bus_stop_chip);
>   * Returns the bits of handled streams, or zero if no stream is handled.
>   */
>  int snd_hdac_bus_handle_stream_irq(struct hdac_bus *bus, unsigned int st=
atus,
> -=09=09=09=09    void (*ack)(struct hdac_bus *,
> -=09=09=09=09=09=09struct hdac_stream *))
> +=09=09=09=09   void (*ack)(struct hdac_bus *,
> +=09=09=09=09=09       struct hdac_stream *),
> +=09=09=09=09   void (*error)(struct hdac_bus *,
> +=09=09=09=09=09=09 struct hdac_stream *))
>  {
>  =09struct hdac_stream *azx_dev;
>  =09u8 sd_status;
> @@ -692,6 +694,8 @@ int snd_hdac_bus_handle_stream_irq(struct hdac_bus *b=
us, unsigned int status,
>  =09=09=09=09dev_warn_ratelimited(bus->dev,
>  =09=09=09=09=09=09"stream %u dma error: 0x%02x\n",
>  =09=09=09=09=09=09azx_dev->index, sd_status);
> +=09=09=09=09if (error)
> +=09=09=09=09=09error(bus, azx_dev);
>  =09=09=09}
>  =09=09=09if ((!azx_dev->substream && !azx_dev->cstream) ||
>  =09=09=09    !azx_dev->running || !(sd_status & SD_INT_COMPLETE))
> diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
> index 1a53856c2ffb..6a5a6e526c2c 100644
> --- a/sound/soc/intel/avs/core.c
> +++ b/sound/soc/intel/avs/core.c
> @@ -270,7 +270,8 @@ static irqreturn_t avs_hda_interrupt(struct hdac_bus =
*bus)
>  =09u32 status;
> =20
>  =09status =3D snd_hdac_chip_readl(bus, INTSTS);
> -=09if (snd_hdac_bus_handle_stream_irq(bus, status, hdac_update_stream))
> +=09if (snd_hdac_bus_handle_stream_irq(bus, status, hdac_update_stream,
> +=09=09=09=09=09   NULL))
>  =09=09ret =3D IRQ_HANDLED;
> =20
>  =09spin_lock_irq(&bus->reg_lock);

This did work to surface the errors to userspace as XRUNs.

Of course, because this is an actual error in the transfer between the
CPU and controller, it does not help mitigate the actual problem itself.

Thanks!
Arun

