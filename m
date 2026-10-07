Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0703D4129
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 07:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443961; cv=none; b=hs2dhrLDXJmsN/5gnN8q1dmScVHYguvebWQaWFH8XOKReVPuOolV7TKZRthiTdibo6n7Gdn1hFeod5Go28cwDBwBS+KfhCWdxADzCGr0e28F5YYhG1h/cnoHrUlD7g7fj1MIz/UPyOrpSqTYXCTcB0jMoqPDzTMQRHVPF8Dik6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443961; c=relaxed/simple;
	bh=kIIyd7vb2QdAJeSTMj2juton5mEwwSPobpy1FkZvUeg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PqD5mVksJaCqN1Sl+kODBtQKzZdK4CX9of/voDvpaQcI7MOKcEfj17iqE4GiHRt+uibeDNspZ7aqMffmamB5ULmoBjZaVh8AuhP+ufNf+kuHbyPDyo7FP6T3/TiVcgvbkeozw0UJ4EeEcxzKf9jnX1lDIoF/yDpcDImWq6t490U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xziu9Zhq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xziu9Zhq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97CE1F00898;
	Thu,  8 Oct 2026 07:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791443958;
	bh=klFtsPqj7EoeWSRmTAIQCi6p+eggVgkzeeLKiZOHHSM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Xziu9Zhq/iqz9bBu4C3y0JzFl/UUANZjduLaJX7LlwFQR6fPBZ8ol2U63/cq17YDp
	 rdOLdOVkUJ4qKOaUTg9I9aqBXCeC4951G5Td/d+OgdiCyglyJGIGQ6Qi9lO2i1q9VE
	 kT7eYvdS+jkfIi8eBjLr4LgYkezgX9V3UZJckBL/e/bP4zXUjXRZBldNblKT2tRLFg
	 xrMfLy4nlV4lYM7AFpV4JWXeURNuUvCVaGM8Bcjmq0sXvUgbaUE6UJccxOinY3jRaL
	 PR87tPnaGcuhs3fgMl1CR98IyAhu3NdrTINc5/qySnrWCo8oy+ZyoXDKngG69x2P2g
	 YxiJBLiDbZOmA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20261007092524.3711965-1-shumingf@realtek.com>
References: <20261007092524.3711965-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt766: trigger JD when system reboots
Message-Id: <179138681327.2423942.10937193241863547279.b4-ty@b4>
Date: Wed, 07 Oct 2026 17:26:53 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kIIyd7vb2QdAJeSTMj2juton5mEwwSPobpy1FkZvUeg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqx0PxDS2ixaWTkUvLdJkhg1geQqKkijdZh3zn0
 Hi29hLo3geJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasdD8QAKCRAk1otyXVSH
 0KOiB/9lOQDXg1/YxuEYw8PfrJGggVAf/GfsXp7nFePl7ySEepuxgbbXSALF7m1sP22RULAuXik
 vSN9p9dhie3CVcaS2G+JXvwuaqwZaxx/PI9yu3iR2UdmgaM+7oUWFDZl73Yv8ufkUC6Kz9dZPk4
 bxzUuYZOh1U0Uv253ppjnY/eaIU8CPujXxVcTkdxUMzwyUPB8CvG8nxP44I3Dsp8n0e+j7xh6jp
 n75ETQWFr2dZsjN5Zis4zHyzxP7CdpDBCMIJ2+W5gG4S7JBydqagdBt0cZ87A+lNRQ58sOMCXBN
 2XdgcVmSwCg05PucYVDYtZcP2s75nGdVApXj5opxvszkbeMl
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 07 Oct 2026 17:25:24 +0800, shumingf@realtek.com wrote:
> ASoC: rt766: trigger JD when system reboots

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: rt766: trigger JD when system reboots
      https://git.kernel.org/broonie/sound/c/e8f30155e96a

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

