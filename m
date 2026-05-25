Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C09C20FA81;
	Mon, 25 May 2026 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779712380; cv=none; b=T2dzSnf/pGHQmroa+yX5EwgPVP75GWfbRiqF4xvijv65WeYunAKEv9o8qfNEQvRDxTk8xzkhK5Fj4oOpOhJYtGPIxZRiHUPNqnTjSFVGQuFROZr/6TszYh5ah5sabc+zsiUNM1mi8N9owFsFW111CVzv7qXXLAw95nY7cThTt2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779712380; c=relaxed/simple;
	bh=Y62EjQrTI/wSasqd24Qm7vHOI5mLk5aLoaHjk20gWhs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s5F/1/1tDvNdYdWDJRXClM/yFcqc7s0AFiRSky5IaFKkB+QDxDoBoyo5yjb/r/zp+Ry11TK7SyxEuwIwbcE5i1i89j+pstG9rKN9IHP/qXDGadYb4xLV7LsCTebM/czQYLK9PIdmqdI8gYgkaqqd4Bzk397rSvIWc+Ar4S7FcA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdICNlEU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdICNlEU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F7B1F000E9;
	Mon, 25 May 2026 12:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779712378;
	bh=pcXHjhTpKtr1K6sv89ixblt4tmYGJwk9oE+oZa0GpaY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jdICNlEULNzIr3Rk/p/u+/4YhqCEH/LuU26Nyaho9Acr7ozu2uMrx8ZNlfAgckhtF
	 vYBZZb4nEBxaihsphGkX4UPGeqk6gpvHYn4kn/fSdeaDZUudGdY3rU3N+8CDYU0nY5
	 +7SBY9rorJS8Nfdl/Sw4DFP/jsUQVufREJRwz+kRkxx5wasebV+zHH7Qsqw/RqMCzj
	 x7Pz2iJVGrbVDFNXB0XkWc92wzKbOxfS+yqDMoN3W7uRTTog3y5uJaVyTTyakzNWa9
	 jLlWRjAIwloYBm1Frkraku4hXOxHmjiJh8+qQPxMc0swG5gKjfSR8FXSKWo57y2eHI
	 gb94xowLTdHVw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com
In-Reply-To: <20260522-i2s-same-blk-v4-0-a71a86faaa20@linux.spacemit.com>
References: <20260522-i2s-same-blk-v4-0-a71a86faaa20@linux.spacemit.com>
Subject: Re: [PATCH v4 0/3] ASoC: add shared BCLK rate constraint for
 cross-DAI coordination
Message-Id: <177970577309.18223.13869981116408028929.b4-ty@b4>
Date: Mon, 25 May 2026 11:42:53 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Y62EjQrTI/wSasqd24Qm7vHOI5mLk5aLoaHjk20gWhs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqFEF4pfhTzer6xrAFujII+cjOcHF5tb35E97n0
 85zunBrPBCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahRBeAAKCRAk1otyXVSH
 0O8RB/9u7miaMTfVs5fjqarX6UWjqaL4JDrbNfzhpUFwSXpRq4DkeHyuk/PqW82XZJ55hsSO5g6
 U+jQWfVrlwZ4eLuJL7F9EJxN/LfxVjgMlgJNd6Cm0Zoq5R0OnITTehRHXkCe/aj3hCtmbDexYQn
 IxRutkM7yocacbO8W3yYy7BbFkBDcM2YDgHszoivDsLMVBo+WYSW74vC/O7BzgTPy8jj27lNXsK
 MuSzf7PSK5cH5x5MLbClOgT9UyXOx6EPObnupIuf5oaYpK7Iu644wuSyFYCTz0MPTD+pbdw84+L
 q4SpwcGaRjM4UfwKnaGyev2g68X/avE5/Ls/6maiLWXcW1i3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 22 May 2026 21:33:56 +0800, Troy Mitchell wrote:
> ASoC: add shared BCLK rate constraint for cross-DAI coordination
> 
> On some SoCs (e.g. SpacemiT K3), multiple I2S controllers share the
> same physical BCLK. When one controller is already streaming, the
> others must use hw_params that result in the same BCLK rate, otherwise
> the shared clock would be reconfigured and corrupt the active stream.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: soc-dai: add shared BCLK clock for cross-DAI rate constraints
      https://git.kernel.org/broonie/sound/c/94bdfad3a665
[2/3] ASoC: soc-pcm: add DEFINE_GUARD for snd_soc_card_mutex
      https://git.kernel.org/broonie/sound/c/2555c62275a1
[3/3] ASoC: soc-pcm: constrain hw_params when DAIs share the same BCLK
      https://git.kernel.org/broonie/sound/c/c8c2ffd722a6

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

