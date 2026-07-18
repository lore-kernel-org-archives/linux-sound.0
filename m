Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF3E33A70E;
	Sat, 18 Jul 2026 11:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784375511; cv=none; b=HKr6z1jrr/BQPyRwkgQuZcEBizUzhLQVh4FXW/vGeziwO3XzVYVMQA0VNiTieyIHseOkaNYdF7YlYiErv2Bo0z43DZ3tN5gzAVCYfu3R25E5CsVcRcZJ+tA2qei8v7BSdbwG/LTnCBtqhP/+O9Fxe97iToYY0XvTrWboXpWifF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784375511; c=relaxed/simple;
	bh=t1FEbwgmBFsrzp0w1i7/4UK/FSLvCidCuLyj0mAahY0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DHhGU+5gg8zvdcDEayOsXrlrrR+heybJs90qq/bGLW1rfO+VbcYGIGJDY5xHXl+b7nAg3wYvIL1KWFy/JJKj4RmTHwcG+8gS/u8/b/ut82+85kc9KwYc/gf7TuO/rTZg10dM639fFXPLn4cTKPS90hzxPzH/6bQr9Xw7Q8byR7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkKfAftd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkKfAftd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6B81F000E9;
	Sat, 18 Jul 2026 11:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784375510;
	bh=jTGIN/WTMUrxPZaJIWs7NHyrmABl3Zd8+o9XipNSaes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YkKfAftd6fmw81HhOWNB01pdPztKnW5Ixyd7abtPpUvDfPqse0QnD2XbbyBaiL3BN
	 yWF8UvQYFPYfkmy+I5Gi9uvpHUHjOd/KXxde6C4OkwwRgPwn2SkA4LaTBrOJmDZ4Q3
	 Q8QoHGCIrAPU7Gck3fq8VtFblSVvpLJRU5PVw5epH2lPJb72Li66AxG/YBkzqXdRjp
	 hAOSlg21XPaeE1urlTRwHHT6Hpl65ccjnNTNVuRM7aPk47Z21vob0fsc24H2dyKVBK
	 4oPvqahVsAK51iYZISzwhRjUU6pWL5mLddM0NKSa9EzUY8rUruc8kP+EPh2qNikmEC
	 HA6gW1b+lep+g==
From: Mark Brown <broonie@kernel.org>
To: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20260717172318.1784073-1-andriy.shevchenko@linux.intel.com>
References: <20260717172318.1784073-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: SOF: Intel: Don't use "proxy" headers
Message-Id: <178434154588.467936.8315586608938149317.b4-ty@b4>
Date: Sat, 18 Jul 2026 03:25:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107; i=broonie@kernel.org;
 h=from:subject:message-id; bh=t1FEbwgmBFsrzp0w1i7/4UK/FSLvCidCuLyj0mAahY0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqW2jTT5Az+g2vf44XPGXoqsRmFZQHS0GCh3H9I
 RI/T5xEGBGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalto0wAKCRAk1otyXVSH
 0HZFB/4x/3IHUcf2oS1UGnOWgA+AQP5KZprLpGWOrvwA7+4RFtJi3ZBVDVJu3hMCN7s9ropkn2h
 nssFssrRreYO1PGsQedulWdaM8P7+37lwtYeRthHrIObPEa/Q4kyQyrl3FXrE0S0i8c/4Z3M7At
 MRFoWVQGSZt62azKgeJyA5LeOt2YXW96ogO6qYlWVs0teBsG3BltqwUCfVLC78mMsv7+qcPgQCK
 aTXCTKu5cTp9RdvrHZNdfloB2S8NqWxi7AExcq4HDopvP/LXhhqKtuEcwAkK9/bjaC3ojcr/mFd
 SBGPS6fSA1gc7TUET22G3kPkDQ7OICnk+UFh4q41LmGEOpR/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 17 Jul 2026 19:22:47 +0200, Andy Shevchenko wrote:
> ASoC: SOF: Intel: Don't use "proxy" headers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: SOF: Intel: Don't use "proxy" headers
      https://git.kernel.org/broonie/sound/c/d542c74cac07

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

