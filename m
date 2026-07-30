Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE0B414A1F
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 09:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405274; cv=none; b=Ot8t9YLdKEVuzxR2dpEW4xp2mbP5Rwk/AT7wvfvbr+6TEzjL4wE1DzWWsqgILlC/pxIDfp81+c5nqfDL5z8FCUOq5ucDT5VTY3vhPPqIRp9GdAm17UwXtETciApnk7MmOPRgyxIYfTbhZn4LImLxeBA8ocS9vsw5NdqtEQ0UuR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405274; c=relaxed/simple;
	bh=4asQp7CItf/QY0ZvkUxBMA4VK7DMZY+asRZD8/vwN50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PfpaTuAqQdSW0c3p7cSX14bArP08BtqTvNubKkqQFmc2YvLeCOlThkV4/GMOHdqKJ+mZ478ZjKRwC5CD6eh2s7hWWL0ErG1AQ0TvkxRX6qO0YcYXVUkYWrW/izBBTLz253XEWP8Dd1eEDLjmzi2PzP++ilJDY8RUCAoreIHzhH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1iKdcfo; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1iKdcfo"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc891373e0so22263415ad.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 02:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785405273; x=1786010073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzbglvDmSneSyaYqeAknPVGwIe7A9QQH6F0QvdDo8X8=;
        b=D1iKdcfoQhDkIOqqgx6AAhPqPVLU9SWnmhh1D5Gy4wYUbfgHIkvyBdfmP65Pwt4Sq/
         fPKhJ8dDmruHPNtQgfIMK1ljia9/0XmmquuEAepgyIqGS+RyvBd048oaIUw7BgR8fDHs
         +DZc9s4TkYc4jA5znkcOxY5+IGZdfrtFwvyoWjst4kHmdszp07pxeqZjbttm48gweHvp
         hBoRUIydkWt/Z0LbcKo1hmbu56FZXnUkocNeWmkfSrVghyvddmpmHMXeVTQ/vSeQecq3
         bD9i3Yv/jBQJO7em9sNsCnsYmLHCXlgRMPQbqwmYnNSE5vvNzkJZuN4rugTxeIg+28Ql
         5KUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785405273; x=1786010073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NzbglvDmSneSyaYqeAknPVGwIe7A9QQH6F0QvdDo8X8=;
        b=INL8Rm/oNBxH0E0mzT81euG+9WlFFmHGSjALrG1POO2ATh4mrjqqrVhrsYNifeo+pJ
         sLFwKKWSHkruod4D0K8A7yeXWpmW3zsyUnh9v9/9UYNCePGzsjD7VPy1addd8JVvncmZ
         dhVMnNCzor8YKpO0//UPpgQ4j4PaC5DZxt9lVvaFVwUGGPSnUbhHsHY3jYaT2rzESADb
         MN5SODCM6YabQdrEH1UrKXKu8+d5+2nxSok95tgTCsqzWNihZH/oLFKdZFyHpdVSWi76
         ++Y3IL+qqXXTBq73Yr00P4nErBijQuysu2pADPQU7DE3TDOBcLG+pYaOiWVIbh6CE9VZ
         K+rQ==
X-Gm-Message-State: AOJu0YwEzuYNd2518LcRTrgsh++IU4J4FrZSLTmd6qyjCCg7/aemXOZe
	Uj8SIiXTyoLA02rHowtGmMZ6uiyxhnhKTBz62ITLZE/YmDD7AiZDtOdv
X-Gm-Gg: AR+sD114VUf3JeFc7B+BvqTNPZFSlhEGzOKPXmTri3xziDY/8tu+SqLxc/85WDV+3G1
	j1AQD+9iuYVClUhFPaB5Cr56wbTvvAUfzrkX6MWJBUyaUIyZU7j17JhMWdarpoyaxFEkJrHHZqI
	JpCzWHy5Mn5faQivc5vGm5Jgc8DkuoHKZ3tRfIJt2UVWX6/YcPPIwu7G7M3YQPiJtWvdZJZQY5W
	zUxz2kn3CFPgzttLJVN117VRJ6BJPlwZWfE1gSN0kpYvVNJuoW4d8DxXAj8J1pl2W0GfRYipfeV
	5hImOkHcRwhlZokvH5nfBOwUbF1dZrpAaBPwvbva2u4DFuoMZXOasuNMvazq/rc7GXwmni+kBlM
	Cx9wmo6ubSceFUkvB0PCHgCLAhpfGxab9LOJbPNCaV45slWU0Q6kxAiq6D8RlXDMOzP1/7daMkz
	mDNoJWiLPwfgJgWZMYSp0VQin25FgwsCU92xXy/pfC1/jYmsK9UAQF/Wbj07iXYB5l8MDlDrWa9
	YbXalLTod9DM18O4KvIcfBi8dXZNcvRLouyP/P4gIv4JnvDSprRIQybU4+t02rr0FfPpjFdcT7V
	9AbR
X-Received: by 2002:a17:902:d98e:b0:2c9:d539:61e7 with SMTP id d9443c01a7336-2d035c729edmr17691485ad.19.1785405273203;
        Thu, 30 Jul 2026 02:54:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c2dfb1sm23982345ad.72.2026.07.30.02.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:54:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Tim Bird <tim.bird@sony.com>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/4] ASoC: spear: spdif_in: Switch to snd_soc_dai_dma_data_set_capture()
Date: Thu, 30 Jul 2026 16:54:05 +0700
Message-ID: <20260730095407.33894-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730095407.33894-1-phucduc.bui@gmail.com>
References: <20260730095407.33894-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace the legacy direct access to dai->capture_dma_data with
snd_soc_dai_dma_data_set_capture().
The capture_dma_data field no longer exists in struct snd_soc_dai,
making the previous implementation incompatible with current ASoC APIs.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/spear/spdif_in.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/spear/spdif_in.c b/sound/soc/spear/spdif_in.c
index bbe016ed030e..d571055bfc6b 100644
--- a/sound/soc/spear/spdif_in.c
+++ b/sound/soc/spear/spdif_in.c
@@ -55,7 +55,7 @@ static int spdif_in_dai_probe(struct snd_soc_dai *dai)
 	struct spdif_in_dev *host = snd_soc_dai_get_drvdata(dai);
 
 	host->dma_params_rx.filter_data = &host->dma_params;
-	dai->capture_dma_data = &host->dma_params_rx;
+	snd_soc_dai_dma_data_set_capture(dai, &host->dma_params_rx);
 
 	return 0;
 }
-- 
2.43.0

