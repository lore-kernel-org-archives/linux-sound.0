Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E7A1A6808;
	Sat, 18 Jul 2026 00:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784334220; cv=none; b=k5scVQuG0nYvJCx5CylDvVRDfa4ULDsGwSaNy3+0+husfY27yJLjMDS812Ea/NQHHzuhuHgDLM2oT+rTVxHcScYSzUCTLK4Tx3VNXu6w5y56Z1NIzVEFn9GNOO4LrPxIaCxYzac2pTQeE4V3ABv1RvT1z7bPLHQS7tKBgKmXid4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784334220; c=relaxed/simple;
	bh=Tq/uZiGLLvHn4BlBw/ntMXQiUi2ow9N/GcGCWAtldUQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cT2Fmi2x2V/YldB1S9BOwKHiiz0IgUvd9TG+57yS8JW6334AIY69P1A58vFK0gHnTYZL9+qbLhJlDgUQVtlWk3L4FOvGUnZN3W84Q7N17gZbcVs1zTNYuAmydLrESrLIIDnX2eaJH/kBNNiTfTkATDYHzAQb1ADEqltdp/fdtQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ww1C0was; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ww1C0was"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D5D1F000E9;
	Sat, 18 Jul 2026 00:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784334219;
	bh=uVMlkDPeVRPuBitZw+h4sgiUtFyY/0dDWmct/QYtO40=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ww1C0wasZN3NQPJfp51AmyZ1eI34CwLaX+HafrzjuT6NB8HmYI0Anl8bxuD2QRxkG
	 wiPXIeqzi+fN/o8rRBntt5lX2OPoTGl2cdLxCewjMHzj1trRJif6qOqtVRUTc8OzrW
	 s1ADgAdcu2W0rrliB/aQQ8dna5OEMvnJXiD/q8nGtInPPVDDcX3JerdrhUyYqKB/RR
	 2Z66R4JRGd/hJAA5O/b7jdI43LLd/0WqFmf+aZPuMnIl5ysEJFvyW+hwQ+eW48NaeF
	 qApnRK9tVHyxg3oMjzhrhm8VO1zjOKbR4ssyBLoXPZNz8mb7H0CwQXab4oEh/nqLhc
	 X8YiIpUQACznw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: salman.abusaad@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260716132045.1469156-1-rf@opensource.cirrus.com>
References: <20260716132045.1469156-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: cs35l56: Fixes for deadlock/hang during
 component_probe()
Message-Id: <178421192944.63368.11396739389746905988.b4-ty@b4>
Date: Thu, 16 Jul 2026 15:25:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Tq/uZiGLLvHn4BlBw/ntMXQiUi2ow9N/GcGCWAtldUQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqWseJuLzWurH+l8wYDFGO2AB/PRXF9spdT2UHN
 k5/RjPoJESJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalrHiQAKCRAk1otyXVSH
 0D1AB/oDkC1/UPYkl2BoEeLmuvSXJihKk30MKN5NPlNm9DNpxsk0Py/9nSCjY/Gq5nRhS11JQQK
 Zoja12BhJCr53EHUk1dvwKkdHbZRkaJOwbkApdNIx+nP/q27HNyObJMjU1pqlzuht88ymsyr0h+
 FEDMUccIXIw/ArJD1aNWhGCu+BU6tpZYYKjBWTjvn8dYvy4z4Tnou32EZZyAjyOWM8dQQF4DtZP
 afVS9LwoLURkRdwouAOylBDebhf2rE7rYRCtIw/O7wb7vblxlMBoS10Vp9nj7SMe25NB3K3VTHK
 U7wYm3lGtMOFJmA90Do4I/WGTikCiDW27RyyXzzVoSQbjPQk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 16 Jul 2026 14:20:43 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Fixes for deadlock/hang during component_probe()
> 
> This series fixes two problems found in the probing process that
> can cause a deadlock (patch #1) or a hang (patch #2) during
> component_probe() until the wait for init_completion times out.
> 
> Richard Fitzgerald (2):
>   ASoC: cs35l56: Fix potential probe() deadlock
>   ASoC: cs35l56: Use complete_all() to signal init_completion
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: cs35l56: Fix potential probe() deadlock
      https://git.kernel.org/broonie/sound/c/93c2a8ea2454
[2/2] ASoC: cs35l56: Use complete_all() to signal init_completion
      https://git.kernel.org/broonie/sound/c/e0bffb63a2ed

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

