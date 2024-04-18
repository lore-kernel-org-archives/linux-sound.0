Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8B25228
	for <linux-sound@vger.kernel.org>; Thu, 18 Apr 2024 00:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713401292; cv=none; b=CjbwXltBevzO2N55fMbr7WOQNfVQamSowthtHbW2iB9rO6TtJd/nbIjXmW1RI1mtf2/8cQjDiBWdbdL9g8KJ2aR9sZR+l0nCw8RQbKVuT7WOk1BaHrM0T4oPN3+vZQWpVcXE5uYMH+e1jIIjW0gc+3SlDQmjU+0CXfX4x6jJ4II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713401292; c=relaxed/simple;
	bh=qyDJst7JAduoW5FAo+4ZNIW3qHQYg1+Ak9auQfGfFDc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n82QATkw715lc0pLCPAriI1uKCp1fQZe6wY0RgxGE4zrmSn1nWYWzc/Fsz7caGPFOwz8FCDD1U0OiHeiqTD7FpjYC9pRIDwsdUJN0SbMc5mvpuRDEjXrGEJ9rzDqNYsp6idYDehffe0Uq+C6RK/lQBhv0cORsM+ImXxJGhhF34I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaT7jMrB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaT7jMrB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1341C072AA;
	Thu, 18 Apr 2024 00:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713401291;
	bh=qyDJst7JAduoW5FAo+4ZNIW3qHQYg1+Ak9auQfGfFDc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TaT7jMrB6DM5dlgOp1d3D549bGJ9U18now3U+dn+KZO+zsFKvwDWdTfs7mpxNY/gb
	 yfW9rBJOQ4M5YAZXwKfh+HkDxMddex63Mu7uu8BGNxFgG262iw/jp1Jriv/ooBMiRO
	 Wiw/HrPDWIFEVHM2alCrVBbJD+R8ZW4uZ+Zura+awPV0ElA5gxBvQ/CZ1Dh13Zhlot
	 RU3tr0ZUc1cUdpxBTnW5hWijO7eZyZobTBCZSBjMYxDNdxklUyxBGo3SLP6lAhwBdA
	 pQyGz2bDxHzB2cZRKXtZJpPF0leuauO5IoYeMjpQ8y3gJh+6eko/Zc7/j13HQN3hJw
	 D/vs3YXK70dTA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 chaitanya.kumar.borah@intel.com, yung-chuan.liao@linux.intel.com, 
 rodrigo.vivi@intel.com
In-Reply-To: <20240417075804.10829-1-peter.ujfalusi@linux.intel.com>
References: <20240417075804.10829-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Core: Handle error returned by
 sof_select_ipc_and_paths
Message-Id: <171340128938.1712879.5299180496960208172.b4-ty@kernel.org>
Date: Thu, 18 Apr 2024 09:48:09 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Wed, 17 Apr 2024 10:58:04 +0300, Peter Ujfalusi wrote:
> The patch which fixed the missing remove_late() calls missed a case
> when sof_select_ipc_and_paths() could return with error and in this
> case sof_init_environment() would just return with 0.
> 
> Do not ignore the error code returned by sof_select_ipc_and_paths().
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Core: Handle error returned by sof_select_ipc_and_paths
      commit: 9a039db9273b44427b3daca88173e57596545ec0

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

