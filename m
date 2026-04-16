Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F152E3D5240
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 14:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776350432; cv=none; b=WOYvnw6rzxZ2FNjSMgHzAoEa4jg8QScaeMR6A/p95JSoG+a7s/qxOeGlVvqZAvJUiWQ2Dg+rZM2nwkpfChEIGEIPWtFeIfi83FAcdg794EYlvgE0Hk869czU2uZs91nExYIG4gbkYZA3MC+SeuiWLU4hxQE+LKyQc3pi5CdPuOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776350432; c=relaxed/simple;
	bh=U3wRiLhKRiLIAkgel8XfmKwVFszouZ/OyGe+5iXU/qc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RIFBnYUobGok941sTsFA6tfaKSGR2sN82bGx5UgQOyViKh+/taVmeFtiflhORfmECo6EA2cidJuKT1MZJ5h0KALJRRlQVNFC4d82M1YJhkgsAc106HGSHTfYU/iAUyofkFSPgihYLe5+7tqZdEemyapJsu4O/o5vzafr1xn+Csw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpA0UUOE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpA0UUOE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206C5C2BCAF;
	Thu, 16 Apr 2026 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776350431;
	bh=U3wRiLhKRiLIAkgel8XfmKwVFszouZ/OyGe+5iXU/qc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fpA0UUOEIc89acB4/h+MFSIEBpXuT6qcCxXy022xUbKX4ovPA2TbTg2umww1UuFtI
	 ymDKOcdBPFhuef8c7c570JJFyYFLU0JBOsiCEZUUhumsgqmzm+R5DXZzSJMLQfYcER
	 mXhiYSgzDhYIMtONDTxawowD3zr7yJFH03K1ByEcHX0G1p9hyW6jpqoCd2adsbMHVk
	 QRTq6hFqEEK6JSLsvrfcPIbKq+mWfP4A8ut29eWXYU9VHqIFqgXLsOOxav5cCz7QdU
	 mamMY2yWQdpRUxnvoYwRRBQZdVKisq4Rvim7dYnBSD60Mnz+5jvK3/z2Uz252iryRj
	 4I97oTrtk2HNw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Hsieh Hung-En <hungen3108@gmail.com>
Cc: linux-sound@vger.kernel.org, perex@perex.cz, tiwai@suse.com, 
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com, 
 matteomartelli3@gmail.com
In-Reply-To: <20260415030252.5547-1-hungen3108@gmail.com>
References: <20260415030252.5547-1-hungen3108@gmail.com>
Subject: Re: [PATCH v1 0/2] ASoC: es8311: Improve error handling and power
Message-Id: <177634316933.43536.5975896419616872247.b4-ty@b4>
Date: Thu, 16 Apr 2026 13:39:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611; i=broonie@kernel.org;
 h=from:subject:message-id; bh=U3wRiLhKRiLIAkgel8XfmKwVFszouZ/OyGe+5iXU/qc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp4PTdbLu38ADksykoa92e4By/hJeWBMSYv5kIY
 KOhZ7G0QuCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaeD03QAKCRAk1otyXVSH
 0JrNCACG2iClAn5lPxpNp/FVYcun9KX9xtHymhbd5GnRrJ1lJkUUGJsi2A2U6Qvidg2Rm2ritAE
 V2ZNKChI9cgKtDiFlKMMDeuFQECI1hBaQmGCc0Z62zcqfhknD6zrbHmyWiAlo12sOWXFUruWa9L
 9BdQZ1yasByVOkBxKVLHcf25szA1kHshEQTWoiWW2YD8Ck034u/62Xnfa7kz0W7FNUvpHowEVWR
 /ToHWGygvwW0H51WjnnkWK726OutupuT1KyA8D1lC5CIS3+cL67ftJCp51dsxgA26uWI6gVaoFv
 UwMkjb2XM9grOm3zq+9Zn/Mq/xcVo9eAcNNiVAd5tOWv8pd0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 15 Apr 2026 11:02:50 +0800, Hsieh Hung-En wrote:
> ASoC: es8311: Improve error handling and power
> 
> This series improves the robustness of the ES8311 codec driver by
> checking return values of register operations and ensuring proper
> clock resource management.
> 
> The first patch checks regcache_sync() during resume.
> The second patch fixes a clock reference count leak and checks
> update_bits during bias level transitions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/2] ASoC: es8311: Check regcache_sync() error in resume
      https://git.kernel.org/broonie/sound/c/37e9faf21670
[2/2] ASoC: es8311: Fix clock leak and check update_bits in set_bias_level()
      https://git.kernel.org/broonie/sound/c/c15bc1681045

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

