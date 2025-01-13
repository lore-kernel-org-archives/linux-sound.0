Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F8A1C5D73;
	Mon, 13 Jan 2025 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736781971; cv=none; b=Nl5EhwsuG36JXtM9n2FORsmk2vg8WrRD7hWXRsLWYitb2cvz4BBRD+RiZlQkLcGJovOnGi926MO3ZhEfwPoQXcRrzPiz8PSMrnRr/TEKim8d5Dp7vGrMdA2KWuCOngDqH9AeG/Py9EXS5YDO5ZWZ2QV4D1MNC4REYXXlXNJVYsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736781971; c=relaxed/simple;
	bh=T7t+1Ze8yLQOWuB84xpWs3Ri1LIErbNg7RQFQV/TxUQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=NRaP06AkbEsYbRYffVDfToQzqj086PA3Go4RYpA25oqiJhKrGzFv14oeIb7TVPQU5IazeKG4Aw1bOtHdhZKk6ZSna4KRnVnLXTzvfSTCsZZH3v/F+H26uv73ixjRNWusK2fV1KjDH+Ng+Q4fjWlPtfIdSoy7bzn1gCU3PpvnrI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYfqx2/Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYfqx2/Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980F5C4CEE6;
	Mon, 13 Jan 2025 15:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736781970;
	bh=T7t+1Ze8yLQOWuB84xpWs3Ri1LIErbNg7RQFQV/TxUQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jYfqx2/Z4QGhBfoSDKllsJeP9TSCI17tpVC+pdmI+BN+iG1sGEOtdQGgrZIldw7wh
	 kHluGCOY0QaXSPFusc2eiQI4+bqmFDgr/mUud5vGEJGaA/CYoGYtWA8IdBsN+KojWS
	 /sggSFJ2hQw+t+BfLhsJWTFKNOCJU/2jb42LqVV6nrW/trDBNWHYZvw/Z6SLBcY5Dx
	 mKgqPiuJ8yFCE8nV4EzMPibJ+IUJ5km+9PlhM7lUkrMi3z+vyJ2zNkzq0+jGcqGraJ
	 w5wnBXBcPK8mSJg1InYS54PA/zwBDNgzdEWFZZ3GV1Fbn13B4cOC0S1Mwl0Ye+S+Kn
	 ssXo7DlFm3Tqg==
Date: Mon, 13 Jan 2025 09:26:09 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 linux-amlogic@lists.infradead.org, linux-sound@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
To: jiebing chen <jiebing.chen@amlogic.com>
In-Reply-To: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
Message-Id: <173678161502.2153418.9839486392491673173.robh@kernel.org>
Subject: Re: [PATCH 0/3] Add support for S4 audio


On Mon, 13 Jan 2025 14:35:12 +0800, jiebing chen wrote:
> Add the tdmout pad control and tocodec control driver.
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
> jiebing chen (3):
>       ASoC: dt-bindings: Add Amlogic S4 audio
>       ASoC: meson: s4:support for the on-chip audio
>       arm64: dts: amlogic: Add Amlogic S4 Audio
> 
>  .../bindings/sound/amlogic,s4-tdmout-pad.yaml      |  36 ++
>  .../bindings/sound/amlogic,s4-tocodec.yaml         |  44 +++
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 226 ++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 385 ++++++++++++++++++++-
>  sound/soc/meson/Kconfig                            |  16 +
>  sound/soc/meson/Makefile                           |   6 +
>  sound/soc/meson/s4-pad-out-control.c               | 372 ++++++++++++++++++++
>  sound/soc/meson/s4-tocodec-control.c               | 376 ++++++++++++++++++++
>  sound/soc/meson/t9015.c                            |   5 +-
>  9 files changed, 1461 insertions(+), 5 deletions(-)
> ---
> base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
> change-id: 20250110-audio_drvier-07a5381c494b
> 
> Best regards,
> --
> jiebing chen <jiebing.chen@amlogic.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com:

arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-0: Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-2: Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: bus@fe000000: audio-controller@1A000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: bus@330000: audio-controller@E58: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: clock-controller@0: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller@1A000: 'AVDD-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/amlogic,t9015.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-amplifier-0: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/simple-audio-amplifier.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: sound: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#





