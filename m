Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025F7317709;
	Thu, 27 Nov 2025 21:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764280338; cv=none; b=GDD3Yn+wlYYdgrr4EdKo/AmLFqK0NtE3gN9pzcBy32eLdUqLjRlHLLzk/TIu88qqDR0QR5n/UePbkDr47IanKjeec+Fjc1Gyszi70fljI4QtysiNUdfTfPJI3zIFrrnJ10m3XlZTHAQCzMCtxQpxbdR+uKve/zw+WvpfEm9/LxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764280338; c=relaxed/simple;
	bh=NER421Vxonzpf7HlJ9xW93VtTkBa3+AeOON0vx+MWZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oVET4ILAfjlcpUMYBWfOTOntEKp2fG1GZo/I4B+bQaUD06JBJG4l68rRYfqmrj4XLpfMR0Ti2KpSS15z/gG4+iHpL79Sw8MtINaGJ940lWRCuDvhcMvp4ZcUJiltMApyNe5fRoD+Hi6YuA1SKZkYtUoZ7LCFVfuPqeM9xuf02xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pyd6hgnL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pyd6hgnL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A630EC113D0;
	Thu, 27 Nov 2025 21:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764280337;
	bh=NER421Vxonzpf7HlJ9xW93VtTkBa3+AeOON0vx+MWZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pyd6hgnLjtiG846tK8IeDXM+8xv/ENchdHM03KNxMwfVli8JrO1024iDXqx4VPvYi
	 2/8qzfS/MtY+1Qj4AjGuhXZZaogxcNDS+qyFzGQPBabbTcOINmlLgZSnTUrB3y3ynT
	 PCShVrWprpAAKDaBCQ9VQRXfurGW8oMakWyfhkydf1KWkwx+gboF0oZBBXr3weq29C
	 icHbLEujzWTq7sClWDQ0Ki/oOfe2lS1FlKzbgGLSaoZ0t/3nQKtsFwBmt1ltXHrxnr
	 h+KsKpY8OP33PkkHL+IZGm/cnYhSuLhBZ0st5lOsUybXAY17zPC+VepYaFfvR8x2fu
	 NH/K90g8wFpWg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251127155817.1374079-1-rf@opensource.cirrus.com>
References: <20251127155817.1374079-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs-amp-lib: Use __free(kfree) instead of manual
 freeing
Message-Id: <176428033642.177680.14903704868785405932.b4-ty@kernel.org>
Date: Thu, 27 Nov 2025 21:52:16 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Thu, 27 Nov 2025 15:58:17 +0000, Richard Fitzgerald wrote:
> Use the __free(kfree) cleanup to replace instances of manually
> calling kfree(). Also make some code path simplifications that this
> allows.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs-amp-lib: Use __free(kfree) instead of manual freeing
      commit: 6797540c8b76dd847466b9a8d6e635e6a2ac95d3

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

