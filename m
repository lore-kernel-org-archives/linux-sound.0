Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903533;
	b=Y2V9YfJ/wmDQ3l0Y51vAqyZ3HWTmkt7MzaDFmsqxD9H6ZIDAPsOZ2LG0pRxV9XbRqv+q
	 /VvHmXzujiUGFfkARaGwaOjp0uPfsHWRL4WbOq7uSSygqXpxt20PJZuLYPLJOYA2eVOnA
	 hTaxmHip6l8CiXFxpPl5iqMrEez1isnv+fVTkjM7EtDQCvg6DyKz9JnYUILou2IofRhim
	 h6XwNYVMlcbaKaxJVyfI521TO9plXXRDOgKTaRjCM84ZBC4xwr+nK64QWU+3n+7upWi/A
	 XD9+KLaZiNpM1356dcKXdpRST2Y0ehO04Gy5dOp5VEjdTxtuZgOjXcGvwNsL/dX5Gow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903533;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XjTfmvJbIE/nCT4zlKRigr8LdaNzVElK/ISHo7xZEsY=;
	b=GNJLbNzRIXGlKx6zppVD+cxGTVAtj55EhJF3pPHNPEcmb8ZVik53DTz30nqHjJJ3LkjF
	 hVx3JAbdbc+ww5OIbHtrLSqTxd6lKeyJl3/fPgRr8HyCzL8WUwnzpZAhFmM/tad1wzliN
	 67gfOOxtF1ph+iskH8jckVi2wd9VyubR/qj0e9/fbXQMdZzNI62M3rohIg6OPf1VlaRK/
	 dsoK+9hzm8nAeJuj/1XmWwpy4gAw/mN4FSgN24qXklkrOgXc7WqN5WRfG+LcIGzoDVDIr
	 uardCaVbzdwjrj0ZaPVwuk9QRd1omnz5KfNnY2NSYBjG3ZWliThff9Z+o6DBYMkVqIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pv0CEQ00;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6D8606A323
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pv0CEQ00
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8469F1F000C4;
	Tue, 17 Nov 2026 08:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794903533;
	bh=XjTfmvJbIE/nCT4zlKRigr8LdaNzVElK/ISHo7xZEsY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pv0CEQ00WCjZjm0DFndFVYGIWVEeFzef+/d+htVIPQxoNJN8JkEeDOxM8dN9H7WmU
	 g4q7WdBqScCMgwUVQYgLjsdciJuy7jzUz2X+gUxSQiOoP8bdFv8GByX7v4mWPthZ1N
	 z5JWe9aWFkSLwwopUUbyeASTfsPSMIjp/PMj4nYbIFCE2uo5+FHtKZIsz92v1hdrqX
	 2F0gTE5YyXFpdblXapyqSdViOTeb1mRhLV38+Kdj16n4aTid+AgdTYVHDHAuG30ixK
	 jg5wyoxTNzCWYLcqMrZV8r5fQQ2xFEFQcdAyyg136Hw6Ry7tSfEOh2L+lgg3QxqWcA
	 MvQZfbticNeFQ==
Message-ID: <sashiko-outbox-218409@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 2/2] ALSA: usb-audio: add MIXER_STATE_REPUSH
 quirk flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavel Artemev" <a@pavel.bz>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261117074318.378876-3-a@pavel.bz>
References: <20261117074318.378876-1-a@pavel.bz>
 <20261117074318.378876-3-a@pavel.bz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 08:18:53 +0000
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
- [High] ALSA: usb-audio: runtime PM deadlock in snd_usb_mixer_suspend()
- [Medium] ALSA: usb-audio: stale master cache on suspend in
  snd_usb_mixer_suspend()
- [Medium] ALSA: usb-audio: stale restore on autoresume in
  snd_usb_mixer_flush_work()
- [Medium] ALSA: usb-audio: explicit master overwritten in
  snd_usb_mixer_flush_pending()
- [Medium] ALSA: usb-audio: Mixer Unit misclassified in
  is_feature_volume_mute_ctl()
- [Low] ALSA: usb-audio: read-only channel cache updated in
  mixer_ctl_feature_put()
- [Low] ALSA: usb-audio: unratelimited usb_audio_info() on PCM open in
  flush work
--

commit 57c12412dcfc2a07a4e6bcacef21bf4772a7601e
Author: Pavel Artemev <a@pavel.bz>

ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag

This commit adds the QUIRK_FLAG_MIXER_STATE_REPUSH quirk flag to defer
Feature Unit volume and mute writes into a coalesced burst and re-push the
cached mixer state when a PCM stream opens, enabling it for 040b:0897.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221401
Link: https://lore.kernel.org/linux-sound/20261116153521.188570-3-a@pavel.bz

> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index bf1d9fbf08aae..cf3a211bfeb13 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
[ ... ]
> +static bool is_feature_volume_mute_ctl(struct usb_mixer_elem_info *cval)
> +{
> +	if (!cval->head.kctl || !cval->head.kctl->put)
> +		return false;
> +	/* the info callback is shared with processing unit controls
> +	 * (whose put writes through a different path and does not manage
> +	 * the shared cache); the put callback is unique to feature unit
> +	 * and mixer unit controls, which the cache does cover
> +	 */
> +	if (cval->head.kctl->put !=3D mixer_ctl_feature_put)
> +		return false;
> +	return cval->control =3D=3D UAC_FU_VOLUME || cval->control =3D=3D UAC_F=
U_MUTE;
> +}

[Severity: Medium]
Can this misclassify Mixer Unit controls as Feature Unit mute or volume
controls?

Mixer Unit controls built by build_mixer_unit_ctl() also use
usb_feature_unit_ctl (.put =3D mixer_ctl_feature_put), but store the 1-based
input channel number (in_ch + 1) in cval->control:

sound/usb/mixer.c:build_mixer_unit_ctl() {
	...
	snd_usb_mixer_elem_init_std(&cval->head, state->mixer, unitid);
	cval->control =3D in_ch + 1; /* based on 1 */
	if (state->mixer->protocol =3D=3D UAC_VERSION_2 ||
	    state->mixer->protocol =3D=3D UAC_VERSION_3)
		cval->v2_mixer =3D true;
	cval->num_outputs =3D num_outs;
	...
}

On a device with a Mixer Unit, input channel 1 (cval->control =3D=3D 1 =3D=
=3D
UAC_FU_MUTE) is treated as a mute switch and skipped during stream-open
volume re-pushes, input channel 2 (cval->control =3D=3D 2 =3D=3D UAC_FU_VOL=
UME) is
treated as a Feature Unit volume control, and input channels 3 and higher
return false and bypass deferral and re-pushing altogether.  Checking
!cval->num_outputs would exclude Mixer Unit controls.

[ ... ]

> +static void snd_usb_mixer_flush_pending(struct usb_mixer_interface *mixe=
r,
> +					bool full)
> +{
> +	struct usb_mixer_elem_list *list;
> +	struct usb_mixer_elem_info *cval, *master;
> +	int id, c, idx, max_val;
> +	bool have_ch, touched, master_pending;
> +
> +	lockdep_assert_held(&mixer->lock);
> +
> +	if (mixer->disconnected)
> +		return;
> +
> +	for (id =3D 0; id < MAX_ID_ELEMS; id++) {
> +		master =3D NULL;
> +		max_val =3D 0;
> +		have_ch =3D false;
> +		touched =3D false;
> +		master_pending =3D false;
> +		for_each_mixer_elem(list, mixer, id) {
> +			cval =3D mixer_elem_list_to_info(list);
> +			if (!is_feature_volume_mute_ctl(cval) ||
> +			    cval->control !=3D UAC_FU_VOLUME)
> +				continue;
> +			if (!cval->cmask) {
> +				if (!master) {
> +					master =3D cval;
> +					master_pending =3D
> +						test_bit(0, cval->pending);
> +				}
> +				continue;
> +			}
[ ... ]
> +		/* master first (the Windows burst order) */
> +		if (master && !master_pending && have_ch &&
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
Does this overwrite an explicit user-space master volume setting on the
next PCM stream open or per-channel write?

When user space sets the master control (cval->cmask =3D=3D 0),
mixer_ctl_feature_put() sets bit 0 in master->pending.  That keeps
master_pending true for the first flush, where flush_ctl_pending(master)
clears bit 0 of master->pending and writes *master->cache_val.  On any
later stream open (full =3D=3D true) or per-channel write (touched =3D=3D t=
rue),
test_bit(0, master->pending) is now 0, so snd_usb_mixer_flush_pending()
sees !master_pending and overwrites both hardware channel 0 and
master->cache_val[0] with max_val.

[ ... ]

> +static void snd_usb_mixer_flush_work(struct work_struct *work)
> +{
> +	struct usb_mixer_interface *mixer =3D
> +		container_of(work, struct usb_mixer_interface,
> +			     flush_work.work);
> +	bool full;
> +
> +	scoped_guard(mutex, &mixer->lock) {
> +		full =3D mixer->flush_full;
> +		mixer->flush_full =3D false;
> +		if (mixer->disconnected)
> +			return;
> +		if (full)
> +			usb_audio_info(mixer->chip,
> +				       "flushing mixer state (stream open)\n");

[Severity: Low]
Should this use usb_audio_dbg() instead of usb_audio_info()?  Audio
servers such as PipeWire open and close PCM substreams frequently, so
logging at info level on every stream open will spam dmesg.

> +		snd_usb_mixer_flush_pending(mixer, full);
> +	}
> +}

[Severity: Medium]
What happens when snd_usb_mixer_flush_work() runs while the device is
runtime-suspended?

mixer_ctl_feature_put() records deferred channel values in cval->cache_val
without waking the device, and snd_usb_mixer_flush_work() enters
snd_usb_mixer_flush_pending() without holding snd_usb_lock_shutdown(chip).
When snd_usb_mixer_flush_pending() calls snd_usb_set_cur_mix_value() for
the derived master volume, snd_usb_mixer_set_ctl_value() runs before
master->cache_val[0] is updated to max_val:

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
snd_usb_autoresume(chip), which synchronously runs usb_audio_resume() ->
snd_usb_mixer_resume() -> restore_mixer_value().  Because
master->cache_val[0] still holds its pre-flush value, restore_mixer_value()
writes the stale master value (and all other cached controls, including
mute switches and capture units) to the hardware before
snd_usb_mixer_flush_pending() writes the new master and pending channels a
second time.  Acquiring CLASS(snd_usb_lock, pm)(mixer->chip) in
snd_usb_mixer_flush_work() and updating master->cache_val[0] before waking
the device would avoid the stale restore.

> +
>  /* put the current value to feature/mixer unit */
>  static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
>  				 struct snd_ctl_elem_value *ucontrol)
>  {
[ ... ]
>  			if (oval !=3D val) {
> -				err =3D snd_usb_set_cur_mix_value(cval, c + 1,
> -								cnt, val);
> -				if (err < 0)
> -					return filter_error(cval, err);
> +				if (deferred) {
> +					/* record only; one flush writes the
> +					 * whole unit in a single burst
> +					 */
> +					set_bit(c + 1, cval->cached);
> +					cval->cache_val[cnt] =3D val;
> +					set_bit(c + 1, cval->pending);
> +					mod_delayed_work(system_wq,
> +							 &cval->head.mixer->flush_work,
> +							 MIXER_FLUSH_DELAY);
> +				} else {

[Severity: Low]
Does the deferred path in mixer_ctl_feature_put() update cval->cache_val[]
for read-only channels?

In the direct path, snd_usb_set_cur_mix_value() checks
cval->master_readonly and cval->ch_readonly & BIT(channel - 1) and returns
before setting cval->cached or cval->cache_val[index].  Here, cval->cached
and cval->cache_val[] are updated before snd_usb_set_cur_mix_value() runs
in the flush worker, so a write to a read-only channel remains in the
cache and is returned by later gets and used when deriving max_val.

[ ... ]

> @@ -4007,6 +4320,7 @@ static int snd_usb_mixer_activate(struct usb_mixer_=
interface *mixer)
> =20
>  int snd_usb_mixer_suspend(struct usb_mixer_interface *mixer)
>  {
> +	cancel_delayed_work_sync(&mixer->flush_work);
>  	snd_usb_mixer_inactivate(mixer);
>  	if (mixer->private_suspend)
>  		mixer->private_suspend(mixer);

[Severity: High]
Can cancel_delayed_work_sync(&mixer->flush_work) in
snd_usb_mixer_suspend() deadlock with snd_usb_mixer_flush_work()?

Neither mixer_ctl_feature_put() nor snd_usb_mixer_stream_opened() holds a
USB runtime PM reference across the 30 ms MIXER_FLUSH_DELAY window, and
usb_audio_suspend() does not increment chip->active.  If the USB device
begins runtime suspend while mixer->flush_work is executing, the two
contexts deadlock:

kworker (PM)                      kworker (system_wq)
------------                      -------------------
rpm_suspend(&udev->dev)
  /* runtime_status =3D RPM_SUSPENDING */
  ...
  usb_audio_suspend()
    snd_usb_mixer_suspend()
                                  snd_usb_mixer_flush_work()
                                    snd_usb_mixer_flush_pending()
                                      snd_usb_set_cur_mix_value()
                                        snd_usb_mixer_set_ctl_value()
                                          snd_usb_lock_shutdown()
                                            snd_usb_autoresume()
                                              usb_autopm_get_interface()
                                                rpm_resume(&udev->dev)
                                                  /* waits on RPM_SUSPENDIN=
G */
      cancel_delayed_work_sync(&mixer->flush_work)

 *** DEADLOCK ***

Both workers sleep forever in TASK_UNINTERRUPTIBLE.

[Severity: Medium]
If snd_usb_mixer_suspend() cancels a pending mixer->flush_work before its
30 ms timer fires, does snd_usb_mixer_resume() restore a stale master
volume?

When mixer_ctl_feature_put() defers a per-channel volume write, it updates
 the channel's cval->cache_val[cnt] and sets cval->pending, but the unit's
master control (master->cache_val[0]) is only updated to max_val when
snd_usb_mixer_flush_pending() runs.  If suspend cancels mixer->flush_work
before it runs, snd_usb_mixer_resume() -> restore_mixer_value() writes the
stale pre-change master->cache_val[0] to channel 0 (which can leave the
device muted if master was previously at minimum) and leaves cval->pending
and mixer->flush_full set with no flush work scheduled.  In addition,
because snd_usb_mixer_suspend() runs before snd_power_change_state() sets
SNDRV_CTL_POWER_D3hot in usb_audio_suspend() (and runtime suspend never
sets D3hot), a concurrent mixer_ctl_feature_put() can re-arm
mixer->flush_work after cancel_delayed_work_sync() returns.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117074318.3788=
76-1-a@pavel.bz?part=3D2
