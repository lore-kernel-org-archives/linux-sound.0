Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D87A3EFFB2;
	Tue,  9 Jun 2026 08:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994489; cv=none; b=M/HUKAQNJvMdEAIMEBfC1QOn7ZNAOXPz2EtO4Jw7aknYbitFpbC4z2vvISNp06azQsIoTpIZ+BF1MtI7HB2vb7oIumymfwDcaDOQBSHXyBvHpePeNj08+cKE4sprdoQqmLPUL8Jxfpi3iTEA4+nZ4P4GECANFUtBs/g1JUxUS9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994489; c=relaxed/simple;
	bh=qwVhfSdGHJOeeF+IQatg3Vb7isbgSuJU0n8EJdNhs1U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QMo22SbqRJC0IhVOXm9C85CDW039Zpo9q4tEzys2ViJOsZ7gwJ/z4yYNIRI4BRG0/PYqdgycVF8UKQ+NiI1u4pGnWyoYTxhjxP1+DyDVNcXs3JDIDJZcimCNS4aGkCTGEfJp5zj2YSgvz/oQqVqiachU7c+FrNqj7p/0pCLMiqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RyWaY7cD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RyWaY7cD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14BB01F00898;
	Tue,  9 Jun 2026 08:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780994486;
	bh=NTi0rdt9/fB9K0FwN8VFAmYTKhfchv/tFpXhZHF2pAo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RyWaY7cDYGXrTKVZ4qgXp2P1jtPvGcjmtq31Dxf2F/ZJSj+J+TahLTB+kotejI67h
	 LfCjvRppUe1M9zAzSUYMSin1eiU/CbNtU87BcGXD3TERxWduOaWWvcRmZ7N63l6Mpr
	 bH3TZjgDheEEvhL4dWBps58sPwUgmqczBv87K7xCEnGUvOddF0aQSc9mOIQyGitQ0Z
	 heT3DtBfQJ5QYbWeIm3jr3cLCRdwt7MQr+WvDTE/HLTKuDnpxLp8G8/bEmD8ekp9PJ
	 c2M0aYDw+ZldRRA2J2m1XEZ2OtCraH7Qu/BeJW1AKkgszrVpo7q6yHjUCEC96hsm5o
	 R2fx9jFuoKLoQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260604101244.1402862-1-rf@opensource.cirrus.com>
References: <20260604101244.1402862-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Fix NULL dereference when removing
 firmware controls
Message-Id: <178094110887.20828.6401488222927092447.b4-ty@b4>
Date: Mon, 08 Jun 2026 18:51:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qwVhfSdGHJOeeF+IQatg3Vb7isbgSuJU0n8EJdNhs1U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqJ9GzwGsmLLkKz6NnrDbHJEVH8xQ7ZhT1WVobI
 RQoGicFHnmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaifRswAKCRAk1otyXVSH
 0DtfB/4j0frhiMhbE4pqBPOZR1gE1iQCf2pv4nAXUN/Sm/seUgiM7mU6Sj9LeR6STKX1yvNuAaW
 Ibtf7gpj812RnllMpHB5BLgJPaTyPAIVBK5NrbIx//qz7P4sz/Ljsv1Qs8EyHAHnJW4b98d7r63
 aacaXgBcB/fMXz1Km6FJGcDMtMH6ZIrlm6+80gPVjtJJPF7a+l/dsu2WlTyJLjW1m8Ra7KpHKDW
 xVo5cBeFe4r+b1Qx3Ftt9vxTZtEM3diWcMoFcIq4pQX9UtUrCeFaRVkR6+e6WCurLW2pWGGlLJw
 251RbWHBdVEq+RdHYXYl195GauJ9PYGkW72UYCB+uBDfcVdi
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 04 Jun 2026 11:12:44 +0100, Richard Fitzgerald wrote:
> ASoC: wm_adsp: Fix NULL dereference when removing firmware controls

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: wm_adsp: Fix NULL dereference when removing firmware controls
      https://git.kernel.org/broonie/sound/c/7d3fb78b5503

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

