Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836823B19D8
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 18:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286775; cv=none; b=sXto9/59csPnxpc6uGRVrfUesYbfxAhaNJioKu5CpzkJ2Wz+64eN7QcJShlgAR5uCgSRvpL17HvLREhM9y7XrK7K24y10iSwxH7SkxFvkkZUKw9baRFoVJM6tRYO1uNaUCPjkoASV6KibOceLcg+wlE+UWQln2l5LHVDA62ZZGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286775; c=relaxed/simple;
	bh=HODRrP4eG7sTsn5Srps4epqUw+YiCXbmrYjdlQaE+m8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=av6yi/sYUqgKYf4ETP7K10cM7axLh0L+V9nx+QKOwvndTdXj3QPsjBMVuctxA42Y5bhPQJ7wJeLcmOs8DpG+CcC+JrB7+EUOs/XELqKqrYqYiIGCRmXfX7VmtXvH+sQMUDNGQruYA2y5/q/pmQvbgK7gi9ddWOoTl5SchUV6Mfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Py2gcyTf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Py2gcyTf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB461F000E9;
	Tue,  1 Sep 2026 18:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286774;
	bh=z5kiamUx4yXF/qBV7lFBzQ6OgdpRIA89NQ3I4mxtE+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Py2gcyTfVtEVVQJfSyZc8qBmE7oUTvnI01M/H1SUOjnOdc8WDkryLew9rmQKkE8E9
	 lXv1GKT70EpaXOQ11wj4Ok2KqK+Cfte2sGrFLtXiC1bUjiuSbY0LCQ8v80PrfslsQE
	 /kO/VPtZ6T70s6O4Bu4KhuOzKaegTJdRpAw52MUdgkwIx7GOg1Rb0Itn/3tmWS47FL
	 /2uR+NIeOSxARMauW3ne6FR2oFc2eAOC+oUg7AVJByi0EK+JC1Tc81dUrl4MUQOvuy
	 Ww6mYCM85kDS9f3lsjR4UIWRinfFHq5IYaifB09jRGY9n84f9vXDCdKB38/Uy1P7gG
	 dX+Xk16+rzIIw==
From: Mark Brown <broonie@kernel.org>
To: baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
 Tianchu Chen <tianchu.chen@linux.dev>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <4386bc53631b052c1866a91061715b009d98b04f@linux.dev>
References: <4386bc53631b052c1866a91061715b009d98b04f@linux.dev>
Subject: Re: [PATCH] ASoC: sprd: validate compress buffer sizes against
 fixed allocations
Message-Id: <178821245488.439600.12439967920767648601.b4-ty@b4>
Date: Mon, 31 Aug 2026 22:40:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HODRrP4eG7sTsn5Srps4epqUw+YiCXbmrYjdlQaE+m8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxczWaJnV3osda4rdtaxHPUJuXJhUgh6hHEJc
 xoWp2nQtsqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXMwAKCRAk1otyXVSH
 0NKJB/9XriLWuKM6WZPRJKGI2jxjXOMrb1mFCWQvLtWmUT7x+QO0XzpzfuvLdLqOxChKf8AVLJg
 LK3JxC6uIfcVcFsmIHFjv6l20qveAZdzK8mY6ggmBmR7PvA9PWWWc1iC702k5QY2r+LnWLv8YPb
 ZdpX0XqIlNKD3VxYJ8Rkt0spxHlDYYY1jw5gRZg7rjK0n3rJQ7MXPBZ5HfUqXpn+ja/ymkeMpbx
 WgMTkkdKhafLuC0zquV5P04YH0Ydao/uhVCaLWoSbrdltCEl5V949cz2xLZdjpN84k2uxxWKwTx
 bZBgt5l/juOOGDGd0eWZqSDGXr5ifrAkfSHszX30i3o+ocG1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 31 Aug 2026 15:13:36 +0000, Tianchu Chen wrote:
> ASoC: sprd: validate compress buffer sizes against fixed allocations

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: sprd: validate compress buffer sizes against fixed allocations
      https://git.kernel.org/broonie/sound/c/7a4ce92d150b

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

