Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5934F343892
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 12:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787132; cv=none; b=jAjmn4S5/D0gkvcZmEbideC+TvAvgkaT5BC3HsGMBtWrwuiLBwbGYcSyy/2rq2cNl8R9nRwE4JmmlZXAVZtQYjcdqOGwPLkJEpIgaz1QQx3YhHD9FlJc83+ByBYUecilDxJVj1wxbtWVvNDOGq9qoiGXUW0AR6dojj83oXIk+aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787132; c=relaxed/simple;
	bh=UqP7n2ZP+5f2qwvg7+OGyZAiLjzrYSgu+1oZEZaZdlo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oa/bp0ZoBUxyoFMrHd/WgZqE0sf7VHeQyGhZjjbFZ94faCdcYK/gi4qh0I/fPljqt7CIa0W6IL6SMuA9p36z6q9qNdvSL2cO3/QqDZl/1KcBUP0MBMLZonZVfamb77BNkwlzSI66L8dNjuHKs8gYO3PaIkOsLP96Nr6z6avr/5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzTBobSa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzTBobSa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470781F000E9;
	Thu, 18 Jun 2026 12:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781787130;
	bh=sANPKyn/GLPcKTi8c9lBrgcLE0/Nb69ov2oGddmnI2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mzTBobSaMZ+fN0obKE/WbFPYCCb3JWS8SaVT/V4FKBcdU6VuwtV3qg8Hm99Hd2+6Q
	 /trmd94giZ6y8oAjqtCT0V9DEANRQRkOWmeTQlXJXwvXGPjKg8bKm86qxvE3lIKI/x
	 l8Ibhvip73PVudwONO5DK861cLTJIo7706qaO1ooY10AAnwLoo1AcQrUEx3DMeDvxk
	 Z3hStOjvW24rXg8bcld/x0Fn2wraJAP4AuyshRi2g6XS/XiEXS9SqOXYWbM/juNg3J
	 w0a3H8lsivmacVPSjod4pfRySXxQ+F9ZyCBosZkMsIuc1T8kD7DaBq13FMGuHToAsO
	 0/zsz+UFBZxjw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 albertchen@realtek.com
In-Reply-To: <20260615091012.718168-1-shumingf@realtek.com>
References: <20260615091012.718168-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt5650: enhance spk protection function
Message-Id: <178170467694.38451.5579330121234488938.b4-ty@b4>
Date: Wed, 17 Jun 2026 14:57:56 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UqP7n2ZP+5f2qwvg7+OGyZAiLjzrYSgu+1oZEZaZdlo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqM+n45RBpVpb24bS8uWFxmbfxT1/2g0vFknUyX
 mShlV/kPhmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCajPp+AAKCRAk1otyXVSH
 0IwiB/0Wzkis32IJDT+e0aoKfl6xDa3wqNPVMm5NmFZKFsZXQG6oSfRcRCQgu+M3WwlRq2fEEHQ
 EPSjKOQbgjwBhEEL+KkZ0Pu2mKfrWv/Q8XtrD465HIEZSMnnyxR31tRpr87VJTyKM8j258n3pJA
 sJuEUbi626CnfVmKfiQ7nTfrQDceCY9KlkH0ttb5HkEwyZq6SZdTuLXFxLGPY7NV/h6boRkPS4r
 7So+JZWzAF8bnqE4mkWJPcYRiwSF/Jf/tMbatTFVo8zs4UN4G7fulbHu3sycGfUWTU9vQwLwKpk
 FmqflqKDrHK/uNwHVu8cKiaPdC8UA6pwFVd1GjnDejHjJUye
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 15 Jun 2026 17:10:12 +0800, shumingf@realtek.com wrote:
> ASoC: rt5650: enhance spk protection function

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: rt5650: enhance spk protection function
      https://git.kernel.org/broonie/sound/c/5096a1634def

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

