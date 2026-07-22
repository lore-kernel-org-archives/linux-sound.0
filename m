Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07859443AAD
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 11:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784721189; cv=none; b=ff+y0u2IccDVDCBup50w8RrhfTqHiIbhb/QaIo4d4qU5zucewllm6qJSt7c9JpmaDLk4gvB6d1cv4/SCjcLm7JKKX50nASsEl3WcPvpOivbQCZZsD54dYIQaf97jm3KQVwsVaN+Ffu+OyfHfJE+J9aP5UgRfarzbzvnCXt6BXQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784721189; c=relaxed/simple;
	bh=ZQAVPwSpl3VDjI66z0UBts+n05kZOufYw2+A2L7AmPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZezKFLR7fzkefmviQFcVk6RvVYaK98UK+r6gCijEf4MuUxiFOLycwZMuAW/U2tlPf7CWurLkMJllgXDCUYq92X1ew1iXmbefoHUSvu/NRRTzghImaQqybJy5mLWtYKeMrI4T+YvjtV+AeG0dSDILUME9G6Jno3rbzLpxEzGX8I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgDrVyJz; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgDrVyJz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cad4170e8eso177653265ad.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784721187; x=1785325987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Torbo9QkuXmjC9uhqrdt2cyIRnXWvhPFN491HA78teQ=;
        b=WgDrVyJzEJc6z/oyJ2/YhJIMeFgh63KzD5dcZljqJciZX24YEYotFWCYD8cYYyFINR
         DBWDyqbNv4dvlcZKdHzFRbKclGszGpVq08npKjtOGW1DwWfp2iTlD1CTZUT8z4cQpxI/
         RU1Hc89u2EYHWpns8kpWwjyI8z5zW/qU7lfC+9kN7Q1vqsGSgYNFjcpPzmchhLrZwzIY
         7BGFf1XIpHxKwq7+XG4qC9HfUv3HF9MJolnnWTp3All5gd7ogXB7XXt/p21agq4f6q0F
         QwDbdICoU4rBhWJ8/iATMnl4ewCTOPEBk9ysOmqm0DGkYLCB2l0j/6Jka8WtNRzCJlxR
         CsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784721187; x=1785325987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Torbo9QkuXmjC9uhqrdt2cyIRnXWvhPFN491HA78teQ=;
        b=DQTdcIP+S/Sj7OJWGBfjSnGET+S25xC5ETNCbJe0J161NT7QeYpf6s3xZK0LEnPdKG
         fQM0nCrixSgdsTaS9h7IAhg3KPsyBCHf35dbjECGI8dH3/zjTaL4fVIvJS4QP6xEyl/A
         EUB8PhM0uYeRRozAnPonZ4DOmEgWwlMxmILyNsp8W4bfX4ntcFW4wxG5bDdnb1R8uyyI
         kALGLH9NhyMwSqkXO2qN61RrxZkhdD0H/Go9PA+tElh/2W3Yc24QH55poqgxEhyc5+nn
         Sekpstowv5AQAyx9O9yhpf5KAQ89s/fAJ0x+cgay64c7f/e0OVOrVCdwhRar3HAhBnIY
         5ccA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9zQjOFoPw6Yd2gcerLLwklEfLTmIAE6tX0RJNc1koHF+t0ww47lz47s1neKLPKPHJ4L2eXX/qSTfzcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7LdRMKE/twfwr+z3toV4TPK7YqNp2MxKj2hTPdxYO+Lq9tcGM
	FU0OIhGo0u9uXFulQM067lAIW++eZ/L+ZjtRKvt+6bcGVZKWcJGyb4F5
X-Gm-Gg: AR+sD11IG6QuDcOWAIR/tNgysZS7ujLKvuyWrnJLlzqSpgUBUa8nsXfQeFI/L9BO8c8
	gDLkOuubsEoM+PjtxzaRwzr78i/CpDurSGNU6cDHlatMt8GY5hi8gNg7i1kNfFFJt1NjRpj2vv4
	IMjKgublae2O/FVsfvbuslAngaoLUxOoTXCgx33sWt1uOQmUxmMewrJbHkFP+CICXRkz6DWuumX
	BaWmiLejOaIYt41xDxwktFyTdryIEKe6eIZwWvZlE+PK4L2CT7fjsGQjmYIXxSPEeJXOsIeLsYV
	+HbUiY6ea65j1WFAkYQHaf6lT09UEzAGZ50lsPHBiAtXqdzfgUen7XG1uqTy46FjxzPCrBMUa0X
	lSQLtqqs1EyKnl3x9pxiAhwxJusThkke52hMzvzaltqaaVWFZbe6+IWhXO+EqUfbdeh2ms6wKEb
	BRYt2lUqqEu8go/15yHYSfMrO1gM/y4vuuzK0b
X-Received: by 2002:a17:902:ce83:b0:2ce:ceef:6632 with SMTP id d9443c01a7336-2cf34948972mr262802425ad.26.1784721187139;
        Wed, 22 Jul 2026 04:53:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e6247sm13376205ad.54.2026.07.22.04.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:53:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] ASoC: rockchip: rockchip_sai: Fix runtime PM state after manual resume
Date: Wed, 22 Jul 2026 18:52:50 +0700
Message-ID: <20260722115250.62588-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722115250.62588-1-phucduc.bui@gmail.com>
References: <20260722115250.62588-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Probe manually resumes the device after pm_runtime_get_noresume().
Since the PM core is bypassed, runtime_status remains RPM_SUSPENDED even
though the hardware is active. A subsequent pm_runtime_put() therefore
skips runtime_suspend(), leaving the device permanently powered and
preventing autosuspend.

Fix this by calling pm_runtime_set_active() after the manual resume
succeeds, and defer pm_runtime_enable() until after the device has been
manually resumed and marked active. Also call pm_runtime_put_noidle()
on error to drop the usage count acquired by pm_runtime_get_noresume().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_sai.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 9a80e120dbda..55d17536c3b5 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -1474,11 +1474,14 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 	 *
 	 * NB: we don't rely on _resume_and_get in case of !CONFIG_PM
 	 */
-	devm_pm_runtime_enable(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 	ret = rockchip_sai_runtime_resume(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		return dev_err_probe(&pdev->dev, ret, "Failed to resume device\n");
+	}
+	pm_runtime_set_active(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret) {
-- 
2.43.0

