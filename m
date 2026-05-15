Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271EB3321A2;
	Fri, 15 May 2026 16:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863182; cv=none; b=TmLXNDKL2ue5/T1VmwulKIWLdfSwWjNzjYzYgzxtBmZ29QgpSAObtEWKnGgnlUl+fqmbwfxQzPdvWPSEHIfH5jcYYfsxcmh4KvS22c6Ys2pf/FL4/GPdLqu5+IMO3yFAYWNn91jJgJw7y251zhbRFfNUK87tR5MaWmcwMkDwKos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863182; c=relaxed/simple;
	bh=DADxiFd4EUbpZc52JnVHdwym3JifRS06l1FltlFmsrc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NSliX7vNhHVavj5VJXYNxSC6C1QbhSGuZwalZdIIda87N7cnfCyrDHB4sOvjXD7KD79I4o41is0mM0v/msnPQwmTiyjWdnSak0UYm/4Pz5q05lPK7uMoxa8Ki6wKycvqk5q31xbfdFl86khZSZ9sAKzm5fI1o3y/hxj5Wohy2pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2lRv4nE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2lRv4nE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3DFC2BCB3;
	Fri, 15 May 2026 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778863181;
	bh=DADxiFd4EUbpZc52JnVHdwym3JifRS06l1FltlFmsrc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J2lRv4nE1rdrdrwV/AWOPmpUjGtdQtI+vGFDxi96zc5OqMewDC2adRqEL2WUMyjD9
	 M8NF/ZRdChCiy4rwJNwcGxULihVfICqzEwG60b5F5WBx0ebk/mKMuCPDGlu7K170z/
	 nwR904la2OGEmlm0Y8mUzfuIRMg0sq4EpfF7KVnDzJOuBIAYdhxHFWamV8QBXHVeB9
	 1jAERXy8U/WSYnMwB1e/loyofANiQH3v1ohIn/0GnO1GNizFPg9C8INGSuMk9985W/
	 WXmdaSZ5oF8QCR8hH0QH/sE9KTGipCmghb0SbHNhbbg3c2PKBka+9K3/aF3rO/Cd6t
	 TJGN38QofSzTw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260513162612.365729-1-andriy.shevchenko@linux.intel.com>
References: <20260513162612.365729-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: cs35l56: Drop malformed default N from
 Kconfig
Message-Id: <177880870726.1136679.16128394887966925171.b4-ty@b4>
Date: Fri, 15 May 2026 10:31:47 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DADxiFd4EUbpZc52JnVHdwym3JifRS06l1FltlFmsrc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqB0xLYXRd+3ZSBlAyde5NIQPHx4C2lDXJ/HYL4
 tyOvdh29TiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagdMSwAKCRAk1otyXVSH
 0KUoB/wJD85I7NK5MnTdKmQJK8/Ksxm8QlxivRQxLanVr9JpDbkQ4mWAUnGVmbQiNUc9Y61RloC
 aFFqcJsFz5bRpsWcQlf/U9ie3Ws+b+pH+o8aTHRaASP2QADIrHU22LU/VOdZHOUME49NJ5IpghP
 b+un0SwP0RkUuI0wdwIHadrCo+Dtg15I+NGoyPjuYJKmCzJhaoObbM2/1nzcZHvF1JHSvqivsn9
 yLAwl5/TY9E+l9We+rdn4CZlxe+ZAkeI9N3ohKl9/LzuJXlxzEe2nQuktMaP4bBF8TMPKnSgMgt
 8ZZEFW/u/yj42FovVu9dPUm6VzOnyD5Lq9BFZuKxYpu32ers
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 13 May 2026 18:26:12 +0200, Andy Shevchenko wrote:
> ASoC: cs35l56: Drop malformed default N from Kconfig

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: cs35l56: Drop malformed default N from Kconfig
      https://git.kernel.org/broonie/sound/c/b96fe527935b

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

