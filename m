Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320B41D5AA9;
	Tue, 14 Jan 2025 17:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736875092; cv=none; b=jIvPi07+cSPuAZHJxVTUKvKSlF0WdJ0pmFQWk7U/6Zt+GaYdGRKAWONrLENdwo9WKUnyMIzx6HCyzbYQovAxh5fcK77VzyvqIIU4NqeNIdm3Yu248kwTmuW4iIdhSJ1jZijwXQrKoveLKFRuP4WdNWB9tvFw9ZBeRAW2dfXK1v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736875092; c=relaxed/simple;
	bh=/5Iyd6ukvw+wlfQuDAyxHew2KnpdZoyclKKn5oIODnc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BTszssJw60vOScXWa4QuVUEIBxEdkzbznznT5jAZs6CSQfXRrbze+6gM/qqPy++ufyXX1XvAHoRP7tRcnBOM7oBvvX6TbKRNuAtEKRyRxxjjdUreRs6ZjLijsDGlpMUCyIHuF5ZoT4GkE5/kc3NxFJ8clvay/Y2bx5txLCo2D2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p/0xJnkK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p/0xJnkK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E103C4CEDD;
	Tue, 14 Jan 2025 17:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736875091;
	bh=/5Iyd6ukvw+wlfQuDAyxHew2KnpdZoyclKKn5oIODnc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=p/0xJnkKcMlzgcYf+caIAsKLu41HOHiDmbDt7TflB3ciDUvNV0mapiUS4aZ2sl8bM
	 71BZlEr1vxuE8K3p0XpbdGKjlF6vqqSduHIRtX7WVMQ33NP1aT3GB0h7FCl72XhYtU
	 hIwy0e6+K71x9qrGKINpjjN4dBZQhfpnX86/Qb9AQSuGYc3YjNMnLZvcnP5fSFY8fo
	 PnMigJHQe+Az0t5Xdw5B4HZ4zZndZ5lL/gCZb603LvkFNE9u0opnxUTLSaubJ8/HqM
	 2VlFEX8r+qF36MobSHXgHk5yDP37XCMr/U9kKMyqn+FBtlg/zdBeHnWcW00jW9H568
	 NrC5sgbnSG9JQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250114102720.3664667-1-shengjiu.wang@nxp.com>
References: <20250114102720.3664667-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl: Support micfil on i.MX943
Message-Id: <173687508729.71321.6375235704794853519.b4-ty@kernel.org>
Date: Tue, 14 Jan 2025 17:18:07 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 14 Jan 2025 18:27:18 +0800, Shengjiu Wang wrote:
> On i.MX943, the FIFO data address is changed and the bit width
> of CICOSR is changed.
> Add a new compatible string and update driver for these changes.
> 
> Shengjiu Wang (2):
>   ASoC: fsl_micfil: Add i.MX943 platform support
>   ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX943
>     platform
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_micfil: Add i.MX943 platform support
      commit: eab69050450ba63a4edb17d3d1a8654d2a130786
[2/2] ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX943 platform
      commit: 3927c51e49c1a45785334dc578f0b29c685619ec

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

