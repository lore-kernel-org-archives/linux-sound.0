Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584AA495E5;
	Mon,  3 Aug 2026 06:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740143; cv=none; b=bGGI1prucuuiOykVa6gSVhe+VJWl9KshCQ431xzF7z4xlI1kSWsow3v1SH9zb7JshglTNisRq5ZhLatvd9K7FeyoDeTSNnR4MdWu7RKY321BEDhn4kR5pIFUbEELOIpX3wC3OgPiOnig4owCHCJU43BAO75pc+07r1cj22bz6So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740143; c=relaxed/simple;
	bh=da9r3/X29xVRhzzo6XGWlccoevkGxMlYFjGTtlUDSFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0moXVQArM+HLKdOGuJ/6crYKyFlrbaJexXnmROQxej7qF6koExxeVFTH4dNkMGTqMeawEgrfPoNtC6A04Ihq7+EZCKOxjrcTiHwkz/j23475eueKXP570N0xXK8nicqkFzrkq4X/hJJ7hXlYX5ZRtsx523OZImnr3abuuIgqBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9Dj7qMx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9Dj7qMx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043711F000E9;
	Mon,  3 Aug 2026 06:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785740142;
	bh=0bPdVfAtocz9IJuP4lWPc9+AnBop7s4nhEuFhT6VnJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M9Dj7qMxbhs9Fo4BnCZp2LhB2xTUJNEMEK2A1WKeqhC8EIFF02YR7xXFnnEvOXn6u
	 Dqbs5zG89lfenbQV/7NtA+UGOE01NWjQvwlt89iQKSTBQuCHoLd8j0xocBbtJtentZ
	 DlVIS56SsLOjjq6j6G81KyX8bOraVcLfB/oJs4dE7iEYzqP8wupMMHeYHy9Sy+8S1I
	 f849PiLW/EyPVRw92zo72gK3hsoPnRakW7Pn8b7ALVtNOih+Dk3uC8Q0kOvTVSkjGk
	 zF1bv2ZOWwxCaapMYi04isP3+pPDWphzihsOFdpvaM+P4RpoIf4prjD+iWp7vmQoat
	 ovNOGZ117xdpQ==
Date: Mon, 3 Aug 2026 08:55:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Darren Ye <darren.ye@mediatek.com>, 
	Daniel Golle <daniel@makrotopia.org>, Rosen Penev <rosenp@gmail.com>, 
	bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 2/4] ASoC: dt-bindings: Add Airoha AN7581 AFE with
 WM8960 Codec schema
Message-ID: <20260803-faithful-ruby-bumblebee-17ddfc@quoll>
References: <20260731064326.2284228-1-ansuelsmth@gmail.com>
 <20260731064326.2284228-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260731064326.2284228-3-ansuelsmth@gmail.com>

On Fri, Jul 31, 2026 at 08:43:22AM +0200, Christian Marangi wrote:
> Add DT schema for Airoha AN7581 Sound Card with the specific WM8960 i2c Codec
> and AFE as platform driver.

You have unwrapped commit msg and should drop references to platform
driver.

> 
> This gives example on how to define and connect the AFE driver with the
> WM8960 for full functionality.

This is not necessary. You desribe here hardware, not example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

