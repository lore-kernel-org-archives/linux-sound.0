Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5034B3F54C6;
	Thu, 11 Jun 2026 18:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201874; cv=none; b=KrpNKBQANqEUsxJZgm87nKH1iKmihEiL4u3sG5QwRytYxl2wvnluxneZgnNtX1JtPndARRNYMk7RM6jujiro/FHBZWTDaiK/8WxsJ1xkfVeMyrwUDMIJTGfuzU8Ne5XB9yVDpRcREZ8+vdNYfh6LbvvsDDR+3jRpafuo5XXPfdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201874; c=relaxed/simple;
	bh=rgwVf00TpQfQUhQS15Vic2zuxDqeOv9y5kr728SscBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iffyOhH559PWfUgGZDXDy5bUwTWG/yw+LPOp7a39pwv41cRdHvx8hmjdFXO9ilhKrbJZHVr3Tm0oXz5LrE1qTIFyaUTGtccNEfnrUkUFNiLWmKiOWlop7gOApv5eboTMqmz9rEukkQ7RTL5laUxtHdKd9mOV3OK4eWVAqHCCK9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lLEBx66n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lLEBx66n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C681F000E9;
	Thu, 11 Jun 2026 18:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781201872;
	bh=JEBvD+jUcjhlpyuC2nHrf3cJVzS689d80WxPgMSg/aY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lLEBx66nKamv4xrDHFgfZpPgpE8kM4SAbn59Sa2t90HXczVPjlz1kjyWoIHqTyjQC
	 6WONmOcthKrANd2zAEcGhXQVGdc5JCwPWT/tf8aFByg6634gkpxVtcfnztBcmyTWHu
	 zn6B2nTd8m7xuF/vvDB/1gknHlbqwUzBgZTCLsiJXfTY/oIrC1iBxu1SaMvEvdgkaF
	 MMbi36inlOEd81irp/nt8NneUEya82b1U+62Qzh/7y1kfmQU48binBCbctvnf98fLa
	 roYY0zBjkfH4sYfPEz0cnDlxPL15XapBERVJfv6Q5BoUxNRUGzJt4DbasRNFZm66X8
	 f/nZe/K6QAHMg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260611132221.1100497-1-rf@opensource.cirrus.com>
References: <20260611132221.1100497-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Fix possible uninitialized value in
 cs35l56_spi_system_reset()
Message-Id: <178118682324.447103.13736898382897275700.b4-ty@b4>
Date: Thu, 11 Jun 2026 15:07:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1178; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rgwVf00TpQfQUhQS15Vic2zuxDqeOv9y5kr728SscBY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKvvK3T+D/pAQA6weIy/RqiK1ig4gnJvHIlNIK
 4SJ/aiGW7GJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCair7ygAKCRAk1otyXVSH
 0G7pB/4/m8YG41FDziVmbadkLjFFz4hsCwxPuPEWatnGLogtypQZjvKcRCnQ5DEbVKjxx6Zl+79
 ySQa3cGMvp4vgqVbXDALrUWr4tprl9qBrItM1pweMS+Ubu4enHB/09zIEc3QtvTW8ugobCIHtCF
 eXFk9nn6T+M/H7kS6gyK33vXFno/PdFOU+PxSHDWS/98Fxr5WJfCYLwFuHna4+TLk+MhQFnpbn1
 MH0i+5tyLtNY6X5HhX3SrCdrMlAWh6nR3XekBoCzUq8sCyoPPkTPgdLqfbDS+or8PsGx8TGjXUB
 KZ4RIyEEj7qrP9O1CB9WQU9dKPpsJLsJiTtc09X1zOGJlb+C
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 11 Jun 2026 14:22:21 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Fix possible uninitialized value in cs35l56_spi_system_reset()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: cs35l56: Fix possible uninitialized value in cs35l56_spi_system_reset()
      https://git.kernel.org/broonie/sound/c/007699d278a6

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

