Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3473D0901
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236741; cv=none; b=UaWvIf+KTBpPSOkMjpSDWKM/Oradc2uAdbAKIjgJNUCcXl5KmOMio90bOir6XWNkjryDvr0dP4iQdlc6oIyCsokINY5kTkw8Li4/CcbpcdMdiJdm8HOuYjYr2+lXLkjaZjRItofNkXxT1FNY6mAjPMcIUhquUehHbN38/YdA3B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236741; c=relaxed/simple;
	bh=HbNQyIOQfmtYFfsohHgbl06rBm8HI5vxHjV4u7D/pL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dy0jaE3hiA+pahihHOx6lhFs5WcmJ/C1YewcIl0Qa5n9e2HbQkLZXRl+l9IdG6wYkZknIafvvI1IURTrVnypCA/yWNlLC6AbpLlI5ojp2jl81Jctv2q/PoJjpP2eCgs4Q8u1bp39+vZw36Kl+x1jZem8C8iEdKK7uG57PIp52N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSm2BeKT; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSm2BeKT"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b45cb89f7eso12226985ad.0
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 03:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778236740; x=1778841540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PHyrKnEx3Qw34k80dXVEjulQeqN21vdCRBwPpUnfZM=;
        b=lSm2BeKT660yA44NPx2nyf9g5J5GJHqFaeqswpB/sEFyZ8N2YEHpVxCChnytMoGX8O
         Ewl5Ax9OmaQ7SvJqooq6IrCy6C7sp48KjuWwPDJvh6pRNN5z02PXL09R4uvayu3sKOTt
         FbfqxTpyBZBZLnlTo++wbzbCtkW4iLGFf/O98sI5GEesb86opO+lpF66hCFevsApkdm+
         e06URc/XVDLPE4IVIcmu7pa2YOMWMDsPxCd7s2Do5QZyamx4JI6QBfARjINTJBluuAZq
         iJUAky4HaDwHEWhT4nDQhryTVmssZ7IXie0v7GkKds1QVQUCk9WyoNbmAeOaBdJ/lreV
         HO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236740; x=1778841540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+PHyrKnEx3Qw34k80dXVEjulQeqN21vdCRBwPpUnfZM=;
        b=YW5V0MocLFDMEB27V0ZUuASC+658UGcPYlF1ivZu8v1M4g6btvbqgEgQWD8NVPRKJi
         DqqUHsyWDILcVWByFdypPFHoyUv54xclzltT2EdfV9H4070U21ZWUCJodh6CL6aTdpRB
         StMghC/1s01uFFOpzpo8UOzCDJXIbtBzslnMSBQkqm7+rMP17TrC/xW+IcdiuhSWtedU
         04GDHim9vjdozqaJ2Pu1GMygFAZptIRK5vz5wBZlXBghjqmqw+Du2wHDBSG3wJvZGxmJ
         e1URPtyosPJbqq3snSA286v53Yxe6bpGAG/5J6z8ne+Gj4Z44BfuPWeCc36MBn1bGus1
         LlmA==
X-Forwarded-Encrypted: i=1; AFNElJ8LTr3uxzYrWM+sWTjEeku9AX5fXVH82xBhPLxntOiMtuiKDsEAlRerpdw24pWjQUBbjTMJfyCdskWOlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN00s02F14EpZejjUyiPJvJIIOf3X4suLja1f+iVPEoNx8hKkb
	+nQGtvmv4F06+t5GgcaYCMi5uVpGJM9gp/ObfbkHH3Ioc45XCawacvWZ
X-Gm-Gg: Acq92OE2S7P9e54w+RPFyj0PPCv1DJHnuwPh+exH6ktYdXZmQoOTMPqR7svkoGpME0G
	QOt2we3CArVQaoFRbsgEoejnl6e66vRQ2CXosuy98ZfvLWW9RYacSEzmxPrLGIdJMvp4X+AaF31
	uphkzuK05YS4HEyUgmF8TcRazOnDM7OMIIiz0RIIXFMwDmv05Z34gFsWjx2kfEdU8vxzzJpnG3r
	EoLLgT27h6bI7w7Y0/4UJL0HADq5e/kCgScBuf5yhrxsaZWkzLu6sCrkd3wS+AxmvLEr34CN8zK
	/+WSZmw0LLK6DRLxIp8hqNU++vsAwzDOzxlTcJCndXgAk/MEyf95pj+aIcNp/U6ySwP5cS+8gvi
	4MyShUG5sVE1M3m+Dl83NtWrU2YAUsJrVhHnJqIE0ZZvOwM4n/ZNqnBngj7+YKAIXabXCfnbmya
	u6t1R6jxyBtI8ufyOhDLAhiRXHGtYzOg0vuhQ9W7zo0ovA3uYePRuQAjPrcg==
X-Received: by 2002:a17:903:1ae6:b0:2b9:edbc:69f3 with SMTP id d9443c01a7336-2ba78b4bcdfmr118316335ad.9.1778236739848;
        Fri, 08 May 2026 03:38:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27109sm18309345ad.1.2026.05.08.03.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:38:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: peter.ujfalusi@gmail.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	jarkko.nikula@bitmer.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/7] ASoC: ti: j721e-evm: Use guard() for mutex locks
Date: Fri,  8 May 2026 17:38:31 +0700
Message-ID: <20260508103837.138142-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508103837.138142-1-phucduc.bui@gmail.com>
References: <20260508103837.138142-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/j721e-evm.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index faa62c1a9b8e..8a3333aa32ee 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -263,7 +263,7 @@ static int j721e_audio_startup(struct snd_pcm_substream *substream)
 	int ret = 0;
 	int i;
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 
 	domain->active++;
 
@@ -303,7 +303,6 @@ static int j721e_audio_startup(struct snd_pcm_substream *substream)
 out:
 	if (ret)
 		domain->active--;
-	mutex_unlock(&priv->mutex);
 
 	return ret;
 }
@@ -323,30 +322,28 @@ static int j721e_audio_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 	int i;
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 
-	if (domain->rate && domain->rate != params_rate(params)) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (domain->rate && domain->rate != params_rate(params))
+		return -EINVAL;
 
 	if (params_width(params) == 16)
 		slot_width = 16;
 
 	ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0x3, 0x3, 2, slot_width);
 	if (ret && ret != -ENOTSUPP)
-		goto out;
+		return ret;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 0x3, 2,
 					       slot_width);
 		if (ret && ret != -ENOTSUPP)
-			goto out;
+			return ret;
 	}
 
 	ret = j721e_configure_refclk(priv, domain_id, params_rate(params));
 	if (ret)
-		goto out;
+		return ret;
 
 	sysclk_rate = priv->hsdiv_rates[domain->parent_clk_id];
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
@@ -356,7 +353,7 @@ static int j721e_audio_hw_params(struct snd_pcm_substream *substream,
 			dev_err(priv->dev,
 				"codec set_sysclk failed for %u Hz\n",
 				sysclk_rate);
-			goto out;
+			return ret;
 		}
 	}
 
@@ -371,8 +368,6 @@ static int j721e_audio_hw_params(struct snd_pcm_substream *substream,
 		ret = 0;
 	}
 
-out:
-	mutex_unlock(&priv->mutex);
 	return ret;
 }
 
@@ -383,15 +378,13 @@ static void j721e_audio_shutdown(struct snd_pcm_substream *substream)
 	unsigned int domain_id = rtd->dai_link->id;
 	struct j721e_audio_domain *domain = &priv->audio_domains[domain_id];
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 
 	domain->active--;
 	if (!domain->active) {
 		domain->rate = 0;
 		domain->active_link = 0;
 	}
-
-	mutex_unlock(&priv->mutex);
 }
 
 static const struct snd_soc_ops j721e_audio_ops = {
-- 
2.43.0

