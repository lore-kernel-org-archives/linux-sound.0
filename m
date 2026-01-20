Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4741423A89
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 19:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768936909; cv=none; b=VqFBa1su2LNV3JFQmAOld9FspjItIIuZUtcpNirvep9C7HgYmofihOAvjGFJ8T5Xvi1EPbIUoIzEUtm4IXONyXs9EYlCd2eQuVwI6cFDw3qC8djXvPmTL1lH3nqqeVXjFQFQ7NlJQTEj+0FpNs9dU7GAXghBYU2VHe+oZHl9FF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768936909; c=relaxed/simple;
	bh=9IMaZ6Da284f+f/5r9dUTWo/y/xPiDY2McwpXBwXbB8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nK+KZAWaQhyFUAxNVU6D+sgmJdjDVEySBhWx2u54vHx9e775QxyYlPmaTgUoWLzoGbxOrlJMde0E6n1thBoz3NNnPho3dZqAH1s7jZ9P5RT282E92JNxJsBKr55cfJxm1TL094sc0TsLsrJPOTSopjfzwUqz/2pKFtHVbPgXdc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ol97gYA4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ol97gYA4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F253C19421;
	Tue, 20 Jan 2026 19:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768936909;
	bh=9IMaZ6Da284f+f/5r9dUTWo/y/xPiDY2McwpXBwXbB8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ol97gYA4p/347bORDBqtVxZCAw0IKaHKbm2q8lU2cCBgQTU3bhlHi3FT0kYboyf7S
	 WV8LweHqYmPslFjxl56Hga6bU0cZvMi1pcFaskm+0gJMn9yMWHPD/Z3LG8IBLyg37n
	 gd2OYO8PxrJZVZmswrV6A9aeSO35TVmB+f4rJG8QUlaxcVcmpDUSKNAjMQAN3TExNN
	 +8AfPD3Utoiz2bneGEJhaOK5LCdZK+C7Mw+cWWrOgdWwUJPJJmKdveEWua6Qikxjxi
	 q9twkTTMFt9tRvAxwZvLUt6W9qvcv7ZuU8ZCzxmuCeWFK3de1Q/hM1o3u1fYz6xIo5
	 KttDLbxFU+XKg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20260120065658.1806027-1-yung-chuan.liao@linux.intel.com>
References: <20260120065658.1806027-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: sdw_utils: remove dai registered check
Message-Id: <176893690805.777973.2857906615402527493.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 19:21:48 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 20 Jan 2026 14:56:58 +0800, Bard Liao wrote:
> Checking for a registered DAI for non-existing endpoints causes the
> following error. The driver will always return -EPROBE_DEFER if the
> codec driver doesn't register the DAI of the unexist endpoint.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sdw_utils: remove dai registered check
      commit: 8d38c275f7ffe257d21bea224d4288eef183817d

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

