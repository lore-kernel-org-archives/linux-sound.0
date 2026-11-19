Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097252;
	b=0ErYpsMkSiiAwe5X8VIFjM+6WbHDLeCphNlyeyjS3T4GhC5xMKlzcP26QI2abuLP+qjz
	 zuQ5ipo0JaAh0LPOGF1/VOYTtyGfNP3zSifedm8r7Qha8SJhbFbz8h1OZQodyrFXHUzhI
	 GDHw8a81dvw/weWg2xnVfTYde95WurNDPYTJDIgpyxU76LwSCO1FQ83isYID12sbXxZTG
	 4DfROrrkM1WDHV91zAdz0cjMjaDfMQ6gmFqsRhFRs/x5LhGWLPU0X+sxEGAS/JFXSlnGy
	 eK4bH2gLyTsIp7S4Jgwaqf8dAEP5H5BAx0GDs6Ni7MfA54Hh6H8X/VgYYRIvWeG3Yrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097252;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=CrmcpCex4fbHUrfhAFeTHYutNYioKuausMFQcYEbaLU=;
	b=Yx7oqoKPRwVc0cSs0xj0Sd59pSR4lD73ZBK+X2iC+WSxBUQY8Zpevt5pE/Xlutxyo+BJ
	 QSQatGQs1R/jPOJdSJQZ7jlwuD26zCaw1lV1CtfDVv005CzOx2cvqea2uxkSrr2JTmaQI
	 WHbkOOLMHxcQFssNuSRAGMuK9q80utNYxsZm9APT69mN8grBMDA/791kCIh4MbP+lxwXV
	 1qBBqHp+MRCFR4i68Xigenz8na7AEvA/dpH30WV/Lh745EMGMyAwtmQfY0vlZ4oWVQ+KQ
	 IGB4w0oYnlHMl6eO1dKPiqkL3y4OMCrGZY8hbev2OEnwQw9fPcd7gmwZ6iAw97Tpgxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K6r0XnPi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B74606A333;
	Thu, 19 Nov 2026 14:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K6r0XnPi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98081F000C5;
	Thu, 19 Nov 2026 14:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795097251;
	bh=CrmcpCex4fbHUrfhAFeTHYutNYioKuausMFQcYEbaLU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=K6r0XnPiowhgFn2627B3i4MyZRiDxO47ZDdRhfCzqHJNBCq7yjbapdhGipDr0IihN
	 YKKnxE8cRj/wabv0XC1sN+gHpkC7a6t85DiirTdVH6rNS2VYLKhd6qLz2o1i1aURD7
	 7m3OtKmK4cqsM2VxkbWpCP2mrb4dRtOuLj4ejADaRSAwisKf34AX1ryXAVwmvke2zD
	 vjjXxCzn87xmJMiD359g8P6prYbTV0qsSSGX7DjmhGbmEQg6r8Tw/n7/gGbecVYsug
	 XaafrS/WRx2ajc1I4O5KpUo66LDyHFPLs6Oe8msUOFHVpEoEDg2qNh1avAnR9nNgMP
	 oN79F5D5N8ycA==
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
Subject: Re: [PATCH] ASoC: codecs: wcd934x: drop the MCLK on every disable
From: Mark Brown <broonie@kernel.org>
To: Ivan Verbovoy <ivanverbovoy@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261110-wcd934x-mclk-v1-1-c62956792a3f@gmail.com>
References: <20261110-wcd934x-mclk-v1-1-c62956792a3f@gmail.com>
Date: Thu, 19 Nov 2026 14:07:26 +0000
Message-Id: <179509724666.116416.15851195764740977182.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=930; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OPTfJIFUXKisHBNvjvMBZZnAD+Q6NVj/03XvBIsbR68=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+M823vKf2r1EoxSFUSn6dctGKu7asR2/fdLqjOZlVP
 TGjUWVbRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACayRJWR4RjjC+bpCcF/Uvm1
 K9s+13/6YlnyWP/K39vPY+MyhS6sDWJkWJtyIeC86TrxrQ33osSC5q290st5xPiz8EK/YzeCf4o
 v5wAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> __wcd934x_cdc_mclk_enable() takes a reference on every enable: it
> prepares and enables the external clock and counts a user of the
> analog bias and system clock (sysclk_users). On disable it returns
> early while the SoundWire controller's clock is enabled, so neither is
> dropped. Each DAPM MCLK power-down or MBHC micbias release during
> SoundWire activity therefore leaks one reference, and the MCLK stays on
> for good.

> The early return is not needed: wcd934x_swrm_clock() takes its own
> reference before it enables the SoundWire clock and clears that clock
> before it drops the reference, and sysclk_users keeps the bias and the
> system clock on while any user remains. Drop the check.

Are you absolutely sure there are no other paths that could do this, for
example take a look at wcd_mbhc_adc_detect_plug_type() and the rest of
the jack detection code?

-- 
Mark Brown <broonie@kernel.org>
