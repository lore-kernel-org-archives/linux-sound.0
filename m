Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6E212E4D
	for <linux-sound@vger.kernel.org>; Fri, 29 Dec 2023 19:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNZh+I7U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082A2C433C8;
	Fri, 29 Dec 2023 19:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703877463;
	bh=EssejaHOimwjK9bryaSOEV53RhPCJf8JjO8DtqHlguQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gNZh+I7UtXyZO8S0jpRAO6nD1bjSDwDerMSKR4l19LVZqrdUlYd8yWGGc4ofF1xA3
	 7Npb+5Ps2Uce/J+IYUz7YKDxnX2YgA1TV8I15mT1QolhVFuU8YtHMJ1tTX+TmWTlon
	 vc/CkQSqq882URKK8nJYYB7C563dRSQi2RGMC6IxYZvzY4JOfY/6T9JPvbdwS7we01
	 WHM+o9Gn6IZCJhksrquTUJ56bK8y9a5zG1LqJU6S2f2NlI/iXFSEBroiI8tnMd8ao+
	 Mr6jVlKvRZ6xl+/iabMvL7gcnu+8m2wlIM15ocTB+JfN8KgeI95Llx1WmeyNc4tqgn
	 0Q9cLTyoy9wQg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 yuhsuan@google.com
In-Reply-To: <20231229092922.853-1-shumingf@realtek.com>
References: <20231229092922.853-1-shumingf@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt5663: cancel the work when system suspends
Message-Id: <170387746062.3014555.4220246146701708625.b4-ty@kernel.org>
Date: Fri, 29 Dec 2023 19:17:40 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Fri, 29 Dec 2023 17:29:22 +0800, shumingf@realtek.com wrote:
> This patch makes sure that the workqueue is completed before the system suspends.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5663: cancel the work when system suspends
      commit: 5fa3bbb8eba7eaddd5c57952fca1f28bc3520d51

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

