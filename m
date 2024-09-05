Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C63083CDB
	for <linux-sound@vger.kernel.org>; Thu,  5 Sep 2024 10:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725533412; cv=none; b=gWKzqpVvHgr9deibfSd9QcJ55uNsZWBh93TR0emPjz0Vkt6ZWblp/NVQbnis573vQRlz4ldbWrAt9DnxXhU0y8z+o5XuM+FJ7sTgxzfyFY/gw0nPqyan/Y4kUxxKBciMiJEJ61Rc3af9n9CklCO3nDAAcP4ICeHt7cJcP2q+XPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725533412; c=relaxed/simple;
	bh=VpAQRPwEr6BulAVHkGys03WB2SCuXzp9eOg4uixv024=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eGnD/iYAeM4fRvT8cR4dMRTrTzSTUb8Ax1A6XLmBRG7OgrTX7djXqDU/othGw0y5nNEaOC5z3CO/IDVWA/XOE3KjaGj4DgovK9tGQI66DIprmwKaSZ6mk9Pt/BStIBjmM6DZErYw0ag0Irr9QmkjdU7TBaqoB1zgzxoblAGb98U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vof02uUT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vof02uUT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF82C4CEC3;
	Thu,  5 Sep 2024 10:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725533411;
	bh=VpAQRPwEr6BulAVHkGys03WB2SCuXzp9eOg4uixv024=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Vof02uUT8m7/giJMSHdBFU8Y/mj8j6pBQCl21p35wtLTkDpGelHSxyXEYPC+Fvi8e
	 oBu3ALmTzsQWJ54bj0env11PQfw+b4+MEQtqA/MSF7KSdkwlHK7u9cE032S7wNKysL
	 2oISSMcIDOLnUSQsvPLCKr5XZNAJtsG+nMto+lP5MDBKMTU+T0EIcEQiSEU3ciHRk9
	 D3tVmrETHCb9KpUEORX0TCSQDd1a2FwzQ/OHX9I/mwunkQlZER9Q8X5zAmfFY+3c8L
	 cc2X3s636Bf28SN0KRXEbcaGe8EeRNhoYrGQeDsNkrtOjYzwSNmOM3Z/+3tkmST3F3
	 P8XadYGNJ8UTw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, Zhang Zekun <zhangzekun11@huawei.com>
In-Reply-To: <20240827070650.11424-1-zhangzekun11@huawei.com>
References: <20240827070650.11424-1-zhangzekun11@huawei.com>
Subject: Re: [PATCH v2 0/2] Some clean up with helper fucntion
Message-Id: <172553341021.15103.17871738314881697958.b4-ty@kernel.org>
Date: Thu, 05 Sep 2024 11:50:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Tue, 27 Aug 2024 15:06:48 +0800, Zhang Zekun wrote:
> There are some helper functions which can be used to simplify the code.
> So, let's use these functions to make code more simple.
> 
> v2: Fix a code logic broken problem and add the comment back.
> 
> Zhang Zekun (2):
>   ASoC: audio-graph-card: Use for_each_child_of_node_scoped() to
>     simplify code
>   ASoC: audio-graph-card2: Use helper function of_get_child_count()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: audio-graph-card: Use for_each_child_of_node_scoped() to simplify code
      commit: de849243404e8ce02320a7178d4448e4d0191377
[2/2] ASoC: audio-graph-card2: Use helper function of_get_child_count()
      commit: 815f1fcf2403454904cbbc5cf370df6bc300f392

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

