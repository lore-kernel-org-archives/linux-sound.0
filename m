Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40307307486;
	Wed,  3 Dec 2025 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764773658; cv=none; b=CNInsyo1pAZipisYXmzg8Edmso+sP7vKT4WK3j3vfwSohczqna9/5MkvQSlD/I3D/ffT4OywZQBfTuizVXHP4q5PPlEzYDCrR3UQcAPxhe9QTy5byLQLc837oy9XcQy67XUl1ykdnbx25C/C2KmdyV0UYfJ7YrIu9c8cWhDObZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764773658; c=relaxed/simple;
	bh=T/mpkoDkRkQznJ4tY5RNjZro2rZBg1u/C0IJ2SPDB+0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rDnGYnozWQLgvocR+ea87EW5fxTOV5lL3Q0gQ7nG8dlNrsmvsrOlY1mG/KkA2fi8Ews11l0IimHhqvdfXRMLwdXoT95cEkrHnFc7yUdE46oTQ8HxLjtRO6JmkbuhJubFEn7gNErlzC+3v6H7g/lpbjKYYgHglAqRcPYkdFABBYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dn6g1MAY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dn6g1MAY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C87AC116B1;
	Wed,  3 Dec 2025 14:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764773656;
	bh=T/mpkoDkRkQznJ4tY5RNjZro2rZBg1u/C0IJ2SPDB+0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Dn6g1MAYfs5NC3bpq41ehLyOzxgWqU66/H1pIM+zKcs8YORIuJPiyZt6cb5ekottE
	 9le65haKP8JA91ZopVYFiKhASiJMg0qcbytVDNhNWtgMxpxOnNvtT4/eEWPVN2ie1t
	 pah10Cip1WFL2nPO+yFOMbKqQgCC0g80MZyahRLXfLVK9THeOattuM4+7Pg999F3xs
	 Q8CbTPe/zKrlYFsuHMl/xJXL5UOCCv2y1TVVRKWG5BJsPOTT7D8y2K99KrX7lhQwCo
	 po+bmTV9dQohroLP19DMvcZEo2K5pgbNP+9AMJtVitq/IMS1uJnkDY64QM4i8gQG73
	 lU9gSGbb5/pOg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, 
 Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, 
 Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20251203064650.2554625-1-raghavendraprasad.mallela@amd.com>
References: <20251203064650.2554625-1-raghavendraprasad.mallela@amd.com>
Subject: Re: [PATCH v2] ASoC: amd: acp: Audio is not resuming after s0ix
Message-Id: <176477365389.48347.3477237517341563967.b4-ty@kernel.org>
Date: Wed, 03 Dec 2025 14:54:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 03 Dec 2025 12:16:48 +0530, Raghavendra Prasad Mallela wrote:
> Audio fails to resume after system exits suspend mode
> due to accessing incorrect ring buffer address during
> resume. This patch resolves issue by selecting correct
> address based on the ACP version.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Audio is not resuming after s0ix
      commit: 3ee257aba1d56c3f0f1028669a8ad0f1a477f05b

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

