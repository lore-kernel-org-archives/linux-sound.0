Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDF831619B
	for <linux-sound@vger.kernel.org>; Sun, 26 Apr 2026 23:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777245756; cv=none; b=F6itlVDBDBqCvcbiztaFZtTI0sb55MGk/4Kga6BiZkHFiD5dRBnLMO+D5q0/T7wNTZAIJawG/BtmbsKPgoO1+zYfoaqgvdLkaekkHAsjHoX4bYhsqhdHhHV5ldJiMZ7IbVY7mAtSyEjtouadG20Lg5NkG3T/0mMFgu2ouktEr7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777245756; c=relaxed/simple;
	bh=kiJglZ/30/8Ol7NyESoLQ0LibuRTLQxEphVQwhRV9tI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Rp7bIsyO+JvnsKSVYE8owXwftHcSDKQbfW+k231f/PZYASz7otZy5dbCzzOL7VK6l6ElfdfALNN9iJRh2AGhBhxksULPYJj689+Pwh7HSg92jHNYkIlTXzBy2VfZV1Gb7HvbxHgp4KDgDJ7zbw6oTUhRq2XLUZOk+qHn2eNqK6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0UMTrUS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0UMTrUS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57437C2BCB4;
	Sun, 26 Apr 2026 23:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777245756;
	bh=kiJglZ/30/8Ol7NyESoLQ0LibuRTLQxEphVQwhRV9tI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k0UMTrUSqhXfXkEzL+BW22ik4BCVaE9tEdgdP8yto5mDUmm6lVDs1P0+GwJzNN6O4
	 li9AFZpyoxhxV0M8Ymdn8NmCDNGuy0HG60zBBaIu+xjOhyrClw8qh18uM5AWXeKRzv
	 EhEXlSsbePxftXU09cW4GjMbTZ82DjbnJgjiZdeJty4FIuSJ4vOF6JrZNfaGo6d1PT
	 64Hg3Iy5I0dV/DvBjJ3GPVF12rKlLniCN0ykjSXb7aXlIjx4SrRy/TQjTzSuwAS6G5
	 LchLyki141UsmmFcq20A5I5JUzQL++1xDm1wIVHwEMxSvmCxwjvzH7cgIGu4rhLwVO
	 gzlX6P4xeHg+Q==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260424105031.114053-1-yung-chuan.liao@linux.intel.com>
References: <20260424105031.114053-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: add an empty adr_link
Message-Id: <177724049962.266775.5548137692021701185.b4-ty@b4>
Date: Mon, 27 Apr 2026 06:54:59 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kiJglZ/30/8Ol7NyESoLQ0LibuRTLQxEphVQwhRV9tI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7p46ltDzdrfViiatbgHxwubxN1GhYmD7w32FZ
 ICOMgYiagmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae6eOgAKCRAk1otyXVSH
 0EDrB/9aY0hvVgIE8iTUtSSMssVKEvJlXm8f+ivXkwKuSvK3fu9DVyHdcjJwtrBfq9LUCYdiYeZ
 u+1XA0N8tveZ1CP4jbgwU83tM+uZHTGM6GKqZ1JGkICXbzEFxAaUBN32ApvVVwpK2eblFv/q/Ui
 bP//an94kT3va/fCFGpRxtk0aV9mWNJ8bRTCDvNvFOWe2dIeTxawvBbZKObJZNygWStCk1MUhed
 +PrJZiuxGhEOA648MmwZ1v8l6b6gINXMVxM8vLuaUek+GIovzIb54AFW7COHS6WzmCVIjHFKWC1
 mkQ49wT8mmzQelan7/TYWEt0/p/H/nvX27or2WTfww9b0r8Q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 24 Apr 2026 18:50:31 +0800, Bard Liao wrote:
> ASoC: SOF: Intel: add an empty adr_link

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: SOF: Intel: add an empty adr_link
      https://git.kernel.org/broonie/sound/c/3c6f06a20079

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

