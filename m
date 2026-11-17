Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921188;
	b=pePOQRUgzK03DkqfF7DMjdtUmZ3zfBbLjvYm4u6zpTj4BWaD9i+p0g7oQLIDWlvTG24g
	 EpANpbI2z83LyG33jPIk/7OePaf7jkC4w3FLbqj2/aNdkbs4M8pqLRYtbhvpMJW/eZ9VH
	 cHI4nqhCt0vDAXZQ7/5X95SXyjwNcBFMOKztwMxNTE8c/W8UY0FK5aPOh+Cc7IfweMNDb
	 FRvSZHkSVWLNTrQE/ZUn7vcJP5m8unGFz3+NNJDDyr99f5ncRuPL0wiymZkvp1ki/zLtO
	 m/f61b/DzYs0tyfGSaU7aK9sMZJN76EwiDnygYIGL1MhIXWGTyU5TKyrGSueUTpEZnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921188;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MW/9Bku7L6lN4y6SoCrZbJlJzLf0+s+MNZaAl7c8zFc=;
	b=mlmvdEyLIwyYAM7xZ/DdCgGnJEsU6X58DKMZLLhFhETvh+PSTGRFI1vMjkzSQjbb4VLz
	 wZgvV/G+Fsj80cAMkF4clLcFji/BEBjlKmgk/J6HXHpumxzSW01w+9w00x94t7iBmEJJY
	 CKQh0hWHlMwlyyQuvqphUzxFdQQfkoUDp6pP3rhGDVQZm3gxAxGpZvZ2kYIAMAgb0YU/J
	 DBbwmL96tvJidlOCWqgwiIW+BAuft3ItaD0VeG0jU8zWhdy3V4myaxaPcVYm97kVUE8e9
	 VjC3cAyDAHG7YzCktcw4Tr89xG21k9lLIC401HJbmErBMvKuoGbkSQgugaCdzNpd9qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TuQebFNj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC771606A323
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TuQebFNj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5146C1F000C4;
	Tue, 17 Nov 2026 13:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921188;
	bh=MW/9Bku7L6lN4y6SoCrZbJlJzLf0+s+MNZaAl7c8zFc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TuQebFNjzwJkHXPNDaHOv+SNE+YFyMOqwFKio5ijODQGuCa1ubvVLTpPuahd6Rtui
	 ViazdUe9W7DVz0+OTmuzIjX3hZj7wEdv9CTRwg0m7/FpBYGYpvrRwcEAh1qCNLZlIW
	 GK7Tum2KgwafLxdfNtsnjc0R+mi9ag57BUm9nGwS/OyHUvhfn6KDE/HHIckDzsngsy
	 vyyLQU+MbzJeatDIvgXnFgNyBtiSLgLoaryZA5bjDp/EiVivV+qXcWhJ4qnnp7wdHN
	 1cQC5HJ8eT1Tt3/orsNwD+MtSSDg7GCKCL/fWR29FHsveDeUH9jstVRj4ukQYDHKVO
	 is1hDqMMYd5Aw==
Message-ID: <sashiko-outbox-218847@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v4 2/2] ALSA: usb-audio: add MIXER_STATE_REPUSH
 quirk flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavel Artemev" <a@pavel.bz>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261117124242.12237-3-a@pavel.bz>
References: <20261117124242.12237-1-a@pavel.bz>
 <20261117124242.12237-3-a@pavel.bz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:13:07 +0000
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
- [Medium] ALSA: usb-audio: stale pending master state in
  mixer_ctl_feature_put()
- [Medium] ALSA: usb-audio: derived master not restored in
  snd_usb_mixer_flush_pending()
- [Medium] ALSA: usb-audio: missing disconnected check in
  mixer_ctl_feature_put()
--

commit f4eb0b4119dee3a007d6e2f3e25d6abfcb9bb149
Author: Pavel Artemev <a@pavel.bz>

ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag

This commit adds the QUIRK_FLAG_MIXER_STATE_REPUSH quirk flag to defer
feature unit volume and mute writes into coalesced bursts and re-push
cached mixer state on PCM stream open and resume.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221401
Link: https://lore.kernel.org/linux-sound/20261117092532.408981-3-a@pavel.bz

> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index bf1d9fbf08aae..e9f256df7aede 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
[ ... ]
> @@ -1608,18 +1618,342 @@ static int mixer_ctl_feature_get(struct snd_kcon=
trol *kcontrol,
[ ... ]
> +		/* master first (the Windows burst order) */
> +		if (master && !master_pending && !master->master_explicit &&
> +		    have_ch &&
> +		    (touched || level !=3D FLUSH_TOUCHED) &&
> +		    (!test_bit(0, master->cached) ||
> +		     *master->cache_val !=3D max_val)) {
> +			int err =3D snd_usb_set_cur_mix_value(master, 0, 0,
> +							    max_val);
> +			if (err < 0)
> +				usb_audio_dbg(mixer->chip,
> +					      "derive ctl %d ch 0 failed (%d)\n",
> +					      master->control, err);
> +		}
> +		if (master && level !=3D FLUSH_TOUCHED && !master_pending &&
> +		    (master->master_explicit || !have_ch))
> +			/* user-owned master, or a unit without per-channel
> +			 * data: re-assert the cached master value
> +			 */
> +			repush_ctl_cached(master);
> +		for_each_mixer_elem(list, mixer, id) {
> +			cval =3D mixer_elem_list_to_info(list);
> +			if (!is_feature_volume_mute_ctl(cval))
> +				continue;
> +			if (cval->control =3D=3D UAC_FU_VOLUME && cval->cmask &&
> +			    level !=3D FLUSH_TOUCHED) {
> +				bitmap_zero(cval->pending, MAX_CHANNELS + 1);
> +				repush_ctl_cached(cval);
> +				continue;
> +			}

[Severity: Medium]
Does snd_usb_mixer_flush_pending() skip restoring a derived master volume on
FLUSH_RESUME_STATE and FLUSH_FULL_STATE when *master->cache_val already
matches max_val?

Once a prior flush has derived and written the master volume, bit 0 of
master->cached is set and *master->cache_val equals max_val.  Because
restore_mixer_value() skips all controls matching
is_feature_volume_mute_ctl() and the loop above only calls
repush_ctl_cached() for volume controls with cval->cmask !=3D 0 (or when
master->master_explicit || !have_ch), a derived master is never written back
to the device on resume if no channel volume changed while suspended, and a
derived master write dropped during the post-enumeration window is not
re-sent on PCM stream open.

> @@ -1632,14 +1966,50 @@ static int mixer_ctl_feature_put(struct snd_kcont=
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
> +						ch_put =3D true;
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
>  		}
> +		/* The last writer owns the master: a channel write (the
> +		 * way audio servers drive this unit) re-claims master
> +		 * derivation, so a master saved and restored by e.g.
> +		 * alsactl does not pin the volume forever.
> +		 */
> +		if (ch_put) {
> +			struct usb_mixer_elem_list *ml;
> +
> +			for_each_mixer_elem(ml, cval->head.mixer,
> +					    cval->head.id) {
> +				struct usb_mixer_elem_info *m =3D
> +					mixer_elem_list_to_info(ml);
> +
> +				if (is_feature_volume_mute_ctl(m) &&
> +				    m->control =3D=3D UAC_FU_VOLUME && !m->cmask)
> +					m->master_explicit =3D false;
> +			}
> +		}

[Severity: Medium]
When a per-channel volume write reclaims master derivation after an unflush=
ed
explicit master write, does leaving bit 0 of m->pending and m->cached set
cause snd_usb_mixer_flush_pending() to write the superseded master value?

If an explicit master put and a per-channel put happen within the same
MIXER_FLUSH_DELAY window (such as during alsactl restore) or while
suspended, the explicit master put sets bit 0 of m->pending and updates
m->cache_val[0].  When the channel put runs, clearing m->master_explicit
leaves bit 0 of m->pending set, so snd_usb_mixer_flush_pending() sees
master_pending =3D=3D true, skips master derivation, and calls
flush_ctl_pending(master) with the stale explicit value; even if m->pending
were cleared, m->cache_val[0] already holds the unwritten value and can mat=
ch
max_val, skipping the derived hardware write.

Also, ch_put is set for any deferred per-channel control, so toggling a
per-channel UAC_FU_MUTE control clears m->master_explicit on the unit's
master volume control as well.

[ ... ]
> @@ -3259,6 +3646,8 @@ static void snd_usb_mixer_free(struct usb_mixer_int=
erface *mixer)
>  	/* kill pending URBs */
>  	snd_usb_mixer_disconnect(mixer);
> =20
> +	cancel_delayed_work_sync(&mixer->flush_work);
> +
>  	/* Unregister controls first, snd_ctl_remove() frees the element */
>  	if (mixer->id_elems) {
[ ... ]
> @@ -3976,13 +4378,51 @@ void snd_usb_mixer_disconnect(struct usb_mixer_in=
terface *mixer)
>  {
>  	if (mixer->disconnected)
>  		return;
> +	/* Every mod_delayed_work() call site either holds this lock and
> +	 * re-checks ->disconnected inside it, or runs from a PM callback
> +	 * (which completes before the USB core calls driver->disconnect),
> +	 * or is the flush worker itself before it returns.  Marking the
> +	 * mixer disconnected under the lock before cancelling therefore
> +	 * guarantees no flush can be armed after the cancel returns.
> +	 */
> +	scoped_guard(mutex, &mixer->lock) {
> +		mixer->disconnected =3D true;
> +	}
> +	cancel_delayed_work_sync(&mixer->flush_work);

[Severity: Medium]
Can mixer_ctl_feature_put() re-arm mixer->flush_work after
snd_usb_mixer_disconnect() and snd_usb_mixer_free() have cancelled it?

The comment in snd_usb_mixer_disconnect() notes that every locked
mod_delayed_work() caller checks mixer->disconnected under mixer->lock, but
neither deferred branch in mixer_ctl_feature_put() checks
cval->head.mixer->disconnected before calling mod_delayed_work(), and unlike
the direct write path, the deferred path never calls
snd_usb_lock_shutdown().  In snd_usb_mixer_free(),
cancel_delayed_work_sync(&mixer->flush_work) also runs before
snd_ctl_remove() unregisters the controls:

CPU0                                  CPU1
snd_usb_mixer_free()
  snd_usb_mixer_disconnect()
    mutex_lock(&mixer->lock)
    mixer->disconnected =3D true
    mutex_unlock(&mixer->lock)
    cancel_delayed_work_sync()
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

Checking cval->head.mixer->disconnected under mixer->lock in
mixer_ctl_feature_put() (or before arming flush_work) would uphold the
teardown invariant.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117124242.1223=
7-1-a@pavel.bz?part=3D2
