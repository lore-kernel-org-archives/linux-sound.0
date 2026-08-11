Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888EC3A6B9D;
	Tue, 11 Aug 2026 15:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786462861; cv=none; b=CdioFh/DGKWfJdRiPHj/7wV9EamZEidyNLRncqxDmYTS5vkX74XBcNdu9JgZLXyZF+MK2GAh7YiStxWWZNQbbf1jOVFH0pmCal+JCh64YzUY1kHX/coPp33C92i+V1/AhhBNn6nXAE0ZZ93grsbY9bKDAFy3Drwu8e00Wc2Yh4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786462861; c=relaxed/simple;
	bh=8FFN5RQuUdAdKrtLAqHtFYIeCamT4oxVgPLbzrTOaSM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H5D7d7v/q08vkvBsFv4tjClyd+Mmg2GVfITSfCOfQvxCQ/6gGxLLj3sCOYdyBHomnsTosvwL2ZRYloJxNChqsA+ICgPxf7zkxYPJKdJW18EWJ4u3yp5lWau1NZA2v1Pq7dlnJfb+qBNXM/V4LxwcYaIw/TicG0sgT5i0AW4pHwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4tLIz1P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4tLIz1P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9161F000E9;
	Tue, 11 Aug 2026 15:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786462860;
	bh=70Y2+oxwseujR5g4wJWy1df8V/gT2a+MfJwCphiO618=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=n4tLIz1PRDPUvpdoZVaTw+o/ik9LOR9d98ypJKWg/eH7mGsrMB5fXUr49Sm7YYs8y
	 Aox8LyBQYp5TlwaEBXSZ6HOK3SgF+9V0eKGIOz2oCfwJ3QRXAoDtFPsDFsxPEasknQ
	 RPxEe2LxM81VVBQD7yX139XRKlAKInNoC/C+Ltu6YKIr2gVS+ZmLtbpS/CVCTuEF9A
	 KDAl06Kpo9W8KIZBDGh4gFv8OhhcMrow/5I6sRTtraFNCWx5u794R25JPM3QWBkYko
	 ig3ByWXDaSF8BZeeD4eqoT8Xoib4JZYpsZfabHkkZarVIcFZAi4B4CyioCls7dsDG8
	 EzKqpVhdPYmcw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-kernel@vger.kernel.org, ckeepax@opensource.cirrus.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com, 
 pierre-louis.bossart@linux.dev, baojun.xu@ti.com, shenghao-ding@ti.com, 
 sandeepk@ti.com, v-hampiholi@ti.com
In-Reply-To: <20260807151623.3005-1-niranjan.hy@ti.com>
References: <20260807151623.3005-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v1] ASoC: tac5xx2-sdw: select REGMAP_SOUNDWIRE_MBQ
Message-Id: <178645628402.119683.3280779772065941177.b4-ty@b4>
Date: Tue, 11 Aug 2026 14:51:24 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8FFN5RQuUdAdKrtLAqHtFYIeCamT4oxVgPLbzrTOaSM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqe0KI/0LL3oR7OSx4NTzC0QFdI+1oUdX5EDO6x
 CYWUv19BcuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCantCiAAKCRAk1otyXVSH
 0BZ+B/0Sw4fYRJTYANw1GodNlkGsShdn4aP6A5C3mGu17UXBXFF44GD9dzHTfuNeyoA4Lc11X3V
 rd9Yj0oOrZm9vjEPi9LJLfu/fvYK8+cZuQq5qVdZOciN5oRuUMKBcntTS4eby9lhPIt4lf9JoyP
 O+DXzyQ9Pf1liT2x3kGVny951+ASbM6FDRdzUYI3wbklw7Lt3YWw8olnCK2K/eUOPoKsrJmBIRf
 s7ZEnPDdNrxMKCQKnO8PFcnDzYntu4sv8eSbJd9O39gJCMiqriwiGAOZyWujTBVPQQvD/gFJn/T
 IfXSyFQpszmjx/gF74VG1UiBej3/Na1RIXiwLSHOBZZI7d4k
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 07 Aug 2026 20:46:23 +0530, Niranjan H Y wrote:
> ASoC: tac5xx2-sdw: select REGMAP_SOUNDWIRE_MBQ

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tac5xx2-sdw: select REGMAP_SOUNDWIRE_MBQ
      https://git.kernel.org/broonie/sound/c/78983d82dc4c

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

