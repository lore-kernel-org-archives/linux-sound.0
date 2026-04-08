Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA9A34DCEB;
	Wed,  8 Apr 2026 18:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775671538; cv=none; b=erL+ZCWyq2dMAx6bfmT4Q1KjMQRtTnOPVTZEnk+y1vg9kjMd7lxxqaSrSoOj6qY+dxv+mDLtIHxBz/xuvRbn9lS7wh2N7tM5nCYsMXQeZrZ7En0P8/g3Evps119/yXNS3cHeQJ3Qhi7lg5SWVE6HaD+ec21UbBxiwYXjJ1hygjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775671538; c=relaxed/simple;
	bh=sFWNrXDd5EW/4wWF9cIpLKrOzIyGqjoCq4ST2BgmUiM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ICSbjByle60kZZdScLcqQjuV8cvZ1sw3iswfcVvsOqXL4r3bnB5OD5IKkVx3nKlH4HHhF5x0k0GOa13DjyEwnaYDdplnXEqxZQM9d97sIU5cF0+tGTavoU/IjrtlLGVTuVAFC8XaKgdHcuyu8tn+Qw++cy8iJiRdbUVAus6bLzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Th7N6Efs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Th7N6Efs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DFEC19421;
	Wed,  8 Apr 2026 18:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775671538;
	bh=sFWNrXDd5EW/4wWF9cIpLKrOzIyGqjoCq4ST2BgmUiM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Th7N6EfsfW8c5O43GX9sfF25jW9rnqZColvhv8IKJ86Jw9Sg5QNq18+amxjtBfPMO
	 +6NOIma2UhSwH/cH2fcEWREdNw6XFZrhAKuCcWNjW4WIFk4EahY//SUKKx5TG4jD2a
	 +flpH91fFuFchSn/z0TaTt5FzvGt5yfbQmqDafO/7JE3pV2MO5gkvGvCqwYddJ12+v
	 c/RI47ZwbzhZDHEcGY6Pecj5J3Z3VzA7YrZ/z2Pl7OwdKtIMYADNqkxb4SIfC27UAg
	 xg0+l7elRCQg3Iy11NJdD/RsPoGrB/sC2IUi3jsqDT5xCstZnfiZaBSA0Q6pHfReg4
	 5LxJ/aKt0+yEw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.de, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, stable@vger.kernel.org, 
 liam.r.girdwood@intel.com
In-Reply-To: <20260408084514.24325-1-peter.ujfalusi@linux.intel.com>
References: <20260408084514.24325-1-peter.ujfalusi@linux.intel.com>
Subject: Re: (subset) [PATCH for 7.0 0/2] ALSA/SOF Intel: Enforce stricter
 period size for NVL
Message-Id: <177565055095.101848.15104185344027262548.b4-ty@b4>
Date: Wed, 08 Apr 2026 13:15:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sFWNrXDd5EW/4wWF9cIpLKrOzIyGqjoCq4ST2BgmUiM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp1pjvthVOJqFE2uvpgzfxh5h2G/ziYjsu3eGsO
 bT451mNXxiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadaY7wAKCRAk1otyXVSH
 0HR3B/9b3a4nZCYnM3/jbZdNgawsJ9b1uaWrmQEBeBRnwsAw73v2qbf6UAF/sELuXD31lVWjoRM
 Bca6FT3/RzB9Do0rH9wrmAcbpkddhphqPsMKy9XMFiZ2uu+rNquTPYSOBL2VNrYqtiu4PfmlrJK
 8OHJM/8jHXuR5F8GrENUN+TDcC6yyUisLn1d1efiXMZ+p9ehrjfsFv1A14NM5vEl1XEAvLPYw7v
 mL0+tw7jAFQ41IkFAJO5jHUvqbdGWGY0Jsdq+/k5WiKUAcstz8NB8b1k0k/hgotI8Zb4GGmA2TA
 Mhv2QVAF2NtRsmF9xC1EZFsx9rHjNc00/Gwd1VeZCGUWXCgo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 08 Apr 2026 11:45:12 +0300, Peter Ujfalusi wrote:
> ALSA/SOF Intel: Enforce stricter period size for NVL
> 
> Hi,
> 
> NVL and NVL-S (ACE4) needs to use stricter period size constraint to
> meet the address alignment for each BDLE buffer (start of each period in
> the continuous ALSA buffer) set in the HDA specification.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[2/2] ASoC: SOF: Intel: hda: modify period size constraints for ACE4
      https://git.kernel.org/broonie/sound/c/0f7186605726

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

