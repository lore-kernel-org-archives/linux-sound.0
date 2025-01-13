Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B8D28FD;
	Mon, 13 Jan 2025 07:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736752797; cv=none; b=BGxVtUBL4oZaY+yBfOI9/NX+GAczC5JJSwjSPGlwKOOlDHrDiay60vz7lmZPe2pcLQtXppOpuxQx0Fer4HLP3SHzBkao5SYPF0MUHw2+gFCjwM6wkLNIcCfvvVR6zn0prcuLQdH0dam0peAwITkmHOEUapC1wvDjDujavWO2NX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736752797; c=relaxed/simple;
	bh=MYJh3nER0YHHitikyQndEMbpoJyhZPDW6g9Dil0vlRY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Qy0m4JS89y+I51EKrcUJ/ILrhXgq5HwL1LHcPk+WrhJdkKvRLR6DD5OXUXIkfk/ycPo/qSVyUtLVo7ayCjpAZvUYO8DOY7EVSJyI7MtMY+bbiN2rTnm43a/nSKy9m9zI/Y5jC5ixbc/zoLDo7qHZ7amFHya+oUftxGfYW98BO+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjKFkpRj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjKFkpRj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9A8C4CED6;
	Mon, 13 Jan 2025 07:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736752797;
	bh=MYJh3nER0YHHitikyQndEMbpoJyhZPDW6g9Dil0vlRY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mjKFkpRjdNsXXJ5zthwnqTsDxtfOwux3uS6dTV9/A8lV3ByHLs7QPzZoG5eOX3XTu
	 Z9Y6yGThfI432tMiVYIueQY4bFTd1oy20h+H2JfbtijnbZom14Vzd9PoG9p+HObrH+
	 9iCFrUMlX5B8RSLX1xf+dtGPqjlK/NNjZjtmjShbqyj14xpNMwiLKjA9JdT4ucp919
	 asB5Q5Di+p3sPXIQ08Tf8telCIYOX1wkRg4Iqvhzmzl28rHR9ZATGve5/jmPTXItjZ
	 7ccTeP5T3pn2qLLwpSljNU4DSYOWTiFUyD7EwozyfUT+HrvoLTZ3kkBaTgI8KnFP/n
	 MppiBw38PetPw==
Date: Mon, 13 Jan 2025 01:19:56 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Kevin Hilman <khilman@baylibre.com>, 
 linux-sound@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>
To: jiebing chen <jiebing.chen@amlogic.com>
In-Reply-To: <20250113-audio_drvier-v1-1-8c14770f38a0@amlogic.com>
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
 <20250113-audio_drvier-v1-1-8c14770f38a0@amlogic.com>
Message-Id: <173675279619.745064.11661644624607210871.robh@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: Add Amlogic S4 audio


On Mon, 13 Jan 2025 14:35:13 +0800, jiebing chen wrote:
> Add documentation describing the Amlogic S4 TDM output pad and toacodec.
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  .../bindings/sound/amlogic,s4-tdmout-pad.yaml      | 36 ++++++++++++++++++
>  .../bindings/sound/amlogic,s4-tocodec.yaml         | 44 ++++++++++++++++++++++
>  2 files changed, 80 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/amlogic,s4-tocodec.example.dts:23.35-36 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/sound/amlogic,s4-tocodec.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250113-audio_drvier-v1-1-8c14770f38a0@amlogic.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

