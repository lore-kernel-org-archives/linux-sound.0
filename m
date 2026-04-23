Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1A11D5160;
	Thu, 23 Apr 2026 07:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776930518; cv=none; b=sQE7kolcV7GuigLn6ggm1Px1NQxX0U81LpAXFx9oKTcgQhxtWx64UYTBlszRBIB5S0brSHj+0PtDbEnqmmUfgcRHoDOdR3lBu0qLd5CSShy6VTGLQQZCCkkPgFIlY4jP0tVWKBagh813MQuHFIINjkpox4aQ2nWvVKiNDmNMUeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776930518; c=relaxed/simple;
	bh=6q8zIzEyZvqhWWWK8S5N+7p4Cs/FMvgTjRNWpvfJeBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/FgJc2O9pYgkqP2PzNHevEeVnzF8eFyU7eXD2O8QWnFPoLLv8RcPviPw2eHbcVbwwHefRn/kugguLja+TW20ugJWIRXGIw5Syls2ohnNMWzkLIx03NLp8Y9oUDC0gHgh8+y/Lbc4W7rbvI7yEkzrMfusyrZBB1ZjCzDhzCt78Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qHd57Ita; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qHd57Ita"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4791C2BCB2;
	Thu, 23 Apr 2026 07:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776930518;
	bh=6q8zIzEyZvqhWWWK8S5N+7p4Cs/FMvgTjRNWpvfJeBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHd57ItaEmf10jqH349WgU6KbiwNqr9kFRIjKXvp0QDGTrCJn9B61WZPLMOG74YDd
	 iEheuSTiX08B/dO7G2M+SdhsXgyfUWZEDLc0zOnxg5WCjNhRMfdeFxA82AVG+Ng+2O
	 cWlBrsTZ5qB8qOkEi3QhNCD81y6z4Cdwb0szzhQXNUvhMwrEHmEwUBXOS7ln6fQr7y
	 h8hf1qm68trGq73rPVt81u2JV99TmNuwt8+3E6IK8ZL/ybT7Fb7O3H5dv01IrjDfXf
	 hDe1gu0vsYGnZNIF4Gt76laJ+3AGQncsQ7WFAnLpSk2UnPwF0iV7Qc03iHuwx4fQnB
	 8T0TolAYS5CKA==
Date: Thu, 23 Apr 2026 09:48:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] ASoC: dt-bindings: mediatek: Convert mtk-btcvsd-snd
 to DT Schema
Message-ID: <20260423-scrupulous-stoat-of-perception-0a3d9b@quoll>
References: <20260421193858.347258-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260421193858.347258-1-l.scorcia@gmail.com>

On Tue, Apr 21, 2026 at 08:38:35PM +0100, Luca Leonardo Scorcia wrote:
> +title: Mediatek ALSA BT SCO CVSD/MSBC Driver

s/Driver//

> +
> +maintainers:
> +  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mtk-btcvsd-snd
> +
> +  reg:
> +    minItems: 2

Drop

> +    maxItems: 2

and actually drop this too and list the items with description - PKV and
SRAM_BANK2 regions

> +
> +  reg-names:
> +    items:
> +      - const: pkv
> +      - const: sram-bank2

Old binding did not have reg-names and nothing in commit msg explains
changes done to the binding.

To remind: if you change the binding, you must mention it and explain
WHY.

I don't see any use of that, so why did you add it?

Best regards,
Krzysztof

