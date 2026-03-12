Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5A32D8793;
	Thu, 12 Mar 2026 11:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773313961; cv=none; b=PdQY9IGjO94RdRg7C0NAxCMDZ4dEcMj0Re1ybzO1HQRaI21idfc1RBL42BQCWPJoxfeuOLku8wY5htb10s7Xi8iZXY46w1+YSn/pYtURHNA4uOUnZw1KmkufIONscSlDhavePy3XdZWPrRpq30cPV+wqlHwv6tiE0yF3ys8i4Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773313961; c=relaxed/simple;
	bh=X1u131Xq5qDAFif+vFIUb4IB8CNgTNsE5YLXnWJWl18=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GUZVxMOq7OlQlUSj2fZUQ9y7twd2XFLL/gmTuVEj4uuqV7YFPXdQUvagTzulG9PQIcyv8JRsbHQ7VwTAzLXDM2Qr6/wbrJUZ4yHCmH++v1dh8vmgRwKGMz8odE2aB3Ed1QFE76Szxn43gmyCVvMQKUDoyG4rycrxh6rx699JQek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ogc3iq8n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ogc3iq8n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10426C116C6;
	Thu, 12 Mar 2026 11:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773313961;
	bh=X1u131Xq5qDAFif+vFIUb4IB8CNgTNsE5YLXnWJWl18=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ogc3iq8npWnNzqndW72iq+hyWrG7GVqW+N7Sbm5bSlQhUEsJHGZcntiZa6mWLIWHT
	 TyCrXgKe3RURd9+DRz60Ddiw4EN/xeAiwxQ5DnQ32SEFA1xCl/CiIR9Dz+dwR1nx29
	 AHeNvNvaRZ6OTIrsjPMezVX14u21QiUuifRnzaFcQIFh0k/rcPJqj0yONwioLeufPC
	 bHF1PpdlsclzhdnSP6aWN8osONstHmw3vLUrz4I2ngMIJleK/V2P7Zn7ZFvsD8SUHY
	 zzfeymfnoqRo+etAjBFo4bxjTg9pjXO7ZbZPr6DvAVLmqH+9dR9r/hNhF4IMDDZJmQ
	 M278EQs27xx3A==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 kuninori.morimoto.gx@renesas.com, ckeepax@opensource.cirrus.com, 
 AjitKumar.Pandey@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260310044327.2582018-1-nichen@iscas.ac.cn>
References: <20260310044327.2582018-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: amd: acp-mach-common: Add missing error check
 for clock acquisition
Message-Id: <177331395876.9483.3131913731067058483.b4-ty@kernel.org>
Date: Thu, 12 Mar 2026 11:12:38 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-68380

On Tue, 10 Mar 2026 12:43:27 +0800, Chen Ni wrote:
> The acp_card_rt5682_init() and acp_card_rt5682s_init() functions did not
> check the return values of clk_get(). This could lead to a kernel crash
> when the invalid pointers are later dereferenced by clock core
> functions.
> 
> Fix this by:
> 1. Changing clk_get() to the device-managed devm_clk_get().
> 2. Adding IS_ERR() checks immediately after each clock acquisition.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp-mach-common: Add missing error check for clock acquisition
      commit: 30c64fb9839949f085c8eb55b979cbd8a4c51f00

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

