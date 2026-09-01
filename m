Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5A749C4A4
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 18:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286853; cv=none; b=rEnTvb3xFGcefuaf/auqzY/RTIojj0NAKAYiYOfRpZdToe+uvofYCGWUwt1NKZ66LHTPNna0LpMNgNFi3ztIk9locIpVIYCOOrM6Azvi31FhdUwh87DHWTRQBWLAZWcJMiXV8Y/fiRm0FBwFy1GiIs3ifPAtV9cbZispZ9ujHhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286853; c=relaxed/simple;
	bh=6k8eJOFTsfRWUeX8QAV3jZCDgXMZUg8B2RkuG+7ekzo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QLvFWoOIyOAEwCt/JRobSPpmqr3xWw83RmSFRWaaRRTr4phXQgf/2QTQITzywL8RuLRkcbQjr0oEteKekxt31P2nZ/sPAUFTshSBqgszC+zTApdFnJSMr1OttO9KZBZFEafV/XdSCrTfdlCjltdbRaLDN6u9vCqvoz+DOXBvPaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJhwQP4k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJhwQP4k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335AA1F000E9;
	Tue,  1 Sep 2026 18:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286851;
	bh=LUttuv2QFlIhJgchiCmdiz62KLqYnR98E3YwxSwdbZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aJhwQP4kfiDOV34rDtgnQlsq4/wK1Pdq+M9eIJ05kBWHiKbDEvbvM0FBW0RhWS+8M
	 Nj7eDDUvYwmroqjnJFamBKvdGnhh2GeZGtuvOmJf7BQpRN7lDi53uob8guuUiBDOq/
	 GWxFaTRT5bg3WHKw186px69ooSQURZRUaAUvhAZUqzAlzDBqybRyG0DPeBMZJY2awr
	 XirP1q33o020XOCQ1vvrfDqj3bmIFqJ9SrhUSzRwjnuBIovWLuhbrakFAs8Kw+UmoR
	 9W0Q0aGNoF2wWqlKBMir96IfPbdL5tsnA4+v0Z2MZDD6yjxUF2wnm5L5Gh3ttzK29v
	 CXwI4yuuRIAGQ==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
In-Reply-To: <20260901013105.1589-1-shenghao-ding@ti.com>
References: <20260901013105.1589-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Add register decoded info to I/O
 error logs
Message-Id: <178826944563.33904.8316524847527985556.b4-ty@b4>
Date: Tue, 01 Sep 2026 14:30:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6k8eJOFTsfRWUeX8QAV3jZCDgXMZUg8B2RkuG+7ekzo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxd/fZNsSTnfzjAPNCCKJSqszKznRUNMTutEy
 Lzp9XrTLt+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXfwAKCRAk1otyXVSH
 0E9jB/9gYAfGoMMvhIWOyqVC/D/uHVCjuHc7gmY3R6B6v+7KrAiHyh6eguT1cdtHORm9BFAPTBU
 2yTODYdgHO6xr6FWz1WYXAn9nhrdOT83NovVOqsUdQSlXC6l/KR/6m5I1l5OeVSIUDVFAi0PbSp
 cbmM3dTu2fCdVVhUSsuZxn6JmxpdUCeIhKY6Mu4k3YH+J18dy5F7QWaFlnUmlXHW5BwXQn66Xjv
 /1v2hbOIHbywFj5B6dIR2X//BNzGZc5aEXGXbtPDjsZj4da8c89wgmTY8CY8bCdXJySl8mtd1P2
 VoHZ5QnP6IWZM7nxMihdBmKo5UsX6Kfh0Skl9FgpS00XQxss
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 01 Sep 2026 09:31:05 +0800, Shenghao Ding wrote:
> ASoC: tas2781: Add register decoded info to I/O error logs

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: tas2781: Add register decoded info to I/O error logs
      https://git.kernel.org/broonie/sound/c/6f83e540f945

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

