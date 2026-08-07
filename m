Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445CB221FB6;
	Sat,  8 Aug 2026 13:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786197213; cv=none; b=ses+npXWb+Hixqfhy5EVWXhwNu28Bjr5lO5Mi7YuE5cA1SDuvk57DijlHG3XFyMChDAQGRmPGOcb7QvdkFHdhQSU1e2jUD4E46sdgMyOBA/LC76uT6gGMLJ2VVQN14zgDzs0Jp/pUaVkgF5oShI7lIBh5QY8BkB4JGhpjnSksbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786197213; c=relaxed/simple;
	bh=hkH0fQEvz1q8rnasSa045IDqrDKIN2Ms2FS9+zn9Z9c=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Qp8J0bBrw8zfn8yIxQ1Je4mQjH/OAMtGjzNKcJRsXYquasDm8wJwDq8SG56Fbs7H0csHWM5cqF0AUo15w0M2cku2kW/7A5FZd4z9SfIw+BXKTKXiVsCFvy4D4IHEYKy2UizHhugkARQFCUcYvTj/pS48lMI4f+V43gsox/UadCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojQ6x4nB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojQ6x4nB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3131F000E9;
	Sat,  8 Aug 2026 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786197211;
	bh=UGmYbDNp/zsEE4ZhhIguDoZqxe8hCpFF6XwrjiVGQt8=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=ojQ6x4nBvODQCZ1gaWaQiBMD1fTOAkOrsl94xUkCAUh2ZyY3fy3MUHHgmEEtynC3X
	 YV/Y7Dwht1mmbnW2DUel0ijNFK/PlqZajPFpOS/xBXrQRxiCy9QFqPAS4lJPCueq2H
	 pM4ccd7zp6f/9wDq7SJJMqCWA9zNjwEaW3yl1NMI80ym+2o+4kuAZ+Jsuh27Vy5nxV
	 PsS6h0L/n86ks8nb0RBhEQBfvTscRfp9gYDPuMG/YKED9stlUQuJKl3z0VMrHj2/Uh
	 KcEiYXGYH38rADq4/mqeSEzFZvSAgL/i5MRR7vfJRc+/LF4awFIhtn5DQJrzTwds3l
	 vW/DUyQvlo2zw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Frank.Li@nxp.com, phucduc.bui@gmail.com, 
 shengjiu.wang@oss.nxp.com
In-Reply-To: <20260807072202.380021-1-shengjiu.wang@oss.nxp.com>
References: <20260807072202.380021-1-shengjiu.wang@oss.nxp.com>
Subject: Re: [PATCH] ASoC: fsl_easrc: fix missing return on success in
 runtime_resume
Message-Id: <178613935118.577435.5668372548866263587.b4-ty@b4>
Date: Fri, 07 Aug 2026 22:49:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hkH0fQEvz1q8rnasSa045IDqrDKIN2Ms2FS9+zn9Z9c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqdzTY9SXlZ86x/M+sSlip/vnMIhc9hIK+i36ny
 AMJXHA9y5eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanc02AAKCRAk1otyXVSH
 0MdxB/9Uzxm5RjA4jAnAsl2aRVwRlUhYUMT7t/YtuCrkutYV84pHoQRnwMXd/A1Xx4f19tY+5m+
 5E8F7Z5GD159IIZBwcYFJUBgyhPky91OminEMCSHxU7qIED1X2EBH/W6ZasXkqKIU4V+YPPEDQ6
 Jby0YuWQU4cIwh4rLPl7qLEvKqOkqI45J/kPBYPLZle8iRzhx+E73I0f9I/fdOLuVNZuFGOY21T
 R+3j2gEzqAr9VYEVB+0GCAo1YHB0Ou/ZSNSes3h/UCDTHjeXBNxXcNIudNhJIRGTnH45ISWav5v
 9P07AGgyIRKl5q5jvyEUoauFi3XO6a5P2Ay9406+i48JK3jT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 07 Aug 2026 15:22:02 +0800, shengjiu.wang@oss.nxp.com wrote:
> ASoC: fsl_easrc: fix missing return on success in runtime_resume

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: fsl_easrc: fix missing return on success in runtime_resume
      https://git.kernel.org/broonie/sound/c/82b6d37621b0

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

