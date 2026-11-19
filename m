Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111751;
	b=bbJTe+8/h44LJAT3F8PPJh7sklcqx/bMEKzZNLJWqwaA2F43GtTgZjjlrlPpwOLcEiDL
	 U7heu1RrENgQkZAMZc0tu6nxpX5EAQ9pIlPbfIFE00nQBhZGr4ldf1cG/Pu3rRChSJweO
	 Dh2PsLVaV0Qs79zOBkc4xiZseDOFqjnSrSTIoJJGibylqlkA+j6fxTdLfQ5iqyhNNgnXI
	 +/JgXAM4SgF1w6QjZ1rqmYUJIAqhL/Az67NfcytC40N9823Tdc5HE0t9VKUVM8rJ+mtwn
	 MWQ6RswzdaAeW0QldgUx7jNATy/QbF1OGgr1VMGqDNRsS57FicHGGzeO2yRYXtih2RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111751;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=4VLtRdOBthh4GjQ0kYg+xKfu/JU5co+SXjo27JYVNJg=;
	b=3rXBjXeew9EUQV8Dx2E/ZxD+eAZslu46p6Th8ClZCZz4RHURlXzdejyXmIzE+ElMxXyI
	 81VDPDPuG2xtsBpxteCAJ1ABzQoRe25pGBkbeVVj1szesaDMM5XRVPYUJLrRh5UtMQNb0
	 JVoCgv/AUcbvBlMcH9SHdzOxmUJWBc6Limx8y/vIfE2lvxeS9DU/QSUTreofHEEK8vN2u
	 csda892kqIUh+RyQ6EsjQ3WlmH64Lof/V8/555IzCcMdl5mqqiCmkHgqw0EFaWbjnfn06
	 sGfIMtw3aJ/+3vqC2HFDs+4ikUe61IlwDG0aHuBEvyHgz3vr8adQop6iu3aqql8cRSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kbdd2n2c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22400606A33A;
	Thu, 19 Nov 2026 18:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kbdd2n2c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92E41F000C4;
	Thu, 19 Nov 2026 18:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795111750;
	bh=4VLtRdOBthh4GjQ0kYg+xKfu/JU5co+SXjo27JYVNJg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=kbdd2n2cXhAaUl1gT8dzyywhjPBCx9BukA053nAHLccr7isGsQ0kXKEce8KQhFwaA
	 2ml1T8pq73G1eiIWP8vlIOoLRM940R5yqq6QiKid8lrbXNASOse13YZVR8LUjD8BEx
	 uM9QmnUVFUfbyi59/Z0+561nHDnlVhrA7S0JhkqmxRmlbbsjFVp5b9bJGFngs+Vqta
	 /gV0OS1k4xvFkYutV0vuuUDHFgVcppoTXvjsjIdeIQR3rXZO/53I3/eIEOyGLbEGd/
	 t/moC3qQpqd7ylG4Cyj50GDwSPjQXbyq+62YVJuAwhui3uxywA46KQtKrZQBWU0OXP
	 8vq0XcWkNywtg==
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] ASoC: pcm512x: Support external mute GPIO
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shenghao-ding@ti.com, kevin-lu@ti.com, 
 baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>
In-Reply-To: <20261118211800.63292-2-festevam@gmail.com>
References: <20261118211800.63292-1-festevam@gmail.com>
 <20261118211800.63292-2-festevam@gmail.com>
Date: Thu, 19 Nov 2026 18:09:04 +0000
Message-Id: <179511174470.116416.8486753165618322963.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=308; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HUIjcgwjX0ySUs7DjUppw17CWU4mAHhiXqotLeOSaUQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+WzvZN8SUvL8UnHb+qYTNmQ6jxizVO3PO5HCwtfr8u
 3nzmb5LRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACbCPpmR4SrHTtYO7XsfJtXN
 WP1h39u2DRaO01teLEm8enHqlvI6kS6G/yEeZ7nvvm5r4Y9LZgjUV2x4N9XAbcmh2LPrMtyuf3z
 owgoA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Drive the optional XSMT mute GPIO alongside the PCM512x digital mute.
> Assert it before muting the DAC and release it after the digital unmute
> has completed.

Do we need to do both, one of the reasons you'd use a GPIO is to have a
lower overhead mechanism?

-- 
Mark Brown <broonie@kernel.org>
