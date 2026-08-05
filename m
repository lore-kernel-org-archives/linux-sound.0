Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C15361970
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 14:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939416; cv=none; b=LIwX0Ol02dkYC5zlvKNhrbUzhZtsD1dAfh/q+VTlLNl2YvlCwrEEolN5e6YBDYdeY/rvPKGYHX3bx5sttbmyMby/vJOAi6APp8yC9wLN5haZqdj4ppnXBx8zVlbDP1Yw8fmYN8siMCmPpnzL2MIY2QLjpSvlMyF/0WuopAD+nMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939416; c=relaxed/simple;
	bh=kcV6jPewegMif4twk1SLt/L8+AhfJpyDIQlFkgXxNfE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gUxLNzKkjXVyZRYtdkEmBoRwfdK7fEA4AAjFNG15OA7OBuAC7+u3A0o8yj9gUwcPDhIa5uJvQBoLoFq+fUwXkm8grgl/v9iXYv/aGTeGGH3gzm6t2xqvApmTNZkVOmRbJ44yCm4vOEV5ylQ5qnkIxPO2X+ezscDKQQXVZ4HwQaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYfdLWiV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYfdLWiV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B911F000E9;
	Wed,  5 Aug 2026 14:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785939413;
	bh=CslVSymHET2F6bVvQgs5sOqmbPxrOJ52Rmz/Fif8VdI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dYfdLWiVUh+iU9RbC3ybWWyZmZ3QeGbur9yXQWP484ORbjHM+VaBOJgcdgwYE6Oya
	 N3goa69x+hQX79YEht+wuaF/PaWS1lXPXa411mCyzQiSoTrLPd+eFmjkxfyYDlVxjq
	 mzXR4R6Eio13VnDG6OIQBYVANHrm/v1smbM94uhTgmF1hxvsFLkwNri6a5XDIJKg1A
	 /tFCZehD4IcKs34gXP8cElovvNd6ek3JPHa2yNLRj7LHyUTHcDkVZiujVZJth9yg6A
	 0gd8yAHN+Dq+ZXtSEWTTwcIjJmmW6obxaxSvteBWcKEqwavCQWUXfxSgCxSu+goTMj
	 pBJjmQnYxF6AQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260805064435.429654-1-cezary.rojewski@intel.com>
References: <20260805064435.429654-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: Intel: Remove obsolete UAPI headers
Message-Id: <178593004188.199927.2607174785025136857.b4-ty@b4>
Date: Wed, 05 Aug 2026 12:40:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kcV6jPewegMif4twk1SLt/L8+AhfJpyDIQlFkgXxNfE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqc0XTOLZp5hhlZD71W13tZs/kfNpZ13i0J5qSF
 pDC+PnlkkOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanNF0wAKCRAk1otyXVSH
 0LaxB/4yJakoQq3lOTmZ8FLbMOUPMEay77/7iL1ih3yvass557jYdt6btv1DYUzB+Mcwr92GCnt
 izigCgn0PVv05DnahcFfvl0EvcltIn7vVYY+Q9St8iqnaqhq/pl43yiOewuo4t8eDeMkpRx9eh3
 aae5i9o9CjN2lj6jFqRS7gISBh4lgCRCOseMX//TJxLop5TnkMNaGcu10wbP1+1FU6SgvBx9oZy
 /wLra8GLnXDPMjS6QYohcnwDCXWOX+gSCk0ndnuQYlbVrDaQsLD+BiBtZxY32pAFVi0iJvL4uGf
 gwSmS2wu7m6/7MofCmKo3R68issX5lC1vPrC94v1diwoZHqK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 05 Aug 2026 08:44:35 +0200, Cezary Rojewski wrote:
> ASoC: Intel: Remove obsolete UAPI headers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: Intel: Remove obsolete UAPI headers
      https://git.kernel.org/broonie/sound/c/c53cb1f46be5

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

