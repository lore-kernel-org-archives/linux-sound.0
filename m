Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3144639B495;
	Thu, 26 Mar 2026 16:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542070; cv=none; b=AB2mUnzB4cF2owodfbH+JF6+gXHqUyCuxJMJAsStH2vnu7UI36butLlfCWoKMm3B2whP+mXd1sHdpqrqBBThYn4/p7J2rnKcl/0eTms1yYhiRZrN9TSRQvBEFiY7G6ea9h8R+w6d4zNiGofVF9YNsVax10lyLYpxWUtSxjxuzG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542070; c=relaxed/simple;
	bh=DSM1iBrML2DcniDQcgNRLpR5f3uWkjYAQM9yypDZThU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n4sHueZ4oDlo213J7AXXJKYCUVRq4dNmLC2Il3xbeqcInfNQzi5Rh/tVj/HmdtOVmG3AdW2qtHX2mX+ltPSO7kUuE0WZHV/LYNkskZudeaBnk+QGoQl4nEbJFNYCFZKahmT9PEYGIjuT7JIB+CguOS7fCgH6Bm06QIbAz0uP1FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0yoiWfa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0yoiWfa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F46C116C6;
	Thu, 26 Mar 2026 16:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774542069;
	bh=DSM1iBrML2DcniDQcgNRLpR5f3uWkjYAQM9yypDZThU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s0yoiWfaNnzR4E7iyUScwLypy9Cbz4/WK/eqcT9cEWZUyhk42vBdzJJ7vG3NFahEo
	 ZAJpAUCocl5/1YpFywPVIM9o1cGtuaOYYHHypQOVdBuSJMFWP1TyxLUiZmQ9LqJ0YD
	 VOGZ/7oYIh/uYVuF9pcUQBmR9sW/OeLMjoCocSR6ldkxInn2VyKSZY7BgreXcQQL4f
	 r06X/v/HA04Pcjqpuy83rJrAIpE4EzXocv6yLvmV87vn9fbedaPikvtkNmKWjQV4dn
	 dwU8MOx0tqicKxRsIU4bcQtLCDwSb1IzwGWGieI8sXAF/iKJkmFR2IcxkUr5ETbDGD
	 PaEy1GPUjeLTg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260325170841.1405368-1-rf@opensource.cirrus.com>
References: <20260325170841.1405368-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/2] ASoC: cs35l56: Support for factory calibration
 through ALSA controls
Message-Id: <177452045553.26630.14897560830820664950.b4-ty@b4>
Date: Thu, 26 Mar 2026 10:20:55 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DSM1iBrML2DcniDQcgNRLpR5f3uWkjYAQM9yypDZThU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxVzzM4a+MZ28gZLzxYHyQkenLjMyEKfCsj6b0
 ZY/htCR5GKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacVc8wAKCRAk1otyXVSH
 0H8eB/9xha3FuAtqXA1fngZhYu4Y9JhL13ztEM3SJ1LScjyzBrS7TrXeQES+CKzmz3mD4lXBp2t
 O2u5uf+hlXbLWov3UeeXdzdiuX61CM7pgHPA8oLCrl1A4i3lzfacUCVWTF+y5YH+qDOlLtRvgkK
 McFcrK/hKGI8FIvHrXh9PVbcD6DUBMEI+W2YM6+YGOHViF+rpRoAhR1QA9UN+n4L7lj+KnOcCW/
 QGKLg84zW55cz+ZhnHY+o+wmtm3a5J6sH4djIZoY2NWaZKUlvZDxMOdnqwwKm6WnCPp1vr8GXeE
 4ydG15oqKAgA12lPQnabPcb00QP6krHusEEUlDiETD5xhy0p
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 25 Mar 2026 17:08:39 +0000, Richard Fitzgerald wrote:
> ASoC: cs35l56: Support for factory calibration through ALSA controls
> 
> Factory calibration is normally done through debugfs files.
> Google have requested that factory calibration can be performed by
> repair shops. These repair shops only have access to the standard
> "user" kernel, which does not include debugfs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/2] ASoC: soc.h: Add SOC_SINGLE_BOOL_EXT_ACC() to allow setting access flags
      https://git.kernel.org/broonie/sound/c/37c277f050e8
[2/2] ASoC: cs35l56: Allow factory calibration through ALSA controls
      https://git.kernel.org/broonie/sound/c/ee7d655dbaf5

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

