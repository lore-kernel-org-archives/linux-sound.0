Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38C117C66;
	Fri, 28 Jun 2024 01:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719537741; cv=none; b=cNRYvSSW1kQVevOAEcWlUQ9Dsn38Bxh6JnzZ7DcLn7hi06PQx3vAggGURgFECN8qebLJlicGVNwAGMPCHPD/02XsETIXpP2IMhRhThEou8wAp6IZIWrWfneCZTCezVH+zRb3rPQYSZevxLFY01QN7QWZu0jf/EYmLeeH4/TlWjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719537741; c=relaxed/simple;
	bh=AJLz5VAkuoXVS1fXlmi6BrlI1yrlw5hda47w7YqqYmc=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=YMYj5SbrdD7u0elJDN9sbe0huRE5tL2f2RuyQbo3JLjtPul7j0oXBFHanVnWYDy2YpFU5wgDlhvduPhiL2Lws4aLvuPgAqRNUIaOWt9xKKD3WqiKig6NIQdI8CIFvrb5q8pPsiJu+j7sgbomtTkUniuUBx6Y2W88/vJ3mD/Pbjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnpC4OYw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnpC4OYw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26F6C2BBFC;
	Fri, 28 Jun 2024 01:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719537741;
	bh=AJLz5VAkuoXVS1fXlmi6BrlI1yrlw5hda47w7YqqYmc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=MnpC4OYwCyizs9pVD+MEnAPAKv8deRKmGOicyOs/yYTZZ03uoRgJZUgHdAzAXISIw
	 UwDQmJyYPwhpIMQb9izDFD00GDbstL/hvb8nSEWy+pmZVrlTJkPy04Vi+FPbEKw4+D
	 UGFyG1oJ+g90wmPLz8y0cmHreDmPmBcMV30HTOYTZIk1R8T0BwlB1ZhU6A6+EXhwfu
	 honAyNUZl9dP5h3dHZAE0wf30npJS5hs/BORQTg3yFnfNreA9kP5C2qAjObRsAntj8
	 eZhOsccS9JSfL82L1+HwVkPsZxQas4QUPh+3oL9uMwBu8qJtUAQKQ/AdbMElNVhiGu
	 gVpReZvugtcSw==
Date: Thu, 27 Jun 2024 19:22:19 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Alexandre Belloni <aleandre.belloni@bootlin.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <87jzi9apcd.wl-kuninori.morimoto.gx@renesas.com>
References: <87msn5apey.wl-kuninori.morimoto.gx@renesas.com>
 <87jzi9apcd.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <171953773961.1035497.12432679100328649698.robh@kernel.org>
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: simple-audio-mux: add
 mux-names property


On Fri, 28 Jun 2024 00:22:10 +0000, Kuninori Morimoto wrote:
> simple-audio-mux is designed to be used generally, thus "Input 1" or
> "Input 2" are used to selecting MUX input. This numbered inputs would
> work, but might be not user friendly in some case, for example in case
> of system hardware design has some clear labels.
> Adds new "state-labels" property and enable to select MUX by own state
> names.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/sound/simple-audio-mux.yaml          | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml: state-labels: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/87jzi9apcd.wl-kuninori.morimoto.gx@renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

