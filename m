Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6E234CFD6;
	Sun,  5 Apr 2026 08:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775376584; cv=none; b=M0QiiAtSG5Wqn0yX3XD0xf9Eu2HOLpAIaDa2eXnyvZS+hf046Z5gjVlMH/ggblYuoY0MXI49V4Aj7P74vEFI5jPWXMb4SKjnr3zQgzhhz1qHTEmfT6ZqqE3/ESgo91dvOrFnmODZYze40laloCSyCw66Ov6PRtCmjx4+cnAKcrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775376584; c=relaxed/simple;
	bh=tmwI+VqD0Msey8y4xzbIo39Fptd9tbedOvW8qNkYZAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUz6O/tX/FDW2libSmxtM6FLY9RQej9l1/u/yXGOpJMQhSir8o5xfzp6YP8dJYlbnxJTNdhlO+xmvFbQ7dI7pdE8Z/Mtk+QV30JaY3LfBKaGPO1ArzEKvwlY7hXIfaEzpJrVSdMPAYmDTT3yfJh7AKe+AJN2z+BSLMzOt7Cvq5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGQdgBbm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGQdgBbm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DDDC116C6;
	Sun,  5 Apr 2026 08:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775376584;
	bh=tmwI+VqD0Msey8y4xzbIo39Fptd9tbedOvW8qNkYZAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GGQdgBbmxN2ecBSt7z+PQHKqlxJyp16EXZ7lvUbvr4ZxxHQ43V3FWb9USUj8Eb9YS
	 i7xU8eND2CQD0I6q8RsU/p7O30XTrPKLHCOjy+bw0Rddh2Qcjg+MOHj/3AEQOMe0Eu
	 K5q6RjAH96cmfuQY5Yc04TAI4ffGG1455YddgPWstLLu5k8luAJu/ndBNX7jTgMdDo
	 CIDu1eSyN0notTHpbdtXiRHXFjfPe77qfaA28orsQrWglZgqp6sJzXUgXG5AO8u4Rw
	 2mAHvMAIrK93/8Voi+vIV0tZWBIQb2VXNWNh1UFdwlrpisWbtIU1AuSwSd9QL7q+D7
	 seteuZPefoE8w==
Date: Sun, 5 Apr 2026 10:09:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: devicetree@vger.kernel.org, Baojun Xu <baojun.xu@ti.com>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Lu <kevin-lu@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Shenghao Ding <shenghao-ding@ti.com>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: ti,tas2552: Add sound-dai-cells
Message-ID: <20260405-wild-neon-dachshund-80cbd2@quoll>
References: <20260404033709.340026-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260404033709.340026-1-marex@nabladev.com>

On Sat, Apr 04, 2026 at 05:36:56AM +0200, Marek Vasut wrote:
>    For system integration the dt-bindings/sound/tas2552.h header file provides
> @@ -34,6 +34,9 @@ properties:
>      maxItems: 1
>      description: gpio pin to enable/disable the device
>  
> +  '#sound-dai-cells':
> +    const: 0
> +

missing ref to dai-common and unevaluatedProperties.

>  required:
>    - compatible
>    - reg

Best regards,
Krzysztof

