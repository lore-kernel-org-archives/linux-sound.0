Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE6E26ED5C;
	Thu,  5 Feb 2026 11:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770289496; cv=none; b=rJS6WQ+zhEIzcAu3mJrS7d2tIl+Dh4HmunUWYG5ITlNpzqL9JFqRN8aLV6s6nABYITObaoRecqDDX95rajQwPONWpKdK2hwmMglAmRci5rAE5FHQ4mjVnIclr5oGDr1oUYR5iJAQWWA6UvS7mdqh84I42Z48MhEfDWQ8eaZAnNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770289496; c=relaxed/simple;
	bh=9y852qK1vxJjArpzFhdSlz0lMq4vZa7/7oWZCbGOdUc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ym+xwLBCI6v/qJtpWWAko+yoZ3n9euLmxAivEP8ZOtfjmE7hif149ZeIdrAfGUnQfAWvmLGCzIMyTIdkRkmmlb60g7MlB0a674tfkwHwRBSC9dXN0sQlqKmcZzo1e84l8/RkH2b1zDfc1siOO7k/7q0IdjfyaKROCa4f2AUVyzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fA5403kM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fA5403kM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C562CC4CEF7;
	Thu,  5 Feb 2026 11:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770289496;
	bh=9y852qK1vxJjArpzFhdSlz0lMq4vZa7/7oWZCbGOdUc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fA5403kMmtDItadSJOLfDailOCBK5CCbiXbNS4HbfKPLKdU1swSx5F5T3liR1oMHa
	 ye599zGjS8C2hgAjfErqroO7K/53G/9DkVbRfNTKh6M66X9ZIFtmFPW+/MDcJrdswJ
	 JGcweglWaZAFqtka9ePevGOWCe1qY9SIGXt03sy57NjKOR96gWU4TLyYxLDS4MwOCc
	 tuuAnGqv8vt4wi3R9OYYwp6AfOz0DL+B6Hs7tjpajeyC1MyGgCj9r04TsUy4f4ygTB
	 dVx2ZMTLmA0/mbYzlDagZ9XrOTS/sUYwtDwwpIpwNezDEh+bfoEuJ7q4hvmJ0L7qwr
	 EIuLS3/0E9NYQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shengjiu.wang@gmail.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20260202105622.39772-1-chancel.liu@nxp.com>
References: <20260202105622.39772-1-chancel.liu@nxp.com>
Subject: Re: [RESEND 0/2] ASoC: fsl_rpmsg: Add support for i.MX94 and
 i.MX952 platform
Message-Id: <177028949454.8656.10974938764155010042.b4-ty@kernel.org>
Date: Thu, 05 Feb 2026 11:04:54 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 02 Feb 2026 19:56:20 +0900, Chancel Liu wrote:
> Add rpmsg audio support for i.MX94 and i.MX952 platform.
> Resend to correct recipient list.
> 
> Chancel Liu (2):
>   ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX94
>   ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX952
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX94
      commit: 19e45247288574d7875c2bfd3c9d3f4f61fd9d92
[2/2] ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX952
      commit: e50de21fd7ce54d34a461d5f5ba6331271be57fb

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

