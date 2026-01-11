Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BC723C50A;
	Sun, 11 Jan 2026 10:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768127789; cv=none; b=u/k45+/WnoOgmbaELFtBb2QAo54C3wcs4qnGAP+NSqd5j4Bkhe8IKvdBuDbQM3wTs3lWqIRXjgBB5fqUOorCr0DzrTWGXfL3EHsSspS486JdPJzzc67HgCmCrnBObSo8Zy+yjB8fxFtDAmY2E1dMhP6fdOARcc2qyyLBIoOxYqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768127789; c=relaxed/simple;
	bh=gUOhgXuwBlu60lhjZNAzHC0wkSh5DUcY96l2rSVARE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOeILPZmaKpjIyp0pWOR4ctvhcj1qVJK7d+4Rbfu+6vq39IRUIrbIGmIV1+251x07g+CDmx9MtFZGr7nlyWC7rRHVq5Os5vzjej5ZlIk/5CzvWuvA0kCuqTTWK57HDT0IaUmkg6BMJfWFcm2Xb5D+AEOv9Orkln2pZDSSgb+q6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qztZJHY3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qztZJHY3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3142CC4CEF7;
	Sun, 11 Jan 2026 10:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768127788;
	bh=gUOhgXuwBlu60lhjZNAzHC0wkSh5DUcY96l2rSVARE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qztZJHY3GtVjhxU5tMBgzDOMXadvu3V3yPjEtbNEIsA3Hd/tIMDQ5thQXGtO3+gN1
	 kN+MyVRJcsA0RzSEWAPfSJwk1UdKXLeq5YeQpS2KvPigHT47uH2nQncAb5kG3vhGPM
	 e415A20y3T17Ub9FyC99TFgH1QUO1wSPKYAn5ACAvOSWefainsCx0QggC3d7qtGIP9
	 oY/efDC46PwpC4KpebCANBYM7038cZhRaq0OsCX8enwoR+iS/rnUrhD53wmr5VVI/n
	 xUCIQLucSSFVvfA6LNbAp/3gv5JD+GM/F5FU0Ejxd0+NZ8vFoGx3tuE/433mO8t0lW
	 +je6pKnOGqzig==
Date: Sun, 11 Jan 2026 11:36:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: cy_huang@richtek.com
Cc: Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, musk_wang@richtek.com, 
	roy_chiu@richtek.com, allen_lin@richtek.com, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: sound: rtq9128: Add rtq9154 backward
 compatible
Message-ID: <20260111-polite-rebel-armadillo-22fe2d@quoll>
References: <cover.1767948925.git.cy_huang@richtek.com>
 <714d1455279d8e9814e592a26dc2f8440949062f.1767948925.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <714d1455279d8e9814e592a26dc2f8440949062f.1767948925.git.cy_huang@richtek.com>

On Fri, Jan 09, 2026 at 05:03:53PM +0800, cy_huang@richtek.com wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add rtq9154 backward comaptible support.

You have typo here.

With this fixed:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

