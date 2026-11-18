Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096077;
	b=IVH5IsWHRq8oMopdgZg6eCWqmHzEYuuxTpAcQSw5Q2D7+hzOfAspdLT1p+PPtQiW9n2b
	 mmXZ6737Il+JZ+2UnNLPS0Uv/KvuwVpQdhZQlheFv+TFcHAlQxfKx5f5Y692z7wEEanjT
	 OdqtNHseYhr4W0h6jrjW/l+4wg/QqrA4cSP6twe9Mset00/EQCzF1iLmlBoar/oMbWwCi
	 C8JIVIA9ftJ7AJIhpaz1yLMPuCLwn5X8O1Tp+rf9zOSgjkw2HWjPWsIJkqycmKPwcSLNO
	 coXNYsgSFlcVBTRo7sLuRPQCdl7wh52A2Y4SeklFrQWkGBl0FA7GiYFtRwf1jskPpbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096077;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=vFttwbcs8vV9g9wJrgyFCu+YpjKdNCUIj4GL2WTj6Mo=;
	b=cqvwjqyG3lV+dzGXXjcVlVSTU3KR3L9S0BUUr7q4+bStmQxBXpMZADtjr3ImXUXvQ0CL
	 pMqQjLRSDzNB4ATQb6FmEvsG5WU579JJnKyFtketm5gdlHiRTWgrVZ9oHUzeNNbnUq0y/
	 7MPyLsmsAlsPkhJiSH5TiB6rgSqoKnh5VsHhC/H1Gy3S550MKDdfDoSmZ11EE5ZmcKvic
	 5u8xMWYd6SrVVpNVeleSw1of/uPkCrg/sDKGwScqoQjWJtiPuf2KDVNvAMxYq4s+9KgQp
	 SEUx5UMhv5Tz0lF5dJLB5bU4E9E3a/LGXi/K/aSLYYjoUGPuoIH2Yp5BQwboNcOrkIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gn3y1R0x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1CC606A335;
	Thu, 19 Nov 2026 13:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gn3y1R0x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56131F000CB;
	Thu, 19 Nov 2026 13:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096077;
	bh=vFttwbcs8vV9g9wJrgyFCu+YpjKdNCUIj4GL2WTj6Mo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gn3y1R0x67+PBTtJYzApFfky1c9beH41Ptz2Y0UYkG9WQGJ5/Ra7q/S2Atloj4Efa
	 9cYlTOiE0hwWJCeVvJR2yqEbIsVC5uH9PXoraDjJnU+96EGCMtaTfRiVQgRNF9SGjw
	 F8dEoXn2h+QkYcEQNVKEOiHf6ddYoLdHXED69OfdiIRrbS9DaYeZCudkUX4VdNBoqE
	 gRCOEPbhiWB2qmjrbi9pDSSHlhLEbdWWH2gxIfCKDRYXeYvJ4SxlQcn3M3Npc8Y885
	 wZbB51RH3PeiHfjC+cMZ29Bz0dQjGndhvk3rLpW96w20Cgg0XiUUotys6oaRj6hoE9
	 x2+ifWuZdXLdw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Chen Yuxi <chenyuxi19@huawei.com>
Cc: ckeepax@opensource.cirrus.com, patches@opensource.cirrus.com, 
 sebastian.krzyszkowiak@puri.sm, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, yeweihua4@huawei.com, pulehui@huawei.com
In-Reply-To: <20261117070516.3861828-1-chenyuxi19@huawei.com>
References: <20261117070516.3861828-1-chenyuxi19@huawei.com>
Subject: Re: [PATCH] ASoC: wm8962: Fix broken headset button caused by
 wrong guard constant
Message-Id: <179500973065.349622.13060118398520117404.b4-ty@b4>
Date: Wed, 18 Nov 2026 13:48:50 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Tlt8vZLYcwJ9doUW3UL55QOBPDqLPwiqBHBvqX+zZxs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+/eOateijyILFz0ol54h75fcvPBLy1HsTSyOzi1W6O
 j+LRMXLjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEzEKonhv8eTTnb+X3maalU/
 qpmPva3ges9QEPGa58Tk6397NijuV2X4X79Bkc/tcrTWnauTDoXz3lUWnNTt9k8hXYh5W3fTtF0
 b+AE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 17 Nov 2026 07:05:16 +0000, Chen Yuxi wrote:
> ASoC: wm8962: Fix broken headset button caused by wrong guard constant

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: wm8962: Fix broken headset button caused by wrong guard constant
      https://git.kernel.org/broonie/sound/c/fd3b0fc97ea7

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

