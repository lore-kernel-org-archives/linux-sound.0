Received: from mx-relay23-hz1.antispameurope.com (mx-relay23-hz1.antispameurope.com [94.100.132.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04739314B8E
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 09:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.223
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765878128; cv=pass; b=OEwSb2CUF9IN3lNndhzckci4dZlyP8YMbYC07OWlrmRYhU1aTRdRaRntMOq7zfqVkmU7tai21HR7Ckq4SM6u4H9B0LAT2bel6X9jQMrUciaSS0zIGnJDudE2GGw+8tVlcnUYmZbOO/IileBjP0S840tbjjBU/i+k5LdBJCQdg4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765878128; c=relaxed/simple;
	bh=uibYHSJWFCRLQIb+K6fDanv+zDoAKhEQYTv0QQNMYmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f65hPpnfD01n8Hf/VwQ8hprQte8O9fncrdCHa+AbVAH3U+bGeWuIi2CyNQQleTvtPCRVTUQJd4CWERxu1KA7WlvRO05PdEovdDQxKZj6WuuAeFdzeJVQ4xmmXeJwJxXZ1oqm8yUn3Hd7rNNZKxrHdYwjA7dI+PDZaGBklblN3Jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=iQrciQWm; arc=pass smtp.client-ip=94.100.132.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="iQrciQWm"
ARC-Authentication-Results: i=1; mx-gate23-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ovoJqqhJNNok/jE+Du/MsX3X1g749zrPIb6xZ7a89aU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765878061;
 b=Ae+TCi/hhJLdbcJORiCAY4UXCspxwcgyVl1w3jGcHTkxzbIN+h/CQqVuyB77sbdmmUuVmqPM
 xjqX91h8O8HY6Y/NPR6aKE0EIl+L8vzJtqwUTR4oBdACAGoe1Wy9slf+++q6MOJR+pgZLMsnzMa
 ghO1QoFtZn+PW7N63GkfQDuEsHqypMmNCf5ZyAI9sFX592xmh+FM1TGX3vITWk5XxuZwPz3uMDC
 lVl7JGwZ9XQKI8cT0TYT870BFnUfs1711hQ8Sm+0vl7t3X2pVsy0YPvLWiWoLXNh4P9/BmbqG/I
 ZYZQlxAVQt+NmFbBEDMtsiyclGqc9qQiNCg7sTdw3MUdw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765878061;
 b=dNp8Pe860CuqAowztu2baduNajAl91igpQettFSU8ZOGV4wk9wPxOkKO+8RsB5eVm5QEScFf
 +aPPmPE6GhGixYJolD0/8bcjoSpJF6xFML6MMDsPFyGrwhcGPdsTE8Ooo42zOnKYluM7m6KckwR
 VQNjcHzcLFwewLwVz2hXLs1riCaJ1kc3qNyuJca9K2mcP7qpRwNNVsH9Fi8twBxd+uKq3rpKNPw
 hol3i2vI7RIq8KaI/SrDLYLmj/YTpSsWRjzWLKGq6lEYyeNBMEH06xkSSp6qb5bs6xoEwu+B1VU
 rdta/E/1BzfmVlNNc0tay/0MZLrGe5sGrDMwx8Lhlv9mw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay23-hz1.antispameurope.com;
 Tue, 16 Dec 2025 10:41:00 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 8BFA15A0BD9;
	Tue, 16 Dec 2025 10:40:48 +0100 (CET)
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
Subject: [PATCH 1/2] ASoC: fsl_easrc: fix duplicate debugfs directory error
Date: Tue, 16 Dec 2025 10:40:42 +0100
Message-ID: <20251216094045.623184-2-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay23-hz1.antispameurope.com with 4dVsPF1mXsz4NHfD
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security:scantime:2.062
DKIM-Signature: a=rsa-sha256;
 bh=ovoJqqhJNNok/jE+Du/MsX3X1g749zrPIb6xZ7a89aU=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765878060; v=1;
 b=iQrciQWmLN540TdUSCjDGR+9c7HibQ/AqwrVOi5gIfAAFjCknV5nX9NX+si9q0ZEnvbkbW3f
 AiCp5MVFsJEhC4pHMSWkY5jDPUqUQ1T/6AoH0Rz9IWImtWW+KkFCCxTcGFsxyI0ZmW36G9ec5ta
 x215i3kxMJxqFx9zPn4t+OaSB1EencFeFWzJIw9Tz1vaSeXK1n6mr4BlzxeCbE0ghDtPGxxV7Sx
 qZVyA69usu6ocw9xVBRdlj3U/3SeBheGfXIPWLN4yJ06Dyoulv8HKrQUUX3YnNxvePrLf7dzbPR
 9P3E+22d/Ca2uGAI2W6VUgfcbRAhzr/wKzybcAiJRhAbA==

This driver registers two components: asrc and easrc, both attached using
the device name as component name. Eventually debugfs directories with
identical name are created in soc_init_component_debugfs(), leading to
error message:
  debugfs: '30c90000.easrc' already exists in 'tqm-tlv320aic32'
Fix this by adding the debugfs_prefix.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/fsl/fsl_easrc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index f404a39009e1a..e64a0d97afd0c 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1577,6 +1577,9 @@ static const struct snd_soc_component_driver fsl_easrc_component = {
 	.controls		= fsl_easrc_snd_controls,
 	.num_controls		= ARRAY_SIZE(fsl_easrc_snd_controls),
 	.legacy_dai_naming	= 1,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_prefix		= "easrc",
+#endif
 };
 
 static const struct reg_default fsl_easrc_reg_defaults[] = {
-- 
2.43.0

