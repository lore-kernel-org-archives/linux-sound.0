Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771708;
	b=Z9JGIV86BgPIdYTCPkbUHnaeDmOGvIrOYHZW3wXDZcQwzRbSPFtnkG+3Mw4J3pBRotNQ
	 YyHz5imMd8wt9gVSXYkd8c8cvNcwG8zZCKuLc0z/sTKZ908fqvbbfxWM31XMPc57jNe+O
	 BkQwpWQ9+ohAzSyVhPh3CQixRYYn8BoVHAevRcawpwHE19Fpc8mdzEXDa4EXmX+9vOqJ7
	 T7cXK3jx74ZI7BawfdHxJyn/07LmSir3ElwXbTyWUY+yn+KPDOWizIFBR+N//XgO5oJp/
	 Mj24EcxxwkWM4CEY+V4c/lsxdRArp3p0Ckha52KsZ/cq1d/1T7+SMnHr9crizB+jmPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771708;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Fv9EX3wXcu+fbRMvKuz5QcP3YHhZmhvQDcq5mx8SAoQ=;
	b=Ik5t+6xmjXSUuyBs821Xrid2mUyxZJqymbMEC7j8e+2pjGkDeKE/NSX68VONQWYO1w3M
	 OHsGvZhyYg4jUrH2bX6Hm+iIR0QtfhKFoh8/zvw7TtdrxO35qpXsTbDEdlL8RGZZY+6yr
	 87iXgxLfXHjbAAcljQRwZodiloVhjiG/zDOC5H3p/aZL5jJqtdoAU97tI3tAqszAdt7cj
	 s3+YYrnRu8tTs6IZ2f8v/O3D475vWdoRKD3KoIrzVXxE9kPDEuH2ikm4Voy/n+Yrm99wn
	 +nc42iY4brsgh4j7HU2Nca4xH4TgkYi0XF/nTs4kSYdaSbaGflQv7MornfcBj2740Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=afBvUPlT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE60F606A32E
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 09:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=afBvUPlT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2DD1F00893;
	Fri, 27 Nov 2026 09:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795771708;
	bh=Fv9EX3wXcu+fbRMvKuz5QcP3YHhZmhvQDcq5mx8SAoQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=afBvUPlToh4UiJBhPvjct3gDnJEcMOEkE7x+u5RUTKhBMO0ALHACmk26rOWALBQuO
	 Eu9jBPYbyeVC+aTf7T85i3Fd5cE/IMtbEWI/XU0ZfgrVdMiVvNbJ6pjP9B6ZiLsxXQ
	 sf3OLfwu5qmJhETyKek/VN4Bahl95WKwsL10B7cgUcyDSHizCrTFlbG/omGYjuosyN
	 V4M3DVC8KsF4xCNLtkoXe2YR1RbOHWKGgplOBZFwOE4vHBTXCovrqZb8WZ0c0okFP9
	 V3SoYOqAKT4q1I99NEXL1A0PAC0Yv6Cq73UW9yuDcZZ7Ph+DY4ijF+log1ogkL8Dmu
	 ZtpN6lLzuwekw==
Message-ID: <sashiko-outbox-236980@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ASoC: stm32: spdifrx: Enable clock before setting
 substream
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261127092345.12383-4-phucduc.bui@gmail.com>
References: <20261127092345.12383-1-phucduc.bui@gmail.com>
 <20261127092345.12383-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 09:28:27 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ASoC: stm32: spdifrx: missing Fixes trailer on bug-fix commit
--

commit d1f8e52fc45d0e44e5727d051ea0cae138dd34fd
Author: bui duc phuc <phucduc.bui@gmail.com>

> ASoC: stm32: spdifrx: Enable clock before setting substream
>
> Enable the clock before assigning the substream to avoid leaving
> a stale substream pointer if clock enabling fails.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

[Severity: Low]
This fixes a bug introduced when the driver was added. Should the commit
message include a Fixes tag?

  Fixes: 03e4d5d56fa5 ("ASoC: stm32: Add SPDIFRX support")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127092345.1238=
3-1-phucduc.bui@gmail.com?part=3D3
