Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694972;
	b=w+FBqPxOXs1+29EM6RMXUnbpybyiZk0P3vQTFWqgdCWjmqNEzT+c1sPEZOThHUr5Im7C
	 qF3PQmEeIJEMaLeLtnlAebjD2G0hoZIPPH1VRjFesgykjCYp5/1mjDNQfRyKomFYb582L
	 ccdl5qp/GoKluC/y+zkAiLCN4jrPvWspzJDk6B5tkS0CaU7+PjqAud2O3KhMJIj/I079r
	 8DSTFDBOwGKM/0xu6Wc0uv6e0Mx5vQ95ZAci5zu2QQg5tvOXdo1l4Xha08Dw8NGV40yfn
	 ZPVcx7qV9WWdPJq4VeNAKjjHkMJCPbXlbFSqbgLfea7U7XUsyq5/pVBVWozzCCQuDNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694972;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YHMyH5n3CwX4ey/bPvWwSK67mbEcamik8agTwl+J6bg=;
	b=Fk7JKHMwcYTSZi3BjH4ROXeT8O80ypP+G+dExMbuMevQMSG9ZaM8JiWeJ2/9BsMdnJ/G
	 p1/peIdStJ9bnaVvAbjMRxb1HyohnmVeEnoXTKfcWmFaJi+QOuUTiYSWjk69HZ+FR4z2M
	 yXhROHEUzEjLRWRzH9SDS2NmQYdWhiLCp+ukpQFbt7zIgVT7DMW/TJMJatnFe5r8BYKxI
	 iNmulc+iEvDAEEIL+nUnuACBkedtacD1mZkGqJn3yZ1vDHE71B/nvwhnKxNch1voFJz6J
	 W0oYAXqpsj3qXmw5k6dbjqMbgba9DDY3dF+rIUREZ/YWc6UXN58YE+YH7h/f4IzcNDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EFK6SCmr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B28606A32E;
	Tue,  3 Nov 2026 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EFK6SCmr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D321A1F000C1;
	Tue,  3 Nov 2026 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793694972;
	bh=YHMyH5n3CwX4ey/bPvWwSK67mbEcamik8agTwl+J6bg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EFK6SCmrc4gZY5ktRiZDshIttTnELS5KHwlzuz2n5FhG+sbBTJKkiFJnNv2FPG0rz
	 2WIJGt5KjbOQpRALb1IlSKIgRTVfL6touf8k3tUQi1uM7SOdswHqLCBS9c9DqDXJe5
	 5OhtSX32pjwOtI+mc+NYospfRDXSc7kSty86Vx1oZ1raMgC+FriixJFNI7cgUL0ZCT
	 mWkdqArcBTRLwLDXXTJmvUKxb9QmQhC7rDazKKyQmYZ1hRdgpZO5dwopGMNra/jb0I
	 cHMwQTy6Kw76V7Nfy41dXi2qpV1fnXoSP0uIekiyt8tkvH/4kFx/+PL4MCUbu8RMXe
	 2Q9vckGy7ssXA==
Message-ID: <sashiko-outbox-194839@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/22] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-macaudio-v4-12-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-12-637484efe46d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 08:36:11 +0000
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
- [High] ASoC: apple: macaudio: OF ref leak and devres order in macaudio_de=
vm_release()
- [Medium] ASoC: tas2770: tas2770_set_dai_tdm_idle() treats positive return=
 as error
- [Medium] ASoC: apple: macaudio: macaudio_be_assign_tdm() overwrites slot =
error
- [Low] arm64: dts: apple: t8103-j313: unused #address-cells/#size-cells in=
 sound
--

commit dd4cb33fc5a853fd54101899a161b5d0c84f160e
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8103-j313: Add speaker/headset jack nodes

This commit adds the TI TAS5770L speaker amplifier and Cirrus CS42L83
headset jack codec device tree nodes for the M1 MacBook Air (J313), along
with the sound node advertising them to the macaudio machine driver.

> diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/d=
ts/apple/t8103-j313.dts
> index f8b2b1637b9dc..36c47734a1dc0 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j313.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
> @@ -55,4 +55,89 @@ &typec1 {

[ ... ]

> +/ {
> +	sound: sound {
> +		compatible =3D "apple,j313-macaudio";
> +		model =3D "MacBook Air J313";

[Severity: High]
As reported by Sashiko on v3 [1], when this apple,j313-macaudio node binds =
to
macaudio_snd_driver, does macaudio_snd_platform_probe() in
sound/soc/apple/macaudio.c leak the backend DAI link CPU and CODEC device_n=
ode
references on unbind or if devm_add_action() fails, and can the devres
registration order cause macaudio_vlimit_update() to dereference a NULL
ma->card.snd_card during unbind?

During probe, macaudio_parse_of() -> macaudio_parse_of_be_dai_link() ->
macaudio_parse_of_component() acquires device_node references via
of_parse_phandle_with_args() for the CPU and CODEC DAIs. In
macaudio_snd_platform_probe():

sound/soc/apple/macaudio.c:macaudio_snd_platform_probe() {
	...
	ret =3D devm_add_action(dev, macaudio_devm_release, data);
	if (ret)
		return ret;

	ret =3D devm_snd_soc_register_card(dev, &data->card);
	if (ret) {
		for_each_card_prelinks(&data->card, i, link) {
			snd_soc_of_put_dai_link_codecs(link);
			snd_soc_of_put_dai_link_cpus(link);
		}

		return ret;
	}
}

If devm_add_action() fails, macaudio_snd_platform_probe() returns without
releasing the DAI link CPU and CODEC device_node references. Likewise, when
probe succeeds and the device is later unbound, neither ASoC core teardown
nor macaudio_devm_release() calls snd_soc_of_put_dai_link_codecs() and
snd_soc_of_put_dai_link_cpus():

sound/soc/apple/macaudio.c:macaudio_devm_release() {
	struct macaudio_snd_data *ma =3D data;

	cancel_work_sync(&ma->lock_update_work);
	cancel_delayed_work_sync(&ma->lock_timeout_work);
}

In addition, because devm_add_action(dev, macaudio_devm_release, data) is
registered before devm_snd_soc_register_card(), devres LIFO teardown runs
devm_card_bind_release() -> snd_soc_unregister_card() ->
soc_cleanup_card_resources() first, which frees card->snd_card and sets it =
to
NULL before macaudio_devm_release() cancels lock_update_work and
lock_timeout_work. If either work item runs during teardown,
macaudio_vlimit_update() accesses ma->card.snd_card->controls_rwsem:

sound/soc/apple/macaudio.c:macaudio_vlimit_update() {
	...
	if (take_rwsem)
		down_write(&ma->card.snd_card->controls_rwsem);
}

> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;

[Severity: Low]
Will defining #address-cells and #size-cells on the sound node trigger a dtc
avoid_unnecessary_addr_size warning when building with W=3D1?

Neither headphone-dai-link nor speaker-dai-link uses a reg or ranges proper=
ty
(and Documentation/devicetree/bindings/sound/apple,macaudio.yaml does not
define reg on child dai-link nodes despite listing #address-cells and
#size-cells in required), which causes check_avoid_unnecessary_addr_size() =
in
scripts/dtc/checks.c to warn under W=3D1.

Also, since arch/arm64/boot/dts/apple/t8103-j313.dts already has a root
/ { ... }; block at the top of the file, should the sound node be placed in
that existing root node block rather than opening a second / { ... }; block
after the phandle overrides?

> +
> +		headphone-dai-link {
> +			link-name =3D "Headphone Jack";
> +
> +			codec {
> +				sound-dai =3D <&jack_codec>;
> +			};
> +
> +			cpu {
> +				sound-dai =3D <&mca 2>;
> +			};
> +		};
> +
> +		speaker-dai-link {
> +			dai-tdm-idle-mode-0 =3D "zero";
> +			dai-tdm-idle-mode-1 =3D "zero";

[Severity: Medium]
When speaker-dai-link sets dai-tdm-idle-mode-0 and dai-tdm-idle-mode-1 to
"zero" for the two ti,tas5770l codecs, will tas2770_set_dai_tdm_idle() fail=
 to
complete the TDM idle setup and cause macaudio_be_assign_tdm() to fail?

During backend initialization, macaudio_be_init() -> macaudio_be_assign_tdm=
()
calls snd_soc_dai_set_tdm_idle() with SND_SOC_DAI_TDM_IDLE_ZERO, which
dispatches to tas2770_set_dai_tdm_idle() in sound/soc/codecs/tas2770.c:

sound/soc/codecs/tas2770.c:tas2770_set_dai_tdm_idle() {
	...
	case SND_SOC_DAI_TDM_IDLE_ZERO:
		ret =3D snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
		if (ret)
			return ret;

		ret =3D snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
						    TAS2770_TDM_CFG_REG4_TX_FILL, 0);
		if (ret)
			return ret;
		break;
}

Because snd_soc_component_update_bits() returns 1 when the register value
changes, 0 when unchanged, and a negative errno on error, setting
TAS2770_TDM_CFG_REG4_TX_KEEPER after reset returns 1. Checking if (ret)
instead of if (ret < 0) causes tas2770_set_dai_tdm_idle() to return 1 early
without clearing TAS2770_TDM_CFG_REG4_TX_FILL or updating
tas2770->idle_tx_mode.

In sound/soc/apple/macaudio.c, macaudio_be_assign_tdm() then checks if (ret)
on the return value of snd_soc_dai_set_tdm_idle():

sound/soc/apple/macaudio.c:macaudio_be_assign_tdm() {
	...
		if (props->codecs[0].idle_mode) {
			ret =3D snd_soc_dai_set_tdm_idle(dai, props->codecs[0].idle_mask,
						       0, props->codecs[0].idle_mode, 0);
			if (ret) {
				dev_err(card->dev, "Failed to set idle props for codec\n");
				return ret;
			}

		}
}

Won't this treat the positive return value 1 as an error and log "Failed to
set idle props for codec" when initializing speaker_left and speaker_right?

[Severity: Medium]
In the same single-codec branch of macaudio_be_assign_tdm() in
sound/soc/apple/macaudio.c (used for each of the two CPU/CODEC pairs in
speaker-dai-link), can a failure from snd_soc_dai_set_tdm_slot() be
overwritten when props->codecs[0].idle_mode is set?

Looking at macaudio_be_assign_tdm():

sound/soc/apple/macaudio.c:macaudio_be_assign_tdm() {
	if (rtd->dai_link->num_codecs =3D=3D 1) {
		dai =3D snd_soc_rtd_to_codec(rtd, 0);
		ret =3D snd_soc_dai_set_tdm_slot(dai, mask, 0, nslots, MACAUDIO_SLOTWIDTH=
);

		/*
		 * Headphones get a pass on -ENOTSUPP (see the comment
		 * around bclk_ratio value for primary FE).
		 */
		if (ret =3D=3D -ENOTSUPP && props->is_headphones)
			return 0;

		if (props->codecs[0].idle_mode) {
			ret =3D snd_soc_dai_set_tdm_idle(dai, props->codecs[0].idle_mask,
						       0, props->codecs[0].idle_mode, 0);
			if (ret) {
				dev_err(card->dev, "Failed to set idle props for codec\n");
				return ret;
			}

		}

		return ret;
	}
}

Unlike the multi-codec loop below it (which checks if (ret) return ret;
immediately after snd_soc_dai_set_tdm_slot()), the num_codecs =3D=3D 1 path=
 does
not check ret before entering if (props->codecs[0].idle_mode), so
snd_soc_dai_set_tdm_idle() overwrites any negative error returned by
snd_soc_dai_set_tdm_slot().

[1] https://lore.kernel.org/r/20261018-macaudio-v3-11-abdff7741dea@gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-macaudio-v=
4-0-637484efe46d@gmail.com?part=3D12
