Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B5B367B92;
	Mon, 29 Jun 2026 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735261; cv=none; b=X5UKOqVB+4pAzutUPhlXCPXOBaGrYLK7S56gKYvdAe4cp8CYwX6DLD/QIX5vuPk4gMx4CLak4wm4YTGMUTdtE130Id7IFMlOWBZlMaCwK1/xosqYKlczYjp/UbUTP4zebw4irWHabJpDf0icgCZZo45hn6W7PKzLk5mrZOeZb+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735261; c=relaxed/simple;
	bh=j4tTC8L08dx67eEqwQjX2ZrqrjILr0i7/qz5JeYey7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u/QKgxz7PYW3aTQZ4FpwIRJNJs4yHl9+VHLgcKNQvymDHPGry6lpgqP5S3MbtW4Sope2/0fi/GGZnGEG6x+vdK9T/W9vtltvzZzfhhcjextUk1Xik6gkzk4zC/ACwriP/VYGVYGIaj3B221b9ptMi+x5e3s1DMhloJ9Otmw20WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4AAO4w/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4AAO4w/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8AA1F000E9;
	Mon, 29 Jun 2026 12:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782735259;
	bh=XeJBYikpzrcLaEXcXwsdkWiCmc3M7uiee5cBFjsu3tI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=g4AAO4w/+Eqb4KcTEar0BztPYyjNoJ196nIwKLHOlqopg+D3NMDjm8Vn46o64TLAc
	 6Lm7BosMl76Y8FmTm/4M1fnWW2osnSraK2elDO5rQXYzwwonZ7hVixUo0Iw/lgQyHH
	 ZJT9zS6fTeMgaGYOssIFv41b2W97hITp4Rh0jnEKlaq1yvGefbiF7Gbu1433w5WWYW
	 BIPedwK/aMGjOri25eB22FY7OItzDfNbU6crsenkuYbktMTSbiuy9U03+yYLO6FU8I
	 +CrV6OcS/CfrCIVPWFSUCQTR2COEdoCfR0+gtgOR1eM9S0qhkMZ60xvy//KD9qRtVm
	 vT02ZPfFqTIqg==
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com, 
 alsa-devel@alsa-project.org, shenghao-ding@ti.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, k-yi@ti.com, 
 henry.lo@ti.com, robinchen@ti.com, niranjan.hy@ti.com
In-Reply-To: <20260625102815.20043-1-baojun.xu@ti.com>
References: <20260625102815.20043-1-baojun.xu@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Update default register address to
 TAS2563
Message-Id: <178239364221.51343.11187259135012325485.b4-ty@b4>
Date: Thu, 25 Jun 2026 14:20:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=broonie@kernel.org;
 h=from:subject:message-id; bh=j4tTC8L08dx67eEqwQjX2ZrqrjILr0i7/qz5JeYey7c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQmGYqab8ptxvjnPu+xehDYkB8UiXBh1H1XAld
 FfY6OjzD8qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakJhmAAKCRAk1otyXVSH
 0JWAB/9l8M4VR0E9CAcTdXizgF8VR1T6B0jSizFsFUcuiGZuC5VdEcJiURZ0vaMm8inqMzZIINh
 Cx64xpDXLVPmNX0ELLZhRKyuDY3r/EG2OVVmnpfn8SpdchP07gsHZILUbB93/PeqHLdYMhORG+k
 Jh5uIuN5XW8aliuvYbZTFxFllA9uQ1nUmUmtt0TGNRxwn27gyS/6Choaz41YfBP3+tHGFI1EhEH
 xrBw+kaJU6nx37YKjlwAQp3BcX4BInye3p7YsuqmdzcYS/KpKFh9AsL5plg1T4fkfGt3+brg39p
 3ipQ+OOEq+ogvKy5AG/nRd1L5/DT/f0vswHC326qY6HgJChl
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 25 Jun 2026 18:28:15 +0800, Baojun Xu wrote:
> ASoC: tas2781: Update default register address to TAS2563

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tas2781: Update default register address to TAS2563
      https://git.kernel.org/broonie/sound/c/64184f07e751

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

