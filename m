Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298DF368D6B
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471856; cv=none; b=CO8NwoSt50BlPG7wgb4lzVXKlNWuZLykXXrvsqeHC0pzKcXPo6XQH4e++hSKN/jxVq+tylgSnAJ4ODKciFgOcRxc5NpAK+PrGPVffLLenH2kOwbZE48kalJLH3Rmu0V58MBQdbr97x3Ys7NYUoi7WjQLiS+iN7AI3H0yJHe2d4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471856; c=relaxed/simple;
	bh=GYsM0F/qhoLM30HyisxfuimH+r5udtYYzaJ55TLNH0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lN5M6wLipT0cNH2+gFn2EX0lrYQ+16jIJl+lllziEELdVgJ5PmJGi5nrPRkZZc/hk14ZgRaVpUOT2kznk4fa56EXfemg//v9jRUV5DnspH+ox61p4KB8K+V9U/ius+kp/mSBrJI7wqI1jlSLRmW+5Bt5yucktlSpYrzf9l58oAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAFzbG9R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAFzbG9R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 715681F000E9;
	Fri, 22 May 2026 17:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779471854;
	bh=4hlfEKwEl9HhYgAwuUDQ2fOc9K0g1tV8arjcs3Z/+Do=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UAFzbG9R0CZjg1a+80qWPlR5DHSGMgGC9VB/mPIEllJpmLd/Te7MhNCaRC1NDRJAK
	 zMDPHtv6JSWgqKnrijWUsXK4oz4KfKM+cI/lTerZWmZCIaR8gWf8i0mMgbwBypFInY
	 v8AWnCXFOnGTsZcO7cbvi2QmLtlxrI5dcxkZ4dRF9c6RiHC0heDV8H5CR7S/HH90oR
	 AtY9FQHDryLdHqRiAljJqpgZC4CyjfIH39KgiYlVArfGQW4Utwq3t5A+0+f//qGR87
	 EfpAYAeM0ycyiPc6jLDa/utkMwddXWLIrdVD9l+WEDT2++LMeziZGwR+Ed8KneZkCD
	 +zgY6UcqKXUyA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 seppo.ingalsuo@linux.intel.com
In-Reply-To: <20260522075659.2645-1-peter.ujfalusi@linux.intel.com>
References: <20260522075659.2645-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v3] ASoC: SOF: ipc4-topology: Enable deep buffer
 capture
Message-Id: <177944806270.6494.1680156575951151883.b4-ty@b4>
Date: Fri, 22 May 2026 12:07:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GYsM0F/qhoLM30HyisxfuimH+r5udtYYzaJ55TLNH0Q=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhiyBqW/Cn1++quQkds9/XdgW3np13eApoTVVB/SOvZr/c
 vLjz6+PdjIaszAwcjHIiimyrH2WsSo9XGLr/EfzX8EMYmUCmcLAxSkAE/n5mP2vsPDk80XFAX/f
 L13zIlrsYVOExYSVvW9qpdMNXXdNfePjuP+zpSrDivy3S3Uy7No/LHCpl/22nytJSzFv0WVJ7vm
 3eDwDmKRNfj12PyB1fYFZj+Ys17D23xM6ez+Htun4dIQLBGooN67htLia58uoZnnhEbuMUyt3df
 J7vcsfHW26lt4y+W4zw6Dn45r/y4TvyHC0Mc0I7BTjkhE8bCX9QyaGZ3qcakCpy1bbk2852hV7b
 WQrk87v19x4vjD2tJ7Z57lHmG6oTrP3zlLgXz/TcG9yANOLthdCEkXytdnVWzMr6k0dZr5+8pzf
 1fDly9khmuqq0m1M8vKL/nwP8Aj7sUruBofM7Xf98Tf6AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 22 May 2026 10:56:59 +0300, Peter Ujfalusi wrote:
> ASoC: SOF: ipc4-topology: Enable deep buffer capture

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Enable deep buffer capture
      https://git.kernel.org/broonie/sound/c/8fbcb4ab2670

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

