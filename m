Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D411CB527;
	Tue,  3 Sep 2024 06:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725346165; cv=none; b=ncPPN32D3kB2SXLqr9Cc8pXRE3kH+PLzDJ6Rabqw/uzXVx+fmCabcO4BjhBK9O+fx8z3hXjGy4XrKGlc11GI529Jm6wSBiekVz5t8aT1qfTB9pXWprRRgYc2zhqKGlEbyiZyNMMx3FEt6smAcJlR600+GScgaDXArPFHvLsmB6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725346165; c=relaxed/simple;
	bh=ub9hHPzWCg2ZO7IESniZCUNBELQpnPcRyQyrABcGDT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJHhZfMP00gfaB+5oF3Q0LMGYVWHzAD3FF857pQ2lA4Jie1ZhztkKkoTS0+ngQcSQAvc13TEU8lHc6H712phDsF2gEBXET5DIGNRLEWOa70pKvt0ZfI/Q85SgCM6l29ihaG+BgswrTZRzSWi2tjR6uORSANHJrB1Ng1PHH0MeKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rmWz7C7L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rmWz7C7L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D22C4CEC5;
	Tue,  3 Sep 2024 06:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725346165;
	bh=ub9hHPzWCg2ZO7IESniZCUNBELQpnPcRyQyrABcGDT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rmWz7C7Lc6E/IoufuRNWFhBxrXYdzPrtMn5vbDk1SY3npCwYbfDtZLZlNuSBMXbWn
	 I0is3bL/cIvP/uWMfzHsJDRuiJcCLuP9RJgbfJd3icvz/dKkBCvtA/mSm/IJFCFKso
	 ZmsIdxs55sGZte+Gge2oG7WqTVL510RsIYaiSivf7C6MFhGe0jL6c1K9jV2ST35bSB
	 20KzF1s77GGrschL13bpvU8vqxgNj7RGR8rVITQqEExOZPf0kXiJVp8IQsJSe0o0Vd
	 cN/mvy886GSAlTdK35QyRFfbYJch3MEz9EaAFKesjuO66N+Wo3Kb0P6KFbXrTCpKT/
	 1hmYTF8Zp076A==
Date: Tue, 3 Sep 2024 08:49:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, application@irondevice.com
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT binding
Message-ID: <afb4bwvowfjjrkdh63wx7afz3gyydz7tpuhz2i6g6ahubat3vy@7t5vciiv2yp7>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-3-kiseok.jo@irondevice.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903054435.2659-3-kiseok.jo@irondevice.com>

On Tue, Sep 03, 2024 at 02:44:34PM +0900, Kiseok Jo wrote:
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>

Empty commit? Read submitting-patches.

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run  and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

> ---

Where is the changelog? What happened in v2? Why are you sending the
same patch?

>  .../bindings/sound/irondevice,sma1307.yaml    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml b/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
> new file mode 100644
> index 000000000..0bb4ee664
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/irondevice,sma1307.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Iron Device SMA1307 Audio Amplifier
> +
> +maintainers:
> +  - Kiseok Jo <kiseok.jo@irondevice.com>
> +
> +description:
> +  SMA1307 boosted digital speaker amplifier
> +  with feedback-loop.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - irondevice,sma1307a
> +      - irondevice,sma1307aq
> +    description:
> +      If a 'q' is added, it indicated the product is AEC-Q100
> +      qualified for automotive applications. SMA1307A supports
> +      both WLCSP and QFN packages. However, SMA1307AQ only
> +      supports the QFN package.

Difference is only in package bin? That does not warrant new compatible.

Best regards,
Krzysztof

