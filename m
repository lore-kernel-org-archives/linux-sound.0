Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03B140DFD3;
	Tue,  7 Apr 2026 18:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587125; cv=none; b=OS4dw5rsDK+3ffxNo7f5qP7ZwYZFPVKewBwWf9+zSxjvfKGgHPWIhLsAsKkG0TFK1vu7SWXUn/DfAL9fSp+fmttHtHHI4WuJv9yY1Vt0DgpYbY8UmDRUxGTZu1YzIB+eeDjyZmV932GkkoYgwg0TFhGKQw1QrnaMe6IfjtmMZLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587125; c=relaxed/simple;
	bh=R4dSxcoytsAQ1cK7ok8AIjYXHxmPPtrYNQ9CPFagY2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lph1ajKEXORKmjBKZcZs3/X5RYo+OlLyGA2h2OR/qgr1tMqQPM2afbTNU+nc/LO8oKqH882qPphW4l5Vb56C/cygZM9xYz53cPBEsp3NW0jFlS0vtJ4tPhb2TOdi8f6p1dYNd38raXP3k0oej8TjObypWkIjTAUSt+F7lY+0tws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JIexl56u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JIexl56u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C84C116C6;
	Tue,  7 Apr 2026 18:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775587125;
	bh=R4dSxcoytsAQ1cK7ok8AIjYXHxmPPtrYNQ9CPFagY2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JIexl56ul26Axs/KNp3BIfLAGE3nLIY2O1RV+z4DT+pAwd+7eYWlviaAdeN5MOxdy
	 8qHY3tThIX0ur4sRbE76vdJ02ZzifhUqVmL3K8mQl6wxycms7PrvC3eW/HjDX8bB8z
	 /OEmGLB/PJ8mdzzj0zDJ5QdzhQeyXfvCa9WN4Ga/OFmG5sMZceqcQG6Ku055qIhhlr
	 HfvetfREGQuuOzKdTlRHSCVamgBLv4zG2VmvgK5QnYsEYps/5eL50wrwHNolWBmsba
	 7pbVDr92FfqZupk9DqT9e/cxuzZDhe5k/KV2df7VsbHnmrH7DUiRko7ADV8CyvcAx2
	 U/xsyEZkft4Sg==
Date: Tue, 7 Apr 2026 13:38:43 -0500
From: Rob Herring <robh@kernel.org>
To: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, john.stultz@linaro.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: dt-bindings: hisilicon: Convert hi6210 I2S to
 dt-schema
Message-ID: <20260407183843.GA3355079-robh@kernel.org>
References: <20260327092106.4233-1-chaitanya.msabnis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327092106.4233-1-chaitanya.msabnis@gmail.com>

On Fri, Mar 27, 2026 at 02:51:06PM +0530, Chaitanya Sabnis wrote:
> Convert the Hisilicon hi6210 I2S controller hardware binding from
> legacy plain text to modern YAML dt-schema format.
> 
> During the conversion, the order of the dma-names properties in the
> example was corrected to "tx", "rx" to match the official property
> description, resolving a contradiction in the original text binding.
> 
> Signed-off-by: Chaitanya Sabnis  <chaitanya.msabnis@gmail.com>
> ---
>  .../bindings/sound/hisilicon,hi6210-i2s.txt   | 42 ----------
>  .../bindings/sound/hisilicon,hi6210-i2s.yaml  | 80 +++++++++++++++++++
>  2 files changed, 80 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.txt b/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.txt
> deleted file mode 100644
> index 7a296784eb37..000000000000
> --- a/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -* Hisilicon 6210 i2s controller
> -
> -Required properties:
> -
> -- compatible: should be one of the following:
> -   - "hisilicon,hi6210-i2s"
> -- reg: physical base address of the i2s controller unit and length of
> -   memory mapped region.
> -- interrupts: should contain the i2s interrupt.
> -- clocks: a list of phandle + clock-specifier pairs, one for each entry
> -  in clock-names.
> -- clock-names: should contain following:
> -   - "dacodec"
> -   - "i2s-base"
> -- dmas: DMA specifiers for tx dma. See the DMA client binding,
> -  Documentation/devicetree/bindings/dma/dma.txt
> -- dma-names: should be "tx" and "rx"
> -- hisilicon,sysctrl-syscon: phandle to sysctrl syscon
> -- #sound-dai-cells: Should be set to 1 (for multi-dai)
> -   - The dai cell indexes reference the following interfaces:
> -       0: S2 interface
> -       (Currently that is the only one available, but more may be
> -        supported in the future)
> -
> -Example for the hi6210 i2s controller:
> -
> -i2s0: i2s@f7118000{
> -	compatible = "hisilicon,hi6210-i2s";
> -	reg = <0x0 0xf7118000 0x0 0x8000>; /* i2s unit */
> -	interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>; /* 155 "DigACodec_intr"-32 */
> -	clocks = <&sys_ctrl HI6220_DACODEC_PCLK>,
> -		 <&sys_ctrl HI6220_BBPPLL0_DIV>;
> -	clock-names = "dacodec", "i2s-base";
> -	dmas = <&dma0 15 &dma0 14>;
> -	dma-names = "rx", "tx";
> -	hisilicon,sysctrl-syscon = <&sys_ctrl>;
> -	#sound-dai-cells = <1>;
> -};
> -
> -Then when referencing the i2s controller:
> -	sound-dai = <&i2s0 0>; /* index 0 => S2 interface */
> -
> diff --git a/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml b/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml
> new file mode 100644
> index 000000000000..5171f984630b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/hisilicon,hi6210-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HiSilicon hi6210 I2S controller
> +
> +maintainers:
> +  - John Stultz <john.stultz@linaro.org>

That email hasn't worked for years. I would suggest putting the 
HiSilicon maintainer down for anything HiSilicon related.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
