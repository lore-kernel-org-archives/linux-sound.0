Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5777D37C91A;
	Thu, 16 Apr 2026 10:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776336454; cv=none; b=IkKSHWRiBGseqvgmfqiAw1F5a+oRNnVhlr0AhZYFVQF2KmPZdMaide3YExY8XcznjP1wGfLy71JAk/s2HnyKMkEbMWJ6a0HWjN6GatCxlJkzg9Rz+vZHJ+NDtNxr7QEh4sfD6Y60kyzQ8Whdszi1ihuj0Id3PfOJoOUaShC1/P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776336454; c=relaxed/simple;
	bh=jYaBX80FRIXXpscmnT17RShReMIi8jqV+glgNsQeNlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8gjUKM+Jx8dj+zYFJO/oHCDDvutaYpGxGgOPtCOy5+JZTHqeNLZC4EE2Un4BVTrJYl9ar6Nq5k5R5UeUJFR+zDxgIOewy1TzIBgfZIn9e+tcVTn6TsUUhYZ/h2WV99yQFHi2LjRAf5S55LEt5QHNX/2qU+EbvpOmlCNLTk+ngk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGHoyua9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGHoyua9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B0DC2BCAF;
	Thu, 16 Apr 2026 10:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776336454;
	bh=jYaBX80FRIXXpscmnT17RShReMIi8jqV+glgNsQeNlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGHoyua96qkqz4wPL39pPw5zk/pila8GQwPKGGB6omsX42ZcPKtq/0PZomyHplfdO
	 b0Z1LPDhuigf7I4O/8ao1MBILnKIMEjBd0C1gjRXsctYmWv/BiJmFjCwd5NeVLPeWM
	 tDAawyMhtwOojf8F7Cqff0GOCReHFNU2jfmAZp9XPyO7phWyo38et9Cn8W1YbyKUQ9
	 SdlGAHc7wUdMf51fVmCCQ6LkckDlhASyOHUJdWUkVkQrpKuJqUH2gaRssxVtq+fSRt
	 QSKSowOIrL/YBqK9hLV4w3k6ILV7XY2TM+Irz/cabEkYJsCJTdT8N8EgH+reu6Y1k1
	 XspZQzcfPsvMg==
Date: Thu, 16 Apr 2026 12:47:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/9] dt-bindings: sound: add mediatek,mt2701-hdmi-audio
 machine binding
Message-ID: <20260416-angelic-monumental-skunk-eae6c2@quoll>
References: <cover.1776265610.git.daniel@makrotopia.org>
 <1fe31edbdf045f87f4cfa7ae6fa53196e8b67b96.1776265610.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1fe31edbdf045f87f4cfa7ae6fa53196e8b67b96.1776265610.git.daniel@makrotopia.org>

On Wed, Apr 15, 2026 at 04:23:35PM +0100, Daniel Golle wrote:
> Describe the ASoC machine compatible used to wire the MT2701/MT7623N
> AFE HDMI playback path to the on-chip HDMI transmitter acting as the
> generic HDMI audio codec. MT7623N boards carry the same IP and use
> the mt7623n- compatible as a fallback to mt2701-.

subject: sound:
Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters


> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../sound/mediatek,mt2701-hdmi-audio.yaml     | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml
> new file mode 100644
> index 0000000000000..d08aee447b471
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt2701-hdmi-audio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT2701 HDMI audio machine driver

1. Don't describe drivers. Descirbe the hardware.

2. There is already audio for mt2701: mediatek,mt2701-audio. Why HDMI is
not part of existing audio machine bindings? Or maybe this is not sound
card driver?

> +
> +maintainers:
> +  - Daniel Golle <daniel@makrotopia.org>
> +
> +description:
> +  ASoC machine driver binding the MT2701 AFE HDMI playback path to
> +  the on-chip HDMI transmitter via the generic HDMI audio codec.
> +  The same HDMI audio IP is present on MT7623N.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: mediatek,mt2701-hdmi-audio
> +      - items:
> +          - const: mediatek,mt7623n-hdmi-audio
> +          - const: mediatek,mt2701-hdmi-audio
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle of the MT2701/MT7623N AFE platform node.
> +
> +  mediatek,audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle of the HDMI transmitter acting as audio codec.

But these suggest it is sound card driver...

Best regards,
Krzysztof

