Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108718;
	b=StUKxQLZS4Vty+jki8ZxLyc1wXioXlmJma9hnC6KN3iQcuYcUkvjO+eCui/lue3mi0Yc
	 EVMucarAlAAAaro9SpOMaTdhZkmN/8pmUazN6706Mcizj7gbkGWSy/8Usn00wb4v0oMpz
	 4zliiUf7mzTqM6m9osKgTFUDgi1+iDmTbC4oN5aUxmSLINOYYYRLHPWyXeBy2OngpSXFi
	 l1gQgNCU48L1lFjfm2XmxtvDbf3Dufd1bqjTrn1CtaCyh9KBGuQHRuJwfoRVNkOnN6HjE
	 OU918sptpxMqPfYf68x7iwdqj4vQNZ3L81sAMMaCd/ZuwYkXFs331RC7oQ74TCkUaKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108718;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Kybw3JSujO8cHL+CUIOdkSBAFUTlHuhhIlypYoNkhP4=;
	b=WEfw7Q5lK7CsiwsZqgIvdUh9lGVTfktO7cRr+wx80JhuWHnTUtUmmSTvDqJhWUT2tmdI
	 a+WYB+3uX3vzZOzIsgN36LFneNXwCcuuSmQ4EsqJrhXh4hIGwCJ3e8xBStvti075PHuhI
	 xcX3fnaPPCVoEZzarIwbM6xnrHqHUDuQZ3e+f/N8AMEm019GLa1dfFO3PhjDNy1yJ2JMV
	 e/5D3iL1IcWtvh/bPAyfd08LDZk5wDBpvKOe2B7H6hXuy3q3PWyy8gHokIQQYl8yJpQnD
	 DsWBrsy8SCrlXkU7dwmwdbbLCBv4PwUyzOLV4BnvSXub7osclKRVTph4C8gNBXre3gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b24++BMt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FD5606A329
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 13:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b24++BMt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356EF1F01825;
	Tue, 27 Oct 2026 13:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793108717;
	bh=Kybw3JSujO8cHL+CUIOdkSBAFUTlHuhhIlypYoNkhP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b24++BMtZMro4o4mBAxDH5lziFTD/j7iApYQWTnumg8tZWvnfMHZgLtbTuTxTvhOQ
	 zvU1KxDnBmfcEDdiKTzoocWFepXze4X5EcqB3b53Fc7Ajy0OtJOZ9Wuxj4A8F6hFXb
	 2/cwLCLy69cRRZ6bEbeRNf2bbH9S7Kt7zNTOdz/roHB1/zeI9Y9Kvs8MEu1meOBWwj
	 wkF+ozjk4tPMyHcWVt5wRk0iypwuJvw/U9/5Rb63wMjWDvnBtt9nZRoQzsUUIIVjsp
	 xNTZNuE2gk/MUzP2+z9epPX2BJ6HfeNrpUUS7ATbcQrF52p9N8ZKfyrg6I+Nyd1npI
	 MMVXmLmuXrPRA==
Message-ID: <sashiko-outbox-186664@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] ASoC: hdac_hda: Fix codec runtime PM across
 remove and probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261027125448.11018-4-peter.ujfalusi@linux.intel.com>
References: <20261027125448.11018-1-peter.ujfalusi@linux.intel.com>
 <20261027125448.11018-4-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 13:45:16 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ASoC: hdac_hda: desynchronized runtime PM and link power across un=
bind
- [High] ASoC: hdac_hda: incomplete cleanup on hdac_hda_codec_probe() error=
 paths
--

commit 96608fa793f58585604bebad10178e1f2248d765
Author: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

ASoC: hdac_hda: Fix codec runtime PM across remove and probe

This commit balances runtime PM disable and enable calls in
hdac_hda_codec_remove() and calls pm_runtime_set_active() in
hdac_hda_codec_probe() so that the codec runtime PM status reflects its
powered state after unbind and rebind.

> diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
> index cae5711e979c3..fe5796cad1fff 100644
> --- a/sound/soc/codecs/hdac_hda.c
> +++ b/sound/soc/codecs/hdac_hda.c
> @@ -435,6 +435,13 @@ static int hdac_hda_codec_probe(struct snd_soc_compo=
nent *component)
>  		goto error_no_pm;
>  	}
> =20
> +	/* The codec is in D0, the status is RPM_SUSPENDED after a previous unb=
ind */
> +	ret =3D pm_runtime_set_active(&hdev->dev);
> +	if (ret < 0) {
> +		dev_err(&hdev->dev, "%s: failed to set runtime PM active %d\n", __func=
__, ret);
> +		goto error_no_pm;
> +	}

[Severity: High]
If hdac_hda_codec_probe() fails after pm_runtime_set_active(&hdev->dev)
succeeds, can this leak the parent controller runtime PM child_count and
leave the codec runtime PM state inconsistent?

In sound/soc/codecs/hdac_hda.c:hdac_hda_codec_probe(), after a previous
unbind left runtime PM disabled and suspended, pm_runtime_set_active()
marks &hdev->dev active and increments parent->power.child_count. If a
subsequent step fails (such as request_firmware(), snd_hda_load_patch(),
snd_hda_codec_set_name(), snd_hdac_regmap_init(), driver->ops->probe(),
snd_hda_codec_parse_pcms(), or snd_hda_codec_build_controls()), control
jumps to the error labels at the bottom of hdac_hda_codec_probe():

sound/soc/codecs/hdac_hda.c:hdac_hda_codec_probe() {
	...
error_patch:
	if (driver->ops->remove)
		driver->ops->remove(hcodec);
error_regmap:
	snd_hdac_regmap_exit(hdev);
error_pm:
	pm_runtime_put(&hdev->dev);
error_no_pm:
	snd_hdac_ext_bus_link_put(hdev->bus, hlink);
	return ret;
}

Because hdac_hda_codec_probe() returns an error, snd_soc_component_probe()
does not mark the component as probed and hdac_hda_codec_remove() is never
called. None of the error paths call pm_runtime_set_suspended(&hdev->dev),
undo the pm_runtime_forbid(&hdev->dev) done by snd_hda_codec_device_new(),
or release the display power enabled earlier in hdac_hda_codec_probe().

In addition, if pm_runtime_set_active() or the firmware patch loader fails
and jumps to error_no_pm before hdev->type is overwritten in
hdac_hda_codec_probe(), codec->core.type remains set to the legacy type
assigned by snd_hda_codec_device_new(). When card cleanup runs
snd_card_free() -> snd_hda_codec_dev_free() -> snd_hda_codec_unregister():

sound/hda/common/codec.c:snd_hda_codec_unregister() {
	...
	if (codec->core.type =3D=3D HDA_DEV_LEGACY)
		snd_hdac_device_unregister(&codec->core);
	snd_hda_codec_display_power(codec, false);

	if (codec->core.type =3D=3D HDA_DEV_LEGACY)
		put_device(hda_codec_dev(codec));
}

this unregisters the bus-managed codec device and deadlocks on
client_mutex via device_del() -> snd_soc_unregister_component_by_driver().

Should the error paths in hdac_hda_codec_probe() reset the runtime PM
status to suspended, allow runtime PM, release display power, and ensure
hdev->type is set before jumping to cleanup?

> @@ -554,6 +561,7 @@ static void hdac_hda_codec_remove(struct snd_soc_comp=
onent *component)
>  		return;
>  	}
> =20
> +	/* prevent runtime PM callbacks while the link and the codec are torn d=
own */
>  	pm_runtime_disable(&hdev->dev);
>  	snd_hdac_ext_bus_link_put(hdev->bus, hlink);
> =20
> @@ -561,6 +569,9 @@ static void hdac_hda_codec_remove(struct snd_soc_comp=
onent *component)
>  		driver->ops->remove(codec);
> =20
>  	snd_hda_codec_cleanup_for_unbind(codec);
> +
> +	/* Balances the disable above, cleanup_for_unbind keeps runtime PM disa=
bled */
> +	pm_runtime_enable(&hdev->dev);
>  }

[Severity: High]
Does this sequence in hdac_hda_codec_remove() and hdac_hda_codec_probe()
desynchronize bus->codec_powered and hlink->ref_count depending on whether
the codec is runtime active or suspended when hdac_hda_codec_remove()
runs?

There appear to be two cases that get out of sync:

1. If the codec is runtime active when hdac_hda_codec_remove() runs (for
example, when unbinding the codec driver via sysfs while autosuspend is
enabled by skl_set_hda_codec_autosuspend_delay() ->
snd_hda_set_power_save()):

drivers/base/dd.c:__device_release_driver() {
	pm_runtime_get_sync(dev);
	...
	pm_runtime_put_sync(dev);
	device_remove(dev);
	...
	device_unbind_cleanup(dev);
}

Here pm_runtime_get_sync() resumes the codec via
hda_codec_runtime_resume() -> snd_hdac_codec_link_up() ->
snd_hdac_ext_bus_link_power(codec, true), which sets the codec bit in
bus->codec_powered and increments hlink->ref_count. Because autosuspend is
enabled, pm_runtime_put_sync() only starts the autosuspend timer and
leaves &hdev->dev active when device_unbind_cleanup() invokes
hdac_hda_codec_remove().

In hdac_hda_codec_remove(), pm_runtime_disable(&hdev->dev) cancels the
pending autosuspend timer without calling hda_codec_runtime_suspend(), and
snd_hdac_ext_bus_link_put() only drops the link reference from
hdac_hda_codec_probe(). That leaves the codec powered, the link reference
from hda_codec_runtime_resume() leaked, and the codec bit set in
bus->codec_powered, which causes sound/soc/sof/intel/hda-dsp.c:
hda_dsp_runtime_idle() to return -EBUSY and block controller runtime
suspend:

sound/soc/sof/intel/hda-dsp.c:hda_dsp_runtime_idle() {
	if (hbus->codec_powered) {
		dev_dbg(sdev->dev, "some codecs still powered (%08X), not idle\n",
			(unsigned int)hbus->codec_powered);
		return -EBUSY;
	}
	...
}

2. Conversely, if the codec is already runtime suspended when
hdac_hda_codec_remove() runs, hda_codec_runtime_suspend() has already
called snd_hdac_codec_link_down() ->
snd_hdac_ext_bus_link_power(codec, false), clearing the codec bit in
bus->codec_powered and dropping hlink->ref_count.
hdac_hda_codec_remove() then calls snd_hdac_ext_bus_link_put() a second
time.

On the next hdac_hda_codec_probe(), pm_runtime_set_active(&hdev->dev)
marks the device runtime active without calling snd_hdac_codec_link_up(),
so the codec bit in bus->codec_powered remains cleared while the codec is
active. When hda_codec_runtime_suspend() later runs,
snd_hdac_ext_bus_link_power(codec, false) sees enable =3D=3D oldstate (both
false) and returns early:

sound/hda/core/ext/controller.c:snd_hdac_ext_bus_link_power() {
	struct hdac_bus *bus =3D codec->bus;
	bool oldstate =3D test_bit(codec->addr, &bus->codec_powered);

	if (enable =3D=3D oldstate)
		return;
	...
}

skipping hdac_ext_codec_link_down(), controller display power release, and
wake enable configuration in sof_hda_bus_link_power().

Should hdac_hda_codec_probe() and hdac_hda_codec_remove() ensure the codec
link power state and runtime PM state transitions go through the runtime
PM callbacks (such as pm_runtime_resume() in probe and
pm_runtime_put_sync_suspend() before teardown) rather than manipulating
the link refcount and runtime status directly?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027125448.1101=
8-1-peter.ujfalusi@linux.intel.com?part=3D3
