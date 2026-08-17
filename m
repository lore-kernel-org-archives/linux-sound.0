Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D0D3B7B91;
	Mon, 17 Aug 2026 07:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786952369; cv=none; b=rMjGrA4nJuyWO9NS7UxEgpDutGN7Y+UgegEO3DxYeUnjIufW0LMcOZRPHiqCobobyJa9ggbdmVlzVXLLh/1BQJL2AXSrpeBCFlm6cpfD/RpIQFvBgUbZB8E1pVTsuvMQZGW/WOcaevaMl74U6U3tN5EMSNdo/316DvAs/BffuLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786952369; c=relaxed/simple;
	bh=I8cJOVA5MebsGPrvNEU1cYE+gGipRNM2jrOxmjFLmic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQjfcCxQUXt8rvZ1zywoTkMnmBWFkyTBdnu8I8mYVlg2f3DJnJhcZ4A3LNu7jeyf8tpuwwR8//SYSJhzuDPUCXFHWPpC9KMldB9hM7k2nSBNq3DDpagWugUi5tbDjws1L1zqSr2QxjwsDkCKhcoSnBQ9DZyjsGpiEiC5aT+VWME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUnxTygf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUnxTygf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13AC1F000E9;
	Mon, 17 Aug 2026 07:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786952367;
	bh=iUnyPMbVJPnjnEOxdYhuEUy3Ps5JiRtKMppdRRM7gWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hUnxTygfY/la4TaJxG+y+pnFupeuflipwt5jXDF1EspJZ0i36/Ff1jUS63Ry8rQTX
	 iyJNbwNhhCqyGLrN7JxBWPb3SuGd3mEmNUJJftLicaKyFSlmimkvTmIntPxPPp4xYp
	 9kOtfbacK5nxnHuH5NnP6gzIJ+mKjNoMn8ipgFcN274TOOPWKFTnxP1DwZ/QZExf+a
	 aZSfrxLLgtpusoG+gcRUd3j3puw9h7kNgiVaeroaZA6huUZfD9IJOVTWGDgr3DQZ8u
	 AFJ+LNG6BiTuWIvxh/9TPUAYV/MiCb/A8oUWfpJDaOqZuS2n8tjEppCskfg1l/ZANZ
	 Apn2cyqI7jtKg==
Date: Mon, 17 Aug 2026 09:39:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: cs35l45: Adds SYNC properties
Message-ID: <20260817-brawny-smart-dove-85e4a5@quoll>
References: <20260814223456.611160-1-rriveram@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260814223456.611160-1-rriveram@opensource.cirrus.com>

On Fri, Aug 14, 2026 at 10:34:52PM +0000, Ricardo Rivera-Matos wrote:
> Introduces support for the multidevice synchronization (SYNC)
> bus. The properties introduced allow for the configuration
> of the device's transmitter IDs.
> 
> Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
> ---
>  .../bindings/sound/cirrus,cs35l45.yaml        | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)

Sashiko comments are valid.

> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
> index 70f6c62aedca..f64ba8c872b9 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
> @@ -53,6 +53,29 @@ properties:
>      maximum: 3
>      default: 2
>  
> +  sync:
> +    description:
> +      Multidevice synchronization (SYNC) bus configuration
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      cirrus,sync-lsw-txid:
> +        description: |

Do not need '|' unless you need to preserve formatting.

> +          Transmitter ID to use for long software (LSW) data packets
> +          on the SYNC bus.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 7
> +        default: 0
> +      cirrus,sync-sw-txid:
> +        description: |
> +          Transmitter ID to use for short software (SW) data packets
> +          on the SYNC bus.

What is transmitter ID? Why does it differ per board designs?

Best regards,
Krzysztof

