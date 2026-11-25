Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612381;
	b=SqmrapKHjaySYxeJtJY+9+4D//vxkDausxQ3C9tY8lymRtYBH9a2PNK371hpruPwTDAd
	 2KYZ/bjp7FcqV9FoGfxFMOSKsIyGeTX06DddkuuTWIgqqhN5RbVIJ9qRR8+nDVXFLo1dl
	 cT+WoXvTyElYiE1RcafwAa6n7pVXKbKiFn+yEYcpmfQ8Aiwv5rwgz5TZud6u/zzsoPOtM
	 TN4d1i4xADOtFbsRTKzuy/zXE1GmokbKTOH1xKJCZk8HfS0KsrKG/c83n8iR2tQkWV92K
	 c20stHurtQc2+P5vI4NX3jJ91SXaUki9nSQwaBo2JUcwAdsm+482z/LgyJ2dNgmtKhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612381;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J+FxBU1etQ2tK+F2cPE/xSZx3whYwbAqFMyW38yIA50=;
	b=JY4AzpdLZH9mrPSIS+jw5ZNRlTZpOaQuxuDxOZFq1D5L2aMj/ys8d4R/07+jb3uL9YnS
	 0HoUN2VB5H5qbTQi38lc9ClvKLhEnjITGqw/JS2YXIPyNusR+8g63UpOtvOQZ6qbOpry/
	 VdIGZU3jrGlySqpcMpw8hFXKQgWCHM31NzPAl105LpOSuwWHkPoddj9Sf+qHT3BnmB6Pp
	 7IjiCSqMxWVO80qV/oLimQtbTz/w3JUmXMqXxNTEfQqR5WXIHqu4GntMFTEU9pX7oQ5P2
	 Km/2yq8qri2dhm50iqWPamuHQ3KOkVxXb/6+6dSevSUzzd11IPKGTh0Q4VEiNy/BI/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MZe7dt9u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6800E606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 13:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MZe7dt9u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CBF1F000C0;
	Wed, 25 Nov 2026 13:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795612380;
	bh=J+FxBU1etQ2tK+F2cPE/xSZx3whYwbAqFMyW38yIA50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MZe7dt9uvLcJVf5XmqcmGiXgxSrOtFmAkKeDv9J5T089BEeEorB4ZdJsxe7oLPb5x
	 I1K7sGDntluE/SzCJVotENjmDChQKI7K74Q3ZDRQvViyOTN7U0cRgka2k6iF15Jcrf
	 MR8pscLK3h8aobaHRXNxceU3YpDuQQH7MRTZR0rcbMe+XB6DREEr9PyeGxBGThyOuF
	 FYX9pDFvmXIziKxYqV4hojFiE4eTVwSAhpKP3zLkNaZbAZHTGwzvUFHr94dSjkp3pV
	 BVPOI23/zKEnb+Ti5kks5QoKDmfJc/NDzCB6uxzRJ9u0yyp3N4roQpb8ONx9DbJ+Ha
	 +yX+gC55iPVug==
Message-ID: <sashiko-outbox-233469@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Re: ALSA: pcm: link-group walk in timer callback can
 use a closed substream's freed runtime (UAF)
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <49f1dede.596.1a212c69040.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <7117f13e.2631e.1a1d4d54236.Coremail.xuhx@hust.edu.cn>
 <49f1dede.596.1a212c69040.Coremail.xuhx@hust.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:12:59 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [Critical] ALSA: asihpi: unlocked group list walk in
  snd_card_asihpi_timer_function()
- [Critical] ALSA: asihpi: deferred elapsed/xrun calls race with
  snd_pcm_detach_substream()
- [Critical] ALSA: asihpi: unsynchronized timer stop and missing runtime
  checks on close
- [High] ALSA: asihpi: shared timer_walked race in
  snd_card_asihpi_timer_function()
- [High] ALSA: asihpi: spin_lock_irqsave held across DSP polling and
  MMIO transfers
- [High] ALSA: pcm: missing Signed-off-by trailer in commit message
- [Low] ALSA: pcm: missing Fixes trailer in commit message
--

commit 7d06715d1a9473c30893b41b4784ed5585d479ae
Author: =E5=BE=90=E6=99=97=E7=BF=94 <xuhx@hust.edu.cn>

> ALSA: pcm: link-group walk in timer callback can use a closed substream's=
 freed runtime (UAF)
>
> snd_pcm_group_for_each_entry() is a plain list_for_each_entry() over
> substream->group->substreams.  A driver timer callback (asihpi's
> snd_card_asihpi_timer_function()) walked that list from softirq with
> no group reference and no link rwsem, while the close of another
> linked substream could unlink the members, reassign the survivors
> and kfree() the group object -- the callback kept dereferencing a
> stale s/runtime pointer and freed group memory (KASAN UAF).
>
> Core: free the group object only after an RCU grace period (new
> rcu_head in struct snd_pcm_group, kfree_rcu() at both free sites),
> so a group pointer read without the link rwsem stays memory-safe
> while a concurrent unlink tears the group down.
>
> Driver: walk the group one member at a time under the group lock
> with rcu_read_lock() held -- the lock makes membership (and each
> member's runtime) stable while the member is processed, and RCU
> keeps the group object alive.  snd_pcm_stop_xrun()/
> snd_pcm_period_elapsed() are deferred out of the locked section:
> they enter snd_pcm_action(), which re-takes the group lock.  A
> substream object outlives its fd's close and both helpers recheck
> substream->runtime under the stream lock, so the deferred calls are
> safe against a concurrent close of the member.

[Severity: High]
The commit message is missing a Signed-off-by: trailer.

[Severity: Low]
Since this fixes a bug in the asihpi timer callback, should it include a
Fixes: tag?

  Fixes: 719f82d3987a ("ALSA: Add support of AudioScience ASI boards")

> diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
> index b78e96caef9d0..768f2969004fb 100644
> --- a/sound/pci/asihpi/asihpi.c
> +++ b/sound/pci/asihpi/asihpi.c
> @@ -136,6 +136,8 @@ struct snd_card_asihpi_pcm {
>  	unsigned int pcm_buf_dma_ofs;	/* DMA R/W offset in buffer */
>  	unsigned int pcm_buf_elapsed_dma_ofs;	/* DMA R/W offset in buffer */
>  	unsigned int drained_count;
> +	bool timer_walked;		/* one-shot mark for the timer
> +					 * callback's group walk */
>  	struct snd_pcm_substream *substream;
>  	u32 h_stream;
>  	struct hpi_format format;
> @@ -705,6 +707,31 @@ static inline unsigned int modulo_min(unsigned int a=
, unsigned int b,
>  	return result;
>  }
> =20
> +/* Pick the next group member this timer callback has not processed yet.
> + * Must be called with the group lock held and under rcu_read_lock(): the
> + * group list cannot change under us, so every member's runtime is still
> + * alive. */
> +static struct snd_pcm_substream *
> +asihpi_timer_next_member(struct snd_pcm_substream *substream,
> +			 struct snd_card_asihpi *card)
> +{
> +	struct snd_pcm_substream *s;
> +
> +	snd_pcm_group_for_each_entry(s, substream) {
> +		struct snd_card_asihpi_pcm *ds =3D s->runtime->private_data;
> +
> +		if (snd_pcm_substream_chip(s) !=3D card)
> +			continue;
> +		/* don't link Cap and Play */
> +		if (substream->stream !=3D s->stream)
> +			continue;
> +		if (ds->timer_walked)
> +			continue;
> +		return s;
> +	}
> +	return NULL;
> +}
> +
>  /** Timer function, equivalent to interrupt service routine for cards
>  */
>  static void snd_card_asihpi_timer_function(struct timer_list *t)
> @@ -713,10 +740,12 @@ static void snd_card_asihpi_timer_function(struct t=
imer_list *t)
>  	struct snd_pcm_substream *substream =3D dpcm->substream;
>  	struct snd_card_asihpi *card =3D snd_pcm_substream_chip(substream);
>  	struct snd_pcm_runtime *runtime;
> +	struct snd_pcm_group *group;
>  	struct snd_pcm_substream *s;
>  	unsigned int newdata =3D 0;
>  	unsigned int pcm_buf_dma_ofs, min_buf_pos =3D 0;
>  	unsigned int remdata, xfercount, next_jiffies;
> +	unsigned long flags;
>  	int first =3D 1;
>  	u16 state;
>  	u32 buffer_size, bytes_avail, samples_played, on_card_bytes;
> @@ -725,17 +754,58 @@ static void snd_card_asihpi_timer_function(struct t=
imer_list *t)
> =20
>  	snd_pcm_debug_name(substream, name, sizeof(name));
> =20
> -	/* find minimum newdata and buffer pos in group */
> +	/*
> +	 * Walk the PCM link group one member at a time, under the group
> +	 * lock and an RCU read lock.  This callback runs from a timer
> +	 * (softirq) with no group reference and no link rwsem, so a close
> +	 * of another linked substream could previously unlink the members,
> +	 * free the group object and free that member's runtime while this
> +	 * walk was holding a stale s/runtime pointer.
> +	 *
> +	 * The group lock keeps the membership (and each member's runtime)
> +	 * stable while the member is processed; the RCU read lock keeps
> +	 * the group object itself alive (snd_pcm_unlink() frees it only
> +	 * after a grace period).  snd_pcm_stop_xrun() and
> +	 * snd_pcm_period_elapsed() must run WITHOUT the group lock -- they
> +	 * enter snd_pcm_action(), which re-takes the group lock -- so they
> +	 * are deferred to after the unlocked section.  A substream object
> +	 * outlives the close of its fd, and both helpers recheck
> +	 * substream->runtime under the stream lock.
> +	 */
> +
> +	/* clear the one-shot walk marks of the previous invocation */
> +	rcu_read_lock();
> +	group =3D READ_ONCE(substream->group);	/* kept alive by RCU */
> +	spin_lock_irqsave(&group->lock, flags);
>  	snd_pcm_group_for_each_entry(s, substream) {
> -		struct snd_card_asihpi_pcm *ds =3D s->runtime->private_data;
> -		runtime =3D s->runtime;
> +		if (snd_pcm_substream_chip(s) =3D=3D card) {
> +			struct snd_card_asihpi_pcm *ds =3D
> +				s->runtime->private_data;
> =20
> -		if (snd_pcm_substream_chip(s) !=3D card)
> -			continue;
> +			ds->timer_walked =3D false;
> +		}
> +	}
> +	spin_unlock_irqrestore(&group->lock, flags);
> +	rcu_read_unlock();
> =20
> -		/* don't link Cap and Play */
> -		if (substream->stream !=3D s->stream)
> -			continue;
> +	/* find minimum newdata and buffer pos in group */
> +	for (;;) {
> +		struct snd_card_asihpi_pcm *ds;
> +		struct snd_pcm_substream *xrun =3D NULL;
> +
> +		rcu_read_lock();
> +		group =3D READ_ONCE(substream->group);	/* kept alive by RCU */
> +		spin_lock_irqsave(&group->lock, flags);
> +
> +		s =3D asihpi_timer_next_member(substream, card);
> +		if (!s) {
> +			spin_unlock_irqrestore(&group->lock, flags);
> +			rcu_read_unlock();
> +			break;
> +		}
> +		ds =3D s->runtime->private_data;
> +		runtime =3D s->runtime;
> +		ds->timer_walked =3D true;

[Severity: Critical]
Can snd_card_asihpi_timer_function() lock a stale group and then walk
substream->group->substreams without holding the current group's lock?

All four lock sites read group =3D READ_ONCE(substream->group) and acquire
group->lock without rechecking that substream->group =3D=3D group (the way
snd_pcm_stream_group_ref() does), while snd_pcm_group_for_each_entry()
expands to list_for_each_entry(s, &substream->group->substreams, link_list)
and re-reads substream->group:

CPU0 (<softirq>)                  CPU1
snd_card_asihpi_timer_function()
  group =3D READ_ONCE(substream->group)
    /* group =3D=3D G1 */
                                  snd_pcm_unlink(peer)
                                    spin_lock_irq(&G1->lock)
                                    relink_to_local(substream)
                                      substream->group =3D &substream->self=
_group
                                    spin_unlock_irq(&G1->lock)
                                  snd_pcm_link(other, substream)
                                    /* moves substream to G2 */
  spin_lock_irqsave(&G1->lock, ...)
  asihpi_timer_next_member()
    snd_pcm_group_for_each_entry()
      /* walks G2->substreams under G1->lock */
                                  close(member_in_G2)
                                    snd_pcm_unlink(member_in_G2)
                                    snd_pcm_detach_substream(member_in_G2)
                                      kfree(runtime)
      s->runtime->private_data    <-- use-after-free

In addition, snd_pcm_link() calls snd_pcm_group_assign(substream, group)
under substream->self_group.lock before acquiring target_group->lock, so
reading substream->group without substream->self_group.lock can also observe
the new group while snd_pcm_group_assign() is still mutating its substreams
list.  If substream->group changes mid-loop, the list_entry_is_head() check
in snd_pcm_group_for_each_entry() also compares against the new list head
and walks past the old list head.

[Severity: High]
Can two timers running in the same link group corrupt each other's walk
state through ds->timer_walked and use on_card_bytes uninitialized?

Multiple members of the same group can have active timers at once: for
instance, when a playback and a capture substream on the same card are
linked (snd_card_asihpi_trigger() starts a timer per direction, whereas the
two mark-clearing loops clear ds->timer_walked for all group members on the
card regardless of stream direction), or when two already-running streams
are linked via SNDRV_PCM_IOCTL_LINK.  Because group->lock is dropped after
clearing ds->timer_walked and after each member:

CPU0 (timer A)                    CPU1 (timer B)
snd_card_asihpi_timer_function()
  /* clear timer_walked =3D false */
  spin_unlock_irqrestore(&group->lock)
                                  snd_card_asihpi_timer_function()
                                    /* Pass 1 marks all members
                                     * ds->timer_walked =3D true */
  spin_lock_irqsave(&group->lock)
  asihpi_timer_next_member()
    /* returns NULL on 1st iter */
  break;
  if (xfercount &&
      on_card_bytes > ...)        <-- uninitialized on_card_bytes

When Pass 1 exits on its first iteration like this, on_card_bytes has never
been written by hpi_stream_get_info_ex() and Pass 2 overwrites each member's
ds->pcm_buf_dma_ofs with min_buf_pos (0).  Conversely, if timer B runs its
mark-clearing loop while timer A is partway through Pass 2, timer A visits
already-processed members a second time, performing duplicate
hpi_outstream_write_buf() / hpi_instream_read_buf() transfers and advancing
pcm_buf_host_rw_ofs and pcm_buf_elapsed_dma_ofs twice in one pass.  Also,
because Pass 2 leaves ds->timer_walked set to true, a stream linked into the
group after the first mark-clearing loop is skipped in Pass 1.

[ ... ]

> @@ -799,6 +870,13 @@ static void snd_card_asihpi_timer_function(struct ti=
mer_list *t)
>  			(unsigned long)frames_to_bytes(runtime,
>  						runtime->control->appl_ptr)
>  		);
> +
> +member_done:
> +		spin_unlock_irqrestore(&group->lock, flags);
> +		rcu_read_unlock();
> +
> +		if (xrun)
> +			snd_pcm_stop_xrun(xrun);
>  	}
>  	pcm_buf_dma_ofs =3D min_buf_pos;

[ ... ]

> @@ -887,8 +994,15 @@ static void snd_card_asihpi_timer_function(struct ti=
mer_list *t)
>  			/* ? host_rw_ofs always ahead of elapsed_dma_ofs by preload size? */
>  			ds->pcm_buf_host_rw_ofs +=3D xfercount;
>  			ds->pcm_buf_elapsed_dma_ofs +=3D xfercount;
> -			snd_pcm_period_elapsed(s);
> +			/* defer to after the unlock */
> +			elapsed =3D s;
>  		}
> +
> +		spin_unlock_irqrestore(&group->lock, flags);
> +		rcu_read_unlock();
> +
> +		if (elapsed)
> +			snd_pcm_period_elapsed(elapsed);
>  	}
> =20
>  	if (!card->hpi->interrupt_mode && dpcm->respawn_timer)

[Severity: Critical]
Does deferring snd_pcm_stop_xrun() and snd_pcm_period_elapsed() outside
group->lock race with snd_pcm_detach_substream() on a closing member?

The comment notes that both helpers recheck substream->runtime under the
stream lock, but snd_pcm_detach_substream() does not acquire
pcm_stream_lock:

sound/core/pcm.c:snd_pcm_detach_substream() {
    ...
	if (substream->timer) {
		scoped_guard(spinlock_irq, &substream->timer->lock)
			substream->runtime =3D NULL;
	} else {
		substream->runtime =3D NULL;
	}
	mutex_destroy(&runtime->buffer_mutex);
	snd_fasync_free(runtime->fasync);
	kfree(runtime);
    ...
}

Once group->lock is dropped, a concurrent close() on elapsed (or xrun) can
finish snd_pcm_unlink() and enter snd_pcm_detach_substream():

CPU0 (<softirq>)                  CPU1
snd_card_asihpi_timer_function()
  elapsed =3D s;
  spin_unlock_irqrestore(&group->lock)
                                  snd_pcm_release_substream(s)
                                    snd_pcm_unlink(s)
                                    ...
                                    snd_pcm_detach_substream(s)
  snd_pcm_period_elapsed(elapsed)
    guard(pcm_stream_lock_irqsave)(s)
    snd_pcm_period_elapsed_under_stream_lock(s)
      if (PCM_RUNTIME_CHECK(s))
      runtime =3D s->runtime;
                                      s->runtime =3D NULL;
                                      snd_fasync_free(runtime->fasync);
                                      kfree(runtime);
      if (!snd_pcm_running(s) || ...)
        /* dereferences s->runtime->state */
      snd_kill_fasync(runtime->fasync, ...)  <-- use-after-free

Even if snd_pcm_detach_substream() finishes setting elapsed->runtime =3D NU=
LL
before snd_pcm_period_elapsed() takes the stream lock,
PCM_RUNTIME_CHECK(substream) triggers snd_BUG_ON(!substream->runtime) when
CONFIG_SND_DEBUG is enabled.

[Severity: Critical]
What happens if the timer-owning substream itself is closed, or a member
runs hw_free, while snd_card_asihpi_timer_function() is between its locked
sections?

A substream stays on its own substream->self_group.substreams list even
after unlink and close, and snd_card_asihpi_pcm_timer_stop() only calls
timer_delete(&dpcm->timer) (not timer_delete_sync(), with no .sync_stop
callback):

CPU0 (<softirq>)                  CPU1
snd_card_asihpi_timer_function()
  /* finishes Pass 1, unlocks */
                                  snd_pcm_release_substream(substream)
                                    snd_pcm_unlink(substream)
                                      /* moves to self_group.substreams */
                                    snd_pcm_drop(substream)
                                      timer_delete(&dpcm->timer)
                                    do_hw_free(substream)
                                    snd_pcm_detach_substream(substream)
                                      /* frees dpcm, sets runtime =3D NULL =
*/
  spin_lock_irqsave(&group->lock)
  snd_pcm_group_for_each_entry()
    s->runtime->private_data      <-- NULL pointer dereference
  ...
  if (... && dpcm->respawn_timer)
    add_timer(&dpcm->timer)       <-- use-after-free on dpcm

Similarly, in Pass 2, a member stopped by the deferred snd_pcm_stop_xrun()
at the end of Pass 1 (or by a concurrent SNDRV_PCM_IOCTL_DROP) can undergo
SNDRV_PCM_IOCTL_HW_FREE before Pass 2 acquires group->lock; do_hw_free()
clears s->runtime->dma_area =3D NULL without unlinking s, and Pass 2 does n=
ot
check snd_pcm_running(s) or s->runtime->dma_area before reading
&s->runtime->dma_area[buf_ofs] and passing it to hpi_outstream_write_buf()
or hpi_instream_read_buf().

[Severity: High]
Does holding spin_lock_irqsave(&group->lock, flags) across the bodies of
Pass 1 and Pass 2 disable local hardware interrupts during DSP polling and
multi-kilobyte PCI MMIO transfers?

Previously snd_card_asihpi_timer_function() ran with hardirqs enabled (from
TIMER_SOFTIRQ or the threaded ISR asihpi_isr_thread), and
hpios_dsplock_lock() used spin_lock_bh().  With spin_lock_irqsave() held
around each member, hpi_stream_get_info_ex(), hpi_stream_start(),
hpi_outstream_write_buf(), and hpi_instream_read_buf() now execute with loc=
al
IRQs disabled while busy-waiting in wait_dsp_ack() (udelay(4) polling loops
in sound/pci/asihpi/hpi6205.c) and transferring period buffers over PCI MMIO
in sound/pci/asihpi/hpi6000.c.  In addition, rescanning from the list head =
in
asihpi_timer_next_member() on every iteration makes both passes O(N^2) with
2N + 4 lock acquisitions per callback.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/49f1dede.596.1a212c=
69040.Coremail.xuhx@hust.edu.cn?part=3D1
