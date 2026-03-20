Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458483C2771;
	Fri, 20 Mar 2026 14:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017451; cv=none; b=DZyz2YMf0i/2tQGa6xZrKPyPTkNA46bvWsc0NsOrWB9vn86w1EXNHxORAvBrAkuiPTGrTIde4/wBq19Ec54aMHNynkF2RUCrKgWVPYpXXA+8WHG6GRe+jklkbqWgzgctq5ezYyYVDjpyabdANjTlONkqnSHayt90uzXaSNnsevw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017451; c=relaxed/simple;
	bh=gTA37E7fDO/02inRsO3SlbwHlxa9O+Ljb/q/on/o9EM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qfUQMayvifR/HMEruNrDOU/Cf+lkvnBpB/8z18a6yWMpcMF3zbjOE0111/iRMqDy7cZdIMtMPGw2v7otE53lNFruTvPRtsHGSx8ODKWUnMJRwqFjoSntFmOv73CmvfAMBCVdJWw0+y620KWcn4NaHMIVqH2JB+KWDQ9FGwW6alU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dY5vN0Oa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dY5vN0Oa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C900BC4CEF7;
	Fri, 20 Mar 2026 14:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774017451;
	bh=gTA37E7fDO/02inRsO3SlbwHlxa9O+Ljb/q/on/o9EM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dY5vN0OaKXtmo0r1Y9gwKVxGvsasave2LXbqdS7n0NgNJXBARqazaRvE0b5fkR8SZ
	 YhqVaAbM/mXLweLz240BWQHbhbl6jV9SjrERhTzriwoAHhfCxjXKU9qNVmx3kIVO+d
	 o08s1oESDpaScQBVZgiLGwyZKA+/3uj33wQwbC+P9/BIfIMXPV+kNhCJnFuNf/y5BO
	 NPrTkKTmd7b/5j8wEu7j121QLN96rO5Uquki5fCcrJQlU6teUe2Fq+jWSob7Ox17+X
	 evaU2WWl5xeSidbrJPNfLx3DTYP9iotZW8XbWgHFBKyTHeyI9sG37hSlXlWwT8HDbF
	 68ciRJkjiy8fg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260319-sof-topology-array-size-fix-v1-1-f9191b16b1b7@gmail.com>
References: <20260319-sof-topology-array-size-fix-v1-1-f9191b16b1b7@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: topology: reject invalid vendor array size
 in token parser
Message-Id: <177401117189.58356.7938902622429757697.b4-ty@b4>
Date: Fri, 20 Mar 2026 12:52:51 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-db13a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gTA37E7fDO/02inRsO3SlbwHlxa9O+Ljb/q/on/o9EM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpvVun/OGOhKYT+eYi2+8CVeS4bIH+PEFvlRW1L
 Kgm8UFexo+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCab1bpwAKCRAk1otyXVSH
 0JEsB/wNqb2tN9wkt+wbUMGlV4jYGQX61woHveAUq8iZlw05FTYopRZGxwHJwPf+lFt6W2Gk/jA
 uCvs15JM88QcTs2Zx5ugCd7ER5Ba2cslUmgYX8bkkReQ+2e4Hyx8JVkK2TWpt7vOs33KI6+TckD
 IDL6R0waS2utmHKrTcvE9eV0ZOM/MtAmJ8LbOHTMJMhz3MPYUWypkyJ5Q77mkzLRYLgzklNsSyQ
 /OPLEQApuC/ykuLniEqQrNfBqTGUHRtVIE1fH17eHfvVEHO1u5WCpPAnh5t4cWr/jCcynwsw9B0
 mEupLv1i+2mdvr5R4zP5F1tLkI6lPTbxWZ/a9FkgVDtSt7yy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Mar 2026 21:45:26 -0300, Cássio Gabriel wrote:
> ASoC: SOF: topology: reject invalid vendor array size in token parser

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: SOF: topology: reject invalid vendor array size in token parser
      https://git.kernel.org/broonie/sound/c/215e5fe75881

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

