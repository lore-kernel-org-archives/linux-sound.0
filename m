Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FD0282F2F;
	Tue,  5 May 2026 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987387; cv=none; b=r30S/CIh31+q1BJ0gFU5jaBNuIs5pZXiYPshVssqTO+jJxao5L3kSGybeRWDrwR6YRBaTYfMSSs1anZK6Q4cNvkODh9R/AjiKDCDaAsW6NAKAM6XxSCBfxzCt3ehnZUc6NtO91eWKVyDBPP1t11E6lnLRxCsex9sQEVglhNJ0Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987387; c=relaxed/simple;
	bh=Iu8lO3A+22toLAB+04KkVogpNhFGDQtuVNPmFGqHx2w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lc0mscRmRbCU9EvdorQBTQcX1yuptQzAIX+wA2OQPihoNRC4b8X/jSymlBpk4x5NRE0S75YyHbifPe58ey5Dt+qtSzcgbkkyeRArgEVCIxm6jaBJqJFMifgjPTcJGQwQBOxzsUGK1UAYrK3DNfJpPHDXfYcOiULv1udPoeQmMUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEYWgraC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEYWgraC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05DC6C2BCB4;
	Tue,  5 May 2026 13:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777987386;
	bh=Iu8lO3A+22toLAB+04KkVogpNhFGDQtuVNPmFGqHx2w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FEYWgraChK0+CKkjrBGutyMXWEF9n9uwrI3EM0P6ZLf1LUFOjqBSn+l3JxQ6K7iep
	 jWhqSMeluDcAvpByUnUQgr9Pu0RDiwb/5H0FfgjlPANorruL3kNa33xhGrjkOk+bkM
	 L6dVLZzbxypfvoedkgQcp6VrxIe64olT3D9VRAVCQuI6rYIcc+VdsxC5P7JYqkvlju
	 xRPNjPl2ip9bE+F2D8tZvHrJ35qpOolLebk+lZgDLDggQMHBPYMPlfUY2/RyhH+35a
	 S6G7rouw8REyQBtRdhqz/bPD7fXhRqnhwiYHy1AEx3YJVr7CiZPvYjO9zLEtU1mS37
	 x1Og6m7tbhPAA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260505090811.3697153-1-ckeepax@opensource.cirrus.com>
References: <20260505090811.3697153-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Fix bad move of jack_state initialisation
Message-Id: <177798283551.568329.7927976556089948265.b4-ty@b4>
Date: Tue, 05 May 2026 21:07:15 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Iu8lO3A+22toLAB+04KkVogpNhFGDQtuVNPmFGqHx2w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+e8keF39RExhRq4hKGXSyIBZZqEZHJ5semThe
 ty7QrFaU1SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafnvJAAKCRAk1otyXVSH
 0A3/B/9bErO35i4Z03VnNrkhfkPqWNVx43uLYqyX1GQccpjWvRxPOu097s8IKrKv4nj/tkkgoSn
 tM5ZEQCXGAv4GJ5U31HyDdMa5scY6oR1UKGUlV8S2kcdmkfq5Hf+/OhNOtWOpPWEUMHAPu3k5td
 3z+3fC+goN2ZOu9XBYhbOpGAp0CMyNzh53lXXZEWoZ4xHSeM+A+6SnUzwP5B+o1WB2nHDlO6+J9
 XXAqqdEehS3EZppoa4n/t5magpc9/CCz5jXahzJm/953a1pGKQPv0drMcLXUMkD3InHm2xcv704
 Eadd+ZJAL3ybtq/dgbMk012HN3mrnbpxgnB0HjU+mBsbGZe/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 05 May 2026 10:08:11 +0100, Charles Keepax wrote:
> ASoC: SDCA: Fix bad move of jack_state initialisation

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: SDCA: Fix bad move of jack_state initialisation
      https://git.kernel.org/broonie/sound/c/36c543cc5100

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

