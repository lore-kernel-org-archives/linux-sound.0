Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794946424;
	b=t3W6yBII+DcbOdSWR4F0KNlS9UGCAfuXzyh9OOtJ529NttDFC7j1U+SbJh2+CqUkWmrV
	 mI51NOL9QB0RGENGQ+zHOI5toMi/z9/iV7URA+FLhh8eCPB3HHH6gn+zjG+ni/DvMP+/7
	 Wq22Dq4KHy+MbCM/8HR/vzvKpc3KLk46MeXuIcwoxP3sVB9e1RBN0+N2f7e0v4v0vq6Gt
	 wm+q1HvxKk5rszeuMEvy9z5NVwaUgrXWDtAb1wVlTk2CX1sweQRwp5uwtLW5GECoN9XtJ
	 ChM3f4E+bDAEMGH5RaDxpB3wuNrBOFvKtHPpR0GmaA3/xQ5+lgAG3VXJ3hPEHiuSgbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946424;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nh2NQc+W6THnkONS7eMacdzIcTzovSLQ/LB9pTpjBa4=;
	b=XplAYjp9M5bwBlZgdJ3vccz1UgFTOxdbqHB9teeqNGf96DTaBegSOtaSCaPvpRBI+M1Z
	 7QIdqjQ1ft+7ABmKze7zdB04y+zBG2YbXwlSmdAa9IYkFEcNnqEWMv3hd8k+eN9rAKEJr
	 5osEqXvPy4qyMst73yAKMsGruMx7IQ+y4tzQlrJWJYOpGMtPz6hLMHs5bj0AH17Bo11oU
	 P7MIu7frWyipkBBx109Vdh0Tn9AhuCes0dR/ksSVEkBREozHnIjL9rHuUZn7srJySxDri
	 2lQ+4o0+UvGjXLzPBepiM+UY6T3NJ19KCxxbkglI6lfq/6wsxDPWeuMSALsEP4w+q4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftrZGTxl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21580606A32F
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 20:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftrZGTxl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80291F000C6;
	Tue, 17 Nov 2026 20:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794946424;
	bh=nh2NQc+W6THnkONS7eMacdzIcTzovSLQ/LB9pTpjBa4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ftrZGTxlk6vUxJxylIcI2XQztl4tDAtLcASaZhY+lFYK8YrKK197f13XrhYvC7oTX
	 0HEotuFI1Zr8r3o8fZaRI5vKkMhgVwkK4yv4qb50TEhtqkeYXSMb5evIUnH25jn2KE
	 EMLXjwJ06cbLn7EQlT/K/K0yXiwlkf/ZBTyK1ErdKSonhpoG/iidFHges3vhUrlmDL
	 VuIplmlyWTqgfVLn5IpSwjJnpWhs5d349KzJfZA0OrjfQ+ySPbaXY91WaQaYhed5lo
	 Bfgnl1STduApH4LJrKr3qTVKIF8tIkvf/ISYXZoOOYvSin4LXF61VxpGHqlteLzv5J
	 PBT9HduiZXFew==
Message-ID: <sashiko-outbox-219579@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavel Artemev" <a@pavel.bz>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261117194630.155912-3-a@pavel.bz>
References: <20261117194630.155912-1-a@pavel.bz>
 <20261117194630.155912-3-a@pavel.bz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 20:13:43 +0000
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
- [Medium] ALSA: usb-audio: clearing master cache bit breaks
  mixer_ctl_feature_get()
- [Medium] ALSA: usb-audio: mixer_ctl_feature_put() drops unchanged
  master ownership
- [Medium] ALSA: usb-audio: snd_usb_mixer_flush_pending() loses pending
  state on error
--

commit 44887f9cb8c6632f7e6e12e06a599b842f0a6231
Author: Pavel Artemev <a@pavel.bz>

ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag

This commit introduces QUIRK_FLAG_MIXER_STATE_REPUSH to coalesce feature
unit volume and mute writes into deferred bursts and re-push cached values
on PCM stream open and resume.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221401
Link: https://lore.kernel.org/linux-sound/20261117180728.117915-3-a@pavel.bz

> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index ad96371add1ad..e487ed8dd158d 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
[ ... ]
> @@ -1608,18 +1618,370 @@ static int mixer_ctl_feature_get(struct snd_kcon=
trol *kcontrol,
>  	return 0;
>  }
[ ... ]
> +static void snd_usb_mixer_flush_pending(struct usb_mixer_interface *mixe=
r,
> +					int level)
> +{
[ ... ]
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
> +			if (cval->control =3D=3D UAC_FU_MUTE &&
> +			    level =3D=3D FLUSH_RESUME_STATE) {
> +				bitmap_zero(cval->pending, MAX_CHANNELS + 1);
> +				repush_ctl_cached(cval);
> +				continue;
> +			}
> +			if (!bitmap_empty(cval->pending, MAX_CHANNELS + 1))
> +				flush_ctl_pending(cval);
> +		}
> +	}
> +}

[Severity: Medium]
Does clearing cval->pending before calling repush_ctl_cached() lose
pending writes if snd_usb_set_cur_mix_value() fails?

Unlike flush_ctl_pending(), repush_ctl_cached() only logs an error when a
transfer fails and does not set the bit back in cval->pending.  For a mute
control during FLUSH_RESUME_STATE, a failed write is never retried by a
subsequent FLUSH_TOUCHED or stream-open FLUSH_FULL_STATE because its
pending bit was already cleared.

[ ... ]

> @@ -1632,16 +1994,152 @@ static int mixer_ctl_feature_put(struct snd_kcon=
trol *kcontrol,
>  				return -EINVAL;
>  			val =3D get_abs_value(cval, val);
[ ... ]
> +			for_each_mixer_elem(ml, cval->head.mixer,
> +					    cval->head.id) {
> +				struct usb_mixer_elem_info *m =3D
> +					mixer_elem_list_to_info(ml);
> +				bool was_explicit;
> +
> +				if (!is_feature_volume_mute_ctl(m) ||
> +				    m->control !=3D UAC_FU_VOLUME || m->cmask)
> +					continue;
> +				was_explicit =3D m->master_explicit;
> +				m->master_explicit =3D false;
> +				if (test_and_clear_bit(0, m->pending)) {
> +					/* an unflushed explicit value never
> +					 * reached the device: derive the
> +					 * master instead of writing it
> +					 */
> +					clear_bit(0, m->cached);
> +					re_push =3D true;
> +				} else if (was_explicit && have_ch &&
> +					   test_bit(0, m->cached) &&
> +					   m->cache_val[0] !=3D ch_max) {
> +					/* a flushed explicit value that
> +					 * disagrees with the channels:
> +					 * the device master is stale
> +					 * until something re-derives it
> +					 */
> +					clear_bit(0, m->cached);
> +					re_push =3D true;
> +				}
> +			}

[Severity: Medium]
Can clearing bit 0 of m->cached here break mixer_ctl_feature_get() on the
master control before the next flush completes?

mixer_ctl_feature_get() calls snd_usb_get_cur_mix_value(cval, 0, 0, &val).
While bit 0 of m->cached is clear (during the 30 ms flush window, or for
the entire duration of runtime suspend because snd_usb_mixer_flush_pending()
returns early when MIXER_FLUSH_SUSPENDED is set), reading the master
control either fails with -ENXIO when m->get_cur_broken is set or issues a
USB GET_CUR readback when it is not.  That readback wakes a
runtime-suspended device and re-sets bit 0 of m->cached; if the device
returns m->max while ch_max =3D=3D m->max, snd_usb_mixer_flush_pending() wi=
ll
then hit the raw-max skip and omit writing the derived master.

> +			if (re_push) {
> +				set_bit(MIXER_FLUSH_FULL,
> +					&cval->head.mixer->flush_flags);
> +				mixer_arm_flush(cval->head.mixer);
> +			}
> +		}
>  	} else {
>  		/* master channel */
> +		if (deferred && !test_bit(0, cval->cached)) {
[ ... ]
> +		}
>  		err =3D snd_usb_get_cur_mix_value(cval, 0, 0, &oval);
>  		if (err < 0)
>  			return filter_error(cval, err);
> @@ -1650,9 +2148,25 @@ static int mixer_ctl_feature_put(struct snd_kcontr=
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
> +					if (cval->control =3D=3D UAC_FU_VOLUME)
> +						cval->master_explicit =3D true;
> +					mixer_arm_flush(cval->head.mixer);
> +				}
> +			} else {

[Severity: Medium]
Does gating cval->master_explicit =3D true on val !=3D oval lose master
ownership when an explicit master write matches the pre-flush master cache?

When user space writes a new value to the volume channels while
cval->master_explicit is false, cval->cache_val[0] on the master control
keeps its previous value until snd_usb_mixer_flush_pending() runs.  If user
space then writes that previous value to the master control before the
flush fires (or while the device is runtime-suspended), val =3D=3D oval hol=
ds,
so cval->master_explicit and bit 0 of cval->pending remain unset and the
flush overwrites the master with the derived channel value.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117194630.1559=
12-1-a@pavel.bz?part=3D2
