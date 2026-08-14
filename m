Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E513531E846;
	Fri, 14 Aug 2026 18:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786732933; cv=none; b=L11fVDh5EVM/5/51lnZjU1z+M99G8kA8r9eiWTz0fwYSMrnFcmGbdRU3zySoH4LVal4errGN0i4Bo3VOy65vWAHeUNuUXJkAlW+zi9K/QcIel26W8CxGi4xystVewCR5v9ylPHw76I47BFOdAS5TaS3TqqOtp/JOL0q1+ruYACk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786732933; c=relaxed/simple;
	bh=xcWeFbm98L1DsWNaw0w608Gyk3VdXyMyX7CZ9ZTLZSQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=olGlkfxGEvT60HiMn3VVNBUF14zs14oCI6XC3wq6k5gjobENmRRhPsFdtyKptOYb66UzFUDczpFo8mOXFQfu4jeu3bDjIQdK9ZqnJnmGoybRGMVz6Tw786Qg/B4OUo0th1yCVqTwJ/dHUpyh1ty5VnO+BDZE9mYzUUwk2O5KnLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6qIQ0IC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6qIQ0IC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB001F00A3D;
	Fri, 14 Aug 2026 18:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786732931;
	bh=bBbLDJFcrBTaSJ3LPdJm2DJdlydtGF27CG1CJ5pPdvA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=O6qIQ0ICd/bGLuNghwgwJ8YOpz/gZ2Ra1IbmoJPI+DD0rw026G6HypvtGEnPyRbR8
	 WCxHdlBL0dGBZaxCkhFnMdfrdpaJaDkK6eQVZ71MceW2USaf6UExhPchrUrlA0bDpF
	 wNjWEdVqB+SV3yHHmDiKJwwN6ezabDUEHgHLiQo7uhmcm+BHQnxnKBssV9Y8CmIyXk
	 N4OlO+S68Y30ztPxyb6dFhbv5cXOAOkQcvzt9MSDFIHx0FDyDgdX25fnU318LEeLE+
	 jRQnmMywduOVs0moV6VNOVP2/2P9HDc+OL9d8HpvGk+kxXjq4trAJ4earugo/lyGkn
	 8jCVsjw3+SuOA==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Andrey Golovko <andrey.golovko@gmail.com>
Cc: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Antoine Monnet <antoine@montane.tech>, Robin Everaars <robineveraars@pm.me>, 
 Ville Saarinen <wiza@saarinenkoti.fi>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260814094000.22118-1-andrey.golovko@gmail.com>
References: <20260814094000.22118-1-andrey.golovko@gmail.com>
Subject: Re: (subset) [PATCH v2 0/2] ASoC: tas2783-sdw: fix the read-only
 Control handling
Message-Id: <178672090520.152149.17207193857826420271.b4-ty@b4>
Date: Fri, 14 Aug 2026 16:21:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1871; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xcWeFbm98L1DsWNaw0w608Gyk3VdXyMyX7CZ9ZTLZSQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqf2F+rhbX3zpJIxxIJmNV9jlnWOgana02SK7r1
 KVf5vsgxkSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCan9hfgAKCRAk1otyXVSH
 0H/IB/46qRsAakxhXbUvLTRumFqGPmEJBCXlg0D0Z7bpTz17UzU8XWJJKRBIFXCsEDdq+rOdoRm
 LRHDsj8Hsn1PRESzJrr6iQa3/PTk92rbv/MpZ2Gr+ISw3jtkQKVTQDbHPH+xX95Bc1GVV1BjU5u
 uMzv5JMhK02bSqvGJYTOFz/yskqYvE5UhrqeQp24txhgAAUk4SGha9Y7/wm3z9RC+tjHwg6BdwA
 u3KPg72mHuZ1bJ3Z/ephnoFPY7UZarFdqvvnTkInZzfcQqVlP7E4amU0Ad5csgNWBJ+dLbwafAF
 9w7o2UvePCaigDMVlF2R8ue3050+W2QeZ64jybbdUwOtppxE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 14 Aug 2026 09:40:00 +0300, Andrey Golovko wrote:
> ASoC: tas2783-sdw: fix the read-only Control handling
> 
> The two read-only Control patches from 13 August, resent together as a
> series because the second one depends on the first, and with the change
> Mark asked for.
> 
> He pointed out that the XU22 Control 0x14 in the read-only list is
> SDCA_CTL_XU_FDL_STATUS, which sdca_fdl_process() writes.  He is right,
> and the description I gave it - "firmware download status" - reads like
> a status the device owns, which it is not.  It is a handshake: the
> device sets the bits it owns, and the host writes its response back into
> the same Control, keeping the device bits, which is exactly what
> sdca_fdl_process() does with response | (status & ~SDCA_CTL_XU_FDLH_MASK).
> So it is out of the list in 1/2.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: tas2783-sdw: do not treat read-only Controls as writable
      https://git.kernel.org/broonie/sound/c/0c7aeb0f5ece

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

