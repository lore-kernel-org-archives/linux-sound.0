Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E633B9D81;
	Thu,  9 Jul 2026 19:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625463; cv=none; b=aSEO2ZRuXs8tXeMeX77IGzwWfJNoLSNwpdCHS8A7NdOIOOjGjkXPDqlKa9ph2TCwfSSuPgZ3/9idIQ7SgtlVLt/hRUrA0aQEpes8X86C7AzvVWcJb0AlfG0YNNVRHzvNhTSj0sacbNj/iLorelVLlEE3J6WXUePNiQ70hCtROHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625463; c=relaxed/simple;
	bh=KD5GNSqifg8n6r6Za1C9Xqk5m8sCxsxNzNP2ZOl+x6Q=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KjCk29lHoP6J4v82waAKVlygNrY0K8lGHAgCVL46z0RhPf/0AjCxCNzMLeKjwDXj2FpghMa/XMr2QaIUxPoElGO554m1V8PKOgwjo0IVus83A2e/VLU9u8v9zL7syLINzdohso6JyyMsZ35l+lKBkof8YBv90ASAv8Hyqf0Zcog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XDjHB93p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDjHB93p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424D61F000E9;
	Thu,  9 Jul 2026 19:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783625461;
	bh=ocwF/ZKxDBjhnuSvPieRUz+GcrAs71RhqU5rwB0f8OM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=XDjHB93pSzbStDdD5N3SYByBMhh1JXyMy9xjSTZVdt+4VJzoGJuIrARaAhKYEqBYz
	 gtqsurJ02WWXqGNZZVZk0GFMFD7fwiPY2y50URmT8IdFXLHTz8pMyb5MPlMo8fpUMC
	 1HhTEOeDVxf2viwelljtFoOlG4FNe6MbYQN+b5/8MnZvykrh2UaVf7alUHXD9M6aag
	 WaoTKtF7Ome+tR9zE9yK2OH5gCuoY0jy6seQfAwAM7mqqELV9T03ikPkB/qWg4j9iG
	 vuLD4k0IvPJiiURqv922cEJOKnrba/rTr9F9TfPLfoNlmfl6pSNpOl3IhocDwm7cod
	 M6etv5go0iI9Q==
Date: Thu, 09 Jul 2026 14:31:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260709175915.3805851-2-prasad.kumpatla@oss.qualcomm.com>
References: <20260709175915.3805851-1-prasad.kumpatla@oss.qualcomm.com>
 <20260709175915.3805851-2-prasad.kumpatla@oss.qualcomm.com>
Message-Id: <178362545943.1021343.12928472425962817382.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: qcom,wsa8855: add Qualcomm
 WSA8855 speaker amplifier


On Thu, 09 Jul 2026 23:29:14 +0530, Prasad Kumpatla wrote:
> Add bindings for the Qualcomm WSA8855 stereo smart speaker amplifier.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,wsa8855.yaml          | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,wsa8855.example.dtb: speaker@c (qcom,wsa8855): compatible: 'oneOf' conditional failed, one must be fixed:
	'qcom,wsa8855' does not match '^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$'
	'qcom,wsa8855' does not match '^qcom,sar[0-9]+[a-z]?-.*$'
	'qcom,wsa8855' does not match '^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$'
	'qcom,wsa8855' does not match '^qcom,(glymur|milos)-.*$'
	'qcom,wsa8855' does not match '^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,wsa8855' does not match '^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,wsa8855' does not match '^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,wsa8855' does not match '^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$'
	'qcom,wsa8855' does not match '^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,wsa8855' does not match '^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$'
	'qcom,wsa8855' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,gpucc-sdm630', 'qcom,gpucc-sdm660', 'qcom,lcc-apq8064', 'qcom,lcc-ipq8064', 'qcom,lcc-mdm9615', 'qcom,lcc-msm8960', 'qcom,lpass-cpu-apq8016', 'qcom,usb-ss-ipq4019-phy', 'qcom,usb-hs-ipq4019-phy', 'qcom,vqmmc-ipq4019-regulator']
	'qcom,wsa8855' is not one of ['qcom,ipq806x-gmac', 'qcom,ipq806x-nand', 'qcom,ipq806x-sata-phy', 'qcom,ipq806x-usb-phy-ss', 'qcom,ipq806x-usb-phy-hs']
	from schema $id: http://devicetree.org/schemas/arm/qcom-soc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260709175915.3805851-2-prasad.kumpatla@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

