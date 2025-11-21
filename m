Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3F3310782;
	Fri, 21 Nov 2025 14:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734490; cv=none; b=HdLVcRKkJNSGzhtUWs7Glp3pbifccnUC7/DBPuyUp4tyFVKKWMC7463heCUG7XxoHevskXtb/zCFduQOOGlSAQgVcfdSXwNveLLcoQbaz4kHt8+yoRJtYzz0b85ZiOI0tG0QGtZqDYtz8e+AToCpnFSj+oei16KU9kTfJH6uUHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734490; c=relaxed/simple;
	bh=WTb53wXJQ/CGaKGvMQqvKsnq7fpe+KFlg5lWFeQ5SfY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DhPDir9XuekTheqXCqadgqcW8HjPiww+36wydCOgPZKTXHEiuTb5UdyivO8BBLUQZ6+YiJYFM3IRBDM2WMOgBZoomTF0IOC1lpBoTRk7VGvqYK0MYPYMVDLcZ9o5/gddNcMyOeDIA2SYDrmD/zdUnczCl1JS/py6eQrWdHAMBtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHPVMxtv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHPVMxtv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5C9C4CEF1;
	Fri, 21 Nov 2025 14:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763734489;
	bh=WTb53wXJQ/CGaKGvMQqvKsnq7fpe+KFlg5lWFeQ5SfY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WHPVMxtvveDObaDMxVBL/PjlDKqIZd2scoHFlT3VzB6R0XZJpP4dTnqGefNTbVM7v
	 kldGQRz5QGwNaSrkJzS+EK+YMEmVQ/QZ+NeVdsTN1EAVgCJEhaS23KutMm5W3Zla4I
	 C9w7r8lNKAZISUkpfOypzdFXCwKPZ6YYLnO4pWpaVsSW7qB4NDYqijM23y33gx7GWL
	 Xkce0Ck1678LJ2oGPkfKb/Lff1FIBBOEZ3Vnsr0wisXXLPeRy2uK1lXRLU3vbHbRxA
	 P6X8+47HH0qgRdwlxChRvgiHvKAqcJc/BAUhpB769pNFdBjbAQ1b4x2zI0ekt2AAlG
	 rPKqefRHGuMcA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251120130640.1169780-1-rf@opensource.cirrus.com>
References: <20251120130640.1169780-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] firmware: cs_dsp: Cleanup debugfs for wmfw and bin
 file name
Message-Id: <176373448817.9116.11357878352484570206.b4-ty@kernel.org>
Date: Fri, 21 Nov 2025 14:14:48 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Thu, 20 Nov 2025 13:06:38 +0000, Richard Fitzgerald wrote:
> These two patches improve the implementation of the debugfs files for
> the wmfw and bin file names. First patch removes duplicated code. Second
> patch replaces the old clunkiness of storing the filename with an appended
> \n. The \n can be appended when the file is read, to keep the stored string
> sane.
> 
> Richard Fitzgerald (2):
>   firmware: cs_dsp: Factor out common debugfs string read
>   firmware: cs_dsp: Append \n to debugfs string during read
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] firmware: cs_dsp: Factor out common debugfs string read
      commit: 78cfd833bc04c0398ca4cfc64704350aebe4d4c2
[2/2] firmware: cs_dsp: Append \n to debugfs string during read
      commit: 3045e29d248bde2a68da425498a656093ee0df69

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

