Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFDC84A2F;
	Mon, 13 Jan 2025 19:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736795796; cv=none; b=iXzj/Zmkw2M1hqB7QCRqKaawz6cvDY5OCv3QtpkM0ZTIVJW8nCtiMJTH3RKJMPq8wmJ69HeMm/h9Rm986A+gWwuTOSyBzyiew/gkxqDFK7Cp9tN4myoBGIA1plKLr6a7x7SfxFjRwo6Do1HMxO8TtnSnaYsZjleLvrXzPwUHTvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736795796; c=relaxed/simple;
	bh=9jUMB+ykRgFU94wAQYrBu1ygWssAQiefWbH8uqqCTcY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U9GiVNMO+sW3ud44X2oHwENTUEbwWywNLYTLWJm7+zNfxNkHTPSJROuQNAoQWUy6L6ZqEJv6p1nTdhEaWLXVx3R672jZlUswtOIGwpLI6wZYVrfUaG5fj/mTTF21Zn7H9LvQ9eoOSqIZIV9+e6O4KzYEbwpa0Mu+Zk3FJyV8Jmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPyVretU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPyVretU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD19C4CED6;
	Mon, 13 Jan 2025 19:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736795796;
	bh=9jUMB+ykRgFU94wAQYrBu1ygWssAQiefWbH8uqqCTcY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HPyVretUH6T6pORpFo+WF3jZ0aru5Z1UculBcYZhOOk3xOmksXxdsir/i6IdfuV5j
	 b18Y+4XlAw0GlBhSRTZlJbc7rBxsVO5w3Ks8tJThdbUVx123N8+fBWO921z8cP71ff
	 W+t5N825p+lyZ77WBE5U4lY6Uu0ZIfsks9aVLs4uK2hnF0p7V0vGfGKGevvVJO3eaM
	 1mh9s0h/cL4b0Wt39ruAct5GL1Uqa/jALLtBKnsfCvhMbAiDclUCZsjOXDDmbReDcP
	 vXPxODH1VClQQrVa7OBqiBGAml9my6vODfdHeI200GNdtyCIoVfrwN8zUPSyKIovMm
	 9RUhFOQlLR+yQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250113090321.3193464-1-shengjiu.wang@nxp.com>
References: <20250113090321.3193464-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl: Support MQS on i.MX943
Message-Id: <173679579298.112994.9434417929541495183.b4-ty@kernel.org>
Date: Mon, 13 Jan 2025 19:16:32 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 13 Jan 2025 17:03:19 +0800, Shengjiu Wang wrote:
> There are two MQS instances on the i.MX943 platform.
> The definition of bit positions in the control register are
> different. In order to support these MQS modules, define
> two compatible strings to distinguish them.
> 
> Shengjiu Wang (2):
>   ASoC: fsl_mqs: Add i.MX943 platform support
>   ASoC: dt-bindings: fsl,mqs: Add compatible string for i.MX943 platform
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_mqs: Add i.MX943 platform support
      commit: 6f490e6b2c34792e363685bacb48a759e7e40cd1
[2/2] ASoC: dt-bindings: fsl,mqs: Add compatible string for i.MX943 platform
      commit: a1a771e5f1e31e4764d9a225c02e93969d3f5389

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

