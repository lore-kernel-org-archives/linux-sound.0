Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382330;
	b=fBHcnKKqhCkwIeQKqH2ZzXxA6xUcpv4PYHMQB8KcJbaQ9H78/c0lgbQx53lvENR+U627
	 RwKRURDJ1ZKH2DeQy2Of3B9cExHNSjUJwZ32e/n3t/VY5n08cd3E1hY7+5YTv9cOEZFRd
	 55vAC0fRAAAFd1ApL17cSzrOYBUc3or5MA9QJ+4yL+iVKPQYLgVp0N2drdmGCF3ZRu8CG
	 5q8/I16ebdtQEmS37cvDaa1qfFvPdXbBB/hDwPgVzZNqRnpODzOkuG+5NvhQIXtglFwyi
	 l+Y1iFdGxfnepLWKehyCRBvM7yNIFoqZcFlJ+YoCR71LzQySekKSjIdplk/lTVp9yoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382330;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oqqSw5TOLL9PP4bUy4GKSR/s8ifpTlpxm3hOBnYbOWU=;
	b=uW7g9L24UXzStoBFJnUo+QduNRW3xZf58PpWlvPjEcKSXSXoAysd+pRC3Bb0X4i8uQcm
	 TzX0u8dOoeBHsMAAel4zg3wTW1grljetqBuJHMo0JvfQoMpB9R8IHX5qJyqEDqR3cuF/4
	 C+qyu9k5k3G807Ypg+Gt2K7YWWjyYNU/M4w2Y2IEvVtXz8uZ4vVqUXd1SGqxg8gc9i4Cm
	 ulJIlb3s+om2sx3XbZMVBwQF9zgJ5arCwSzshJ6kqHGMjopBi0y39zDdMHCdTwGwPNmmg
	 md+XP7SGdtao4JjZNSr7RlAScR5tC1oAr2QqncoK4vKrq5yF1K4QOc8iJZkQ7SeULfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WA1HeE2l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7657C606A32A
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 07:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WA1HeE2l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC1E1F00A05;
	Wed, 11 Nov 2026 07:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794382330;
	bh=oqqSw5TOLL9PP4bUy4GKSR/s8ifpTlpxm3hOBnYbOWU=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=WA1HeE2lRsJLxxtbAGdpW5GNRhd1j1BB56UwbvnREDsjdyRXXI6hIEz6yKCVAvwmt
	 KtFQKPMWZNOHx7VJYnqis2M3PiPnUfyVmRinyuYX6NrxrS4YCcFcpCS497ZFFTc/Qb
	 itGLWOlCFCK3dDdA1CVEnVzu2vB9y56Jx0Rh8rAYE4+ql2QWojuBTFprB45lj5yHFb
	 pTUjfukBJAy/Xt/4Ngf1FYwRcFa1Pr2psGcA7Txxr489rgoStViVJXRT9ZJTQ7hgW6
	 0AxGz/XwTWEl84p7fB8O2AARKt2NzMeVMQrc4qB6mLnOQavdmfzg2Bq6UZOLhcM7Rq
	 DI4+LE9mCSy+A==
Message-ID: <sashiko-outbox-208525@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] ALSA: pci: add analog support for ESI MAYA44e
Reply-To: sashiko-reviews@lists.linux.dev
To: Nordschamane <nordschamane1@proton.me>, linux-sound@vger.kernel.org
In-Reply-To: <20261111-codex-alsa-maya44e-v1-1-df60af443e93@proton.me>
References: <20261111-codex-alsa-maya44e-v1-1-df60af443e93@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 07:32:09 +0000
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
- [High] ALSA: maya44e: pseudonymous Signed-off-by trailer and
  MODULE_AUTHOR
- [High] ALSA: maya44e: unrestored D0 power state in maya_resume() error
  path
- [High] ALSA: maya44e: NULL runtime->dma_area dereference in maya_ack()
  after hw_free
- [Medium] ALSA: maya44e: missing joint-duplex rate constraint in
  maya_open()
- [Medium] ALSA: maya44e: skipped PGA updates at zero volume in
  maya_input_levels()
- [Medium] ALSA: maya44e: unlocked last_appl updates in maya_pcm_ioctl()
  and maya_prepare()
--

commit 06d75b60c918848008af6c5fc9d3ea134cf8c6cd
Author: Nordschamane <nordschamane1@proton.me>

ALSA: pci: add analog support for ESI MAYA44e

This commit adds an ALSA PCI driver for the ESI MAYA44e PCIe audio
interface supporting four-channel analog playback and capture, mixer
controls, and power management.

> diff --git a/sound/pci/maya44e.c b/sound/pci/maya44e.c
> new file mode 100644
> index 0000000000000..d30f25742df48
> --- /dev/null
> +++ b/sound/pci/maya44e.c

[ ... ]

> +static const struct snd_pcm_hardware maya_pcm_hardware =3D {
> +	.info =3D SNDRV_PCM_INFO_INTERLEAVED | SNDRV_PCM_INFO_BLOCK_TRANSFER |
> +		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
> +		SNDRV_PCM_INFO_SYNC_APPLPTR | SNDRV_PCM_INFO_NO_REWINDS,
> +	.formats =3D SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_3LE |
> +		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE,
> +	.rates =3D SNDRV_PCM_RATE_8000_48000 | SNDRV_PCM_RATE_24000 |
> +		SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000,
> +	.rate_min =3D 8000, .rate_max =3D 96000,
> +	.channels_min =3D 4, .channels_max =3D 4,
> +	.buffer_bytes_max =3D MAYA_PCM_BYTES_MAX,
> +	.period_bytes_min =3D MAYA_MIN_PERIOD * 8,
> +	.period_bytes_max =3D MAYA_MAX_PERIOD * 16,
> +	.periods_min =3D 2, .periods_max =3D 2,
> +};
> +
> +/* Full duplex shares one clock, but each direction may use its own peri=
od.
> + * Reserve at hw_params, not just while running, to protect prepared pee=
rs.
> + */
> +static int maya_hw_params(struct snd_pcm_substream *s, struct snd_pcm_hw=
_params *p)
> +{
> +	struct maya *m =3D snd_pcm_substream_chip(s);
> +	unsigned int direction =3D s->stream;
> +	int err =3D 0;
> +
> +	mutex_lock(&m->codec_lock);
> +	if (m->reserved_rate[1 - direction] &&
> +	    m->reserved_rate[1 - direction] !=3D params_rate(p))
> +		err =3D -EBUSY;
> +	else
> +		m->reserved_rate[direction] =3D params_rate(p);
> +	mutex_unlock(&m->codec_lock);
> +	return err;
> +}

[Severity: Medium]
Should maya_pcm_hardware include SNDRV_PCM_INFO_JOINT_DUPLEX and constrain
SNDRV_PCM_HW_PARAM_RATE when the opposite stream has already reserved a
rate?

During snd_pcm_hw_params(), snd_pcm_hw_params_choose() picks the minimum
rate in the refined interval before calling maya_hw_params().  When one
stream has reserved a rate above the minimum (such as 48000 Hz) and a
second stream passes a rate range containing 48000 Hz, ALSA selects 8000
Hz or 32000 Hz and maya_hw_params() rejects it with -EBUSY.  In addition,
because playback allows 8000..24000 Hz while capture starts at 32000 Hz,
reserving a sub-32 kHz playback rate prevents capture from configuring
hw_params at all.

[ ... ]

> +static int maya_pcm_ioctl(struct snd_pcm_substream *s, unsigned int cmd,=
 void *arg)
> +{
> +	struct maya *m =3D snd_pcm_substream_chip(s);
> +	int err =3D snd_pcm_lib_ioctl(s, cmd, arg);
> +
> +	if (!err && cmd =3D=3D SNDRV_PCM_IOCTL1_RESET)
> +		m->last_appl =3D s->runtime->status->hw_ptr;
> +	return err;
> +}
> +
> +static int maya_prepare(struct snd_pcm_substream *s)
> +{

[ ... ]

> +	memset(m->ring[0], 0, m->buffer_frames * 8);
> +	memset(m->ring[1], 0, m->buffer_frames * 8);
> +	memset(s->runtime->dma_area, 0,
> +	       s->runtime->buffer_size * maya_sample_bytes(s->runtime->format) =
* 4);
> +	m->last_appl =3D 0;
> +	dma_wmb();
> +	return 0;
> +}

[Severity: Medium]
Can updating m->last_appl without holding the PCM stream lock desynchronize
it from runtime->control->appl_ptr?

In snd_pcm_reset(), snd_pcm_do_reset() -> snd_pcm_lib_ioctl_reset() drops
the PCM stream lock before maya_pcm_ioctl() reads runtime->status->hw_ptr,
and snd_pcm_post_reset() re-acquires the lock afterward to copy hw_ptr into
runtime->control->appl_ptr:

CPU0                                  CPU1
snd_pcm_reset()
  snd_pcm_do_reset()
    maya_pcm_ioctl()
      snd_pcm_lib_ioctl_reset()
      m->last_appl =3D ...->hw_ptr;
                                      maya_irq()
                                        snd_pcm_period_elapsed()
                                          /* advances hw_ptr */
  snd_pcm_post_reset()
    appl_ptr =3D ...->hw_ptr;           <-- appl_ptr !=3D m->last_appl

When a period interrupt lands in that window on a running playback stream,
m->last_appl lags behind appl_ptr by a period, causing a subsequent write
of more than one period in maya_ack() to compute count > r->buffer_size and
fail with -EINVAL.  Similarly, snd_pcm_sync_ptr() calls maya_ack() under
only pcm_stream_lock_irq() without holding buffer_mutex, so unlocked writes
to m->last_appl in maya_prepare() and maya_pcm_ioctl() race with concurrent
SNDRV_PCM_IOCTL_SYNC_PTR calls.

[ ... ]

> +static int maya_ack(struct snd_pcm_substream *s)
> +{
> +	struct maya *m =3D snd_pcm_substream_chip(s);
> +	struct snd_pcm_runtime *r =3D s->runtime;
> +	snd_pcm_uframes_t appl =3D READ_ONCE(r->control->appl_ptr);
> +	snd_pcm_sframes_t count =3D appl - m->last_appl;
> +	snd_pcm_uframes_t frame;
> +	unsigned int sample_bytes =3D maya_sample_bytes(r->format);
> +	__le32 *out12 =3D m->ring[0], *out34 =3D m->ring[1];
> +
> +	if (READ_ONCE(m->fault) || READ_ONCE(m->removing) || READ_ONCE(m->suspe=
nded))
> +		return -EIO;
> +	if (!sample_bytes)
> +		return -EINVAL;
> +	if (count < 0)
> +		count +=3D r->boundary;
> +	if (count < 0 || count > (snd_pcm_sframes_t)r->buffer_size) {
> +		dev_err_ratelimited(&m->pci->dev,
> +				    "invalid appl_ptr delta=3D%ld old=3D%lu new=3D%lu boundary=3D%lu=
\n",
> +				    count, m->last_appl, appl, r->boundary);
> +		return -EINVAL;
> +	}
> +	for (frame =3D 0; frame < (snd_pcm_uframes_t)count; ++frame) {
> +		unsigned int slot =3D (m->last_appl + frame) % r->buffer_size;
> +		const u8 *source =3D r->dma_area + slot * sample_bytes * 4;
> +
> +		out12[slot * 2] =3D cpu_to_le32(maya_unpack_sample(source, r->format));

[Severity: High]
Can maya_ack() dereference a NULL or concurrently freed r->dma_area if
SNDRV_PCM_IOCTL_SYNC_PTR is called after SNDRV_PCM_IOCTL_HW_FREE?

When SNDRV_PCM_IOCTL_HW_FREE runs after SNDRV_PCM_IOCTL_HW_PARAMS,
do_hw_free() -> snd_pcm_lib_free_pages() frees the managed vmalloc buffer
and sets r->dma_area to NULL under r->buffer_mutex, while leaving
r->format, r->buffer_size and r->boundary populated.  Because
snd_pcm_sync_ptr() only takes pcm_stream_lock_irq() and calls
pcm_lib_apply_appl_ptr() -> maya_ack() without checking r->state or
r->dma_area:

sound/core/pcm_native.c:snd_pcm_sync_ptr() {
    ...
	scoped_guard(pcm_stream_lock_irq, substream) {
		if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL)) {
			err =3D pcm_lib_apply_appl_ptr(substream, scontrol.appl_ptr);
    ...
}

calling SNDRV_PCM_IOCTL_SYNC_PTR with flags =3D 0 and a non-zero appl_ptr
passes the bounds checks in maya_ack() and dereferences NULL r->dma_area in
maya_unpack_sample() (or races with snd_pcm_lib_free_pages() freeing the
buffer).

[ ... ]

> +static int maya_input_levels(struct maya *m, unsigned int pair)
> +{
> +	unsigned int ch;
> +	int err;
> +
> +	for (ch =3D 0; ch < 2; ++ch) {
> +		unsigned int volume =3D m->input_volume[pair][ch];
> +		unsigned int raw =3D 62 + volume + m->input_gain[pair];
> +
> +		/* -infinity is a digital gate in maya_capture_period. Keep the
> +		 * last PGA setting there: code 0 causes a bias/settling transient
> +		 * on this board when returning to normal gain.
> +		 */
> +		if (!volume)
> +			continue;
> +		err =3D maya_codec_write(m, pair, 14 + ch, 0x100 | raw);
> +		if (err)
> +			return err;
> +	}
> +	return 0;
> +}

[Severity: Medium]
Does skipping the WM8776 R14/R15 write when volume is 0 leave the analog
PGA unmuted on the hardware direct-monitoring path and after resume?

Input 1-2/3-4 Capture Volume advertises 0 as mute in input_volume_db, and
maya_capture_period() gates captured samples in software.  However, WM8776
R14/R15 also feeds the analog monitor bypass enabled by Input 1-2/3-4
Monitor Playback Switch, so setting volume to 0 leaves the monitored input
audible at its previous gain and ignores Input Capture Gain updates made
while volume is 0.  Furthermore, on S3 resume maya_codec_init() resets R14
and R15 to 0x1cf (0 dB), and maya_restore_after_sleep() ->
maya_input_levels() then skips any channel whose cached volume is 0.

[ ... ]

> +static int maya_suspend(struct device *dev)
> +{
> +	struct snd_card *card =3D dev_get_drvdata(dev);
> +	struct maya *m =3D card->private_data;
> +	unsigned long flags;
> +
> +	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
> +	/* ALSA stream locks must be acquired before our register/codec locks. =
*/
> +	snd_pcm_suspend_all(m->pcm);
> +	mutex_lock(&m->codec_lock);
> +	spin_lock_irqsave(&m->lock, flags);
> +	m->suspend_rate =3D m->rate;
> +	if (!m->suspended) {
> +		mw8(m, 0x481, mr8(m, 0x481) & ~0x40);
> +		maya_quiesce(m);
> +		m->suspended =3D true;
> +	}
> +	spin_unlock_irqrestore(&m->lock, flags);
> +	synchronize_irq(m->pci->irq);
> +	mutex_unlock(&m->codec_lock);
> +	/* The gate prevents new work; complete any pending peer notification. =
*/
> +	flush_work(&m->fault_work);
> +	return 0;
> +}
> +
> +static int maya_resume(struct device *dev)
> +{
> +	struct snd_card *card =3D dev_get_drvdata(dev);
> +	struct maya *m =3D card->private_data;
> +	unsigned long flags;
> +	int err;
> +
> +	mutex_lock(&m->codec_lock);
> +	if (!m->suspended) {
> +		mutex_unlock(&m->codec_lock);
> +		return 0;
> +	}
> +	if (m->fault || m->removing) {
> +		err =3D -EIO;
> +		goto fail;
> +	}
> +	pci_intx(m->pci, 0);
> +	pci_clear_master(m->pci);
> +	err =3D maya_restore_after_sleep(m);
> +	if (err)
> +		goto fail;
> +	spin_lock_irqsave(&m->lock, flags);
> +	m->irq_window =3D jiffies;
> +	m->irq_window_handled =3D 0;
> +
> +	m->suspended =3D false;
> +	pci_set_master(m->pci);
> +	pci_intx(m->pci, 1);
> +	spin_unlock_irqrestore(&m->lock, flags);
> +	mutex_unlock(&m->codec_lock);
> +	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
> +	return 0;
> +fail:
> +	spin_lock_irqsave(&m->lock, flags);
> +
> +	maya_fatal(m);
> +	spin_unlock_irqrestore(&m->lock, flags);
> +	mutex_unlock(&m->codec_lock);
> +	dev_err(dev, "resume failed: %d; DMA and interrupts disabled\n", err);
> +	return err;
> +}

[Severity: High]
Does the fail path in maya_resume() leave the card stuck in
SNDRV_CTL_POWER_D3hot with m->suspended still set?

If m->fault is set before suspend or maya_restore_after_sleep() fails,
maya_resume() returns without calling snd_power_change_state(card,
SNDRV_CTL_POWER_D0) or clearing m->suspended.  Any process that later
closes or accesses a PCM substream or mixer control sleeps forever in
TASK_UNINTERRUPTIBLE inside snd_power_ref_and_wait() / snd_power_wait().
Keeping m->suspended true also causes maya_fatal() -> maya_quiesce() and
maya_free() to skip MMIO register shutdown and fault_work scheduling even
though the PCI device is in D0, and a subsequent maya_suspend() will
overwrite m->suspend_rate with 0 if maya_restore_after_sleep() failed after
clearing m->rate.

[ ... ]

> +MODULE_AUTHOR("MAYA44e Linux reverse-engineering project");
> +MODULE_DESCRIPTION("ESI MAYA44e analog audio driver");
> +MODULE_LICENSE("GPL");

[Severity: High]
Under Documentation/process/submitting-patches.rst, Signed-off-by and
author attribution must use a known real full name rather than a single-word
handle ("Nordschamane <nordschamane1@proton.me>") or a generic project
string in MODULE_AUTHOR.  Also, the transient notes in the commit message
about the tree base and RFC feedback requests belong below the "---"
separator line so they are not recorded in the permanent git history.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-codex-alsa=
-maya44e-v1-1-df60af443e93@proton.me?part=3D1
