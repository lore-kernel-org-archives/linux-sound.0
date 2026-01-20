Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632034266B8;
	Tue, 20 Jan 2026 12:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913531; cv=none; b=ZVM3ZvWTcjnXE/R2X/qUnAfye7l5xE5wwD9atQqmsBT0jDIJdBHwT+EXMnEDUUPYObXzPeRtLN92pGZYroJ1VN7aExEojVuOfDSm5toe5PGtk1vdEPnLQigC8I3mpyf4e1GyREgPLH04MKH0y7QORdKAndvS7lBBzsnK+RIDe/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913531; c=relaxed/simple;
	bh=bc28KWZ4Nes1dVdT5o72sgDVqx84W02iDqzED50KaTA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WDayvHj+Zy/A4bQdpHu+n4eCi8oJ5WiXr1PEihU1+QWxz88smJNlF+JusTs5o6tzJ/l3fo3YHMGkELGvmousIp8ETT0yFp8Q60vUhLkvClawaGEtJQdM5/XFXWOiBf0FVccoHiRq+9VFCZvWdcvr2lMlbdf7EMQNlrz9TfEE5Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGb5hCrm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGb5hCrm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40520C2BC9E;
	Tue, 20 Jan 2026 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768913530;
	bh=bc28KWZ4Nes1dVdT5o72sgDVqx84W02iDqzED50KaTA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=RGb5hCrmbwFcK2OkCJYJo2brNvk5x9DZplXTFTf57NLeH4f+Kl1GAnC3hEGU4lUgC
	 AD/72LTXbNet5aL6/lpknEYOjrbMCgyB7Nv467G3pUsPFkl1OWCzCR8EAW5nszRari
	 yWXSKQ5qtS8Yq0Vr60xU1K9HKh3K0eAzs/5v70ZEyVZPRVX16C0Ghx7SJorfqWtglX
	 pnrDkaoNxknAfVWCuc9+ITPycHLTB09VXke+aeiABgFJ3xluVr3WUzFEbpbHw1ByoW
	 R1XpRdh6Oc/1RJdmU2xbYCuAHDIRwL16lW/wqAFHC7RUuPzXVbwg5uPVWygvcWvtZt
	 hSCM7GQXKNj4g==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260115061418.4131432-1-shengjiu.wang@nxp.com>
References: <20260115061418.4131432-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: fsl,sai: Add support for i.MX952
 platform
Message-Id: <176891352801.86219.3828176720307654580.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 12:52:08 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 15 Jan 2026 14:14:18 +0800, Shengjiu Wang wrote:
> Add a new compatible string 'fsl,imx952-sai' for i.MX952 platform, which
> is fallback compatible with 'fsl,imx95-sai'.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: fsl,sai: Add support for i.MX952 platform
      commit: 2e48020fd7ced9e9953c55b57a5cb608e64deee0

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

