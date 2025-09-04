Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650A62FD7D7
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756981137; cv=none; b=QSUPpueVkIGztpPGz+ONU1FI31wHcyWwieH3CWk+bbvAjYihmV1SfWSjTUSkKHx91o44rhC9Oh72VyLHpSJfl/ShlPWIAB6eYUBtsTPhj/uV50PJN6uhn6+6jgIqJlrI56jqGGjPf0s9AnWo3yYgrFvGdtNr0Yr6PLZCdvcZi7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756981137; c=relaxed/simple;
	bh=0z4DvdjsLX6ePogBY1auCiBA6lQ5eI1Z0Og0lwAREbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j2gNad/GhmnYMSYCeyZ971INJA37CIqfLByjkqNo2nA3+Yv2fmRVhrKfZIPQ8DHKxtLBzn2zxe7IpaQPrbvfF8C0v1IINVxxxXQgrLcij8Qvq6sR7UmVAUKy1kzyQ+XM0d+gl1LKYObEYWT/wf6DQf6nISUmMKJj09jHtU7GO9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XApCXX6N; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XApCXX6N"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-61ed8b5bbc9so169510a12.2
        for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 03:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756981134; x=1757585934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=788DvyHs5EODeIANR32XpfigfVcSqxiFxI3EsfOqEDI=;
        b=XApCXX6NeNhNAvhmv8CVw75krY9UpYhjvZTYa59GqJjJPe/TOI8//VN5zgPEHK1BJI
         QSs7lI7/izZE87KcZxBE/eR6DcLe8vuE7ipf1VZpcZCURX2sjonDp3yXj4cqZu+0nreR
         0colCHAEN4emV5MzJ/TLPjVYH/fQf0ECbzthOIAjTtcCwQutEArATKMTtZfpYVD9f3z1
         EwYofra9Qx/hmCKqnHcAI0wICaH6bNAjVW6gkKgKjcsl2BU8RYvo6LPFOwC+I1ZSm77k
         KWwNFEa4KWsL3Uq0bOHmPfJvXwx+g9Q5MwY7K7MKfcdz7xFlabxX5uNJK0tVZQ/n/DP8
         /zwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756981134; x=1757585934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=788DvyHs5EODeIANR32XpfigfVcSqxiFxI3EsfOqEDI=;
        b=vgYL8dueYBTt/bEnS4/PKKp0oq3RiKmq9NieO+QEGS6y8AWrLxVVHMmBaluxuumC5/
         /Ixln3g2BwgfZ95ivxXt49ML6QGcoI0PWIovOebwrbOWwAQWcYIe8xsGlGNlNOD2u1Js
         3nQU0TUbG6W2LLE079UAmp2XTjCHi5r4vsRRTrMV0jFRfMyHcSOjq2lx66dsjcMvKHLt
         c312CgbuzawiQ3drLY+4dR46R5Se5MBSKCxspFynf0Sk0vp3NjeFY9c/GFmD72bXBQAK
         KtAxUnLq7Jzhi4mA3CG6TJ6XNV+JEnbnPLhdexLELJYfgDj7PYpXv2Tt0+zOLtCad5ER
         Hy2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVV+k+N8hVLmHfR1lhROhU4TY8MrRjUdtMn2zO5EpHjmzKdjgfP94edfB3dufIpRuQw6gOrGqknTh4X6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YygVeulLmndXL1Gu3UknThYyEgv8vN5o+OVzKWgQ2mQoM1vKay9
	m0DSXuGVFvFYLn4JHoteKIbzEAmUnf47ZtfEslDvZ307pu7bB3p6s3Ga1JngLL6BSFY=
X-Gm-Gg: ASbGncuH/kLqZyfiLbi1F2cYRedG0oSF2guBidH4Z33vD25UwCP2XVLun5uNwMfXgPN
	+LELirci/XueLVZbI8wmroOyR7pUgu7m4WEZxR3AXXDvCoYHjayt3LirK5fnhV3vTzYPvwHFeeC
	SpHDVhe+n808NDk7GKltrCfHW8Abfz4qeaWFGGC+TIllOnZGo9EDSjSlcXYqGdqE9BblU8hYF5b
	pSFayWl6dxrT8G0ZoRkJ/Tiwdqxdw0MJ2ulaE4ou/wnRI/0y1+qvgucQ0yV9EOKyC2Br4pQ8sxb
	bnF3+DC43erFSqaeaWC9dcA5bLRCxYcrFCgA4S+VtENHA1YKkjQ4zv/a07b/QHAzH0iywZcS2KL
	33JBN0798uDuy+LOYOwb09EToS6pFukO4Wf6ETv2FxmhW
X-Google-Smtp-Source: AGHT+IHWntgtcODAj/7kFve1sXTz2DdTGamGtUT21D8b3aznENuQ1mZPsX7EylSYmJeT9xBCC+l8AA==
X-Received: by 2002:a17:907:25c3:b0:afe:b131:1820 with SMTP id a640c23a62f3a-aff0f01e9fcmr1044118066b.6.1756981133581;
        Thu, 04 Sep 2025 03:18:53 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041f6fb232sm1103667166b.87.2025.09.04.03.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:18:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] ASoC: qcom: q6apm-lpass-dais: Fix NULL pointer dereference if source graph failed
Date: Thu,  4 Sep 2025 12:18:50 +0200
Message-ID: <20250904101849.121503-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2051; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=0z4DvdjsLX6ePogBY1auCiBA6lQ5eI1Z0Og0lwAREbU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBouWeJllIVY+hQGdNqHZvj/tioDr963JGTfjhCS
 P6pL6DYWlOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLlniQAKCRDBN2bmhouD
 1xJfEACRVcFni8dKH4V2yPLhU+lrF63RMHnlRzgHV9jmPHmN+MvF6Q2Kz+dfrN9qSOaI3EQjmUq
 qtnY7eUeCe7aPA3eUdRBbqaoumyMc56M7YQW6HWWVHBkpHQz5xipIT7lJyIUSJ7WGlr0xFJfnLa
 TBi/sKAZKgvvjhfKe6eXwSxpl2/L1/hQ6BnWrURJH1bwxDyJl6j+wm7BNxOo6QJgHQc/J9U42u4
 axXFpApSpaZ71EZIyaiyo/PdYPX2EULNm8C+gOFIrsggipVxt7oYTzEQhogJtblISh3H/rtBEQ+
 vqNNlphoEEpCnwfrKdGYIKiOU2S3xp/QLm3AQCxFKSSIbg4q7PHl8mCsiIaXVRQAtVoBuDguZ3/
 CwlY4Hl+zI9wsNdWh09G8+C95WOGbSQul5LWEzq+eNlopX/2r/50m3Yu3kmFNqEARid/PtgtcrC
 OJTMRJW4Ohhsi8HGf0GFyv1LAl2P8xu4RUwVL/4SP2MzMg7iazAlZbbXc05O9BCvfP6s0JI2Yu+
 KNh0uP7oXCAKQ7Jt5J4zGI0376RuS4fEgVofTdSYnHZi+9OQES9Ww3Kps13xIS96+9zrNe/j5Kl
 CiC85g6WdbLDFSEg0I4eZ7bpdN4Rgj8GFOVVUYgLJqFXdb6q0LLrAJqodNUAVjtAeSAgitAbAhj ywZWoUCPOGTRV5A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

If earlier opening of source graph fails (e.g. ADSP rejects due to
incorrect audioreach topology), the graph is closed and
"dai_data->graph[dai->id]" is assigned NULL.  Preparing the DAI for sink
graph continues though and next call to q6apm_lpass_dai_prepare()
receives dai_data->graph[dai->id]=NULL leading to NULL pointer
exception:

  qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
  qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
  q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: fail to start APM port 78
  q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on TX_CODEC_DMA_TX_3: -22
  Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a8
  ...
  Call trace:
   q6apm_graph_media_format_pcm+0x48/0x120 (P)
   q6apm_lpass_dai_prepare+0x110/0x1b4
   snd_soc_pcm_dai_prepare+0x74/0x108
   __soc_pcm_prepare+0x44/0x160
   dpcm_be_dai_prepare+0x124/0x1c0

Fixes: 30ad723b93ad ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Use approach suggested by Srini (you gave me some code, so shall I
   add Co-developed-by?)
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index a0d90462fd6a..20974f10406b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -213,8 +213,10 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 
 	return 0;
 err:
-	q6apm_graph_close(dai_data->graph[dai->id]);
-	dai_data->graph[dai->id] = NULL;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		q6apm_graph_close(dai_data->graph[dai->id]);
+		dai_data->graph[dai->id] = NULL;
+	}
 	return rc;
 }
 
-- 
2.48.1

