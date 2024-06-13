Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4517F13DDB8
	for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 08:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718268150; cv=none; b=PBnIpDC2aDUqWn+kRJz4/sNllOkpeTj+p1YMyKuN26t6EjmnIT84ujHPt7FEoDXCFSRfecnyUuON238U/pMDzSBeUtm/TODTomtZrqW3L1IHv1g3SDTy9raypsWDOjJcRJ3zbb+0euYUWVcyoiVtg90stMQZO1F9eQCj2DZKWsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718268150; c=relaxed/simple;
	bh=/A7abzR0nfC1k2xVmSlYs8rLUypEYaJctAfBqRQ+7kU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TAPaW4PxXtjvQzYF6PUIBlCpXCbj12uNYugV5aQu1N4GJyG+MccmWmbN58FjaeNP218w1JrxQyb0JlqBCe+ZqlHgo6SXD3dhGrN4H3Ka1Ijttu9nRCHaEDuGKLcTluVEmh5Xn9fgsrW1VvVYOTZici3oz0v0xmBTPbmLeTBEaNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDrONJhI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDrONJhI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A19C3277B;
	Thu, 13 Jun 2024 08:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718268149;
	bh=/A7abzR0nfC1k2xVmSlYs8rLUypEYaJctAfBqRQ+7kU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aDrONJhIOR/8BYPHN4Q8CmFrpwLdVieQpxiZeGElrTDYb9Xgwmanj4LE6UDtb8LgV
	 7ZL8RFsZLS9Ay8vqdMbAoRe5yL8IySPpCWk/ovLoxNDYMr2G/OgF90FYCQCtOq6XfT
	 LQgqb35w4UL8EbgqyMW4QMuKHk8p1L+v9iUX0a96uDJ47pzm5TIM3TNTPikW+8rG/G
	 Y4l6MRjwC2ex/0rv9uz99cM0/PBJK6tpeOliYNEarHBQ453flp4vAZRN35bCycToQI
	 HyALr698h8aRL3xiTYdoVZYja4fuTLLDA8pJJBxAVCoJd/iBKJEWCH8EANqiW6uvmF
	 I57MKOPxpf8Vg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
In-Reply-To: <20240612121203.15468-1-peter.ujfalusi@linux.intel.com>
References: <20240612121203.15468-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: sof-audio: Skip unprepare for in-use
 widgets on error rollback
Message-Id: <171826814960.249517.11714936800006262287.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 09:42:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-4c370

On Wed, 12 Jun 2024 15:12:03 +0300, Peter Ujfalusi wrote:
> If the ipc_prepare() callback fails for a module instance, on error rewind
> we must skip the ipc_unprepare() call for ones that has positive use count.
> 
> The positive use count means that the module instance is in active use, it
> cannot be unprepared.
> 
> The issue affects capture direction paths with branches (single dai with
> multiple PCMs), the affected widgets are in the shared part of the paths.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-audio: Skip unprepare for in-use widgets on error rollback
      commit: 6f2a43e3d14f6e31a3b041a1043195d02c54d615

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

