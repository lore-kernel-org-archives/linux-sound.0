Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693663ECBD4
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 16:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776184130; cv=none; b=i5BFgCsk4Om8GrlGS20oFXhPqW886Szwrv6wItwLRA1ufZmeaYeZen3WTUypvgGUq0b5zcLwBpbkNRD34teQjKXOP1tZdpJaWp+DSJruXqcIJ/ZXFuQCv2Tc7EUb3e7pRIN/ajrkwTCEkpW7oWKscOy20EJctGJcOpgKuCqr14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776184130; c=relaxed/simple;
	bh=m87IxbRW3zWJKDJPhGfQ8A1E60ih9ZaxY+P+qvniJaI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p2f8QPAFmgF9MuOL50M7PimPh+YRY1xclVrfrbJjV5sIThggBgwisijmwbqlRXE0emzXLoi6yxQvO2cRTN9VkTcat/lPIHMSq/N5mvAVTOMeJhMbrBZ6pldgmG5cyCTJp0jLW3DiMGBWRo6lhcFJRmkLs3RCgC4IZq55h2xYgRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMqnUVoN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMqnUVoN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9F1C2BCB3;
	Tue, 14 Apr 2026 16:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776184130;
	bh=m87IxbRW3zWJKDJPhGfQ8A1E60ih9ZaxY+P+qvniJaI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XMqnUVoN0zNhS+O36IcvSiofeP/Jufbos35Iz2vRulBrIyGVpK6rwU/jXV3occRt9
	 eNNbPT816MZwe/ppAXKE1MkVOF8M6ikx6lrJkGtP+ie8LvQj2avr5e8L1JjoON8z6u
	 PHlLmNyLQ+pZC6tLlB+B9JGfZ/Gv+7391bu2KAe8S9MuO5Vdui7+qZ7cTKs6ENacuB
	 uQAn8Fs0XKEKeKuLz8t5fHUKPisnKn3Z8/qIT10KBYo9HKN1qg8UK43LWiBdTzdTTl
	 O595YInQwYdThTVV6PImH6yz2Y+zBefJEdC7kTAmIkrPcJLppjdPzAeEnyKqKKjR+E
	 724pQhQWEn3HQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
In-Reply-To: <20260414071441.1524039-1-shumingf@realtek.com>
References: <20260414071441.1524039-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt1320: fix the warning 'rae_fw' from
 request_firmware() not released
Message-Id: <177616523816.46569.4887576417597723142.b4-ty@b4>
Date: Tue, 14 Apr 2026 12:13:58 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176; i=broonie@kernel.org;
 h=from:subject:message-id; bh=m87IxbRW3zWJKDJPhGfQ8A1E60ih9ZaxY+P+qvniJaI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp3ms/9Mv3HvkoMvr1XRpFigLllmWLwnr1M5l2j
 V0NZ32R3jOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCad5rPwAKCRAk1otyXVSH
 0MQGB/4t5WKBrr6xljk05BUyQBvzeNkjBAQw8o2IsbeUo1/25JU1fpQlyyMZCs/u+ldX4zykvsL
 6BB9YHXMmU3eg3mBpWRi7N3OC3C8GaNj/isX5DlwMq7Buumypt18eL4a3+18iBFQGdlSnvmSTKo
 oBszcl6hYOJrnLyPFno4d7bn6I2Q+UZ4jKRRZziH0QSCaaBJm1bO3BrJttbXL/mOJi5whBC7uC+
 /sBmekrpslUFiPDwFKHxMgLxD2hx+yJ6HkBWfVXsrDEiI66CyiLaaUu+GpSwnjZnevP9IZg1FOx
 krSqVkRWome+q9vmr9ZKwIh8j1nPQgi8N6XAYAYT+p76wIK5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 14 Apr 2026 15:14:41 +0800, shumingf@realtek.com wrote:
> ASoC: rt1320: fix the warning 'rae_fw' from request_firmware() not released

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: rt1320: fix the warning 'rae_fw' from request_firmware() not released
      https://git.kernel.org/broonie/sound/c/cf162476f7e0

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

