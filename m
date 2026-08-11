Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87CF20B80B;
	Tue, 11 Aug 2026 15:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786462854; cv=none; b=CmN8WItOwQF2X0ac3CjRm4aaoaZCrCX/yPHWdQmnQ2YXi9FMumwxfkbpe92tkHj8m0xrBVHHIy3cWDWpGPT5eCDuhq9rOWPeawdVhLXSR2GwLWa++14sETt4oVLOW7h6TZEuiV3AQ3aqoY9OYDz5TDZYOpKe2nH5imAJ/OUgwMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786462854; c=relaxed/simple;
	bh=4fQBbdlhn2507coun+PNedz8aXDi/ZRq5BjRwcE1aaE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=faaNRToFphGPlUMnqa5bJ2xrzNZQZZ00rgVPMU8Zs4wjnK+9V+jZC3SsY2IZhq4r+hRP2iSXUSpaRM6Fy9IyVLbTfQaTTWc51d5f3rm3anCrPAo3DEOGTle/gv4Ig7aPRT3uq9lYrhe8uU4OfMAQzc0QU7JrhpFS1vcsOrslqeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VG6ojFB9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VG6ojFB9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A6F1F000E9;
	Tue, 11 Aug 2026 15:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786462853;
	bh=VHRzO783ywZc7buAAqGS5A7XCH78NcVdWuT/69MnSYo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VG6ojFB9/u1DgMZQrGqE3xQJAxMOUsbK9ZnXnCwhcYFy2WMIVSNGQh/wdRT7wjsQG
	 PrQZd3di2ntGVyQ1yjmI3DRmqNZJ/vUOBsNnx3cicJnZJnXHhuiLiN8Pl3UaZYcpFI
	 95oCKc4teib6WZH9Z4MEiWGgiE/uTMOeutuyVYn4qnFryB+7MFJZsHSnawTWjPoeLL
	 H3rz5E6rDos+vWjO2nVZmsWr/eTss9MNsOTlPRsNsCiWrvExRIGDh0BM1uym2MLMAY
	 a/HhJAj1D7fxNyrodjGPK67xN+NMuD2+aYRdlEpEbK0yzl8pdTAVjqZVKBYU62msZT
	 m9wGd+76uH9qw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, phucduc.bui@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20260806055937.24600-1-phucduc.bui@gmail.com>
References: <20260806055937.24600-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: KMB: Propagate -EPROBE_DEFER from IRQ
 lookup
Message-Id: <178645591904.119683.4226772834275702841.b4-ty@b4>
Date: Tue, 11 Aug 2026 14:45:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4fQBbdlhn2507coun+PNedz8aXDi/ZRq5BjRwcE1aaE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqe0KCULnlUqh00WW/6NIRr9BdwN6e8vcGXwf0K
 tFnGmjfCS2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCantCggAKCRAk1otyXVSH
 0AGzB/4rAEIJX10k7qqGbnruIV2FGzejcfiySb8pRhH7MOGt6UjivEGNt2CX06kew+cf4kvUGCJ
 LbSZyhDd/WcoEdLe936ErR9VHNelzKY362D4S5t0LWGIwKZMgWPaRPfTZspBX2o4EDZG2TAEK5H
 parIGAtqXr7macAo3ZkI0Q+t6lsDzMpiMryKmv+pFL4LnAGHhvqWhIT7JqkCu5IcbCKmYcwrnKm
 gwXwupzWRcXkxEkSvNfaEzQ0w7p8dCUlDyx943pGLTWywcCYHQacTtOu10vY8eqp30zDcF160hn
 8BH3jXMWMZaUCjRmFEPTj4WpiWJ2XuGyaw6M4v4HkP/7Oy5l
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 06 Aug 2026 12:59:37 +0700, phucduc.bui@gmail.com wrote:
> ASoC: Intel: KMB: Propagate -EPROBE_DEFER from IRQ lookup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: Intel: KMB: Propagate -EPROBE_DEFER from IRQ lookup
      https://git.kernel.org/broonie/sound/c/ce76c44c34ad

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

