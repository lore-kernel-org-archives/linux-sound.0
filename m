Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3623F1643;
	Tue,  9 Jun 2026 08:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994485; cv=none; b=aS4C4M7iKpiBzz0dwFS9NsxPN5OyMS6b17X/L2+4pSE2jeKitptSWdT671GL0XdqttuANeZfMlqiMr9YnyZZG7Q6Hzn8wIAAdLRZi8j9XcGHVwrfYtGPb+HkOYjk6fZBRodwDpkYdDxET0HVdqHHyODICGBRb+6f1c0b2CNLzac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994485; c=relaxed/simple;
	bh=LMU2WKBRsY9qnKg0AFjIH68qrwlYZLrtmayrpsY+iT4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=vGwCnWct924Oth20fmJyhTBGUCUmuHsH4RaOixyZKQutc9i7FJSE/o7M2e/HslkfUXFuOKV6df8QxnB2o1mU1TZPIpsJWtZoR0Ok4S9/lRjsg9M2hYwstAojQc6naW8FB4D8s3tS1Ii1BIj9kY7Y4g5D2LB2SAdYWWCz6p0e0eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fe8MB+2/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fe8MB+2/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DEF1F00893;
	Tue,  9 Jun 2026 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780994481;
	bh=uJTUmbk8J8QkjyaTbAHKRJ7XTqDvz+ngwJDthoeODuw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Fe8MB+2/RsDHwPkgyBSTLH2hrffmGOPYlRuuxqtqh0H4+SobUdqwH+j15mYytRbxX
	 bJ81CDa23VCgfjHQSOZbdwvPDGptAmfX9zTlcYfycEtUcbpk8AcyGu52eTeZ6p/gG6
	 wiHp3dCSPL65rpW7/MF8o04ptkU80Aw3wIvqW7rfYmo46NfJgzdPlYak3lCuXO4Bc2
	 xlbUoyMNwkI4NdFNd39jHvoLxl6y1bKS4S1Z11Qefy2Y6vJfLXhZTMUR54CPCV/RN4
	 bP0Kba9LwJ1R/ZR+Er4V+XLCbqNFtZvKVGnQ/RXqYUiYVykiOpwYfWCyjz+X960hwH
	 ZtVIzXBHgix3w==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Baojun Xu <baojun.xu@ti.com>
Cc: andriy.shevchenko@linux.intel.com, 13916275206@139.com, 
 shenghao-ding@ti.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 k-yi@ti.com, henry.lo@ti.com, robinchen@ti.com, will-wang@ti.com, 
 jim.shil@goertek.com, toastcheng@google.com, chinkaiting@google.com, 
 riyo@ti.com, a0393308@india.ti.com
In-Reply-To: <20260602100532.6463-1-baojun.xu@ti.com>
References: <20260602100532.6463-1-baojun.xu@ti.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: ti,tas2781: Add TAS2573
 support
Message-Id: <178094167780.20828.2747027030132997875.b4-ty@b4>
Date: Mon, 08 Jun 2026 19:01:17 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LMU2WKBRsY9qnKg0AFjIH68qrwlYZLrtmayrpsY+iT4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqJ9Gr/GXIG3DoSxiQQFN85fGaKwad+XHuaynQ7
 iPqjnEFYZGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaifRqwAKCRAk1otyXVSH
 0Fo6B/9+s/FoIIdgyDgYwnjdzjEnJfTpONGXdaBkblnHrkR2frk8sHEitTf+0JNPuS/1edqpRGT
 K7VQFZjE8ti045ee4yP3fJ275SwjX+xSamhSO7UAABrxorbazGBxSqIVxwu9JKu6TuLjmcf1+i5
 AnL14Oz6AA+vZuWPhKLna17lnNRqp+Fi1+rbbg2HWvVJOSl8GpMV/iuFtND923muOWm03wVIQvF
 AStUZbVznzegg0Da4jZKKc4N7BmYMKM9tZ+/PPcQsBNDSt9KZ8ORbhl20zyfPV9bDFwyHTqvvvm
 z9Otw8dYk5wupu1L85r+sMspRtGXumNcV8mqTocLWYWgTi3K
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 02 Jun 2026 18:05:31 +0800, Baojun Xu wrote:
> ASoC: dt-bindings: ti,tas2781: Add TAS2573 support

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: dt-bindings: ti,tas2781: Add TAS2573 support
      https://git.kernel.org/broonie/sound/c/a0cecbfc1545
[2/2] ASoC: tas2781: Add TAS2573 support
      https://git.kernel.org/broonie/sound/c/06ff6ffec2f7

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

