Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6631DE892
	for <linux-sound@vger.kernel.org>; Mon, 31 Mar 2025 15:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434038; cv=none; b=dy2N8NPhABYr0oCYYMBMAILAKY/5oSlVErOyQkD5+aBeMQErOZLr224wEQeXTMzgyAazgvfNqN6QSbeoRC3+yM5sGtlI+Kj2Wj91DpLHx7UWmjjVIj2b5xO7gJZ7ZouJvcqCDcY1/mnu4e/wv01RQQuuC1qPHIqepsmcdt2NOWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434038; c=relaxed/simple;
	bh=fa9SHS2/eGhPPV7Pmp/EdiLvL2TAA7Obe/me7oYKla4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oNbTen7cGgap76hnVNjZjdCZbR7DTgM6DA+rD22zuVos87HhmCC70y7a8dj544Zp+EYOXn6h6GhCi7pr/aw0t7TE4VUB7/HvSr10hcTwPQ9wLc7fhJ7Ar8aLkgWOI/Q5JEfObJMrXpYvYvfB1MbKN2YJZXAardZRYtF3zilWdzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHr45Pf9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHr45Pf9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF58C4CEE3;
	Mon, 31 Mar 2025 15:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743434037;
	bh=fa9SHS2/eGhPPV7Pmp/EdiLvL2TAA7Obe/me7oYKla4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FHr45Pf9BmKw+0b5chdjaw2cO6ZElkuxE+UCqWT7ZgIexsFgwkC5SGumUi8V2OlaW
	 Hi1jk25FeXSoA/8x58Gw/DxdyPCeZq4z60QnS4Rjgxo1p/5qrh7pBMu5tEgSaxNOqF
	 KiOPSUubrtio6SOlokOHw4i7cbh4vzeUeZ+npnkgmhvnAn3MZkYOtAP7Bs+2wRz04j
	 XJ6PgPtyLn5NIZXmCYfxjYHXlhx8a/MboUCdXm7Vih0CJAHc0uTXVA55bD/SXjoXBy
	 V5kJt10cGb4hiWYQQmHOa1jLVQiR9CebBbJ1GKvOj/nrkiNjZ9h1Cm199lfhOCLGSw
	 tRH8mWq7FDfUw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com, 
 guennadi.liakhovetski@linux.intel.com
In-Reply-To: <20250331070623.5985-1-peter.ujfalusi@linux.intel.com>
References: <20250331070623.5985-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH for v6.15] ASoC: SOF: hda/ptl: Move mic privacy change
 notification sending to a work
Message-Id: <174343403594.95840.11232447526025550687.b4-ty@kernel.org>
Date: Mon, 31 Mar 2025 16:13:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 31 Mar 2025 10:06:23 +0300, Peter Ujfalusi wrote:
> IPC message cannot be sent from the irq thread directly as the message will
> not receive the reply (interrupts are disabled) and it will time out - the
> reply is going to be received right after the we leave the irq thread.
> This is a different case compared to the delayed IPC messages due to DSP
> busy state.
> 
> Add support for sending the mic privacy change notification to the firmware
> from a work instead of the process callback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: hda/ptl: Move mic privacy change notification sending to a work
      commit: 7d783d9074cb1d54179ca03df514fe4b0bbae5ab

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

