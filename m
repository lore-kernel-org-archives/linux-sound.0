Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792868812;
	b=c9tnyHZlKamHdVUQ9l5yckEn3SDsPMP3d1Xi6wPHich5xpMzHx/O3gEN05tAxOjY0LYo
	 4OQzTqOTZgontipxWJSDgzlZMt6zWl08Cb0q7kmIjkyNWU57VaVFiQ8RyKCbl+JAFisdm
	 oMemOQJri+KjEYnu13A0/eqJMbQnYp4MeEkOQCThiDBiE0NQfRItNw0GeJAhgXznVUa8z
	 rDavkMAm4Iz2331VIJU+6X2dGg50M5XYuYTdlhPOjBB2nC1KsKkMgzxSYoo8+se3lN16G
	 eWnApaSUvE7ZTYCXYHUYl0WkjY4xyp5GRt6Vn1pimJUAVPVV0hZ4qHf56T+oD3OFImQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792868812;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0z7qqef9RvXV0aSVrgwNSDyOnkqn9wdAk6Z0NbbqkOM=;
	b=SkKQjsMxtkgGYyWbB/7kU///AIgpx2S7LjbqHLRATTa08KwrYe1ungXtjkm4T9AUSf1p
	 EGgt6L+I+FV43Ia099vlfea/7G6Eg7WXN+h9bgIkEY7GAjL1HXpA/uN+ECiGUu7v+blas
	 Rby50fvRShMIZvkKxbRZW+Chhp/ULRXt/jpTRO8Ds8OiJxncYnV9Bxot+BGp3rlVwau5Z
	 +T+L/Vcor9Uc8XjUvLky0z4sbnuWfi8oF2l6Y32CK4MXAe/iK2N5XQUfG5XZl4vwzJifD
	 RPqs6S7LOgjotCkV10iHRh+4xrjFa6l+Zm9utoX5u/2wxY/W072ME0PyUVOQjiY/1OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GUTIGIm9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31135606A31A
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 19:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GUTIGIm9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F34D1F01825;
	Sat, 24 Oct 2026 19:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792868811;
	bh=0z7qqef9RvXV0aSVrgwNSDyOnkqn9wdAk6Z0NbbqkOM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=GUTIGIm9T0ozwcP+Ieaa4dv4bDlKB+pEFIj8UIw/vm0xxKx0t/7s14R93M65MII9V
	 vfHgVvoh6tQMoMd/st3uiO5a3nvCGuKOc2iSORpk4X/ZXpUCOF3mRI3rzFIy3D+no1
	 9kXl41+lOSwRYWNwV59npOFot9MI/VxfttVUZf4uYA8W/wAGa9PWWxyNYFZ7MAxdlM
	 dZHem/Kl872t6ve/9FuEC+7NG0gK02gTVC21kecPnNXbaN1oWlZTKVregjaArCVOo6
	 Ebnwg1q78De7xr9E0Ld/vi/FNczPVaVjWbEmlIT82iZj/7278dVo/uV++58RRB4gPA
	 3LD3Y6B+sqkTg==
Message-ID: <sashiko-outbox-183842@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: hda/conexant: Fix swapped speaker/headphone
 outputs on Huawei MateBook 16s
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xie Youtian" <xiedada@xiedada.net>, linux-sound@vger.kernel.org
In-Reply-To: <20261024184049.107280-1-xiedada@xiedada.net>
References: <20261024184049.107280-1-xiedada@xiedada.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 19:06:51 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] ALSA: hda/conexant: snd_hda_jack_detect() reads stale cached pin s=
ense
- [High] ALSA: hda/conexant: rpl_recheck_work not cancelled in cx_suspend()
- [High] ALSA: hda/conexant: use-after-free via rpl_recheck_work re-arm on =
unbind
- [Medium] ALSA: hda/conexant: rpl_recheck_work queued on deprecated system=
_wq
- [Medium] ALSA: hda/conexant: pin 0x17 setup and EAPD state clobbered in c=
x_init()
--

commit ea041495d0aee419faa09bb80155d129a155625c
Author: Xie Youtian <xiedada@xiedada.net>

ALSA: hda/conexant: Fix swapped speaker/headphone outputs on Huawei MateBoo=
k 16s

This commit adds a fixup for Huawei MateBook 16s (Raptor Lake) machines with
a Conexant SN6140 codec where the speaker amplifier and headphone jack share
the analog output line of pin 0x16. It routes pin 0x16 to the active DAC,
opens the headphone tap via GPIO1, gates the speaker amplifier via pin 0x17
EAPD, and schedules a delayed work to recheck pin sense after 600 ms.

Link: https://github.com/geniusinsanity/huawei-matebook16s-speaker-fix

> diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
> index 9bfdbf5c90325..62a41c764ccbb 100644
> --- a/sound/hda/codecs/conexant.c
> +++ b/sound/hda/codecs/conexant.c

[ ... ]

> @@ -863,6 +868,143 @@ static const struct hda_pintbl cxt_pincfg_sws_js201=
d[] =3D {
>  	{}
>  };
> =20
> +/*
> + * Huawei MateBooks with Raptor Lake and SN6140 (e.g. the MateBook 16s
> + * 2023): the speaker amp and the headphone jack are both fed from the
> + * pin 0x16 line.  The speaker amp is gated by the EAPD of pin 0x17, the
> + * jack tap by GPIO1 - none of which matches the BIOS pin config.  Point
> + * pin 0x16 at the DAC the parser leaves unmuted for the current jack
> + * state, keep the tap open, and gate the speaker amp via EAPD.
> + */
> +static void cxt_matebook_raptor_lake_coerce(struct hda_codec *codec, boo=
l hp)
> +{
> +	snd_hda_codec_write_cache(codec, 0x16, 0,
> +				  AC_VERB_SET_CONNECT_SEL, hp ? 0x0 : 0x1);
> +	snd_hda_codec_write_cache(codec, 0x17, 0,
> +				  AC_VERB_SET_EAPD_BTLENABLE, hp ? 0x0 : 0x2);
> +	/* keep the jack tap on the shared line open; with the speaker amp
> +	 * gated separately this is correct in both jack states
> +	 */
> +	snd_hda_codec_write_cache(codec, 0x01, 0,
> +				  AC_VERB_SET_GPIO_MASK, 0x02);
> +	snd_hda_codec_write_cache(codec, 0x01, 0,
> +				  AC_VERB_SET_GPIO_DIRECTION, 0x02);
> +	snd_hda_codec_write_cache(codec, 0x01, 0,
> +				  AC_VERB_SET_GPIO_DATA, 0x00);
> +}
> +
> +/* jack presence right at a plug event bounces for a few milliseconds;
> + * sample it once, debounced, and use that one value everywhere below
> + */
> +static bool cxt_matebook_raptor_lake_jack_present(struct hda_codec *code=
c)
> +{
> +	bool a =3D snd_hda_jack_detect(codec, 0x16);
> +
> +	if (snd_hda_jack_detect(codec, 0x16) !=3D a) {
> +		msleep(100);
> +		return snd_hda_jack_detect(codec, 0x16);
> +	}
> +	return a;
> +}
> +
> +static void cxt_matebook_raptor_lake_apply(struct hda_codec *codec, bool=
 hp)
> +{
> +	struct conexant_spec *spec =3D codec->spec;
> +
> +	spec->gen.hp_jack_present =3D hp;
> +	snd_hda_gen_update_outputs(codec);
> +	cxt_matebook_raptor_lake_coerce(codec, hp);
> +}
> +
> +/*
> + * Right after the codec powers back up every reader of the pin sense -
> + * ours and the parser's alike - can see garbage.  Re-apply everything
> + * from a settled read a bit later, which heals any misguess made at
> + * init or during a jack event.
> + */
> +static void cxt_matebook_raptor_lake_recheck(struct work_struct *work)
> +{
> +	struct conexant_spec *spec =3D container_of(work, struct conexant_spec,
> +						  rpl_recheck_work.work);
> +	struct hda_codec *codec =3D spec->rpl_recheck_codec;
> +
> +	if (codec) {
> +		bool hp =3D snd_hda_jack_detect(codec, 0x16);
> +
> +		codec_dbg(codec, "matebook-rpl: recheck hp=3D%d\n", hp);
> +		cxt_matebook_raptor_lake_apply(codec, hp);
> +	}
> +}

[Severity: High]
Will snd_hda_jack_detect(codec, 0x16) actually query the hardware on the
second call in cxt_matebook_raptor_lake_jack_present() or when
cxt_matebook_raptor_lake_recheck() runs 600 ms later?

Pin 0x16 is registered in codec->jacktbl during
snd_hda_gen_parse_auto_config() -> check_auto_mute_availability() and via
snd_hda_jack_detect_enable_callback(). When snd_hda_jack_detect() calls
snd_hda_jack_detect_mst() -> snd_hda_jack_detect_state_mst() ->
snd_hda_jack_pin_sense(), it updates the cached state through
jack_detect_update():

sound/hda/common/jack.c:jack_detect_update() {
	if (!jack->jack_dirty)
		return;
	...
	jack->pin_sense =3D read_pin_sense(codec, jack->nid,
					 jack->dev_id);
	...
	jack->jack_dirty =3D 0;
}

In cxt_matebook_raptor_lake_jack_present(), the first call to
snd_hda_jack_detect(codec, 0x16) clears jack->jack_dirty to 0 (or finds it
already 0 when called via snd_hda_gen_hp_automute() -> detect_jacks() ->
call_update_outputs()). The subsequent call in the condition:

	if (snd_hda_jack_detect(codec, 0x16) !=3D a)

sees jack->jack_dirty =3D=3D 0, skips read_pin_sense(), and returns the cac=
hed
jack->pin_sense equal to a, making the msleep(100) debounce branch
unreachable.

Similarly, when cxt_matebook_raptor_lake_recheck() executes 600 ms after
HDA_FIXUP_ACT_INIT, cxt_matebook_raptor_lake_update_outputs(), or
cxt_matebook_raptor_lake_jack_event(), jack->jack_dirty is still 0 from the
earlier read. Calling snd_hda_jack_detect(codec, 0x16) without setting
jack->jack_dirty =3D 1 (or reading pin sense directly and calling
snd_hda_jack_report_sync()) returns the 600 ms-old cached pin_sense without
issuing AC_VERB_GET_PIN_SENSE to the codec, and never notifies userspace ja=
ck
controls if the settled state changed.

Also, since pin 0x16 already has call_hp_automute registered on its callback
list by check_auto_mute_availability(), registering
cxt_matebook_raptor_lake_jack_event on pin 0x16 causes each unsolicited eve=
nt
to run both callbacks back-to-back, applying the verbs and rescheduling
rpl_recheck_work twice per event.

> +
> +/* the parser reprograms pin 0x17 and the DAC amps on jack events; the
> + * recheck heals a stale presence sample taken while the contact still
> + * bounces
> + */
> +static void cxt_matebook_raptor_lake_update_outputs(struct hda_codec *co=
dec)
> +{
> +	struct conexant_spec *spec =3D codec->spec;
> +	bool hp =3D cxt_matebook_raptor_lake_jack_present(codec);
> +
> +	codec_dbg(codec, "matebook-rpl: hook hp=3D%d\n", hp);
> +	cxt_matebook_raptor_lake_apply(codec, hp);
> +	mod_delayed_work(system_wq, &spec->rpl_recheck_work,
> +			  msecs_to_jiffies(600));
> +}
> +
> +/* our own jack callback: the unsol -> automute_hook chain is
> + * unreliable on this machine (stays silent while a stream keeps the
> + * codec awake); apply immediately and keep the delayed recheck as the
> + * safety net for anything the debounced sample got wrong
> + */
> +static void cxt_matebook_raptor_lake_jack_event(struct hda_codec *codec,
> +					       struct hda_jack_callback *jack)
> +{
> +	struct conexant_spec *spec =3D codec->spec;
> +	bool hp =3D cxt_matebook_raptor_lake_jack_present(codec);
> +
> +	codec_dbg(codec, "matebook-rpl: jack event\n");
> +	cxt_matebook_raptor_lake_apply(codec, hp);
> +	mod_delayed_work(system_wq, &spec->rpl_recheck_work,
> +			  msecs_to_jiffies(600));
> +}

[Severity: Medium]
Does queueing spec->rpl_recheck_work onto system_wq here trigger a runtime
deprecation warning and mix two different workqueues for the same work item?

In kernel/workqueue.c:__queue_work():

	if (unlikely(wq->flags & __WQ_DEPRECATED))
		pr_warn_once("workqueue: work func %ps enqueued on deprecated workqueue. "
			"Use system_{percpu|dfl}_wq instead.\n",
			work->func);

Because system_wq is allocated with __WQ_DEPRECATED, calling
mod_delayed_work(system_wq, &spec->rpl_recheck_work, ...) triggers this
warning when the timer expires.

In addition, HDA_FIXUP_ACT_INIT below uses schedule_delayed_work(), which
queues onto system_percpu_wq rather than system_wq. Mixing two distinct
workqueue_struct instances for spec->rpl_recheck_work breaks workqueue
non-reentrancy in __queue_work() (which checks worker->current_pwq->wq =3D=
=3D wq),
allowing cxt_matebook_raptor_lake_recheck() to execute concurrently on two
CPUs if re-queued while sleeping on HDA verb I/O. Should these callers use
mod_delayed_work(system_percpu_wq, ...) or schedule_delayed_work()
consistently?

> +
> +static void cxt_fixup_matebook_raptor_lake(struct hda_codec *codec,
> +				  const struct hda_fixup *fix, int action)
> +{
> +	struct conexant_spec *spec =3D codec->spec;
> +
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		spec->gen.automute_hook =3D cxt_matebook_raptor_lake_update_outputs;
> +		INIT_DELAYED_WORK(&spec->rpl_recheck_work,
> +				  cxt_matebook_raptor_lake_recheck);
> +		spec->rpl_recheck_codec =3D codec;
> +		/* pin 0x17 drives the tap line; enabled once, like the
> +		 * Windows driver does
> +		 */
> +		snd_hda_codec_write_cache(codec, 0x17, 0,
> +					  AC_VERB_SET_CONNECT_SEL, 0x0);
> +		snd_hda_codec_write_cache(codec, 0x17, 0,
> +					  AC_VERB_SET_PIN_WIDGET_CONTROL,
> +					  0x40);
> +		break;

[Severity: Medium]
Aren't the pin 0x17 settings written in HDA_FIXUP_ACT_PRE_PROBE overwritten
during snd_hda_gen_init(), and doesn't cx_init() clobber pin 0x17's EAPD
state?

Because HDA_FIXUP_ACT_PRE_PROBE runs in cx_probe() before
snd_hda_gen_parse_auto_config() and cx_init() -> snd_hda_gen_init(), the
generic parser's init_extra_out() -> set_output_and_unmute() ->
snd_hda_activate_path() overwrites pin 0x17 AC_VERB_SET_CONNECT_SEL to 0x1
(DAC 0x11), and snd_hda_gen_update_outputs() -> do_automute() overwrites pin
0x17 AC_VERB_SET_PIN_WIDGET_CONTROL to 0x0 whenever headphones are present =
or
master_mute is active. (The comment here also says pin 0x17 drives the tap
line, whereas the commit description and top comment state pin 0x16 drives
the shared line.)

Furthermore, cx_probe() calls cx_auto_parse_eapd(), which adds pin 0x17 to
spec->eapds[]. During cx_init() (on probe and every resume):

sound/hda/codecs/conexant.c:cx_init() {
	struct conexant_spec *spec =3D codec->spec;
	snd_hda_gen_init(codec);
	if (!spec->dynamic_eapd)
		cx_auto_turn_eapd(codec, spec->num_eapds, spec->eapds, true);

	cxt_init_gpio_led(codec);
	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_INIT);
}

When !spec->dynamic_eapd, cx_auto_turn_eapd() sends an uncached
AC_VERB_SET_EAPD_BTLENABLE =3D 0x02 to pin 0x17 after snd_hda_gen_init() has
already unmuted DAC 0x10 on pin 0x16 for headphones, transiently enabling t=
he
speaker amplifier until HDA_FIXUP_ACT_INIT turns it back off. If
spec->dynamic_eapd is set, cx_auto_vmaster_hook() turns pin 0x17 EAPD on
whenever Master Playback Switch is unmuted, enabling the speaker amplifier
even while headphones are plugged in.

> +	case HDA_FIXUP_ACT_INIT:
> +		/* the parser's own view is the best guess at init; the
> +		 * delayed recheck above heals whatever it gets wrong
> +		 */
> +		snd_hda_jack_detect_enable_callback(codec, 0x16,
> +						    cxt_matebook_raptor_lake_jack_event);
> +		cxt_matebook_raptor_lake_apply(codec, spec->gen.hp_jack_present);
> +		schedule_delayed_work(&spec->rpl_recheck_work,
> +				      msecs_to_jiffies(600));
> +		break;
> +	case HDA_FIXUP_ACT_FREE:
> +		cancel_delayed_work_sync(&spec->rpl_recheck_work);
> +		spec->rpl_recheck_codec =3D NULL;
> +		break;
> +	}
> +}

[Severity: High]
What happens if the codec suspends or shuts down while spec->rpl_recheck_wo=
rk
is pending?

spec->rpl_recheck_work is armed for 600 ms in HDA_FIXUP_ACT_INIT,
cxt_matebook_raptor_lake_update_outputs(), and
cxt_matebook_raptor_lake_jack_event(), but it is never cancelled in
cx_suspend() or cx_auto_shutdown() ( and in cx_remove(), cx_auto_shutdown()
runs before snd_hda_gen_remove() invokes HDA_FIXUP_ACT_FREE):

sound/hda/common/codec.c:hda_call_codec_suspend() {
	snd_hdac_enter_pm(&codec->core);
	if (driver->ops->suspend)
		driver->ops->suspend(codec);
	if (!codec->no_stream_clean_at_suspend)
		hda_cleanup_all_streams(codec);
	state =3D hda_set_power_state(codec, AC_PWRST_D3);
	update_power_acct(codec, true);
	snd_hdac_leave_pm(&codec->core);
	return state;
}

If spec->rpl_recheck_work fires while hda_call_codec_suspend() is running
(for example, during the depop_delay sleep in hda_set_power_state() after
cx_auto_shutdown() has cleared EAPD on pin 0x17), snd_hdac_keep_power_up()
sees codec->core.in_pm > 0 and allows cxt_matebook_raptor_lake_coerce() to
write AC_VERB_SET_EAPD_BTLENABLE =3D 0x2 to pin 0x17, re-enabling the speak=
er
amplifier as the codec enters D3.

If spec->rpl_recheck_work fires after runtime suspend completes,
snd_hda_codec_write_cache() triggers snd_hdac_power_up_pm(), forcing an
immediate runtime resume that runs cx_init() -> HDA_FIXUP_ACT_INIT and
re-schedules spec->rpl_recheck_work for another 600 ms. And if it fires dur=
ing
system suspend or shutdown after runtime PM is disabled,
pm_runtime_get_if_active() returns -EINVAL (which snd_hdac_keep_power_up()
treats as 0), issuing raw HDA verbs while the codec is in D3.

Additionally, can spec->rpl_recheck_work be re-armed after
cancel_delayed_work_sync() during driver unbind, causing a use-after-free on
struct conexant_spec?

In sound/hda/common/bind.c:hda_codec_driver_remove():

	if (driver->ops->remove)
		driver->ops->remove(codec);
	snd_hda_codec_cleanup_for_unbind(codec);

driver->ops->remove(codec) calls cx_remove() -> snd_hda_gen_remove(), which
invokes HDA_FIXUP_ACT_FREE and immediately calls kfree(codec->spec). Howeve=
r,
codec->jackpoll_work, bus->unsol_work, mixer controls (such as
automute_mode_put()), and codec->jacktbl callbacks are not stopped or freed
until snd_hda_codec_cleanup_for_unbind(codec) runs afterward.

If cxt_matebook_raptor_lake_jack_event() (which can sleep for 100 ms in
cxt_matebook_raptor_lake_jack_present()) or
cxt_matebook_raptor_lake_update_outputs() is running concurrently during
cx_remove(), it can call mod_delayed_work() after cancel_delayed_work_sync()
has returned, re-queueing spec->rpl_recheck_work on the freed
struct conexant_spec (or dereferencing codec->spec after it is set to NULL).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024184049.1072=
80-1-xiedada@xiedada.net?part=3D1
