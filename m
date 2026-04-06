Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B2E386560
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 15:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488974; cv=none; b=EX4K0IDYJAIrTL2eERAB2zkutnM40nBeUDC7zuqumMO9mODNZwAat3i/kL0afutJKYsohewFZbmTAby7p94X1O3DNe7rILrmwnIkHNV93IGYL5LUJGj96bIiuy4CFxvKL4yhqw4yodNSHmVhWJ5BGmBsUsvANxh0IRUjhUzBk70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488974; c=relaxed/simple;
	bh=Td8BJcne36cL9msUnx+z1UVbC7AT9XKIL/kHqdNT5Zo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mcqp+s5iPw6xfPtEjXZdQiuB/pV60vGMhMIZQgGOpNZUohoeIb+Pzkgtge0tdsD98fAbdnhK1zjdnUTzZlNLIAvIOTSuaIndT5+Y1gX9Zj29rrCG5ZAsDUjFKuobmRkRs1C86RDEEVpZdr/Vja17o4q52dUku93+GQtz3p+k02I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dK6AixYz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dK6AixYz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D013EC19421;
	Mon,  6 Apr 2026 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775488974;
	bh=Td8BJcne36cL9msUnx+z1UVbC7AT9XKIL/kHqdNT5Zo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dK6AixYzRXZySeSL8hs4C4RTksD96vIeXgX2NHVdL1BsCIWuVjSSnanN7vp8kGT+/
	 jpUX8gMULGVf6sgmWE6spmdEeTXMYeAY7j6ms3u1UKsWdvsKe1ZXmZi4t8HG3NwVu6
	 q3VyB6IxqP4bIJuXqtdIHcmzL2q4ZfR2LpgrWXZxOdi3FS4M14IMqKs9e4mfCOxW6y
	 0e1aUM5dQcuQ1hHW4v4RYOzyLTT4uXmazGPobLyhSTrl0azqtA3Ybw5UGvyHZRTm7+
	 Y/Ct1I/bkWSf2VA0+S6DLeZuSJhNJNOz9kCnL/5hAaVTMwdOSxbkK7on5bMzHqJfU1
	 mZlU18BPrmAMw==
From: Mark Brown <broonie@kernel.org>
To: gaggery.tsai@intel.com, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260316141449.2950215-1-ckeepax@opensource.cirrus.com>
References: <20260316141449.2950215-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Fix errors in IRQ cleanup
Message-Id: <177547786478.46304.12330509041062400147.b4-ty@b4>
Date: Mon, 06 Apr 2026 13:17:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Td8BJcne36cL9msUnx+z1UVbC7AT9XKIL/kHqdNT5Zo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp08/LbaUOAT6iwyIvJnl4XCcjcvW37a9+bjXEN
 03e7GierweJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadPPywAKCRAk1otyXVSH
 0PmgB/wJ0XcVwJVuqhpJccH9hRdPt6wbRyJrXWMpDy5xHkrn5qQfOOdZ/JaZ1VhLg/APoDQqhk+
 DVYzKN3HOQ0q7iGbUnn1oCCkb871H7mAYegzZl1DM2dIybEmwRqJgKtgw8uFDXHhLl+RduIRe3r
 Aa5AMf7K3nINZS/FTWSUM52U/7G/UhudHxB3pPvi5LpBAjG460oYsbsWZcSsPjdrj9V2cBAkXSD
 1lvJAYKJGn9E9eIU+yhnXIsWqXs9smJco0sVYl8mc5JvL4IQeXF2MdtLrpKIQyCH9g1w8T7fuNM
 Rc7wC2R5aLBXE9TPztdlALOV6ERPDtRm/VAgvrDHJAbhEJv7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 16 Mar 2026 14:14:49 +0000, Charles Keepax wrote:
> ASoC: SDCA: Fix errors in IRQ cleanup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: SDCA: Fix errors in IRQ cleanup
      https://git.kernel.org/broonie/sound/c/4e53116437e9

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

