Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E428D3D16EA;
	Fri, 15 May 2026 16:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863192; cv=none; b=kQ0VIjTrES6YNdUdufviR7WfxBj+hceK7uL8PcKYNk7GVX+aXmM8GC8PymYR0lPoSNq54R0yX2+zzANzaKgvqa/KhB0K4rWmD+L4mmuArzJZs/hlES4VJFtkQyFkPFKpx1slS4VNckrlxunGoJDLp6YCuXxM5ogsRYAYLB7VQR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863192; c=relaxed/simple;
	bh=PAGRYnW+/6tTlNO0mVX+9nQyr+r15LGpsZEhavLZhqU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ocleibq9HwJR3ZNsVqrcFKMNNJUng6D6l4jObhv4C/giyMDYDJmz5GL5LeKHb02Zigs/VaKvSdn7p2ulp8yGJDdySMy8QrTgRtAZChg8BKjdS75sU/n/K/wvJ0+ZPnwuq6dKdZa5FFqLF/gsQpI4VOqCTcxlVkNY/8DcS/LEe6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uRwT1Xw1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uRwT1Xw1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F914C2BCC7;
	Fri, 15 May 2026 16:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778863191;
	bh=PAGRYnW+/6tTlNO0mVX+9nQyr+r15LGpsZEhavLZhqU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uRwT1Xw1RTsLBnW0s57q2ztYVjS09YVXJhtdqSKcPyhP2l0NrBqsjfK4Xky//EzWm
	 NvL3gX41I59zCbJMjHDYPTev530yodqHiVM6uczo0DR3kN67gHxHfsd+J989anWAAr
	 S2WvuDePWfbUU+AKf/B6t/Xjg6eQur7GuEsRymGQ+01oWt8nlQBdRZBr6JgnzntPSp
	 y4JQwphSQUzGE2QFZx+TkiZ9eZZ8HmtkktQw5KLhrX4RInpRiWf4Sljx+gU1D8oGmn
	 sRAUgAfbjVhScqJgSSfNhu0KMYr4M51P3x9ydorLOfBb/bx6OmGuDL5k/SUiQHUJx6
	 3Up9PRNJX3/Gg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, niranjan.hy@ti.com, 
 shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260514083358.2559733-1-ckeepax@opensource.cirrus.com>
References: <20260514083358.2559733-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: tac5xx2-sdw: Use new SoundWire enumeration
 helper
Message-Id: <177880867093.1136679.6924231520169075769.b4-ty@b4>
Date: Fri, 15 May 2026 10:31:10 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PAGRYnW+/6tTlNO0mVX+9nQyr+r15LGpsZEhavLZhqU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqB0xUT7c60GY23Gc1Qt/zB19g7dZk8skl5430A
 tAynV0/DYGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagdMVAAKCRAk1otyXVSH
 0HwzB/96vYXj8MUiQHoHL89rPgQfOVMFZN03EimgeuFjA/MY8eZlsknGM7IhznHvGlHQrc/NU1O
 +f6OJYIXwMnl+ggTiu9PZFMtORIIhCn8BqqnHmbL2zYkiBIR9C7FkvTpY6RkJ+NZ+pusRpKDFeJ
 UNi4tKf3dnfLrycuEuRyO5E80lCBT01wOzRf/zdL1qlwuzhcXieukcf8DbNVV4xXockugmjRhk8
 hz6/z9f4xwkZTCnmnWU9WYDIBBTGBLSgKmbyfPwKCysrvU0Nai9QmdhBPpbkLifPskZbh2BRgPu
 Fbn5B9RkvdG8gABI1EaRlbVpm3l5eo+zwpWdk3VEcdJf30NI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 14 May 2026 09:33:58 +0100, Charles Keepax wrote:
> ASoC: tac5xx2-sdw: Use new SoundWire enumeration helper

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tac5xx2-sdw: Use new SoundWire enumeration helper
      https://git.kernel.org/broonie/sound/c/ab50528ab5b5

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

