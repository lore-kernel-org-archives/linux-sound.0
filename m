Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7734B3CE497;
	Fri,  3 Jul 2026 11:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079857; cv=none; b=loEPmpQIP01rj9KmCa8skFz7KTgsPEOUKl+aaou3aKEReuOvslLWb+NfVePXCUVGEJqy2egeack34WoTYoQ+I4aMZeSNV1Tc6czAortXG5Qu19xKhuq3/RP3l6t5l2lY9WDe2F8ZiEz5FpXhz9z8+eisGOG3oJ+3VtBW8YO6ZaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079857; c=relaxed/simple;
	bh=Ad3AznC8y5gdvOZW6mIxAsMbNU09ix8WyumjmsG3Pys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cHpshCp/bMrNxm99IIieak0GDeyHoUS0C9nl0y3xbdzR//SdxvPizSbJTt+1Gj6y8qA9i8BzAnznSTnlSFKGHgqs0syWOC6I/dO4uxHom57ja3zJv1YeNdC6SkjGjoKeNTubmbQRWjxIuy2gY4z3shx7Id9Qv4ctXNuUXsOnx8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgzPS/R4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgzPS/R4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716301F00A3A;
	Fri,  3 Jul 2026 11:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783079856;
	bh=X1+OmlMZk/IVc9S8qstSzjPlOvyRlN77dcmmUPKXAKg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mgzPS/R4K1+vHbeCGqoVn2NFuLM36qDCPUFB+0bbhjwLSuBz5rEbhhEEII9E/5c0c
	 9zABxkArRPq13Jr0yFTjsl1xHlftVYlw973abP1liaqhBelw7zUfsGHugu2Qrjtq5p
	 u21InfhLo/2oARmzVjHmMllD4Sftyx7pdzKc5VGk+5cVojbQagob2OwKT3Ul7bWntK
	 3t/fVvxsYEJmZjxgH5orp47t0Goda8OlCur4SkD4O7tB5BYJWeRwumE4aDtl8/02/4
	 2+UakC8+SRov4zkYfuvt11qv/3FYdNJ5xsRH53eQMsUJk/qajBRfpy3qylvl3CtObY
	 iSn4U7PZZEUYw==
From: Mark Brown <broonie@kernel.org>
To: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, 
 Sen Wang <sen@ti.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260630183126.2588322-1-sen@ti.com>
References: <20260630183126.2588322-1-sen@ti.com>
Subject: Re: [PATCH 0/3] ASoC: codecs: tas675x: sound bugfixes and minor
 changes
Message-Id: <178293202205.38925.16683483749223778344.b4-ty@b4>
Date: Wed, 01 Jul 2026 19:53:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1704; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ad3AznC8y5gdvOZW6mIxAsMbNU09ix8WyumjmsG3Pys=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqR6OtJOjYk6g5bTAnvUM+GvbiSpaSaMqP64Pvy
 3zBmmSji5qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakejrQAKCRAk1otyXVSH
 0J7UB/9C73LpfHZSkp5yq5vabflXKYDvyKzcYhhwiEVxCc01sh3QZTehIoYCDNNGexkpYfQxlkH
 5yCuNgLrdLUE6x3qSk5Xd2rr20c4gTHbc3gyS1+Ll0l3wv7QNtepokPYrSkvhNXYeBkav+6t9VB
 ZQnDXrG84r52V7ExxOkc/uVdTZrHxAIDNrU1Ouczm3zBM52dAWt61RMMU2YTwoebOt2tz8uGqa0
 mh4FYlup9pR46k8+Om8kI4CfibpJax3Ya53Wq+1TmizvwDcsgy4r8vujIyoua+paTA/dVNygI7p
 eLo1xyF9faRLE/uV7MFMGiqiRHT8Y9T4TosJx66Ew8mnu7RA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 30 Jun 2026 13:31:19 -0500, Sen Wang wrote:
> ASoC: codecs: tas675x: sound bugfixes and minor changes
> 
> Few soundellaneous bug fixes after the initial merge of TAS675x driver, of
> which includes:
> 
> - Adding READ_ONCE for all concurrent read params
> - Corrected kcontrol bits for temperature range
> - Corrected conversion notes in the driver documentation
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: codecs: tas675x: use READ_ONCE for params to be used concurrently
      https://git.kernel.org/broonie/sound/c/12272cb1b23e
[2/3] ASoC: codecs: tas675x: Fix CHx temperature range register bit fields
      https://git.kernel.org/broonie/sound/c/a044f99d000d
[3/3] Documentation: sound: tas675x: Fix temperature range and impedance documentation
      https://git.kernel.org/broonie/sound/c/c34a4be8b846

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

