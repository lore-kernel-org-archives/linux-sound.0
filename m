Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CAC1DE3DC
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769455188; cv=none; b=WvOuljFR+Zu/LG41EHh8MZYkYyaJhNCpUJO2Wy3I5/bQIifGp6i/Uv1rr0QVMXsCXvtsn6cFtoD96gLgmd4JihTe8A/656cfcxp8fMwrFVKwiwceXeWAtIVb7HkPZ8PiquGepT6rdD+EA5oYmNwmCwjQV1487c4vNPLidnTs4R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769455188; c=relaxed/simple;
	bh=1+dmZnN/Xr73QHLXKoR8Kp+C6JC77/k5eEN1IYiUAsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RxvQRzCzKxvwP6UbgRMiayFaml4hxoo55vMFoUOQcx90/w+PfM4fKZKF1TbTDBcwbSVgTGlbzJREMp3RW7AvNqD5x2NMI2HNLApVV1IaRKdNPqfeQhT3VBYVbAVzURlV36n17ISlvta0IUjibHJQ0BOXP2WaMb+9yKNv9mxglmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1IixUor; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1IixUor"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CF6C116C6;
	Mon, 26 Jan 2026 19:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769455188;
	bh=1+dmZnN/Xr73QHLXKoR8Kp+C6JC77/k5eEN1IYiUAsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R1IixUoru+PZ7YjuGBcB3ErhyXBU9R1vKTt2jggpIDifSOdC4fybzDls17gsqHp4x
	 lyG+9s3GGhSizF9BVeWP09J4D3mmv93yEZf0pOetr3rhZYKBSmh7Nsfk0qzFgWQRnp
	 RXQGlrrRfDk/1e1xgytQ0e92EAmzQktTS2Tu/OaAwUkAikdKsf3tYGGgv/Z0txL8t1
	 j+zLxzwvwPHNMTPyoNmriyzgvD+i7sCb/lmg9txbHrLy686tQ34MsE4CbzAOubCYor
	 8KV+CIDq/RJm4jY0xaRYD8fLb9HgDW/6FFxiYnel7gKWJoHD7YC8EQYAsvr+1JCg6A
	 IiaxyV6z9B78w==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20260123113809.2238766-1-yung-chuan.liao@linux.intel.com>
References: <20260123113809.2238766-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-acpi-intel-ptl-match: fix name_prefix of
 rt1320-2
Message-Id: <176945518676.777978.10194048036485521307.b4-ty@kernel.org>
Date: Mon, 26 Jan 2026 19:19:46 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 23 Jan 2026 19:38:09 +0800, Bard Liao wrote:
> rt1320_2_group2_adr works with rt1320_1_group2_adr and the name_prefix
> should be rt1320-2.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-acpi-intel-ptl-match: fix name_prefix of rt1320-2
      commit: 403a0591be681eebc0c4825f8b42afe7fd13ee7f

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

