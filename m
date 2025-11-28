Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B575B236A73;
	Fri, 28 Nov 2025 09:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764322070; cv=none; b=l3JULaSjNoiDZ7B6BRYfUiBejQfh2Y/d9LP+0iY58n03hd6hobn1CDDXSSn+0zeeXyDnJOGn9HdYjSmPYnbosBxw/QZzFBkjbcHhf2EWKZlHJRvwjjMjC8KTKUQlkOwOQ+i2VsVLC62gxILLxSfmG945KcxwVOdaS9iA9AVbH7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764322070; c=relaxed/simple;
	bh=YdED8auppZu+RlrHCCSK/88fS6cFj03C8A9W/Xwkuf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4B5MgfzB7/7blwMBe4saarDWYl9wTmG1Q6X02/nQ8aQ3GAMlxDSaZfEXRfFc0uVbJ5XSsbhHEXwWzfNkAt5C5h3uWZIsktB5vnCThCxc9AGUx35E++fI6+SiQATwL47ebxxKs6fNdZ/BDIjH8qHFdPu/LDIb6rpMaYmprs1NtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6mQNE94; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6mQNE94"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F23C4CEF1;
	Fri, 28 Nov 2025 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764322070;
	bh=YdED8auppZu+RlrHCCSK/88fS6cFj03C8A9W/Xwkuf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E6mQNE943PGqg5/z9tcSwCoe/JylexSmuDbjAiGzIC2CVfc0Xo0FvIH4Qbg8aGHn1
	 if1mnnr2ZPdaKDreEWluLc/fCjGoYS6FWg1rms1U9EGDSztmU7kbMdW5YnXM+99/3i
	 RQTgplN7dtcCTfHhqCHuoEb9m/fE2UrHNd2oQDJbWSk0L2EK8WWsRxnj97TF1x/gIe
	 jk8gnga27YjYQGR7jp506lQ4aXkQrDJ8+jU1mZZ3+VpwoavFcLwFSBH6rZpzrY6pbS
	 TxaP4UmqF5i4CiU07Wb/r78QTkBgQ7L/MUmGr+/JHuc30LBfMavTEzpEaciPTDvcWu
	 k/t6kic/2BMlA==
Date: Fri, 28 Nov 2025 10:27:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: add CIX IPBLOQ HDA controller
 support
Message-ID: <20251128-fearless-kittiwake-from-arcadia-662dbc@kuoka>
References: <20251127094301.4107982-1-joakim.zhang@cixtech.com>
 <20251127094301.4107982-2-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251127094301.4107982-2-joakim.zhang@cixtech.com>

On Thu, Nov 27, 2025 at 05:42:58PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
>  - add CIX IPBLOQ HDA controller support

Please write full sentences. Loook how other commits were created, it is
not the first cix commit, right?

> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/sound/cix,ipbloq-hda.yaml        | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml b/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
> new file mode 100644
> index 000000000000..c9e4015a8174
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/cix,ipbloq-hda.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX IPBLOQ HDA controller
> +
> +description:
> +  CIX IPBLOQ High Definition Audio (HDA) Controller
> +
> +maintainers:
> +  - Joakim Zhang <joakim.zhang@cixtech.com>
> +
> +properties:
> +  compatible:
> +    const: cix,ipbloq-hda

What happened here? You miss SoC compatible. I did not ask to change
compatible.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: sysclk
> +      - const: clk48m

clk48m is the name of the pin/signal?

> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: hda

Why this is here still?

> +
> +  cix,model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The user-visible name of this sound complex. If this property is
> +      not specified then boards can use default name provided in hda driver.

You did not respond to several comments and did not implement them.

Best regards,
Krzysztof

