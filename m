Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9357147B435
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 19:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933135; cv=none; b=iQu+uSLv3ZZ9kMkpctLz+8dMOM2QsinpObiz/Gwm7Vbc+vVcFJvIAjsZTWQJhP77g3xlRZ3XNqcnjcx26lUlvcly/cfH1ZQlDXAUWl/FWP3MJxTdkHIcnH9jk0lGzPxV74Vx6JAxIqzE6lEP0NfWhYTjCywtiDy4Ql1nGdQVrC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933135; c=relaxed/simple;
	bh=19HvXXEGNkAEh7k742QsXcb6guSh20svj/hb0jKC2xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJgsGbJHy3Np5rF9RAsbAahx5IFYTBQ/ufLDaF/l2//yGuNGEO3H536JYns0MgSM+xHn9x6841ebg6TOyLDJODinHHzIhkbrgGC25jr8siOrSGrjhlDzEMvwEuyq2Z2mVOIGFHfOh4LuXijFdGV3VeW/Q1qoUgO6zzJXrWyvflY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so1311853a12.0
        for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 12:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933133; x=1790537933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7TXkf8HfG5PaX8N7Gibawm3cKOzVqiXxqGBVj7YLTM=;
        b=ZSy9RgP53DTFtXcs7nG8WG97nSTdB5jjT30ewp/a7vkmiZT779RBo1Yy8Oss8EehQy
         Xb0KPb0kiQ+4O2pPCq9GfNoIY/ls6YR+eluRwIDOC9gDFkrk5vIrSQCF+qT3skXYTF3P
         cEP2rh2vPneQL82jwUzc29u+Ne1/UCzl48Arz2D6fVYH733oEGfwyCIJpMI9c7TSARzm
         YqFbrWf359j0HSk8A2+4Qwj18xqATmJ7Azx15uIjK8e2N0swyS6qn3p62WFYHKO0t5R2
         j8CR8Ai1GXGaH+YDnVxXrq+qPKpSJxDh/Cuswqe60QAOrArnwu80/nmyUoYT8Ofza1FO
         O2NQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgIQXK50u/CIhG760fmWpObfCpJBJcIKKJ7fQKRM1Gpgo5hNOnmztpKukQowM9X/Ckn5z5N3oHGpWyRQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l19YrHgBy2L7MND9qpdh/h9L4v8dq5qIckyW/CKCist0Zbgq4m
	Z+kstTSWIi1l9VMaKv5+dJdSxPmv1HzXSwa9nJrtsqsdXoK3BB9uCe/b
X-Gm-Gg: AYBFou2IEni0RytosTOmQnGQO7auAhuyZYVPpb31TCqGAhUPeRdyyI0iJ9Emr2H8nZH
	lGyfK4PDdAm6R6iiabiFVAZFYtO9fN0ZernRsRc/QPKbFsXnDZLLewzGdu0zZYulHBQAUAkOTtX
	EXdQztE9AEpCBFNYBSpFMBdQLrcqLBlxb8RUIpASNQiv3fT86PtrPkbaBon5LY2Pr8GQGdZsvOU
	q3+5htVDeWemOjTpdnrjWbCLmguVDIRp79NTgwqJIkpk95PZO1YMrGwhgKVCPmW46xCjCf0Sd7E
	Nv42pnK2rn4GKEEYeKnHM09xjuiBAilhlu+tXhg1XVFM7wfBh4+9InKOX4KbuadLe/jJ+QX754r
	gdvrsWUTc5B0h1coFpeJ9sySe/1RfoKZRxZKeBHZ5J8yFbjJQZdGEsIyO3TC4ZBR5sgieLaSI5U
	/oQbN2CdaTSpeO+rBuHqDB8eU7HiiQa5d8jTrh2SCRXdzcqGVQ/YQOMIw9cmsFsg==
X-Received: by 2002:a05:6a00:f86:b0:848:76c4:fba9 with SMTP id d2e1a72fcca58-874dbee3c12mr12028698b3a.7.1789933133005;
        Sun, 20 Sep 2026 12:38:53 -0700 (PDT)
Received: from navi ([61.185.198.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9b0c516sm2222132b3a.34.2026.09.20.12.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:38:52 -0700 (PDT)
From: Zimeng Li <me@lizi.moe>
To: srini@kernel.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org,
	Zimeng Li <me@lizi.moe>
Subject: [PATCH v2] ASoC: qcom: lpass-cpu: use DAI table index for playback constraints
Date: Mon, 21 Sep 2026 03:38:30 +0800
Message-ID: <20260920193830.53706-1-me@lizi.moe>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920145848.44521-1-me@lizi.moe>
References: <20260920145848.44521-1-me@lizi.moe>
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
DAI has ID 4 while it is the only entry in the DAI driver table. If
that DAI is configured for QUAD01 and probe reaches this branch, the
code writes beyond that single entry via dai_driver[4] instead of
updating the DAI being processed.

Use the loop index i when updating the current DAI's playback channel
constraints, while retaining dai_id for indexing the hardware-port
specific playback SD-line mode array.

This fixes the incorrect DAI table access for platforms where the DAI
ID does not match its position in the driver table.

Fixes: c223f41c1a52 ("ASoC: qcom: Add four speaker support on MI2S secondary")
Cc: stable@vger.kernel.org
Signed-off-by: Zimeng Li <me@lizi.moe>
Assisted-by: GPT-6 Astra
---
Changes in v2:
- Add stable to Cc.
- Identify the model in the Assisted-by trailer.
- Clarify that the IPQ806x out-of-bounds access requires QUAD01 mode
  and probe to reach the affected branch.

Compile-tested with LLVM for ARM using multi_v7_defconfig with
CONFIG_SND_SOC_STORM=m. The lpass-cpu.o, lpass-ipq806x.o and
lpass-platform.o targets built successfully. Not hardware-tested;
the IPQ806x example is based on static analysis, not a reproduced crash.
The code change is unchanged from v1.

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
