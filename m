Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95103DA5A9;
	Tue,  2 Jun 2026 12:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402092; cv=none; b=u14lOJwkXFGwMXa2hs43lMY7sdX5ONIBNGdQWauTbmJE7ErkkBHMWaXBbd//wEkK3/vL7XGX5RHb0FNXCNwLhvTFn6L/6tbijMUq0UrEPxjcbj4Egx5CGPJXT7u7r4b4t13QiOlf7GYXBIc9KDNgzSgsKewOZ08V7rsclByBPg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402092; c=relaxed/simple;
	bh=z/+hgPPlUvufC16yntU5KcxQ21JhPlwVwzLuLjojaXY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JoAWnu8K5o4R/Z/L3toi2uOC2LDjcNUX+20EewF2kqjUKIqC0Xptrv6LtU/quwNcMvAGau/1gkJqACMRwt8YJujxij7e3CaE5QL+WRqZC81wj8ChbW1MZYfcqgXH6Sy7EgBq8SjD47arkFZnKkhpDk8WYcgV37slJnWR03pAq6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nr2lUsJP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nr2lUsJP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FCF21F00893;
	Tue,  2 Jun 2026 12:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780402091;
	bh=1A60zaXjI6b3FIBcExPDQN2zDgTKgqVTn6/Cgpx7SA8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nr2lUsJPK/9a+vF6HAz+VUDyU+xSaKvxbyTNkfzQDe1ROP4X++Jw41DaxlRK9icja
	 n/WF64jddmxAFSG4UDsZOcFcKWQQ1eiFgByjes64GNLb/pmnSG49t64p6iUx10eL9v
	 0zueNAwbdBuAIvP1J9dxBNX1YOuyXpn9i8ctJkG0PHXvwFC4W4LOIlHrBgiqoOfHGz
	 V0dV31Vs+yF4KVZpF2XhZ24kTzfDcwCZIJCLi4FzOhJ+kp+8y6KatYNIsC6TRVoG55
	 Yz1nkVRXJ7NnQ3ZYu+yLrft9UjMLMGR0BcZXhaYSn2NUX+C8b3cMWq1XiQmIoQh+1H
	 PLMbniP3lEKFA==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260527100206.26788-1-phucduc.bui@gmail.com>
References: <20260527100206.26788-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: sti: Use guard() for mutex & spin locks
Message-Id: <178032884067.44654.7022103861716003797.b4-ty@b4>
Date: Mon, 01 Jun 2026 16:47:20 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534; i=broonie@kernel.org;
 h=from:subject:message-id; bh=z/+hgPPlUvufC16yntU5KcxQ21JhPlwVwzLuLjojaXY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqHsepjJT85cM/LETbsBM7YPm7E/ygscFsMVmQu
 kpKwypkbGuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah7HqQAKCRAk1otyXVSH
 0MQUB/94TrkyV85vcB2rzLpNBrc90T45xIy7LynrgbriTERh76OV4g9e5gKt+MJwZi1bKSh2IW+
 YPLK2nvG5jVnpc0yaS0pFGfKA2+t3GukcGilQyHEjgUmoJE9fBHLEASDVj+Aqfej7VeYjgyF/cj
 a4TzDyax/ZtMUZIH/LD+lQ3n3/Apsyx4/oT14bCCfljt5G9OVWmWrx2OKlJdC879UTJ4L4gQ1//
 zeUD1sEUQHzB5JDd81I9nn5OYYmmJ/1pfft+U95ah51A0ktawEsEvMbQpnb1qtDTOHYpVY7Cm3+
 UCXdB00gEvfClFFmWAJtWiMtkCj3ft/gpGifX4fvhH7l2pSC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 27 May 2026 17:02:04 +0700, phucduc.bui@gmail.com wrote:
> ASoC: sti: Use guard() for mutex & spin locks
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts mutex and spinlock handling in the STI drivers
> to use guard() helpers.
> The changes are code cleanup only and should have no functional impact.
> Compile tested only.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: sti: uniperif_reader: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/205cc2a7eff0
[2/2] ASoC: sti: uniperif_player: Use guard() for mutex & spin locks
      https://git.kernel.org/broonie/sound/c/96166a8def74

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

