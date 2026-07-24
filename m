Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28802F5321;
	Fri, 24 Jul 2026 01:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784854936; cv=none; b=HtjEP3kVyVtWwaEq/pXANlL6yOHjn59tHiccZcG/WxKKA8BuVLa+6/xhWjVAJFT+DCYL6WGVdKMQZHSAZ+VRAQTK4csNLb+TjIjbTo3yp4m+/do7FY2hOmkZlsU81dOZ8tXnGZGQwuzqMrxqPKVMHoFCCay+RunABu/i0NEPTSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784854936; c=relaxed/simple;
	bh=VfyJBerr4E3tFjFAntLGwJ72PEOeiSYBu0c+Mv0WfcM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JuHM2hvK2q0ZEEy+FH4p2pom10sRqdIGSjA/MswqhldmiZJCWFNl7MwJegrFGsodou8G91fKyOjsfDc6dYl3Rn7ZPnRuZJQAKwLTpzwBiF/sgJNdL0b9YBuU9RvKOQt/JNdVGdPtCBMmf0m3dWlVYcL+Q3ij0TDREYree9XOhes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXTQhtJS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXTQhtJS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A441F00A3D;
	Fri, 24 Jul 2026 01:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784854934;
	bh=/cKhr0LiAnvwNG8Z8h89RCOsS7i8QjPsTdn+153UDIU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cXTQhtJSdFe0SCdxczgScsjx2XW3N+OWUKipNHuHfVEWCYjJ5zP6MrAzb59s4d7vz
	 jI1xvkmapG3lxNMUAfqlLx00bjmoHYkTTWepe/UeYTEakfFm2Z//MmHFuzuoNjqV8P
	 BNBr5YVH26FZV4jBNQsqkxUftmLedW/UXP905vN3EcWne11GMFunLjR5yAkUNTTanH
	 324XWT8+cwWs1zW5HriHK87YDh6Y6jWJFRpAKtPyqZiGAyHxWexmQnmn0eP8NxgAQU
	 ykGe2N84+G6kufs6B9rtAVJATmopSlRZQfmzNXrz8ExTu4hWSXRBbp8RDfjypoVz7u
	 iiY8xuG5eDOIA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260722143607.1001473-1-rf@opensource.cirrus.com>
References: <20260722143607.1001473-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Sort table of sdw_device_id
Message-Id: <178485476852.53486.3270645318902878048.b4-ty@b4>
Date: Fri, 24 Jul 2026 01:59:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VfyJBerr4E3tFjFAntLGwJ72PEOeiSYBu0c+Mv0WfcM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYrmUUtManVCvgSl2y6vYwwQQf2HtSVfisKb9n
 qjgxcOIFtCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamK5lAAKCRAk1otyXVSH
 0AW2B/9Lz1za+KBxBdkJo1yiIADtQbMGGhZ7HgebYZV6QBFSQRrfsNGaHTfnAF8mMNRokljSJmy
 81QbLf9AsWmiKzmv1WDWt5hPFxZpDl84D9AbNBavZpFQpNc5o2z8NV9sypRDGJDy9jaw2HFkByh
 HI0zwq7PODG6dE87qwW4ip6jYTYU1VO7Wv+RctmbOpdX4wlpNVvV+QRBGPY8ZbT0qpOAidj6bNx
 w/3noaZb5AyBt7RchqYKmC3acVndYv1qW9HeYAe8xGqVe1W+FzSvKc+3rQCnwMjm7KnJMJ5Ixn6
 wA2CYnytFRIo/bPOfOzF7oYSbehB4ZnHS/XSHBA4KhhGXzX/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 22 Jul 2026 15:36:07 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Sort table of sdw_device_id

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: cs35l56: Sort table of sdw_device_id
      https://git.kernel.org/broonie/sound/c/998b8a6c8aff

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

