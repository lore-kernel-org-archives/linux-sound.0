Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B51D2580F2
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861236; cv=none; b=LLGSPjoSxe9S1V/oNXImetzvOJv1CTzCcB7Yri7d/Hw3RZUiePUgEZgeIuj/4Oj7Lj7s1AbltHe/WXjXGZf0oe5mcNru2ZB225ZMjO7aVktmJoN3E4W+s2wg65Y1v1duP2wa2XknqlCbAeyCTp8QNsOXKuvQDES5p02zghiv8BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861236; c=relaxed/simple;
	bh=F8rJS4RbMCeuDk0s5ZHobnvwC01feW+gDzqTTR1DVS0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YzR+AI3J9VO9Fc/sWdCtL1O6a04soL+HYb7mMtB6IZzjWjWz5YF3mYVI6czNEReLvGsFm4lm2BPF26KTW+aIL1GQ8tkcdxhXxchsMfe2fStYMt9VaJFuB0AVl/PnXVKSBWlY5uV1m55R0U8bHNixHFCZ6K87MKb0MgVqml9dxyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilI91ORj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilI91ORj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657071F0089A;
	Thu,  1 Oct 2026 13:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790861234;
	bh=MYgvHzkR5LX7EmLfFwNUnCww43eB4PMq0fBjPToGX0c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ilI91ORjCYqxfLcLL2Ar79w0Jc/rVMd0XpBn7ExGGAVCPKyr/yvR+XlLHr8Reh7ue
	 6/ZjNhgoeCep92TZKwLgKTBst4rFXrbsI6+FFeO6c34GVZTZnC5J04h0H7wVA7Fm7Y
	 2CxCUjNuF2RQ0JwEeFcy/RxXzPLssGVEWtkz/FapzhdzRsdpPKAdEY8lsRptHjXFXS
	 lyt9vxTq62oLfUbgKb9wFzjs5iXljhnU3qPl9FEkq6iUDUtr/GpJrzxmyEBR3+KbjL
	 lU82GUH0cXP8x7LeuzC0dHcRyYvDG1hFVIXt179Jz5uYF4MEtqPGypZOgmRxL17mGH
	 eI2N97VpUnnOg==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
In-Reply-To: <20261001024049.93-2-shenghao-ding@ti.com>
References: <20261001024049.93-2-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Refactor register error log with
 unified macro
Message-Id: <179085741906.90966.4869843706068824809.b4-ty@b4>
Date: Thu, 01 Oct 2026 13:23:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=F8rJS4RbMCeuDk0s5ZHobnvwC01feW+gDzqTTR1DVS0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqvl+uyrUub0g/OvbQ1l8JweaePLp1u/s01BYyP
 rXtBkefmNiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCar5frgAKCRAk1otyXVSH
 0DlyB/0bILoaTYuxiJukP6/FzS8hOfvzxkEF5CfGLcJ8q42mFk5KdNzPaEtsrdwGbrr4QCPoE+F
 7KC4arPmafasOuGu3psBi9QXdAGXULrNY9LOzdj9ZInaPblYwNsdftPk1ro5/enJQbb57I58N7d
 g6bFfXThE77HMiPjqxBcTINBja+AqR1F3ao09ib6R0u5kObmBcdtd9/AdURF+HUqfSIjXqnWPff
 PcMYnMOFprsd6sCogZQhVHT43DLT9eBgi1GaMhri6uHU9pK+mdOc9Io/gYTO8FvQrmTHqJ3zVck
 q9ssxfB4/CmBsGAJNpcVs1a4Y50CudzhrRdtfynvIJdjCHLu
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 01 Oct 2026 10:40:49 +0800, Shenghao Ding wrote:
> ASoC: tas2781: Refactor register error log with unified macro

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: tas2781: Refactor register error log with unified macro
      https://git.kernel.org/broonie/sound/c/5367243a37f7

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

