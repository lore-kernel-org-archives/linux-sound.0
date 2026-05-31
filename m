Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF32831354F;
	Sun, 31 May 2026 12:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780231176; cv=none; b=PFC/Tklul2vibpRMm5K3SF/UyJ/At1NwwQxkIU208xORCPpcxVnPWBVKkLclKiM9g63P5AHDuwyH4HidpAzzgclmTiXGbadkfOxDAzJZU4ilSnF0bUcvLLGABClAf333LuES1bZymsIUPspas7UUxcqUL+SUaoevdWbLMWTDsxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780231176; c=relaxed/simple;
	bh=17siQYl0AOPmHdm/sYRFDr5ZPIHE+bNigfbxcxjjN6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCxP/VJ8pQaBtFgE5PQhyVpYp8i4bMCfVnMlc20xaeo399D41RhMHNV+L2TlPC+YEG4EEUVP+qh0j4xw7GKMJ5XQT/JdP5eJD3uKFI0bU7PKjn3I0cBnQOuZzDx49gRCXWM/OLqyTzQkJmiJ8hiTubt+5EkWgLKXfpSPXzETdOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OePxq/vW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OePxq/vW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BAC1F00893;
	Sun, 31 May 2026 12:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780231175;
	bh=kU3C0Fe5mVTPmf2QmytRlBNptZObb7DHNb86r8nSqWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OePxq/vWO0dyv59ea02eESX7RYIHLkeAHPNtX+O52so2zGz0j2860tEE/AQ3uFEaS
	 5dmN26dSGYXI121RV0EnD6g3NT2dWKV4GL9PSpiTHywBVmnLRqAku6ywGslEPVdEqx
	 drhbmvbPVm4CZQMN12+ut89VfcdnL39KrwrfTq0iXF/fcgy2LpdpphapyTux431K/v
	 STTQH77KNoO3KRb7dKc7EmlScwcbvDUdNwMSOhxLC0vYKCYPexktLz/b7WzhgTIROk
	 aIB/H5cz8rPQVmeFyh63aJ3d78kDvYjy04d6OW3yQUjwTX81Dm95M6EPuEfevr5BfZ
	 ZWTPNtX9geyJQ==
Date: Sun, 31 May 2026 14:39:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound
 card.
Message-ID: <20260531-spicy-sassy-woodlouse-b2674e@quoll>
References: <20260528174840.28644-1-ansuelsmth@gmail.com>
 <20260528174840.28644-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528174840.28644-2-ansuelsmth@gmail.com>

On Thu, May 28, 2026 at 07:48:29PM +0200, Christian Marangi wrote:
> Add YAML schema for Airoha AN7581 AFE SoC sound card.
>

Nit: subject, drop final stop.


> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> new file mode 100644
> index 000000000000..80d9e87f1470
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/airoha,an7581-afe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AFE PCM controller for AN7581
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: airoha,an7581-afe
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

This looks incomplete - missing at least clocks. Are you sure that AFE
here is so limited, comparing to other Mediatek designs?

Best regards,
Krzysztof

