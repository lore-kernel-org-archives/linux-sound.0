Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480701;
	b=5gg0hgvrD3i05TinbAyYYi1HRfGHRH97/vuDhyE5DJW/aAA04a42vhVtQ8E460FeeDJx
	 eiaBJygvAReE52TxifxW+QMm2lLgtavh7YFP/Zsb9hkDjup0BQUvZc/I4g+tmUQr9bOXi
	 YMZv/lb9vrXOIz2vMEeSfj4rb613xjYHdT6cuV2kUG7E7USD4aobjBg3ZDhKSBzjfVmoy
	 6nFGTL+kb1zWZNsRyOhcyAYok+yX7ib5WWl2EAIenKe/UWS3BHSAYaqtFaYqbfUbgorxO
	 WKCggSZ/5m9CzDmWWn07Pj8TQae35/4ZrxLeY6eGIti7wLsyINuoWhuQjaw2xGAFcJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mLcphuAq8INaoOM32yO8l0pyjtB9IUjLkKU7NMxP4hU=;
	b=kBFWPCS+O2ht1mv/BFNXgfZPyK8mTm309I9v/X4REFWVbrD5glMp5tu8xNRyzfjhV5mt
	 MuL1jl6czuJkADxkLOuir8UNQXGIV1wYUoKWQmqzpl4fCf6qxIluLr+yHKCSqI9sXLuvX
	 vllRywIcc1sty01uXZNJtJw61aevs3AvuzcDUXsYv+qYDsZe3z63mopC2kooq+FUbmggn
	 Dvx6y1HJMJU/a+xKBfzqxLvi9l4ad4V8PuNNxRkOQ+h8mzQdG3RDgsy7oejsxiFyh+5Gz
	 1qoEWDPVPnliDLBeSkQitvWtkTpZzgqztdM6Eapy/NRKnnn7IRPWxCDS750+67wI2EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W5Hzdpnv;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8F4606A32E
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B8F4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W5Hzdpnv
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f6295304dso4828944eec.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 02:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480701; x=1795085501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLcphuAq8INaoOM32yO8l0pyjtB9IUjLkKU7NMxP4hU=;
        b=W5Hzdpnv56xnGSIdF7f1NnPQkvWUeCCH786P89ze4pD0moAfYHx4RmVKg32LSkXPXT
         TNv2v1OmzKNNKKxh0u1IZHWkUvYo3XGEEFtjhWl2P3o7VeFSKMj64vXsp2WohnuhFv4I
         8JNfsE1vani2GhMRVyuwMWHDrAKEtyM2YYv0K47mj4qF6mBlTF/3iLMg9EuvRrE1YBLG
         W8ryjjzKc+mM/09CPYIrl0mPiUsaBZol5cZe8IyuxH2958H0QJo9UKAaqUvQP7tmkVct
         RHdm/5HSftbtPpc6Uprb8y9mz6UJOJ4h+zyBQS11yctNta2Lv0z5ewB73vq5YMi/35qw
         sKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480701; x=1795085501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLcphuAq8INaoOM32yO8l0pyjtB9IUjLkKU7NMxP4hU=;
        b=K1Ve6D7w6U4p4tsfn1SCeXL5qwLQ7CkKFlEJpjlLw4OYh6XmZbMuHB3Zxk5X0ZI/aX
         oWpGU0Bj7gV+ANaRPSNOggXFCeQDFk8Ijq1bCEuAJ/lZ3jH5UMi+5NS3GDuTOdruP2/B
         Vwmtiz2vE8dItqzlKcrfOVy1JPSG3BOyzsULSmJbS6pyiJe/m/IuJufMKikkc/iTJm0o
         JqHAxrGCMmpEwPGFeszzjjTEQiTWM8KCMOcKJDbu1QljR9rDKA1eAXtTG8IS28g6zA6/
         f3++VHJDjmrqnDztenK+tZlZHkYZY1stmFsViiORV7vtVOYdCFxFa7EiU3k/qHAIhEWH
         SnKg==
X-Forwarded-Encrypted: i=1; AL+hErE8mz4gWE1y0N9lu4rj8evmo/Ti/VM2PRiP/vKOHsnEkrRTNnlfKLDh2PGAj9PlWPsetp1W4jKV5DRXog==@vger.kernel.org
X-Gm-Message-State: APuU4Z9EJktm9nfvPMAGB8iez3DT/fThaiqXDBLRkPYzBwcvsKzmUYT8
	IXdmc4m5Bu6mNg6vm8SkBbSvGj0quzl6sIeN4CaqH3bV3WC7zma6/XV/
X-Gm-Gg: AYBFou2/+jyJV1rP/d/RmmW/q4bEYublbauTQgyf1+yEz8gCdTV8umm8TYQ6AIKvVbh
	4ujd6JWCkAQ9NMBR0B7f/p7DRdjELAiZ1CM+2N5NEV4ctNO/r8r9WDxB9Tk2MfQ1Tb4kUwF+KPL
	NjF3ra1OT8Y1SBgs0prKX+PbRkH/ZwcVuG1W70SJ6VV5b88zigMoP9EGSArrZtKV+cfv5RCicAC
	IbfsdHjwjeqS5yQ7LxYxqkdFwb3N1L09np6eeH3KcY6neq4L5h+kuu/hnC2ZCKwa8uB/0MU8jQb
	sWoLsR7fILqGTxYwpdEcm9YUvvGlEV5Y3Gw1kxUf/54apJfUw2kOMqvYWwGSZZOb6w7gqKVcwDJ
	drtmSGgdE/pHHKC+hx+/MFg/SpJiIDJLgPR2QT13NQdtve7hjdVSifl9BTIjgnKzB4DBI5Ex86V
	WUUow0FNHVR7roF2KNbzEniYkcKA6tURsXjV2t6xRoPMGE6bbVGMUXrCuUI6xrzVvQZbNYO0UuM
	LPtX91+xVpfu086a0JI9nYwcdbzU8Pjsl+vyaFkTzX92kYq/SdsXZVNeLZTX0ZRlOFaH6UPCks0
	NPuPVrbTuda/ngo9eV0v58TUE2G65OPCO7taukt4lcWBYHVNngoczZXqMFWMuoVR5Sye8w0ChzN
	QFKgYg3bT68O9tDt+ZfhAutkR+vVskq1AIrZ7rn1M4KZo
X-Received: by 2002:a05:693c:69d5:b0:376:a6d7:8f60 with SMTP id 5a478bee46e88-376a6d790bdmr5227192eec.40.1794480700454;
        Thu, 12 Nov 2026 02:51:40 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm23047232eec.9.2026.11.12.02.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:51:40 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/5] ASoC: fsl_asrc: Fix handling of deferred spba clock
Date: Thu, 12 Nov 2026 17:51:13 +0700
Message-ID: <20261112105116.32274-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112105116.32274-1-phucduc.bui@gmail.com>
References: <20261112105116.32274-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The current device tree binding does not describe the spba clock
as optional. However, the driver currently continues probing when
devm_clk_get() returns an error.

Return -EPROBE_DEFER when the clock provider is not ready, allowing
the driver to retry probing later. Preserve the existing behavior
for other errors.

Fixes: 13b8a97a760e ("ASoC: fsl_asrc: spba clock is needed by asrc device")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 055593d5d37b..c91ffb5e0c5e 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1315,8 +1315,11 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 				     "failed to get ipg clock\n");
 
 	asrc->spba_clk = devm_clk_get(&pdev->dev, "spba");
-	if (IS_ERR(asrc->spba_clk))
+	if (IS_ERR(asrc->spba_clk)) {
+		if (PTR_ERR(asrc->spba_clk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
 		dev_warn(&pdev->dev, "failed to get spba clock\n");
+	}
 
 	for (i = 0; i < ASRC_CLK_MAX_NUM; i++) {
 		sprintf(tmp, "asrck_%x", i);
-- 
2.43.0

