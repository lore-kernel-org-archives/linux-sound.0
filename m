Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F32315E5D4
	for <linux-sound@vger.kernel.org>; Mon, 21 Jul 2025 05:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753077575; cv=none; b=hZ2AkAiOZ40bcXUogHqNUBAdonmq6lzj+Tm+F0GAuVDp3WO1e6lJsesX9RT2g7HwHxzvBjd9OeT8l5ZZch34lMb8t9RiRU2kim1T4ls39plWmwDlkJ/AK+Ztj0bYfiHf6nPCT2ER8soQ3ZfgQSyAcaXT72LLw978QXnHUr7p9/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753077575; c=relaxed/simple;
	bh=oMhcXGuT9/2beocM079RxfgIJSKCLD99Ob2HBGoJrZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iHloAAL2vG2iwzj2XfSAAAXct31D6XDJOuJYPSU2ZOVuJ2KfIv3b3BwZ7AXHytMfJA6LrgMFNZeH0utsJhmG16geAkYHYQpAnUv6k344Ya0+aYIOBA4WJLPQkzm4Q1BuOIg0qrcHr/wwam4xCtLX2ligky2VwjCC7kxBh76V+Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AsIzultg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AsIzultg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943E2C4CEF1;
	Mon, 21 Jul 2025 05:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753077575;
	bh=oMhcXGuT9/2beocM079RxfgIJSKCLD99Ob2HBGoJrZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AsIzultgRskqxNOk9mBTeRkFFIlUOp0nQWBkHme6aclQcXz6liwiIpQ8svEdTLud4
	 8vzFjiYIaN8ul6fAJs9+AjuI75b3gT8AX/Ka1pLL4lLQlP6s18/814hSxNAw8UO5Op
	 fNtVPj6dHCspaaR1ChgAbGNRRO4HsEpFPH2IPJDdLW8MxPSFueUKlV/shBCuuzUDPP
	 wVCTiYwLmUyeOKCFhmrQvBu69u6oYI0RhSWAb0Ark7hnRCCBsxOn4q/7m9kI8l424A
	 dVMPGP5jM1L37vYpw8Hsb7FA+KIanIVh2OYBPKgzJweOaj7Gxhp2O1hqfCsp+GQA6I
	 vSUKqpd6PkUaQ==
From: Vinod Koul <vkoul@kernel.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: linux-sound@vger.kernel.org, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, sanyog.r.kale@intel.com, 
 Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com
In-Reply-To: <20250715121048.1795607-1-venkataprasad.potturu@amd.com>
References: <20250715121048.1795607-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] soundwire: amd: Add support for acp7.2 platform
Message-Id: <175307757223.149817.7544383288595418190.b4-ty@kernel.org>
Date: Mon, 21 Jul 2025 11:29:32 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 15 Jul 2025 17:40:41 +0530, Venkata Prasad Potturu wrote:
> Add soundwire support for acp7.2 platform.
> 
> 

Applied, thanks!

[1/1] soundwire: amd: Add support for acp7.2 platform
      commit: 34b1cb4ec286603127aa8c4191ea527eb8dd3567

Best regards,
-- 
~Vinod


