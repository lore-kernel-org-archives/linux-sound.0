Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351689;
	b=RXTVooaGPqMdCVj5NikxvERNRp5ZGyEPY3nJivSnCiJ8iFIoOH+mhIFkDL1Fo7+94IYo
	 D/a8EYGgdp7+zqHkGYJQ6qffHFe73JqpBC/YTufpqaO9AbkSKo/tkzQYi4f9JYYoLdb/s
	 fuVg9yNzR1YszJMsdu9SfJEDs2D2ZG4dnoDtbOAHgdDjQWZ0K1KFe6UPSX2K7LYRjC2el
	 8PbHmCAyMllpKFWjiUNGSkOdqF+uSMDv7OIhbk2CGONRMh5MLaSLtCctlddup+j+T3tz0
	 xdoDVUBNRzq5hqDJasEOlxaMo5pY4BJ9rE5weDleF9MCV+k8rnbg5L/U4NYKNG8w+zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wf7nEs/6d3ZIbLvKZhlKXZqIu3RM64be+7ASwgNMPP8=;
	b=a1pnzueWDdzODcUeajxJGw9XntB5R049lLsvexAJyaaDW+TfrDHDOj4xTz++CXUa7hc+
	 tAOb416wBySo5pfg3hUQukeNtPKijN0BoudXKGtkLcfF3bCmeqidsD4MMC7/VjfexobGz
	 CIG5gI0o+rMYO6vf0aPLT58Ixgv/IZhJvpiMY0YhRnKMCr9reh7OJmICHs3n3DUS4JxyS
	 FtjGBfd4L5zHLvjqwl3cgWTvxeUUjQ0vljAeLchuYICxJROvmnD46XJSmE6ZDicNgjw6C
	 S3KyY/fLG06iEEcNxzA1gCq72ai/AbjiD00+BhMbKU0HHD6v4KujCP2QqIBrhouJXMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wkiJSYOo;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6746606A31D
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 09:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6746606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wkiJSYOo
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ea759cc9b6so2233965ad.3
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 02:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793351688; x=1793956488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wf7nEs/6d3ZIbLvKZhlKXZqIu3RM64be+7ASwgNMPP8=;
        b=wkiJSYOoYdPq26IjNGL2Ui7PYoDpx3KL8pglt9u/ZfsdS+2+XbFoga2ydGEDKIc7h+
         SWpbxTpefPfxQXniR7eeHtxvvB7v1E/PQTTS1eGRXZ9jtFH6iUCUL1i4pA5gywuxGsk4
         SEVgM98lbwIFEMjmat/w9lt7it8WqiWA4W767+ctsUSm8DL58lEURyaNCY2//KPWQQ0i
         DSg4qxFwtMUJRPl8X8KgyfZ5NTKTXkGcFllJChi5rO8oFw3TsX5jfze/jLwX+Yaxxfem
         7oPRlHCRNUhWWbhfFy7dDTZeVYASDKUy8xwgTiZOcd55W12xwq2Mbxc4PyLYfCGFB+HV
         Nauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351688; x=1793956488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wf7nEs/6d3ZIbLvKZhlKXZqIu3RM64be+7ASwgNMPP8=;
        b=c8X4516RXTVcNSPXzCzefNqFxSzfXJazBjBU4bxAgx8JV387xvtrdOHgm4TbqyjN1n
         0yYcEIYXTRmlbS+Rcy1M/OOpLEPf7Unr+MtljDfjAu8HiAw4rGklK4fB8YhlRpikeDr9
         T89WHW090tVz9Q28apVDiOvPdSV3YOsUJg0NHCh/2gufGAKm09adtH2e2026CNs0gccX
         Z7ePDKVfZ5itQu/+Z740+U2W8M16rUKlnbbWUC3dEsRq8XIO5lAIA3jC6A0Ktlln+TgI
         pEXSQUspMVzP/y5eTh4jdREsLKQwbqNKnlsb6R/FpbwdxT0WfUWtxrg+31JJVFzvyOhQ
         oHkg==
X-Forwarded-Encrypted: i=1; AKwUvBwtHFjLqjBQ/SJCwPUCmCDjSW2PNm/f8OPLMLbFqGzkX6ydu2l3g2TXXI71q0zWt2yQZVcupHic+aPfdg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKq53D72poTt9yl1OI7lj44bSpJx1d5LB+zMup62DqaXZh0P/zp
	5EQiA0W6CiS2Zwn2C8mx8dyj/kjrGRW+XMSsu9M8SUYRklfIWLZ4ycm/
X-Gm-Gg: AYBFou2polZ4heoe6PiwGdj00mZs/MYIgnSV4yOQ2miE71eqbsjVQMKvob3U3ibyCYq
	q4I95bXPIofjNJo/eWXLkr+xv6HutcHt626GFTEr4ykLTInuPH+0Ca2Ca/gn6sh0tdP6gUC8R7m
	SnsAskcW5789yGR3eNQsl928s7F99QF1Ty98VvsDIkLK3ttW1K0rfnaFNVAXxAaFhnlInoWyd0w
	i67IL1M+6aChxLdSrhl3yRVNUi5YTwOJgRR2pmP0T5+ljHKHdI8gWTKyS8px+xD3s/Dq4eI6zIW
	09ues8pGeM5+dNp//cuc3BmZmv6k8G/019bUqLkCr3I1Pp2/zs8U09/WsCzT9uqWSsSn7I1rlKB
	Y8dJIEFi2ldczjSQ9MtNoPgGibPA9VLMK0NOH2fYg8ernryimidRtWI6m3oQwqjmjpzDX19jsjt
	aEpmBBYs4e6UTBS8phnBzQiPMZV3KQbhn3/XCnPKSo0Pimz/IQszIECm41ykd1Nwh+w2y5RthD4
	N8OWzLvn5u9Ftrm9EFUg8SXhBXRXnR7NiIqYWo47xOf4Kk6DEUkrHF582Kn54oH7XXlU+SEuEvj
	vUxZHrhXBp0ePusddM90tcsrAJPLHqwEuYFyVhKSXfWtLFcFBzaooWpCQcDk6Qc2MgS5mECnHl4
	ZBcqLzutWGq/StYSNIFxSNMG3M7/GIP3ErwCu+pXMxoBu
X-Received: by 2002:a17:903:32d0:b0:2ea:778e:8647 with SMTP id d9443c01a7336-2eb364f8e54mr17088025ad.59.1793351688153;
        Fri, 30 Oct 2026 02:14:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm4734685ad.6.2026.10.30.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:14:47 -0700 (PDT)
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
Subject: [PATCH 1/5] ASoC: fsl_sai: Fix PM QoS cleanup on resume failure
Date: Fri, 30 Oct 2026 16:14:00 +0700
Message-ID: <20261030091404.18757-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030091404.18757-1-phucduc.bui@gmail.com>
References: <20261030091404.18757-1-phucduc.bui@gmail.com>
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

If regcache_sync() fails during runtime resume, the CPU latency
QoS request remains active even though the resume operation
failed.

Switch the regmap back to cache-only mode and remove the PM QoS
request before disabling the clocks, ensuring that the resources
enabled earlier in the resume path are properly cleaned up.

Fixes: 907e0cdebc1f ("ASoC: fsl_sai: Add pm qos cpu latency support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d232c8f53061..042885ba415e 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1981,7 +1981,7 @@ static int fsl_sai_runtime_resume(struct device *dev)
 
 	ret = regcache_sync(sai->regmap);
 	if (ret)
-		goto disable_rx_clk;
+		goto remove_qos;
 
 	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output)
 		regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
@@ -1989,7 +1989,12 @@ static int fsl_sai_runtime_resume(struct device *dev)
 
 	return 0;
 
-disable_rx_clk:
+remove_qos:
+	regcache_cache_only(sai->regmap, true);
+
+	if (sai->soc_data->flags & PMQOS_CPU_LATENCY)
+		cpu_latency_qos_remove_request(&sai->pm_qos_req);
+
 	if (sai->mclk_streams & BIT(SNDRV_PCM_STREAM_CAPTURE))
 		clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[0]]);
 disable_tx_clk:
-- 
2.43.0

