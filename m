Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF6A3947B8;
	Wed,  8 Jul 2026 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506252; cv=none; b=JqJAew7II9RZb+MFMMkLeLp66fkWgmUcmUOBNLaDz2p6oIukNxKMVnrtsrDf5jrnCbvgUj/4bOEDKPKvrt/AUQwVkCKK+pfExzXePE9tYpAsSXiW+6qOPQkk9I+RQWPVAKAPJKR/MWZZJMVbud9zSrKIEfLdFzDG1/T1yyDOPrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506252; c=relaxed/simple;
	bh=d62TZ5pLxwSDG3+Jbc+zLSYfCLCpYi3Uhpl/0FXiCW0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Optp9Evg9umCoZPKJDtQy3uPisfFIv1Kn2ef/e/pQ41TMkYeR5f4EzwwPrTMYEDFbHgM5evjAeQLIqY4+5ySjrp593BqtUPeIZRydOW5/Pj4ypc+fhfDpMPajf1rSNTPBKluFb4y8WxHknYgKcnj5pZCkiD8rHX6dZZiJPNwGFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9VuvtWV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9VuvtWV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1EE1F000E9;
	Wed,  8 Jul 2026 10:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783506250;
	bh=5UIDUGZjZpGYdAWIaQyNtkAD0KXTkokKI+9eQZvBWw4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h9VuvtWVCf5LakpWWsYXYa1n7Vkldx939k06HESNrmkX8WbrTl23Z3GQIywhzGNU0
	 F6gzQgGh+1QOK8zc2m1VghhvfelaGLqO6iaqmaXkKsWhFWDInhUPw4yMc/sC7U7wVJ
	 P/lAyiy4MN27lRJaPd/SIzNXWwbNGuJPr7f9uICzdnREjKEwkAb3m0OL98EwXrt/io
	 VLt7ySj7ZPAdjjnNrbLYmIdVxt+LgLMlGyGGKmoDywvfSQWRCHbfn25VUp4J4ZKfLZ
	 sH46v0+f0gQwHRxZ8cOsZ7BycbFW1VyRrfHbBUpSMeqsTjg/sm9P6/BPDIFK7VWslJ
	 +3VE4Ygr+PXCQ==
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com, 
 alsa-devel@alsa-project.org, shenghao-ding@ti.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, k-yi@ti.com, 
 henry.lo@ti.com, robinchen@ti.com, niranjan.hy@ti.com, 
 Syed.SabaKareem@amd.com
In-Reply-To: <20260702104429.1157-1-baojun.xu@ti.com>
References: <20260702104429.1157-1-baojun.xu@ti.com>
Subject: Re: [PATCH v3] ASoC: amd: acp: amd-acp70-acpi-match: Add tas2783
 support
Message-Id: <178346193054.59892.11215584955508242339.b4-ty@b4>
Date: Tue, 07 Jul 2026 23:05:30 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=broonie@kernel.org;
 h=from:subject:message-id; bh=d62TZ5pLxwSDG3+Jbc+zLSYfCLCpYi3Uhpl/0FXiCW0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqTiVH6/EKYycDj4Ky0pBnaMIRIBZ5bdQiBvjzc
 39hr/m4vMqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak4lRwAKCRAk1otyXVSH
 0OFcB/4w3uHlGHjC4yRr2KF5OrKhQQ6JjOoZGo2TltPzzp1SYk1OU1HNeTIjcJwqTH4Z7H4ej13
 cYmMOFizMCb0+xQLKMXDG1ru9af9J+fytWiMCyPehJjr7ENPjhpv66TFW5Vhq7O2EdORWqZDHPe
 Br4O7R8M6Qe9vNkcrbHKfXrg8aUz/7alUWLFtN2zv7LBM8r7jmRs5S5+AOF1WeJL0JMPdK4OAFm
 AqS1IKqWrwY1BlRAKI3u/RcaK3NHoiIbHyBFIGGpGsOQffTL08YhxdWEfe8e94QB+BeZ+TXtRLB
 0Z8e2i2UAHI08XjCicCROfug9oBAXJMNS4JnkTdOTylWTj/S
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 02 Jul 2026 18:44:29 +0800, Baojun Xu wrote:
> ASoC: amd: acp: amd-acp70-acpi-match: Add tas2783 support

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: amd: acp: amd-acp70-acpi-match: Add tas2783 support
      https://git.kernel.org/broonie/sound/c/dedf4ccbcbd2

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

