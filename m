Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB7039FF5;
	Wed,  6 Dec 2023 19:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pk+hc7MC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44DEC433C7;
	Wed,  6 Dec 2023 19:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701889724;
	bh=LtO5Zbqj62xlrlG4EvDpgv5JTS1w2mjlz/GKDqjZAg8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pk+hc7MCPTTheljYcFz6c/nN1RZYygpnT5yyPNZKHaK8gDdB9Rejj3Fofq1wrIBVf
	 NzynyyYryc75nV0HMc9fnGiEdegeELg7O5BKNBW0uGmtDcuu8rsgFO2PPBt0asL4kc
	 zhdyco1NCiOgE9O3KbEx+wM2JhjcVWBBCbi4indAbtc0Y7QG8F/eBQyx55X8M1VbSk
	 705SThEmqcXpehhGEkJg5sdgIpzXp8IX7B1pIqP+R9jXFN+dVrvgdGClfXFBvfpIG8
	 FOwrepFbrfJehWkPWuwGcgd2jO+PrMI9EHfomMr2jjwOwhuUxJZlJVHv9ulAIi5mhH
	 N0gNT9QpZjMBA==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, viorel.suman@nxp.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
In-Reply-To: <20231206113047.2240055-1-festevam@gmail.com>
References: <20231206113047.2240055-1-festevam@gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: fsl,xcvr: Adjust the number of
 interrupts
Message-Id: <170188972244.73830.4531464119255824445.b4-ty@kernel.org>
Date: Wed, 06 Dec 2023 19:08:42 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Wed, 06 Dec 2023 08:30:47 -0300, Fabio Estevam wrote:
> Unlike i.MX8MP, i.MX93 has two XCVR interrupts.
> 
> Describe the two interrupts for the i.MX93 to fix the following
> dt-schema warning:
> 
> imx93-11x11-evk.dtb: xcvr@42680000: interrupts: [[0, 203, 4], [0, 204, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/sound/fsl,xcvr.yaml#
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: fsl,xcvr: Adjust the number of interrupts
      commit: a6b5f50fefe93676af8798ecc1f633581d1702f8

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

