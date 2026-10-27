Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092327;
	b=ri+qnKiLUY6r/Gwr7uwVK/qfd/vP6GwHTJVJYuOzMFidb+5CywrYuyBR/kB4uaJ07btt
	 6bsOPEs6HtNPStaBWxPxOFHPMtrnrBFgpr2H9xWX6qFP5MJ/Hdj8gH1hwWBLitvC6TBae
	 GbYnNMCRjlsELmEgfnfuhE9oB09DrBkMFfHGkBFNJSLqkEjMMsd00RU85xZG5qk/CfkMa
	 VLOC7KcqTFvuRXVXZUgDtytQYiFa4tBac5foUSxTr/P0+4g0mPwfh7Bw0jiIs+zwNKwPM
	 00OeJCZKVPXn8luN2CBt1SjTV24s7DmU+2uQVd7wz1FlDBO5v7fKgC4Vul75Z62mO2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092327;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=S20SSxkov3IlvbHNiilL/Tb0CJHxMqf0hM4Nn1QS6/Y=;
	b=4W93AiSaFHHNx5pEVH4+Cav8/qeXdFHy9xtx7zjmHGXlg043Z8hgbjp3XyO15soLWSrB
	 TWMhNCArsbJLj9UykHYRdm0apcH0j4zrja/5vfWvE6Di5KFT929IrDHpULCkUuXJOBYYQ
	 8oPrUuuf09guOVZa7sjgMzYLH1g/nT0BW+o5hEHqGRpj69B5L5djgYrjw+bSVRzPx+K80
	 ErqSKYLVvND4mNKZBOAdL3GIRsh2YgKmw+F4UkLNtY2smmaZFZcpf9f0qpG5hgKx/NulA
	 tcJs3lNwWeZivDX7fHKHZ909i76FPEn1QyYSLYbPJ7YLK799wZeJWTSOJ964H7I1uvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JVVDZM9d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED78606A31A
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 09:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JVVDZM9d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96421F01828;
	Tue, 27 Oct 2026 09:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793092326;
	bh=S20SSxkov3IlvbHNiilL/Tb0CJHxMqf0hM4Nn1QS6/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JVVDZM9dQIAtBFfRuOxdX8q47C6B8J8ptD/P4u6rkDeeGJGeqjWezmH+vtygsCVbj
	 e1HHCUu1g7aGzSnrcaDF47a4eLWgmU+T4S43NjnOs4anw9V0qmkN6KpVIbBPTbka5H
	 UgI72rEaHid6b89ERg3aT+fTgUpspw+s33/L/PrXfhZiWmLCatDqRQ0f/pHqnv9xDS
	 Q1GYRxPLfkAKNBsvCtMGjcHtver6kLmRZSQsTJVpiTiYeR8ceOVPcZdUa6OnLxmzUw
	 DGjAGQkeZeQQsEoAR9t7BfmzKnmpphWZe/WLN3b6unGn8mgWOxa6LqtacG2/MUZXtE
	 UwCpdkznMcQXQ==
Message-ID: <sashiko-outbox-186315@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ASoC: hdac_hda: Balance the runtime PM disable in
 codec remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261027083840.28813-4-peter.ujfalusi@linux.intel.com>
References: <20261027083840.28813-1-peter.ujfalusi@linux.intel.com>
 <20261027083840.28813-4-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 09:12:06 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: hdac_hda: codec stays powered in D0 on re-probe due to RPM=
_SUSPENDED state
--

commit fc19b5dab0635a3fee4ca467d334fb76459c8230
Author: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

ASoC: hdac_hda: Balance the runtime PM disable in codec remove

This patch re-enables runtime PM at the end of hdac_hda_codec_remove() to
balance its earlier pm_runtime_disable() call so that runtime PM does not
remain disabled after snd_hda_codec_register() runs on a subsequent probe.

> diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
> index cae5711e979c3..bd4b113401a8d 100644
> --- a/sound/soc/codecs/hdac_hda.c
> +++ b/sound/soc/codecs/hdac_hda.c
> @@ -554,6 +554,7 @@ static void hdac_hda_codec_remove(struct snd_soc_comp=
onent *component)
>  		return;
>  	}
> =20
> +	/* prevent runtime PM callbacks while the link and the codec are torn d=
own */
>  	pm_runtime_disable(&hdev->dev);
>  	snd_hdac_ext_bus_link_put(hdev->bus, hlink);
> =20
> @@ -561,6 +562,9 @@ static void hdac_hda_codec_remove(struct snd_soc_comp=
onent *component)
>  		driver->ops->remove(codec);
> =20
>  	snd_hda_codec_cleanup_for_unbind(codec);
> +
> +	/* Balances the disable above, cleanup_for_unbind keeps runtime PM disa=
bled */
> +	pm_runtime_enable(&hdev->dev);
>  }

[Severity: Medium]
Does the codec hardware still stay powered in D0 after an unbind and re-bind
cycle even with this balanced pm_runtime_enable() call?

On initial device creation, snd_hdac_device_init() sets runtime_status to
RPM_ACTIVE while runtime PM is disabled (disable_depth =3D=3D 1). However, =
when
hdac_hda_codec_remove() finishes, runtime_status is left as RPM_SUSPENDED:
either the codec was already runtime-suspended before an ASoC card unbind,
or on a codec driver unbind __device_release_driver() calls
device_unbind_cleanup() -> pm_runtime_reinit(), which sees
!pm_runtime_enabled(dev) and calls pm_runtime_set_suspended(dev):

drivers/base/power/runtime.c:pm_runtime_reinit() {
	if (pm_runtime_enabled(dev))
		return;

	if (dev->power.runtime_status =3D=3D RPM_ACTIVE)
		pm_runtime_set_suspended(dev);
    ...
}

When the codec is probed again, hdac_hda_codec_probe() enters with
disable_depth =3D=3D 1, usage_count =3D=3D 1, and runtime_status =3D=3D RPM=
_SUSPENDED.
It acquires the HDA link via snd_hdac_ext_bus_link_get() and calls
snd_hda_codec_device_new(), which powers the hardware up to AC_PWRST_D0 and
calls pm_runtime_forbid(). Because runtime PM is still disabled at that
point, rpm_resume() returns -EACCES and leaves runtime_status as
RPM_SUSPENDED.

At the end of hdac_hda_codec_probe(), it assumes runtime_status is still
RPM_ACTIVE from initial device creation and never calls
pm_runtime_set_active(&hdev->dev):

sound/soc/codecs/hdac_hda.c:hdac_hda_codec_probe() {
    ...
	/*
	 * hdac_device core already sets the state to active and calls
	 * get_noresume. So enable runtime and set the device to suspend.
	 * pm_runtime_enable is also called during codec registration
	 */
	pm_runtime_put(&hdev->dev);
	pm_runtime_suspend(&hdev->dev);
}

When snd_hda_codec_register() subsequently runs, it enables runtime PM and
calls snd_hda_power_down():

sound/hda/common/codec.c:snd_hda_codec_register() {
    ...
	if (device_is_registered(hda_codec_dev(codec))) {
		snd_hda_codec_display_power(codec, true);
		pm_runtime_enable(hda_codec_dev(codec));
		/* it was powered up in snd_hda_codec_new(), now all done */
		snd_hda_power_down(codec);
    ...
}

Because dev->power.runtime_status is already RPM_SUSPENDED, rpm_suspend()
inside snd_hda_power_down() returns 1 immediately without invoking
hda_codec_runtime_suspend() or scheduling autosuspend. Doesn't this leave t=
he
codec hardware powered in AC_PWRST_D0, the HDA link reference from
hdac_hda_codec_probe() held, and the display power reference from
snd_hda_codec_register() held, unless pm_runtime_set_active(&hdev->dev) is
also called in hdac_hda_codec_probe() (similar to hda_codec_probe_complete()
in sound/soc/codecs/hda.c)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027083840.2881=
3-1-peter.ujfalusi@linux.intel.com?part=3D3
