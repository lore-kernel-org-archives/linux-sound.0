Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E932C11DF;
	Fri, 15 May 2026 16:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863165; cv=none; b=K1dG+Mu7jMgG9FrSYjx6lh8czVB5FHnaN3mikT2JF30OXTq8mRW7BVKQLfbnb9D7ujShhfVyXAV6PJyLnKya30Mq1kOpy5ne1coNzrfD2+n1bVb0PNJ+74RdKCoB8wc4ypovPUQUZCIw0srd2ba1ZWlsiS0J6Q+dHokh8E0T5zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863165; c=relaxed/simple;
	bh=gCOaOFropQKXTcq49R9csbcusL4I0kYkQmKtGitttaI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CwPOTa2r6/Cnj2xJrUrDXXwNX/rtyh2MOwlW3A58SavWHixAmpq1YDVQglqfz7v5gQTXgeRAv9sTOZYZ2SUcp15KsiyDqP9CRYYXV5WHSEnhVa+XWv04z5qfUeqMMItfB8h9By+BCINDUEsYx2uInK8lGmXRAwM+A/eG1OPvagA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZqiH55Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZqiH55Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2726EC2BCB0;
	Fri, 15 May 2026 16:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778863165;
	bh=gCOaOFropQKXTcq49R9csbcusL4I0kYkQmKtGitttaI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VZqiH55QzaYfcy+PDS4UWXyPkhRyUN/4+5H3Rqx37uwJe6H6qPG53Fo1eve3BGw1M
	 ESV/0QgjP3G+epEjZcZqDxDNmK+aFkdBxE90HCgLmpq0D478vuoIxOv5Gw9fmrAe49
	 d+QjDNJ0DP86Zw6Bi3s8qTKSfGUC8s/N6v+WMrPnlzvWmv3Hlv0fBZiLh0Lk2tAwXj
	 J5lyU6RcfzIwmMbo5n7RFfdprO9kVIHPsFnxkyf1jNsC9DlualqjRpH/6a5jZ0khgi
	 VG+oNzYBPHzNFNzVktb9wuY791CqcecuMTQLiLgl1RgsVMig2kus76vcpnf3ZzY1dv
	 xpKNosj29t8aw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, Shuming Fan <shumingf@realtek.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260512-asoc-sdw-utils-spk-components-alloc-v1-1-c9bbd6d2e123@gmail.com>
References: <20260512-asoc-sdw-utils-spk-components-alloc-v1-1-c9bbd6d2e123@gmail.com>
Subject: Re: [PATCH] ASoC: sdw_utils: Check speaker component string
 allocation
Message-Id: <177871977532.1043532.627750339469503614.b4-ty@b4>
Date: Thu, 14 May 2026 09:49:35 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gCOaOFropQKXTcq49R9csbcusL4I0kYkQmKtGitttaI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqB0w6pb/fIMIwX+ta5q5JhuMEZNU3eaE+GpUqW
 ylJRu5g57iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagdMOgAKCRAk1otyXVSH
 0KrCB/9eyt1dODV6Fj8h6QMT9FQZ6FeHLkCYgEZW7W/+qIS3WVR5HJR27XMiopkq427bn5nVkPl
 mOPOQaMSaXcIBXceDv0N/ODBZ7hmQ79EH8EjxT2vUCJW6D9Nk52TmP0LWQJmlTRNjlER3mhGK5s
 EdzHuBHJi6Aimaa8mmko9eDRPnC5WNz254UlnTODWx4ge+7xu6qvBWFCW2me/wJZCjG0KYSS3lQ
 +kYMrJH4cllCBOR69fI8fQC/I4/I4srnmK8a37UuoQE34hcBzgOGxo1isY2YAT1psb2k/DZ4+yy
 W8Jl6K4uq1YdwJXqT3JBIimu9tSgXdIeIKYz8df84i6RWQmB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 12 May 2026 11:03:53 -0300, Cássio Gabriel wrote:
> ASoC: sdw_utils: Check speaker component string allocation

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: sdw_utils: Check speaker component string allocation
      https://git.kernel.org/broonie/sound/c/5a30862dec5a

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

