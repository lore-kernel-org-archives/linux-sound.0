Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA501A7056
	for <linux-sound@vger.kernel.org>; Tue, 10 Sep 2024 19:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725997786; cv=none; b=LUiobuxLRUX3jZAmg+sbMYL6b5LzlF4vfLbox8uglkETUkR/PBLqKiwWFF2kDpMMRC2pQp9GSLHu8EkJ2oDB70V6X3ef/KklvKOIxr0EVDhVmXsB9N/QfCugNVyxDdw0nnzLQnJMzY8aTWAkkQ1X+s+tA6yFQ63Mg+5VmWMeZvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725997786; c=relaxed/simple;
	bh=OQ0N792u73iPfZXIehY6S3Wtge3zrRvqU4o9qlDbAUI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sWlnzEv6HpLN4gkLWiikMIINykG96hmXZD2mf5mJiBsQGyaQtMBEMDrULmi0BcXdl7I2F7OHN8zvuZBf+CwCJ3dUn/vBJluJHOiBL38VczbJRcRcSmB0MRaqN7M1+TXA/sUISxhaZcKEhB9gfFbIuyLT36fbeFDZAXuTNmISJP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3JnKt80; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3JnKt80"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B10AC4CEC3;
	Tue, 10 Sep 2024 19:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725997785;
	bh=OQ0N792u73iPfZXIehY6S3Wtge3zrRvqU4o9qlDbAUI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s3JnKt80pBVruwMnWGqD9zdSyrwgGkyodo/Nfqh5wwwmx4pgphG0k+dIkTGkTJRuC
	 D3NErwjqVmyhgdK/bBFu7A+XkRn6+WGUnyrpSH219T2e8JTn4NrFInmQjrzWOB/sgj
	 k2NzHdf2gkJEyP1SAUjG/Oza1rFVdvUjo7D05j+qqU8+hJPUVarv2KNdMbbRDMpCwl
	 tE4Bj83Et5F6FbRQXq2vnvamzJyTX2l67vvivyLFep5nBDqihafAdg4WND5WSFYfx1
	 q3f22Pdnzs/5ie8dJ72BrsJ0EVQ9HM0e4rdDy/Co4lrA4P/Enqr5X6SHQnBPQCJD+0
	 1VtfxpClCSyHg==
From: Mark Brown <broonie@kernel.org>
To: jbrunet@baylibre.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org, 
 Zhang Zekun <zhangzekun11@huawei.com>
Cc: chenjun102@huawei.com
In-Reply-To: <20240910122330.70684-1-zhangzekun11@huawei.com>
References: <20240910122330.70684-1-zhangzekun11@huawei.com>
Subject: Re: [PATCH] ASoC: meson: Remove unused declartion in header file
Message-Id: <172599778403.1174360.17491025244427910143.b4-ty@kernel.org>
Date: Tue, 10 Sep 2024 20:49:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Tue, 10 Sep 2024 20:23:30 +0800, Zhang Zekun wrote:
> The declaration of aiu_fifo_hw_free() has been removed since
> commit e05cde84eabc ("ASoC: meson: Use managed DMA buffer allocation").
> Let's remove the unused declaration.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: Remove unused declartion in header file
      commit: afe671ac3e9309e55d556d066250bd37d9c47d1a

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

