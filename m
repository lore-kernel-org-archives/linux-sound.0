Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869541A2622
	for <linux-sound@vger.kernel.org>; Mon,  2 Sep 2024 14:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725287598; cv=none; b=nt8/Vs9bWEk69E9BJ02MvA2HXdLqeJzBwhSdA+N583nHU7uTyctWDcbbc85FHtjon0ut3GpVn19djAXydgu5enqTkiDkh3R6eXQFu2GhXoiy5XPF0jgASjarfTy1U6wlX5fu2wuSO+u6sDEkRFOXCKcqZcTFtWb8twpYRiauNZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725287598; c=relaxed/simple;
	bh=A9dcqovvtJpstl7GyTcsnG5Oa9/e8w+TxqM6nfRaaJc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qmjE+ZOZoIG5b9cs3RPOvV1O6dp9ISxkeQi+iyOdWtBi/tI6pJAQXxzoqfuycdJZKYL2mpJvFo+QzKiAqvzW31R/1KH1KQM6S3PJ6XrfelOCsg5gsDr2RJnuyjl9u3Ei84G/FEwXjvg36JJdejiLk4T7SLq2vcQ9nwZfrFG9tu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPDkG1vM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPDkG1vM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BC9C4CEC4;
	Mon,  2 Sep 2024 14:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725287597;
	bh=A9dcqovvtJpstl7GyTcsnG5Oa9/e8w+TxqM6nfRaaJc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oPDkG1vM3RWvD/s4QnjJrYvq6BlUuFsE25tDnwHDlUMM8YosQ1j/ckE5sIRuGz/qd
	 adpjJ3mwSde5oJmmi1bGoIE35nAyG50zh+1BuouqTtoZ9ZSJPUJ7hSmuznFFsfwNDg
	 D73Pk8UMNYs5qO21Zk6fmjnMeS/qh51tJoJ6ztSN+o9eZS24ob8p54rR3SAq3vbWAH
	 idUrtLuOKLoCGXhH9LDBd/PTtWI31NMO6gG0Zoe+gXVJRC3b3Di1I8+V+u/2wftR8t
	 HhaClK36md026ur7nUfSo+b1Y2NirSlcvdl3yJx1cX9yZ9ZlYcK3gg4yCVkd6czfB6
	 lhYNdBMZAWcgw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20240902090845.1862354-1-shumingf@realtek.com>
References: <20240902090845.1862354-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt1320: Add support for version C
Message-Id: <172528759496.85474.3087797121427109603.b4-ty@kernel.org>
Date: Mon, 02 Sep 2024 15:33:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Mon, 02 Sep 2024 17:08:45 +0800, shumingf@realtek.com wrote:
> This patch added the support for version C.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1320: Add support for version C
      commit: f465d10cd73188611ba952fd4df2e2c879998334

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

