Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E2D2D3220
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 11:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399917; cv=none; b=HII2DcoPzpZ7ZRlUgfXGwMs18qYHzxMBiYlSJfYksDv0O1db1y1PKbObCdwwRBlCpqJHqa9zJXqxPdt6e5+3j4jo+GBgqFmQQ/nvPO0GmOj5tvOiHjwCZZTwX6dht68lVBk0Hx30IuIllphXMTLyjDclhacRbjzpA+c4LpcaLHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399917; c=relaxed/simple;
	bh=y8QJMUL8+CtpEfhCqN4kGi8SafddGMRLyBk13xsuhPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ImOcZglw6ucD5ou/8NFiX93IT7VrPFrPM0jg1XWQ9Hil/x84bOSW3qlDJqYFA2LuT/PUpcw0rDLWMEQEu8ShE3rEqORaEBeAQVeXYGwRFeLijS099Fk1NjgfTm/NdvG6kyb71B96Mhi3IkzuC4RKPST3RBSOSbPpDNiqg+F2U7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+L+tPsG; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+L+tPsG"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so1587604a91.2
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 04:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780399911; x=1781004711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rVXTLc2CkVj0LT6iBpJofb0Ww2wTBXQmu/ysCtlatmY=;
        b=L+L+tPsGKsXwaJwdGskyo3Z3lWm1G0Q2FEKIFChex1i5Npipk9PhYj71iWSatUS56k
         VFbqZSOakBzKDPGwADJdMsa+amx9U7eXVhSB9AWmYQf/mBENkebc+AD2u8nSHuE0Phuf
         X44vrcFu1YivkRjRofvwWiRoR0UW57ZCY3zTM1nh2qrjNLTfMSk/MMltkenhx/q5ffNG
         SnYT0CnMUTQAyjVr6CSJXTGyv5P1Ne8WXnXaYAhTm2S0N8u1XceO0yTOkkGoAP1gc4PO
         tz6M+85XEKUBsmif+AD+TE/MgNA1SU7oxgo2fJOPxwIIbxKPTKXJnnNOOSMhIKo9MAWm
         1f5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780399911; x=1781004711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVXTLc2CkVj0LT6iBpJofb0Ww2wTBXQmu/ysCtlatmY=;
        b=dNmtsUR9ONsHQsT9iVcvI43xK2bi1q2OY/qv49PdbZmHCB3xc8hG7bqlcsthmOOReU
         7z5doI547OHSVDx4BZQJMNiA+ZxvAh1A3I6NgbJK2fwS8lb4Up+GU3AKaIxhofA27gav
         UZMh9jSFZiSHgP6KmQRYRmZ0OKEB/vuiSMO8RjDpFSAMe75HbOCxnggEfmD3BQpYrLdH
         TSLeVi6okMyV1yzBbqdiyMZcWF83YhticyG6fxA5bKERDe1gMnb8Jdgef1Uvr4IbSPps
         RxuDqAoNvpCqKZ4WUlJdA/5ny5sXlPk+fCfEoDxqaX0INPbPrcMCLpJYTG6xOSPPLR1F
         VUhQ==
X-Forwarded-Encrypted: i=1; AFNElJ9HBF+9L5r6SJ7RWNrW8Xa53Z3Qc4jgKJWL3Ov7aOzHUIbipPuP3hzKvbSB9YuDczvT+ykNgrxPgKa/pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDikNvlLwxhaUa5aPOQBn5ZFMu5+AcevUubay4pC/+iM53eHTG
	tOW4gK4mJ0oeK5SnvN7QmqaxgI/mnCnRAirH5kKUSr7GfShbLai9Ctpm
X-Gm-Gg: Acq92OGRBmnUsji2vfjuu+wBMWKfLsDtLOGAl+L3ZzkEEzn9ute1xgS1s+RpIyI22UG
	IlOSwoDDCxlEhqg2bgTwti+f6pPk9fubrlBSsh6QHOwGm0yErZUcLHrFMddluW8JAuALaCvwOwT
	vm7RWzJeHLaB5ctdn8gdomYC2p25y/NxsEK/+6SdcCmmQq/cpuROBx34/OnSkmogsnmR+VaAMc4
	8GBjUfBfi8l2Y4XVLLn58LlV23ku1EnldL1B2IfKBcBJzrxJjH6B0wttU7yNZXglEdgpejEplBU
	pHkZg+S6g5vnziuUEZd4V3RD1ELoGimxgYDHOFdqLZfgzn8bOBjX7BFAE+jCndlfGv3oczd/PNT
	grMsnxNsK/aDHRLwu38ya752LzawbuLsvxBmF94FNTvl7EXtYgQN5L2dfJtKd/EjIt3zQUYJupm
	XcY0c3G7TBYbUltd54uHqshrJgGmckVCKcN3xwh1Gmq6k1rFvyl+mKYF6hfvIIu8eSsAJpN/mLk
	aHjxFU=
X-Received: by 2002:a17:90a:fc4c:b0:36b:e109:1e63 with SMTP id 98e67ed59e1d1-36c685a8f89mr15745380a91.27.1780399910741;
        Tue, 02 Jun 2026 04:31:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91820e6sm2617126a91.1.2026.06.02.04.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:31:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ban Tao <fengzheng923@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] ASoC: sunxi: sun50i-dmic: Reorder clock enable sequence
Date: Tue,  2 Jun 2026 18:31:36 +0700
Message-ID: <20260602113136.49494-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Reorder the runtime resume clock enable sequence to match the hardware
dependency and ensure symmetry with the suspend path.
The bus clock drives the register interface and must be enabled before
the DMIC module clock. This aligns the resume sequence to be the
exact reverse of the suspend sequence.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.
Changes in v2:
  - Clarify in the commit message that the resume sequence becomes the
    reverse of the suspend sequence.

 sound/soc/sunxi/sun50i-dmic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index eddfebe16616..7aff1afdf265 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -323,16 +323,16 @@ static int sun50i_dmic_runtime_suspend(struct device *dev)
 
 static int sun50i_dmic_runtime_resume(struct device *dev)
 {
-	struct sun50i_dmic_dev *host  = dev_get_drvdata(dev);
+	struct sun50i_dmic_dev *host = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(host->dmic_clk);
+	ret = clk_prepare_enable(host->bus_clk);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(host->bus_clk);
+	ret = clk_prepare_enable(host->dmic_clk);
 	if (ret) {
-		clk_disable_unprepare(host->dmic_clk);
+		clk_disable_unprepare(host->bus_clk);
 		return ret;
 	}
 
-- 
2.43.0

