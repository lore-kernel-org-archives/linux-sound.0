Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024A7D51C
	for <linux-sound@vger.kernel.org>; Fri, 14 Jun 2024 14:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718374589; cv=none; b=PDXgnN4WHDYqGWKCQJT+kiRJjdKlZ2MzozhbvkpjFtKg1KUQBRXmRx3n9sEWxtDWV2fNP/7sIkAZiRXqhGJ3yXbmZuKQX5yp1nc0NYWa/KlDNbED3OX23pj/u0nncfTaGTBR+HBUQwPChmUSKacatNob2PsQN57vSnKNgELK5Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718374589; c=relaxed/simple;
	bh=EX6cdofRw4dUHQuRQKyswAwkF9oaLKdLL0bEeYpkN0c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=evooM5Vrs6VrgnWK9bvdoccz7JNrbf2kYQMPFLG5OucRD7GlVaI6DeyHaGiUCrkPYK6M8MdMj7Lo5mRG4QfdlBgLgCbpl2FYhlGLmuPGDnOpk7PElNWteXULYezLxg1rIGj2ZK8G4BUkX0Aj2gL7fM3Y5vRHAThW3wIk8Rqn/O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rNDaWNoN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rNDaWNoN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBF4C3277B;
	Fri, 14 Jun 2024 14:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718374588;
	bh=EX6cdofRw4dUHQuRQKyswAwkF9oaLKdLL0bEeYpkN0c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rNDaWNoNl/zru7fTjvTOIiOuAI2sWjyLC0jLShFLrCcVASyQYJffYY2aPSfo3uiL7
	 5IHl7sCy9XYPFPUfM5rKtpeAxNxAtcFMHH12uiaVxD/LGr/Ec7n+AnSujLyERoSibX
	 y281v4Ujdvlr22DRxTxVZlWouq8mV2ALSfB4b4QhjGgYZSBBeMZsiMfE62e+m2uXen
	 h/IKPANnC43gsAkqXyxhHnX32dPeuw10O+/E5+MSOp1vt9BzXDep5JvVTOPS8cCZsS
	 SoPjh5AHJio5+Sex1dxcADnn1SiegUd7+/WrQErP71e7wmL6AqqueZ8yc0Mt/XyTDP
	 zEYZs9IigIw6g==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com>
References: <20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: topology: Fix route memory corruption
Message-Id: <171837458634.276136.882653794696177346.b4-ty@kernel.org>
Date: Fri, 14 Jun 2024 15:16:26 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev-0bd45

On Thu, 13 Jun 2024 11:01:26 +0200, Amadeusz Sławiński wrote:
> It was reported that recent fix for memory corruption during topology
> load, causes corruption in other cases. Instead of being overeager with
> checking topology, assume that it is properly formatted and just
> duplicate strings.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: topology: Fix route memory corruption
      commit: 0298f51652be47b79780833e0b63194e1231fa34

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

