Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390642;
	b=LPhcbqe8QH9SmSyBciZsY2qjg1wXaBBiVoU6D6xtYymB2afWCqk/6UPgZNIUgahBLhU/
	 SizN539/09sdq4+UhSFv9mUX24ge6D2bqv/RI7N/CWLAcFr/H/+UW/VFblWSOCT6QQZfB
	 wwPjuC/tIbuCdZ5MR5mAu4OPoZOMf9ej6KR0hLfky9eBSPHArVbyVMpV6A42n8qk763ib
	 MCO6BpqrPXWOEJCxC1cpud7bkz92EMh2XfXheDLS4yMg9unBrBsA1s+OR326NkwOfMeJb
	 fA8CsjX9UWjXApDJJbJRPKTvBeTmLYawWuWQ4d8/F4i3+fvV+ECLN5cdnuqgBPb9/Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390642;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UuTW1wIHE930IedGGJPmwK9akOOFSOK80wTV8k0f68M=;
	b=hQpEaYIP3kfy1RrlWS1p1GNblOaOuDmQM7wV+A8zva9e2o3yL4SHc+Zad31LSDUGdpkL
	 aJp/00tFj583lwUwq5Xp/MumJMebbk7ii7slOL2GLMFvVKcnJ/bJ/I5bZpNOtjvdmhzN1
	 apFsafS9lam3uHfBgeX28qfYzgHhZyWa2NlOeBg3xoc1mZ0lle20tJH2uTpnbnkDSv++A
	 rM9BetUvIuyUaU+xMCmvT/3UfQ9mJvUOgOhUBU8fXaDbmGa6ujUJz75SPFeP/G6M4Ng9N
	 cU+KEe7y88X0R2ZAc7yWmPusPmTOUbBu5mK1K8LA/BbP87abDRrJAZXOLEpspiiv+ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Fbf/+/QM";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDF7606A324
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fbf/+/QM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09D21F00A06;
	Wed, 11 Nov 2026 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794390641;
	bh=UuTW1wIHE930IedGGJPmwK9akOOFSOK80wTV8k0f68M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fbf/+/QMm9mNXdLem+xU/kI3hhqXYTgydw6GxQKjtR1Dr7bUL3qADRmXX7XUvxAQv
	 kVAoFt/N2vRyFhjOa+J3ZD/dUu2/kcfiW4k2QF5Pf2NXHWfaO1qVC5ytQ9JwrgHz+O
	 ZLITZBSPfRhXgNvxKaYUDYBNp+KlKlldlbFtUi0z1oKlY09cdFw6CGCuIaPiapL+MT
	 u38f9MCsf46G/kfW9y1HBT1SAaFPRpzTpt531KkfEImPKgTc5rVlqUJ0BmyuyOkT6t
	 XyQ7GqE4uC4Xz7GsnsLBxd4+6wO6zlpgo6cnIFQM4MtGVdrCmLO9dM3y4wZuA7iUhE
	 GC5+Al0tUsc+Q==
Message-ID: <sashiko-outbox-208724@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2] ALSA: pci: add analog support for ESI MAYA44e
Reply-To: sashiko-reviews@lists.linux.dev
To: Nordschamane <nordschamane1@proton.me>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261111-codex-alsa-maya44e-v2-1-c5f94d722b54@proton.me>
References: <20261111-codex-alsa-maya44e-v2-1-c5f94d722b54@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 09:50:41 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] ALSA: maya44e: pseudonymous Signed-off-by trailer and
  MODULE_AUTHOR
- [Medium] ALSA: maya44e: race between maya_prepare() and
  maya_pcm_reset()
--

commit f092453d5ece85565f1b326e6596d2a12340f871
Author: Nordschamane <nordschamane1@proton.me>

> ALSA: pci: add analog support for ESI MAYA44e
>
> Add four-channel analog playback and capture for the ESI MAYA44e PCIe
> card (19fe:7000, subsystem 0e51:0001). Playback and capture share the
> sample clock and can use independent period sizes. Expose analog source,
> gain, direct monitoring, DAC and crossmix controls.
>
> The ES7010L register sequence comes from observed PCI transactions and
> analysis of the ESI Windows driver. The existing ALSA PCI MAYA44 driver
> was a reference for the WM8776 command format.
>
> OpenAI Codex assisted with PCI trace analysis, driver implementation,
> test tooling and the changelog. The requests covered analog playback,
> capture, mixer controls and suspend/resume. For v2, Sashiko flagged
> potential issues. Codex checked the report against the driver and ALSA
> core and prepared the changes below.
>
> Signed-off-by: Nordschamane <nordschamane1@proton.me>

[Severity: High]
The Author header and Signed-off-by trailer use the handle "Nordschamane"
rather than a real full name as required by the Developer's Certificate of
Origin, and MODULE_AUTHOR() at the bottom of the driver uses the generic
placeholder "MAYA44e Linux reverse-engineering project".

Also, the sentences at the end of the commit message ("For v2, ... prepared
the changes below.") refer to the notes below the "---" separator and
should be moved out of the permanent changelog.

> diff --git a/sound/pci/maya44e.c b/sound/pci/maya44e.c
> new file mode 100644
> index 0000000000000..961dbde73219e
> --- /dev/null
> +++ b/sound/pci/maya44e.c

[ ... ]

> +static int maya_pcm_reset(struct snd_pcm_substream *s)
> +{
> +	struct maya *m =3D snd_pcm_substream_chip(s);
> +	int err;
> +
> +	/* ALSA rebases appl_ptr from this hw_ptr under the same stream lock. */
> +	err =3D snd_pcm_lib_reset(s);
> +	if (err < 0)
> +		return err;
> +	m->last_appl =3D s->runtime->status->hw_ptr;
> +	return 0;
> +}
> +
> +static int maya_prepare(struct snd_pcm_substream *s)
> +{
> +	struct maya *m =3D snd_pcm_substream_chip(s);
> +	unsigned long flags;
> +	int err;

[ ... ]

> +	/* A linked prepare can leave the playback buffer open to ack. */
> +	snd_pcm_stream_lock_irqsave(s, flags);
> +	memset(m->ring[0], 0, m->buffer_frames * 8);
> +	memset(m->ring[1], 0, m->buffer_frames * 8);
> +	memset(s->runtime->dma_area, 0,
> +	       s->runtime->buffer_size * maya_sample_bytes(s->runtime->format) =
* 4);
> +	dma_wmb();
> +	snd_pcm_stream_unlock_irqrestore(s, flags);
> +	return 0;
> +}

[Severity: Medium]
Can a concurrent maya_ack() on a linked playback substream race between
maya_prepare() and maya_pcm_reset() when SNDRV_PCM_IOCTL_PREPARE is called
on the capture substream?

When playback and capture are linked and playback is in
SNDRV_PCM_STATE_PREPARED or SNDRV_PCM_STATE_XRUN with a non-zero
m->last_appl, preparing the capture substream only sets
buffer_accessing =3D -1 on the capture runtime while leaving playback's
buffer_accessing at 0.  snd_pcm_do_prepare() calls ops->prepare() without
the stream lock, then updates PM QoS, and only then takes the stream lock
to call snd_pcm_reset_substream() -> maya_pcm_reset():

CPU0 (capture PREPARE)            CPU1 (playback SYNC_PTR)
snd_pcm_do_prepare(playback)
  maya_prepare(playback)
    snd_pcm_stream_lock_irqsave()
    memset(m->ring[0..1], 0, ...)
    snd_pcm_stream_unlock_irqrestore()
                                  snd_pcm_sync_ptr(playback)
                                    snd_pcm_stream_lock_irq()
                                    maya_ack(playback)
                                      writes m->ring[0..1] at old last_appl
                                      m->last_appl =3D appl
                                    snd_pcm_stream_unlock_irq()
  pcm_qos_req_update()
  snd_pcm_reset_substream(playback)
    maya_pcm_reset(playback)
      snd_pcm_lib_reset(playback)
      m->last_appl =3D 0;           <-- ring[0..1] retains stale samples

This leaves non-zero samples from the pre-reset appl_ptr offset in
m->ring[0] and m->ring[1] and discards the acknowledged pointer update.
Zeroing m->ring[0..1] and runtime->dma_area inside maya_pcm_reset() under
the same stream lock acquisition that resets appl_ptr and m->last_appl
would close this window.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-codex-alsa=
-maya44e-v2-1-c5f94d722b54@proton.me?part=3D1
