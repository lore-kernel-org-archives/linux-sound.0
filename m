Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940857;
	b=LCkPBPGjKAXPNUHNyHJAtUxoe5H8W+lpgiI1JZEE1RQ5FgJpHc/M9JzPOJ1zp/embp3d
	 ybpfDOCRR4uaIjeqnZ4GQRhtq/KVh9s/4pBKRzq+VwlFsywtOSA+u+OBzWAEIP36QYT8s
	 xSi9DEgVMunl9NUDNLqkBr9PafbGhrCWEDh+PNgwWBMN8v/OlrK0xa6uwNnOQRwkkXI/4
	 Xdx9Z3OsAQAlKhqPgwdlVUJkZZj9acfk27FqdsvmzI3bO9mkSpYK0b67k2h9moz5lKSFd
	 Jq6VfOX8IkCOsddbglyjaWLvuqMUFhctBP5OaIdDCRAko6QzQqYWhIho7sPE2UPV/zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940857;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DzY4vGqgh1uHN5OD0rmecC+xQQcps8lr/nlzvg7Q/7k=;
	b=Kwje+nBOIRp0EjjW+6pFU574e1bN4FyK0O73IeDZ2sqYA3GOaWOTMjG6hpcRDaQY5fu9
	 MHtZy/a0Ep8N/S5980gCa9BB1pYnfrMVDBxOBq8COJs4DGNiIoPLDNgkM89BOW4013F9v
	 gvycdUK4uIHQ8AhG2iN7sGOdm08Zb5ZOO+6d638TjUXPkoeAsJhM9upKPvuIYu1pQCWYG
	 x+BPxEcYBJ8TYy2CO7fkEawtVVBwVBCdez0IPoE/MvNgM2eY3kE+Vh7deeitrLrRSFgsO
	 1W5//bq2PwoMLVKl0aE3ArqCOv4JbAXHVX2/lKLF+m3z40Tm3kS13aagGs7uhFKbcNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jMX+xbZH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DE0606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 18:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jMX+xbZH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65491F000C5;
	Tue, 17 Nov 2026 18:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940856;
	bh=DzY4vGqgh1uHN5OD0rmecC+xQQcps8lr/nlzvg7Q/7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jMX+xbZH7v0jsOdDuYWidNHfNRKpThxUjk632Ezup/EjuxSEBRFfqItDUg+TvWgyL
	 rcmEZOVlSw7zU05tNj1JYsye/4AMXok/1I/ZKR/lxdS+KnUZfPxf5X9agwNlXFHaxe
	 cKVOeQczWyck7z64X1hJju0VCK2oAvY+f/k6nBG1NSFnmpj9n06kq3OH4CjO52ZNl/
	 wManapQV8izDJ2Ub5ddHOBm8UTytwRBUKCOqhu114nTKkb2jE+vmgF6IxgHE3LWmCF
	 HNwBkFGUtHcPoovB8NelpZ0yJZG2iid+f81FigjZO7rrGNGXLF9gEIHqPDMOAfj20s
	 RORR4X69XtCrg==
Message-ID: <sashiko-outbox-219376@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavel Artemev" <a@pavel.bz>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261117180728.117915-3-a@pavel.bz>
References: <20261117180728.117915-1-a@pavel.bz>
 <20261117180728.117915-3-a@pavel.bz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:40:56 +0000
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
- [Medium] ALSA: usb-audio: unconditional master cache clear in
  mixer_ctl_feature_put()
- [Medium] ALSA: usb-audio: missing master derive on no-op put in
  mixer_ctl_feature_put()
--

commit ea1a41cc4b1413f82eda4163fef6df317f18d1ed
Author: Pavel Artemev <a@pavel.bz>

ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag

This commit adds QUIRK_FLAG_MIXER_STATE_REPUSH to defer Feature Unit volume
and mute control writes into atomic bursts and re-push cached mixer state on
PCM stream open and resume, enabling it for Weltrend/XiiSound (040b:0897)
headsets.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221401
Link: https://lore.kernel.org/linux-sound/20261117143314.41853-3-a@pavel.bz

> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index ad96371add1ad..b0e799149dc07 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c

[ ... ]

> @@ -1608,18 +1618,369 @@ static int mixer_ctl_feature_get(struct snd_kcon=
trol *kcontrol,
>  	return 0;
>  }
> =20

[ ... ]

> +static void snd_usb_mixer_flush_pending(struct usb_mixer_interface *mixe=
r,
> +					int level)
> +{
> +	struct usb_mixer_elem_list *list;
> +	struct usb_mixer_elem_info *cval, *master;
> +	int id, c, idx, max_val;
> +	bool have_ch, touched, master_pending;

[ ... ]

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

[ ... ]

> +		}
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

[Severity: Medium]
Does reclaiming master ownership on a no-op channel write fail to derive and
write the master volume?

When an explicit master put is followed by a per-channel volume write whose
values match the cached channels (oval =3D=3D val), mixer_ctl_feature_put()=
 sets
ch_seen =3D true and clears m->master_explicit, bit 0 of m->pending, and bi=
t 0
of m->cached, but never sets any bit in cval->pending or calls
mixer_arm_flush().  If the explicit master put had already flushed, no flush
is armed to update the hardware master to the derived channel volume.  If t=
he
explicit master put was still pending in the flush window,
snd_usb_mixer_flush_pending() runs at FLUSH_TOUCHED with both master_pending
and touched false, so the (touched || level !=3D FLUSH_TOUCHED) check skips
deriving the master altogether and leaves hardware state stale and bit 0 of
master->cached cleared until a later stream open or resume.

[ ... ]

> @@ -1632,16 +1993,87 @@ static int mixer_ctl_feature_put(struct snd_kcont=
rol *kcontrol,
>  				return -EINVAL;
>  			val =3D get_abs_value(cval, val);
>  			if (oval !=3D val) {

[ ... ]

>  				changed =3D 1;
>  			}
> +			/* any volume-channel write request - unchanged
> +			 * values included - claims master ownership (see
> +			 * below); read-only channels are not user-driven
> +			 */
> +			if (deferred && cval->control =3D=3D UAC_FU_VOLUME &&
> +			    !mixer_ch_readonly(cval, c + 1))
> +				ch_seen =3D true;
>  			cnt++;
>  		}
> +		/* The last writer owns the master: a volume channel
> +		 * write request (the way audio servers drive this unit;
> +		 * alsactl restores channels before the master, so the
> +		 * master put would otherwise own every boot until the
> +		 * first changed gesture) re-claims master derivation.
> +		 * An unflushed explicit master value is dropped along
> +		 * with the ownership: the pending bit is cleared so the
> +		 * flush re-derives the master instead of writing the
> +		 * superseded value, and the cached bit follows it - or
> +		 * the raw-max skip in the flush would mistake the
> +		 * never-written value for device state and swallow
> +		 * every later derive.
> +		 */
> +		if (ch_seen) {
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
> +					clear_bit(0, m->cached);
> +				}
> +			}
> +		}

[Severity: Medium]
Does clearing bit 0 of m->cached unconditionally on every per-channel volume
write break master reads and the raw-maximum re-assert skip when
m->master_explicit was already false?

Because clear_bit(0, m->cached) runs on every channel put (including no-op
writes that do not arm a flush, or before the 30 ms flush fires), any
user-space read of the master control via mixer_ctl_feature_get() ->
snd_usb_get_cur_mix_value() while bit 0 is cleared either fails with -ENXIO
when get_cur_broken is set or issues a USB GET_CUR readback when it is not:

sound/usb/mixer.c:snd_usb_get_cur_mix_value() {
	if (test_bit(channel, cval->cached)) {
		*value =3D cval->cache_val[index];
		return 0;
	}

	/* The current value is always provided by the cache after initialization.=
 */
	if (cval->get_cur_broken)
		return -ENXIO;

	err =3D get_cur_mix_raw(cval, channel, value);
    ...
}

In addition, dropping bit 0 of master->cached when no explicit master
ownership transfer took place forces !test_bit(0, master->cached) to be true
in snd_usb_mixer_flush_pending(), bypassing the max_val !=3D master->max ch=
eck
and re-sending master->max on every channel burst (such as adjusting balance
on the quieter channel while the louder channel remains at master->max) or =
on
the next stream-open re-push after a no-op channel write.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117180728.1179=
15-1-a@pavel.bz?part=3D2
