Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415319;
	b=LcoLbz6jwh6yezSejlDH0pQQPYOQWmdZJoFKiMVi4nLMlnJkkJJ5o3pJkMYP0wMcvGIy
	 drb1/r/hTyv4ntmnORiihx1RbQjnAN8VUvVwcEluLI+Q0gV8ggkjxTaxJ6ueUdPY7txr/
	 C6fSJA+aEIyh9ZjR1tLkK+w5hnWhGCjXB0x/lkXP1Ww+Jlji94zhawEFFdUO2PpVvJWYO
	 Onb27yNfrsYGCeL2NP97E0Q8NURwXNM5IhaYRsBOj3vENxdbF5a1sSE811D91FiV73MZU
	 GjfsdTGV2LF9dp2YqqFr8fEuvNoC2ofQr6ieGQUHxR68Mb+Qw27NfaaOlpi8EL/ykPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415319;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=avHHoG5XVSVSoSjFim4P+LEszZGcMDA+Vt36MjSe4OI=;
	b=bWh1k2kOSFdxQL+92mM16cTwu+w7Q7n80uO+I+0RSqCjBVY2Dx/b1QAFI1mIqfnTp3d1
	 yMHv44XzXVakCVsS9QlfH96larPXvsLFzRUbJMOyKMRXB+znFoE/Khwa74AtO6uDlmlvb
	 2HYNcjPEpEQ1CgwIdmLARxlkTSX+dc48yv/HfA0PxAc7HCCE5SI6eBOwqzSO57yxexi3l
	 DhiEscFnjtZdN0tEiDUE8YRnyrnGO9stpXRchGf8Q+bgjW8bkjNNiZgDH77OjLagchSBY
	 VgBxDGW3dd9geyYYO0JhhEDeiciGos874pcBP4GZ/oilTTNmXu6VDwgI85HNFCM+b6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P2Sp7Xwp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340EC606A31C
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P2Sp7Xwp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADA71F00A06;
	Wed, 11 Nov 2026 16:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794415318;
	bh=avHHoG5XVSVSoSjFim4P+LEszZGcMDA+Vt36MjSe4OI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P2Sp7XwpUncVvQuLpnnlopApKNyQSF3LIfwKcef6if2X+1KKy7W9Ln8gkkT0Z1Lq/
	 ZKG9At4HMndXkaYBcIfvUWBCWRNIs9+zZLlEg8lpTIxcXebUnlcK8s4WXy11cOkWbT
	 nTJ7OlaIe3CYRqgQEV9A2pP8b0xRCy7U5ajFbAXFKVbEKw7OEVQYKX9GxV+Xo+gVfF
	 spqgsCUHq6sR55lnEq8PLifY7J4A6mSwMSba7IHxHXSKcFgIgZXL6My2gJZX68JTnS
	 /TvJZAbFgo1URaYwNPsCcUU4B8ohGBt7vwf5kyaFHYKpdh9+TaPWsarEp67mco5dMy
	 4go9UAs1oCcMQ==
Message-ID: <sashiko-outbox-209306@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3] ALSA: pci: add analog support for ESI MAYA44e
Reply-To: sashiko-reviews@lists.linux.dev
To: Nordschamane <nordschamane1@proton.me>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261111-codex-alsa-maya44e-v3-1-7977fb5a1b91@proton.me>
References: <20261111-codex-alsa-maya44e-v3-1-7977fb5a1b91@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 16:41:58 +0000
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
- [High] ALSA: maya44e: pseudonymous Signed-off-by trailer and
  MODULE_AUTHOR
- [Medium] ALSA: maya44e: missing reset callback in maya_capture_ops
- [Medium] ALSA: maya44e: all-ones MMIO read treated as reset completion
  in maya_rearm()
--

commit 08f5d983b63627639e3f62af3419f16aa31a3501
Author: Nordschamane <nordschamane1@proton.me>

> ALSA: pci: add analog support for ESI MAYA44e
>
> Add four-channel analog playback and capture for the ESI MAYA44e PCIe
> card (19fe:7000, subsystem 0e51:0001). Playback and capture share the
> sample clock and can use independent period sizes. Expose analog source,
> gain, direct monitoring, DAC and crossmix controls.
>
> The playback DMA rings and ALSA staging buffer are cleared during the
> reset that completes prepare. This keeps clearing and pointer rebasing
> under the same PCM stream lock, including for linked streams.
>
> The ES7010L register sequence comes from observed PCI transactions and
> analysis of the ESI Windows driver. The existing ALSA PCI MAYA44 driver
> was a reference for the WM8776 command format.
>
> OpenAI Codex assisted with PCI trace analysis, driver implementation,
> test tooling and the changelog. The requests covered analog playback,
> capture, mixer controls and suspend/resume.
>
> Signed-off-by: Nordschamane <nordschamane1@proton.me>

[Severity: High]
Does the Signed-off-by trailer identify a known individual contributor as
required by Documentation/process/submitting-patches.rst for Developer
Certificate of Origin certification?

The commit Author and Signed-off-by trailer use the single-word handle
"Nordschamane", and MODULE_AUTHOR() in sound/pci/maya44e.c uses the
generic placeholder "MAYA44e Linux reverse-engineering project" instead of
an individual author name.

> diff --git a/sound/pci/maya44e.c b/sound/pci/maya44e.c
> new file mode 100644
> index 0000000000000..10fc899f89dae
> --- /dev/null
> +++ b/sound/pci/maya44e.c

[ ... ]

> +static int maya_rearm(struct maya *m, unsigned int pair)
> +{
> +	unsigned int b =3D 0xc0 + pair * 0x20;
> +	unsigned int irq =3D 0x198 + pair * 4;
> +	unsigned int i;
> +
> +	mw32(m, b, 0xff000000);
> +	mw8(m, irq + 2, 2);
> +	mw8(m, b, 1);
> +	for (i =3D 0; i < MAYA_POLL_LIMIT; ++i) {
> +		if (mr32(m, b) & 1)
> +			break;
> +		/* Reset callers may hold m->lock, so this wait must not sleep. */
> +		udelay(10);
> +	}
> +	if (i =3D=3D MAYA_POLL_LIMIT) {
> +		maya_fatal(m);
> +		return -ETIMEDOUT;
> +	}

[Severity: Medium]
Does maya_rearm() treat an all-ones MMIO read (~0U) from an inaccessible
PCIe device as a completed DMA reset?

Unlike maya_irq(), which checks for summary =3D=3D ~0U, and maya_codec_read=
y(),
which waits for bit 7 to clear, maya_rearm() and maya_capture_reset() only
check (mr32(m, b) & 1).  If the PCIe link drops during prepare or resume,
0xffffffff satisfies the condition on the first iteration instead of
calling maya_fatal() and returning -ETIMEDOUT, allowing the driver to
rewrite DMA descriptors, mark streams as running, or re-enable bus
mastering on an inaccessible device.

[ ... ]

> +static const struct snd_pcm_ops maya_capture_ops =3D {
> +	.open =3D maya_capture_open,
> +	.close =3D maya_capture_close,
> +	.ioctl =3D snd_pcm_lib_ioctl,
> +	.hw_params =3D maya_hw_params,
> +	.hw_free =3D maya_hw_free,
> +	.prepare =3D maya_capture_prepare,
> +	.trigger =3D maya_capture_trigger,
> +	.sync_stop =3D maya_sync_stop,
> +	.pointer =3D maya_capture_pointer,
> +};

[Severity: Medium]
Should maya_capture_ops set .reset =3D snd_pcm_lib_reset?

Without .reset, capture streams fall back to the legacy multi-step reset
path in snd_pcm_reset_substream() and snd_pcm_post_prepare():

CPU0 (SNDRV_PCM_IOCTL_RESET)      CPU1 (<hardirq>)
snd_pcm_reset_substream(capture)
  snd_pcm_lib_ioctl_reset()
    lock(capture)
    status->hw_ptr %=3D buffer_size
    unlock(capture)
                                  maya_irq()
                                    snd_pcm_period_elapsed(capture)
                                      snd_pcm_update_hw_ptr0()
                                        /* uses un-reset hw_ptr_base */
  lock(capture)
  runtime->hw_ptr_base =3D 0        <-- status->hw_ptr left offset or dropp=
ed
  unlock(capture)

Once capture has run past one buffer so hw_ptr_base >=3D buffer_size, a
period interrupt arriving in that window combines the old hw_ptr_base with
the reduced status->hw_ptr, leaving status->hw_ptr offset by buffer_size
or triggering hw_ptr_error().  In addition, during a linked prepare where
capture precedes playback, snd_pcm_post_prepare() overwrites capture
appl_ptr without holding the capture stream lock after playback finishes
maya_prepare().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-codex-alsa=
-maya44e-v3-1-7977fb5a1b91@proton.me?part=3D1
