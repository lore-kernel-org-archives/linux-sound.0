Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E49A3845B5;
	Fri,  3 Apr 2026 16:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235179; cv=none; b=VZZcZbHkW28yEcg5mO2xcGi71+wRfrTNO+Xs20fB2rj3UxBK4zuzvpzSgRcb8P7448vlOOQFFgJXXcgbVDPC5ReyHxgn+xHJ4bre8EMDnxp57u5zg8YKard9MOQcPIu/ijpuk50T2pjqHy/riO6bwISOYThcg4dUN1OWD0+8vZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235179; c=relaxed/simple;
	bh=ZupRjspNAskhR3YNwcyG6k89dBHmFOaLyBKdLuM2E44=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cARl3PQRCN5n043UKk1Rbb3pMvpJkAe7tvm7A5tBoyhGs0FEr388Nc5x/mI1BDHZ6A1KteofBmCpQJq6VqvSQH8eP+jvcXhv1Yx0KbCmWGZd6zQ4M+zlOKwY7b0a5EYuerHgUQlPSyaKEfekodpiKjPWXEdA3Hst3cigVDflbLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e14Q3WBi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e14Q3WBi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A078BC19421;
	Fri,  3 Apr 2026 16:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775235179;
	bh=ZupRjspNAskhR3YNwcyG6k89dBHmFOaLyBKdLuM2E44=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e14Q3WBiAeiSvervezb8VwuuHeZnAF/jTcLkI0y4TkNTanco4R5379/o9KELWwFJh
	 kHIrD18wl2TR9WYVy+g3Inal1vk4MAx0IohRBad/K97Hp7HuvfXSta6ShrGxT4OKpm
	 JIbjZI3D8BXMRAoGvH3fbQRVAvWWPuIGI6ViWb1kMP9yE119Sgr428yQqK/HxSkaFk
	 Pj/uSgZmQCMon7BoZWhDDpgauKf3sYtUOIn7JHjSoMsjHW7aexcto4uyVph0T9ZWap
	 74+5zg7kxjTV13tPLbdcM/2b6dEerkQUoDmCz8WkNbjTwpwhX2p98BrcHNoHz57Exq
	 jxcsGcAwuaw2A==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-kernel@vger.kernel.org, ckeepax@opensource.cirrus.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, 
 baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
In-Reply-To: <20260401132148.2367-1-niranjan.hy@ti.com>
References: <20260401132148.2367-1-niranjan.hy@ti.com>
Subject: Re: (subset) [PATCH v4 1/4] ASoC: SDCA: Export Q7.8 volume control
 helpers
Message-Id: <177522556360.52946.6831416518174829443.b4-ty@b4>
Date: Fri, 03 Apr 2026 15:12:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZupRjspNAskhR3YNwcyG6k89dBHmFOaLyBKdLuM2E44=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGnP8GegBqSt7E3dGlECESqJK/DYyjoj23gTnYXlwMIxZ2IOe
 YkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJpz/BnAAoJECTWi3JdVIfQfH8H/RGt
 nGlAmdwQe5PgUYNdE6+mNztePnUl8DK10N4HDBTJ5JUc5pgmXPLvh0ogVmCzzMv13ymad4H0XLU
 7zlbj2JKQ2Z4SKk2zAq5BFfIL+9zDBPQBbh0nEV0nyBxka7dX3f7oUzAKMA0v/XqCtUsx09AFNM
 lNTTwVJYCrrDRxfWM7ezg2u054Bb52lK4JnAdzt/0JFpilDoRG70IJR5OnFTjnEZVa5pbcyJLZl
 yc9lViaVnmolE/Gn5vV1alKlIcTzsXF605EiskhyHeKls38aZFf3PEqyIXfAdiVmnhFT3abCmLp
 6mm+OkADIGI+sGLjwLgkZbLJlMgkm3Ns/gsM7LY=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 01 Apr 2026 18:51:45 +0530, Niranjan H Y wrote:
> ASoC: SDCA: Export Q7.8 volume control helpers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/4] ASoC: SDCA: Export Q7.8 volume control helpers
      https://git.kernel.org/broonie/sound/c/ba2a0e81d4d7

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

