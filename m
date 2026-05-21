Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492333D9DD9;
	Fri, 22 May 2026 10:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445344; cv=none; b=mWI+A1R0snJszZINqGp7RfgrVRSRfNWfY2RuhVywH9wBZ389RVOV7XnJnIHSYVl2N88ec8MvENKa9ax9PCD/tKHy8b3jbgnIAEjNWE2/r+gKV7jDffE7brGwnEpGe7GYDsuDjclwSlGTU/mKSd5E4K73RbUqNyFhjNSCdSArCIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445344; c=relaxed/simple;
	bh=zX3ShmDTfsM0A1i9/P/2cHIGWRclCtddKYFoxk2798Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=md2S2Kb5xVaW9oIjVcSKIHgraqrzbWRgwZsVpYU9rHvIlRf4zefM6rlAaSD8DOSVaBniLNNfR3DZU8eyrWomVfAxE5+Sh59hpNWbv+6o7WdpiPfySzWRCL2mQq559k+uGNn4rqcfHV2sP8NfmsKVH/4CbIgK3dmxuE/UNhsVTL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0ykYktX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0ykYktX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285951F00A3D;
	Fri, 22 May 2026 10:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445342;
	bh=9mL3/ButVORp0nNHm8VkXoojxFZhmr5f0R8Kq2Umygo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=a0ykYktXxT1GOcdtJWESW4F32jZIzCBCtlfAcK+2LeMRgyjk4ug+9llQDCascOBKv
	 P05W3ObwaYUNdRnxfXtNqmWhLN3bvfsbEKtyZ/caZm50Ft+OtrxSkJhbYpj7rDYk5T
	 qXVGB3wRiBfCYEB9/KhrRjrQEoZAcDKCPIa5n7ydQ4vmbktLE8Dl4BFKw/MjpvZRqf
	 YxS6u+o+klQJgDVwGo656/PMeO+9myfRf+dBS1EziYs15+MWEIz64DBx101uX4w8aD
	 zOakuvWriIRjSnDYxy3wct16Za4YmiXS5maygLc5DkMexWRBJCQqWuhsfm6XTvj/nk
	 Ek5scrYlIgxIw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260521115420.978616-1-rf@opensource.cirrus.com>
References: <20260521115420.978616-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v4 0/3] ASoC: cs35l56: Replace open-coded SoundWire
 regmap with generic regmap-sdw
Message-Id: <177940544025.58022.5015598163203616370.b4-ty@b4>
Date: Fri, 22 May 2026 00:17:20 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zX3ShmDTfsM0A1i9/P/2cHIGWRclCtddKYFoxk2798Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC5dLTtVntWVW/6KOAC4v/p3ZBIQfCKgjEmWh
 F2731z5U7WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuXQAKCRAk1otyXVSH
 0Mm/B/4yQ/g444KpAU4b1ofRbwTtHxcJH+/CBK8hJbTnNQsBkS6CeZ59G0lfMQuvoaAPWuUYUZS
 ZX17lltl2ycz3ztjGOIJ6CyXFRr461zgxa1hWfuBCTJtaPeXOpwWllkKybV3u1DE7IApaomwkmN
 1+Z0h14PCgmohHuICED1KkA12cVYSoSCr6U/S9wAEg15Ttf3AvILiY57n2UOdicIzyzvFJf+rpg
 /a4h7aYfp2xPKgLYvp+eBU1k1xGCIMHs/jEqpW9RDV1FlDMfjH1w1TCNQkZEyBgXEJ/TgBry1Wk
 6opr+Xcxcg3Pp81OLRa2ZDjXhATru+Xk9X1JVY5XcfA7zmdI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 21 May 2026 12:54:17 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Replace open-coded SoundWire regmap with generic regmap-sdw
> 
> This series replaces the entirely custom SoundWire regmap with the generic
> regmap-sdw. The reasons for doing this are:
> 
> - Avoid code duplication
> - Avoid effort of keeping custom implementation up-to-date
> - Prepare for supporting BRA
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: cs35l56-shared-test: Subtract reg_base offset in dummy regmap
      https://git.kernel.org/broonie/sound/c/cb9a52b3ab2b
[2/3] ASoC: cs35l56: Use reg_base to offset addresses on SoundWire
      https://git.kernel.org/broonie/sound/c/371d1e3a01f3
[3/3] ASoC: cs35l56: Use standard SoundWire regmap implementation
      https://git.kernel.org/broonie/sound/c/4e2310f14a43

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

