Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A9878F3A;
	Tue, 24 Mar 2026 00:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311116; cv=none; b=Ulgo3NIABlyw80mVp+rjlNEmcBca1TtHf5fr6NlzeDkO5KeP3UUtBACd7Iq0Ahj2PmVhHQgmaH6IFSQb25ZnybyNFRUKMaA/4MSXasIhQ2Per6rwNQNC8c2ZVHoxI8/sGwduEatig33dKUhLxoByCBfQR6L9oMALFWorSSb7wsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311116; c=relaxed/simple;
	bh=6vLX4LJ+VmgHgj9pBZu3srwBCXdI1SDcPLVVTIr/JGo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VaBpSmkiXTll/DUEimrJEPC2D+aC4JlgPThFkJmZJPMZx1mXv8aHGWA2HqIUTw8GMLdtRc+alZCecllu6UvL2x3VSXSNvsRvlsbdOb8RU5Nsfj9lzcBxSjMTfUhGxNR4fSW8FvhrMh8u+lN3vanckbcveaALOFzGF6zfUt9KMLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XumKEne3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XumKEne3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC75C2BCB0;
	Tue, 24 Mar 2026 00:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311116;
	bh=6vLX4LJ+VmgHgj9pBZu3srwBCXdI1SDcPLVVTIr/JGo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XumKEne3En0oWE6YbkXguuYujfMRnvNdW1IcE/S5kacUUg4A3y1YiJv1K1FKpUUDT
	 mgjRugNXztiDASVIwlT5E1E2CHhC5DgUCnfYZ1i57XpLsnwDDUPLmoDaVg2wkca4lk
	 Gufo/IyNl2e4344ffOGSZeum92gehgT6eaGRuE+nevjAIr0iV4o4F2OdAVg9DAGS0N
	 FLzuIG8BtcDtVbFbntv3W+SM8DXv/uBej6bPRRphgx74u3pVx/zKjDMzGCcEV+IusE
	 lt0XpiFMJeJ+5EoBUbl2vgeyrmM5d3gaPoYgZRuP8bzfCyflNwb2aT0H1EAfg3pUP6
	 lYrawsI1qt96A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 ChiYuan Huang <cy_huang@richtek.com>, Zhang Yi <zhangyi@everest-semi.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260320151752.3439218-1-arnd@kernel.org>
References: <20260320151752.3439218-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: wm_adsp: select CONFIG_SND_SOC_WM_ADSP from all
 users
Message-Id: <177427663217.71519.11780846451347962857.b4-ty@b4>
Date: Mon, 23 Mar 2026 14:37:12 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6vLX4LJ+VmgHgj9pBZu3srwBCXdI1SDcPLVVTIr/JGo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwdbJ2dlKoTJI7Gmu9EW9hj/21OnUQMxJuY9E3
 K1GPjK4CF2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacHWyQAKCRAk1otyXVSH
 0HABB/9ZxNomhOGED4A/wHzilK1OgxzUwWymzTVrGxIQqad4XoExA2HgN2t0fpYG/t8QI2Tw8SD
 uJNT7SWM+Qe7LGp1iXgM0HqE2d/T7s3WraWZgg/EFLupwPoHq/gmgwt2wKk597R8VvO3NqyZ78e
 6ewJhoqd3Wo9aXVeYKeJkfvc2qNj1Pz+FjIB9rqLT42IWZPDudP2KUiEH5CRKbAHd3fa2SHTp4H
 tuGsjBmsx0Kd9aeJm2j5iKOEhwx69XGzXmRbCFKyubgB4Btjn1Ukbj5bPiwE1NH4EkG2Nj4zNeI
 WUedwUMrwXtGUKCWIqnvhNMRBPhV909vV4BUcHIJdKzVrNI9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 20 Mar 2026 16:17:31 +0100, Arnd Bergmann wrote:
> ASoC: wm_adsp: select CONFIG_SND_SOC_WM_ADSP from all users

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: wm_adsp: select CONFIG_SND_SOC_WM_ADSP from all users
      https://git.kernel.org/broonie/sound/c/e3f1ce073a0d

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

