Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A89C3E3142;
	Tue,  9 Jun 2026 23:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781046375; cv=none; b=bMTSWUbXF5TvgEwTz1vBY/lsHY14mIB3sqajKtudR/fiBX/M6J+96N3fIywFwccT7yB26XrvemWPtqk5xSFj2zxQ38IZTcznX63hyGlZmBQayQEB+QvVmKjEgFwpQtcVC3MTtMPh0/bijWGy72J//0Ot8MKFA9NySSk7i40LY6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781046375; c=relaxed/simple;
	bh=JgEeY7eB+za5CqBF1RW90q81nKBWj8SL2L9Mv9jKbrE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hmi+aziJSLnYNSTaWgOXCIBQ1mOiOdrcLwNPUHpVHsYBt2QjctXmAkq2GFg4sg2SoFgW9Ns6Ots9CMxd3BU/HBjCwtj+qhiASWNHOhiTh4nSiKsQshTQ4VAPiyHn+sNWFXWEor1TNtOUEd85e8o3s6CbHA+UqksAiDg/2W/FMgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+Sflg4G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+Sflg4G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC511F00898;
	Tue,  9 Jun 2026 23:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781046374;
	bh=8pDXuObPF5gw4XW/4lBOLwp4F53GOe6GUabH0eYzzb8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Q+Sflg4GCrY+7baCctMMxwNdeyLNu8lm69Q/1po0FI39Z3okx6jnjKuKoKOrlozF7
	 vCL9wbOOByaoYn0JdplctiuiPzeD0HumS138ETj2Si37YQ/OdtDzYl2X8hILGEUnMa
	 eigqKRU3152Z8NnjjazxB7vh45dRAI54q/wP3YUFKbHtBizApmqBS1PlSikB2r5OD1
	 4+RRlsYl0iUjsF/rQfX5g01Typ0SU114h54fCN7Qe7p5a2ovPFZjhAaOD47UiiyeIH
	 cTL5tGeYiywe8CGeigiFGV7hkPe5a/KPuQVA6vemi+a4zEHC9SZWgOatwPaw4ik8ME
	 eGGXFkL0UNEWw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 perex@perex.cz, tiwai@suse.com, Sunil-kumar.Dommati@amd.com, 
 venkataprasad.potturu@amd.com, Basavaraj.Hiregoudar@amd.com, 
 mario.limonciello@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
In-Reply-To: <20260609144146.3311301-1-Vijendar.Mukunda@amd.com>
References: <20260609144146.3311301-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: SOF: amd: honor machine_check in SoundWire
 machine select
Message-Id: <178102720923.34323.10871612282287356569.b4-ty@b4>
Date: Tue, 09 Jun 2026 18:46:49 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JgEeY7eB+za5CqBF1RW90q81nKBWj8SL2L9Mv9jKbrE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKJxg5zFG+6P7IB/4vT8X+FMUEttZz6DrQOzy7
 mIfWZYeVRGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiicYAAKCRAk1otyXVSH
 0A+JB/0XpEMlIpNLDsdCIcFtBWHfn6P58WI/mSgrki8V4oxdSrMVrM3/f+VRflMn9DQx+/wi9sh
 hHmfYIA/Dfk0RB2iVA/CBEjgux1lA3x1raybrq0LDhsMNdMb4JtrVm9/Oi2pg6TwZkyhJwHlEbU
 nusnaJhoin5ZG4i9oyowXnyOhI3ledtJyxoWyKJDZ/TlgBETMQrTrC1roWNEyBDZEPBCZnQCMUK
 y7wUxxUjWGopDOZcNX07AOscz1f7+ToVVWWT8wy/UvLbjWIfyWBklgOd/pLzBU02JqCdNYBZNVf
 G7QXk5wZ8Q5ex0oaaTDY4dVPA1o/AspEd21dDAozyavZtsB6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 09 Jun 2026 20:10:00 +0530, Vijendar Mukunda wrote:
> ASoC: SOF: amd: honor machine_check in SoundWire machine select

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: SOF: amd: honor machine_check in SoundWire machine select
      https://git.kernel.org/broonie/sound/c/ff457653ee38

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

