Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B8F3242C8;
	Thu, 27 Nov 2025 10:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238479; cv=none; b=f0oyz+FIzNmYch2yqlO7lbqZ3HDxbh2lpAqIydbd7oVG+A0Odv79x2cn8U8xvCrLJsh9+DAFy6GxF9IeUI3/x2Nir8tolviRc9N6ldoBI6xlr8hJAf8kesk/1lYcM+9IoaePNz0a+CKMkgI9xoGgLvSvbQbhsYvHqbNnFHTSmCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238479; c=relaxed/simple;
	bh=fOrEfPt4CyIjoFDbsINEfxhlO/2CC4QDz09rq3zRkZg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=PTgWa6L9coN4zno5tibFEdT//Jk0E8BJ1M7Ku+GZmLF8C9fol90htSJ8b3h632mKQba9r+7Cv1gOWufATF47HGhsSXKPZdUfblJiHLe6WRBzNRbJnVhva0ZhXYkq4xAjEJ6F5fCPEzOoD/xEvMlS8Kkjxy6yB+ZXY+ZPS5qHfGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9rep9Yw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9rep9Yw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88F3C4CEF8;
	Thu, 27 Nov 2025 10:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764238479;
	bh=fOrEfPt4CyIjoFDbsINEfxhlO/2CC4QDz09rq3zRkZg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=I9rep9Yw/fe3sPLN7vX3p8F1hFxbM0W2KJsJI04VRDI8dPiO92hK5IWImf+Reuavk
	 u67mZma/H3RQqxC6Wuw60r95fBNgE8YBuKo0OtsmCmn0JtFPCmZ0OIj04Ho8c5Ar8f
	 q5czwAzPDCv6hbU1bDdIbhFlW7G0WDM9LFli0kNBGrhqWCPcUML9N0Xxewls3TgMoY
	 Yq7r0ASvzaw5yhcin7Z4uWDVFX1lShrTo6DIvJVSCXpaV07fCYwNdc4sTzMz6GqJ9m
	 UoIAm9LJcLdSN04Phi9aZIMHtMCZCoCNSByHycYTX+6Dbib5pMkq00UoDFh/cwaKgb
	 dVrIUPbC2iouw==
Date: Thu, 27 Nov 2025 04:14:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lgirdwood@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, 
 linux-sound@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
 broonie@kernel.org, krzk+dt@kernel.org, perex@perex.cz, tiwai@suse.com
To: joakim.zhang@cixtech.com
In-Reply-To: <20251127094301.4107982-2-joakim.zhang@cixtech.com>
References: <20251127094301.4107982-1-joakim.zhang@cixtech.com>
 <20251127094301.4107982-2-joakim.zhang@cixtech.com>
Message-Id: <176423847735.3729710.7318748928359039117.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: add CIX IPBLOQ HDA
 controller support


On Thu, 27 Nov 2025 17:42:58 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
>  - add CIX IPBLOQ HDA controller support
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/sound/cix,ipbloq-hda.yaml        | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251127094301.4107982-2-joakim.zhang@cixtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

