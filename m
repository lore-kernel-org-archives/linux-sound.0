Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFE529ACC5;
	Mon, 13 Jul 2026 21:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783977779; cv=none; b=KBHJcRmAL+lEUZenHDXiaOVObjbztVvz/Jd97TbXTP05R3q55jVmIIMUhfcJzTuFELFKQX5J+6K4dD2V3zekymaEPHrfvQngNVQjJ0xOPU4bDFdTrwXr4+B6jn/u8OhRiJV/CWvwxT0unH+hxd+XLd7geKFJi7Eh6ypXxvgqhJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783977779; c=relaxed/simple;
	bh=DtMAoPkaZZ/TOwAv+N+0avcFzt9PPbgv2ZN0LuHdpqs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=eBk6F4hZ+gvI/W1IYghvdnVhp1qzjG5EGk+V3FN2cDzJPn8IgLGLm6u41JtpnTABIWuv7fpWz5XzTTGr0lKvXy1+kh/2ceI9BMJKeBFklfd6eOl0Oj8yovWYSeHg09szfszdKew1Lie2TQTUmH9pvFO3r+gW3BjzqgwEBku6788=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjHDV3q/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjHDV3q/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8709E1F000E9;
	Mon, 13 Jul 2026 21:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783977777;
	bh=jWG0/rB6xvK8ubb2dgXTEYCJoQiVYSZPHeWSP24sv5E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=XjHDV3q/o3y2O7ADrG/mJ7ILKj/XbnAsAY8MRtW1MDghH+ZN3cgusyX8uKt7K+AO3
	 ejUOvsa+RVzCm4KajFtYakiWo1qhCn9F/1HHlvGJBc0cpB2HPemvTny+BfqMdJryc1
	 4XOrum0jmJZCS/LAjuSzzRhjn5YjKgRBX0tZujGy9BMWrgy27qHfGYSWYAU56CAmsh
	 2ZYwGqfqy9jp6dFCBph7dJ1SDn8S1p6fdg6VzkWTdlklKrhA/3bD174rNBfWNuy+qX
	 6YnIj4CB5mhLs82J9ztfyjp+HZeqU9Yj1TdA0tEsdAoNEdkbR4R8diQY71zZrV2CAg
	 PJG1buZvPxstA==
Date: Mon, 13 Jul 2026 16:22:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sound@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-arm-msm@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com, 
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 devicetree@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>
To: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
In-Reply-To: <20260714-master-v1-1-1ebe5993225e@oss.qualcomm.com>
References: <20260714-master-v1-0-1ebe5993225e@oss.qualcomm.com>
 <20260714-master-v1-1-1ebe5993225e@oss.qualcomm.com>
Message-Id: <178397777689.3016926.7029134483948462437.robh@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,lpass-va-csr: Add
 HeartBeat pulse clock


On Tue, 14 Jul 2026 01:35:32 +0530, Sarath Ganapathiraju wrote:
> Add Qualcomm LPASS VA CSR rate generator node that exposes
> the lpass_heartbeat_pulse clock on hawi. Also extend the
> qcom,lpass-va-macro binding to add qcom,hawi-lpass-va-macro with
> its four-clock constraint (mclk, macro, dcodec, heartbeatpulse).
> 
> The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
> start of the DMAs and Codec Interfaces for the audio usecase
> and can serve as a periodic wakeup source for the DSP.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,lpass-va-csr.yaml          | 47 ++++++++++++++++++++++
>  .../bindings/sound/qcom,lpass-va-macro.yaml        | 18 +++++++++
>  2 files changed, 65 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.example.dtb: va-csr@7ee0000 (qcom,hawi-lpass-va-csr): reg: [[0, 133038080], [0, 57344]] is too long
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-csr.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260714-master-v1-1-1ebe5993225e@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

