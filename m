Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EB23BBA0A
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 09:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169863; cv=none; b=pNgJPMj/IAdc+etQ5pE4o2Dv9x5RX5j+bzgh4SS1GFkhlWyiJVWHf14UWhuGIUlEW80MFUqYcKB6BE4rk5Ci8OP9+sGehlTyaVgfj4V+u3qAAij6fFYvcLdirhOKgCkvQEBpy6BIenbpRby81DZgqzVbFbVCAPElG2RVlmdb0Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169863; c=relaxed/simple;
	bh=7+v9+W0wcPKHzvot8uRUBTfzn6vczIh9EUMR0sD7a38=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s53DVjSRA0Gogjq6M/OA4mCnnYx8iS1K5rquPKXIVu0Kr9DuFCpUsHHyQBOPmBtxlspXPh5l6UyD+XWJn+dvLfmh5sR5piH1xGvJFGZsnEyPy1fRPCF4ZUGUu917tsO2gUOafKahp6yWZdt2ygElHFwChBFXtKuy3JE9tsXQX2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwd6yOsn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwd6yOsn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F561F00893;
	Thu, 11 Jun 2026 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781169860;
	bh=o7v729LGDbkz3wCikg0d78uuW2lu5/8mwi2zVRInR18=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nwd6yOsnrHpD9xbTJzlGHOL39H+MLzD8LISwxD+243+lpM3z3TFbMO4IOzF+Y4wEM
	 Mj+BYsUQfKm40S0JHqNVOVKSCljxijII9nFReQCqbziflX8DOE1P9pRCLn0vSpude+
	 rWNrpD2/sr0SxBhngYOvbmszTpm3/9gsmE9NSwX/7K/ZeFEiSx6+GgT2boheKkXhyi
	 wFoBLXvru26+f0yKN9LOrRKNcCa8KR4zYHA/qWE0mIAHynlnqq+pCmETzO6mqN3xso
	 teh6lZx3yawxVboUQ1XO4ODg/iY/n99gPIsC5kcv7+3hieX8p6yRxDCOQuSsdWyfeZ
	 OObNbMCF6R2Rg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20260610013534.30762-1-enelsonmoore@gmail.com>
References: <20260610013534.30762-1-enelsonmoore@gmail.com>
Subject: Re: [PATCH] ASoC: tas2783A: remove unused
 tas25xx_(de)register_misc() functions
Message-Id: <178108917679.232889.879603022107202372.b4-ty@b4>
Date: Wed, 10 Jun 2026 11:59:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7+v9+W0wcPKHzvot8uRUBTfzn6vczIh9EUMR0sD7a38=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKn7BsrNglLOAYOvXI7pujqq0smK3t4gffstEl
 nKJBv0Q/ymJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaip+wQAKCRAk1otyXVSH
 0OZBB/9lWfrrEvYw1DCJIw4F3PIo6FnlpcRbTp14DlTy3IIqNzTignRlXapIH2P4l/pB0yZFxF3
 MhTqQb2mvpZtRWyadLje7uywT56OQt7yLrTuMCzgAFr1uMpVXgBvHGNkHqLh61bS2M41+q7fQI6
 9EXKKHcCZdExZbwUuhYOh0O+coicnn2OKvQj/LDfTlRFRjthlVP6EDCK8Fn0ezec8l99WHCxq7o
 Hug3lNErqEqSGuTjdmjddEZEyDYDINKfRBa5LpB4MAg7d/7GKccgnldW2qW2aVLeKDta8WSsHI1
 b/Kv+iqoXvyHSVtQPWUFmJVBpFVfSZR/VNJN/e7ErDzyKsL7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 09 Jun 2026 18:35:34 -0700, Ethan Nelson-Moore wrote:
> ASoC: tas2783A: remove unused tas25xx_(de)register_misc() functions

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tas2783A: remove unused tas25xx_(de)register_misc() functions
      https://git.kernel.org/broonie/sound/c/fda53b646717

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

