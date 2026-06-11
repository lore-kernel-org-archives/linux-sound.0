Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238202D781B;
	Thu, 11 Jun 2026 10:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174778; cv=none; b=PT7SlvuzCDO/jcyalowEAhR/R749bp1QSow8pGhc0LDecd/GyaALsbuACX4W95+qI3sFLP7H5bBGAd1ujx2dV5OR5aUMHRSIZJoNWdzA4OaGiMxK7GB0uZUyEAMUXwXZ/goqdjhn06j3o/Z4oc6MrAH8eYkKyTpmbP+OaAZ7JWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174778; c=relaxed/simple;
	bh=QsiHkWfdNmCPX5u07Ofw+nNZ8TJYXkBA17BxCXwB3io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XY4UW8HerTAjOV5vdL8/6dSo1a3T0EwQ/irc3NB315fqmF7RjkOPSKe/n2Nh5J0PCJg8skOKW0ZnnRCyw6TwlOn7IfF3f6b34adAXmwNNnnB0+JlBdv0ngtAHYEmLAo0pfrNvLmWeDb2Exh8TvRXeKxc7V8ks3PPPX7FLYmvsH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooHBkqut; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooHBkqut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD101F00893;
	Thu, 11 Jun 2026 10:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781174776;
	bh=furI0+MHVL49gR01ZbKeSafo+ovoNrkDtQAIaMuoypQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ooHBkqutyPu7zm8JXx5ddEVVb7YO27wnYXELIQAPLkUzbqbsT4+dK1s32ROBB2djZ
	 q7+Y4v+x0G+3aN/uRLDxfwAxpotke/kDEwAxDa3+E72x1BuUTAKKnoGyjhu1XPJYhx
	 haOcdyFD/00XCgPFYkXe4oLh753UoDHokehIhju/OYm9oC3SB0ajaBYRQXp8JlSL55
	 VNirN6TjNqw3MslSieVd79CmCT1uwr7llgmVIdGxW9JNw/RkNNQl6oHBuecpoM5SRG
	 CI36rGwZMuK9nJUDCw+93rv/Qqd3nbwts0pOJI/23nmNVL+eOPUiFxHYMT+tsDvIT7
	 5IJvzKD6b/bvg==
Date: Thu, 11 Jun 2026 12:46:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, 
	devicetree@vger.kernel.org, tiwai@suse.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Subject: Re: [PATCH v1 3/7] ASoC: codecs: ES8389: Fix the issue about mclk_src
Message-ID: <20260611-likable-ultraviolet-moth-fdf2f6@quoll>
References: <20260611031824.4628-1-zhangyi@everest-semi.com>
 <20260611031824.4628-4-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260611031824.4628-4-zhangyi@everest-semi.com>

On Thu, Jun 11, 2026 at 11:18:20AM +0800, Zhang Yi wrote:
> Fix the issue with incorrect modifications to mclk_src
> When the system needs to be configured to use the MCLK from the SCLK pin,
> the code still sets the relevant registers to use the MCLK from the MCLK pin
> And setting `mclk_src` to `u8` is inappropriate,
> because the purpose of `mclk_src` is to determine whether to use SCLK as MCLK.
> Therefore, we will change the `mclk_src` member from `u8` to `bool`.
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>

NAK, same comments as before. You just ignore feedback.

Best regards,
Krzysztof

