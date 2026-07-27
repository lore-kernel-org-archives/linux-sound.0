Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614813F8ED8
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 22:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192905; cv=none; b=ilIqJegpkN59M9P2RsN4iF50LjHWXOfvfQdZoY5/ffwB9va9z8HSt9vnR9Ir5T1W3AOh4DO5fmuUJ3HDZiCPOay7tzmqr5NBxWh49ZN8mx+U3GTgqPGv7P+QIFawFqO0fkfusGiB7g7jX7+MAw8Er02qC+oiNUxpnskXv5q9DpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192905; c=relaxed/simple;
	bh=3uHra3PDaiKwvnWAg7qj1c3uJw8AUwW1VSynGUFh54I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZMREKfnfg4v0JieHANL43QtuCzSKiayRXM9JoriHeUdzoV1FIlEVbCX5Rrb6wqwcM4+pU7CLLfP4kOsQMY1z82uN9LkeqfwZ2fsZoPVBPw2UUvWZz0dki4rl4DaLUEeMTCfAkmMmYlvyJn6lfE8VFKHvc/LFnlohKoG9DDYZ+SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGS6ba4f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGS6ba4f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0F11F000E9;
	Mon, 27 Jul 2026 22:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785192904;
	bh=V+ieArtxxGg3htPWeU4OomC4ag+pEKtXzfelGIu6oAQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hGS6ba4fIYVoWQLjtvJKvNp++5GpuYswX/GVFlo7t+nOIMGV6njgmIcSFMtmDkdDi
	 /FR1Yntj6o0lB0dm9LTL+U5xlO8KzX3QEhYJu0pjMP5byYApiGN4SqRtotluyDub2S
	 x5EBkiWInpoAhux1xP5ygR1a5RWAmWAqEJdAO7sEa6M6BvgeDVf2Ho4mnOVqb40gSN
	 Vs/z4v50WuBqAtoJQzqmxqATgZq78mC8+34yppbExkIT9tVRoATLys181YDjq+WffG
	 aFJeV6OZRiQNdWXBFmw7Dv8zwc9B3YWNGd+NcwT71gV7M02GMUkO6jI47lMC54qWKK
	 FUL+Ou5KEpYFg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 sound-open-firmware@alsa-project.org
In-Reply-To: <20260713175510.524728-1-rdunlap@infradead.org>
References: <20260713175510.524728-1-rdunlap@infradead.org>
Subject: Re: [PATCH 1/2] ASoC: SOF: don't use "/**" for non-kernel-doc
 comments
Message-Id: <178518053506.478347.6030610137932132173.b4-ty@b4>
Date: Mon, 27 Jul 2026 20:28:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1252; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3uHra3PDaiKwvnWAg7qj1c3uJw8AUwW1VSynGUFh54I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqZ+HFtZyiJvwijdHqUCsPhFolHt9DM8NFtmF+r
 TwXRzoutFaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamfhxQAKCRAk1otyXVSH
 0OtGB/wKjr/pEqc6vTX5xyp0f8lullMkTXMrs78NPW3qwT5S80Yg+PEae/XhFI31OzrBW3pKZoN
 AvPjH+adZp9Udaz58Q+fZlsbp8Zma5m04QBNu4Qwhe73iFEwfiIJ0vmmZoRUtviUrq56rFqwPBv
 +zaqQKmLe/J+Inr2QUIWL/M4PnYcRcOGrpUHM159U4EzuuYDr85Q0IyrAxtLiqezQ5tQqROkRCO
 N/MF44bVf44nsxkuRC3jaF61pJueTNjjyAWIiFV3A679flzi+srtaeATwufxe+D7I/nyocxSFib
 WjeOjy/XCqO4bJFZ8XYaSI5dnLhv98rsABctq0e1SJNTv8f+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 13 Jul 2026 10:55:09 -0700, Randy Dunlap wrote:
> ASoC: SOF: don't use "/**" for non-kernel-doc comments

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: SOF: don't use "/**" for non-kernel-doc comments
      https://git.kernel.org/broonie/sound/c/34dfc478c963
[2/2] ASoC: SOF: ipc4-topology: repair struct kernel-doc comments
      https://git.kernel.org/broonie/sound/c/14cdac7638c3

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

