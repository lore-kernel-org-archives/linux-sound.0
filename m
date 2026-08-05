Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528463290C7;
	Thu,  6 Aug 2026 11:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786015020; cv=none; b=BXA61RggRFRX5vYXExHAkEFMtTdsvY7XQOvLerX4XKw7Wmeg4OeCVJ3liWUUnhBrbK/PEcZn3ywYXcuVz3ThhuwQawXXxqPE/so78NNz9jZ3WJveCLSe+SS0XKDyBTaAE5PYbbbYiQh1icsaO6Xpt04IomYp65Tm4lkkvCZDAuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786015020; c=relaxed/simple;
	bh=gk9mkUkPPPpTCUoE99h5PJY26gd6OjPOpFFkIbQuA6I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TZKXTbfC5DTRme3QmNn0llcr5pq+azkMRzzvOdDNLgE4v0T4xImYpPsI1ojBn7d4oinzhH1fEpGa6f+ZHCoAtIdaKXPWolPT2wYVQRmn03Vzydr1DSisVM3rdlPP+Rg7HrLdzfz9ONlBD6RjrOD1q7QvX96A2/Ltd5938378NKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUsE0XwL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUsE0XwL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A081F000E9;
	Thu,  6 Aug 2026 11:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786015019;
	bh=4uZYy4uoQQQTYTc9PDk7/+KtDsazcFwqPRWRopqQJe4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZUsE0XwLhcc063EFE/AHCLrW+3204RcBSPflh99QWcw9RCalopKz/XMYgKCHIuUhq
	 a9MW4Ncpo94gH+6xcJRQtqUwEB9xxIrmACGKqMx231UjKjLEqKUulgrfyzzqS6Sx9C
	 HrQDG1KxT9bJbLFM30T0nnlhM6s8N133kG7KJg+XJmlbFQ9P1FNVOL9OkiK7p6C7n/
	 C/jcTPehiLjhcOBMYoPOQBhyWwD36w2Pkxnr7XFTdYA6j4zEoJzVAh3d7EHO68YUzF
	 NtK1wZc0iL5DSJcfeQ+P5LGK803ugjqj2nWuJxwYqofOa2wkyuLIfuocrkLU3oN6tj
	 xV0B4fxyDkPSQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Jakub Kicinski <kuba@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260805144434.1290261-1-ivo.g.dimitrov.75@gmail.com>
References: <20260805144434.1290261-1-ivo.g.dimitrov.75@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: cpcap: Use standard ASoC DAI link
 configuration for voice
Message-Id: <178597298068.199927.11644339559553747903.b4-ty@b4>
Date: Thu, 06 Aug 2026 00:36:20 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1799; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gk9mkUkPPPpTCUoE99h5PJY26gd6OjPOpFFkIbQuA6I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqdG0nS1ONt8CaZVk0iYV/Xv+o3Ofzx1BPbjC8d
 qdVaF4NibaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanRtJwAKCRAk1otyXVSH
 0ARFB/90cMaFIVicGPvRMLuaEAYlC7e7je01/EqVnMmYKQ2c37oIsR8mahcSv/5LiKD0DYJtKUe
 BcVpi95AL+H7iGNfJq0pXNWntAcVaH3/ZuEXZL3TcAlmh/siXrIkW6dCrWqqjBxrAoYTHkk+R6R
 OL1rNaE7ky/5KLPTA5EMilU5Hvx7DZPArdsa9gzJ7uG1CDb3OG4vYbg/gIOWay4SQ1JW1hdSxDR
 x3KGMunED49/pVGtE5gde6r72RQ+Q4yW8KlhN+6vubSdwNHnjSgmqIY4977eCg5ry2qOwHhb+5a
 ussai+8RHSSqUn1/X5oCpJ0kHIRB5Vr80ekBX72Zf0yW52hc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 05 Aug 2026 17:44:32 +0300, Ivaylo Dimitrov wrote:
> ASoC: cpcap: Use standard ASoC DAI link configuration for voice
> 
> This series removes the modem-specific voice call support implementation
> from the cpcap codec driver and moves the DAI configuration towards the
> standard ASoC DAI link configuration model.
> 
> The previous implementation added a cpcap-specific .set_tdm_slot()
> callback and relied on a client driver to locate and configure the codec
> DAI directly using snd_soc_dai_set_*() APIs. This couples the codec
> driver to a particular client implementation and bypasses the normal ASoC
> configuration flow.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: cpcap: Remove modem-specific voice call support
      https://git.kernel.org/broonie/sound/c/24fb36c1936b
[2/2] soc: codecs: cpcap: set voice DAI format as specified in DT
      https://git.kernel.org/broonie/sound/c/26a92a696897

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

