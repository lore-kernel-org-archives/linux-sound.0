Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3C443849F
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492361; cv=none; b=JmtAT5Yib1FPjJUlaYXafjuopd0hOoShhjOklfs6O2Al3LDjt8E3gW9EFncghevNAFpCLE4mWErAdZ+Ic512EH7Zgk9p53xBgAryr46/KZ/EFPff7cOiXAyFoP63ypJTJLFM6vCcVfAq22c6nDBQtKB8XE5DTbJWVldTm0JwXJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492361; c=relaxed/simple;
	bh=7XOS365QUhoQhDBpMTF6HYffpyv6zQ+h3s/IFLWbC2c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZBY0vbx2u/CboD95++ZwOXPLpcF2mLi/LcKzjSQ+0MF8rNjjBJIVHBQxHjO4mS+JHKD5z0nSSijoizOlkZaItHBIP/C3YL6VvY3EIo1YhZf8qlsR0aXL+Sgz02eJoG1B+YM7Fxl3XMr+AxijHdIgsP2BWKADqR0nL4MVye5U+pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZIqTyml; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZIqTyml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B522D1F000FF;
	Tue, 15 Sep 2026 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789492359;
	bh=X0xAhKtkt8FpQ+lmUpGCaQ/B7vg50mh1xSxoXJGgfII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nZIqTymlQ8fIfV6GwOxNx6h8qcJilDH9Kv02UrdDFLAsDyKnkqhOa+0a/LWLDwupz
	 3A96zFBHW3H/Kzd4jTEnSgsSgzoleHsuGFanDwyt5cHVlVHBZ65efOJ6KkN1pXIJVk
	 I0qqJbFmc+GJZIIQel5GDqqiQMZxT7yy7CumoefyRKEM+dkLvzrAZljgYCDDj920Kn
	 /qPlscd1kRA33Llv/5RTWajXZZx72dVgDS+SlZD1R/LgLNySF75CunZvxcdSwrvbXv
	 US+1bf13iBVXRSXqu7wfsnJKiyZcrjblAsI+ao6xpaiZLjAtGOZl9336hj/BpitE1Y
	 AsTRSMo70yskg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260915101037.3087956-1-cezary.rojewski@intel.com>
References: <20260915101037.3087956-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Remove topology-loading wrappers
Message-Id: <178948408862.151760.13840121113378297387.b4-ty@b4>
Date: Tue, 15 Sep 2026 15:54:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7XOS365QUhoQhDBpMTF6HYffpyv6zQ+h3s/IFLWbC2c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqXyEvFzu3VdOt0As5ufCTy4+OQ/04pIXgsid8
 1m1XZDCtRWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaql8hAAKCRAk1otyXVSH
 0L8zB/9EeemFpFLr7nYRNRx1dDF8pHXwwMR0dRVcDishAS1wWJpncjeqP09+UTcykorBoIDhEV4
 wK9+pz1gpIEGZGZzQwK0wwjhEUAp4Ny2VT8aom1FlMtBMpOThsPZeDKwnG1VO8Gim7qjYchS8rO
 rCPovHpxfOkfoFlt68WChgqA8RrCIZqCgsvzH6alVbcbgH/vEkDTvp6ZH1BN547pacbJWHu9xHn
 LU8tWq1fgmLq0LHIi4MtJy9ISay9CMPW1FQC+QOcyJI5BMsaGsN12H9Ozi9YmS+wmJd/N55yZki
 iNSGjbcLZc6akLu3U/TgKGwIkx1bjzRDt5khWz3G3tjGwT3X
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 15 Sep 2026 12:10:37 +0200, Cezary Rojewski wrote:
> ASoC: Intel: avs: Remove topology-loading wrappers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: Intel: avs: Remove topology-loading wrappers
      https://git.kernel.org/broonie/sound/c/99c3d5954293

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

