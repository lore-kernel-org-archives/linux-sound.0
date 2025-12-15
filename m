Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC97B2F1FE4;
	Mon, 15 Dec 2025 13:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807108; cv=none; b=BCRQ5vicGClA5Q5LnoZsOHtk6U6/jaHcLAS+WS3P1RCo8iZ9QaD9CMZy81DMxnGQc03Pr653p8vGVjtsdgqBtMCNqAJCq6tsYG0ODlSiZk2IVpmQ8pVmtGf2czF/EZsWa4mZK1FZqcOzbjZvXpDmSnR+dovkCdQP6PGS6JysWo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807108; c=relaxed/simple;
	bh=nlLNH+vGhBgKmzykSFeitePP02WUsMrJ9i5X5bV3xhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ga9O7kwkTA5N1D+tXfu01UZVJzA8zdSz8AJfe1Vl+e2dSP/UorbOIqQD5YBV0notWRFdHnTC+VnspgBT2tVYCdVPu97bN/sVWgh9tSni3UPkKatBT7djG18Vfb4wyomyBAEFxINRYuCaLPjkIeiSRaIvS0OzK1AL7WTg3EerQ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTy5n955; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTy5n955"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F82CC4CEF5;
	Mon, 15 Dec 2025 13:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807108;
	bh=nlLNH+vGhBgKmzykSFeitePP02WUsMrJ9i5X5bV3xhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rTy5n955QLZc21kzcR3XLYB6yfbzgt1u2Ft5S/kwzieoSpCGToxaCWjS1BEgzOvVi
	 fdFhfpJYVe+VuraW9wrkOR7AZ5uwQP/fryLYfDlprc4/9p4/oGwtpT+Msrpf+DaClH
	 IDH273Cs8KaxZRci5WaVLF0RPp1ZpICZc4reH4TPCJYGeCv350Sqwau5Tt2SI8TWEW
	 jCL7YzjjHnflu/eDt4DDa9msn6ciELwliPI48oSh776/uD3Zagai241pjtCW201J9n
	 ffXtE+rrquIx0uyBIwfaRvmI2z6mrix4gQVJkoxMRd+khkLQv2hiF2Q+4cHzRRYiJk
	 Gv1u092roWXoA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251202113425.413700-1-rf@opensource.cirrus.com>
References: <20251202113425.413700-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Remove __free() from
 cs_dsp_debugfs_string_read()
Message-Id: <176580710686.161056.14028894471626088064.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:26 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 02 Dec 2025 11:34:25 +0000, Richard Fitzgerald wrote:
> Don't use __free(kfree) in cs_dsp_debugfs_string_read. Instead use
> normal kfree() to cleanup.
> 
> The use of __free() can create new cleanup bugs that are difficult to spot
> because the defective code is idiomatically correct regular C. This
> function used the suspect declaration __free(kfree) = NULL;.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Remove __free() from cs_dsp_debugfs_string_read()
      commit: 7a9fa7fda93b7b3ae515f40f67bbf8e1d16337e8

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

