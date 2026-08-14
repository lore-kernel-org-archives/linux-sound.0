Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC65646C4A0;
	Fri, 14 Aug 2026 17:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786727982; cv=none; b=DlA82xkuHgd32EpYdW6tc/fenHAsX9G8G5D4M/9N35LeK/Unp1OfguVYAb+k22Lcih8ozTdLy2E1YIvzgMht9o1as6H1THBs2sexYh6Qw8SPMPVya/1xV380ScpBCpR+QuXxdS/DcIJ9QFHSawlvVIc2edWVO3/C0xnwjJS71Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786727982; c=relaxed/simple;
	bh=xmfFcPMenW12rCd32uJdDPV8XxpOnpcXbNiyDzfDA70=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EHor/NwW+rsmX9QDtsLa1eAZ7xqZYUkyAK6J/SCyKDBwcbOQmYX+fBWhgdRvVTR94ieApufIIWtKgTAEJzPcyG8Ya0i+sXvZAocq3m2sDd/U9KoGMskAY9Y8F3rF/u8pS+2PHxmG5ffQKI9HhYpEkujutx/jxXRqyZ4Ft5f8G1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMlRYQ7G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMlRYQ7G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9691F000E9;
	Fri, 14 Aug 2026 17:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786727980;
	bh=FsmBhKZLTfJeU9KCzG0C07Qvs9u+juMqc9lTbg5RFyQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EMlRYQ7G4FQuzLAXL82lFn622evS7E395572OktmyBRBU23H5oq2YM40rqwNFxaPS
	 V21xsV8XlnrkeOnyU3CIrPTLlcyqnkXvqAVGlq4dealMMV/g7955xR8f7qnEElwgYh
	 1iKPB91Vg+FvrEpwtlGqhkulCDd3u2eHjY9DrcBPxsvW/6iU8fbpcUBZbY9c61yw7z
	 ti1IIwfPVlug4bVvHxr1jXF0VGBKXf2/eG6FMV8kbPd7iVbHUClsyvFHKh/ge2PxQ2
	 nKyZdMB8pngGJFVaem4jCTM7k2qPN3bQ3IcbCGvRcgpMeuoCEONoWCDt4l24EiCKbN
	 gLleS/97O9+oA==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260810104045.60701-1-rf@opensource.cirrus.com>
References: <20260810104045.60701-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/4] ASoC: cs35l56: Switch to using the IRQ from the
 SoundWire core
Message-Id: <178671206310.152149.8855186309091901787.b4-ty@b4>
Date: Fri, 14 Aug 2026 13:54:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xmfFcPMenW12rCd32uJdDPV8XxpOnpcXbNiyDzfDA70=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBqf04pZ4ZdRonjq/qKSj5gl0XT3LxP10qZ4QiT1
 dnDghwrGCiJATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCan9OKQAKCRAk1otyXVSH
 0Mg8B/YlPmz6VxCxMH0KPloxhKSFvahKd5lEU4gGgozvxMJNVR9y9UNH0fVJ7RDYQWN7B6O29Cf
 KL+BrbtXtvQINlV8RzGMINqDPFOAfIb5zMrMUivLX3Q+bskd4oxziROVaYAQ2DQBt8HUQXRauv+
 YNY6cG0IAfrO5CIOwJhniAmgeWNDtu6+JCSfUS55JWO77VXnxO0FRZstX+EcdFfr3aNE1X6bOh2
 DUvt6qWWPVuEWeHBp2DbN92MEujh2MhpJcu07a9cuAo0gHO5YcvvNUD3dXug59htDHLPkS4nDd+
 kckBv8fYzFlx9HtBPiwEojHTXYC8N4zHDhpm4C/Kw1JhkHg=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 10 Aug 2026 11:40:41 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Switch to using the IRQ from the SoundWire core
> 
> At the time the cs35l56 driver was written the only way to get interrupts
> from the SoundWire core was to implement a custom handler inside the
> interrupt_callback() function.
> 
> The SoundWire core now provides a virtual IRQ for notifying ImpDef
> interrupts, and switching to this simplifies the code and also makes it
> more similar to the normal interrupt handling of I2C/SPI (though some
> SoundWire specials are still needed).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] ASoC: cs35l56: Request IRQ in cs35l56_common_probe()
      https://git.kernel.org/broonie/sound/c/888162dabf64
[2/4] ASoC: cs35l56: Move cs35l56_irq_request() after cs35l56_irq()
      https://git.kernel.org/broonie/sound/c/a075fef187a6
[3/4] soundwire: bus_type: Create IRQ mapping before calling driver probe()
      https://git.kernel.org/broonie/sound/c/ee1811eacdbb
[4/4] ASoC: cs35l56: Use IRQ provided by the SoundWire core
      https://git.kernel.org/broonie/sound/c/243ca1fb5383

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

