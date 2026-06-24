Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9CD2857C7;
	Wed, 24 Jun 2026 15:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782315224; cv=none; b=GPayT7IJW78nmcJsL1csfsgDLhItfEwebczIsmdVQyVCBxPOP1CrI8TeUUhs+cYJ4+xACtgAJF9Wn04nl1fxnoaavUipXgzVyKqA8jdamRsijI/6FhZrwtRF5LCRtOrC07FngfgTLVkZec32Mh1IMu1wzEW4P9th4sGqyrU98NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782315224; c=relaxed/simple;
	bh=MWTteunIgf61PEM5zYqeysLJoleL5w1wq/UuySV1q6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Qpyqgt61t2NV4TPz4iZ81DscQY3mKiwdaT+9U0YhAh0O1J988vw4fo9mVP5l93QiTdqZ8MYd6cKv8kBVB5poFNd8ygjcjGok8YVZjgXfF+q/rz9muxU3jkNPj83EMt2kCoSPVcYw3LkLM26dIN0mTqGtNk52s40EL1DAMvTabvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKMsc9Rv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKMsc9Rv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDCE1F000E9;
	Wed, 24 Jun 2026 15:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782315223;
	bh=YE/k0PlEcB4mq7YnKC06ah0oBgwdvj04UmuEyggmhag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XKMsc9RvNXUlUIuRWcKHp6U6BNR1m1DfDZtdQQLmvK+eCG/irEkzLHq+uTta7ZdVL
	 ugrCgelyiav83XytfStGIoB7fdS6Ksf8NZYJGdma9+HVSGHVEVE352Y64dGvAUBgWU
	 hF5U7gxx3HfYimigVH8/9ORNaa7RIQSCZwfcRMygE3x727rZX06/aQN6PNfFS+DT5X
	 9IkiG+bvl53AcFP7VL68oDtds72a9bEcSNTRJ2ZBai+cXiqr2e22Pw0hWbHm88KhAh
	 f5+x3SU6IhX/pgJGo5WWeaANzDhzE/L92A8Y7wx8xBCUPnZehHgO/aRi2PUFicpzVp
	 teivyDp2HImmA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, m.szyprowski@samsung.com, mripard@kernel.org, 
 dave.stevenson@raspberrypi.com, linux-rpi-kernel@lists.infradead.org, 
 florian.fainelli@broadcom.com
In-Reply-To: <20260623135821.4125543-1-rf@opensource.cirrus.com>
References: <20260623135821.4125543-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: soc-core: Don't fail if device_link could not be
 created
Message-Id: <178230251374.43395.762764299609131194.b4-ty@b4>
Date: Wed, 24 Jun 2026 13:01:53 +0100
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
 h=from:subject:message-id; bh=MWTteunIgf61PEM5zYqeysLJoleL5w1wq/UuySV1q6o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqO/jUiqO8rr6cxa/GFOPUokIz0EwBHcP3lwzaE
 ralENp61aGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCajv41AAKCRAk1otyXVSH
 0IKYB/9imh27VDevm0YDX2dNMeDJq1LjpzYUgtUOQpqOuyiK8xz/faBBjYkratVLNKPASZBZKbQ
 va3ChiwYSw7uTBBe8SMosv+MuQpO57YDvSp1cv/MZp8NMMOOYsWpX80mWrJnCQb8EwSxPByFe0o
 McO8H9wim3nydsxST2201ZoEQsnfYaYBrnr6zEG0c0BELmxeO5c+A33eubn9lI2nF9aI8KdzTlo
 ePB+Krd/sdKIpcGW9oKyB48l0wBMZTJ561j8+FKMFVnICnvDoSTEPAwxFQ11XbXoYmyIErMjjD9
 a/xW26m5ZLtwREf1uMv18Axmv56yDuUM3Fixw6aY1cncWI8s
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 23 Jun 2026 14:58:21 +0100, Richard Fitzgerald wrote:
> ASoC: soc-core: Don't fail if device_link could not be created

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: soc-core: Don't fail if device_link could not be created
      https://git.kernel.org/broonie/sound/c/a7ea04d1ad39

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

