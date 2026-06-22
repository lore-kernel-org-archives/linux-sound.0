Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9493446A7;
	Mon, 22 Jun 2026 18:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782153760; cv=none; b=eSf0H4uj+gND8M3Uc4gIW4vLVoGkgkasi2orwY8QK4ieBZKpdNkCbx9CWaMJdNAn/x3MB8KAZUTwhEOu7a9RnVhO4H3SZ1GfyYHbIiYEfuM5YY5LBWeLoh3CMg2XH7FfKlUn7G0Wq0t4sN5Q3Y00H0V7fUBkxUh3VF3HTiUxk6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782153760; c=relaxed/simple;
	bh=/FQm6RZLpkjoBULIY73tP5bDg0ls1jyXgNtwN4xKZlk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gtG3qMyIEGNz/Jb2KuO9qwNkK/d80UkL8HVgF2u+eEVoxAK2hmvRhmovaargCeyoFg7wd0TBZ0GuPRvwl1b3jt9gSyYnSTtclAN6q6nCKCW0xx01SLceXY4mslRgmc/2UJaebHVjpOdqLqmdXRkgH3rNkspCsYhzPovi0jGWo+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lY4sJ5lm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lY4sJ5lm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467B81F000E9;
	Mon, 22 Jun 2026 18:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782153759;
	bh=pUd+jplyDEt5RbkM+uFASi5vmC/JXAhk/P6dFSNRPxA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lY4sJ5lmu1nis4NgI4Zemt9q8y3Z5VG+TH8xn3q7S3sNfxT115Mx/bfOL9A+5O1y4
	 yArWUJdVh8X607+tMvxOH1C/CccqwfYx98WNnsMEAu9KAvHIGfDwCHp0cT7mNJ3jeM
	 EiOQQy+trP1mgV0tJo8cTOLN82EXqwmhyub8sWcjyQhF8ntoB+iotW/pH89d96KSE3
	 2U1W/ImDW7r4adhCOpoSlt2/SSl8LiGScVDh6dY1RSNZtVDM/Lty73rZ8w0yM8/ZdX
	 JNPBAFrxH/qZSIuop7o+761+eDHCnd6HIxiZnKEq+yLsR07dkKHXYv2kUY0wurJLtt
	 x7q8YAxHsIOOg==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Paul Handrigan <paulha@opensource.cirrus.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>
In-Reply-To: <20260617-cs530x-mclk-v1-1-0215b5f1a0a4@pengutronix.de>
References: <20260617-cs530x-mclk-v1-1-0215b5f1a0a4@pengutronix.de>
Subject: Re: [PATCH] ASoC: cs530x: Fix expected MCLK rates for CS5302/4/8
Message-Id: <178214935461.69285.2475021648658563381.b4-ty@b4>
Date: Mon, 22 Jun 2026 18:29:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/FQm6RZLpkjoBULIY73tP5bDg0ls1jyXgNtwN4xKZlk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqOYIcX1/PIM92yJjpuTaqa9u2MtE3wXDWUgbk8
 SeiuQf/Qd6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCajmCHAAKCRAk1otyXVSH
 0HJcCACHD3NxguP8FM8MOFMlZ67d2iVQnOoTpaPyxX7jyCKW92eLEuN2WF/OEWPVbi8QuujMe4n
 P9QjzItkuzK4QXMytEhQffjdnTU5+hMs5IZIF8Tu1BTuocRgQcVqKXuGbXho1kIHVBNvjOYyokY
 SP0m9A2cYeJcYsz0qfCMHwuITULq2ZGK++NzbgKJBJzGLoHg1p9cXOPIBdGEoeYlUb0eDdxz/vB
 muCsvOJVdXmOu7/KTAnQxIPHIn9bVLOoAOXBwy7CAVP5k0WuzAYCs0Mq7TEdTxb1rzv5j3TjclL
 8DcK//liGKNLHhBbGbND3tI2kmSr1rkyOZw6RJz6kS//wC2+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 17 Jun 2026 16:47:53 +0200, Ahmad Fatoum wrote:
> ASoC: cs530x: Fix expected MCLK rates for CS5302/4/8

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: cs530x: Fix expected MCLK rates for CS5302/4/8
      https://git.kernel.org/broonie/sound/c/cf81b260916c

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

