Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0B532B9A6
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765878128; cv=pass; b=hiGpQQ21kXA4aAFWLt9cbwu2se6IfIeRb1RS+gJVMvYGVpcN+7vNs3+F0AwPNfIunmBIrTFOVdBqtvBKWTZWXAeOC+rqM8V2AywXCDO4tN435cEwsTLrpZBtL4aOKgVz7fk7eoNKQ0kRF4MWRyddGilvmcEFtrEK/nijCGPP51o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765878128; c=relaxed/simple;
	bh=+mylLywfMtx/A6KnL7IDk3bF2gHYvDmBTld42lZ7fzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X71g3CkN+jWTwQ2eeq7EB7DqbOUTLoIeBGPx9LDFXKfKSHIlMuzO0eXwU3jiAnsjdxHF2xWk4ig4BkRZixMuWNm6gdB7IHHIDEzs0L7f3RbmITyU2oXKoZ9uryFsWWUl0u+INT0Ea+tmbAkLDxx7hY6VoAgb8s5zjsmZtsrAofM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=VVFjCZRP; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="VVFjCZRP"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=H0wusYeRkkyb8iOZIgXhqUDB7JtUhc0EfBn0PFTaFSI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765878061;
 b=FTrzAApq1hS9izRVLAYGjJnaOkelTbLrNu1bqRp00Mrn/DSDTsXNVm8JWjhqZf8fP8AlrJkN
 de7aRxOhuOO3s4jP38k0y9B7vsWfu6B3QkYZ3nlu60mwMLQ26dJu3Ko7qjFBqxMIAUAWGuQcReV
 QwAQCBc/odx7vzwclhqPNfOcpiLd/EvPHoUVAdqYmbHaLdQSaAomeLwnzkF9UFwDZZnsN0+33mT
 WXrKtcB2RsrZjX9uOaJcmOPBeD+gP3fDRlZ29ohKHqZly9s+Zgu4OMDh2AlJdqCmXOLqD+B59BP
 u/rn4bHphOlvv1Gut8nOy8ovBnhJu7NooqhiV+wxOMTbQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765878061;
 b=IT4I88UiJYgkSlmFjdOfjB7RCTZxOwOY/XUIwDEJqWQvsfyXMPiwms4NVWb89NoAveskLinV
 gjrNoMIISYPEZEEWR8QkdYcC9BuDE+YBFQ6gtsDRkBMq777YENG5uuV3KNXh3pF5YhgzZNgrGlo
 h9ug06bk8O2qTY1EcvLrFGxbadnsaxqF1+FmwHm76XNNvB7xQ4a9arAnXMtohLr+3b4UPZMOcL+
 b1jlfQVyP+PnJ4BEiMNUm6wTqOzpe8MSupAMkV+jKjWPG/5WKYXPVF37QAMngENeQjlcPlPTskN
 7sfZXd6i19zb1r9Qkvpjcgij5S3iDy+LogG49VmkNk+ng==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 16 Dec 2025 10:41:01 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 15C625A0FA5;
	Tue, 16 Dec 2025 10:40:50 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: fsl_asrc_dma: fix duplicate debugfs directory error
Date: Tue, 16 Dec 2025 10:40:43 +0100
Message-ID: <20251216094045.623184-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216094045.623184-1-alexander.stein@ew.tq-group.com>
References: <20251216094045.623184-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-sound@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dVsPG5yK7z3yc65
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:56692679a5c017f375512da0d9446da1
X-cloud-security:scantime:1.918
DKIM-Signature: a=rsa-sha256;
 bh=H0wusYeRkkyb8iOZIgXhqUDB7JtUhc0EfBn0PFTaFSI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765878061; v=1;
 b=VVFjCZRPRQGcOwboS0dioFL+yUN6+/ZTWnObeqLtabTwWVFOAhkOYMupVcexJOoZCwaTppBK
 GgYiD+gWFRzyhCh91BQsT1+HbEx2PdYsr6AfblIumPNyu9ZVV6t4BJtDvhTqDxyQuCaOC4KoRtt
 RwPseHtPOGmw7hveGpeR2mI/9iJhAwkQTfhutFXEIhZZga+Fq/UkiWL/eNIa7AxhkF5IL/rrfg9
 XJyPfQj3rrt1GLlakKiGIzsWNdKiF/xA5bMd0EO3fWyor/PB57ebri45hwW4IXi75QIE2L6KoBW
 OA61kewSB11lNsnkoWDlyxmnGQXaX7FNigjmSldAbHugA==

This driver registers a component for asrc. This is also used together
with easrc, both attached using the device name as component name.
Eventually debugfs directories with identical name are created in
soc_init_component_debugfs(), leading to error message:
  debugfs: '30c90000.easrc' already exists in 'tqm-tlv320aic32'
Fix this by adding the debugfs_prefix.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 1bba48318e2dd..7dacc06b2f02e 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -473,5 +473,8 @@ struct snd_soc_component_driver fsl_asrc_component = {
 	.pointer	= fsl_asrc_dma_pcm_pointer,
 	.pcm_construct	= fsl_asrc_dma_pcm_new,
 	.legacy_dai_naming = 1,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_prefix	= "asrc",
+#endif
 };
 EXPORT_SYMBOL_GPL(fsl_asrc_component);
-- 
2.43.0

