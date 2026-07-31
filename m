Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333BB3612CF;
	Fri, 31 Jul 2026 23:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539907; cv=none; b=kuoj+PXXl/WZ57AAfFnJMYM+Awn8cOIGmXgXHo2W/MF3i9Vq2EtNRMHbj3Q9Ql7ApkiBzGDhG1vAOE3olv2Y2OZcNGtMfK1sSUOujJg39MM+XA49s8HgXxqpdwqxdLC79GYaD0T+EL5kIIaEpZwiW+Do75xPaQWV17e5JPOhGAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539907; c=relaxed/simple;
	bh=WxcKp3uO9lWh1lfVnj7LgT/9DA9Xq2kbR05HkDQHduo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YZSFWlvP+F9XNJmdfYbGLbLEbvmp5XbjmS+M8oIjgcsOKAHyBR9kukB+Poz9/2D8sLgnhWqs+Pbt369wxhgE1iiEB2KyyZxXCGGMBRnRTkzLob2sdoplKcjfa8Xf6oXr1rDBuR2ztvgfDCXGWnzxZsHT07mir8ih5ztIizNL9ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTIENEGN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTIENEGN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8001F00AC4;
	Fri, 31 Jul 2026 23:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785539905;
	bh=2RILj0IYUJa4ReyU1U1yVJZmRq9nY72PSBjjNu2f8yA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YTIENEGNWgb7oK29WWMqexesLXRBQGu8jgMHoqB3SLiQi8TXJ3KgWsSTNnZXg7mIw
	 pCENsziD0xUA53UqvKja4KLBLmQ/AXKr9DVzHD63oNqwlFnRpTEyknRhD2QEBzGShO
	 22X029asmiblrDutkBEBv/GhNnFWxB+ohAn/OF56QXxJKYPXBf+QMl3j4tx6zF+ko0
	 bg9yS0Gtf0fcwGWBbaGuYFMzhFNvakOmzNk3GB8s66HfnBDnXq3K72wzrce4k7/gef
	 anJHwp07Nip78XUyJqz7Ap8nFvwWRhFOhHUSC8PL1Xgwv2r2GyA+tTK40pO+P84MwI
	 fiDFIhygMeazw==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260730130602.3747053-1-ckeepax@opensource.cirrus.com>
References: <20260730130602.3747053-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Add missing stub for sdca_fdl_free_state()
Message-Id: <178551584062.353541.8191460147730240670.b4-ty@b4>
Date: Fri, 31 Jul 2026 17:37:20 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WxcKp3uO9lWh1lfVnj7LgT/9DA9Xq2kbR05HkDQHduo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbS0/kIwx1Azn/OJlZK9DF0T8xMOv36yhxCwEd
 7XIul1sifeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCam0tPwAKCRAk1otyXVSH
 0MSSB/9rk8Sr0HZD91/CKwGTkvapPd7gLIq8mGpZ2z8MFhISGaGydG0MPIgc0VHaX26jrEd6Zje
 oYTYDu8c8FO3wqEb+KFr4sHuyZZZ5fqHoeFMx8NZjSe/e5aNXpjwrVXLe0OafcYS/9RMRFi/so6
 CHj7Y0Pux2GmedDEGM0p7hFrlrt318wIiYoPrxORxfqNXxa6y44pzclI0oDSUHJqZGMCzkt8QQK
 TPu517jI7T9po6/Ek+aT237jaGg6ExUQwFBo/VvQYvifWKFH+TQasE96OECvBuaOybDhuyX+k5G
 ApP4h3gK35yyau8jobg2EtGXNwiH3Uk4o+blrvztsRQNkmV1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Jul 2026 14:06:02 +0100, Charles Keepax wrote:
> ASoC: SDCA: Add missing stub for sdca_fdl_free_state()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: SDCA: Add missing stub for sdca_fdl_free_state()
      https://git.kernel.org/broonie/sound/c/f6970d8535a9

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

