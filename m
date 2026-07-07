Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB49741F7C6;
	Wed,  8 Jul 2026 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506257; cv=none; b=HvOkyNBZVO2qn2YSv8xQ8CY/nXyDi6wiGDVj7cxGmgB0yCs6DjuwtzlSkLHW7Pmefb0A3dKIDTvMuyHmFEX+Do0rm6oR1dV7boecXG98o55Vtk55S7NegfnaAig/XOlY41G9Qpr0s7Eeg05YN7euvISnQXQxin8HFf7jhLPsST0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506257; c=relaxed/simple;
	bh=ECKbbGtOp2x2gZp57R3hKGO+84VF39ZZfu1QVItVje0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D7HpOqprWDq3SGYubZYdW7ubEi700hK210LFJX2kUDZsHfEFvjbZdpeGlE6kHKwgGyNsgh7/PGG+WZAenur5rXca2XpA9/sxgRoDgRsoHeG56GWY9/tkjHE+mwJ3gA+zO3G2uVE1VetSh1aKoRBc9CHvp0eKuPnGyf44Za9/pWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRM4zf3v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRM4zf3v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAAB11F00ADE;
	Wed,  8 Jul 2026 10:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783506256;
	bh=q+Ff13ruJmFjf/Yku53IBSfQz543yzS9YWFafB1ADmc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PRM4zf3vF2xU7AkFfh+PjQsricrUGUvdRq/apiSnP3OcPo3uFWRMmiQsRqOqX92rb
	 fWzbJrUJ2fwHnWPvEHamMP1vKZAXqcmMuUshClk6GupoCQaVR9Bb17FUeSPXJytjj7
	 cisa782pGJujuXuelIs0uGwZ6BxQUDSDGwJDUgr7eWNLbSRgp3jD3j/hvAYpHDryh5
	 Slza0p97BMwUv7N73Tz/QJm30jol68p8sErTeu9qOVgO3z3usSG+te+psHqwpMpeDl
	 c/mo1NTnVyx8W4D5bzNefiYfPXaca/0YJhIXo3COslBqnpuunMZtM3Sm5BgUZEw2zh
	 ylyAbcvgz5DkQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 perex@perex.cz, tiwai@suse.com, Sunil-kumar.Dommati@amd.com, 
 venkataprasad.potturu@amd.com, Basavaraj.Hiregoudar@amd.com, 
 mario.limonciello@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, julianbraha@gmail.com, 
 sound-open-firmware@alsa-project.org
In-Reply-To: <20260707060918.2535962-1-Vijendar.Mukunda@amd.com>
References: <20260707060918.2535962-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: SOF: amd: add missing blank line between Kconfig
 entries
Message-Id: <178343923986.59892.13581171863866923036.b4-ty@b4>
Date: Tue, 07 Jul 2026 16:47:19 +0100
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
 h=from:subject:message-id; bh=ECKbbGtOp2x2gZp57R3hKGO+84VF39ZZfu1QVItVje0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqTiVMClTpAtGxH5RSOUyhSEEUI9X9TeFI8ShWZ
 JZUfLt+YWWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak4lTAAKCRAk1otyXVSH
 0HqvB/9GKUnj451BgezhqHm7MDlhJZRaqx5xxww/+l0jAsc8EXdDXGN3AGzDf+l0z+TBrIHoetY
 7teZAubLi+L8DHeXOg9yeY4v7TwUUNnjYenPym/MoTYNdDJ+bpU5xiVzF4/rBfSrWKTXXsc9JwF
 b8yLjIQS4NWe2jjoIVFy3I32tVinNyX5YBTFxnLW9nnYz09UTobvnQyhWQAHpcoSdAlTSptpIg6
 +UDH9AGEwQyhudpGVD1o1A7lEww81ZK178KA310KrfzbdAGZ2kkxtR4MxjVpfuounQE2E/HmoBJ
 Qd2UCtDOUs7bac345p5t3NIUUNelUjQm7iql+8QLuXFboSy6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 07 Jul 2026 11:39:00 +0530, Vijendar Mukunda wrote:
> ASoC: SOF: amd: add missing blank line between Kconfig entries

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: SOF: amd: add missing blank line between Kconfig entries
      https://git.kernel.org/broonie/sound/c/6943ea99422e

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

