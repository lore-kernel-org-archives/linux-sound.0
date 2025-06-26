Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB77927510C;
	Thu, 26 Jun 2025 19:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750966760; cv=none; b=t/amUaWyJikjdM9CNihgUJ0MyhcIjbySH45Kt5OUTnJ8W0Ztjuw4tiwRl5bsiPB47elZ8uJ4AxknTsK2mwAJr9MILoGmo7ob33dxI1fVCwgrKH9vRjds4iG6T7fPfB7P5hUiUh+0ZYFLsGoJcvygxLjTqyP79AT4s8/JYdMSrXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750966760; c=relaxed/simple;
	bh=ZLyachA0cZ1ZFfHJZ8gOmKDO10e/vQrJvgnBljltnug=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ZYZiA0rOy0GmRDc5minoB3IARFW2VbT8Z1QwWPLdtB7BLVwuus+XyYKjWsQi8cAeE57JZl/jxHwDzr2vMdsYKsZC7HuNJdo63RANaVbzNHOy1la+MUQvMjM9vz+D6wD4fL5udQgfzrabTtQct3sCtqFuwWh1zVVx9KOmQ+PIEjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlzMNQiD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlzMNQiD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD3DC4CEEB;
	Thu, 26 Jun 2025 19:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750966760;
	bh=ZLyachA0cZ1ZFfHJZ8gOmKDO10e/vQrJvgnBljltnug=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WlzMNQiDZzb5bKE9Hzr92+/WOb3CNnGAHDTCcc2tFnVEe/z9wvqAoX0HnOBqIqBRb
	 i4t3MFMJkVWzFcbECQ5lx/EakxhhIWADGGyh5Mcl5cx79TO+VjQObu5ZYj5EvMqeFS
	 qwP9hENAcggby7r/OE7pLh6cy3/RUamyvnMQZz6gom1svqap0f5PHXW3NNR8bEiTBT
	 UQUmIiZzs3C9A6UKCN+kwZQ6r3MCo3K6Pxih3RKF0uxitXvOzE1iJqqFKXQ/x74FwF
	 jYgbnSjr0M8Z8fYuL1Za4giyH6InMG/PUWmgLbgPqznqYPpT32fzBFrjH2ErStWTMj
	 pMX8KhB4eh82g==
Date: Thu, 26 Jun 2025 14:39:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, lgirdwood@gmail.com, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, broonie@kernel.org, 
 liam.r.girdwood@intel.com, andriy.shevchenko@linux.intel.com, 
 baojun.xu@ti.com, shenghao-ding@ti.com, linux-sound@vger.kernel.org, 
 v-hampiholi@ti.com, conor+dt@kernel.org, navada@ti.com
To: Niranjan H Y <niranjan.hy@ti.com>
In-Reply-To: <20250626181334.1200-3-niranjan.hy@ti.com>
References: <20250626181334.1200-1-niranjan.hy@ti.com>
 <20250626181334.1200-3-niranjan.hy@ti.com>
Message-Id: <175096675929.695498.5504104608098121359.robh@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: sound: bindings for tac5x1x family
 of codecs


On Thu, 26 Jun 2025 23:43:31 +0530, Niranjan H Y wrote:
> tac5x1x family are series of low-power and high performance
> mono/stereo audio codecs consists of ADC and DAC combinations.
> The family consist of Codecs(DAC & ADC), ADC only and DAC only
> configurations. The documentation explains the list of devices
> in the family, their power supply configurations and gpio
> configuration options available for various functionality.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> 
> ---
> v2:
> - Document newly added dts entries ti,adc1-impedance,
>   ti,adc2-impedance, ti,out2x-vcom-cfg
> v3:
> - add documentation for ti,pdm-input-pins
> - Update required section
> ---
>  .../devicetree/bindings/sound/ti,tac5x1x.yaml | 262 ++++++++++++++++++
>  1 file changed, 262 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Warning: Duplicate compatible "ti,taa5412" found in schemas matching "$id":
	http://devicetree.org/schemas/sound/ti,pcm6240.yaml#
	http://devicetree.org/schemas/sound/ti,tac5x1x.yaml#
Warning: Duplicate compatible "ti,taa5212" found in schemas matching "$id":
	http://devicetree.org/schemas/sound/ti,pcm6240.yaml#
	http://devicetree.org/schemas/sound/ti,tac5x1x.yaml#
Warning: Duplicate compatible "ti,tad5212" found in schemas matching "$id":
	http://devicetree.org/schemas/sound/ti,pcm6240.yaml#
	http://devicetree.org/schemas/sound/ti,tac5x1x.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/ti,tac5x1x.example.dtb: tac5x1x@52 (ti,tac5212): ti,gpa-gpio: 0 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250626181334.1200-3-niranjan.hy@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

