Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32ED3E51C1;
	Thu, 26 Mar 2026 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542078; cv=none; b=kkQSF0ppzZ0lox6N2bU/sHfNljlBSSHCHIgsezKQAzIq6W+tRCiSvhXdeKw+tos1gHBBLFWkR2WCIyFgp2k9KQQFusPOA2wDMoxkkqqlh8SxJY+YLnmQTOwYUK8OuH33njrVmnzW4zEPzxSizcP9Yu+R3hzxgX91f2/x9QiM4j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542078; c=relaxed/simple;
	bh=VEbZKzqlaJMHj8SEPEVTR5w94BMW8G8i7JC5xDq8lz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iLXrRIynBoZrGKgEFnD+BFvvcGFJcM59l2WsA9toRMNXSKB2wAQP3HRP/RVw8AFZRs/At7ibP20BUewI/xZimQrMn60367tXDyC/jemsNmFC2Ain/in+V6Yw6Fyvem4F2yoghVZs0+lq5wi/5pk6Qrt/M3KMLoi8Ye7RZVii68k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5MkLH8B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5MkLH8B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45191C19423;
	Thu, 26 Mar 2026 16:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774542078;
	bh=VEbZKzqlaJMHj8SEPEVTR5w94BMW8G8i7JC5xDq8lz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b5MkLH8Bi7rr+/JnLb4XZuzvbLQNXC0HNpYD32HNk5o/aaihmCLcv8juSLjhJnBmj
	 pa7IN9/roTX2od6hR/LitfgXBlAj7r3YR92M1HQWrS5ntOLazip92mvqMliYJTYzGJ
	 Vk+E2mQIZQmQaDDWtcOt38Hh/iO5QSP0V446NkRl4NXtsemH+3tCwH26CptLpYs5cn
	 J4xXKKcVlzFdCcA1sZLPWTiTOhrTrvXaB6Lb4pBFKBxwdm6T+bak6YvN9wjO8qxA/f
	 E4l/uqimIgfEsbhHITIv3V2ZJr0f3uHMXvEvHFDOLd4tsW3JN9L1jdqcHeJWPGFJpJ
	 WFboSiR6TQeiQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, songxiebing <songxiebing@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20260325022804.253353-1-songxiebing@kylinos.cn>
References: <20260325022804.253353-1-songxiebing@kylinos.cn>
Subject: Re: [PATCH v2] ASoC: renesas: Fix non-static global variable
Message-Id: <177453037196.151520.14537679598756498435.b4-ty@b4>
Date: Thu, 26 Mar 2026 13:06:11 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VEbZKzqlaJMHj8SEPEVTR5w94BMW8G8i7JC5xDq8lz8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxVz8Wq+m68Z10MyUqxvXgmbor4Vn+8oq01HlU
 BBur62DAVmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacVc/AAKCRAk1otyXVSH
 0NDOB/981dbNkcdW80hvx3ccnC7sAsjGN994FJZvB0SsNKzfr/EzrPK7plx4Oi+M7CS0HafwTft
 vlbEmaDRIEbwugzjRed9Zu6MnTrvGYJXxemJOBY5NUYnvvfAsZVEMNMQFvGFpr/lhK2+zpsApwg
 1ja3dZH6O/N48hUWt042Rzq33r8JiRPiU0DMTN2jD6Zo/njW6WRAJ0Neg1CmI1n5ESQmv45PJeT
 gJBePi73HqOT6ms8X8viFmK6K343/kXXzI3BHl3eaqvgl1WVdonXhAWuPfVlntdtId4KylXmys+
 A5gFIuCja6kgsHAmPQRl9fWWBWE1lT2WaqO52tv5mkGuzQyO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 25 Mar 2026 10:28:04 +0800, songxiebing wrote:
> ASoC: renesas: Fix non-static global variable

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: renesas: Fix non-static global variable
      https://git.kernel.org/broonie/sound/c/e113ed3e73b9

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

