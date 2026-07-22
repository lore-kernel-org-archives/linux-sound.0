Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E24F2EACEF
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 00:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784854733; cv=none; b=HgB+ukXO8kVUqZWi0dQWhYT+yVozdeBB5dgVksyrWho2aAZm479Q0HRKOIbU762yqN/s67u2YUxr0w9npwQHEqHC+73dWp6O/1dfq6ZUVh9tvzwIQQ8F2Y0Dab9RRpPg8uBJDpA1FL7vdRlSQPJL4KonYlja4FHtKw2I/c6FuX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784854733; c=relaxed/simple;
	bh=FnZle3B8Panguy60jIZWB8DOuNo9Dz4nxWb9xVQ2QtA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U7dukX+UDQdGprPbOjJ6mzaqlmQ81CMyTGQDjuPFbT30elYn5pYD3tBZC0m3ht78PDRaZim8JEQjC3B5taOBBZ+L+tdSRPKZtQkgj/PYhlF9ftnEdhDvEFFktnnsA+Ofgay90TL2fSmueJnwJFlRPWObhJlGUt281dEOUxF3soA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZZ0jyES; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZZ0jyES"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AED71F000E9;
	Fri, 24 Jul 2026 00:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784854732;
	bh=YnEmOZ4wpBoUSdNdRQSRlrpca781YBO1jejyCk4BKTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bZZ0jyESdEVTNRFlcmGHY7VlAv2uliYtDjMVjBY7V8f4EQA/mcLFpdF3OjVqluFSJ
	 iZLp+dnhz2dUgWMEqifoV5UElWdiwSmPJ/QCR4IWT2DpR2/MI9RjlcZKwzrobCRbsS
	 Jwa1O0A/LB9F5lD1YAOW56L6vJ5U22NPGZkIgbO4H7du6cXnppKD4rGKzibLh1yTWG
	 n2JI+E2t93Xj6Q2XbVVM/TMNMzInvoeJ2VB3TPsaSXPunXghVyCvoyyNZtRDwVqdyK
	 BCENQXyFXEYgHtNoWyNW4oEgF4or1ZWt10aRwcr7bT1+CZO1NktVJ2+33LbUWgPFeo
	 arpg8dB/O3RqA==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bmpi02q.wl-kuninori.morimoto.gx@renesas.com>
References: <877bmpi02q.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: intel: sof_sdw: use &pdev->dev instead of
 card->dev
Message-Id: <178473407951.5645.711810872579872641.b4-ty@b4>
Date: Wed, 22 Jul 2026 16:27:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FnZle3B8Panguy60jIZWB8DOuNo9Dz4nxWb9xVQ2QtA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYrjJEu4e3dHJWvktenlfJ12K6o+16v5y5LlAJ
 gYZSRdcGfaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamK4yQAKCRAk1otyXVSH
 0HjXB/92naUnARJa4B0/P2ouO+X5Nw6PoFpeOjnJWdazfmMFNgC2Sod6fGXcNhN8h8wn/qVFUhk
 80+N+ycjvHI7pybozNHKoPtuu1yCip3V+vT2GvnPqVoVtJuffE7V1n62VYxWLIQF8TIWkZyRbSt
 lmCuR10uDq2qEXPakO9sCIIGAdfvrsEB7234gJAZjCgCjhI9wBRJiKsjwUZBSS40NwXbNaWeRW5
 0p9jcwFuO0FubZvFQBU+jrfzjCSGhbN7R9pTkYOg2QdwZ05XJiQKCMT/okVDQIOBTNsjpVamhoq
 /brjS7KwBucK66c8vB+NFoS3h29VLV22dA3BcKD+GHUIl/Kz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 21 Jul 2026 01:49:17 +0000, Kuninori Morimoto wrote:
> ASoC: intel: sof_sdw: use &pdev->dev instead of card->dev

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: intel: sof_sdw: use &pdev->dev instead of card->dev
      https://git.kernel.org/broonie/sound/c/da3048b0c615

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

