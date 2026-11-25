Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611964;
	b=ww+gYIR+zUU61V3a7MflX90NS8AYFj3ZQq7h9gGA/tKVWFkdIGXmXYs40iGyfSzkarZW
	 fcyRiD7do0eOeM6vYMrZ6iTKYuxwb8cxH2kmHLmmSYFXWrJUGhq/lSHc1EXQA1sYoc5fp
	 dED9+jmMJB1ZjtU5GecIwkXUIWMFCva0lc8DQX5eyUMXNGwlgGh3Wwc7TEHR0ZJbMBpTF
	 1JV2+FkBv/KOgGNu4cvKjsMpimuPwZgWdQ/8+Qb81r5tLdDZOjOhqQvA6pbt2XqgfYXeV
	 siOlq0DoRq0d9jInB6frqEYSg8X3HfZmLz/KBIWnpRvfBITQdvxL+mW8mpZSKYqwemQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611964;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hZh1S+KvMqEO5kko1bVmIL17c2VmFipz9BikyBBCfh0=;
	b=zrpKzqxdfTxbe4UuOdM4UrxoodzNYXHJqkfl33ZKd/2wWT7N+fkydRC5t53mA777JfKE
	 +uvnlEMv0AU1iL7IEQ+X9BSNF+itLDF9O03dscfs/z6N0DzMFl9p4ubwTWWg1btWSRern
	 jernFgmjGz+NPrYpEVPB76Q+5X9fLYq9i9sD36/61eXoPnEn71nNruNXk/iTssRJHjoX5
	 IsrBEQZ7+DkSXQ9aRqWWEQnNz9Qv/ESlaUQrs8YPK+W6pgIkEGOKCnTg8f/LrW8//t1x8
	 FT9pCeiWXdwzgb6yrRpDexA4+5dHBuyvEObITvr3AXt7q5s+OUO+vlyFxoAlzlAbvQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jle9xdHW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB5C606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 13:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jle9xdHW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A619A1F000D3;
	Wed, 25 Nov 2026 13:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611963;
	bh=hZh1S+KvMqEO5kko1bVmIL17c2VmFipz9BikyBBCfh0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jle9xdHWPzkmnlVC/6R304IYWTjz4zRT3WeNsjN71BQsEkynsvKR4I0oESNpMm+2u
	 7c9gl64jikJD1bZJBLLc4RLEBlq+Sw7KGDz2p4t10jLvns6L8oqTCoX9johnkgtLC3
	 ypkb6Xyl+ecfUN+RTASwUHzVcoDOl5425/zkuULqQU/FNgEGtbl1O+z6xVQhDYZuLa
	 hNJf91uoDJ3RvheULDDtfvhL9KrKu8XLbCTcM4Cf0M3UxfCCCEI6Juo+9/ish3Fchw
	 UrMCDeUNhfCOFrV5VUhxaC7nOqN5oHzNywpNzYjrZTfYHT15tnHs32vAlivhoygFES
	 OGXbS/DBPNr3A==
Message-ID: <sashiko-outbox-233452@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Re: ALSA: asihpi: quiesce PCM timer and IRQ before
 freeing dpcm on close (UAF)
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8e25ddf.57f.1a212c231fe.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <2337e87f.262ec.1a1d4cd7b94.Coremail.xuhx@hust.edu.cn>
 <8e25ddf.57f.1a212c231fe.Coremail.xuhx@hust.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:06:00 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] ALSA: asihpi: missing Signed-off-by trailer in commit message
- [High] ALSA: asihpi: unreachable synchronize_irq() in
  snd_card_asihpi_runtime_free()
- [High] ALSA: asihpi: quiescing in snd_card_asihpi_runtime_free() runs
  after hw_free()
--

commit 95d808dec25e736dfee562fd8a1a93b51e97b152
Author: =E5=BE=90=E6=99=97=E7=BF=94 <xuhx@hust.edu.cn>

> ALSA: asihpi: quiesce PCM timer and IRQ before freeing dpcm on close (UAF)
>
> snd_card_asihpi_runtime_free() kfree()d the per-open
> snd_card_asihpi_pcm while a polled timer callback or an
> IRQ/threaded handler could still use it: the polled stop path uses
> plain timer_delete() (no wait for a running callback), and the IRQ
> stop path clears card->llmode_streampriv with a plain store and no
> synchronize_irq().
>
> Quiesce in runtime->private_free, which runs in process context from
> snd_pcm_detach_substream() outside the PCM stream lock (so the
> sleeping sync calls are allowed there): timer_shutdown_sync() for
> the polled timer; for IRQ mode, clear card->llmode_streampriv and
> synchronize_irq(card->hpi->irq) before the kfree(dpcm).

[Severity: High]
This commit is missing a Signed-off-by: trailer.

> diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
> index b78e96caef9d0..f528039651ab1 100644
> --- a/sound/pci/asihpi/asihpi.c
> +++ b/sound/pci/asihpi/asihpi.c
> @@ -495,6 +495,29 @@ snd_card_asihpi_hw_free(struct snd_pcm_substream *su=
bstream)
>  static void snd_card_asihpi_runtime_free(struct snd_pcm_runtime *runtime)
>  {
>  	struct snd_card_asihpi_pcm *dpcm =3D runtime->private_data;
> +	struct snd_card_asihpi *card =3D snd_pcm_substream_chip(dpcm->substream=
);
> +
> +	/* Quiesce the polled timer and the low-latency IRQ stream before
> +	 * the memory goes away.  This runs in process context from
> +	 * snd_pcm_detach_substream(), outside the PCM stream lock, so the
> +	 * sleeping sync calls are allowed here (they must NOT be put into
> +	 * the trigger/stop path under the stream lock).
> +	 *
> +	 * Polled mode: snd_card_asihpi_pcm_timer_stop() uses plain
> +	 * timer_delete(), which does not wait for a callback that is
> +	 * already running on another CPU -- the callback dereferences dpcm
> +	 * throughout and re-arms itself if it observes respawn_timer set.
> +	 *
> +	 * IRQ mode: card->llmode_streampriv is cleared with a plain store
> +	 * by snd_card_asihpi_pcm_int_stop(); the threaded handler may
> +	 * already have loaded the pointer, so synchronize the IRQ line
> +	 * after clearing before the kfree(). */
> +	timer_shutdown_sync(&dpcm->timer);

[Severity: High]
Isn't quiescing in runtime->private_free too late to protect
runtime->dma_area and dpcm->h_stream during teardown?

In snd_pcm_release_substream() (or when userspace issues
SNDRV_PCM_IOCTL_HW_FREE without closing the device), do_hw_free() and
substream->ops->close() run before snd_pcm_detach_substream() invokes
snd_card_asihpi_runtime_free():

CPU0                              CPU1
snd_pcm_release_substream()
  snd_pcm_drop()
    ...
    timer_delete(&dpcm->timer)
                                  snd_card_asihpi_timer_function()
  do_hw_free()
    snd_card_asihpi_hw_free()
      hpi_stream_host_buffer_detach()
    snd_pcm_lib_free_pages()
      runtime->dma_area =3D NULL
  substream->ops->close()
    hpi_outstream_close()
                                    pd =3D &s->runtime->dma_area[buf_ofs];
                                    hpi_outstream_write_buf(ds->h_stream, p=
d, ...)
                                      <-- NULL deref / DMA buffer UAF
  snd_pcm_detach_substream()
    snd_card_asihpi_runtime_free()
      timer_shutdown_sync(&dpcm->timer)

Both snd_pcm_drop() and do_hw_free() call snd_pcm_sync_stop() outside the
PCM stream lock before freeing pages or closing the stream, so quiescing
the timer and IRQ in a struct snd_pcm_ops .sync_stop callback would cover
both hw_free and close.

> +	if (card->llmode_streampriv =3D=3D dpcm) {
> +		card->llmode_streampriv =3D NULL;
> +		if (card->hpi->irq)
> +			synchronize_irq(card->hpi->irq);
> +	}
>  	kfree(dpcm);
>  }

[Severity: High]
Can synchronize_irq() ever be reached here?

snd_pcm_release_substream() unconditionally calls snd_pcm_drop() before
snd_pcm_detach_substream().  For an active stream in IRQ mode,
snd_pcm_drop() triggers snd_card_asihpi_pcm_int_stop(), which sets
card->llmode_streampriv =3D NULL:

sound/pci/asihpi/asihpi.c:snd_card_asihpi_pcm_int_stop() {
	...
	hpi_handle_error(hpi_adapter_set_property(card->hpi->adapter->index,
		HPI_ADAPTER_PROPERTY_IRQ_RATE, 0, 0));

	card->llmode_streampriv =3D NULL;
}

By the time snd_card_asihpi_runtime_free() runs, card->llmode_streampriv
is already NULL, so card->llmode_streampriv =3D=3D dpcm is always false and
kfree(dpcm) can still race with an in-flight threaded IRQ handler running
snd_card_asihpi_isr() -> snd_card_asihpi_timer_function().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/8e25ddf.57f.1a212c2=
31fe.Coremail.xuhx@hust.edu.cn?part=3D1
