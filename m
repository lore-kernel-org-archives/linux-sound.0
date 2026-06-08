Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FCA3EFD2E;
	Tue,  9 Jun 2026 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994466; cv=none; b=hhcIVz3zT7JjesdbMf7N2z+2aT0QioLCeoKiC1qzYD5cOQDMgDKhReItVCOxTORg46OP3ZU3aMPAYfCu5b82Nuup/Of3AZDIA3sgmASaUhXMKBuBfARZMw1RW9PRxXhEbV3McE2riwSkx5qLm0cJ0gdKyKwNHa7aZW2J9WmISPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994466; c=relaxed/simple;
	bh=Vuk+aOxZ3u67fiioxMXlLoJxo5QL70Nwm6YvEB9YWHA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CVebK5DMGnc2sy686R6wctVvnnJE+9HNOvwQ/LuF2Y1pzlSEjirDqjscdnIquP9cAHyFCaWYb6NZRANHBt/WD9Uu09MoOXv1CXv5tYR0k2/04r3pQeYCGDJjuafBKRpLLWdpmQyRnGMA/QqiM6zWxpHzfP/2XhSLnC/XLQ6YKnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiqqXMbB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiqqXMbB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8273C1F00899;
	Tue,  9 Jun 2026 08:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780994463;
	bh=b/ZwRkBZLUcf5Om7z698+hid/wy7wHik0lUm2+HJfJ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BiqqXMbBR8UuRC3UtKLneqYuEz+X2vMpPsAhOli8yYQm7KSeiQjls5pmCqyM7gZvW
	 PJgcbNDysLoP0omMR9UqkM1WWFuzTu8W8t/HWhaJnSIln998Z/izbx9VUJ9YAOhXVv
	 FOA/3L+E632hPk6JF+nlmgd5jAPLhh7oh+f/7KeYIFCwUFurfSHLB9PLLFNFa4Gfs+
	 oakvCJY2NEKax1IEEnxmwzxAh98lqDBkmoN8GdaKzYQaw6EgUaIovJlkl3bI5vqVkS
	 FmFcCp31QgnU9RWJ/L7+/rFo+XaD8z5dpM89wvvPVlgeoMIj2Sc6yGVbGiuF0NoSHc
	 2MUrY+A+SNQYQ==
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260529103019.15233-1-phucduc.bui@gmail.com>
References: <20260529103019.15233-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2] ASoC: sprd: sprd-mcdt: Use guard() for mutex & spin
 locks
Message-Id: <178094178521.20828.740225031025764879.b4-ty@b4>
Date: Mon, 08 Jun 2026 19:03:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Vuk+aOxZ3u67fiioxMXlLoJxo5QL70Nwm6YvEB9YWHA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqJ9GcUOPTfpZs2BRK7egkqs8ipr1DPP8heSFkO
 a3O/Lnh1E+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaifRnAAKCRAk1otyXVSH
 0DpwB/94w324YgmC5gfhHNB4d6ZzqNPMhNUwDtP6SUg/gC+h1a99V6QrNFCg4HUw3dYGOv9ySfs
 cmxj32XsSvBnJSTivj4Q1DXFT4YJOn/28gjH9R3jd/K01S+zsRugBURjF7iOU79HKw8WQTIfInC
 Oqb0c89FiCTWKwDCEbLwhhn3FBiQLcS2A857UOkH+/9y2zgUAMu/kaYt96TpWhNFSB4gdJEQOlD
 aXxMOLiKJukNvGBtlC2yOho1yfGwWTFmboP/RnT2PL7WkaYO6wsCMRSu2Xijl5S3b2AD+FFoTWA
 2TDEImvSNB8+GZ2mTRG3GUxjqSMBS7fLVQtVV73oD4QcqlmV
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 29 May 2026 17:30:19 +0700, phucduc.bui@gmail.com wrote:
> ASoC: sprd: sprd-mcdt: Use guard() for mutex & spin locks

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: sprd: sprd-mcdt: Use guard() for mutex & spin locks
      https://git.kernel.org/broonie/sound/c/53ee186bb4e3

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

