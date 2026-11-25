Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611786;
	b=mfLu4TxxuhSdnJHMs97QZo9loWMoBFQnzbDD74gkpMwrp0A1cimBcmZgfn6+g32/KYTC
	 7eaFN7d4OnBcdK2m3q0exELPDedT4EbCJEGkkZ2l8m9tTSquxTP36sRmylTy0igeLkPyY
	 LClX9MaEc0YF5oETwvV5F6nI3wJWWGX8YvmyL7ruIhnGO36SFRGP8L9ffkJSjqyoIxfcq
	 e+KEVnAQ8stmcsvMFtZt1QI8hnOfTSHhpQX0RvvdLLV0sHLraI6MLtwW87Q+tHBjr8yo8
	 f9dlVWC4VweFQW9bvIyVKmwOuEztskzdFJP0JOzmIK73l5DqULN2h8MHe8LwfoU5vQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611786;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ndeiZa6q8AlFGbfmk5m5dgfM2GjJpetPUKR7527fpBE=;
	b=n1m5I9GU5qefkuyJ1YnWx93amXF14mSZKzsBSJUjvaWh4RIIK8FPt0FD77McZ9NMWTL8
	 i2ZaY2jlSEJ4EasuZ2whPpQgL4A1JXsURrcIouSJjmSYBYw4DUTNSK/WnAXbN3iD/47Om
	 LdUbZNk8V2N/aaDfgE5lXmxcV9PjMglKJaRYoX61x/s5tM2Kr1SwMHffamza/mPW5N0gj
	 w2ZJbHcBZ54JJVYMLMzT+GGcWLW+OoBWxxsLz5AWU45qezLBAjKHMm+XvnaTnUrMVptGX
	 dVBePdV5zdG3L2PMagK88SFq4HPgIo4xIoMPpqKj4t2LYV23lYe9SkTO9uU4DpyFX2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3X8BeCf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D1C606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 13:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3X8BeCf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9D61F000C0;
	Wed, 25 Nov 2026 13:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611786;
	bh=ndeiZa6q8AlFGbfmk5m5dgfM2GjJpetPUKR7527fpBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f3X8BeCfuG0TnE6oy7dk8KHEBPH8enS1Xl5BOwlmplbj8II5vehscOICP4gcJ8AhQ
	 IOsEu+zmverPrBQKWEccU7ZY6wAh4iozlKQAICvSnN3PTp1S1E55686ee2p7pc6qW7
	 U6GDE6tOOrJABoYnlhavAJPlLzBRt614sLsYEnndrxXu4jSWVsT4ALWm5+ATkElVWG
	 rS2KrU8ZvW5WvJBMR2JtQeTAISou7ITh3pGuSJ3AShjB9nK6tqrCml9wrVD0qaWOWi
	 EK0oX2zaMqTkxvORNg5AmIXYXm80yU+caJsm9o+Nkg+52ame5nMzQCc78r9AAnfis5
	 t7WXigfiYpQ5Q==
Message-ID: <sashiko-outbox-233432@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Re: ALSA: asihpi: free IRQ before snd_card_free()/HPI
 delete on HPI6205 removal (UAF)
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <2c1d9b73.57c.1a212c1b142.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <358caed8.262e3.1a1d4cbccec.Coremail.xuhx@hust.edu.cn>
 <2c1d9b73.57c.1a212c1b142.Coremail.xuhx@hust.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:03:05 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] ALSA: asihpi: missing Signed-off-by trailer in commit message
- [Medium] ALSA: asihpi: free_irq() before snd_card_disconnect() in
  snd_asihpi_remove()
- [Low] ALSA: asihpi: missing Fixes trailer in bug-fix commit message
- [Low] ALSA: asihpi: free_irq() remains after HPI_ADAPTER_DELETE in
  asihpi_adapter_remove()
--

commit 66e65e67203827236524ee91f5a02759ca055bf4
Author: =E5=BE=90=E6=99=97=E7=BF=94 <xuhx@hust.edu.cn>

> ALSA: asihpi: free IRQ before snd_card_free()/HPI delete on HPI6205 remov=
al (UAF)
>
> snd_asihpi_remove() freed the ALSA card and then sent
> HPI_ADAPTER_DELETE (kfree()ing the HPI6205 phw) BEFORE free_irq():
> both the primary handler (adapter_irq_query_and_clear() reads
> phw->prHSR) and the threaded handler (snd_card_asihpi_isr() reads
> a->snd_card->private_data) could run against freed memory.
>
> free_irq() -- the first operation that waits for the in-flight
> primary and threaded handlers -- now runs before snd_card_free()
> and before HPI_ADAPTER_DELETE, with hpi->irq cleared so the existing
> if (pa->irq) guard in asihpi_adapter_remove() does not double-free

[Severity: High]
The commit message is missing a Signed-off-by: trailer, which is required by
the Developer's Certificate of Origin (Documentation/process/submitting-pat=
ches.rst).

[Severity: Low]
Since this fixes a use-after-free bug on device removal, should the commit
message include a Fixes: trailer (and a closing period on the last sentence=
):

  Fixes: f9a376c3f6d7 ("ALSA: asihpi: Add support for stream interrupt.")

> diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
> index b78e96caef9d0..e3d863c4bdc88 100644
> --- a/sound/pci/asihpi/asihpi.c
> +++ b/sound/pci/asihpi/asihpi.c
> @@ -2927,6 +2927,20 @@ static void snd_asihpi_remove(struct pci_dev *pci_=
dev)
>  			HPI_ADAPTER_PROPERTY_IRQ_RATE, 0, 0));
>  	}
> =20
> +	/* Free/quiesce the IRQ before the card and the HPI adapter objects
> +	 * go away: free_irq() is the first (and only) operation that waits
> +	 * for the in-flight primary and threaded handlers.  Afterwards
> +	 * snd_card_free() releases the card private area (read by
> +	 * snd_card_asihpi_isr() through a->snd_card->private_data) and
> +	 * asihpi_adapter_remove() sends HPI_ADAPTER_DELETE, which kfree()s
> +	 * the phw whose prHSR the primary handler dereferences through
> +	 * adapter_irq_query_and_clear().  asihpi_adapter_remove() keeps its
> +	 * if (pa->irq) guard, so this is not a double free_irq(). */
> +	if (hpi->irq) {
> +		free_irq(hpi->irq, hpi);
> +		hpi->irq =3D 0;
> +	}
> +
>  	snd_card_free(hpi->snd_card);
>  	hpi->snd_card =3D NULL;
>  	asihpi_adapter_remove(pci_dev);

[Severity: Medium]
Can a concurrent PCM trigger re-enable DSP interrupts on HPI6205 before
snd_card_free() disconnects the card, leaving the shared PCI INTx line
asserted after free_irq() removes asihpi_isr()?

CPU0                                  CPU1
snd_asihpi_remove()
  hpi_adapter_set_property(...,
    HPI_ADAPTER_PROPERTY_IRQ_RATE, 0, 0)
                                      snd_card_asihpi_trigger()
                                        snd_card_asihpi_pcm_int_start()
                                          hpi_adapter_set_property(...,
                                            HPI_ADAPTER_PROPERTY_IRQ_RATE,
                                            card->update_interval_frames, 0)
  free_irq(hpi->irq, hpi)
  snd_card_free(hpi->snd_card)
    snd_card_free_when_closed()
      snd_card_disconnect()
    wait_for_completion(&released)    <-- DSP asserts C6205_HSR_INTSRC with
                                          no handler to clear phw->prHSR

ALSA file operations remain active until snd_card_disconnect() runs inside
snd_card_free().  If a concurrent PCM start or pause-release trigger (or an
HPI_ADAPTER_SET_PROPERTY hwdep ioctl) sets HPI_ADAPTER_PROPERTY_IRQ_RATE ba=
ck
to a non-zero value before snd_card_disconnect(), the DSP can assert the
shared level-triggered interrupt after free_irq() has unregistered
asihpi_isr().  Even after snd_card_disconnect() stops the stream by zeroing
HPI_ADAPTER_PROPERTY_IRQ_RATE, nothing clears C6205_HSR_INTSRC in phw->prHSR
while snd_card_free() waits for open descriptors to close, causing an
unhandled interrupt storm.  Calling snd_card_disconnect(hpi->snd_card) befo=
re
disabling HPI_ADAPTER_PROPERTY_IRQ_RATE and calling free_irq() would stop
active streams and block new userspace operations while keeping
hpi->snd_card allocated until snd_card_free().

[Severity: Low]
Does clearing hpi->irq here leave the free_irq() call in
asihpi_adapter_remove() as dead code while keeping the broken teardown order
in asihpi_adapter_remove() itself?

sound/pci/asihpi/hpioctl.c:asihpi_adapter_remove() {
    ...
	hpi_init_message_response(&hm, &hr, HPI_OBJ_ADAPTER,
		HPI_ADAPTER_DELETE);
	hm.adapter_index =3D pa->adapter->index;
	hpi_send_recv_ex(&hm, &hr, HOWNER_KERNEL);

	if (pa->irq)
		free_irq(pa->irq, pa);
    ...
}

asihpi_adapter_probe() requests the IRQ, and asihpi_adapter_remove() is its
teardown counterpart, where HPI_ADAPTER_DELETE still runs before free_irq().
Removing the duplicate free_irq() from asihpi_adapter_remove() (or moving it
before HPI_ADAPTER_DELETE) would avoid leaving dead code and a latent
use-after-free trap for any direct caller of asihpi_adapter_remove().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2c1d9b73.57c.1a212c=
1b142.Coremail.xuhx@hust.edu.cn?part=3D1
