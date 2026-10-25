Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792907880;
	b=avTw02rPPuBlWiyVHGYQ9JIovF2cyz86drxqvAUZnu/apwMEcpOQwvZn6F9tX5aQuvgg
	 WKmeMTlMz0pDptqKyqU6EIpESmZu8QhYEGTUgVZUixuZxcqExXujTZmsnY+IYLAltRo98
	 QIyzZMO1I4EXQ6uyPYDGwAEKzUeDBSh2tpg3JDREb9H+KlTfUI/dbte4SW1FwanFl1Wsf
	 9bwT2LZZ8zDjQSHIb95ICV6P0CSSHegn+Cur8O2cHHBkQ5of2p6dKrY462pT9aWKO/R1z
	 q4tSM8yZ9P2lZ+v0gSANjrOxGucuOIRc9XlnxNV7Nz16OdtJk/ZBkxVfgPCgfgWm5wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792907880;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=USah7/F0Ym2js9ZakFnJtS9TnqpAg75hz1Bypo5yBjM=;
	b=yINCN4ebZO6mSqoR450tme0SOCW+H87Zgj53PhaSgZLcCpvuyvCmEwirMVn0ZvbVguGo
	 CLkIGvdGJaGhbEcNPNtvgYUIgkH38ELEuBHMQkGt7qk9GArWNXZTzdlwAh6m5KVG84nxg
	 R4exd1SWdZNoZZ5HbbeBlKBL1OrKN5V8Nn0svICiOmrSNHUv41k+xAUY2wTeeuVqYVm0W
	 LFYaPjDSRD8U4xPfIGyXUKGXkxGcYIeipfuN+XpxCxIFvwzNyHT5OeLgYRG7in4QPPqIB
	 +N9sAvgEYeBHcnjaFtyWCCrhf6Efj/RHEhS+dC+QAQQiaA0dI7l6hRg8dQpK5dWl0sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aiwc0rO8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34249606A31A
	for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 05:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aiwc0rO8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E204C1F01825;
	Sun, 25 Oct 2026 05:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792907880;
	bh=USah7/F0Ym2js9ZakFnJtS9TnqpAg75hz1Bypo5yBjM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=aiwc0rO8+2T4PC7QDPMitGHODfWzxoRoa9gSADvBVOapz5iVPHoXA/EhF+eCqT2SQ
	 zPrc8bxfuB7gChIcLsQq0D+4cExvxvBALQklg/XMjI9VmVZJlkVTHTW1BzJ+wS4kHc
	 gJXxw+/fqBMJkaQzc4/6aC5QUWtJfsV58mtIQ/dCZkBPAqu8sp2d4xjN8zVvcHI8J7
	 uJiTx5gMbxelAtIxXoCiyOqeEQrKZYsYiCrM+nbh/mmYWUquu23vsXU6qZ+lxtGRnV
	 8Rt5h9wpB3zkiAJ8FOuE9Isx0wHEI/bLzflMLjuWLtJQZ68WlfR63GDHW8huRM8TAi
	 UH/yjBfmHJylg==
Message-ID: <sashiko-outbox-184090@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ALSA: hda/conexant: Fix swapped speaker/headphone
 outputs on Huawei MateBook 16s
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xie Youtian" <xiedada@xiedada.net>, linux-sound@vger.kernel.org
In-Reply-To: <20261025054111.31392-1-xiedada@xiedada.net>
References: <20261025054111.31392-1-xiedada@xiedada.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 05:57:59 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] ALSA: hda/conexant: teardown and suspend race in MateBook RPL =
jack callbacks
- [High] ALSA: hda/conexant: uninitialized work cancel in cx_suspend() and =
cx_remove()
- [High] ALSA: hda/conexant: deadlock in cx_suspend() cancelling rpl_rechec=
k_work
- [Medium] ALSA: hda/conexant: stale jack state in cxt_matebook_raptor_lake=
_recheck()
--

commit 50725697e44e0b95fb93bf300a4dfcc83b2c212c
Author: Xie Youtian <xiedada@xiedada.net>

ALSA: hda/conexant: Fix swapped speaker/headphone outputs on Huawei MateBoo=
k 16s

This commit adds a fixup for Huawei MateBook 16s (Raptor Lake) models with a
Conexant SN6140 codec to route the shared pin 0x16 output line to the active
DAC, enable the headphone jack tap via GPIO1, and gate the speaker amplifier
via pin 0x17 EAPD using a debounced jack callback and a 600 ms delayed
recheck work item.

Link: https://github.com/geniusinsanity/huawei-matebook16s-speaker-fix

> diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
> index 9bfdbf5c90325..7926fdd711310 100644
> --- a/sound/hda/codecs/conexant.c
> +++ b/sound/hda/codecs/conexant.c
> @@ -43,6 +43,10 @@ struct conexant_spec {
>  	unsigned int gpio_mute_led_mask;
>  	unsigned int gpio_mic_led_mask;
>  	bool is_cx11880_sn6140;
> +
> +	/* quirk for Huawei MateBooks with Raptor Lake */
> +	struct hda_codec *rpl_recheck_codec;
> +	struct delayed_work rpl_recheck_work;
>  };
> =20
> =20
> @@ -203,6 +207,11 @@ static void cx_auto_shutdown(struct hda_codec *codec)
> =20
>  static void cx_remove(struct hda_codec *codec)
>  {
> +	struct conexant_spec *spec =3D codec->spec;
> +
> +	/* stop the quirk recheck before the spec is freed below */
> +	spec->rpl_recheck_codec =3D NULL;
> +	cancel_delayed_work_sync(&spec->rpl_recheck_work);
>  	cx_auto_shutdown(codec);
>  	snd_hda_gen_remove(codec);
>  }

[Severity: High]
Will calling cancel_delayed_work_sync(&spec->rpl_recheck_work) unconditiona=
lly
in cx_remove() and cx_suspend() trigger a warning on all other Conexant
codecs?

In cx_probe(), struct conexant_spec is allocated with kzalloc_obj(*spec),
leaving spec->rpl_recheck_work zero-initialized. INIT_DELAYED_WORK() is only
called inside cxt_fixup_matebook_raptor_lake() under HDA_FIXUP_ACT_PRE_PROB=
E:

sound/hda/codecs/conexant.c:cxt_fixup_matebook_raptor_lake() {
	switch (action) {
	case HDA_FIXUP_ACT_PRE_PROBE:
		spec->gen.automute_hook =3D cxt_matebook_raptor_lake_update_outputs;
		INIT_DELAYED_WORK(&spec->rpl_recheck_work,
				  cxt_matebook_raptor_lake_recheck);
		spec->rpl_recheck_codec =3D codec;
		break;

When any Conexant device not matching CXT_FIXUP_HUAWEI_MATEBOOK_RPL suspends
via cx_suspend() or unbinds via cx_remove() (or if cx_probe() fails before
HDA_FIXUP_ACT_PRE_PROBE and jumps to error: -> cx_remove()),
cancel_delayed_work_sync(&spec->rpl_recheck_work) is called on a zeroed
delayed_work, hitting WARN_ON(!work->func) in __flush_work() and timer
debug-object warnings in __timer_delete().

> @@ -270,6 +279,9 @@ static void cx_set_power_state(struct hda_codec *code=
c, hda_nid_t fg,
> =20
>  static int cx_suspend(struct hda_codec *codec)
>  {
> +	struct conexant_spec *spec =3D codec->spec;
> +
> +	cancel_delayed_work_sync(&spec->rpl_recheck_work);
>  	cx_auto_shutdown(codec);
>  	return 0;
>  }

[Severity: High]
Can cancelling spec->rpl_recheck_work synchronously inside cx_suspend()
deadlock against cxt_matebook_raptor_lake_recheck()?

When the codec enters runtime suspend, rpm_suspend() sets
dev->power.runtime_status =3D RPM_SUSPENDING and calls
hda_codec_runtime_suspend() -> hda_call_codec_suspend():

sound/hda/common/codec.c:hda_call_codec_suspend() {
	...
	snd_hdac_enter_pm(&codec->core);
	if (driver->ops->suspend)
		driver->ops->suspend(codec);

If cxt_matebook_raptor_lake_recheck() starts running on system_percpu_wq and
executes an HDA verb via cxt_matebook_raptor_lake_sense() ->
snd_hda_codec_read() -> snd_hdac_power_up_pm(&codec->core) before
snd_hdac_enter_pm() increments codec->core.in_pm, atomic_inc_not_zero()
returns false and snd_hdac_power_up_pm() calls snd_hdac_power_up() ->
pm_runtime_get_sync() -> rpm_resume().

In rpm_resume(), because dev->power.runtime_status is RPM_SUSPENDING, the
workqueue thread sleeps uninterruptibly on dev->power.wait_queue waiting for
rpm_suspend() to finish, while the suspending thread blocks in cx_suspend()=
 ->
cancel_delayed_work_sync(&spec->rpl_recheck_work) waiting for
cxt_matebook_raptor_lake_recheck() to finish.

In addition, because cx_probe() sets codec->bus->allow_bus_reset =3D 1, a v=
erb
timeout inside cxt_matebook_raptor_lake_recheck() can trigger
codec_exec_verb() -> snd_hda_bus_reset() -> snd_hda_bus_reset_codecs() ->
hda_call_codec_suspend() -> cx_suspend() ->
cancel_delayed_work_sync(&spec->rpl_recheck_work) from within the work
callback itself.

[ ... ]

> @@ -863,6 +876,159 @@ static const struct hda_pintbl cxt_pincfg_sws_js201=
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
> +	/* the tap path needs pin 0x17 selected and driving, whatever the
> +	 * parser does to what it thinks is a speaker pin
> +	 */
> +	snd_hda_codec_write_cache(codec, 0x17, 0,
> +				  AC_VERB_SET_CONNECT_SEL, 0x0);
> +	snd_hda_codec_write_cache(codec, 0x17, 0,
> +				  AC_VERB_SET_PIN_WIDGET_CONTROL, 0x40);
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
> +/* read the pin sense directly: snd_hda_jack_detect() returns the
> + * cached state, which is exactly what a bounce-healing re-read must
> + * not trust
> + */
> +static bool cxt_matebook_raptor_lake_sense(struct hda_codec *codec)
> +{
> +	return !!(snd_hda_codec_read(codec, 0x16, 0,
> +				     AC_VERB_GET_PIN_SENSE, 0) &
> +		  AC_PINSENSE_PRESENCE);
> +}
> +
> +/* jack presence right at a plug event bounces for a few milliseconds;
> + * sample it once, debounced, and use that one value everywhere below
> + */
> +static bool cxt_matebook_raptor_lake_jack_present(struct hda_codec *code=
c)
> +{
> +	bool a =3D cxt_matebook_raptor_lake_sense(codec);
> +
> +	if (cxt_matebook_raptor_lake_sense(codec) !=3D a) {
> +		msleep(100);
> +		return cxt_matebook_raptor_lake_sense(codec);
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
> +		bool hp =3D cxt_matebook_raptor_lake_sense(codec);
> +
> +		codec_dbg(codec, "matebook-rpl: recheck hp=3D%d\n", hp);
> +		cxt_matebook_raptor_lake_apply(codec, hp);
> +	}
> +}

[Severity: Medium]
When cxt_matebook_raptor_lake_recheck() heals a stale initial pin-sense read
after 600 ms, does codec->jacktbl and the userspace jack state remain stuck=
 at
the old value?

During codec resume in hda_call_codec_resume() or an unsolicited event in
snd_hda_jack_unsol_event(), snd_hda_jack_report_sync(codec) runs immediatel=
y,
caching the initial (potentially stale or bouncing) pin 0x16 sense in
jack->pin_sense, clearing jack->jack_dirty, and reporting that state to
userspace.

When cxt_matebook_raptor_lake_recheck() runs 600 ms later, it reads the
settled state via cxt_matebook_raptor_lake_sense() and updates hardware
routing via cxt_matebook_raptor_lake_apply(codec, hp), but never marks the
jacktbl entry dirty or calls snd_hda_jack_report_sync(codec). If the initial
read was wrong, won't userspace audio servers (such as PipeWire or PulseAud=
io)
still see the stale Headphone Jack control state and keep the active DAC pa=
th
muted?

> +
> +/* the parser reprograms pin 0x17 and the DAC amps on jack events; the
> + * recheck heals a stale presence sample taken while the contact still
> + * bounces
> + */
> +static void cxt_matebook_raptor_lake_update_outputs(struct hda_codec *co=
dec)
> +{
> +	struct conexant_spec *spec =3D codec->spec;
> +	bool hp;
> +
> +	if (!spec->rpl_recheck_codec)
> +		return;
> +	hp =3D cxt_matebook_raptor_lake_jack_present(codec);
> +	codec_dbg(codec, "matebook-rpl: hook hp=3D%d\n", hp);
> +	cxt_matebook_raptor_lake_apply(codec, hp);
> +	mod_delayed_work(system_percpu_wq, &spec->rpl_recheck_work,
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
> +	bool hp;
> +
> +	if (!spec->rpl_recheck_codec)
> +		return;
> +	hp =3D cxt_matebook_raptor_lake_jack_present(codec);
> +	codec_dbg(codec, "matebook-rpl: jack event\n");
> +	cxt_matebook_raptor_lake_apply(codec, hp);
> +	mod_delayed_work(system_percpu_wq, &spec->rpl_recheck_work,
> +			  msecs_to_jiffies(600));
> +}

[Severity: Critical]
What prevents cxt_matebook_raptor_lake_update_outputs() or
cxt_matebook_raptor_lake_jack_event() from racing with cx_remove() or
cx_suspend() while sleeping in cxt_matebook_raptor_lake_jack_present()?

Both callbacks check spec->rpl_recheck_codec without holding a lock and then
call cxt_matebook_raptor_lake_jack_present(codec), which performs HDA bus
reads and calls msleep(100) when the pin sense bounces.

In hda_codec_driver_remove(), driver->ops->remove(codec) (cx_remove()) is
called before snd_hda_codec_cleanup_for_unbind() removes ALSA controls,
cancels codec->jackpoll_work, or frees jack callbacks, and bus->unsol_work =
is
not flushed before cx_remove() runs:

CPU0                                    CPU1
cxt_matebook_raptor_lake_jack_event()
  if (!spec->rpl_recheck_codec)
  cxt_matebook_raptor_lake_jack_present()
    msleep(100);
                                        cx_remove()
                                          spec->rpl_recheck_codec =3D NULL;
                                          cancel_delayed_work_sync(&spec->r=
pl_recheck_work);
                                          cx_auto_shutdown(codec);
                                          snd_hda_gen_remove(codec)
                                            kfree(codec->spec);
                                            codec->spec =3D NULL;
  cxt_matebook_raptor_lake_apply(codec, hp)
    spec =3D codec->spec; /* NULL */
    spec->gen.hp_jack_present =3D hp;
  mod_delayed_work(..., &spec->rpl_recheck_work, ...); /* UAF on freed spec=
 */

Furthermore, if either callback is invoked after snd_hda_gen_remove() sets
codec->spec =3D NULL and before snd_hda_codec_cleanup_for_unbind() complete=
s,
dereferencing spec->rpl_recheck_codec at the start of the callback will
immediately dereference a NULL spec pointer.

Similarly, in cx_suspend(), spec->rpl_recheck_codec is not cleared and
in-flight callbacks are not synchronized, so a callback sleeping in
msleep(100) can finish after cx_suspend(), re-enabling pin 0x17 EAPD after
cx_auto_shutdown() and re-arming spec->rpl_recheck_work after
cancel_delayed_work_sync().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025054111.3139=
2-1-xiedada@xiedada.net?part=3D1
