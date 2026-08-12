Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1D6367B6E;
	Wed, 12 Aug 2026 19:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786562916; cv=none; b=H2fvWWhR5q3wmbGNPO3YGejvCDWYHSuohFATq53G/6bnYiGORlppAoLiCEkQyMFz8hRgPSyZRStnB04/SqvU/DThlow5zmPQn2DH/XNKj4B7yv34DISoGeqbr1+GZv7YoZXRJDmKVFEq5r3Y95qbwMLQ4usMLbI/P2PtLjzQxew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786562916; c=relaxed/simple;
	bh=dLji2N08zZSswpPPX2gbv/uuw8PM5LEyvne8vmueYt4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=URgjeQ/oJkfr7s/wP20tHmdcUd67v+VjowRF9FO/LaHdFCDJYOG1oZHbn9Xf4La0IJYDhv6yUlzWJ8e6pEikipccU7qRuEJ6QjZyWljh5DEVtGD8pcIcHF1dgcxNOqdCrHipaL2GL628fUs/SwZ+nXDj0UenEX3tGJTJz5BIZQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jue82MC0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jue82MC0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9161F00A3D;
	Wed, 12 Aug 2026 19:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786562915;
	bh=XpdC2s+fmds2ewrhQhKdbytAxObOi+Lk6nEA9HAeFFo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=jue82MC0SfYbsxnIRJA0OgjYty/dye6o/EY9OcuzF6l+/b8nLQgBcFz1YnLTYybPB
	 qIdDO2/U0DyW6V+LYZgbrcCJCjc+f71Fr01hiOBULX6gSK9OfgGYuHgH7FRrb5Vr/p
	 SjzRwfQ6bSDp0Q2w2g0Z3nZ7pFmxRV8WhpjDIn/v8aWOaEBegNImxhSMY68Vrldvbq
	 6+FeONqKqcrFGvmJYS9GPKwe1Bb1Dx2B+43KW4uKc9i4KvNDI7amz/bbEjd26By9DV
	 tzHF3hGWYbKilcIOJ//iHLhEF42f5mBiuMpYolLmE2dwLXHeYzpSP9yBPjHRzhFxcK
	 3XLrKukAhdQjg==
Date: Wed, 12 Aug 2026 14:28:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matteo Martelli <matteomartelli3@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Roger Shimizu <rosh@debian.org>, Daniel Drake <drake@endlessm.com>, 
 Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
In-Reply-To: <20260812-es8316-regulator-next-20260722-v2-1-e7078bc9bc9c@thundersoft.com>
References: <20260812-es8316-regulator-next-20260722-v2-0-e7078bc9bc9c@thundersoft.com>
 <20260812-es8316-regulator-next-20260722-v2-1-e7078bc9bc9c@thundersoft.com>
Message-Id: <178656291392.677456.3887097935460488837.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: es8316: Add regulator
 supplies


On Wed, 12 Aug 2026 17:35:43 +0800, Hongyang Zhao wrote:
> The ES8316 has separate AVDD, CPVDD, DVDD and PVDD supply inputs for
> its analog, charge pump, digital core and digital I/O domains. Describe
> all four inputs so boards can model the codec power topology.
> 
> The binding also covers ES8311 and ES8323, whose supply inputs differ,
> so restrict these properties to the ES8316 compatible. Keep them
> optional for compatibility with existing descriptions.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  .../devicetree/bindings/sound/everest,es8316.yaml  | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/everest,es8316.yaml: allOf:1: 'then' is a dependency of 'if'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/everest,es8316.yaml: allOf:1: 'then' is a dependency of 'else'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260812-es8316-regulator-next-20260722-v2-1-e7078bc9bc9c@thundersoft.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

