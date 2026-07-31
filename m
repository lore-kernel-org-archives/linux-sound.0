Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513B5273D77
	for <linux-sound@vger.kernel.org>; Sat,  1 Aug 2026 01:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785546051; cv=none; b=KzdvPbwbOBUn4Vbav3JIoh1I+6poH8c5IgH6Zmg3rnYYb8gPsZLdzc/aWvZkN7Ra2c4sfSzlqkt3JsYO4Q1DpdVz6APfMCXwxzHHVtAuICigE/sGzz+2tN0bSdMGoJXSFW33KTSDP1qI5QGKeJm2q47lfyOzu6zVqh7qTPmj8hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785546051; c=relaxed/simple;
	bh=0FHUDcW6kQTMBwKKJKX+B1Is1hJysstc/01lJAOEsc0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RvS1wOA2v6TjT8rS+auERNzmT/x318iTfqnsT8OnerOwniekXLWL54x8/ToIC6mMJWzUPGnw9t+LcHXiWjvmZZkjhl7rbU6QulHauA4+ZO1avyAGhZlWnbYrlRfqAuGbEMogj/eaItAKoLub1pzeS4YdbDZAkiT5Xuh3f75Gj8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pc18/plG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pc18/plG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EE11F00AC4;
	Sat,  1 Aug 2026 01:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785546049;
	bh=/QR4RvByLRMrq8eAD283GaDQk0vlVU1LLuGnCDgJDXY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Pc18/plGENyuVuiCpWTDsRPcBgqe+82R21k+qmBoVLVanm+6NMXwILlfWt4uQjNh8
	 7KDnqFJp7Q1P4R/mDt4QCGY2TDbdCCvDZawTVSL7a6gFMz1ozimR7mNnnKy+9Nj68R
	 z6RrYzI2bPM+iQOZWR8eoHMiQja2KRUsEHxvy95eBRWMJ2jUNe2i7UDH+NTzoxs55T
	 7CVOTbnSaREwoO+YIsPcL/yRQUtClyyZDQTwr1tMYmPh8hSEkAh+vUMYrb6ek1RMu5
	 68Hy21IxE4PLCd2VtC8gzQFL9QAEcaqEauLgmD5PhmJ0sdDH75tLcmZtRpBTUd/IJf
	 bwIIW+jno3PFQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 yuhsuan@google.com
In-Reply-To: <20260730130445.8277-1-peter.ujfalusi@linux.intel.com>
References: <20260730130445.8277-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Use high-priority workqueue for PCM period
 elapsed
Message-Id: <178553651409.353541.5611966793384019572.b4-ty@b4>
Date: Fri, 31 Jul 2026 23:21:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0FHUDcW6kQTMBwKKJKX+B1Is1hJysstc/01lJAOEsc0=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBqbUU+sdhm8AzENbBwaV1O71pIzWSriVHIEAVJN
 d3nsHyWvVaJATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCam1FPgAKCRAk1otyXVSH
 0P+xB/jYVqjgbQuJqFMCh+YFWwpLXvVj82DAQL0BX9G1eSsdeoy8SdavFK1dPWLdH6HGb54JRR6
 NrhdKXXdwQ4cGo2f051lUSwQqqH2LERcebYLonbfev72FpJoU/+R8gx0QuVVOHwe5WgXYiKt2To
 EF8ooJ7oMaFrt6K3cKyxOS+2qkYxim2eh80RmKAPAOuZWJYienvHIZOVddTQghFoTmmzwPdFFOD
 LAQ34YFZvZY16MgLhGe+P7AXXnwJvPA7QZPaGNYW9Xzs4nOij7h0Og1aVu/9TpYMnq36pvmq50t
 DinXcWWQCpTgmfofMOLGO89OuatUSg3xfu77rxhYZ5GiY2c=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Jul 2026 16:04:45 +0300, Peter Ujfalusi wrote:
> ASoC: SOF: Use high-priority workqueue for PCM period elapsed

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: SOF: Use high-priority workqueue for PCM period elapsed
      https://git.kernel.org/broonie/sound/c/ea1224da5d61

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

