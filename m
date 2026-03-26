Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337DE4070F2;
	Thu, 26 Mar 2026 16:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542781; cv=none; b=TDWFhiCN3AeUh2sg8f7YU6KMiHPx5adTdFq3ogy5k7qs3KyduQxZeuTexejdhquOfoyRSUwBjDW84XWGaGWbOjyZ61I24T6TgUezBh11mUJKUXPzy9Aj76Q62trbrIXqxw3vqsPpKhPIJ1UJSPYEeFkGT/bqiWP88Bz1zW7O4c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542781; c=relaxed/simple;
	bh=/25y2CaZKQmBZNRvI6Wl24tasPq9KSEN9f+Y3k5KuKw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=cxvl2Dxz9e1jkRzEXnZb2RC/iS25K2RqzIobRYdCqYKfUCbBWLTFRsZCkrXIvdjW4eVwCnUEgy5TvJwvvg73jdW2X5uuRIxKfVxtM2VDQZytyOefqxH7pz/nWBVeonuyjGjnzGVt1rtl3P6hObTH/yENCc427MzCA3IwbQ7diAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OL2srYkV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OL2srYkV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89EA2C2BCB1;
	Thu, 26 Mar 2026 16:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774542780;
	bh=/25y2CaZKQmBZNRvI6Wl24tasPq9KSEN9f+Y3k5KuKw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OL2srYkVAZDkAXo/GUV6xJ0I2zaC5yFrtr3NG7sT9GsU5Wab8psX6LCchpVTnhdwA
	 tvIF7nlvXWnEJuMlYK/JqDOtpC1UNMqdE8/1E+jOLJ8nHy/5AqUbQLnRm2Ytzk59Is
	 0Jig74tQdtkjLg1z8eyx55QHCxqF6CveWoDCMBNKj2JqQ1crxq7w+rvKtSmCBNOB7K
	 IQm2BsfqC2+4xORtKdZYr//cR4dgdQrgsjQFsBH08DHGFon0T23s2i492cuJGmtlz1
	 d6LioOG+digkt4V3GnOF4Gv5U4toAJjeEXOWnw3dmFSo4B+kPrLHkjqGgCtFaB8XME
	 ZTbUHqzf02g3w==
Date: Thu, 26 Mar 2026 11:32:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, broonie@kernel.org, 
 conor+dt@kernel.org, k.marinushkin@gmail.com, devicetree@vger.kernel.org
To: Padmashree S S <padmashreess2006@gmail.com>
In-Reply-To: <20260326153041.496811-1-padmashreess2006@gmail.com>
References: <20260326153041.496811-1-padmashreess2006@gmail.com>
Message-Id: <177454277698.110132.16843010568181790581.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: sound: Convert pcm3060 to DT schema


On Thu, 26 Mar 2026 21:00:40 +0530, Padmashree S S wrote:
> Note:
> * This patch is part of the GSoC2026 application process for device tree bindings conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> 
> Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> ---
>  .../devicetree/bindings/sound/pcm3060.txt     | 23 ----------
>  .../devicetree/bindings/sound/pcm3060.yaml    | 45 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/pcm3060.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/pcm3060.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/pcm3060.yaml:45:7: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/sound/pcm3060.txt
MAINTAINERS: Documentation/devicetree/bindings/sound/pcm3060.txt

See https://patchwork.kernel.org/project/devicetree/patch/20260326153041.496811-1-padmashreess2006@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

