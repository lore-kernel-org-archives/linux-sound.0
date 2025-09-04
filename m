Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7262045B6
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 15:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756999906; cv=none; b=gbXJNLPT4VxXez1q+HmEEy7GZ/CtsF3WiLOBbYMvaa4Cwly+6VZLqB0ArPbDCLmsdj8Md81uKo4NYJ+RQ4dYQSFbV3Uqm9OhH9cIQloOICf4LcXHbwAzfNT0fyn/GpjomIMbpoNdtwQP823KrPwGa0Nqs+EZbFVLx2UdddLp2wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756999906; c=relaxed/simple;
	bh=PxJbES9B72CXWTcXElWyk6d2sXlUTtdrGicVLIGob3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QPjKp5b0kmPx7+AlWyeMJ9i2qlucU0q5YHN/nzshHR4w8yw42KVmkPBchaa9gEcvFJp01ARaEAwRT4F8eQf00lfDgObZHfFKyb1hzV6KvB+ChaDlRXqECfOWJtbos/4JJ5fCPGcD19uKAdQtvnE45+60an2gsuMm6acvCte4zEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BAEC4CEF0;
	Thu,  4 Sep 2025 15:31:44 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ASoC: da7213: Convert to DEFINE_RUNTIME_DEV_PM_OPS()
Date: Thu,  4 Sep 2025 17:31:42 +0200
Message-ID: <0c001e0f7658c2d5f33faea963d6ca64f60ccea8.1756999876.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Dialog DA7213 CODEC driver from an open-coded dev_pm_ops
structure to DEFINE_RUNTIME_DEV_PM_OPS(), to simplify the code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 sound/soc/codecs/da7213.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index a4496cc26902b8e8..ae89260ca215ffbb 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -2247,10 +2247,8 @@ static int da7213_runtime_resume(struct device *dev)
 	return regcache_sync(da7213->regmap);
 }
 
-static const struct dev_pm_ops da7213_pm = {
-	RUNTIME_PM_OPS(da7213_runtime_suspend, da7213_runtime_resume, NULL)
-	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(da7213_pm, da7213_runtime_suspend,
+				 da7213_runtime_resume, NULL);
 
 static const struct i2c_device_id da7213_i2c_id[] = {
 	{ "da7213" },
-- 
2.43.0

