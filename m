Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611626;
	b=5c9UJAZpRhVUD1QW2huIUdCGI/+zSWZXz2lFDqWI2O/Uk3pmTktN4bFySPIX/j0lw+1U
	 903PKjP/UzM9lC1uOngMVn2112CdXERuOC2pnwYSu6Us9/1E6SdywT8p8mqrWdGqd+yGV
	 rmC6DnJmk+xlHF9UDL3ryqovAC/lVsInsW2vWLkrZ9TjS+fZdZLETcbsoUBFQ2I5IBlyy
	 ralgeciDGDBJ5weojq07DSSSlJ+Qx2DzupiFm3qowwf5Xds/z1yo9usQTBRh+W3uNTf9Y
	 w50Otj+d/zQXjYw7m1c25ydr7RuFIxUSwU/lkEFmM6IO+EGKcKS7M1A3RhUAdQHS0FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611626;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vsOiNJa1TsSHH/mtLr6WJR07ksB++DDu3lv8FgLXVxY=;
	b=T2o4daKbdYz19QkKDULsYiwnjLJLxXDhtoUEcGXE/7IS0vBT4KGwwOQwitBgESPsBrPu
	 cy6puCFJS86E/hdU37wvSBE5rce3vhrw5VWiZNLVCK8bFscbH6aaqCO+M84Cb76CcUJ/G
	 J2J8MHWUQ1dRpWwf9GN1PCa16sHAaS1RQlbMr7Vzu78wGsBaVEwovRjEz24FeMOtGsdj3
	 fS4FlidNcKJjWFNZ831yjHBin1NBONaR/v27i/s6Xtm4HxS6JqzBh3/Nji16oAtV9bb4g
	 R45WzCe0AsnIY4u/HsAjLwxm51bhP/EGV9c/FLc1IHYw65YriPKCmsoxYFe0z4W1Ifw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JphkrIiL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4A0606A69F
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JphkrIiL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCDF1F000EE;
	Wed, 25 Nov 2026 13:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611625;
	bh=vsOiNJa1TsSHH/mtLr6WJR07ksB++DDu3lv8FgLXVxY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JphkrIiL2PdjrPmTt7cujKKDNB2EmH9elFEfrl1GUT3dAj/YNJo7jBIgjIas0/l2k
	 0ky336SETcoajhXx1ef3z7sjZTGlIoXn6XJecKkiGKAsySy8opaaLrJZFD50QF7eHA
	 eEwC8A5On8/CYwtRdyqD/1upNpeRr9Pp25ppsUgonJVO4Ha8K2ktgdtiNmEjoMJSeE
	 0a16dd0KgAotq5FVTaHC80USAueu0Fx5EFdGEWVPKptQ/6eSeszY/gs6LLZnZDyOjE
	 TdmEsniaLr8JgK8zKN5geryD0FuUN4b4qLJpscYRBukeBd7PAfivOev7dEN+lK9Iin
	 /rQxl6nJoHCng==
Message-ID: <sashiko-outbox-233427@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Re: sound: core: card->devices is unlocked across the
 codec-side  targeted free and the card-side bulk free (double free / UAF;
 KASAN  confirmed on 7.3)
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <107cbd83.556.1a212b8f680.Coremail.xuhx@hust.edu.cn>
References: <18ba4e54.1b567.1a18b1ea506.Coremail.xuhx@hust.edu.cn>
 <107cbd83.556.1a212b8f680.Coremail.xuhx@hust.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:00:25 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [Critical] ALSA: core: infinite loop in snd_device_register_all() on
  card registration
- [High] ALSA: core: missing Signed-off-by trailer in commit message
- [High] ALSA: core: implicit declaration of look_for_dev() in
  snd_device_claim()
- [High] ALSA: core: unlinking devices in snd_device_claim*() breaks
  teardown ordering
- [Medium] ALSA: core: snd_device_insert() reorders same-type devices on
  claim and restore
- [Medium] ALSA: control: linear scan in snd_ctl_remove() causes O(N^2)
  bulk teardown
--

commit ba38a9fa39aebc163045817c433435b040527cc8
Author: =E5=BE=90=E6=99=97=E7=BF=94 <xuhx@hust.edu.cn>

> sound: core: card->devices is unlocked across the codec-side targeted fre=
e and the card-side bulk free (double free / UAF; KASAN confirmed on 7.3)
>
> card->devices was maintained entirely without locks while three
> paths with pairwise-disjoint lock sets mutate it: the HDA codec
> driver's targeted snd_device_free() of its PCM/JACK nodes, the
> card-side bulk snd_device_disconnect_all()/snd_device_free_all(),
> and the register_all() traversal.  A codec unbind racing the card
> teardown produced double frees and use-after-frees on the list, the
> snd_device and the freed PCM/chmap kcontrol.
>
> Serialize every list operation with a per-card device_list_lock,
> but never hold it across a device callback: a node is *claimed*
> (unlinked under the lock) while its dev_disconnect/dev_register/
> dev_free callbacks run, so a concurrent targeted free can no longer
> find and double free the same node, and no traversal can touch a
> node being freed.  For the chmap kcontrol form, snd_ctl_remove() now
> verifies the instance is still linked on card->controls before
> touching it, so a stale pointer can no longer be list_del()'d and
> double kfree()d by the PCM teardown racing the CONTROL teardown.

[Severity: High]
The commit message is missing a Signed-off-by trailer.

> diff --git a/sound/core/control.c b/sound/core/control.c
> index 4199342d4ffe0..82e794c4f8cd1 100644
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -620,10 +620,21 @@ static inline int snd_ctl_remove_locked(struct snd_=
card *card,
>   */
>  int snd_ctl_remove(struct snd_card *card, struct snd_kcontrol *kcontrol)
>  {
> +	struct snd_kcontrol *ctl;
> +
>  	if (!kcontrol)
>  		return 0;
>  	guard(rwsem_write)(&card->controls_rwsem);
> -	return snd_ctl_remove_locked(card, kcontrol);
> +	/* Paranoia against stale pointers: a caller (e.g. the PCM chmap
> +	 * teardown) may race the card's CONTROL teardown, which has
> +	 * already removed and freed this very kcontrol.  Verify the
> +	 * instance is still linked on the card's control list before
> +	 * touching its contents. */
> +	list_for_each_entry(ctl, &card->controls, list) {
> +		if (ctl =3D=3D kcontrol)
> +			return snd_ctl_remove_locked(card, kcontrol);
> +	}
> +	return -ENOENT;
>  }
>  EXPORT_SYMBOL(snd_ctl_remove);

[Severity: Medium]
Does scanning card->controls from the head on every snd_ctl_remove() make
bulk control removal quadratic?

During ASoC topology unload, snd_soc_tplg_component_remove() calls
soc_tplg_remove_kcontrol() and soc_tplg_remove_widget() in reverse
insertion order (from the tail of card->controls backward), so each
snd_ctl_remove() walks all remaining preceding controls on card->controls
under card->controls_rwsem.

> diff --git a/sound/core/device.c b/sound/core/device.c
> index 5f2aa476d89b3..ad0369db8f8fe 100644
> --- a/sound/core/device.c
> +++ b/sound/core/device.c
> @@ -10,6 +10,82 @@
[ ... ]
> +/* claim (unlink) the node for @device_data, or return NULL if it is not
> + * on the list (e.g. concurrently claimed and freed by another path) */
> +static struct snd_device *snd_device_claim(struct snd_card *card,
> +					   void *device_data)
> +{
> +	struct snd_device *dev;
> +
> +	guard(spinlock_irqsave)(&card->device_list_lock);
> +
> +	dev =3D look_for_dev(card, device_data);
> +	if (dev)
> +		list_del(&dev->list);
> +	return dev;
> +}

[Severity: High]
Does sound/core/device.c fail to build because look_for_dev() is called in
snd_device_claim() before its static definition later in the file?

[ ... ]

> @@ -171,14 +246,19 @@ static int __snd_device_register(struct snd_device =
*dev)
>  int snd_device_register(struct snd_card *card, void *device_data)
>  {
>  	struct snd_device *dev;
> +	int err;
> =20
>  	if (snd_BUG_ON(!card || !device_data))
>  		return -ENXIO;
> -	dev =3D look_for_dev(card, device_data);
> -	if (dev)
> -		return __snd_device_register(dev);
> -	snd_BUG();
> -	return -ENXIO;
> +	dev =3D snd_device_claim(card, device_data);
> +	if (!dev) {
> +		snd_BUG();
> +		return -ENXIO;
> +	}
> +
> +	err =3D __snd_device_register(dev);
> +	snd_device_insert(card, dev);
> +	return err;
>  }
>  EXPORT_SYMBOL(snd_device_register);

[Severity: Medium]
Can claiming a device and re-inserting it via snd_device_insert() reverse
the teardown order of same-type devices?

snd_device_insert() places dev at the tail of its dev->type group.  When a
device's .dev_register callback creates and registers a child device of the
same snd_device_type (such as OPL3's SNDRV_DEV_SEQUENCER registration
calling snd_opl3_seq_probe() -> snd_opl3_init_seq_oss() to register
opl3->oss_seq_dev), the child is inserted while the parent is unlinked, and
snd_device_insert() then places the parent after the child.  Reverse-order
teardown in snd_device_disconnect_all() and snd_device_free_all() will then
disconnect and free the parent before the child.

> @@ -190,11 +270,26 @@ int snd_device_register_all(struct snd_card *card)
>  {
>  	struct snd_device *dev;
>  	int err;
> -=09
> +
>  	if (snd_BUG_ON(!card))
>  		return -ENXIO;
> -	list_for_each_entry(dev, &card->devices, list) {
> +
> +	/* register one device at a time: claim it off the list while its
> +	 * dev_register callback runs.  A dev_register callback may itself
> +	 * register another (not yet processed) device, so the nodes stay
> +	 * visible on the list between the callbacks. */
> +	for (;;) {
> +		scoped_guard(spinlock_irqsave, &card->device_list_lock) {
> +			dev =3D list_first_entry_or_null(&card->devices,
> +						       struct snd_device, list);
> +			if (dev)
> +				list_del(&dev->list);
> +		}
> +		if (!dev)
> +			break;
> +
>  		err =3D __snd_device_register(dev);
> +		snd_device_insert(card, dev);
>  		if (err < 0)
>  			return err;
>  	}

[Severity: Critical]
Does snd_device_register_all() loop forever whenever card->devices is
non-empty?

Each iteration pops the first device from card->devices, calls
__snd_device_register(dev), and immediately puts dev back onto
card->devices via snd_device_insert(card, dev).  Because card->devices
never becomes empty and __snd_device_register() returns 0 once dev->state
is SNDRV_DEV_REGISTERED, the loop spins endlessly on the lowest-type
device and hangs snd_card_register().

> @@ -207,12 +302,23 @@ int snd_device_register_all(struct snd_card *card)
>   */
>  void snd_device_disconnect_all(struct snd_card *card)
>  {
> -	struct snd_device *dev;
> +	LIST_HEAD(claimed);
> +	struct snd_device *dev, *next;
> =20
>  	if (snd_BUG_ON(!card))
>  		return;
> -	list_for_each_entry_reverse(dev, &card->devices, list)
> +
> +	/* claim every node, then run the disconnect callbacks with the
> +	 * list lock released; a claimed node is invisible to concurrent
> +	 * targeted disconnect/free calls, so no callback races a free of
> +	 * its own device */
> +	snd_device_claim_all(card, &claimed);
> +	list_for_each_entry_safe(dev, next, &claimed, list)
>  		__snd_device_disconnect(dev);
> +
> +	/* put the disconnected devices back in their original order; the
> +	 * card free path walks the list again */
> +	snd_device_restore_all(card, &claimed);
>  }
> =20
>  /*
> @@ -221,19 +327,28 @@ void snd_device_disconnect_all(struct snd_card *car=
d)
>   */
>  void snd_device_free_all(struct snd_card *card)
>  {
> +	LIST_HEAD(claimed);
>  	struct snd_device *dev, *next;
> =20
>  	if (snd_BUG_ON(!card))
>  		return;
> -	list_for_each_entry_safe_reverse(dev, next, &card->devices, list) {
> -		/* exception: free ctl and lowlevel stuff later */
> +
> +	/* first pass: free everything but ctl and lowlevel stuff later;
> +	 * the claimed list is in reverse card-list order, i.e. the original
> +	 * free order */
> +	snd_device_claim_all(card, &claimed);
> +	list_for_each_entry_safe(dev, next, &claimed, list) {
>  		if (dev->type =3D=3D SNDRV_DEV_CONTROL ||
>  		    dev->type =3D=3D SNDRV_DEV_LOWLEVEL)
>  			continue;
> +		list_del(&dev->list);
>  		__snd_device_free(dev);
>  	}
> =20
> -	/* free all */
> -	list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
> +	/* free all; the claimed nodes are off the card list, so a
> +	 * concurrent targeted free cannot find them again */
> +	list_for_each_entry_safe(dev, next, &claimed, list) {
> +		list_del(&dev->list);
>  		__snd_device_free(dev);
> +	}
>  }

[Severity: High]
Does moving all devices onto a local claimed list break nested and
concurrent snd_device_free() callers that free backing memory as soon as
snd_device_free() returns?

During single-threaded teardown, snd_device_disconnect_all() and
snd_device_free_all() empty card->devices onto claimed before running any
callbacks.  When a callback performs a nested snd_device_free() on a child
device, snd_device_claim() cannot find the child on card->devices and
returns NULL:

- Disconnecting or freeing a SNDRV_DEV_SEQUENCER device calls
  snd_emu8000_remove(), which calls snd_device_free(dev->card, hw->pcm)
  and immediately frees hw->emu and hw->memhdr while hw->pcm is still on
  claimed and runs its callbacks later against the freed structures.

- In snd_i2c_bus_free(), freeing a master bus loops on
  while (!list_empty(&bus->buses)) calling snd_device_free(bus->card,
  slave) to unlink each slave; because slave is on claimed instead of
  card->devices, snd_device_free() is a no-op and the loop spins forever.

The same premature return happens in the concurrent HDA codec unbind path
that this patch targets:

CPU0                                  CPU1
snd_card_disconnect()
  snd_device_disconnect_all()
    snd_device_claim_all(..., &claimed)
                                      snd_hda_codec_cleanup_for_unbind()
                                        codec_release_pcms()
                                          snd_device_free(..., pcm->pcm)
                                            snd_device_claim() -> NULL
                                          kfree(pcm)
    snd_device_restore_all()
snd_card_do_free()
  snd_device_free_all()
    __snd_device_free()
      ...
        azx_pcm_free()
          apcm->info->pcm =3D NULL;  <-- use-after-free

Conversely, if CPU1 claims a device in snd_device_free() (or
snd_device_disconnect() / snd_device_register()) just before CPU0 calls
snd_device_claim_all() in snd_device_free_all(), CPU0 does not wait for the
in-flight callback before freeing SNDRV_DEV_LOWLEVEL and struct snd_card.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/107cbd83.556.1a212b=
8f680.Coremail.xuhx@hust.edu.cn?part=3D1
