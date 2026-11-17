Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909726;
	b=BWb68udFqeNJ47fjz/78J46mXHVrq/mIGb0LKVJI0kp1bwhrbeKJmkITOQ/eHNrc6qZu
	 0LpJUjUWLiHbp/fADnzUidTQWIolk196IMHL0kfhXjJgh+JQsbjbYROte9BEBKv9MOvcf
	 G5gemm7vtBeXQHGTWEX79sgp1PZxIvpV0TTyd9AHG9Wre7QNs/zlp6ZNZGJGD4PcjcNjT
	 z9AkjLa9bDOz3fVjEq/oWdV9ULfF3dv6TGoxX7qFiv6wxYgg2t/9U0/3VG2ZDDG5QLekN
	 zPgzMd/n8oufY9GV0Di8fVTP1mpR29yNYWW3GVbE2J8to7C/FDcidXHy5fITOeQCEbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909726;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vEqLxVjNWHrgIOYcHa7Zay375+bOBucK6ns8/L9IwVM=;
	b=WgXVL71HHpC9Gn4YoAgjFkyy5vBhh+AArsrujDFbGCmbEOCgoMoYg/rZT7Cm+ZLahtPn
	 +GV9zbavywZ0np1loxplw5furbtMp4mg9fEpH+hy4khW4NrXiEoUvCtd9A6e20eW2X5vB
	 S1b3vBCYAPVRsaxTHqu8DQcyt0vQXuSJtLsk54Xwyp9p/msJsHnk4ACybtP9402FkKvKr
	 73XLmr1hLuC9CaELxsjedDrRys6hvO6MJVGYnyWhY7u4uPTxPIiRfjE6jOMCjwuk0yLZv
	 cBkhJibkEA+DwLydpQVoCW8qpi63y4g+H2S0odqWWhLBDkPSQdtdoBTFBAIwqZnf8MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Is9c7ZAh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175E6606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 10:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Is9c7ZAh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0241F000C7;
	Tue, 17 Nov 2026 10:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909725;
	bh=vEqLxVjNWHrgIOYcHa7Zay375+bOBucK6ns8/L9IwVM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Is9c7ZAhXTWZDLw15Xrkmp2YVhn3iTqGF/7NzxTGRiQAWwhz3cxP9YyN5+0Oaajc2
	 Z1fYu0PWUFlcvgIh+LvevRPh8CKIotZe/NpnNqzy3jn91kmkqeEq9ovfKRkivO6Z4P
	 2+cm+siXdgMAy7cStw1EVThSUHEUKrdefFdArZJwgr/ml/r8MuixZRI0XW8q5InLc6
	 CQjRwvAj/tsBgXWoaSDIJUtnUCQK64GTPWfs1LH7YWILRk3AK4Wz0wSD9LlBowyksA
	 6i9+9DVFYj3bAA7q8/sUB6dGamaiySCHCEvkY8v6tB7W9zMGov4eOSQcQm+6zMhHVv
	 6gFgpEZl8LXdQ==
Message-ID: <sashiko-outbox-218562@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 2/2] ALSA: usb-audio: add MIXER_STATE_REPUSH
 quirk flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavel Artemev" <a@pavel.bz>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261117092532.408981-3-a@pavel.bz>
References: <20261117092532.408981-1-a@pavel.bz>
 <20261117092532.408981-3-a@pavel.bz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 10:02:05 +0000
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
- [Medium] ALSA: usb-audio: stale master and mute writes in
  snd_usb_mixer_resume()
- [Medium] ALSA: usb-audio: unlocked restore_mixer_value() clobbers
  deferred puts
- [Medium] ALSA: usb-audio: mutex_trylock() in snd_usb_mixer_resume()
  drops re-push
- [Medium] ALSA: usb-audio: sticky master_explicit breaks volume after
  alsactl restore
- [Medium] ALSA: usb-audio: flush_work races with system suspend and
  drops mute state
- [Medium] ALSA: usb-audio: race re-arming flush_work in
  snd_usb_mixer_disconnect()
- [Low] ALSA: usb-audio: overly broad cache invalidation suppression on
  notify
--

commit 111702616777f0f8b7d0639f8fa713f234292a2d
Author: Pavel Artemev <a@pavel.bz>

ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag

This commit adds the QUIRK_FLAG_MIXER_STATE_REPUSH quirk flag to defer
Feature Unit volume and mute writes into coalesced master-first bursts and
re-push cached volume state on PCM stream open and resume, and enables it
for Weltrend/XiiSound (040b:0897) headsets.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221401
Link: https://lore.kernel.org/linux-sound/20261117074318.378876-3-a@pavel.bz

> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index bf1d9fbf08aae..2ac5a54a40e4c 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c

[ ... ]

> @@ -1608,15 +1618,275 @@ static int mixer_ctl_feature_get(struct snd_kcon=
trol *kcontrol,
> +		/* master first (the Windows burst order) */
> +		if (master && !master_pending && !master->master_explicit &&
> +		    have_ch &&
> +		    (touched || full) &&
> +		    (!test_bit(0, master->cached) ||
> +		     *master->cache_val !=3D max_val)) {
> +			int err =3D snd_usb_set_cur_mix_value(master, 0, 0,
> +							    max_val);
> +			if (err < 0)
> +				usb_audio_dbg(mixer->chip,
> +					      "derive ctl %d ch 0 failed (%d)\n",
> +					      master->control, err);
> +		}

[Severity: Medium]
When snd_usb_mixer_flush_work() runs while the device is runtime-suspended,
does this snd_usb_set_cur_mix_value() call cause snd_usb_mixer_resume() to
write stale master and mute values before the burst is sent?

snd_usb_set_cur_mix_value() calls snd_usb_mixer_set_ctl_value() before
updating cval->cache_val[index]:

sound/usb/mixer.c:snd_usb_set_cur_mix_value() {
    ...
	err =3D snd_usb_mixer_set_ctl_value(cval,
					  UAC_SET_CUR, (cval->control << 8) | channel,
					  value);
	if (err < 0)
		return err;
	set_bit(channel, cval->cached);
	cval->cache_val[index] =3D value;
	return 0;
}

Inside snd_usb_mixer_set_ctl_value(), CLASS(snd_usb_lock, pm)(chip) calls
snd_usb_autoresume(), which synchronously runs snd_usb_mixer_resume() ->
restore_mixer_value() on every control before the master UAC_SET_CUR
transfer is issued.  Because master->cache_val[0] still holds its old
pre-flush value, restore_mixer_value() writes the stale master value (which
can re-trigger the spurious limit notification or transiently attenuate the
output), writes cached UAC_FU_MUTE controls, and writes the channel volumes
before snd_usb_mixer_flush_pending() sends the newly derived master and
writes the pending channels a second time.  The same stale master and mute
writes happen on resume after snd_usb_mixer_suspend() cancels a pending
flush_work.

Skipping controls matching is_feature_volume_mute_ctl(cval) in
restore_mixer_value() when QUIRK_FLAG_MIXER_STATE_REPUSH is set would let
the flush mechanism handle them exclusively.

[ ... ]

> @@ -1632,10 +1902,27 @@ static int mixer_ctl_feature_put(struct snd_kcont=
rol *kcontrol,
>  				return -EINVAL;
>  			val =3D get_abs_value(cval, val);
>  			if (oval !=3D val) {
> -				err =3D snd_usb_set_cur_mix_value(cval, c + 1,
> -								cnt, val);
> -				if (err < 0)
> -					return filter_error(cval, err);
> +				if (deferred) {
> +					/* record only; one flush writes the
> +					 * whole unit in a single burst.
> +					 * Read-only channels keep the
> +					 * direct-path behaviour: no write,
> +					 * no cache update.
> +					 */
> +					if (!mixer_ch_readonly(cval, c + 1)) {
> +						set_bit(c + 1, cval->cached);
> +						cval->cache_val[cnt] =3D val;
> +						set_bit(c + 1, cval->pending);
> +						mod_delayed_work(system_wq,
> +								 &cval->head.mixer->flush_work,
> +								 MIXER_FLUSH_DELAY);
> +					}
> +				} else {
> +					err =3D snd_usb_set_cur_mix_value(cval, c + 1,
> +									cnt, val);
> +					if (err < 0)
> +						return filter_error(cval, err);
> +				}
>  				changed =3D 1;
>  			}
>  			cnt++;

[Severity: Medium]
Can a concurrent restore_mixer_value() during resume overwrite a new value
recorded here in cval->cache_val[cnt]?

Unlike the direct path, the deferred path in mixer_ctl_feature_put() does
not call snd_usb_lock_shutdown(), and restore_mixer_value() runs in
snd_usb_mixer_resume() without holding mixer->lock:

CPU0                                  CPU1
snd_usb_mixer_resume()
  restore_mixer_value()
    val =3D cval->cache_val[idx] (V1)
    snd_usb_set_cur_mix_value(..., V1)
      snd_usb_mixer_set_ctl_value()
                                      mixer_ctl_feature_put()
                                        mutex_lock(&mixer->lock)
                                        cval->cache_val[idx] =3D V2
                                        set_bit(c + 1, cval->pending)
                                        mutex_unlock(&mixer->lock)
      cval->cache_val[idx] =3D V1  <-- overwrites V2

When flush_work later runs flush_ctl_pending(), it writes the stale V1 back
to the device.

> @@ -1650,9 +1937,26 @@ static int mixer_ctl_feature_put(struct snd_kcontr=
ol *kcontrol,
>  			return -EINVAL;
>  		val =3D get_abs_value(cval, val);
>  		if (val !=3D oval) {
> -			err =3D snd_usb_set_cur_mix_value(cval, 0, 0, val);
> -			if (err < 0)
> -				return filter_error(cval, err);
> +			if (deferred) {
> +				/* record only; one flush writes the whole
> +				 * unit in a single burst.  Read-only
> +				 * masters keep the direct-path behaviour:
> +				 * no write, no cache update.
> +				 */
> +				if (!mixer_ch_readonly(cval, 0)) {
> +					set_bit(0, cval->cached);
> +					cval->cache_val[0] =3D val;
> +					set_bit(0, cval->pending);
> +					cval->master_explicit =3D true;
> +					mod_delayed_work(system_wq,
> +							 &cval->head.mixer->flush_work,
> +							 MIXER_FLUSH_DELAY);
> +				}
> +			} else {
> +				err =3D snd_usb_set_cur_mix_value(cval, 0, 0, val);
> +				if (err < 0)
> +					return filter_error(cval, err);
> +			}
>  			changed =3D 1;
>  		}
>  	}

[Severity: Medium]
Does setting cval->master_explicit =3D true permanently here break per-chan=
nel
volume control after alsactl store and alsactl restore?

For Feature Units with both master and per-channel volume controls,
parse_audio_feature_unit() creates both a per-channel kcontrol (index 0) and
a master kcontrol (index 1).  When snd_usb_mixer_flush_pending() derives the
master volume from the channels (for example, 35 or 0),
snd_usb_set_cur_mix_value() stores that derived value in
master->cache_val[0].  On shutdown or unplug, alsactl store saves both
kcontrols; on the next boot or replug, init_cur_mix_raw() initializes the
master cache to cval->max (100) under QUIRK_FLAG_MIXER_INIT_VOLUME_MAX, and
alsactl restore writes the saved value back to index 1.

Because val !=3D oval, that restore write sets cval->master_explicit =3D tr=
ue.
From that point on, snd_usb_mixer_flush_pending() never derives the master
when PipeWire or PulseAudio adjusts the per-channel control, leaving the
hardware master pinned at the restored value (or silent if it was saved at
0).

[ ... ]

> @@ -3685,8 +3991,12 @@ void snd_usb_mixer_notify_id(struct usb_mixer_inte=
rface *mixer, int unitid)
>  		if (!list->is_std_info)
>  			continue;
>  		info =3D mixer_elem_list_to_info(list);
> -		/* invalidate cache, so the value is read from the device */
> -		if (!info->get_cur_broken)
> +		/* invalidate cache, so the value is read from the device;
> +		 * under QUIRK_FLAG_MIXER_STATE_REPUSH the cache is the
> +		 * host-side truth and is never invalidated
> +		 */
> +		if (!info->get_cur_broken &&
> +		    !(mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_STATE_REPUSH))
>  			bitmap_zero(info->cached, MAX_CHANNELS + 1);
>  		snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
>  			       &list->kctl->id);
> @@ -3783,8 +4093,13 @@ static void snd_usb_mixer_interrupt_v2(struct usb_=
mixer_interface *mixer,
> =20
>  		switch (attribute) {
>  		case UAC2_CS_CUR:
> -			/* invalidate cache, so the value is read from the device */
> -			if (!info->get_cur_broken) {
> +			/* invalidate cache, so the value is read from the
> +			 * device; under QUIRK_FLAG_MIXER_STATE_REPUSH the
> +			 * cache is the host-side truth and is never
> +			 * invalidated
> +			 */
> +			if (!info->get_cur_broken &&
> +			    !(mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_STATE_REPUSH)) {
>  				if (channel)
>  					clear_bit(channel, info->cached);
>  				else /* master channel */

[Severity: Low]
Should the QUIRK_FLAG_MIXER_STATE_REPUSH check in snd_usb_mixer_notify_id()
and snd_usb_mixer_interrupt_v2() be restricted to
is_feature_volume_mute_ctl(info)?  As written, it also suppresses cache
invalidation for non-deferred controls on the mixer (such as UAC2 clock
validity or other unit controls), causing their get callbacks to return
stale cached values after a device notification.

[ ... ]

> @@ -3976,6 +4292,7 @@ void snd_usb_mixer_disconnect(struct usb_mixer_inte=
rface *mixer)
>  {
>  	if (mixer->disconnected)
>  		return;
> +	cancel_delayed_work_sync(&mixer->flush_work);
>  	if (mixer->urb)
>  		usb_kill_urb(mixer->urb);
>  	if (mixer->rc_urb)
> @@ -3985,6 +4302,34 @@ void snd_usb_mixer_disconnect(struct usb_mixer_int=
erface *mixer)
>  	mixer->disconnected =3D true;
>  }
> =20
> +/**
> + * snd_usb_mixer_stream_opened - notify mixers of a PCM stream open
> + * @chip: the USB audio chip
> + *
> + * Called from the PCM open path.  Devices flagged
> + * QUIRK_FLAG_MIXER_STATE_REPUSH request a full-state re-push (the
> + * vendor driver's every-open write pattern, healing writes swallowed
> + * in the post-enumeration loss window), merged into the flush timer
> + * so the burst never observes a half-applied gesture.
> + */
> +void snd_usb_mixer_stream_opened(struct snd_usb_audio *chip)
> +{
> +	struct usb_mixer_interface *mixer;
> +
> +	if (!(chip->quirk_flags & QUIRK_FLAG_MIXER_STATE_REPUSH))
> +		return;
> +
> +	list_for_each_entry(mixer, &chip->mixer_list, list) {
> +		if (mixer->disconnected)
> +			continue;
> +		scoped_guard(mutex, &mixer->lock) {
> +			mixer->flush_full =3D true;
> +			mod_delayed_work(system_wq, &mixer->flush_work,
> +					 MIXER_FLUSH_DELAY);
> +		}
> +	}
> +}

[Severity: Medium]
Can mixer->flush_work be re-armed during teardown after
cancel_delayed_work_sync() has returned, leading to a use-after-free when
snd_usb_mixer_free() frees mixer?

In snd_usb_mixer_disconnect(), cancel_delayed_work_sync(&mixer->flush_work)
runs before mixer->disconnected is set to true, and in snd_usb_mixer_free()
it runs before snd_ctl_remove() unregisters the kcontrols.  Meanwhile, the
deferred path in mixer_ctl_feature_put() neither calls
snd_usb_lock_shutdown() nor checks mixer->disconnected under mixer->lock:

CPU0                                  CPU1
snd_usb_mixer_free()
  snd_usb_mixer_disconnect()
    cancel_delayed_work_sync()
    ...
    mixer->disconnected =3D true
  cancel_delayed_work_sync()
                                      mixer_ctl_feature_put()
                                        mutex_lock(&mixer->lock)
                                        mod_delayed_work(..., &mixer->flush=
_work, ...)
                                        mutex_unlock(&mixer->lock)
  snd_ctl_remove()
  kfree(mixer)
                                      snd_usb_mixer_flush_work()
                                        mutex_lock(&mixer->lock)  <-- use-a=
fter-free

snd_usb_mixer_stream_opened() also checks mixer->disconnected outside
mixer->lock, and snd_usb_mixer_resume() calls mod_delayed_work() outside
mixer->lock without checking mixer->disconnected.  Setting
mixer->disconnected =3D true under mixer->lock before
cancel_delayed_work_sync(), and checking !mixer->disconnected under
mixer->lock at every mod_delayed_work() call site, would close this race.

> @@ -4007,6 +4352,14 @@ static int snd_usb_mixer_activate(struct usb_mixer=
_interface *mixer)
> =20
>  int snd_usb_mixer_suspend(struct usb_mixer_interface *mixer)
>  {
> +	/* Do not wait for an in-flight flush here: its control writes can
> +	 * be blocked in runtime-PM resume, waiting for this very suspend
> +	 * callback to finish - cancel_delayed_work_sync() would deadlock
> +	 * the PM worker against the flush worker.  Cancel without waiting;
> +	 * values recorded but not yet flushed stay in the cache, and the
> +	 * resume path requests a full re-push that re-derives them.
> +	 */
> +	cancel_delayed_work(&mixer->flush_work);
>  	snd_usb_mixer_inactivate(mixer);
>  	if (mixer->private_suspend)
>  		mixer->private_suspend(mixer);

[Severity: Medium]
What happens if snd_usb_mixer_flush_work() is already executing when
system suspend calls snd_usb_mixer_suspend()?

During system suspend (or whenever chip->active is already non-zero),
snd_usb_autoresume() returns 0 without blocking in runtime PM.  Because
cancel_delayed_work() does not wait for an executing work item,
snd_usb_mixer_flush_work() can continue issuing USB control transfers
concurrently with usb_suspend_both() suspending the device.  In addition,
flush_ctl_pending() clears cval->pending before calling
snd_usb_set_cur_mix_value(); if a UAC_FU_MUTE write fails during suspend,
its pending bit is already cleared and the full re-push on resume will not
retry it because snd_usb_mixer_flush_pending() only calls
repush_ctl_cached() for UAC_FU_VOLUME controls.

> @@ -4067,6 +4420,22 @@ int snd_usb_mixer_resume(struct usb_mixer_interfac=
e *mixer)
> =20
>  	snd_usb_mixer_resume_quirk(mixer);
> =20
> +	/* A suspend may have cancelled a flush that had not fired yet:
> +	 * the values are restored above, but a master derived only at
> +	 * flush time may lag behind its channels.  Request a full
> +	 * re-push, which re-derives and re-asserts everything.  The
> +	 * lock is only tried: an in-flight flush whose control write
> +	 * triggered this very resume holds it and already delivers the
> +	 * state, so there is nothing to re-arm in that case.
> +	 */
> +	if (mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_STATE_REPUSH &&
> +	    mutex_trylock(&mixer->lock)) {
> +		mixer->flush_full =3D true;
> +		mutex_unlock(&mixer->lock);
> +		mod_delayed_work(system_wq, &mixer->flush_work,
> +				 MIXER_FLUSH_DELAY);
> +	}
> +
>  	return snd_usb_mixer_activate(mixer);
>  }

[Severity: Medium]
Can mutex_trylock(&mixer->lock) here fail when mixer->lock is held by a
caller that will not perform a full re-push, dropping the post-resume
recovery?

First, mixer_ctl_feature_get() and the deferred path of
mixer_ctl_feature_put() take mixer->lock without holding
snd_usb_lock_shutdown(), so either can hold mixer->lock on another CPU while
snd_usb_mixer_resume() runs.  Second, non-deferred control callbacks (such
as mixer_ctl_feature_info() -> get_min_max_with_quirks()) take mixer->lock
before calling snd_usb_lock_shutdown() -> snd_usb_autoresume(), entering
snd_usb_mixer_resume() on the same thread with mixer->lock already held.
Third, even when snd_usb_mixer_flush_work() itself triggered the resume, it
already latched full =3D mixer->flush_full and cleared mixer->flush_full
before calling snd_usb_mixer_flush_pending():

sound/usb/mixer.c:snd_usb_mixer_flush_work() {
    ...
	scoped_guard(mutex, &mixer->lock) {
		full =3D mixer->flush_full;
		mixer->flush_full =3D false;
		if (mixer->disconnected)
			return;
		if (full)
			usb_audio_dbg(mixer->chip,
				      "flushing mixer state (stream open)\n");
		snd_usb_mixer_flush_pending(mixer, full);
	}
}

If snd_usb_mixer_suspend() cancelled an earlier pending flush and a
single-channel put later started snd_usb_mixer_flush_work() with
full =3D=3D false, the worker triggers runtime resume on its first USB writ=
e,
mutex_trylock(&mixer->lock) in snd_usb_mixer_resume() fails, and the worker
only flushes the single pending channel rather than a full re-push.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117092532.4089=
81-1-a@pavel.bz?part=3D2
