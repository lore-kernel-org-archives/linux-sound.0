Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044017;
	b=nF5fer+cRz2YRAP1LcJ1uRWszvoyP0/xN3x+e+UZl0T6G4YS0ORyZnAIf2OTDPW5HZT3
	 PZ7nHpsrJ+9uDv6KsfJ0fPvS7SzijvbMXBF9vEmjKkKm2IP4B2EP66Ahx4DsM1D8inqgJ
	 QemQlvSR4wltuhwz+IXYFOki36r5cyvKsmXvPERFWNUSam6Y6kyjbYqo75sgnYJdKYVdf
	 qW2KQ+oehNDdb0q2b7LftyaiPhnuiBfYSUKPPMp+BUTRB/fZJiHQ88/W2DhBw5guaAl74
	 m7Igx2H38ncHVXP2g96oKwSJl/zh9Tr2TuHzZ32BCQxD0L8xCbdUVKe5DckdPlDT+Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044017;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LXtNpS/VdU6HXfQ0v37dvgK7W17aQ15BK7fvXX8al1w=;
	b=B/gkkXe5Z/QPkPkpagLHDxE2T+IG0vPBYVXkiC1DIl/kX0QN0zAUGWD1vgrBQvDZYmuL
	 svxjIk7f9Ko9kqpbu4gS84GtJuaQECXmWZgE7hFYHDClooRd0tpbuEUUyO9bJbURcOMQ7
	 mb/SFpBnq1yuQmkQ54f4kkw2/bqDMMXjLdlSwyY/fm0+glmaRMnpJhX83DH1ON0x0Xp48
	 0n7fXSxPPkCQ0LSIRBgpYBJbJAVsZnDj0GZcIFPrDvNbNyS/hQWf62F9JlsfxGzMI9uiw
	 HhYZ2EU3AG8uNGCdt3yTs8J0k0MSDrD4p0CCtoLIFXgZqjpXgODVZJJNjXlJqmf4HXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jDIKbmpU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84FF606A31A
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 19:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jDIKbmpU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0D31F01825;
	Mon, 26 Oct 2026 19:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793044017;
	bh=LXtNpS/VdU6HXfQ0v37dvgK7W17aQ15BK7fvXX8al1w=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=jDIKbmpU0dyXIMeVQKsyXudQVyKmuA3wPNFAhLRpRg38ezJIraI1GP1FrhqcNhXOb
	 P2D6GuT2zvrv5WsZ32zGtse1BaoWbxOXRFeBgxiZe9UO9C/QQFomgoIdcq9aWbKPZN
	 grNvjHd5Zk/4tH36p5QZOaI/ekQb+pGqV9LP2geEfyxybnfmaiCaJhmH3J9M6wZ6f5
	 hJ8lUpUESovxprnLELPKsX5lww2qRQaid+KjwpfdeV9yYqzDjOxZDjZ98bndPDxUpB
	 3aS06nMChT3aphxs9LwTJqGTWbp5l5/yoWfKWOalHP2E6ZV8k5AW9ikoEhe83LIY2x
	 V7WnRqcAYPwpQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id EEC2C1EC342C;
	Mon, 26 Oct 2026 19:46:40 +0000 (GMT)
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
Subject: Re: [PATCH 2/3] ASoC: fsl_sai: Stop BCLK after the last stream is
 freed
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: broonie@kernel.org, shengjiu.wang@gmail.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20261019222827.131120-2-festevam@gmail.com>
References: <20261019222827.131120-1-festevam@gmail.com>
 <20261019222827.131120-2-festevam@gmail.com>
Date: Mon, 26 Oct 2026 19:46:39 +0000
Message-Id: <179304399955.199157.16112168488758300636.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=565; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pn09X0EFAHt1oxuituSa7ZvJKGiwkvWDpdWjMSiJueI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLur1M4Z6++7U9+lqirz/Kn25JmdW55Obc2SWbCqm8Fn
 vXHfTQcOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARNU+G/+HK9jfmq/HtWPfO
 vLb9Z4yTbsB7do29xT+TSs3Db8bN3sTIsEXiSFur4b2a45tn72eRSH95y3LispzlLm/ZVOQTkue
 dYgIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> On i.MX8MP, trigger stop leaves BCE set so MCLK remains available to
> a codec. When the final stream is freed, hw_free disables MCLK, but
> TERE and BCE can keep BCLK running from the newly selected clock
> source, including an unconfigured bus clock.
> 
> Clear TERE and BCE once no configured or active stream needs the
> clock. This preserves MCLK between trigger stop and hw_free.

> +		regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
> +				   FSL_SAI_CSR_TERE | FSL_SAI_CSR_BCE, 0);

What about RCSR?

-- 
Mark Brown <broonie@kernel.org>
