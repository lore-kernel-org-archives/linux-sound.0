Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA41339184F;
	Fri, 12 Jun 2026 22:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302696; cv=none; b=L7cLqkzmeF5hzeMfirtHAqd+zQKhZbJIBqLp888SJ2VZZkd6/Wip1nVi9qt/cnhM2zFY7ysqGV+en+cVi6WIk9bcMGZxyBosWw1RVh4fVrnMC60GymFi/mJxLmtTsEKVMGHnsA7pgIM7PLZqGzpCcVmgHkifDrFT5Q5XG6JmaC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302696; c=relaxed/simple;
	bh=eLLqyyzlR9O2dl1hsMPFaCwDe7/QI75ntAWWosN3Z2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U87L18U16JcTdqSidMGoQT49+ipDwY6lahgE3GI1TI0eJlWSgjnOmGZgcAF5w+EC+JQ6bUl+4IyVtKj9/CUtYsVqyJ6HAKukG/3MIPBwLUFERlEr2+KBDe9SXtr1ZZC+9fb5Mc0YujDbYcMmVEDnUfo2GVrsFzBsEnd+PVRZV+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEW8gy5k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEW8gy5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8DF91F000E9;
	Fri, 12 Jun 2026 22:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302695;
	bh=LublA5m8L0ECAu5v1inIdq7Wb51vJ+0WnvUklAmVIwY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SEW8gy5kzptJ6FfwoG/uEHkyhm8byEbGv2knBXdU6s7AtU+mphGH8Jlw4afKDc9lV
	 oQoZrn3oyyebcuiBhkDKl6wip1HwsqtyQZkkwyl4ALcDJlrsVggQLwNTwNoXqaO946
	 3mU89rEiaO1EZzfkLHWEWK3H3xZNNmH4KLrH01dUfkcnE/m7URxyZtYk433HxBILMu
	 YYTnn991QMJ5cnL0aiFJbrSBfeKFgolKUg+jLFa0RieLo+OWNtFyZrHV00M+477EV+
	 IUy8fh5FJsBaEHKliUxYmYsQyWeWsp4xQSEPML51R0JYibtd3kWY4JgAig+rpTXbPv
	 w31NGef9eZ4wA==
From: Mark Brown <broonie@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 phucduc.bui@gmail.com
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260604033554.96996-1-phucduc.bui@gmail.com>
References: <20260604033554.96996-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 0/3] ASoC: rockchip: Use guard() for spin locks
Message-Id: <178120760640.484538.12942087225448845771.b4-ty@b4>
Date: Thu, 11 Jun 2026 20:53:26 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eLLqyyzlR9O2dl1hsMPFaCwDe7/QI75ntAWWosN3Z2E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIWiA66+2oeUDkW0OhWNEvZsPCVwlkfI7K4zH
 Z4CWgFIV6OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyFogAKCRAk1otyXVSH
 0GSrB/993BOW96HEqX3W1yJPPotpSEttq1S7fRjmO8SUultTqu3jhFKmIolw4ycIecMUkZGzmgE
 J8RLRBjQi/fvg7gn/CKn0tesHn+38opI+LuQs6KaNNEElYW6Qkgfnx60TeAQQVkods3e9goirG3
 x7eqQ53atvcjGhdVV7E4G3TX4sFMZiMR80/yWzkVps5MLMlKrJo3GEszSmHvGDqcGohowkYGJxF
 7MI+6vjKhxMStjKll8fWJQ3/E2oza6sMNDW/6iycy1HvNM0aI4lDtqMXG+5zMmx49XLz8RrE3Uu
 rq9tYcwXlWc4trp7IehhVB940uuSH7cVGrCV/7SjDLfi+s8I
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 04 Jun 2026 10:35:50 +0700, phucduc.bui@gmail.com wrote:
> ASoC: rockchip: Use guard() for spin locks
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts spinlock handling in the Rockchip sound drivers
> to use guard() helpers.
> The changes are code cleanup only and should have no functional impact.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: rockchip: rockchip_i2s: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/4bda5af16920
[2/3] ASoC: rockchip: i2s-tdm: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/ec22437fc41a
[3/3] ASoC: rockchip: rockchip_sai: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/f7fe9f707360

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

