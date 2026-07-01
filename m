Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9D03546F4;
	Wed,  1 Jul 2026 16:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923981; cv=none; b=MbVtXMSWXI8wmSC2lr5g7MZaMRW6XKR/x9Ruk6Onp/88fE4MgMl0Vg6vZy95spHRPKdylwhUqqntq7QhhR/Y8J1gfXEq6TnTlhv86QUDXNDfTQj785wunJKikDEwC4cRyFfhJYHJFxjwJXzhIqGwrdIyZnxWyP0xo1gfqEHZoIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923981; c=relaxed/simple;
	bh=lyrUvzj5pLlGxX1N07kXljqauk/KN3qGL9p1a8s1nqg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=q/oimM3Or0ZpFay4g9bVXR1iGPJCqJ2uwyLLjfPFXW4LwxHiOwlTC1yeWWE3SEZenSZ/AJMCXAs1+/2PC1grUrXmkB5XUHCdPn3t27t/52fAiVvhS577l31apxMquz0HfGxg6gGvgCOkJ1t/8k4RWkqXrMWq66SutqsJlfPgwao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVmeTFIC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVmeTFIC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B971F00A3A;
	Wed,  1 Jul 2026 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782923979;
	bh=iFJvphVUXGIaYZvKHbf0CeauF0PeInNAnQUDmyOVt+s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=cVmeTFICLio+/M6sDlp7kqNetzFOziVDjnPdGSa4kCvThn4Zn3TCsIjodRgwxucYe
	 y3hto3FtmItD/mRog59T6Dphf0zAj+hOZbLHi01NtHbjMqnICpvBjemVVShXL2KWlp
	 FPdtET7XzPdnA12N6CNfkug9hV144FQQRWkLMPBvd/N+vtcB4Enfy0OOQSO4HFdoB1
	 wwRzDOzbOa9uuZnBnB/YI+q+DMNzoCL8TUhPgxdu3mPFBqDQ7X89dkO2MKyBlInFo5
	 Y/ggflvCfGc3aLgPAhy89W10hAP/N4AYDGaYfJStLGqwKqwgc7JgbqOFfZ572meOK4
	 Cm4o37QLVGd/g==
Date: Wed, 01 Jul 2026 11:39:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com>
References: <20260701135913.1641328-1-prasad.kumpatla@oss.qualcomm.com>
 <20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com>
Message-Id: <178292397778.969422.10745443574988528449.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add WSA8855 bindings


On Wed, 01 Jul 2026 19:29:12 +0530, Prasad Kumpatla wrote:
> Document the Qualcomm WSA8855 stereo smart speaker amplifier.
> 
> The device uses a PCM audio interface and is controlled over I2C. Add the
> required supplies, powerdown GPIO, interrupt line and optional battery
> topology property.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,wsa8855.yaml          | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
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

See https://patchwork.kernel.org/project/devicetree/patch/20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

