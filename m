Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93C7315D2F
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 21:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765920574; cv=none; b=R5k0CEe7dO5y4lYU4ClRsbDt7trRT7izl6ZMUOQUTAXFt0QD7xNVrkoPaws4SORsL0wVHq3j2XRHuhhet54IUtIbc5k2VJieqao45AHBFCEAasCMJ88KXtPDFgLbAsE+nTDtY+F9KFB/dYO6kFFZs8by+f+/c+HKdPE8tOK01wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765920574; c=relaxed/simple;
	bh=GGuywUuK6SnHOIpkXU8VyNj6nac5j2ooYjSprY91aiU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h4pTEjG3hqd/DhEiRMznweIYHLJn24NWMvmu7QingUBTncElL5xyhN2cbloPoF3mxMJ4VES1qGNcTubidnu+oXj22Wxfk5RmBUW/V1b7diSwXX9Cp8XnWxrfQO7uJD77FgbtfNqzZBH4OeFCQjWokST+5fwq4Gi6PKqtxH3FxcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgC/mZBr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgC/mZBr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FAC9C4CEF1;
	Tue, 16 Dec 2025 21:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765920574;
	bh=GGuywUuK6SnHOIpkXU8VyNj6nac5j2ooYjSprY91aiU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EgC/mZBrhkFyPP0lH7YfDJoXtH9j6xNUyLYloFAvqDTHUYdj1jGFUFBLD1DEOOPQd
	 HZl0gVZ7XBLYNaScMIhSlmeecZtvOnd4e9F7CpHrjxw3YERFt7YbmDYMtlRhgu3sTR
	 QXFX2272vG25DWQDMr9Kf40myvGLBv1Cs2+iRtT81MUflk/ci5HngiqIe169QhnsQy
	 PcqX/kDioLCBPJDyt9ZrPHh4UFcXfNXWadUaZmHjBO5cS+94D/4PeXEWO9EU8rlYEr
	 6ZifS4zKMXr5ZUDMiXu2CMwIOZ5PY/EI/XIQ8O7i2TVYd6GYdI0zoOE21oGJdYEodo
	 ihmee4YRxXcjg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, tiwai@suse.de
In-Reply-To: <20251215101036.9370-1-peter.ujfalusi@linux.intel.com>
References: <20251215101036.9370-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH for 6.19 0/2] ASoC: Intel: common / SOF: Use function
 topologies for NVL
Message-Id: <176592057237.234391.17969224130278759223.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 21:29:32 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 15 Dec 2025 12:10:34 +0200, Peter Ujfalusi wrote:
> support for NVL-S and the support using functional topology fragments for
> Soundwire configurations is introduced in 6.19-rc1 in parallel.
> 
> The SOF projects plan is to not create individual topology files for NVL
> as with SDCA and the functional topology support can handle most if not
> all soundwire devices going forward.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-acpi / SOF: Add best_effort flag to get_function_tplg_files op
      commit: c8f3c9fa75ff3822b56b47d5cfa0aaa484040ea8
[2/2] ASoC: Intel: soc-acpi-intel-nvl-match: Drop rt722 l3 from the match table
      commit: 91b7f7d0eedaaa8993e662c4c6db9b3cfe8a2faf

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

