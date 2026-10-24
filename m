Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792832012;
	b=YPtem6Ec4OASI7b4z5gkXbcht1L3TH34zxmi0lZM4IulVSROCmbC5tcvSctMV0Cgs7rC
	 07SUp/B0Vw0zBvpNZ11m3IQtSc14JHt7a+5U5uGI6iDez0CPYN6MSvaQX3c1GAR/1kSPE
	 hejPYZdw9SXk+JVLPZppbmc7yt5vq87iDOZbp1tM9QeOoM/lsBKZrFaRoCv7spIlL1SZn
	 VAWouhBoRV15NsqPp5TroZEXZ1O31R2dlfnLTwMeXCEH1wultfrdOufXnceB2LR+LXiH/
	 y2GBtBmagMa/8sAtIoCeM0wXkvIBP4s18OQBjW//5L4XwuSSmD2686xDhHT8IFFUfuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792832012;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/160rODM6gMD+E9E2LegL4NM//Fg9SQ7q0LaErlO+nA=;
	b=3+D30KG56panoPgNhrWqRylDzKOvACFFczfty34Cq2Z/8LkBFGRfOkKNoxuI/qjY7g1w
	 AkTpbzvKX/XOhaE+75fLJlHrlZDsW56BvQH/B6s8px2Tlmmq0UFKJteNN044d8DYxfREw
	 LRugR6QZDl+SrrjU2ag2cbs+3XeQLvz29Q2mfJzU8lryJ1VVTYRdcgoCjqVuo58rxRKm0
	 UEje9+z8H7OR0nnFT2XBMUfUkE2qbFtGy/sKqA761IHGszNLcjZ6NfGzQO+94NAbVVYGx
	 d1CEZ9qx1RbQnbgF1AtYXkXUuAkfOPph7Wd7I+SjMrvYYiTaEevuAedtVwA5j8s70kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l6RhKEvU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36998606A31A;
	Sat, 24 Oct 2026 08:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l6RhKEvU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753131F01825;
	Sat, 24 Oct 2026 08:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792832011;
	bh=/160rODM6gMD+E9E2LegL4NM//Fg9SQ7q0LaErlO+nA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l6RhKEvUDnm/3uSnAcCI4C0BlXgRqXwLwgZG0/GQNKrMgWypOf3dMdai3tkFWD/OU
	 P15+LPmorXdMw68PI53DD7HMiyaZbG9JbQwCO4MzaWBQpjzXiCdfPWtLiu/fi8cMQu
	 WOT6fdhHM3gxswRXn7aV8SDx9X1ikGssFB8L3C4N8aH7SMMj3gOJnFwrMMy3bfpZtx
	 m62UIWBdoyW2yF/nuaj9bP3HjD/5FRHqSHlJugJqYbQ7e4hfvmW7qagmR1Lr+0O5qg
	 3r6n9N98fwKBh+rp1qBZCgMCBBZO4jLXDPQrZdZ7pq3w3J6hzIRh88vFD/x76XTAQg
	 YARladb80k1xw==
Message-ID: <sashiko-outbox-183601@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 RFC] ASoC: dt-bindings: Define '#sound-dai-cells'
 only in the dai-common schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261024084307.116715-1-clamor95@gmail.com>
References: <20261024084307.116715-1-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 08:53:30 +0000
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
- [Medium] ASoC: dt-bindings: dai-common.yaml enum [0, 1] breaks 2-cell DAI=
 schemas
- [Medium] ASoC: dt-bindings: dropping const #sound-dai-cells weakens DT va=
lidation
--

commit 26a69ea0b2bf774fcda9427ca7712dbec4492c12
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ASoC: dt-bindings: Define '#sound-dai-cells' only in the dai-common schema

This commit constrains #sound-dai-cells in dai-common.yaml to an enum of
[0, 1] and drops the explicit #sound-dai-cells property definitions from
linux,bt-sco.yaml and linux,spdif.yaml in favor of referencing
dai-common.yaml.

> diff --git a/Documentation/devicetree/bindings/sound/dai-common.yaml b/Do=
cumentation/devicetree/bindings/sound/dai-common.yaml
> index 1aed2f0f17756..152f319d8f382 100644
> --- a/Documentation/devicetree/bindings/sound/dai-common.yaml
> +++ b/Documentation/devicetree/bindings/sound/dai-common.yaml
> @@ -13,6 +13,10 @@ allOf:
>    - $ref: component-common.yaml#
> =20
>  properties:
> -  '#sound-dai-cells': true
> +  '#sound-dai-cells':
> +    description:
> +      Use 0 if only a single DAI cell is available, or 1 if there are mu=
ltiple
> +      DAI cells. For special cases, check the device schema.
> +    enum: [0, 1]

[Severity: Medium]
Can device schemas that require more than one cell actually override
enum: [0, 1] when referencing dai-common.yaml?

In devicetree schemas, device bindings include dai-common.yaml via allOf,
which requires every subschema to be satisfied simultaneously. A referencing
schema can narrow the allowed values in dai-common.yaml, but it cannot widen
enum: [0, 1] to allow 2.

For example, Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
includes dai-common.yaml and requires 2 cells:

    allOf:
      - $ref: dai-common.yaml#

    properties:
      $nodename:
        pattern: "^audio-controller@.*"

      "#sound-dai-cells":
        const: 2

This matches sound/soc/meson/aiu.c:aiu_of_xlate_dai_name():

    if (args->args_count !=3D 2)
            return -EINVAL;

With enum: [0, 1] in dai-common.yaml, the intersection of enum: [0, 1] and
const: 2 is empty, causing dt_binding_check on amlogic,aiu.yaml (and
dtbs_check on arch/arm/boot/dts/amlogic/meson.dtsi and
arch/arm64/boot/dts/amlogic/meson-gx.dtsi) to fail with a validation
regression because 2 is not one of [0, 1].

Commit 3fda85324b8d ("ASoC: dt-bindings: Extend name-prefix.yaml into common
DAI properties") originally left '#sound-dai-cells': true in dai-common.yaml
for this reason. Should dai-common.yaml keep '#sound-dai-cells': true (or
include 2 in the allowed range) so bindings with 2 cells remain valid?

[ ... ]

> diff --git a/Documentation/devicetree/bindings/sound/linux,spdif.yaml b/D=
ocumentation/devicetree/bindings/sound/linux,spdif.yaml
> index aea6230db54c8..62c035b739d38 100644
> --- a/Documentation/devicetree/bindings/sound/linux,spdif.yaml
> +++ b/Documentation/devicetree/bindings/sound/linux,spdif.yaml
> @@ -18,9 +18,6 @@ properties:
>        - linux,spdif-dit
>        - linux,spdif-dir
> =20
> -  "#sound-dai-cells":
> -    const: 0
> -

[Severity: Medium]
Does dropping const: 0 here weaken schema validation for fixed single-dai
and multi-dai devices?

Both linux,spdif-dit and linux,spdif-dir only ever register a single stub
dai in sound/soc/codecs/spdif_transmitter.c:spdif_dit_probe():

    static int spdif_dit_probe(struct platform_device *pdev)
    {
            return devm_snd_soc_register_component(&pdev->dev,
                            &soc_codec_spdif_dit,
                            &dit_stub_dai, 1);
    }

and sound/soc/codecs/spdif_receiver.c:spdif_dir_probe():

    static int spdif_dir_probe(struct platform_device *pdev)
    {
            return devm_snd_soc_register_component(&pdev->dev,
                            &soc_codec_spdif_dir,
                            &dir_stub_dai, 1);
    }

Per the description in dai-common.yaml, #sound-dai-cells must be 0 when only
a single dai is available. Replacing const: 0 in linux,spdif.yaml with the
common enum: [0, 1] allows a devicetree node with #sound-dai-cells =3D <1> =
to
pass dtbs_check silently.

Similarly, if bindings for multi-dai codecs drop const: 1 in favor of
dai-common.yaml, nodes erroneously setting #sound-dai-cells =3D <0> will pa=
ss
schema validation and then fail at runtime during phandle translation in
functions such as snd_soc_of_xlate_dai_name(), qmc_audio_of_xlate_dai_name(=
),
or q6dsp_audio_ports_of_xlate_dai_name().

Should bindings for devices with a fixed number of dais keep their explicit
const: 0 or const: 1 constraint in the device schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024084307.1167=
15-1-clamor95@gmail.com?part=3D1
