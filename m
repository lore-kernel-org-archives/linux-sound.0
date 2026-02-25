Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4246A30E820;
	Wed, 25 Feb 2026 07:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772006296; cv=none; b=VCK32yic8Me3DaXkr7QTmlvPVX/Ic93cb01KilUfUTS7O33AYRep6nbLMGHxiRVR/bwc7cJ4e4QHZnMMO9mAFkzDM9ZrMdr801g81NQ4Eop0oUF/6Ipr1sPIRxSl3bwDl1pyQXFcJodkJdWM3tGj702XnbpHFLvrv9Kpzxoc+Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772006296; c=relaxed/simple;
	bh=V22PP0YFt4AV4GViqbxSTxq3puAL/vxTL1PF02htirc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wir0fYSZZi3CD7R1JvkaE7waY0dF5XqwHMethjyp34INwzbl6dY/IGsrjGqLS/449FwJCnaqvUqO66sl7zr3INkBsSPDZD1LCPUPZLlOzIY8DpqplK/Ycz+BXYeYlMdk3JjekbiBhPF4NejwW14cQpJm6L8NqslvbuaM/CbS2p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/OAJ+b9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/OAJ+b9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D780C116D0;
	Wed, 25 Feb 2026 07:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772006296;
	bh=V22PP0YFt4AV4GViqbxSTxq3puAL/vxTL1PF02htirc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n/OAJ+b9qzp376Z5IHFZ1kBlA7ry9Sz6vRgIphjMuPdtR4rf+wyhovZWZgPH4DxZc
	 VspJq5OE8NkjJQvbzGBdWrV/cEPjn9vp4TOFm2p/ecTU8qKXxW8wtVyTgEUVA9fLWJ
	 yJyvqA0Y90+L/wclgIxd/bqeQYH5KUU8qNmmDrUU9eAUS+f8S1oh3Ywy3+yGZ0IXpA
	 Yahq28fjzIQhuXOeLrSX8tmUH+0/PMw41+mZCNMQjL6fsPAtmJf/BrqiEVU1cQhuIn
	 msdqE3gOrU3tYiajbKdO4AXNwhhUITp4KjjtQLIPrue+TiuPNt9/pVUkO5kQRY7YLI
	 8fI3pG03j+LHA==
From: Vinod Koul <vkoul@kernel.org>
To: broonie@kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260223150256.326143-1-rf@opensource.cirrus.com>
References: <20260223150256.326143-1-rf@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 0/3] ASoC: SDCA: Initial support for Cirrus
 Logic CS47L47
Message-Id: <177200629425.33527.1254816462081543618.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 13:28:14 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 23 Feb 2026 15:02:53 +0000, Richard Fitzgerald wrote:
> The CS47L47 is a SDCA smart codec with UAJ (headset, jack detect) and DMIC.
> This series adds the initial support for the Cirrus Logic CS47L47 codec.
> 
> The soundwire patch can be taken separately from the two ASoC patches;
> there aren't any build dependencies.
> 
> Richard Fitzgerald (3):
>   soundwire: intel_auxdevice: Add CS47L47 to wake_capable_list
>   ASoC: soc_sdw_utils: Add device info for CS47L47
>   ASoC: SDCA: Add CS47L47 to class driver
> 
> [...]

Applied, thanks!

[1/3] soundwire: intel_auxdevice: Add CS47L47 to wake_capable_list
      commit: 4b8fc2b17272d4379f3c80cee2d6d8b7d998fa8f

Best regards,
-- 
~Vinod


