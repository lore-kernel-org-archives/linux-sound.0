Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F913876BA;
	Mon,  3 Aug 2026 23:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785798954; cv=none; b=AZ/O8S8UCeuv37CiDD9Jl5SzR7SpbEPd7oKiJdEw09v3MhSJiv+fxh05u/w5LjXTuQtXHQvptlcQkT7JQu0VKcqb2tvb3adYW9tQZpYXbvL6QcR5nFiS2Gx0B6ltsS4QtzTgnOSdoqhK151X6N1nq4n69QJRdD8kgvLSfW2csiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785798954; c=relaxed/simple;
	bh=7W/CMu3V/9cdNbjOLIAgKCUqndCD9VyS7g2IcN5Eu9g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lVtXWfaDFQpA/YIhg9pLJl1vTV0Xu8IdMyq050dedgBTZMNjpHfaKV+zVuuN2/GqFiV5LA2FFfbWN5w+PBVDaHDRchQcolQWNQBER2VRYkc7MH+lnsP73qNm6EZbR9TEaGLAacsE6KlkQINLk/5YEr062dYD/UV15jG27hIuJv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ig/43to9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ig/43to9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE23F1F000E9;
	Mon,  3 Aug 2026 23:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785798950;
	bh=3wHub3a7RCB50/PM+kEiafYWILAumyURYPZ+q3FCuzs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ig/43to9M4N4riUSMxvUrM24IB8b5qbSNYK/jZJy6vobm1y0+5v/7wGmI8+jvu8Fz
	 foUs33I3wzwfnobZcR82EsM+CrTg7E27dDHoND3vVjsW64Rvwqu8opZWKVoTH9TcTY
	 nW5f1eg6JqRq57MoSHyzqtlTOWB6mXbdXjjwf7EJPo2msrz4KiXiT5/6T253ltwr1l
	 6dBA9nRZPO7C4rkBquJFImU+EXLQjj8g2m0rNRBXvnx42t4ahnCvHNyl4HcUmwP+ib
	 5Y4XtLqkPfJsTtH6hufnpL3WkxOoRJV8cB+jPfnG4Z3gUAdFRSoAgIKH4UwzleDBms
	 zNvlQvx529DGg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Rudi Heitbaum <rudi@heitbaum.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <anCcciWmO6QOLTsl@5e001e58230e>
References: <anCcciWmO6QOLTsl@5e001e58230e>
Subject: Re: [PATCH] ASoC: rt5645: Make the Kconfig symbol user selectable
Message-Id: <178578271878.255647.3954273442003281333.b4-ty@b4>
Date: Mon, 03 Aug 2026 19:45:18 +0100
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
 h=from:subject:message-id; bh=7W/CMu3V/9cdNbjOLIAgKCUqndCD9VyS7g2IcN5Eu9g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcSEkxq2hxlkeD9+e0ijzuwgdfr39H4wpnfPwT
 LyZll3qT4WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanEhJAAKCRAk1otyXVSH
 0GvZB/9ESO9uuFePOL1uwEZy+JnIrh4ajpWZra+goYEjB7OkIUyz0PWteXZ/+iiqynf2vIHK2QQ
 Q6Xa9G0Hdu5nGsO6+rJRsMR+K4CD+yR3ebFeWCTr6CMRGFKPiL0hrkKs4mIJy7VQb+UdjY7ChCh
 OVJ88OjJE4A1p6W4JA7ryIXBlCbS39xunP/BsiPz7/pEQJH4w5R4dLVKA/+MI8VYPVHiTuDRtIa
 xMvFrPyQRtHE0HxW4144XQqARXehdJlLqfBE3PUUMrhQsM0unDghPuPppY53klKVo40wxpRljui
 /5drjbDT+jL5CYeS4mAXqxnWJGDSd4UIBVOePAAcngYVjkpZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 03 Aug 2026 13:49:38 +0000, Rudi Heitbaum wrote:
> ASoC: rt5645: Make the Kconfig symbol user selectable

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: rt5645: Make the Kconfig symbol user selectable
      https://git.kernel.org/broonie/sound/c/588852647b81

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

