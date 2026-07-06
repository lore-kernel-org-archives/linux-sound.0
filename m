Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1D1416128;
	Mon,  6 Jul 2026 17:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360495; cv=none; b=E+8GOlavbiMViNTKuT9ebkzT3057+08XVsKcYnp9kHztMnKoeToCVPQZwOWQ2ewKr8Q9YDN9v5NGsZnynZ+C5nhO94vYtP44HJAaRkRVtKIcC6ggLyyL5yYcZNqP/S4J8gbkE4mdpHuF/3/exxwRQ9QEaIRKQsAEGGnbrvGnDOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360495; c=relaxed/simple;
	bh=K5+0WEGWF0+0uS7cc0U0JgoPoRPEv1GYBpQ/zt9nEMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dNIz4+49BjELSR5d5k4mZB8rM1T/EoIyN6Scd6QWyxkNd0MP9sZtGUdItavSPKIuYuxXvbiK0U2jQuQl4e03D1U86YgTlbniWeycxa3UQuH9+V/oWfpj9F9WpqXYWBjY2kZPMbg5YLWPUCHsHthGX2U0R4WyuyqRT0SFOwBXD6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyh04zyP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyh04zyP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A8D1F01559;
	Mon,  6 Jul 2026 17:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360493;
	bh=OopCnMowP/hrPERnT4GLgSY02Cz/9OrW6HhyWlc/Hyk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dyh04zyPM0sswOdoonoydVPnQYJVKe1oGG7Ol2gUxs9IQ+TSei5sIL5Zk9TJBFF5e
	 ElN5QxDMf0VGq/HnSaeAMVP2plz4MmlM+3c3gEaSL2pwht7zudEqZpzzf1SDXOXpR/
	 sngHhZoo9cdoo5pHEUFaWvRrK2nFZy4ukkJpBu8xKpYjuQ7PLtwne0CM+fAt/u5iM9
	 8os1qjStjYGMF+116tgpGjx8AwMqejkQBJzZdz2j64BNd+2wpMTevOZBfUTApsAAoy
	 O2MbWuBhhAUHYPnNHRBU1sehxi4waQZM11SiIiWKCovJkeTqTV8xhfvN0rr/QhZjpm
	 LRfdZRpVCfSMg==
From: Mark Brown <broonie@kernel.org>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: david.rhodes@cirrus.com, rf@opensource.cirrus.com, lgirdwood@gmail.com, 
 perex@perex.cz, tiwai@suse.com, Paul.Handrigan@cirrus.com, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
In-Reply-To: <20260611161553.3378721-1-runyu.xiao@seu.edu.cn>
References: <20260611161553.3378721-1-runyu.xiao@seu.edu.cn>
Subject: Re: [PATCH 0/2] ASoC: cs35l3x: drain threaded IRQs before runtime
 suspend
Message-Id: <178334519434.57168.11574312368504162221.b4-ty@b4>
Date: Mon, 06 Jul 2026 14:39:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550; i=broonie@kernel.org;
 h=from:subject:message-id; bh=K5+0WEGWF0+0uS7cc0U0JgoPoRPEv1GYBpQ/zt9nEMU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqS+vqR/Ore+jUc3x/R2e920t5fK1ru6aWQj7C7
 2XKbkvRnYyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakvr6gAKCRAk1otyXVSH
 0I7QB/sEgq0QELnsoSxOBsc72HnDVDIEYss3v6TvrGtTcJlO5IUHOtt5P/6NZCXWp/gl39u71KE
 93Iz7toXII0ozqziANttAyBifzK5qdA4K2c4CDIvK8GeHGPbKcdXUtsxUoNZ++oBYqsN1jmAVqY
 2gi9fzz53PcO6s2sCR7AioTAWwZbj3GK2NAxmihHJNtuDqhvB7plOjR71wI//k5PQSLhTQXkB4Y
 cNawqDdiuSgiyL7+CMepRmYmQ+/VW+7s1QSd4jWYf5rv3Anr9/HkwotaLqlZsEDl4FggI6ZSwoW
 3sbTsmEtUMAT3K3ujxNJTv4oS+G8jc4n8bqTaW+6cA6oH/B6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 12 Jun 2026 00:15:51 +0800, Runyu Xiao wrote:
> ASoC: cs35l3x: drain threaded IRQs before runtime suspend
> 
> Both cs35l33 and cs35l34 can enter runtime suspend while their threaded
> IRQ handlers are still reachable. The suspend path then switches the
> driver into regcache cache-only mode and powers the codec down, while
> the IRQ thread still expects live status-register access.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: cs35l33: drain threaded IRQ before runtime suspend
      https://git.kernel.org/broonie/sound/c/e074c12c428c
[2/2] ASoC: cs35l34: drain threaded IRQ before runtime suspend
      https://git.kernel.org/broonie/sound/c/4105a4c0678b

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

