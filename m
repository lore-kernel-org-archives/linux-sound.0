Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E412A29D29F;
	Sat, 16 May 2026 04:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778904738; cv=none; b=HZ4BeXA3myYMjur/H5ETWmqTEAS2nUBoHqWRoPFFbyxHtdZ1aVySNMoZ919AC0owP3R41QHmb9HwiJ1yqyzTLjhmZJ9tX6oMclEY0BlfcbR/7f85nT/97XySdr8HV3/LSpa4nCGTuVwDtbYbezTE6EGMkJZMcqthieiBL+2VfA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778904738; c=relaxed/simple;
	bh=vv8am+FeciCjQADfYcNSGJnKdXXqy67nWt8DZ2TWGCw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pZs4rxPM3vpjRrFiP14746xy27I9T8tzCEXjGNMeryxWW79H4Fjoz8UYx2c55KBQuCOkTiul16kJulKgpDPnw1+gWmxff1E6gCASOYKJLRjMa87Akd72ewkWVu4HrBe3vTYl05Zq/VV/If3BnccnFJ7dKZ3zahnk+lqtEdsynkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcOEqeeG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcOEqeeG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D81FC2BCB8;
	Sat, 16 May 2026 04:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778904737;
	bh=vv8am+FeciCjQADfYcNSGJnKdXXqy67nWt8DZ2TWGCw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kcOEqeeGPtY3waFqKL2Ruen9Y+YO//FKzvB7W/efol21khHrLYz3rzEvoj79gNhIJ
	 gz8KWtZRPBLbLdP/XxiViHY3p/vdj68N0skJTksKdQCfymc/mcv1kqXl145rVoJ7mA
	 mcmTdUmY7RAtL+n272DEjTO6n66wj+qJsxzEUI2HdEiiYzoKCc+yeIF5guwWNUCFWs
	 jpJiGln/CyCyoFXKJnF5fGUSCC6RtZ1WVf7ncuqrdXNVFLXlAI0/HEWibH2qwqFTyh
	 nGnc+dqJ6A/I3kt+wxfea7ivc7exaLxa580xTkM2g0Hd9hiuPS3ta3SkC3YDSHNcpu
	 k8FOMW+6kYHUg==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260511-asoc-amd-acp-sdw-legacy-dai-name-null-v1-1-dc6151b6da8a@gmail.com>
References: <20260511-asoc-amd-acp-sdw-legacy-dai-name-null-v1-1-dc6151b6da8a@gmail.com>
Subject: Re: [PATCH] ASoC: amd: acp-sdw-legacy: check CPU DAI name before
 logging
Message-Id: <177889830310.1174745.11703573759261692106.b4-ty@b4>
Date: Sat, 16 May 2026 11:25:03 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vv8am+FeciCjQADfYcNSGJnKdXXqy67nWt8DZ2TWGCw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqB+6dQxtG8JEd1TLfIHN+ScwARhuGM5Hjp0kBP
 lV1V9Zx6FWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagfunQAKCRAk1otyXVSH
 0DnXB/9ucZZfH6J/0WGjKIjmtBSH+S716xg5yUVcD7d62zvvOU4ZuCALrp4d4i4M7XtW39d79O3
 PZuRAhcWt+tIgTgtApabIEL8KpJVbXpotbtuAX640PinJj13za6BSKlLb2WnmiE5RC90mJKkzMk
 G77hvdHYNok0vsZpVEPQ+Kl7fsbP1FbSudroWKsiO2OT7jxV1f5Gx4/PTrMKyGA9F6aJbOqkI3I
 MiHv/6nRaUjNRgl5xHptfxLRvtrnR5qBI3DrJbHd/h4GpKW6ZZhz+Tt1uMqIo0aweYnjiWiI5xH
 kGVhgR6T8g64r0sOdzIh7jn7rTXnXSEwGzA6/ZpHltDE+ihy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 11 May 2026 13:42:02 -0300, Cássio Gabriel wrote:
> ASoC: amd: acp-sdw-legacy: check CPU DAI name before logging

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: amd: acp-sdw-legacy: check CPU DAI name before logging
      https://git.kernel.org/broonie/sound/c/1afd8f06dcb1

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

