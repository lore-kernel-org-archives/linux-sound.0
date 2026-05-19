Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BD53D3CEB;
	Fri, 22 May 2026 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445340; cv=none; b=jjRo1rs7bvbcX/hFE4rTTnv8Th4Ot+oO2xRaIMXy3RBd8f6t75LPJHIv9I8c9oOXCTDR4TMJf8hEQzxW/hXjlfIPPoMSDDR1lsxazYvfqPsa3Vj0n2oCGnhB4/QRCBHBsGmWBayiedf6JiOfUr+DKdv9pZMCXxx+q8ttkxFWiKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445340; c=relaxed/simple;
	bh=q4oMhFi2f1iwKox9KA0fHI6u2Tdo3wDFVaevZGmLcOU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SgvUH3RHZ3tcAOdSCV76vAo2pdaOHemw/DBzXLa6lhVL5lEpp35DMc4kGXMtqqbQsIt9ljqBkrjAyDc659XYwuWGCXzgffEPHm+X7O0aJphun1YP7l35XT86t/dShksu0ZELF+6y+RMa435OBzulnec/5bL3/Zg/PgXqlO0b9pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XaiLPrb7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XaiLPrb7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F451F000E9;
	Fri, 22 May 2026 10:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445339;
	bh=BSoOuon4PTOnmxQJbEoLSJdXCBkP5uPG6+8udELf4vo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XaiLPrb7nCU2Xi0p8ieDXGtypc7BvlbwN0fm0hMQjtq8UUP5XwtSyFZIPqV6w3xIB
	 B31bC6+9yWqz/E09EaSmi1BWWx8pQokzVCTqvde91rilXvPjufRSo5G5tp61zJnZ3h
	 16rUrY6OoMgEkAebze0sjBMxwM3ANsoFMEHK/tcVEko+KKw868q4CdKApEVjjddVFK
	 /Q5fSZ818dJnJsycpx0RBgECg/78/PpXtT4HpUa91/VZ2DAWZmQ8RJAcwfiszN2AFi
	 9hT/k62B/jOJutorutoUT+ZJoeIj710KAPP42csrfrcA7eG4Q4+TFD47VKgPPt/NCI
	 NgEgiLlmIRmgA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260519135435.479949-1-rf@opensource.cirrus.com>
References: <20260519135435.479949-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v3 0/3] ASoC: cs35l56: Replace open-coded SoundWire
 regmap with generic regmap-sdw
Message-Id: <177919920157.6167.5399085321373142517.b4-ty@b4>
Date: Tue, 19 May 2026 15:00:01 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686; i=broonie@kernel.org;
 h=from:subject:message-id; bh=q4oMhFi2f1iwKox9KA0fHI6u2Tdo3wDFVaevZGmLcOU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC5ZYu1sDSvu5kF08HQlqeFORF39u+Aqa8Lzd
 9oKC6ut+GWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuWQAKCRAk1otyXVSH
 0EU9B/0fvPcfCV7hbLTrcx7rkV+jkrIQANopfRa3JNafY/K8REO80CzkYbOzCE+AUaD97wfRYq9
 Pa4m9svXFSjw9dpwSOL9AMM+pSi+9NhOedamgfjHrr43DIK7U3lmmOsrQzEJ/JE9zKt+ZhLWDls
 k8aT419s6nDOjZ2gCcH8ZEinNHOZdCWv+tfWA0v7emiYRHAldW+cRB+vIfVzmpcVaEPP40ek/MA
 R0Ojh3R9hhNP1QPD552XDI9FFMZ0zkODEUI8VAUgLtVJOv9H3s7OZRhqGO0EY3YDNJiaLxnvHLU
 tu1S2jnu/F9Ft3KxSXxna5dOsA+EZpUNYqGC7A91oJFuGoTH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 19 May 2026 14:54:32 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Replace open-coded SoundWire regmap with generic regmap-sdw
> 
> This series replaces the entirely custom SoundWire regmap with the generic
> regmap-sdw. The reasons for doing this are:
> 
> - Avoid code duplication
> - Avoid effort of keeping custom implementation up-to-date
> - Prepare for supporting BRA
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: cs35l56-shared-test: Subtract reg_base offset in dummy regmap
      https://git.kernel.org/broonie/sound/c/a6f7c21accb5
[2/3] ASoC: cs35l56: Use reg_base to offset addresses on SoundWire
      https://git.kernel.org/broonie/sound/c/7f9ae6d20525
[3/3] ASoC: cs35l56: Use standard SoundWire regmap implementation
      https://git.kernel.org/broonie/sound/c/eb65b5ad9324

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

