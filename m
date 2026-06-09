Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15460368287;
	Tue,  9 Jun 2026 23:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781046348; cv=none; b=MEQ/DK8ZO/uU9Cur+n+BKHG8oAQNKzbB95jhoRzyTwbqg0MN8R3AWSJfN6h2DUSzuDx65heGUgY/J1ilbqU07mu8C4aG2FXUCXU125rnmFNSV0+NaK6BIeRy0EIkDeRlu4RtKqfOVYN4y+LdtFO35ALwAao7g2uFbgbbvf/DoOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781046348; c=relaxed/simple;
	bh=o6n1uuPCEB/Ka068lEYyZMmLYee+quQGII4plLS5wIc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OqOgRZS0LhZX2pTItK1DO08k0koE0UVb98tA4WThiAm2CtvtaNeQEBVISmlChv+C5lvvbhl7KvCXZg6xKiNsRjVKYgrFQLJhPAhUgpUxfIQjARgqf2PDBk6XPQh0S1JF0x0TkxcLRM4psfkJEsztfbPtiSwvmm0cGkVk9M2MJJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAVbbo8U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAVbbo8U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A761F00893;
	Tue,  9 Jun 2026 23:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781046347;
	bh=o9zlsQ8CpFOx7IotxwW6wamDr1emdTYdo/aeMCB1F6M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MAVbbo8UiKc/+V5LwknxNszBu/EiR4Bp5hNolCNbatNfRtP4/J90BmPbiVQ8B6wkT
	 KNtLVuvJ8+r6egapbfC5CZakBr7otrDfna0ozc34/vArQDFjjcvcepYdFXHdkaQC5U
	 FBNtiU01sY8cYs2A+/0wB+FQsVj7CGwW3452HgdEIDrvKTW7voXqFqPoBwsb6MehJZ
	 SjOmFvGJC+vE7Lf8vRuvW/+IICNX7MX75Goelqbo8DBYYc1W8PRtSnI3Fx39v/0xhN
	 YnXwcoXkloz/z7tJyAqpBcWNox4Courmn8Gjs0ZzcVJnt/YG/MoYnf6ndGd6nQLwlw
	 vXBqeUCHC11Aw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com, 
 mario.limonciello@amd.com, Basavaraj.Hiregoudar@amd.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260609143230.3310356-1-Vijendar.Mukunda@amd.com>
References: <20260609143230.3310356-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: ps: honor machine_check in SoundWire
 machine select
Message-Id: <178102694997.34323.5492926624097882645.b4-ty@b4>
Date: Tue, 09 Jun 2026 18:42:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=broonie@kernel.org;
 h=from:subject:message-id; bh=o6n1uuPCEB/Ka068lEYyZMmLYee+quQGII4plLS5wIc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKJxHMSDMkDDe7Pk1tgKc8ZVPwZitxx/8UPEXK
 vrxh9+wrZSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiicRwAKCRAk1otyXVSH
 0HYYB/4p7lDTg+LiovSu/s2PbfxWFwLsW3/qVzy8aDeXbygc1vRhIapfrVgtCYEW/4zwETXxmsZ
 NmimOm6xc9611r1lA9PQIIqk6zrTq9f3uUpzv3hHh3a9TMlHUhNGvJxvy4wueLgO+nqViK7pqfi
 6iMeYsUpxMT2Ea5tPqFs96nVzq8IO+pyEn/nsgUCX4yaCtnFaM/hgewNGNl2FFxN5NSnZf98dpw
 d2Ww57Cfd+ZtyXiy6qWqnXyw8TK0gzWYd1q2gUDTKTbXXBaqwU7j+0ovhBhg/Ly9vY8SW9HRQqZ
 KZVnptP+i6OLkLGICe3GZmqb5/lWy/AMDiu5wEUBmPpAGLsN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 09 Jun 2026 20:02:12 +0530, Vijendar Mukunda wrote:
> ASoC: amd: ps: honor machine_check in SoundWire machine select

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: amd: ps: honor machine_check in SoundWire machine select
      https://git.kernel.org/broonie/sound/c/a980535929de

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

