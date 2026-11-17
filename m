Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927878;
	b=qhNQPa4OVz3z61cl9eEv0Ly++gWAbVUVrMr24rXfvkv7X1jGLVaUomg5zwISLdGof7cI
	 NcaFRJhaTuRB5AsnOa7XLPWNHstoaoVasfvPJf7OjgXxwbV+Ts3Jk4p3hj+lT+Ny7r+p/
	 FBwuWfC7VMC58ZnNIq0AkDkcdyUhsc0cY3uSwFsrko/9RmmzLEHuEYHEULiklVDlrm3Qa
	 QOu09abA5V8vNZ48HmxJA3Bu7vhRfb9tlTvs8GwhY/ZCA+EZgTUg3ShFj1DxIEv2itE0H
	 hiVlTRvuPRHqq7u7/TXeW/nNJW3VplqeAJjrDU24mhhU5FpkMuhc/4emwc0cd90+/HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927878;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=78Of5UK7VLU4VzzuW6ox3CSH+IIfy3VnKXCz81pNRo0=;
	b=qh1KYl4JnnLIfE0l3W/N6bIq6lzh1fj2RRucPJ25lcW+Q6hgbD24pO/DXUfPVukt6rGv
	 RsBZaHsw294YhkRu3sEp0k1sN5GHFfD6zCGlq5zT6Otzc6pw+r5uMYDcAeEBvtZ1Lv+d7
	 8wQHOUOf+TGZa1SJHsfY2paAhA4gtT6mnsSZ6NGGGlK8X6Ks8mqJZyNrXZsYwKyGO1lzk
	 TzqwIhmj7ND4EhbawyC+XpWkvkDQk4mswdd0SpvLuK3Gmc8G94HbBdGj/GYa2QAorrxCy
	 puInSu01l2C/a6jSgR7LH63WGlSyrZZYQv2pKOnv7j9jpk/hwp3TarIF7tQUUGwpL4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vk+DRw95;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501A9606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 15:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vk+DRw95
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEDD1F000C4;
	Tue, 17 Nov 2026 15:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794927877;
	bh=78Of5UK7VLU4VzzuW6ox3CSH+IIfy3VnKXCz81pNRo0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vk+DRw95+bbG6Z0i9TRAGcor2ugbMPFTn9u/LLvdbhjKF2azPYD/dXFAXmEWZPgB3
	 F2ZaWu3MJeb4p+hsSgaerxVb1Wiam8ZoYXcGL+O997p2G+KS6/PovwTEfiTAJIa14H
	 yiBqRG+r+zcpdj6oqnh68J3HrNBDec1agEpUoGjBBYEEKv+jEHRUWmbgLwCD7aIDhs
	 lHqzCvtzysjx20fwN4w/ngyyaj9VFZzMOP6sMUOTk3uDAo3tcFP4dUAgMDNxa7sJb+
	 VViijdrqmBfhMD8ix63iwBgcYBRYcIi5VNms16z57Ghmilr0FD2C7riRvVzyhT/JEn
	 Us4rA1qDjK1ZA==
Message-ID: <sashiko-outbox-219014@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavel Artemev" <a@pavel.bz>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261117143314.41853-3-a@pavel.bz>
References: <20261117143314.41853-1-a@pavel.bz>
 <20261117143314.41853-3-a@pavel.bz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 15:04:37 +0000
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
- [Medium] ALSA: usb-audio: stale master cache_val in
  mixer_ctl_feature_put()
- [Medium] ALSA: usb-audio: master_explicit stays pinned in
  mixer_ctl_feature_put()
--

commit 41831f8b3a2ed7b3056781d9884cd8cfd89e4001
Author: Pavel Artemev <a@pavel.bz>

ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag

This commit adds the QUIRK_FLAG_MIXER_STATE_REPUSH quirk flag to coalesce
feature unit volume and mute writes into deferred per-unit bursts and
re-push cached mixer state on PCM stream open and resume.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221401
Link: https://lore.kernel.org/linux-sound/20261117124242.12237-3-a@pavel.bz

> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index bf1d9fbf08aae..03d6fa3ab1d25 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c

[ ... ]

> @@ -1608,18 +1618,369 @@ static int mixer_ctl_feature_get(struct snd_kcon=
trol *kcontrol,

[ ... ]

> +static void snd_usb_mixer_flush_pending(struct usb_mixer_interface *mixe=
r,
> +					int level)
> +{

[ ... ]

> +		/* master first (the Windows burst order).  Re-asserted
> +		 * even unchanged, unless the value is the control's raw
> +		 * maximum: that re-send would only trigger the in-headset
> +		 * limit notification, and the device sits at raw max
> +		 * after every reset anyway.
> +		 */
> +		if (master && !master_pending && !master->master_explicit &&
> +		    have_ch &&
> +		    (touched || level !=3D FLUSH_TOUCHED) &&
> +		    (!test_bit(0, master->cached) ||
> +		     *master->cache_val !=3D max_val ||
> +		     max_val !=3D master->max)) {
> +			int err =3D snd_usb_set_cur_mix_value(master, 0, 0,
> +							    max_val);
> +			if (err < 0)
> +				usb_audio_dbg(mixer->chip,
> +					      "derive ctl %d ch 0 failed (%d)\n",
> +					      master->control, err);
> +		}

[ ... ]

> +static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
> +				 struct snd_ctl_elem_value *ucontrol)
> +{
>  	struct usb_mixer_elem_info *cval =3D snd_kcontrol_chip(kcontrol);
> +	bool deferred;
>  	int max_val;
>  	int c, cnt, val, oval, err;
>  	int changed =3D 0;
> =20
> +	deferred =3D (cval->head.mixer->chip->quirk_flags &
> +		    QUIRK_FLAG_MIXER_STATE_REPUSH) &&
> +		   is_feature_volume_mute_ctl(cval);
> +
>  	guard(mutex)(&cval->head.mixer->lock);
>  	max_val =3D get_max_exposed(cval);
>  	if (cval->cmask) {
> +		bool ch_put =3D false;
> +
>  		cnt =3D 0;
>  		for (c =3D 0; c < MAX_CHANNELS; c++) {
>  			if (!(cval->cmask & BIT(c)))
> @@ -1632,14 +1993,54 @@ static int mixer_ctl_feature_put(struct snd_kcont=
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
> +						mixer_arm_flush(cval->head.mixer);
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
> +		/* The last writer owns the master: a volume channel
> +		 * write (the way audio servers drive this unit)
> +		 * re-claims master derivation, so a master saved and
> +		 * restored by e.g. alsactl does not pin the volume
> +		 * forever.  An unflushed explicit master value is
> +		 * dropped along with the ownership: the pending bit is
> +		 * cleared so the flush re-derives the master instead of
> +		 * writing the superseded value.
> +		 */
> +		if (ch_put && cval->control =3D=3D UAC_FU_VOLUME) {
> +			struct usb_mixer_elem_list *ml;
> +
> +			for_each_mixer_elem(ml, cval->head.mixer,
> +					    cval->head.id) {
> +				struct usb_mixer_elem_info *m =3D
> +					mixer_elem_list_to_info(ml);
> +
> +				if (is_feature_volume_mute_ctl(m) &&
> +				    m->control =3D=3D UAC_FU_VOLUME && !m->cmask) {
> +					m->master_explicit =3D false;
> +					clear_bit(0, m->pending);
> +				}
> +			}
> +		}

[Severity: Medium]
Can m->master_explicit stay pinned after alsactl restore?

parse_audio_feature_unit() builds the per-channel control before the
master control:

sound/usb/mixer.c:parse_audio_feature_unit() {
    ...
			if (ch_bits & 1)
				build_feature_ctl(state, _ftr, ch_bits, control,
						  &iterm, unitid, 0);
			if (master_bits & BIT(i))
				build_feature_ctl(state, _ftr, 0, control,
						  &iterm, unitid, 0);
    ...
}

Because the per-channel control gets index 0 (lower numid) and the master
control gets index 1 (higher numid), alsactl restore writes the channels
first and the master second, leaving m->master_explicit set.  If an audio
server then writes a per-channel volume that already matches
cval->cache_val (for example the value alsactl just restored, or
cval->max after QUIRK_FLAG_MIXER_INIT_VOLUME_MAX), oval =3D=3D val on every
channel so ch_put remains false, m->master_explicit is never cleared, and
no flush is armed to re-derive the master volume.

>  	} else {
>  		/* master channel */
>  		err =3D snd_usb_get_cur_mix_value(cval, 0, 0, &oval);
> @@ -1650,9 +2051,24 @@ static int mixer_ctl_feature_put(struct snd_kcontr=
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
> +					mixer_arm_flush(cval->head.mixer);
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
When a per-channel write supersedes an unflushed master write by clearing
bit 0 of m->pending, does leaving bit 0 of m->cached set with the
unflushed m->cache_val[0] corrupt the master derivation check in
snd_usb_mixer_flush_pending()?

If the hardware master is below master->max, and user space writes
master->max to the master control followed by master->max to a channel
control before the flush runs, m->cache_val[0] is already updated to
master->max while m->pending is cleared.  snd_usb_mixer_flush_pending()
then sees test_bit(0, master->cached) and *master->cache_val =3D=3D max_val=
 =3D=3D
master->max, so it skips the master write on that flush and on all later
stream-open and resume re-pushes, leaving the hardware master volume stuck
at its old value.  Clearing bit 0 of m->cached whenever bit 0 of
m->pending is cleared on ownership handoff would force the next flush to
write the derived master value.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117143314.4185=
3-1-a@pavel.bz?part=3D2
