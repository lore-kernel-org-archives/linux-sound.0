Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2936E2E06D2
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 01:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943385; cv=none; b=qASiPCfOzMjET53qH5eDuk+vgnBdtFdU/8fq+Te6h3c916bYxjua75vJX+KSs4umjZvbp1k38N4DOBcURj7owdts9PiNtCzGOf+wuzb/ij2sru6OzMzAq8SO+NRyxt+QSnFOQV9qVTTdNi1m93cSOm5J5aC+4CfTHEOfrBHsguA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943385; c=relaxed/simple;
	bh=R3dGb1NHNB8C471b6Z/Epkr8ulECrgyoVYfLSwbev60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ii2Ts0HGiJvkz6/IHvpCWYYda3zYKkThupjUvVGaq2vkp8aoTGHwVE51xUszEaMi57W7nG2+fX63G5yAAENFbw3BUe6gNcFH8PMOImCkx66LqvIuc1woMAC2ZRINwUzGjc+tBOsfRow2r8cnm/xPJYRSdqStdUk7vD3jpMFu3Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o83YpbsY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o83YpbsY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAAAC2BCB8;
	Tue,  5 May 2026 01:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943384;
	bh=R3dGb1NHNB8C471b6Z/Epkr8ulECrgyoVYfLSwbev60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o83YpbsYgRDVi49HvQL3ZYn3QZ9GBpXLnulSNWw0DTmjYMVB46MkkWD4Nwl6F8BOS
	 52OuIoXN+Un+yPdgdxEScbIuMwXvD1XhlX6i1B0wCDyNkqvIeZmeaSxtuRoFB5gnKb
	 zt+vobi1+JsdJQspyFKXf1whUuGXtaIWfe9o/1V8YuDQO8RySN0R+3U9Xyh6KaOU8l
	 kL8R4Y0OQWouOHGvmtYX5VjiebV6IOoJne3CaMYTbAY+T12ckkyT5sLP7Lhq/1UX6K
	 KENnQT55S6L1aK7ZHZuZfvlS8kpgih6pdQlvpMewjRvHAtiuPsPFtgYa7I6SM3pGKV
	 30T8ZubsnY5HA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com, flove@realtek.com, derek.fang@realtek.com
In-Reply-To: <20260430121043.552241-1-yung-chuan.liao@linux.intel.com>
References: <20260430121043.552241-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: sdw_utils: avoid the SDCA companion function not
 supported failure
Message-Id: <177789997234.458539.3306181050924438743.b4-ty@b4>
Date: Mon, 04 May 2026 22:06:12 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=broonie@kernel.org;
 h=from:subject:message-id; bh=R3dGb1NHNB8C471b6Z/Epkr8ulECrgyoVYfLSwbev60=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+UNWhXr9qHUXI6uidyY5jzRKW0ZEHL29iHhZQ
 UHPG0YuigKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDVgAKCRAk1otyXVSH
 0EUIB/wN5/g4+Tywe1ZR+P5FGRI5bcvCIFK6PeJd2MCcIgUwVo/MivyvaZA44X5XZs/mYjeEo9P
 FpA7BwyQTbL8ZpcDKHdRy0EBTAlqzfpW3+B+cZje4D49RS8vaVeG4oiTvwk7ePf/ooFmu1CpWUo
 C6fy0H2pmoFjX6xnDL/S/t7x4K2V1TprvlHmXccrqyGV4EclaEBca5J9XD/ny7V0zH5rB79fFbD
 +xAeORmDGgb2BKrGi1HOWIlIW/LVKgNfU3jgl0mBw9nghTG58w2g0lZKj4q/sy2oQPj5wA3zXSm
 WgsgHTUF+TmscWDgWigPu7b7ZQFyocSPTwsxZqHu0pRNYNLZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Apr 2026 20:10:43 +0800, Bard Liao wrote:
> ASoC: sdw_utils: avoid the SDCA companion function not supported failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: sdw_utils: avoid the SDCA companion function not supported failure
      https://git.kernel.org/broonie/sound/c/56d5a9eaf60a

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

