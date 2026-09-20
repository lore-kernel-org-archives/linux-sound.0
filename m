Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9167A3C2BA4
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 14:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916352; cv=none; b=acZ65gMxT/A2NnlWy7q2Ii3ZEt9+JDFOUdHDDAAYnn2msY0ZPXmwELjclKJNBizBTaGbyT4QoBuU6KaJa2IwRgU1X8+yqVZmin79x6/iBa4L4KZoGk8F1JlKXiqcL8G9Tk6r2f2e4MOjw4/HKi9EPGMB78mUMi/PRb/8cN+QUmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916352; c=relaxed/simple;
	bh=LAP0ULfKTLnnxxk5jRZJCl2ZnuH1NUTTmEXPrY2FeQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=homx1eCVyBgc8gQFVayWmgUp7l6OXD8qDLS9llXSH910865XwBKOi8LAAnDECRo9UzCen11BXzvRvGdjtAM9X5GCOXLsbD4CktooBOvCyMR/uLvgwjRgTYkQ0Ag6llNcW3UgGMX3z6+fs5CCDWbsFYzx8bBCeP9n9pDyrtDb6vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3965683e9e9so1737545a91.1
        for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 07:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916351; x=1790521151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TIs0KTLRxVWlJFqStqgAEVISAmza/SPNHCWEVPHnIDM=;
        b=Jbl2EjOMLl28FJZdNuz4soMWRtRYpviCyD/8uCtfmxqvTSAueUWiNc33JKhXenDnI0
         c81ymEOTyBZbTQTgkN3FtgY4lfOqN78MupqOvQ7G3qok8clXm0xmoTVjLiU1stIo4vKq
         3jWLgG0rAree9rMBsILkWXN9cAuNuTPU2a3B5Oi4Y8Tshc0GGFJ+MuhcKBTeNs+ppxRK
         b2HkUdAxKvYvdG3maoJqNc1N3qdMlV+AhzmVE3dSZTCEFt4xRcJSImCWtvtaCRSVZnB3
         wFduB5Oeh2Zk9u81QsQriJsfuOsGAMjoMZNZ/XKZOQ/atxHUm6jGhg7bvRkeDeueIPIT
         VfKA==
X-Forwarded-Encrypted: i=1; AKwUvBzHEzAolkixaYlmUIMT/NHTBoNtH2lyjoOdG33c8f2xjxenzLMfd30gmZvZwlYw6wyKbUqvVw9dDnIGdQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nOAtynwOw45QVJRCnlrqaBjoC1/it05gMdVgz4NgttHCniPyj4
	WMI4Jy15jw+4ex+XV5ir0rJodgqKxBxO0gVt2SCN9lytiudqaDdHs6UC
X-Gm-Gg: AYBFou0+o/FI99twQPgIZy6LKA5UGI0EypohGHC4PPlUerTsgRSm/Z69vBsMTpnCPI2
	hroj8wcOjpDBxl6C9Xc+8ZKmDYIpx4vh7w/F4LAa5G0aQYyBc7UZ4UeePfX9l9rh3QJs05WiUat
	EgWWBbWiC2WjgHJ0cvLnlKGLtHm1eUaI2gOXZl4FHZVMSprYibckkrI1oUTRrqNQgb79Em9dWv5
	f5OdcVznSbCgHGFoUDLNpclN5kWbbDs0etZo407Vk0e1iTSl8lW8lobp6U051O6uidlgYYHP6+n
	W8eHMjVrMjdpS+KDApx+mY8GShzI5Azy1zr+O+oTsCvAZklqvggBUifLVRjJatnmZB2X0VIGa1j
	jbHsrSHNAX+iLG95z0MG26gWeHJNNKLq4blwgKlm5y+jfQ36unrm+f2gug26N72XNuJ49vJYmP7
	+jhE0JTABaHNLofYEYv5s3XUdO1hmjb9LiZP2uMX5Vy9ohnHbxVzI=
X-Received: by 2002:a17:90b:4c50:b0:39e:4c7e:f03f with SMTP id 98e67ed59e1d1-39e54f6a423mr13496217a91.28.1789916350819;
        Sun, 20 Sep 2026 07:59:10 -0700 (PDT)
Received: from navi ([61.185.198.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a04546edbfsm585831a91.2.2026.09.20.07.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 07:59:09 -0700 (PDT)
From: Zimeng Li <me@lizi.moe>
To: srini@kernel.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Zimeng Li <me@lizi.moe>
Subject: [PATCH] ASoC: qcom: lpass-cpu: use DAI table index for playback constraints
Date: Sun, 20 Sep 2026 22:58:48 +0800
Message-ID: <20260920145848.44521-1-me@lizi.moe>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DAI ID is a hardware port ID and is not necessarily the index of
the corresponding entry in variant->dai_driver.

When configuring a DAI with LPAIF_I2SCTL_MODE_QUAD01, the probe code
currently uses dai_id to index variant->dai_driver. This is incorrect
for platforms where DAI IDs are sparse. For example, the IPQ806x MI2S
DAI has ID 4 while it is the only entry in the DAI driver table, so
the current code accesses dai_driver[4] instead of the DAI being
processed.

Use the loop index i when updating the current DAI's playback channel
constraints, while retaining dai_id for indexing the hardware-port
specific playback SD-line mode array.

This fixes the incorrect DAI table access for platforms where the DAI
ID does not match its position in the driver table.

Fixes: c223f41c1a52 ("ASoC: qcom: Add four speaker support on MI2S secondary")
Signed-off-by: Zimeng Li <me@lizi.moe>
Assisted-by: LLM
---
Compile-tested with LLVM for ARM using multi_v7_defconfig with
CONFIG_SND_SOC_STORM=m. The lpass-cpu.o, lpass-ipq806x.o and
lpass-platform.o targets built successfully. Not hardware-tested;
the IPQ806x example is based on static analysis, not a reproduced crash.

 sound/soc/qcom/lpass-cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 242bc16da..079177a6d 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1234,8 +1234,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		}
 		if (drvdata->mi2s_playback_sd_mode[dai_id] ==
 			LPAIF_I2SCTL_MODE_QUAD01) {
-			variant->dai_driver[dai_id].playback.channels_min = 4;
-			variant->dai_driver[dai_id].playback.channels_max = 4;
+			variant->dai_driver[i].playback.channels_min = 4;
+			variant->dai_driver[i].playback.channels_max = 4;
 		}
 	}
 

base-commit: 0ed6f7f62318a581fe9698f8a4e98c7ca01160e4
-- 
2.55.0
