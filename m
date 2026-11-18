Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096377;
	b=Wtq/gAUGZjEIlgxoE5eQIrpDUTA1wUjVGUw92vcx9W/oc85hRp+lmavw82VTKlUtwyJI
	 utZ5H7rG+Qg3L3iiyUc7knrsgxv9eay4cPR9PC6+zskFXP4i+2ChnXWZxZgYWLdVQpaZI
	 c2QdyFxbO8aSNtjh285Ymi5kR0zVQmBmTN3JXP706TA6XeMR3Mt3a1/by2EAiERFFnQi9
	 MUI7FyjcmzGfhtSm7hReZ2z2hs47HoperWD1ZACyC31AVQ9UdqMlyPRJqduLHdlnTKmqi
	 zUeKf+eey7kKubIhH3i88AuijUnLG4xMKt2lNcicGS82yFtq2xfpKA2RlUcOBoUN3Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096377;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tKMaRZhJS84cVoupH0cVMat32QSTexnKCZROGeeGQ6o=;
	b=z01419iw1TFCUSxczcRfZfsDxqdfxeKIoOm7Rx4+key8AFtgaFdfGcrs67j6Pq4lBe/M
	 2sgAVPMsBGobhUOPPek5VHKQ0lSmv4wJ617DQjLPRmZJFPKNnsW84ytbSBq3skpTpJM9z
	 UY+WjoSZ71DfS+3anOoVnZCmyMrIeI5MTDIcLOl/9Ow6C/LdV/U6u23ZU3A7mrAESi4CH
	 9mR0agIcgbcshdYYKkrh+wM8bl9cvVOmLUFwzPPrNWFrAQKsKUmldw571Yo4Bpz9Fta0S
	 NEZME9dWMHI0n+31Rvs5D8LB8lBTXwM6skhfBtis0C51dK4u+BwYZPkzm8cgTyHyMRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hDVc7ijL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947CB606A32F;
	Thu, 19 Nov 2026 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hDVc7ijL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49D01F000C8;
	Thu, 19 Nov 2026 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096377;
	bh=tKMaRZhJS84cVoupH0cVMat32QSTexnKCZROGeeGQ6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hDVc7ijL63NJ8PseqOohYiBj4Ew3jc6B1koyLQVpB8yKru/1s9x3sxjdhsnn8pna7
	 YRbfoEC5Jqj6C0kC06PAAQvkzN6cFqS0/9X58jB8Y8zByx1S/GZFohlmvnwDuwUl/e
	 DdKi8V0LgmLcvVDK/MUJUwjT4rIEiF8vOA1MLVqDG4IcAFgkttarq+GhAwSX2+OXBt
	 tpQrk2nFS42VugkIdazBqsDnk4whkFFOpZtRsEyGY7Q+3bOU+GLeulDmGBfa/P5cox
	 M7/ytO1hkXyw1G0skLOWBB5Cc+QYBjLIaIH/TOOy/2QtClF+U8t/Ty8/mvjy4RxIB5
	 iMBaNKEuEiwvw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Selby Mashiki <mashikiselby@gmail.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261110101026.1154-1-zhaofeng2@cmss.chinamobile.com>
References: <20261110101026.1154-1-zhaofeng2@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: qcom: qdsp6: Fix device node leaks when parsing
 "iommus" phandle
Message-Id: <179502571077.810609.427201941271650065.b4-ty@b4>
Date: Wed, 18 Nov 2026 18:15:10 +0000
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
 h=from:subject:message-id; bh=7kte9NX+Yhx17Y/UEllUXs2tJ+7WSPaA2rQS15TcrzQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+/TfjdJ9X4vl70aJTzb+OBX54JbX4xl53J3u3C9F1/
 lw7M98/6yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBE+iwY/ifnWYS9vfDgPGvI
 5vmPUj11XwY9mXO7bm3r+4CVh85KOf1jZNiXlTPnSZzAZyUmS78Cx5q3odbbD5y7c/TCB4Nrhi0
 r8zkA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 10 Nov 2026 18:10:26 +0800, zhaofeng2 wrote:
> ASoC: qcom: qdsp6: Fix device node leaks when parsing "iommus" phandle

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: qcom: qdsp6: Fix device node leaks when parsing "iommus" phandle
      https://git.kernel.org/broonie/sound/c/2b6e81a4d50a

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

