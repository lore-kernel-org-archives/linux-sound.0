Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC232DC765;
	Mon,  6 Apr 2026 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464872; cv=none; b=dpVikN69Bf4xGGghPYhASx9wvK1f4fBdga/5yZPUXyP9bKyMsIVXnhrPjC+3iykvQTqT6IotyQ2PnNLGZ9HFcgKHFs0fbhcT6EhpRYH9uad/2WIkkaztTSditlK6XjWjfWGs6XTYaaaPwtHLMD3nFGMm21tXNXQ03ZgJs733s8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464872; c=relaxed/simple;
	bh=5w3UxxCyMcyv7PvsX7wGnohB9nkyoJKB0MQ+FMfrkqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHh5PxWQcfxqYoEVI/JQ9yf1p6G9w6VibaM0Cd2MK6p4pmmpX4GdSE67fvQCglT2JjC9z+qJpYeWH4fOYzynQqWr4kCNGaJH+rSy8CeLeDzDDR4l5a1MjFHDahDNLSZre5NBNj5BNeFuS8A7HBPVfKwOEeoyK0KUJ5GfeEBeduM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4e/na6r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4e/na6r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19D0C4CEF7;
	Mon,  6 Apr 2026 08:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775464872;
	bh=5w3UxxCyMcyv7PvsX7wGnohB9nkyoJKB0MQ+FMfrkqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W4e/na6rb/NujRRsEkmyhdJIWYBEMFT9VMbCqVl7fmTTpdwBk7cDJZ02swAdvTbwF
	 IYsc+TAFJRwA9OrxvpmYFuB1LyPpyvXwuyBANUxztJe93Uu/qaA5x9Q37OTkCWe25q
	 5YCFw0JsrZYD1a5mNjpDL3aiHE0tLDS4Gb9wYBblgl2atO+Cdj0Ax0VdJNAcBK12i7
	 O4+pok0CeraBMy7jmK2ZF26YeMmpo9Iha82RhCnC/kh6OPlE6kdGcO3aQ4MLc9zRdU
	 Rn1kAlFeP4DY1uP0vc2f3oz5RaJgBOJ9777dHWbv30Fs+n7YVdicHOmadUbS/N+0Bm
	 7Pgt/zB30Y2+w==
Date: Mon, 6 Apr 2026 10:41:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: devicetree@vger.kernel.org, Baojun Xu <baojun.xu@ti.com>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Lu <kevin-lu@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Shenghao Ding <shenghao-ding@ti.com>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: ti,tas2552: Add sound-dai-cells
Message-ID: <20260406-furry-shrew-of-research-91adf7@quoll>
References: <20260405234502.154227-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260405234502.154227-1-marex@nabladev.com>

On Mon, Apr 06, 2026 at 01:44:35AM +0200, Marek Vasut wrote:
> Add missing sound-sai-cells for this codec into schema.
> At the same time, drop trailing spaces from description.
> 
> Fixes: 506e0825a4c9 ("ASoC: dt-bindings: Convert ti,tas2552 to DT schema")
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

