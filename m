Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152B52F6918
	for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 02:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778551659; cv=none; b=nWEkxifJgebVX2kOrlqJLxBRQ40Z5AohApeCXkt9oOZzkhGPg9PSpaVp6I6N5f2LayDcbRKxHUsGaIYvvUCIz/9H+RBHTWU6QPilwYYTp5pVOg4IQ8O+pN1JjgNRO6RXT06x/X8CNc3gBMo+DMPFLnVniSZI5+U4QHpx6NaN93Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778551659; c=relaxed/simple;
	bh=e53LJnA8kD1zt9vLrLA0R6kLUIRqoN0QJQH4h9woG20=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IqsGKxvFGT9X1k7Jj85DhCm8U86StNRGgZ4MMHIL04gptgz6R4eaoSovbe4CJy3W5yEmfPMTwOuYlHiVOsustSQ+dHGRrmYamjy/pVYYfAJBvB96IvpNAanYcqek+hJj/qgxocbGp8WDWXx68gNFndeOYbgg6039Eu1D9T5xIwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+/4upQz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+/4upQz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A4AC2BCFA;
	Tue, 12 May 2026 02:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778551658;
	bh=e53LJnA8kD1zt9vLrLA0R6kLUIRqoN0QJQH4h9woG20=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=E+/4upQzBs0plqKTfh2Lz9nZSGgYFF0YHk/VEFXIfoWu39IVutzqr44Fm7kJMTfIE
	 jtspW6ekiaXV7biJcpRRyHB536fqq5iCClbKd4ahrf4IjbL4Na49hJwSldTSQb/RPP
	 +cHgI2vU5jw6XkDenI8RNj9kPfTQzj2ZeNNZqEjx7lRe4Bgzv+WNETGQmLh2a3eRwZ
	 RKReufFJoyDpPuOv2lGqSxO+HbRu7Zw0j1M9k73widnnhDET41s+E3zT9dp9iYgXdV
	 EiePiqG9c4pyEwXK5M1FmnkGCKO6WahZZtzp/0gPQlXwapZSAwGSEVmN20jUw7XJEd
	 5+vBh5emWz/pg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com, 
 pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Dan Carpenter <error27@gmail.com>, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260511153638.724810-1-mario.limonciello@amd.com>
References: <20260511153638.724810-1-mario.limonciello@amd.com>
Subject: Re: [PATCH] ASoC: SOF: amd: Fix error code handling in
 psp_send_cmd()
Message-Id: <177854847771.988959.3443940599299711090.b4-ty@b4>
Date: Tue, 12 May 2026 10:14:37 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=e53LJnA8kD1zt9vLrLA0R6kLUIRqoN0QJQH4h9woG20=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqAotnqLAlOVkQuoA55huZ15bhQ97nbQDntEJzY
 6HXw0fkMhSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagKLZwAKCRAk1otyXVSH
 0FVKB/wIdsKK7npoUkqfDFovQopxwtLVWfrtg8+jTV0COsUN07QMc5tpFxvu0Z6yHOLRjkPOZwW
 RX16meiOo43h3yg+CBcRwfxsBMbLurKTU0Rc6oi4nB2O2xovjJCw1L4WJh2JsbroZT6u5lgcc5b
 XWuTLqrjn2XrHxj06VGO4ZQlHCMn2+Amkb7U24g2XQcN79TWoIXGTI0yMFYRQ/JIz93kwVoMNHB
 gby1jp/oVTcJS00w4Rnmnvsm/WFuONhSbD3UU2L4xGe3MPomvInplUg/E9nI2yjpXPbJ5LNxY4R
 rx0+vwFCHoBhsTjtxbScBYBZcx+CQtn83jynFu5YHe6Z3T5P
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 11 May 2026 10:36:36 -0500, Mario Limonciello wrote:
> ASoC: SOF: amd: Fix error code handling in psp_send_cmd()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: SOF: amd: Fix error code handling in psp_send_cmd()
      https://git.kernel.org/broonie/sound/c/2c7b1227e582

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

