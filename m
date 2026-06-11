Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23683DA5A6
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 12:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179217; cv=none; b=n+azW85pktLiDWaECqBx0UGk6ZZ0ECZnMcw/8K/oicWnbzgcK8VGy4S17lVvhdvU2OVyRiBcy+cI5DI9J3KKWCb6GYje0/tZZU2tO9Dviz/9wvJD/Y1pDNY4ndhMVpxb11zFqVofjw1r+5OATI2uy+SPtxWocrbN1V4Q2V4EwGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179217; c=relaxed/simple;
	bh=T135T2ousfESA3bNeafiimT4AM/ugmZ+8twO+0TNFaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h8BnYhtTOBA1q+LqM3YHbnKz4erNRktHBjujqS+gyJafl/yXGhdppU+gGvUF0BAi1nw4h1gmlfSz2rcTSc1quvL11gDrc1UUj1G+Ic7tmDLvdxNUNtA7dlyS87nMjQ+432FLvi9iEydkqb0UJcZ+Vw3jRHYbOjsquNmXDkF/Ias=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCdKgSqv; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCdKgSqv"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36b8e1760ccso4965519a91.0
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 05:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179216; x=1781784016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xq4oipQs/tawo2ipLODgW4ega1geasVnL4/W6v53ys=;
        b=cCdKgSqvKj0pjGVA0XTdjOVRuI71iQ+DM96v9Y8g8X/fn0mjvaTxVgcZxM5N9uWUyk
         mznAk14/3P1Du1xOUCvoWwesWDuUqntD3nzgm4Xf9gB+FU6EgmXwfJc6bmJ/UGOJy9ZA
         jVI6AS45BqtF1/FwLqbWsP/QZuNNmj05+qBg/eUTwD+iiVujCnPIKAFHLEIFlS1luukM
         jWGWRmJi9BvNMGrJzJXF6o9L2Eqv1Mw2pYcq1aBR2kVXYYP0+fh5mJ3GS/JS/435LRAJ
         QbNHDw61al5p21BRVzHtBzUsk6HHnumKqBgtg+WYC/JIeCgqPb/gzkLVu45bB+j7voa8
         4Wqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179216; x=1781784016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2xq4oipQs/tawo2ipLODgW4ega1geasVnL4/W6v53ys=;
        b=nsOauSbLAVi+M5F7hoh3iIgECTHq52J3UpV2ix3m2OTNF/ogYzFTPLDZN4pmhHTfbH
         TffuDOULEr6/RVMdU7DJrHvw6AaWtzcWnoe3XPeSwnliya2fxQKFMKM70u8fLpZykhNJ
         Mbb2sVKyooCsjsH1cjNwQHQXqXMhdIih3gfwoA7tZpekVtGbtfYufBeTDiUekyPR1lA6
         oQ1bPKiJn/shvp7RM3peqrybE1M8jpvlbgS0uRKB6fC3T9t+WHcokrN3ExuEI7Ngjh0w
         WDC3G8sJPIbilx6n2k8AwHKPFmEMa42EhJmZ8GZIQ5FiFMxj65/2a0B+vknxXrUju5lg
         oRSw==
X-Forwarded-Encrypted: i=1; AFNElJ9Hq7U79s8AlVpcJrMqHO695/836q6gQbS82hY7jJLLVJsVJY4sMnEeMjHJxM/nAGmKAPSGg25s8r34VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHTG0DdY7qX0O6ljl93GM075dzESFlgRCdMpPzx95Y0akNyth7
	d98JMhFcGh3lMcs5ISHoHQM2sy6tK79Md7PEN+h6vb8+geYz3/PnTcTm
X-Gm-Gg: Acq92OG/AXhhSMgwfQ6wBNu1ccbMNeqASPbJL4RV3PUVuGDXUWCBYHDukb7GHKAdeMn
	pdAlTtvM6fNApc7ie8uMmah1MBK9xfPlW8dawaU35UMAMSTYKNujN0Xfoqhmv4Mifd9KXq/0V48
	U4WnzCr1OZre8Y42CblDMGITjX9+lstPhZSMp+ZdO2+UrS+r2dMlDvSeUfIKS/lS65PA9e32Vbh
	lILVFOWhboZUZFrcxDaE6Pj1lhX2CUzFa1a3cvoe5sER3pf2qccRGbco/U9jBHnX10Up7VGVyHm
	3EboTQMtWNL28eL2+RWMEi6jUY4e5T/b6dGkzPUaKOpHwy84i3W80FtIf1yRB79WpKI6aOIhJq+
	DVHGxDFMCFwMSsvAqed/4w/YG3/sw+4vt3JvwDe+KlmuZLN8iHzgt4Z5OunmVUle3KDK8xZQ9bu
	/dNhjVEnFDGaqmHdc5vOQCeWkMQOpWLB16EUDQ7NkfSOC9ACfyiqZ82Lzm5w/e2p+mYWWm
X-Received: by 2002:a17:90b:3d90:b0:375:2a38:1d40 with SMTP id 98e67ed59e1d1-377a78ac8afmr3041481a91.20.1781179216186;
        Thu, 11 Jun 2026 05:00:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.05.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:00:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 14/20] ASoC: Intel: avs: apl: Use guard() for spin locks
Date: Thu, 11 Jun 2026 18:58:55 +0700
Message-ID: <20260611115901.80438-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611115901.80438-1-phucduc.bui@gmail.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/avs/apl.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index b922eeaba843..e92a6157fed1 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -190,7 +190,7 @@ static bool avs_apl_lp_streaming(struct avs_dev *adev)
 {
 	struct avs_path *path;
 
-	spin_lock(&adev->path_list_lock);
+	guard(spinlock)(&adev->path_list_lock);
 	/* Any gateway without buffer allocated in LP area disqualifies D0IX. */
 	list_for_each_entry(path, &adev->path_list, node) {
 		struct avs_path_pipeline *ppl;
@@ -210,14 +210,11 @@ static bool avs_apl_lp_streaming(struct avs_dev *adev)
 				if (cfg->copier.dma_type == INVALID_OBJECT_ID)
 					continue;
 
-				if (!mod->gtw_attrs.lp_buffer_alloc) {
-					spin_unlock(&adev->path_list_lock);
+				if (!mod->gtw_attrs.lp_buffer_alloc)
 					return false;
-				}
 			}
 		}
 	}
-	spin_unlock(&adev->path_list_lock);
 
 	return true;
 }
-- 
2.43.0

