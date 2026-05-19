Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA9F3DCDAA;
	Fri, 22 May 2026 10:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445355; cv=none; b=fBjBI9QTD8d/BgOtnNSplTtHSZOTxkKD+OeXVIBLgfFa66f/7BwTc/R++myc/KYLLnrBoLavndAnOvznS/1J+dZdtaPJNzwWnFj6gGsMzhJRJ4y9nP5oHgT6ongXgqR1RUsxgFTEsqna5UbOiw3vUa90I1meUlvTg3jOqfcnVdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445355; c=relaxed/simple;
	bh=2GaXRtOY7FZ6ZqZsVgo8+Z5yk75ps1TTX+Sse9+bkps=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DalwBBJSEXXcd0qdIJngTG75HTvs69/uqXfmkutQLmsLy7ddsJ5rXclRpYHSTjLmT1liUR7MrOYnuU2mnonrYc0xwiAq/kTSiO3ZU+y+45Egk2heMSWjGNCfFy/zWUEsoPB5ZZmbz6EMDENWn2hHri/ETxhNS2OhLlGCFi8w9bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXti7G2K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXti7G2K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1919A1F000E9;
	Fri, 22 May 2026 10:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445354;
	bh=nisFIKF+tUtu++YSJ7NWbE+f+sXcw391IfeR0su27Dc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XXti7G2KrktT61C44A2OiA3AqQSrOtaZGGiniavU67RwQYq5wKtOAkRMmgIMNDtHK
	 mGZeFP/ZDsPuVyNk3iyFyfJHjKXFBSgRjSpIjGszZHwMESGNNQPwU5UUt0xGCNP3tn
	 4YQeISQ+ERkfhsfbq4NztCcs/6disJhF6yoBqBi0pigpzq4dtx2wyr7rrjoOHp8COA
	 QbhjuRb10XfOXMqfYIUzvz4kB/3uqml1txpx4DXcD2RXy5B1R9Rzx+uDFR0S7oDF2N
	 qhn2h9/N5l5MsVjFzacIe646MlPJHLiHw/+CNvEvZEnrV2V+rRyjl6M8CZ42pteb81
	 rZK/MrUDwxqQA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, 
 me@brighamcampbell.com
In-Reply-To: <20260519054024.274741-1-robertusdchris@gmail.com>
References: <20260519054024.274741-1-robertusdchris@gmail.com>
Subject: Re: [PATCH] ASoC: soc-utils: Add missing va_end in snd_soc_ret()
Message-Id: <177920265231.6167.2169891389929995926.b4-ty@b4>
Date: Tue, 19 May 2026 15:57:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2GaXRtOY7FZ6ZqZsVgo8+Z5yk75ps1TTX+Sse9+bkps=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC5oWaBoC5/fg26tGV/4zFKTgqoOQMUpKbwc2
 zLqvA3ieKiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuaAAKCRAk1otyXVSH
 0J0LB/wO0p/bRbI2Ju0VAIZRliuu5OB1mwYCmntYs2NNdjBzxBvWIYENfYqGTE2/2D7Lp2I4aIK
 BKqvFduR4cHbO0yqxkIsmWEteMDpBbZPfXWIzmbS/okVN7ZoygK+16bJsVPYnTwVCtNYrPH8yei
 r5vD+D5WxsGKilRXnqKEyUxT7PP3bHfngPfszSGM4YPCDXpH1yD1QznQHNgd8xcaB+KzdRFjaYA
 H10/yfXJ7VNlFfglcrLOewgjYzbSJAauhhcPk3nvvjoXkaQUDJO5qYRRLO1K9hhUxJ/NMrTEWYc
 cq0Ol7FjsSZBvE8XiZETFbQ87ZEMl9gtupXG48JZgG1uFFTU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 19 May 2026 12:40:24 +0700, Robertus Diawan Chris wrote:
> ASoC: soc-utils: Add missing va_end in snd_soc_ret()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: soc-utils: Add missing va_end in snd_soc_ret()
      https://git.kernel.org/broonie/sound/c/298a43b54432

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

