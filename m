Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239D92F8EB7;
	Fri, 24 Jul 2026 00:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784854746; cv=none; b=O3n+iCti3YwHYwELqdwzR5O0v/D/H/K5Z/gbUeyuF0y8TnJYY6ALc9KYighUxv8w77LakTm1GgJbPvUXrX4J7BQoee4wq+tMP5rpOo5btUiorOXzWFz10bSFbVqpOWhJeGQOIdcT2BwZ3Cyugamcr/5EkDvHvDp4NaNNusWJZK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784854746; c=relaxed/simple;
	bh=ipoGnXFWaMvdKTlTuZ+C1EuoMj4BG0fzzkVlNPQtKM4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uzeTIJefHs2fyZ3ShKldFIhmUUAuqIUViwfGuAhllXYuS1+FJ9rIplNV5MgPxtg/BN1+1r6Xn8uXryDZjw2JPXcUgS+pKB+fbzbT7Q+0gxn52Ric4Q+vd8CZMh+vB3OU3R82qnbOAGIylXZggpdPvQgwuk1ugI0feYtBqV/wyT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m03OlsNZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m03OlsNZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C168E1F000E9;
	Fri, 24 Jul 2026 00:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784854745;
	bh=9Io4u/oOkzywn45ATitf4tmbJC6v5fFd7ndsC4118JU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=m03OlsNZPHXHR8xyt4LtUht82/ZpNf3p6lvNgtxUlMOF2Zkz3H75YKMiYC3Gudzad
	 4GA86wW/XjG/VKontBCJVpndWRDIPmvQejxWlHng1tCW6wkOu++L2P56QbYyVBfAQE
	 f850vpBudFKyWIk3H1qr8jfX0vJL6JOR9qmP2cEOMm5VbjECy8FeokHV2jD7+4tpHJ
	 qj3zHoZu6Nx1tIe4hrsfczyi+Cd8JM5Ye9NqhmGC5SAinD0YWxSXyajnU8gTbn1RhW
	 vrPoJYREDavqqhzD0WFzjqsJKihhrOuu8NgezEnhbM7Oy8Yv8mJ3iOs5+1hwP8j+u7
	 y8Pr8z0xyUIAg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260722103500.872714-1-ckeepax@opensource.cirrus.com>
References: <20260722103500.872714-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/4] Series of SDCA bug fixes
Message-Id: <178483747411.53486.1411811242334771481.b4-ty@b4>
Date: Thu, 23 Jul 2026 21:11:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ipoGnXFWaMvdKTlTuZ+C1EuoMj4BG0fzzkVlNPQtKM4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYrjWdej4xt2nX8gO9nXbl5kSGuKLx+7O2r/NS
 AbU+9OioO6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamK41gAKCRAk1otyXVSH
 0IppB/487+ewWyCbyXCeFTe6yHX6pLAC6GHHP847lGLa39oFEX4RJ0nuB13JBEetdXPVb7FDjBv
 KYXPs4ZAs0RjnPGsfJIvU2pdA3EW6Ba8MjN2QWwY8M4u9DYCiThji/jKc26dV6DkiZGR0oVy05M
 LWbJCeFFi/HeBz0EXmL2CAMulRDeN3mgzwlD6fD2XvWPNC2Cvq2u1xFxqlSH5wToLafH+nEm9jP
 lSg6UPgHl08n1dpHTfXEPZ1O+lfHohqb308m4tffJdzgCoyLUBkoOmVUYGABZHlbx+tMpjFuY5c
 lpdEJyrnSZVMPiVb7ZP4aXBR8h6nC7mRpUVwr/kOSdrhM7Th
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 22 Jul 2026 11:34:56 +0100, Charles Keepax wrote:
> Series of SDCA bug fixes
> 
> Fix up some error path and size checking issues in the SDCA code.
> 
> Thanks,
> Charles
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/4] ASoC: SDCA: Correct pointer passed to devm_acpi_table_put
      https://git.kernel.org/broonie/sound/c/6a50332e194f
[2/4] ASoC: SDCA: Always free firmware in FDL path
      https://git.kernel.org/broonie/sound/c/7f64ccc374b2
[3/4] ASoC: SDCA: Make UMP message size check more robust
      https://git.kernel.org/broonie/sound/c/556d872e7c2a
[4/4] ASoC: SDCA: Ensure that Control Range is large enough for header
      https://git.kernel.org/broonie/sound/c/951e921b039b

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

