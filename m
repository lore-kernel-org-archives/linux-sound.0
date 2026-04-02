Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082E433D511;
	Thu,  2 Apr 2026 08:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775118579; cv=none; b=tNq/jK0YdX/Ubdu4zNKEn/mb+RWTXR26DZemC9/KPMZe4m/+nMs/qjls9M99qjiw9we2NZuZCKtPhORlykw0WxWkogbPFR/F8Pm2PSYyOtO2lMpJ/CbNZXMFxDo+GSix9Cawp+qH+u7H2HJdttdwVT6nfIY/s24oVKO6A5yI/PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775118579; c=relaxed/simple;
	bh=KikKJzOdwVazwBUTNG2rP5Lfumhuy30rZzv237IjEIM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=NzfJ0q01k2UfyczhdHOYhFWGvfwxJahCKhYXpIqRRB4gLnOFB5Lkx/MJJRnvbRVdDbktIH17CRISs+pLOd73tCZ4ECCxKT7Qv3Of3Fb3Nwa/6Hz3NmOGnJD4gHwx/pRk+ISRm+NEgiBTUu8NYdhnWJeExvyCtIWaCr459Xk7uP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHsyIUEB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHsyIUEB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A767BC116C6;
	Thu,  2 Apr 2026 08:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775118578;
	bh=KikKJzOdwVazwBUTNG2rP5Lfumhuy30rZzv237IjEIM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZHsyIUEBqmZw8ekvbML8DP1G9rAVH4l4Lm9wjmRLkOzyxMycU8EqwxK/osREh7BBV
	 ifbPP2zKWINXQbPWtZXu0a93llfFMRsP1r+ukUUEqkgBpLX1Qe4D3T4PlrA9cutn3b
	 SYknrfz0lI/3hQA9yUKGaoJRgPL4uqewPSyfon+CKU/440jpmARyqVYKtoaE6uHO49
	 Kfuyr3/OJ8FlDyQ7aFjt6uOF1c9ugcDYb+vksW8O1LM4McRfB65NJpT07bHT4Y7s+a
	 dWtJv6xL89RcJX2d2mp0gu5jeZ8eV5QGaWT/lvidOdByyrGI5P1TY5SJu9wAsfJDjx
	 +aAJQTiFyM2eg==
Date: Thu, 02 Apr 2026 03:29:36 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>, 
 devicetree@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>
To: "karthik.s" <karthik.s@oss.qualcomm.com>
In-Reply-To: <20260402072256.2811085-1-karthik.s@oss.qualcomm.com>
References: <20260402072256.2811085-1-karthik.s@oss.qualcomm.com>
Message-Id: <177511857667.2917822.6371182180784837499.robh@kernel.org>
Subject: Re: [PATCH v2] ASoC: codecs: wcd937x: Add conditional regulator
 control for wcd937x


On Thu, 02 Apr 2026 12:52:56 +0530, karthik.s wrote:
> Add has_always_on_supplies for managing regulators. Indicates that the
> codec power supplies are provided by the board as always-on rails and
> are not switchable by the codec or its associated regulators. This implies
> that the codec supply regulators are always enabled by the system and
> must not be requested or enabled by the codec driver.
> 
> Signed-off-by: karthik.s <karthik.s@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,wcd937x.yaml     |  8 ++++++++
>  sound/soc/codecs/wcd937x.c                          | 13 +++++++++----
>  2 files changed, 17 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml: properties:qcom,always-on-supply: 'type' is not one of ['description', 'deprecated']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260402072256.2811085-1-karthik.s@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

