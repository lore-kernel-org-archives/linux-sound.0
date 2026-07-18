Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4902DB794;
	Sat, 18 Jul 2026 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784375506; cv=none; b=VZaGbnZt2MBqhW4PEkoZ1Js5IhbGQ3quvl72ZZZBLH/CNwIua53p6zLxWcVE6NyPnFykGVrOAN5wr+6GZLU0YYA2gLhOKkRGlA/aE4MuIxjlVDC6/vhtNLcSlhPgz+DR8Ih7EsV1UD/YX1WGl3p63Xj8FjYsI9eCcbgUyetDj00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784375506; c=relaxed/simple;
	bh=W7VoBNyPpbLsHk4nDrEcKIoQ++F/bOmYZbQLJ5q2RD0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AqoJlBTzlrN/EYmuxaX8nNauyOiga6iiTd9BepibOjL1FmTEPOAG/DlnuWBaxWj4UXUfzReWPPRT+4J+HQdBLFX8chUBpUx3vsJJrKKMdJhiu3szblkLVIE/9ze8ZdwUMQuryRAMtUbsF7luaODBXxFL4vm0xyEo8ttDR5d8y74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzSXjNsI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzSXjNsI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6191F000E9;
	Sat, 18 Jul 2026 11:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784375505;
	bh=w5VclMEcWaPAaaO05k3dAT7t0Dfr8oAIAyGTjmoRH18=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MzSXjNsIp53c7F+SDDC4Vz/ppCw6ASruCF7kfLGhCV4449euLplx0Q1Hdfc6gyNoo
	 LiND2ujU/w+KIQ+aRIHJ3jbcuBcT64I7Aau9DW7Nh7+yLelH1jz/tJk2RV3OmU8MzY
	 LXkUXO1nBKfJs66w4CBDI8ZsbkGt9u7JluaKBsg4XjzxhNVhfE1IuyQP7rTYL/KwNc
	 LvgBhKY5galyBisNDhUHGNI1Dzn0QtyZfAhdhnkJez38N3RpfHAQZNjQAQ0Gg358ju
	 zpqVDXf7ANsOpUWaViLmnBA35gx6MZMJaI0mPcCnIbDj7xzzALCAz/XoYnyNSYV+pJ
	 EED1eem76VwOw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260717092655.1730484-1-rf@opensource.cirrus.com>
References: <20260717092655.1730484-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Remove unnecessary goto in
 cs35l56_runtime_resume_common()
Message-Id: <178433883201.61249.2120055674744061422.b4-ty@b4>
Date: Sat, 18 Jul 2026 02:40:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=broonie@kernel.org;
 h=from:subject:message-id; bh=W7VoBNyPpbLsHk4nDrEcKIoQ++F/bOmYZbQLJ5q2RD0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqW2jPgftlZSoKSD0We4QAFwpOGG0z+GbANEQv2
 wICcpXGTAOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaltozwAKCRAk1otyXVSH
 0LxZB/9zz0N2WrN3R9fO32bX32NvpuvWN4o6sbjUkGNx+ajtUDNLzziq9r3YwVMY+LM6A0P+74A
 7pZxm3tBL2O4XKJIFun/KFVvfst9E5mS6nS4IvRbVv0Zp0V/ZQCTBWb3aCsUvrRf5vmRRpD5JFy
 Y1IFlPZ0H69LO1VaUQ231m6chHCLwGQt4ttUy+92azZ6gGjIgII6I7Bq5ddKoOwnBG/aZ2ZAo3v
 YHPowfPUUpyWaZNoMyab5kSqiISHaU8W3/ifyPpqMzvgWL9NC7bqcIFGtO/FV40lPX2o1sJLQYD
 rQ5SP9MQ2xPvfnCS9KLncKySfHRDCIwRsSb9yN38Smpia5Nw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 17 Jul 2026 10:26:55 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Remove unnecessary goto in cs35l56_runtime_resume_common()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: cs35l56: Remove unnecessary goto in cs35l56_runtime_resume_common()
      https://git.kernel.org/broonie/sound/c/c462b2e14589

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

