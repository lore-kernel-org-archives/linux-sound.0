Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3856E2777E0;
	Mon, 24 Nov 2025 10:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763981368; cv=none; b=HeUOIPuwKCnF+7efRZJm+DsTWRRHzWl8qZ2xUBsrWlv7xV2uRZSmWPfLe4p4eLCUdmmqrhk7q7uNdXeTVSS+aSdsgitBeks3yynzlZvgMHkr8t3T85eS0IrjT5MXLBgQhJ5hNFnSVWMKp3i+Yq7+QmkK+R4NomQ1t0UUv+JyAf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763981368; c=relaxed/simple;
	bh=cbeqF8oFwmZ1Uc+czpeAXW53ICGn96SkCpKe9/prnjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XeK/HBJjal4Gtg9G+e+2nU5qSSJDmNQ8HxCmhr/+MSGdEJ74EhlbWXWfaNhl4IJEKPFGTtsrEkQYEUzNzPGKpBA6gZ7CBWHjJtL1aSuY8B3bPfSe7nLaiSlJf2fiVoZgv15SHJEES4CdHiDtstKGyKXfd/9RLtb62c5g/JHMO/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANHgRORc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANHgRORc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFAF6C19423;
	Mon, 24 Nov 2025 10:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763981367;
	bh=cbeqF8oFwmZ1Uc+czpeAXW53ICGn96SkCpKe9/prnjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ANHgRORc0znhxAWTUmIdwn7/2Zft1bI1iofn7sFUkK1HQf+Gmm3oSXL8p+r+BsnsH
	 qjH/tKOu5sK+/x7pc2peGPCr+ZU1Q9ODjabLXJmVOaL6hXRPjgfd8tIdhgAeRHFFzS
	 InFTllqptHaQet8gUeIQkj5cBn0Trmymt9n1bIfSvx8cX/qm+vZmsFxUk7/UsXNAnP
	 o5l/RVHATzNF2l5a+75rNUdNXUJrfqxth7sG8x1v0k0TwiJwsjruLGqZujTS8cO8fS
	 kXlqRN51eOR5aibqxiGQk0nnbkQB6VnR5mVZUvaRav6hczNRYj687hQ4wqWABoUPJr
	 doeICxLl8RXAQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vNU8N-0000000046m-2Dos;
	Mon, 24 Nov 2025 11:49:27 +0100
From: Johan Hovold <johan@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/4] ASoC: stm32: sai: clean up probe error path
Date: Mon, 24 Nov 2025 11:49:08 +0100
Message-ID: <20251124104908.15754-5-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251124104908.15754-1-johan@kernel.org>
References: <20251124104908.15754-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use an error label for deregistering also the PCM DMA for consistency.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/soc/stm/stm32_sai_sub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 5ae4d2577f28..450e1585edee 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1716,15 +1716,15 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
 
 	ret = snd_soc_register_component(&pdev->dev, &stm32_component,
 					 &sai->cpu_dai_drv, 1);
-	if (ret) {
-		snd_dmaengine_pcm_unregister(&pdev->dev);
-		goto err_unprepare_pclk;
-	}
+	if (ret)
+		goto err_deregister_pcm_dma;
 
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
 
+err_deregister_pcm_dma:
+	snd_dmaengine_pcm_unregister(&pdev->dev);
 err_unprepare_pclk:
 	clk_unprepare(sai->pdata->pclk);
 	of_node_put(sai->np_sync_provider);
-- 
2.51.2

