Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77299155C82;
	Sun, 26 Apr 2026 23:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777245711; cv=none; b=Typo3RDAbVFLU1hIHlUE8/f62PBtpS3qJlyGvoA1LrHX3ztxsqzT0Fy7NA6En+auSl/THNwpZGOL/Hqwtagn8SvlYzNv0luvgwGXArVIm/r0lxvAZuOrCqM0fDeSxR9hwRhpN02OedOaBvbRk5/JMtm5/x7MUdAhQti9WxkgoEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777245711; c=relaxed/simple;
	bh=pnVE6EUzeKIbk/99bXLR/SYRphNIJcHYd8TAlk6Lom8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D4NlEDcishLjUg7XQppBHgYg9dSfS0SidMZE1Fbgk4pB02SMIA6N5j1i/umSFNzVAobF58Hhnibm9zlEn6AuTw4oRaP1sfA/Hq3D/ejgFsPATcandfXy5LMX4urNcJyRzBhYypvlcyKgdvnitHaIpRz18DrosLywVkrSFNG0LVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FF/8Ca/2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FF/8Ca/2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF07C2BCAF;
	Sun, 26 Apr 2026 23:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777245711;
	bh=pnVE6EUzeKIbk/99bXLR/SYRphNIJcHYd8TAlk6Lom8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FF/8Ca/2g/17AZAn3AZbx8pSB39gWtUfiYOM3NEafHx/hs8c6UoiSRap2ZMZLG8r8
	 if5E52rXX/fvVMXNF/3yLKiiGR2BC4fZjqk4Pp9HYj1BvSDGPStQicKP5aQ/McwfVR
	 /+3n5t1OoML3D9BcZZy4spqV2rncronQdxE4axUJoxXZBD8dd2uuzz2dFurK+ZdolI
	 1+fyTjrXCqhEvWABjG/g6eYU1EpAJcPYtJJ0w4IuvCRUUVJtbfxjOoNHMiwBiA0ag9
	 pJ9XcFWSEVYfK4mWDJwMI4o8MD4anHSId+xzKInXOoDa6ciTIqQsOVl5HxWYkAj9Rb
	 mKuLBKq2TBlPg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Marek Vasut <marex@nabladev.com>
Cc: Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Kevin Lu <kevin-lu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Takashi Iwai <tiwai@suse.com>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260411130542.19777-1-marex@nabladev.com>
References: <20260411130542.19777-1-marex@nabladev.com>
Subject: Re: [PATCH] ASoC: tlv320aic3x: Add multi endpoint support
Message-Id: <177724052136.266775.7653583515880146954.b4-ty@b4>
Date: Mon, 27 Apr 2026 06:55:21 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pnVE6EUzeKIbk/99bXLR/SYRphNIJcHYd8TAlk6Lom8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7p4M+ZV3THgzV3I+5loNKHgXl9tWb46HsHvTe
 z+3Ly/1h6KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae6eDAAKCRAk1otyXVSH
 0IsSB/9eh4snpX0vq9DNZWuOasTEpaFLl5OKyIy9yJuMpGI3BHclmZ856PnZUbiW1zMafYSU7YN
 ZNBq95CVqpc8KDV8B3ddcfsbHu7DB7lnaEzD7lSBYE737n8eib5h0C5ns54c2EeAGskIGuRuZMM
 gLc4FHioa+erk0sPzIGcWF34kADd+xkVaLV24PJD2UEzRw0O1AckhMif977RnPXZeKwwx0yxwtT
 NIMcoTupyXYP3xzMYXRnZTsx/uS9zK3HPPD6tkOsoUuD1YUYK0qAGmDkCwZb4rr4XvY+dk0t7ck
 P1jj48/wkQaCwbdc2ND1cuEW7OB4I3b7cYY4YlCxzRYOsQ1E
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 11 Apr 2026 15:05:12 +0200, Marek Vasut wrote:
> ASoC: tlv320aic3x: Add multi endpoint support

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tlv320aic3x: Add multi endpoint support
      https://git.kernel.org/broonie/sound/c/ed05258250dc

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

