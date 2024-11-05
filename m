Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798751DA602;
	Tue,  5 Nov 2024 16:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730824693; cv=none; b=NQeji37ZYXd+OBslviuK2PrQDVjIFf7NqHBcWV20eaSqgJt/H73xzXf0rwpmnpvTikPy+6uzgwOmPoRpy6F5TpB7kenV0TqEs/pvImiaPAfxzBFR8UJg54jQXYahaxNkkAPD4KNpZKpI0HJ1BzdInatahvclE8t62g86UfMahEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730824693; c=relaxed/simple;
	bh=4GPQD5DR/BXC6wmr9UiBHIMnc68vGt6gMW/ULhmN5jQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Z3pWPzi5ohLeiY2z3li/OGBAWhmtvoV3XmSn8yAyN/iizJepadGSAdUAzDdwpWfP/WZ/p0v1NDWIf9vS4IHSK3mloGXDRp1Ip+2WypyN38fSK9gE1itneNqwTk1MXpbEY8OTlfWSwHQA099NB9ozeKYbloprd3bJJtWe+00f8z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkjJaxpJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkjJaxpJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7401FC4CED3;
	Tue,  5 Nov 2024 16:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730824693;
	bh=4GPQD5DR/BXC6wmr9UiBHIMnc68vGt6gMW/ULhmN5jQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HkjJaxpJ8v3d4NJbVDFRP9+vy5nrpU8lfn5xiGKRboGDYa8YmGZTk6f8CbdXH+xjG
	 6XXHIfxuQ7/huO9ZVDnFLKt6RbpBKIx+/M9TEHlH3DfBwrL7hM682lCZWWbqdPdx08
	 sLh0O0fc276GWklgcO6YBNjYBBHqmSfunxAG1ttOK0tCMvA4DhNLy/IIIyFHzPKITm
	 fynXau+IqEXdeNPRU0UP/HB6MMUiThwoK1wX1eoTjlqkkzowP99GHCEdks1V/oMUX0
	 I7mPieSaPkj005R5j1VYoIxKCo4E3cEMj4aXNUO/48Y5hNoaAbaP1gERwfNb/iPh1e
	 BOdRDQd7lTDYw==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shengjiu.wang@nxp.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
In-Reply-To: <20241028020749.36972-1-festevam@gmail.com>
References: <20241028020749.36972-1-festevam@gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: fsl_spdif: Document imx6sl/sx
 compatible fallback
Message-Id: <173082469120.77847.4914036439907961950.b4-ty@kernel.org>
Date: Tue, 05 Nov 2024 16:38:11 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Sun, 27 Oct 2024 23:07:49 -0300, Fabio Estevam wrote:
> i.MX6SL and i.MX6SX SPDIF blocks are compatible with i.MX35.
> 
> Document 'fsl,imx35-spdif' as a fallback compatible for these two
> chip variants.
> 
> This fixes the following dt-schema warnings:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: fsl_spdif: Document imx6sl/sx compatible fallback
      commit: 82e54d65416b8e7cae422bee1755dd203c95d500

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

