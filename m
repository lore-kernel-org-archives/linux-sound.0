Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ED43043CE
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 00:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784854758; cv=none; b=BBAJ8bFFm+MKEJnlxWO/SHJTwilfwdJVJnRIB+cI7xBetOANWprma8OJlIfuUs82cBfZWDkprZdyjgqAZVGt6a3W0sAN0VBisRE4bUyppcxhBSF7hpoPIFI5CRbTs2XdrRpUKA91A0fRng/hY7eebXLlruxBDKNaDcJd1TRgfyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784854758; c=relaxed/simple;
	bh=UbqxxPDFhgmpaUZWorFAKSwq6AbIK65VHEhJsHE1Tn0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vbcaqy2uGS3nE/tkqJk2kyIvwAzJcyKsn4VXMYTeznhqf7RR63+0CgrUb+Fxswxfn3ApKNXLi9j/8VLAFvbLglzAMxpk69OMHyPcJv4mSogJQ7GyQNeLvaPv/SViC0gcnMe6k2aXeS353itaM0BVEpTZ8yEctJPgrtSqSZ3qiMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ap3yl2ZR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ap3yl2ZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6204F1F000E9;
	Fri, 24 Jul 2026 00:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784854757;
	bh=xNOQCOjYJpdTd2Q/7LwaF9ryzVZ6LYaiq055hEWrxvg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ap3yl2ZRPCTpIhlMoEFJQe76q9GSSh6e4RtUuPlxDWni02pWr1+yRq9ocTcSbNvdO
	 G664I8PYC3620U4tDX9OiSvnK/3e3HOoYYxc1mtOGFUYJgNDF6TmJCO2p2HJvPbJGq
	 BJNcUOiy4bHphZJpsFa1w7YpuX/RkTi9mcJOePYz/1mvPeN1lrsx69+ADsbeL95ZAR
	 4y6230JKGrzfZjwOLAgDa28hlvZRjJ7XMGB4RHk2KHcJouStdate8TVInK1ooQDXD+
	 WhRoAKeG2Ky/0uSgxniMtPgZdKtaQuTIXE/vrst7r3iIXmMREy7Er3dU6gf9cTMsl9
	 AkyqfJHTIGdZA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260723062121.869857-1-yung-chuan.liao@linux.intel.com>
References: <20260723062121.869857-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi: Add entry for sof_rt5682 in NVL
 match table.
Message-Id: <178484670110.53486.3178023286844941056.b4-ty@b4>
Date: Thu, 23 Jul 2026 23:45:01 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UbqxxPDFhgmpaUZWorFAKSwq6AbIK65VHEhJsHE1Tn0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYrjjwwknOYoY5WPbO1MwGrzHV3I5bAPpvk4Ps
 s4+LEtzQKeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamK44wAKCRAk1otyXVSH
 0AuqB/4/7htogrocj8tgjEnn6S5jwLkqBcIZ/XBah3zpoI2zHm2CuUitpXCvtIFYVBzAS8uW784
 9AEtKyf78RyueSSV6zXeGpzrOvbFgcyYQ5TPjpgWnGTjLFdIDoplInR3D5zbt99cKErQKjVyqFU
 r/7JpX/hXQ9diobE0epSkhcEi0NIeOR0L6FipIzenwTbMuKA8QoVO/x46pJ6GW4DmJlzDitk3zT
 3+RflJv5WOOAaIEZrs5+7OMOTj+5s2oz+uYR4TT5pF1X/pjLEj1LoroWSHdDCOZrJVY/aIT890x
 jf0ZS7rbEnjaVfv7Oi/yO0BVfI0cTd9/AK59YQ/BWWspWD37
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 23 Jul 2026 14:21:21 +0800, Bard Liao wrote:
> ASoC: Intel: soc-acpi: Add entry for sof_rt5682 in NVL match table.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: Intel: soc-acpi: Add entry for sof_rt5682 in NVL match table.
      https://git.kernel.org/broonie/sound/c/52a3a0cc28bf

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

