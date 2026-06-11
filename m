Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8EE3D1CA2;
	Fri, 12 Jun 2026 22:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302778; cv=none; b=ixlsfm2EDGPvqX1EYjm+FNF1EOFSh0nEPoaLsitAqQxAkzNQ+Q5ZnWBNJy6T8J5w60fUSyIq3Rs8jcTmIYEKaHjUB3G4K8A4Rc2SJO++ctTvcBmrrGkVhWYsyf8sYABRd9pifP2ydxry4OVfIK1ieoMawaJKn+oj1IggNk64Fqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302778; c=relaxed/simple;
	bh=MlA1WRFi2P9bd2sSBre6gjbvi7QpxX93zojlNhprRcw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EPNNTHs8+6OOeLKmQyQHzwoQ368qPyxAcga65KwsjGaIpx2lnTWGPmZNOrcj2zN9S6wB0NuTqwv1/qgMRWc2TYgSJMPBm2EkLodeDkuVuybd8uwGK1ee1xpr8sSn26cSDwmrKBgo2ECX/2kwReoJY9gVpCMSLrkpiGto4wmiX4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c//zKwzl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c//zKwzl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B41F1F000E9;
	Fri, 12 Jun 2026 22:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302777;
	bh=OwaJq++J/tLPUdfK8wJy8Z8qvhUSIGKyB+ARJJ830XQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=c//zKwzleKwFsvILY7M4im6HJPEeCh/CtQ2/spx4pBfZ0k7hKDNgCOPYdmBZl9Ww/
	 WAPT2g4gGRAkX13IHV7DZnMiJ6Nu5Gr3PcnWKy1K0yTSXXBOjGGiIuI8JeuCHiv186
	 34gZDdX2kztwAH8Rc/aAxXa0MJ69FjADvB7LCrhrKtYqviNnccYBSWUokZ+LT+Hsg4
	 K9mSu00YzCq/i8bDTMZKpIP58BSBBMNd7wVmCBXyk4J6ZEksYiTQR3XWuv2JM9KxmC
	 2u6vU5OxPtNNP/sEyX3wB4BlVq3XbyM+lzYQt08axOzwz7VihLJFXcEEjsUivTLNKY
	 sGLIxWGlkf7rQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260611132310.137688-1-arnd@kernel.org>
References: <20260611132310.137688-1-arnd@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: SOF: Intel: select SND_SOC_SDW_UTILS=y from
 SND_SOC_SOF_HDA_GENERIC=y
Message-Id: <178120681655.467928.12854451060605318682.b4-ty@b4>
Date: Thu, 11 Jun 2026 20:40:16 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306; i=broonie@kernel.org;
 h=from:subject:message-id; bh=MlA1WRFi2P9bd2sSBre6gjbvi7QpxX93zojlNhprRcw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIX08N5hiU6nqczdSqucnqighF+Lx/MKih4Zt
 J2ATXjEagqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyF9AAKCRAk1otyXVSH
 0HEsB/97iGmk2fJra0DFTLEI5BWUusfWk2BqVYE2vdDY4GOBNKsnF7RulsexjdhcdRPVyaTZBL5
 LyNe7wlWJw7aFNJVpMo32QMOt5TYgfP7lcJ0crdnC6iW8v4vJ3yyn8PiaMy83xlMQziWZNCXAoh
 4HaudJKyqsJwrKEEKB7qXymmLhBVKSyUy316/mKo1cdIz3myImLMg8NSgVs1ad6fy3aqEEbJtTf
 P+2g7tyID6nPwmW0VTOuZ9y9NHumqRCZfOI6ROSwNLa8sSocYfb5YO7i1SgPe83zFThnTa914Y+
 a9u7KX1NjKw3Cy7nG+aaSte8E/tSNODz75pit2w9QHeUQjbd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 11 Jun 2026 15:23:05 +0200, Arnd Bergmann wrote:
> ASoC: SOF: Intel: select SND_SOC_SDW_UTILS=y from SND_SOC_SOF_HDA_GENERIC=y

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: SOF: Intel: select SND_SOC_SDW_UTILS=y from SND_SOC_SOF_HDA_GENERIC=y
      https://git.kernel.org/broonie/sound/c/67805f57e5b1
[2/2] ASoC: SOF: Intel: hda-sdw-bpt: select SND_SOF_SOF_HDA_SDW_BPT properly
      https://git.kernel.org/broonie/sound/c/999ec4c29d73

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

