Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BC03D090D
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 10:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445372; cv=none; b=XuILyR3LYso6CF7rXsb1eL6UnyUu5UYVfnIPj0tsHzMAi0wsb9+nXTTTqUJ19NxyXV7SmD7iWuoplEpd1J9ky1tXop2PX2FiRnrMd9yPZcGGMmBSFvnsk/PaeUPm0kGtcHmeipqkejPK/GyTK4pg9/HXwrIkR1pha94EtHL5aus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445372; c=relaxed/simple;
	bh=a9Fxl4ibGhfzlwtmGM2Bj4zGNEp4u+vO8sBJtccb9VQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k803ELm8K131fetyGOFrr4f6t0lXaboSZbGXpRkhF87gGl/ws2X9gMUbRm6YBjDT6Zpc0dsTXV7KEdZ2iz1yfOqH5ar2RzlGlhxUj6SSsF7MthnKr106d5JvE6wOYZn77GBzoOYMNktDrBMTLcOHcsKORA8YMtOe1ls4srN0pW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dq9b70NE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dq9b70NE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FFF1F000E9;
	Fri, 22 May 2026 10:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445371;
	bh=D6Hq+GF0Pqg/+ovNng9ZZade2vJoymFNciXyMZnsKVc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Dq9b70NEqqf2AtVv/TzYBuUTEBy194arcI0UMRhSAlurttgSBcldXGQ1GviZKJj9R
	 olFPuPFW/oXWZD2ZzEu5dyampoZ6ZXrE4QV37RBvNuQAa+qWRlxMZtwYHijQ6EZw+z
	 UXGyrouF20WZpohRypGN7nAYKsMuZAsnToeU9pQOcIhvmkcAG7llhYSJ8wPJtdb+9M
	 gAwSP06i52xbbLfKmRSgdSNGhLTKEqv54f1QSM+A3x3qn2npjUt5qxt1VaH8qcQ3NC
	 IvQVy+ufjjZzE76NICUCDeKyNyKABPNcdT7Tkk/z5RNMp0QA7OXmYwdKv/M+Rj7ork
	 xNoKko5af4j/A==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260520060814.2024852-1-yung-chuan.liao@linux.intel.com>
References: <20260520060814.2024852-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Add support for nvlrvp in NVL
 platform
Message-Id: <177938715536.58022.17934785773759661236.b4-ty@b4>
Date: Thu, 21 May 2026 19:12:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=a9Fxl4ibGhfzlwtmGM2Bj4zGNEp4u+vO8sBJtccb9VQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC55cymEERw+c8AGzIKy5b+ll9crsor6j09HQ
 zBT64z8VI6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAueQAKCRAk1otyXVSH
 0B2hCACGBU2Rvo1e62+mZAXZlkgIIlY4BfhdU5A3CZg8i5JU3Orjlh/NzWtYOmxwTVCgbCCqeBu
 5Ojwfh9tZ+C/RtEhrgA9mxa0zyaSAnlF+Z0rLILUhMVhi9Vr2xxV9zIp69TDvQPKEgLA3doMl+f
 BNcjNBbhktjK3MQdlzlKZWt4Ppys0RPtt+J2zV8oknMByFRSfUdzPu3HYE1zv0xhTE5mETGOwOB
 cNaUN3OL/ybtuJkUHaox8IsN4wpwYGkk0Ijb2Q3/uwa8WrlKkRGMlustMX+ce6kLo3RQl/kw/mM
 BVRY74VNyIR169jsfsyUoH6S2LZmWtArs1Uhic6fRfiXBiUk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 20 May 2026 14:08:13 +0800, Bard Liao wrote:
> ASoC: Intel: sof_sdw: Add support for nvlrvp in NVL platform

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: Intel: sof_sdw: Add support for nvlrvp in NVL platform
      https://git.kernel.org/broonie/sound/c/fd9b9204f30e

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

