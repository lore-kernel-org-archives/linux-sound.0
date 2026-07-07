Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7490D405F7;
	Tue,  7 Jul 2026 20:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456405; cv=none; b=tb2lGyhW3gWvgn1QSeiIWTfV6huw1xYpkpGb3wUUog4YN1FcweLNiIFrh2WWJYTXxQ26+Jls7DX5XACXfDpvPlx2pDV13tS8gJ7Y3TAPzBAYdHMEh8cVQPY8o4tTWHn41yxoMa8r7pMAh4fD5ohFB6bQJNR9b4R92Afe5kQ92ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456405; c=relaxed/simple;
	bh=2zTAVaV8VN5KVWGoTqC/qjtXDOP1mMzZeiCBKEyglqY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mkFph5AIpvHckdC/Y6JVfPjfPXf2Tv35GQ1Tdzvp3XRnY8q/3bK5xlzsp7+V8NdfrLKIx7t0xisTllyCWnKJ7IAZVk3wKdcFeYxjDdaUvsCBB6apZ+NJFOZlw1J1VLZllgjiTheWXvRK1bCwxVbbaNIkl+16yQ8SP/6/cI43B9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hgd/wYoH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hgd/wYoH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C217D1F00A3F;
	Tue,  7 Jul 2026 20:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783456403;
	bh=8mvPe1nt2cZ61D/veemOO/Wf8MrpsZ8gG2wS5WBYwu0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=Hgd/wYoHOe5yhHYSr29XUoKjSh2h8/a4wZEau9WSEDQCLrxazcPY9OnJEHMqfzqQa
	 ip4Efiq9O1Gp2lnpW38ytStCYaTAmjpsB7ASGeWA9Kfx4JqEScAZEGVEQdWpBqYmwL
	 LJIeN48XEn1vVy5xTAN1dMORhNoNg7I5AT7cZ32fapmkEHxMqj0tO+VOpTjJVi+0S7
	 8uqa0tsbL9hXrSgpyFuKGSGEzCvMKRNrZFi7KDCa2aTyV7o7KfcwYhfxyd8Qd7lbDT
	 RpVBmcJmVuC96Js5QGeMsFJjQEC7jiOrjy+T98KS2gGaomlRzujxqBBvVjMK3pQkID
	 zWKqEvklXLSaw==
Date: Tue, 07 Jul 2026 15:33:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260707190106.2876465-6-prasad.kumpatla@oss.qualcomm.com>
References: <20260707190106.2876465-1-prasad.kumpatla@oss.qualcomm.com>
 <20260707190106.2876465-6-prasad.kumpatla@oss.qualcomm.com>
Message-Id: <178345640307.4113079.1879467469002132914.robh@kernel.org>
Subject: Re: [PATCH v3 5/7] dt-bindings: sound: qcom,sm8250: allow TDM slot
 properties


On Wed, 08 Jul 2026 00:31:04 +0530, Prasad Kumpatla wrote:
> Allow the standard TDM slot properties in CPU and codec endpoint
> nodes.
> 
> Some audio backends operate in TDM mode and require the slot
> configuration to be described in Devicetree. The common TDM binding
> defines dai-tdm-slot-num, dai-tdm-slot-width,
> dai-tdm-slot-tx-mask and dai-tdm-slot-rx-mask for this purpose.
> 
> Permit these standard properties in endpoint nodes so TDM-capable
> links can describe their slot configuration using the common binding.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/qcom,sm8250.yaml:88:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/qcom,sm8250.yaml:115:19: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260707190106.2876465-6-prasad.kumpatla@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

