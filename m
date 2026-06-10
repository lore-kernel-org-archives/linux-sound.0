Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E840D59F;
	Wed, 10 Jun 2026 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081223; cv=none; b=r8DFq319pt/CYdzFBWUVoEeUCfAOCdF0X/Mnf1WJcUKzQZGUh2t4nZLFyaLdPAcWSllsnEV3ChdTQlNQS4RCj8qWYjqF+6w4H3W8qiW74zgITYk2PjsM4yR8nOyXuPYbOOQ+lc0H/DzEgASELwGtnpzQdLvmGav5vvPR8JEUBEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081223; c=relaxed/simple;
	bh=eJLBQA4WOI7ULHrj9b3irCkpFxZU3MO6E7IeizFVz8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNqAfTR6ZV4h7vTyIxH0UTqWkaGaBVgTtZlxMWk3aJW6pfhtZbj6XEoOTSAWqQqmywm+GBno6zrzR/q2wzCsUL5Tf3ankGgI0m4u0/oE4JhvFQws8JrKc8FDAZzFENgQzOxggwmXqGSnIkkKkqDzbzQ6999pyZjqwVfbTfFtmy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bp6v24J0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bp6v24J0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A0A1F00893;
	Wed, 10 Jun 2026 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781081222;
	bh=LUXfiLFW2MJjVB46SHo4DSHAUwVSUIOzn/pOwbSxPHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bp6v24J0pt9pE2zwgzeXDcHM2x5fzEraeSEBv2UA/WYrWS0HGT/YLu+oqcU4/ZLvO
	 Ec/oPJeV2PnyiEbOqtmDaxK6ZioccqUH0d4+UD37t0cXh2s+MFaOakikHJBAM70i8v
	 wfJGjwObcgcRT6NI+kOW2Rkp+aH08S1qs+dRdpVkfAtf/yl0Zi1ntMHuved62sgfnp
	 aNMuHruvVtISOqPcdMAw/nTGDPqtex6Phd53B7AWT1a/lDQKQkhV/a3lwcSA2+d7+E
	 b/jMEhSVxtFc8dq3Al4S+gVTKrvtTx2JfrRCFXq/nwmsZCP6D21Q7FGRKTVkdcmwpm
	 Wg4mIP8jeDVDw==
Date: Wed, 10 Jun 2026 10:46:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Zhang <zhangyi@everest-semi.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] ASoC: dt-bindings: everest,es8389: Document audio graph
 port
Message-ID: <20260610-shiny-pronghorn-of-piety-8fa3ea@quoll>
References: <20260607105913.355966-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260607105913.355966-1-diederik@cknow-tech.com>

On Sun, Jun 07, 2026 at 12:58:49PM +0200, Diederik de Haas wrote:
> Provide an endpoint for binding with the other side of the audio link,
> which is achieved via the 'port' property.
> 
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

