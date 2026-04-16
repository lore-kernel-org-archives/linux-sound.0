Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAF1396573;
	Thu, 16 Apr 2026 09:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332308; cv=none; b=rkldYKAA/ikOT5S9MzMl6K7q6pwJWjr+xVDM1iVZA1dpvy6grHdUr48JrQCS6hbi74K0OXW4h3W+04GyDksxRxlQZoM41smh0iqvucSUvVYXivRsNItPpzd0iCelLWhphaLrdUfCBMfN3dNNA988DUkpaM1f+BgUmItsDsQRQQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332308; c=relaxed/simple;
	bh=ZEk5LMSdObaEX3bHnYTn4K0ZqqQUmPLr8EtxN54Wbzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuA9id5srPY6bABMqXWih7QPxjYaHQL3eAt4BUmCo7ELIgpesJrOeJwbST+uvVnIRwJbF8foHwQYUzPB34sYDdLK3DDDP+xIIa5CO9CxIjMSKPLuL4MlHJtv+YxtY9ghvP+2a3D9t/yk6NH2/kVcop0l1pyRVbaikQxWvWKv9aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzPAa+US; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzPAa+US"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1D9C2BCB0;
	Thu, 16 Apr 2026 09:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776332308;
	bh=ZEk5LMSdObaEX3bHnYTn4K0ZqqQUmPLr8EtxN54Wbzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzPAa+USsIfvntejjAejl3l1C+DskMzWVVdijjf1YRUCpeRSRxETPTYWWYMaLLtGz
	 9/MVI3DEV6eXiKlYFhuSAYW39V1LOecYUAWbZYezTs26xapIfjLANLgdxjErKLb3lB
	 3pYr+OjAAlUlxIE+chRtTHTeKJ5vmWbhXuqMFiYbu8tJcmeJ8SWoQc8LTkl/a+Rvlo
	 Frn+/cOsThi0QFAW5TgHrz6uW1tJL3N3Z1p7PKoDq2+6dpZ2zrAEP7RBAQ/WbEk5hy
	 XLZ2joQFmh6LVtw1WaqvadEB2RtqEYnX/OfHeUPO2nNi7OmUrBD/XmNkulaNA/x9dm
	 bkTxFOMp6YmUw==
Date: Thu, 16 Apr 2026 11:38:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/9] dt-bindings: sound: mt2701-afe-pcm: add HDMI audio
 path clocks
Message-ID: <20260416-qualified-violet-salmon-4bec7e@quoll>
References: <cover.1776265610.git.daniel@makrotopia.org>
 <50afd83a314cd20c715fb9b0d3bc85fb00f9a6eb.1776265610.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <50afd83a314cd20c715fb9b0d3bc85fb00f9a6eb.1776265610.git.daniel@makrotopia.org>

On Wed, Apr 15, 2026 at 04:23:27PM +0100, Daniel Golle wrote:
> Document four additional optional clocks feeding the HDMI audio
> output path on MT2701 and MT7623N: the HADDS2 PLL (root of the

There is no MT7623N compatible in this file, so that's confusing. Does
mt7622 have it? If not, then it should be restricted per variant. If
yet, the model name is confusing.

Best regards,
Krzysztof

