Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190462;
	b=yeNvB3y8SnlgJxxEe1dY8kLAN+vak123sYQkmYb+S4ceG8AaEy3/qLZlFs5UJStWa8TE
	 pBniIpni86h2vq+DvECIclmmxH9yntOWGI+AsVuqRbEtPIJuFmnJZ4iIERfizqz7ZXKDR
	 5m+IYcDqsXnbEQLjxJ/P624v0ERLSljsg7QeBahbivUaug4Mw1EWeYHwy22dgiwTCRWIg
	 70wUeNr8Eo/2Qa2m0Z55/r17yv0z+qyCeDSIwwa9wwDyddbeYEH4ubPWsw8RcFnfLEJIm
	 /iOD6YHKW7QB3GYFsmxpHVOFInzguORoiIzHaxlUxFHnw+TZUn1WDGYa3JpR3qx3NDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190462;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3XzXBLuAwN3ZWoVPORRD0QcGDP7o8Shx9M99bRJUFZw=;
	b=zo6/Ok34WMlEwGlGcz97qPh0Yr8kMKuWOyXb0FLiBZHcwmlF48shiqunbS0VUTeMec1Y
	 98jeCJeUkKEBpSGJGfh9h2bKfCS8XagXhBS3Z2Oc6EGPpzGyuVUO5ocnr72U8ktinPxQr
	 u4xZH0dXOUjXgC2wgkza0k+PuteltmRnaSFHpKmAmi79pTpbEPGTgwQHy3pE1D4ol3i2D
	 7zhAuDbmTOf35gzJIBxof53o1XymiC0ECgZO9A9h9cSJMgO9+XRxq2INv2E3hlJxUidyn
	 xT5+iYgI0L69F/S5Lh59BjCdcuLrK2985OO3WHvZ22dgFxeoLKnOc8TvcdvY3RsXdDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhCYGSZF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39340606A320;
	Fri, 20 Nov 2026 16:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhCYGSZF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2587B1F000C6;
	Fri, 20 Nov 2026 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795190462;
	bh=3XzXBLuAwN3ZWoVPORRD0QcGDP7o8Shx9M99bRJUFZw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mhCYGSZFAWz8CtvUAmoaNFrqpu2WmBTNMCYrZHmEd7NdT/4228ooYlK8z9XGVqX+W
	 mMlmLddyj2gIvNdbLUs3ZDqLIEn0lUpzLIrdO1FcPUh7gFH8V7M7zI4EsP8diJJMpy
	 iwZK6tRBPGZYJyEvjHzjMi2BlUSJIngfGTlRfh3qIkQwQNGlVyM+SBFyCgwlvb9pPc
	 KsOR8xf4uOn37UOqQRkiNvLbeB7G4h4oErH9FanY76hnhf7gqIxSmVss9x7kVoVufV
	 M83nsvHW03uucPPOVBAWalmyGFvSHaIow1rz0pfo5Qlfa1sVOxpglEBGqzAs/y6tCN
	 4iBZZ+18uni2A==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, fixca <jaehoon1744@dankook.ac.kr>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stopthewar24@gmail.com
In-Reply-To: <20261120143930.9662-1-jaehoon1744@gmail.com>
References: <20261120143930.9662-1-jaehoon1744@gmail.com>
Subject: Re: [PATCH] ASoC: amd: acp: Add ACP70 ACPI flag override for LG
 gram 15Z95U
Message-Id: <179518665273.6016.2658326478898591941.b4-ty@b4>
Date: Fri, 20 Nov 2026 14:57:32 +0000
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fnv0U5BwIHWNvg67nUYgJx/Qyzq/bLXFrSGY8JkyWYw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZ8nZvUd38zC9++tvea52Xaq1fRcr4e2RNvXGsufdhw
 cTD9feNOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRtmaGfyolqw28ZQT8s0Lf
 lC3IP//iz8viJdx+16qDOU7NXRZ2Morhr4TGkt+7jyr+3K8nFcPX+DllU7VxJ1OBwN/Mo19S1gv
 18AMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 20 Nov 2026 23:39:30 +0900, fixca wrote:
> ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 15Z95U

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 15Z95U
      https://git.kernel.org/broonie/sound/c/f8c9e089ed5c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

