Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEEF3FBEA3;
	Mon, 11 May 2026 14:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509958; cv=none; b=mnKN866QY8rJ6S5Vakffk8PazIKElVfR6ea0cRIqsINshgEEsZgqSt9uNXiUE7sc7aBawvOChsQYNjjXpmU/0GuqzrMdJlppnWi/J15CIDKlNl+u83bZTTXv+kyu3TMWqro0BnOjZRsJgrX6V09Zxh3UOEW0V9+A4iFr+a8ObNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509958; c=relaxed/simple;
	bh=1SsQVnY+ZynfynLxhwYaAaBtJao+nQVzV0WWfRgEL2s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GoSU5FIBBHHuBvWNyOsTLrhx+FbWIjFZhgkF9xJjoL0ne8QKayj2tjaoIed4v+WdtGT95ss9zHMhBwPucZu0enaRcBrNw5TbQkTUSiUja14iaGszcGMeAU2vmrV3Ed8RYnccTbyzjm+08KS2Ezo6DBKW4sAprvBpaa57pQ7+yZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrYBGGUV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrYBGGUV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2061BC2BCC9;
	Mon, 11 May 2026 14:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778509958;
	bh=1SsQVnY+ZynfynLxhwYaAaBtJao+nQVzV0WWfRgEL2s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BrYBGGUVhBbhqnzjec4v0HJB7JUHQUtXUQv9RLxqSvYICE/OawlWAV6rE/nMIAhR8
	 hLPmKof+njY6rjxbFkS9wJYaSSMdM1maxf3hRQ11JCGupBNiEG73Dc03OwONWS7mfT
	 ztm97/AxgmOnVdnjNKlF57L+blaaIJHAqUXPbGz1RgSmfOjaVDAHfEiFczMRfImMwc
	 D18ION8RBDdF+Ojp9Bvyo0Im5VBpXz+dG6Z4kdWHunajSsn3ZlUNqX1GhGRdNspxYx
	 mK8zrMGBH9Nre3WIHR2HPJRMaplaeRrVlZAjNI0ouqXalaVABVDvOeUvFcwFwfnyrf
	 R6x/hpmcsqA6Q==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Sheetal <sheetal@nvidia.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, 
 Anupama Kunkulagunta <akunkulagunt@nvidia.com>
In-Reply-To: <20260507094431.3316763-1-sheetal@nvidia.com>
References: <20260507094431.3316763-1-sheetal@nvidia.com>
Subject: Re: [PATCH] ASoC: rt5640: Handle nested IRQs
Message-Id: <177850189323.988959.10926303404290273562.b4-ty@b4>
Date: Mon, 11 May 2026 21:18:13 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1077; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1SsQVnY+ZynfynLxhwYaAaBtJao+nQVzV0WWfRgEL2s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqAeiDYhDqz06wrFtIBT8yesZydQDGFCSr1/pn4
 ZTE6W5svd6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagHogwAKCRAk1otyXVSH
 0HyFB/9/XoOiBDjNzU2HpBhmfWeGt0fSkwXmQ7i0+0CPL2h0dvs62LbbhTiUW0Y0kmCkldRFuXK
 Y1oyk6JXM2RYfD/s/mc8RUsIOTezLx+q29Q4i/cKUhLHpc3kUZRrLajEl58wTTiMhAB5tafkl5A
 67uK0sljMrpmj8/vcuMMsT4t+UkRaQSevUr2a6ImFwnmV3A2WeyMrad9jh9ID35FYD9Z5haG7O4
 mckfJTqHFg9sKtOWzvvvzTPekNW9f6wi1hMDfZwaXY+UADWHjrGD/xKBaGNEl0DUvQEG+z4HlgO
 OaDqHCTbKVYLFLCQl33smINWokeR4ZPZPqiTinQN79r8S01T
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 07 May 2026 09:44:31 +0000, Sheetal wrote:
> ASoC: rt5640: Handle nested IRQs

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: rt5640: Handle nested IRQs
      https://git.kernel.org/broonie/sound/c/b613e2b40750

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

