Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62CC48EBE8;
	Wed, 29 Jul 2026 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331959; cv=none; b=JByK0mmpb+fNhhdQ6IKiOPkkaLyJHwb3kfIXu0DkVfqHz0sr+Ovyo35rH+0Qca1gK/GHtXwMPFvy7KGwRIwZ0htnHJyrguhLRZkU3GgwHzKqz+fhWoz2x1MtAKUYxBwOf5AxlWNbATiM13Y4DON8uWqpwG19l5mAkIOcXzZ+KpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331959; c=relaxed/simple;
	bh=ehPg15UIQDMT23cMFetMe/4/mF53Xt3xEu695f0jcKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CdO8FF8i9HjaKpFpqniXBhECfR/b6KrmrnI//OcV3lTbfxE/uvJwHI7kzb1GpjbEudf6CZgtiHZYMqPk+QbWbfjYYzaa98mdVrp51C7ozRD8SsyeYHiCoaoGrKwEDeDXqohnryrByRx3HUqMzLrCxncgXehav9E62Oo6nDzC+bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4CIJSHY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4CIJSHY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209241F00A3E;
	Wed, 29 Jul 2026 13:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785331953;
	bh=Qmx7IhS3iL9ANAlxyB0d2iE+Xzr2Iuj6ZNMH64+SOcg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=N4CIJSHYi8KqFBTo9gG0J1oWI4ZIc4pu5shdzY7Sksi1ThJD9zPWbSok5ZK8YCVLD
	 52u4gDAiA9JeVBIxrDsVSFNgOryK97T1G/BXqf5HB9K+QBV0fNCZc0AS+5iUvjkqRT
	 svdDqyzsamwePjl53P9dM9v/QGFpB4f9t/RFVw5wquUbcI+cxA0dEzC5oqPwdbHIa7
	 gawCpuKcD0otobldRSmeand1GMJzn/FSIjvHGRPSz0gAvUL/RXl7NB1PZgGSSqCz3m
	 47Uapql4axZv5gPq6m97yAGCvBaCq5rL22o45JAiatairzlGpZZbOCqFGNhxTsqEZC
	 3CoUWYd45ersQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Jackie Dong <xy-jackie@139.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260727041452.16701-1-xy-jackie@139.com>
References: <20260727041452.16701-1-xy-jackie@139.com>
Subject: Re: [PATCH] ASoC: amd: acp: Add DMI quirk for Lenovo Legion 7
 15ASH11
Message-Id: <178519406424.552178.7338247755893221669.b4-ty@b4>
Date: Tue, 28 Jul 2026 00:14:24 +0100
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
 h=from:subject:message-id; bh=ehPg15UIQDMT23cMFetMe/4/mF53Xt3xEu695f0jcKo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqagDvynefrQgaY1eLKx2/FEAcI/2+Sf6roUEdl
 Vy168SwiaeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamoA7wAKCRAk1otyXVSH
 0LRcB/9OaHjJOWFpd/Mz5ukXYZT4ErWbjIONmF0h5dwTb1gynA/WDcB1DxQUc/3Yog3/6nBGTuY
 gjfZgRxlRpVnWnnjU0sqn2AWgtIUpQAPt0uyelSPiC4NdQaOghjKgY/VYJrSN2e188TD21HqU56
 KNTZaLYTNM7YU/NckC2m8N0nkQ3+X48kkfjFUsT5Ozjfxmany3IWhseIR75oqCvjILcZ7cA5qa7
 RYKRZrS6C4xykofd2QCZ/tXBO8+DdF3ISNs7sFMpjLhNJSGPbaQcvrcchSQ/Q37oYm4y/nKOcOd
 Sm9Ckhcc3Luxvqsmy35lFT4A7RYROA/j2XGexHNzPlqTo/Cy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 27 Jul 2026 12:14:51 +0800, Jackie Dong wrote:
> ASoC: amd: acp: Add DMI quirk for Lenovo Legion 7 15ASH11

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: amd: acp: Add DMI quirk for Lenovo Legion 7 15ASH11
      https://git.kernel.org/broonie/sound/c/9ad4c2331d23

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

