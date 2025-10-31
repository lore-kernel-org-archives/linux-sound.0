Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011CF283151;
	Fri, 31 Oct 2025 08:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901132; cv=none; b=mJ1vj3C9DRUf7/rciE2ki4vinmNEcbeQZbpCFLsW4sp2dpL+hfS+54maZ6lVw1yl7muw3ds55pNfkCm85FIVWGEMlqjPUKeSYLGVKbBysZL0dLRnI5XGO/ovUnTf4zstU36dZbiX6JxZv75xx4dScSp4iF7rYPI6X5LzTjx7gkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901132; c=relaxed/simple;
	bh=MtEcgHWyaqLlxzTyr9ciKsl/hLPFD4/hagDeJF47k2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfHCPrmbAcC+pJwpBhrB8Kr8JKgZWQ3RS8SXcTI9P84ySQUczqxZXZ9Se1v4SUmTET9vuYcUhBCWNQLhEhWPU8KG1IOs6+Mc2qePDkFMEeM7wBQ+vt72DUXFylWKH0qcZWS9ZyEfCRriw2qzlTi6o+xgOf/WrbQSBFfCoTHHpcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aaa9ZbS3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aaa9ZbS3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF33C4CEF1;
	Fri, 31 Oct 2025 08:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761901131;
	bh=MtEcgHWyaqLlxzTyr9ciKsl/hLPFD4/hagDeJF47k2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aaa9ZbS3lPXoscLxKrT5j9jf98ukrLEGtfj4P2nmaKNBxWR/iUsFWjL6Ki0MFrSd6
	 kH6q+0U9nwZIQDyFnGM5PbzE5OCpKK5jUG3XN2mFJcEtrbgHuBC6nrLWGUhFRPG1VO
	 jhvB2g9H/ylad70j3Gd0PMFy4Qj0nbZkhSdrS66pMqHradw2z067JYUln84yu8Wh1T
	 +UKczNJ5Bv0Rxh6sOMVqb1vMcMboEPQMbWLcEs2yeJWJ5bJ7sWV04/pRwJFqORCEcf
	 RrH1KDcSdM9PWZbv6UZuSHA41co8SJRQde0IrMw5PR0X6jHdIN5YcDOmyz5KGssaPu
	 mV0Jh9LHyw8Ig==
Date: Fri, 31 Oct 2025 09:58:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH V1 1/3] dt-bindings: sound: add binding for CIX IPBLOQ
 HDA controller
Message-ID: <20251031-pearl-pheasant-from-atlantis-bf4e7a@kuoka>
References: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
 <20251030110928.1572703-2-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251030110928.1572703-2-joakim.zhang@cixtech.com>

On Thu, Oct 30, 2025 at 07:09:26PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> This patch adds binding for CIX IPBLOQ HDA controller.

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

Please use standard email subjects, so with the PATCH keyword in the
title. 'git format-patch -vX' helps here to create proper versioned patches.
Another useful tool is b4. Skipping the PATCH keyword makes filtering of
emails more difficult thus making the review process less convenient.

A nit, subject: drop second/last, redundant "binding for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/sound/cix,ipbloq-hda.yaml        | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml b/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
> new file mode 100644
> index 000000000000..a4285d1e0319
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml

Filename must match the compatible. See writing bindings doc.

> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/cix,ipbloq-hda.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX IPBLOQ HDA controller
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  CIX IPBLOQ High Definition Audio (HDA) Controller driver.

driver as in Linux driver? No, please describe here briefly hardware.

> +
> +maintainers:
> +  - Joakim Zhang <joakim.zhang@cixtech.com>
> +
> +properties:
> +  compatible:
> +    const: cix,sky1-ipbloq-hda
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: The interrupt from the HDA controller

Drop description, obvious. Cannot be anything else.

> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2

You should list the items instead with description.

> +
> +  clock-names:
> +    maxItems: 2

No, you need to list the items. There is no syntax like that.

> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    maxItems: 1

No, you need to list the items.

> +
> +  cix,model:
> +    $ref: /schemas/types.yaml#/definitions/string

Use standard properties, see other bindings. Maybe ones from
generic/simple audio card fit.


> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      The user-visible name of this sound complex. If this property is
> +      not specified then boards can use default name provided in hda driver.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include<dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    audss_ipb_hda: ipb-hda@70c0000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

e.g. sound or sound-card. Maybe hda, if it is known enough.

Also drop unused label.

Best regards,
Krzysztof

