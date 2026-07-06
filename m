Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C32430CF9;
	Mon,  6 Jul 2026 17:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360504; cv=none; b=aMkIycIUKFb+4wFSNOd3gJnO05R8g46XND84KP0tMK3FumlbEcA31/d9GOHTQCOtbCl0rni8M60yQKxpJOPd8yseGNOgJm4VxMGox3zinhWl9NWNZ3oXtDXxZPHNBqjZrSLC2mmFmZpxGZ7w4XcvwSljTFngVED0e+6lz+/47yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360504; c=relaxed/simple;
	bh=8q/oYR08n1BOVOarUPf4HXj2LSgjHqqAt7qLZeIR2sY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=At5H7NzvF6Yf78crobV39J+0viFPIBmnyWGxnroNKSXTG+DHpTV9OdimLY23zrxaA7EPHGgAK3lnWma6L1Ia/9rWDp8u/U2qBFa7v3Qsatn3ye2zcxxe7MsHdvSTEtzwA/s4vXBs4u5uU/CD1sDgiJtJntpYnxdAsQJpHaIJWVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TuRJx6FH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TuRJx6FH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB08C1F01573;
	Mon,  6 Jul 2026 17:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360502;
	bh=kSN5/GG4QaWWLcFjpBBGBDMrOVpOGRX50JCF6lzomoA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TuRJx6FHrx0DLaBrx1QYAk7i8MLVOVhvbmdVoE6sh0HzC9NLyPb4di/SuzjZQx0Vc
	 mSqXPyTPiuXpUeS5GIluDn6SEGAIaTzr05nMNGk662E/1ggQ4f8STJV4rCkOZ6h0x4
	 SyPIrFU52Do4SldO9dkrzEca7cGoNT21bzSz5K/h/Qh0w3YzEqseLhfgtgcSs2Ff32
	 xHuzEr+/0pqz3U5k0/vDwfdP82hk0cOMiB/UNS9+MK+bnF77V0R+tM3ZJTlbs/YuGM
	 ERJZq9ZToh/5fvPCGtrR1Q2s3ABflbJKpB0cGNxWKO4KAn0/ByYgz+a0wP9AT0wfYh
	 06jppRLxvhSqw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260703130210.21991-1-mstrozek@opensource.cirrus.com>
References: <20260703130210.21991-1-mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: sof_sdw: Add a quirk for 0x17aa383c laptop using
 sidecar amps with cs42l43
Message-Id: <178334436399.57168.14240159266704836872.b4-ty@b4>
Date: Mon, 06 Jul 2026 14:26:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8q/oYR08n1BOVOarUPf4HXj2LSgjHqqAt7qLZeIR2sY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqS+vz+lIv7m633Ow6kg7ZqCAgUKkQBd37u4PAw
 U4fVmTwfX6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakvr8wAKCRAk1otyXVSH
 0ItRB/4nB4zMRixubsUC6OjQECuzzc7OHrwg6QzIdTKHUdvsp6wil1Zi2HcpvePGSyz1uGEn6c8
 bU1M1l3MkdyyI5Rnqx/tQtJqGXDgCn6huJdtR43EOsKQEcBWuwdHqwXtZd6/HtNLeBUUe1ka3jr
 NAknFxAoCWY5vdgyqcv3zzAywNCb9W8ZiSivZlrJa5YLz+DjvsGWk2MW2wEBahc+D36/chjZujF
 Ea6qstKEC5stoDSpZP6noqIQS03Bn7R25/06hbzJ60w+i58k20/UdP/4fcyXNRSWaMsm3vpbs3S
 chTuBF6VMdsofI3tl7kjC9+RiqurN0yOFGj7tYiEBeXa55/y
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 03 Jul 2026 14:02:10 +0100, Maciej Strozek wrote:
> ASoC: sof_sdw: Add a quirk for 0x17aa383c laptop using sidecar amps with cs42l43

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: sof_sdw: Add a quirk for 0x17aa383c laptop using sidecar amps with cs42l43
      https://git.kernel.org/broonie/sound/c/04f15d8f3930

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

