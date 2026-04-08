Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4622475CB;
	Thu,  9 Apr 2026 13:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740765; cv=none; b=TgILq3LGtnh/g2Evi044kJ3dYAIikU3lkILalXc+lL8bk8++ohkiWToV5t6EU+Rgo5YM3BefGtH3D2rqv5qsNono07XSq500UaYpW4+o5F+sYme/LmfMMGlh2xh3Gfp/FbIdchPt5RRqdLmuqTjHfgbvgIU6GSnMLdtzYMfvjnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740765; c=relaxed/simple;
	bh=0yBGZ1Y++o+31q9yBHtCNV47csSwewZum7wmcuSASNw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ngxRRZAe6MPz4ck8hlSWeOKWiRKnNvkfPi3xjupCkrLDTRzwopfwYy8QaibpHtZ6FZOjt4yGZbEzbzOD9m2Ee6JBfpF+2qwl+HcIs/2DE9ZnLR2AnBkxpHEU7j727AE8HwPNCHOBqO4hv8hkVTuePUlpLCTclh04qDvLFzmnWkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rQ9QE4u7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQ9QE4u7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF96EC4CEF7;
	Thu,  9 Apr 2026 13:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775740765;
	bh=0yBGZ1Y++o+31q9yBHtCNV47csSwewZum7wmcuSASNw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rQ9QE4u7XS9h4OJ1fbN78xN0SGXcjGjeOuly7H189UzC9lDjDWY20KNvr1SKOjRDB
	 oyNLiPZdlEGXMAo+rZEe2pTPxDxR19DpwEMisMRV2KvEips4O01kSriKB2/gUi9jxC
	 DTKMsxPkILcUNExh48xBFAJcaAjyQyxembpuCqUXCB1GyW34xi6Qa9/ZntxalopPtO
	 tzomO3v0c9q8LRPBOncYph9bTpRXA6EWC4XT0HG1MddDYEEs1PlHYU+B9vTy7DBYWW
	 KEvnfOGYgBj/rdadZg74FCH5beZsWsaCjCCia5W/pfkwqgJ5ML+NcoA1tSmWfBEU04
	 FryPiuZcUKbRw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Cc: john.stultz@linaro.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260327092106.4233-1-chaitanya.msabnis@gmail.com>
References: <20260327092106.4233-1-chaitanya.msabnis@gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: hisilicon: Convert hi6210 I2S to
 dt-schema
Message-Id: <177567159547.101848.2508935852216681187.b4-ty@b4>
Date: Wed, 08 Apr 2026 19:06:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0yBGZ1Y++o+31q9yBHtCNV47csSwewZum7wmcuSASNw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp16daUssI6tSg7uF9pxnSweyglsRImwfflPUxM
 dTY8lHqFtSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadenWgAKCRAk1otyXVSH
 0A5PCACAEz3xQAFzoTMgyHCcIAFbDLzTm69ZYLD01lvBD2dDQ5YT6OyzRobBGBp0mQaFXkyPuF/
 42PJykUJYArJUlvGJIL6bEEP8L6+632Xxt8NZaEuh3JbC4mGON5MrDODRjFfGQjtc5AR1bVRXCm
 pAIIy6BMWCmrPFL6blzn5TCkWf1uNKBH1aud1WeDa4LeZJlu1zD7YsyTGMc8f3KUhrizsIB2AOn
 fsvESB1CtbFvt1sLdJ+R46P3Bw2VdG6PzBpUqodPsv7jvxnuOUeZ5GPCQdkkpGpynIHoh+D+MJ3
 Ii2BNuIdXuTGqyKIsLXVGG2kl8AwyMOyPALCUtuTNupVFH3e
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 27 Mar 2026 14:51:06 +0530, Chaitanya Sabnis wrote:
> ASoC: dt-bindings: hisilicon: Convert hi6210 I2S to dt-schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: dt-bindings: hisilicon: Convert hi6210 I2S to dt-schema
      https://git.kernel.org/broonie/sound/c/f4ee8a882a56

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

