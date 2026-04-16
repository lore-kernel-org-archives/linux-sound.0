Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AD039F190;
	Thu, 16 Apr 2026 11:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776339698; cv=none; b=GGnco5fvzHdlm6Ho766nNtEyIYvENV7moJ/X3+UoqKRZph86Cwsngf/8iKVCcrx0YxVgB5bhU7wTzQujWx8x3pSFu7uqjSHA11/6Z/M1OCN9Eas+dDCodY6oRcTV90ecFCfVmaYGQZVj/FhMHZs2VtsI04zzl2yyMGNZsAwJ/24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776339698; c=relaxed/simple;
	bh=rUVKVNfmt0K9kAGDtdF/75bzOE2ihPV1BFIiIU/kzXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iN+0VnGn0yATVZ1aFIXDZsPcLz8XkcEvF+kVH1LMrx1mQ/0GJmKoEZsXnLkXnQHkYPuL+CpbkyTYFOgLwovAGuMuyg4d7eS8OqxdsdG8nsx+oEbVVRzJbOFFqNgFTqqt07sxgHHIG5boG3Rl0nohQ+0wLqAL/Mz8nmV+P9QoEnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wDL65-000000001iW-004L;
	Thu, 16 Apr 2026 11:41:25 +0000
Date: Thu, 16 Apr 2026 12:41:21 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/9] dt-bindings: sound: mt2701-afe-pcm: add HDMI audio
 path clocks
Message-ID: <aeDK4Ta4BJEQ-7eA@makrotopia.org>
References: <cover.1776265610.git.daniel@makrotopia.org>
 <50afd83a314cd20c715fb9b0d3bc85fb00f9a6eb.1776265610.git.daniel@makrotopia.org>
 <20260416-qualified-violet-salmon-4bec7e@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416-qualified-violet-salmon-4bec7e@quoll>

On Thu, Apr 16, 2026 at 11:38:24AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Apr 15, 2026 at 04:23:27PM +0100, Daniel Golle wrote:
> > Document four additional optional clocks feeding the HDMI audio
> > output path on MT2701 and MT7623N: the HADDS2 PLL (root of the
> 
> There is no MT7623N compatible in this file, so that's confusing. Does
> mt7622 have it? If not, then it should be restricted per variant. If
> yet, the model name is confusing.

Only MT7623N (which is apparently identical with MT2701) has all the
multimedia features (ie. HDMI, a Mali-450 GPU, ...). Neither MT7623A
nor any of the other MediaTek router SoCs got any of that. So it
should be restricted to that variant. I'll fix this in v2.

Thanks for the review!


Daniel
