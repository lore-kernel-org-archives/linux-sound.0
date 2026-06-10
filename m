Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6518F3A7F61;
	Thu, 11 Jun 2026 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169834; cv=none; b=snnDDpofXVUgJ3o9TdbG0ZW9d9BW0UJqaSia4inRJFRnQtFRDlXCcXHFC13urN2XWlhTsJuHH/Y6+ZpVMp9WyzluTMBiJP7n+tyx69Xe/Ed4ugQaN/kr8tRoDvn02bgt/X9gUMYbkygNSayx83vwKJ7TR5ELSCQR+jOVuYJBB4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169834; c=relaxed/simple;
	bh=2kgvAZh5i6TjL2ymp+0nFzP+TkH9OtTdbSVY2lZ332E=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mF2fCgzwW7DnVIAUNM3Ni4mEurqR1kQhTk8YZLtOimg2Sp+VdsF3NzOVj2TnxsokshlrHf+sRyQ7mR0nI5iVLMpXSDHy9JzYqhvCm2sOr7axzO5geRy3xTxjMFtC+mjKn0ZYNYlQ1QjCCx4MfwUtC+O8AzrOKLGkKsLoqXbazgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CaQbQfZZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CaQbQfZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E0A1F00893;
	Thu, 11 Jun 2026 09:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781169833;
	bh=qGjKooHEH5juKcCEI2ltOy3NUCz/pd9xmYygSuPpJ4A=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=CaQbQfZZaTRCoak79z6icvPhIAo1VIKzWgzx4zDaSbA1WLvBpm3JP6PAc4V4ELvoT
	 9i0+9l+108KDAWEZr1/LuDzGMimm2maU6iAl8SI99Pv/hjgKH6qivsJVharpswtkSd
	 LMNeQ4gUHRm1QWwpkB1V4VSAympr3X/5pAx40LP1gYU5n8zhVctuTX3NIEPbO32Bh2
	 6edpIsjVS8ji+pM4Zr49sB18nOHe9SUBuMkNZU85IGL7CQovcVxULpo0kmA4j2367b
	 7m/Xp0x8DrzFyDEG9RpQLXOc9+zCtXm44/nkQqT/WS2GSbrW0r8TNjfLJST4jNWRRY
	 WjFuJuLlaIiVA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Li Jun <lijun01@kylinos.cn>
In-Reply-To: <20260602020132.4170127-1-lijun01@kylinos.cn>
References: <20260602020132.4170127-1-lijun01@kylinos.cn>
Subject: Re: [PATCH v3] ASoC: loongson: Fix invalid position error in
 ls_pcm_pointer
Message-Id: <178109041257.232889.2439992762294372644.b4-ty@b4>
Date: Wed, 10 Jun 2026 12:20:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2kgvAZh5i6TjL2ymp+0nFzP+TkH9OtTdbSVY2lZ332E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKn6m4wai1z8VCLvIOTJKMo2hErSGqrAFOMLss
 y3lCvd2kfSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaip+pgAKCRAk1otyXVSH
 0F+YB/9+8fvuEQzeKbOXmo8KoegVs7qIK4nwmP74eLUmY+gfapqJfhmJhasvVZvjpYpNuH0+d9M
 BEQR6lB63Pe9oOCOETMkR593/FJvTnQlyAVelH9JwBVe7Zi+BPW04npj8Q8+5fYeV7FoR2L3e29
 SrOQkwKXrE2JsKV7LSzu2QhBvxZpXk9DRPngszjFG4bh5+eqOKs95lAYoSee2c3OANNLmJGFyCZ
 KK6xhmhZPKuRX/QLfBDEgLGoXuHXB/GjzVgIX0Yk5r2UUifoExeU7sQUW8lXh7oNV2Y1190t0qT
 sck0b0APqSKlce3AjW1B8g1JfhKGdsLO+MeobjdGYG91taoD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 02 Jun 2026 10:01:32 +0800, Li Jun wrote:
> ASoC: loongson: Fix invalid position error in ls_pcm_pointer

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: loongson: Fix invalid position error in ls_pcm_pointer
      https://git.kernel.org/broonie/sound/c/3f3d5a7a065f

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

