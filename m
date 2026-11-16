Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844692;
	b=e21NwLj9Qy9hYILSvJcc4aE2QoSps9d2NIJhnEg9LuB78hEV9W5mZkEWDhy1CHEVhrdW
	 xjQv92ZDAPbPDUH9uBYD2nzJNNyVafi4xLbSSSO00/gxZFr3lkeF1fRZymD5QUKgBwgwY
	 MKl8uZ5rIxYqRQfNf/IfaF9gw/Dma1n6k9PRcVLNSlyvdRzjVocI8/B7MsdjLclf5dD6e
	 37rEHAl0Pt80cn0cz4+5wqySCCK3wVGGc3Ux+zb5274HSm8/2IEaqaf1S9TApGKW/G1CD
	 JEpYRsO5qkYwPV4OsqVSJBcJhjBECCtqSFehfyB5quFAjMDm+iGUecZx34AYlQg8R5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844692;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=af7fERH9oEQGH+NK6sUrFS7ZbRqmdTUEDea+bliL50Q=;
	b=DGfc7EHh5ngoIpIuQx3bFSHCPA+awqqnWguaIeeSPuZkmbxy0U+GXWKG49RJngVQxy8Q
	 YseAugWx0uPxS2eWTF1fIn3lsqBwlGyjRW3fOIl4yOSvnRjBNOvTUd0BJHiOg/PUKD+Zw
	 JR5gn9Kxf+9htszeGGKenVrYdcirMSOeqmog/iBOL7QB7qZejZItBoFHd5YpdVrECGTqA
	 60oaxknv4QY6U/wJ7s5Anw4BIYqGTeIL4KxA15q5uu2zlETKg8yx+M27D2dwWRIAGYlXH
	 AhAVvcw6XEl+U1RlMQ9CmV6KMCmqxV6i6SO00i7oKPInQ2JZ9gHI55K2LKUzrCKPaFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KIlp/4fm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B25606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 15:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIlp/4fm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A60A1F000C4;
	Mon, 16 Nov 2026 15:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794844691;
	bh=af7fERH9oEQGH+NK6sUrFS7ZbRqmdTUEDea+bliL50Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KIlp/4fmH6n+lOV8xFy5GBAZyGI/oWZhbmQFfpGMfWEd55s1oySsUWz0K04JXdH4y
	 E2ZEDGRY5RDg8J2XMJcuLnn7uk+KqZCZGZ6fxK45wNrxKuiymO2APkuIrGCT2lA37e
	 AiyaREHGaEklLEHSy6GvgPNfdC3aDiHG9/3jIpwPDLiUVFwNoi7aBpD6msg0R3G1dk
	 /5gaS416qsrRtFqH3j/UzvMFJuS51DGqcqxFX514Rs0JYcCxDKlsHUH6ophv/zEBU5
	 c1FqB0qTE3hGxa90CVk0r/+s0U0aVLNAQgeyUXOLai2PIk3Rt7uzelROiXOSxL5swi
	 HRKzI1XPmHreQ==
Message-ID: <sashiko-outbox-217326@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/2] ALSA: usb-audio: add MIXER_STATE_REPUSH quirk
 flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavel Artemev" <a@pavel.bz>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261116153521.188570-3-a@pavel.bz>
References: <20261116153521.188570-1-a@pavel.bz>
 <20261116153521.188570-3-a@pavel.bz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:58:11 +0000
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
- [High] ALSA: usb-audio: dropped non-volume writes in
  mixer_ctl_feature_put()
- [High] ALSA: usb-audio: skipped master re-push in
  snd_usb_mixer_flush_pending()
- [High] ALSA: usb-audio: unlocked snd_usb_mixer_flush_pending() races
  with put()
- [High] ALSA: usb-audio: missing flush_work cancel on disconnect and
  suspend
- [Medium] ALSA: usb-audio: broken negative volume max in
  snd_usb_mixer_flush_pending()
- [Medium] ALSA: usb-audio: status interrupt clears cache under
  MIXER_STATE_REPUSH
- [Low] ALSA: usb-audio: 32-bit shift overflow with BIT() on u64 cmask
  in flush helpers
--

commit f48a8ed50544ffb0295c5ae1365eebbbf684e0b3
Author: Pavel Artemev <a@pavel.bz>

ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag

This commit introduces QUIRK_FLAG_MIXER_STATE_REPUSH to coalesce Feature Un=
it
volume and mute control writes into a deferred burst and re-push cached
volume state on PCM stream open, and enables it for Weltrend/XiiSound
(040b:0897) headsets.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221401

> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index 95209ec006b3c..7a5d3ffe5bb5f 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c

[ ... ]

> @@ -1597,11 +1598,229 @@ static int mixer_ctl_feature_get(struct snd_kcon=
trol *kcontrol,
>  	return 0;
>  }
> =20
> +
> +
> +/*
> + * Atomic mixer write bursts (QUIRK_FLAG_MIXER_STATE_REPUSH).
> + *
> + * Some devices silently drop mixer writes issued in the first seconds
> + * after USB enumeration, and can drop individual writes at any later
> + * time as well; GET_CUR is broken on them, so the divergence cannot
> + * be detected by reading back.  The vendor's Windows driver never
> + * reads either: it collects the whole channel picture at a single
> + * source of truth and writes every channel of a control in one short
> + * burst (master first), re-pushing the complete state at every device
> + * open.
> + *
> + * User space applies one logical volume change as multiple fragmented
> + * control writes (one per channel, the first carrying stale siblings),
> + * so the stock write-per-put path cannot produce that burst.  Puts
> + * therefore only record values - the cache is defined as "what user
> + * space last asked for" and is never read back from the device - and
> + * a single flush timer coalesces the fragments.  When it fires, each
> + * touched feature unit is written in the Windows order: the master,
> + * derived as the loudest channel, first, then the changed channels,
> + * one write each.  A stream open requests a full-state re-push
> + * (healing writes lost in the post-enumeration window), merged into
> + * the same timer so a burst never observes a half-applied gesture
> + * (user space opens streams mid-gesture for UI feedback sounds).
> + */
> +
> +/* quiescence window for the flush; user space applies a stereo change
> + * as two control writes 5..20 ms apart
> + */
> +#define MIXER_FLUSH_DELAY	msecs_to_jiffies(30)
> +
> +static bool is_feature_volume_mute_ctl(struct usb_mixer_elem_info *cval)
> +{
> +	if (!cval->head.kctl || !cval->head.kctl->info)
> +		return false;
> +	if (cval->head.kctl->info !=3D mixer_ctl_feature_info)
> +		return false;
> +	return cval->control =3D=3D UAC_FU_VOLUME || cval->control =3D=3D UAC_F=
U_MUTE;
> +}
> +
> +/* Re-send every cached channel of one control, unchanged values
> + * included
> + */
> +static void repush_ctl_cached(struct usb_mixer_elem_info *cval)
> +{
> +	int c, err, idx =3D 0;
> +
> +	if (cval->cmask) {
> +		for (c =3D 0; c < MAX_CHANNELS; c++) {
> +			if (!(cval->cmask & BIT(c)))
> +				continue;
> +			if (test_bit(c + 1, cval->cached)) {
> +				err =3D snd_usb_set_cur_mix_value(cval, c + 1,
> +						idx, cval->cache_val[idx]);
> +				if (err < 0)
> +					usb_audio_dbg(cval->head.mixer->chip,
> +						      "repush ctl %d ch %d failed (%d)\n",
> +						      cval->control, c + 1, err);
> +			}
> +			idx++;
> +		}
> +	} else {
> +		/* master channel */
> +		if (test_bit(0, cval->cached)) {
> +			err =3D snd_usb_set_cur_mix_value(cval, 0, 0,
> +							*cval->cache_val);
> +			if (err < 0)
> +				usb_audio_dbg(cval->head.mixer->chip,
> +					      "repush ctl %d ch 0 failed (%d)\n",
> +					      cval->control, err);
> +		}
> +	}
> +}
> +
> +/* Write one control's pending (changed-since-last-flush) channels. */
> +static void flush_ctl_pending(struct usb_mixer_elem_info *cval)
> +{
> +	int c, err, idx =3D 0;
> +
> +	for (c =3D 0; c < MAX_CHANNELS; c++) {
> +		if (!(cval->cmask & BIT(c)))
> +			continue;
> +		if (test_bit(c + 1, cval->pending)) {
> +			clear_bit(c + 1, cval->pending);
> +			if (test_bit(c + 1, cval->cached)) {
> +				err =3D snd_usb_set_cur_mix_value(cval, c + 1,
> +						idx, cval->cache_val[idx]);

[Severity: Medium]
Can a USB status interrupt clear cval->cached and cause flush_ctl_pending()
to drop a pending write?

snd_usb_mixer_notify_id() and snd_usb_mixer_interrupt_v2() zero info->cached
whenever !info->get_cur_broken.  Boolean controls such as UAC_FU_MUTE skip
check_sticky_volume_control() in get_min_max_with_quirks() and keep
get_cur_broken =3D=3D 0, so a status interrupt for the Feature Unit clears
cval->cached; flush_ctl_pending() then clears cval->pending without writing
to hardware, and later mixer_ctl_feature_get() or mixer_ctl_feature_put()
calls fall back to UAC_GET_CUR readbacks.

> +				if (err < 0)
> +					usb_audio_dbg(cval->head.mixer->chip,
> +						      "flush ctl %d ch %d failed (%d)\n",
> +						      cval->control, c + 1, err);
> +			}
> +		}
> +		idx++;
> +	}
> +	if (!cval->cmask && test_bit(0, cval->pending)) {
> +		/* master channel */
> +		clear_bit(0, cval->pending);
> +		if (test_bit(0, cval->cached)) {
> +			err =3D snd_usb_set_cur_mix_value(cval, 0, 0,
> +							*cval->cache_val);
> +			if (err < 0)
> +				usb_audio_dbg(cval->head.mixer->chip,
> +					      "flush ctl %d ch 0 failed (%d)\n",
> +					      cval->control, err);
> +		}
> +	}
> +}
> +
> +/*
> + * One atomic write burst per touched feature unit, Windows-style:
> + * full =3D re-push every cached volume value (the stream-open heal),
> + * otherwise only the channels user space changed since the last
> + * flush.  The master is written first and derived as the loudest
> + * cached channel - never asserted from its own (possibly stale)
> + * cache, and never overridden when user space put it explicitly.
> + * Mute switches are only written when user space changed them: a
> + * lost re-assert can only fail to mute (power-up is unmuted), and
> + * mute writes during playback audibly chop the stream on these
> + * devices.
> + */
> +static void snd_usb_mixer_flush_pending(struct usb_mixer_interface *mixe=
r,
> +					bool full)
> +{
> +	struct usb_mixer_elem_list *list;
> +	struct usb_mixer_elem_info *cval, *master;
> +	int id, c, idx, max_val;
> +	bool have_ch, touched, master_pending;
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
> +			if (!bitmap_empty(cval->pending, MAX_CHANNELS + 1))
> +				touched =3D true;
> +			idx =3D 0;
> +			for (c =3D 0; c < MAX_CHANNELS; c++) {
> +				if (!(cval->cmask & BIT(c)))
> +					continue;

[Severity: Low]
Does BIT(c) overflow a 32-bit unsigned long on 32-bit architectures when c
reaches 32..63?

MAX_CHANNELS is 64 and cval->cmask is a u64 (since 16ee07bfa935 ("ALSA:
usb-audio: Extend max number of channels to 64")), so the loops in
repush_ctl_cached(), flush_ctl_pending(), and snd_usb_mixer_flush_pending()
need BIT_ULL(c) to test bits 32..63 without undefined shift behavior.

> +				if (test_bit(c + 1, cval->cached)) {
> +					if (cval->cache_val[idx] > max_val)
> +						max_val =3D cval->cache_val[idx];
> +					have_ch =3D true;
> +				}

[Severity: Medium]
Does initializing max_val to 0 produce the wrong master volume when all
cached channel values are negative?

cval->cache_val[] holds raw hardware values from get_abs_value(), which for
standard UAC Feature Unit volume controls (USB_MIXER_S16) are signed 1/256 =
dB
values where attenuation below 0 dB is negative.  When all cached channels =
are
negative, cval->cache_val[idx] > max_val is never true while have_ch is set=
 to
true, so max_val stays 0 and snd_usb_set_cur_mix_value() writes 0 (0 dB, or=
 an
out-of-range value if master->max < 0) to the master channel.  Seeding max_=
val
when !have_ch or initializing it to INT_MIN would avoid this.

> +				idx++;
> +			}
> +		}
> +		/* master first (the Windows burst order); a max of 0 is a
> +		 * legal volume, hence the explicit have_ch test
> +		 */
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
> +		if (master && full && !have_ch && !master_pending)
> +			/* unit without per-channel data: own cache */
> +			repush_ctl_cached(master);
> +		for_each_mixer_elem(list, mixer, id) {
> +			cval =3D mixer_elem_list_to_info(list);
> +			if (!is_feature_volume_mute_ctl(cval))
> +				continue;
> +			if (cval->control =3D=3D UAC_FU_VOLUME && full &&
> +			    cval->cmask) {
> +				bitmap_zero(cval->pending, MAX_CHANNELS + 1);
> +				repush_ctl_cached(cval);
> +				continue;
> +			}
> +			if (!bitmap_empty(cval->pending, MAX_CHANNELS + 1))
> +				flush_ctl_pending(cval);
> +		}

[Severity: High]
Doesn't the (!test_bit(0, master->cached) || *master->cache_val !=3D max_va=
l)
check prevent the master channel from being re-pushed on PCM stream open wh=
en
have_ch is true?

At mixer creation (in init_cur_mix_raw() and snd_usb_mixer_init_volume_max(=
))
and on any flush during the post-enumeration loss window,
snd_usb_set_cur_mix_value() sets bit 0 in master->cached and sets
*master->cache_val =3D max_val even when the device drops the USB write.  W=
hen a
stream is opened later (full =3D=3D true), *master->cache_val already equals
max_val, the !have_ch fallback is skipped because have_ch is true, and the
second loop skips master because master->cmask is 0, so a dropped master
volume write is never healed.  For the same reason, a balance change that
adjusts a quieter channel without changing max_val also skips writing master
at the start of the burst.

Conversely, if user space explicitly writes to the master control,
flush_ctl_pending(master) clears bit 0 of master->pending on that flush, so
the next stream open or channel flush sees !master_pending and
*master->cache_val !=3D max_val and overwrites the explicit master volume w=
ith
max_val.

> +	}
> +}
> +
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
> +	}
> +	if (full)
> +		usb_audio_info(mixer->chip, "flushing mixer state (stream open)\n");
> +	snd_usb_mixer_flush_pending(mixer, full);
> +}

[Severity: High]
Does running snd_usb_mixer_flush_pending() without mixer->lock race with
mixer_ctl_feature_put()?

kworker                                   CPU0
snd_usb_mixer_flush_work()
  snd_usb_mixer_flush_pending()
    flush_ctl_pending()
      val =3D cval->cache_val[idx]
      snd_usb_set_cur_mix_value(..., val)
        snd_usb_mixer_set_ctl_value()
                                          mixer_ctl_feature_put()
                                            guard(mutex)(&mixer->lock)
                                            cval->cache_val[idx] =3D new_val
                                            set_bit(c + 1, cval->pending)
        cval->cache_val[idx] =3D val  <-- clobbers new_val

While snd_usb_mixer_set_ctl_value() sleeps in snd_usb_ctl_msg(), a concurre=
nt
mixer_ctl_feature_put() can update cval->cache_val[idx], and when the USB
transfer completes snd_usb_set_cur_mix_value() overwrites cval->cache_val[i=
dx]
with the old value.  Similarly, if mixer_ctl_feature_put() sets cval->pendi=
ng
and updates cval->cache_val[idx] between the first loop of
snd_usb_mixer_flush_pending() (which computes max_val) and the second loop
(which clears cval->pending via bitmap_zero() or flush_ctl_pending()), the
pending bit is cleared without updating master to the new max_val.  In
snd_usb_mixer_stream_opened(), calling mod_delayed_work() after dropping
mixer->lock also allows an expiring flush_work to consume flush_full before
the timer is extended by MIXER_FLUSH_DELAY.

> +
>  /* put the current value to feature/mixer unit */
>  static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
>  				 struct snd_ctl_elem_value *ucontrol)
>  {
>  	struct usb_mixer_elem_info *cval =3D snd_kcontrol_chip(kcontrol);
> +	bool deferred =3D cval->head.mixer->chip->quirk_flags &
> +			QUIRK_FLAG_MIXER_STATE_REPUSH;

[Severity: High]
Does setting deferred without checking is_feature_volume_mute_ctl(cval) drop
writes to all other controls that use mixer_ctl_feature_put()?

usb_feature_unit_ctl is used for all 12 Feature Unit control types in
audio_feature_info[] (such as Auto Gain Control, Bass, Treble, and Loudness)
as well as Mixer Unit controls created by build_mixer_unit_ctl().  When
QUIRK_FLAG_MIXER_STATE_REPUSH is set, mixer_ctl_feature_put() defers writes
for all of them into cval->pending, but snd_usb_mixer_flush_pending() skips
everything rejected by is_feature_volume_mute_ctl(), so those writes never
reach the hardware.

Meanwhile, build_mixer_unit_ctl() (where cval->control =3D in_ch + 1) and
mixer_procunit_ctl in build_audio_procunit() also set kctl->info =3D
mixer_ctl_feature_info.  Any Mixer Unit control for input channels 0 or 1 or
Processing/Extension Unit control with selector 1 or 2 matches
is_feature_volume_mute_ctl(), and because mixer_ctl_procunit_put() writes v=
ia
set_cur_ctl_value() without updating cval->cache_val, a stream-open full fl=
ush
overwrites Processing Unit control 2 with its stale initial cache_val.

[ ... ]

> @@ -3974,6 +4218,34 @@ void snd_usb_mixer_disconnect(struct usb_mixer_int=
erface *mixer)
>  	mixer->disconnected =3D true;
>  }

[Severity: High]
Can mixer->flush_work run after usb_audio_disconnect() or during USB suspen=
d?

snd_usb_mixer_disconnect() only sets mixer->disconnected =3D true, while
cancel_delayed_work_sync(&mixer->flush_work) is deferred until
snd_usb_mixer_free() when user space closes the last ALSA file descriptor, =
and
mixer_ctl_feature_put() still schedules flush_work even after
mixer->disconnected is set.  If a device is unplugged while an ALSA device =
node
is open, usb_audio_disconnect() returns to the USB core and struct usb_devi=
ce
can be freed before snd_usb_mixer_flush_work() runs and dereferences
mixer->chip->dev->dev in usb_audio_info() (prior to checking
mixer->disconnected in snd_usb_mixer_flush_pending()).  Likewise,
snd_usb_mixer_suspend() does not cancel flush_work, allowing the worker to
issue control transfers while the interface is suspended.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116153521.1885=
70-1-a@pavel.bz?part=3D2
