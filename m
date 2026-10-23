Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775876;
	b=r7T8POdM9wHi2xb5mS00pN+Pqm20s7wfjWEsjdZbf2P8FA5Ws1bCjNF06B9tpAkGqWAS
	 ALtaDO973is53iMaoISH3cy788ZmBTqHIDzg9Iy3fSbqLbXWjbkrabjOyvO9xcRapjK//
	 BKc7HkvV7WWYSu8P8yhz76xsFPSUmqDetFd/g8NdrSJKhpaAWBuBFB4QO1Mi1SAVq/IOA
	 Ah7M1kJ7TmIpPCk68DDfgQ7gJ+NAva2rKyLvhcmYDDb4uS5q2F5uNHswxNY0M5TMDaVDk
	 YRfd0IChrWelf39QWu3CSIBwV7bBiaC8ul3NrhZ9uHBBxcJ55cJJ555UtXHdo2kNdXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y96nUAhjj5tw9Gvy14OVTqOC2mEo+gm4oabR5MneKSU=;
	b=j6r5DM5vy0JvuAqYYmkYvhGZoXPpaiQ65CurvVcVSgZKOg6Hn6qU1x4tO7quIGSr7TrK
	 oQmBJc8pllbXGxdYzU262xjB7IZBIhgzoQWJ5o7RuN/YsGlVo9Jhq6Y6kRKEJrXPrlrKM
	 yvN5yPMyz0jMmAnaf7Q9+mJ238ht4dDpphPTbIi4ZQRxsz5OyAALgIfoDNIScQinDlJPG
	 JBQCtzdGp7tbQVKgCRPN5SxbJKNlQ4Ld9q77pzZ5yvabwEz1uZlNi6JpGezdv8/NopBpP
	 bpV3kLDZYQyOEcWCAZlyMSV/hlz0xADdNliCd3fXL6bkp1XqP3w037uI/CAZfokPySA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MYtFqQgI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCKEpEIn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C6760A2623
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C6760A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MYtFqQgI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCKEpEIn
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6BPm2999842
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y96nUAhjj5t
	w9Gvy14OVTqOC2mEo+gm4oabR5MneKSU=; b=MYtFqQgIRtsZ0dkJlz26pnr2M3N
	WkEJI+rVKFuTa9hN/JI76SlNG2Eo5cSKmLuRlMop/O+4mD8w25ClYTwrrAOzuTPM
	+2ztBDL1gcrm2PCL0zmBy525SEXZ2v1VLCSbmsYykeCgEQ7us50gSt4o4l5/aDPE
	aVZLGCjjtFHSXwpwD5479O+yz0i6wfyAzWOSUZSylccNNlsDDt7J97Kt6TsewMMo
	3QvrI5G4oxnKmxGVWqdUz/7pmmMSnLMXDT1JvXbPedcM0I+aI8W5dEj6YzY+oPlO
	0M6Ckid6xaWnCgdX2QDSD3JXTp9KUwXLyV/L/K2VhAXF8Uq11UmTm/qO8ew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn14es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:17:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so222368585a.0
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775874; x=1793380674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y96nUAhjj5tw9Gvy14OVTqOC2mEo+gm4oabR5MneKSU=;
        b=aCKEpEInDZPh4M3t+WJ/sUdbK8puztE3Aut2QY6pJDfdpEcAu6zKyB8nr6YUP0MtHw
         Jn8Z9oddus9TI07UgKy9gLqtE230uSzTRUP5TwJA4T8i1QkSkCBPh8zYmIkyfMKyDmy/
         uyR70CsUhe9uLT7v2FpUJPKnwRTYBqYAPFpXpYEkIpxXjNVF3qGUPW++5cvpuNwGXLh2
         2D19NFrnuw6Y18LJwV4iQgALxdm/pwYEiQJL3txx6oMylrLWUqX0i28YrbxI3KByxoEz
         I5awWQVcfFXAH8hpHS6jt1Xxv+04M8ZgHEttnklRl6KdtPTIVm7SCSYOs0VJH5YDRrYN
         9dhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775874; x=1793380674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y96nUAhjj5tw9Gvy14OVTqOC2mEo+gm4oabR5MneKSU=;
        b=FI2JlYK+R2EeSZ02NAtVm4hzQ4PHJ+EAUbdO6Dl0HFIHMY+c8L2LxYUwrX+pgX4obl
         3vQr2v9/EhCBKwhvx6i7AW2TtjmkMTR1EUcWhLV8vhNj4zNg4yZLTra1SVyeBtwDwvHv
         8aXg5+3HTcoaJWODZTYtaOyrnVH0PbEDhbnwIUJaFKGYucwTifT83CIpiflMKMQhfwb0
         46JTY9tOQyOp9s/KqqhOuAyhobuEDhZTdyftOpsdfNx3ZsbF5t53nmxCqkSHsRBP5cOB
         VVDWOZhl7OIFzTPfEzmcAXT1UQfPImQULBZZWOY5noTKn7VmF4L6VoC3a799a6QyRvkM
         fgKw==
X-Forwarded-Encrypted: i=1; AKwUvBy1Ig2pfyez9yC4/9/ryJUG/WHu6bFbJ/3CO5dDaQ3SOJIAkxaSyZgCyXCIX9nC1SfpfLpSewQvsqL4xA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9sMmGGcM81SSntVq6HiJIap5HtwNqp1pVg4MI+0NjV5YA+RRE
	rvu5sNUupsHoE8EtEnd3a6gpCCiovw4AHrY0gQJRFuJeT/j/lpuPFA222vYoZADjK0JbeUUfKSG
	+lyI365HqGrUrV63/DYLVYMF+UD2QD7au+M2oepVj9kv/QqX8m+RBjw3Z1g86LZGRQw==
X-Gm-Gg: AYBFou1x/q2if/1j8Vtl0bMI5cp7TX5nLEZk434zE1lJf9hjk1/VLMMZ4BtQyp081NH
	yYMAVlfPlhCHdO+tb2m5usEensXpqZ04LFkbr8ugb3sUn9U+Qs12TN2lFN+gVXitkZM8MDOoi6v
	33/6zDlAQ8sSm+qqnxsV1AiuJgC8z5BOtAA6RE4yrnZL0yMAEC84qb7Z9/lLKbvz3MV+Ui9DON/
	f2uB1BIuEM/XWpfG22V/qiSu3jxKZQLvKqoR8Z3iErHHdY097K/epLIjhsOHMSP9Sdzxha0dz25
	b3K1Ce35xIDa2R3NPdx4Onz9XlRU9BsoLPN6ak2sQeS2bjHZFK4RnKwu9PoJN9ppA3No8ryWBul
	MPUN2a5iCvtL4
X-Received: by 2002:a05:620a:2688:b0:939:4a44:5f99 with SMTP id af79cd13be357-93f6f54da23mr506242085a.10.1792775873589;
        Fri, 23 Oct 2026 10:17:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:939:4a44:5f99 with SMTP id af79cd13be357-93f6f54da23mr506235785a.10.1792775872870;
        Fri, 23 Oct 2026 10:17:52 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 03/23] ASoC: qcom: sdw: add per-direction stream runtimes for multi_direction links
Date: Fri, 23 Oct 2026 18:14:13 +0100
Message-ID: <20261023171433.820092-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX1vs9+SnCuKOZ
 onef5xtaTIW2pfCHTTV22IgJNrwxq0CS8PrFljDJtHuUhKunc1iCdii1gksZf7yQdboHM3tofbn
 ZNLg4jBOhZTecuB3Htw+dI1zHPe60WSfJZ2ZLbvoeFIrnGJNzfrodaofMmL3qb/w5INe826VwaD
 kJISuk61vp8OwsflvDqXwiVuPWKhvhnp685Uqx/Yao1sVqUHDi2Zi/7sHqzF63m4KWfI2sQHkOz
 dzzpsv71eb4AkYBWcb/kdxlcysiRpGC99UseTqTFUOTyVqIPwed3eG5fAsnhUSxkTJD1fGTreJn
 kfT25AHHiGN9PFWGAacnXT/hKm4+siI6ArdZWFkGJX5hc1mdMTZDOgeOFCJDBY18RJiylBlkimX
 wL/eWfDTO1hwOwTxz40+ST2SBdaC+QHXlpgGBC1OjUfwuXqashOPTINSmosjagJDCoNoisBbJoV
 fEQn2kdQPEBk6/n7ZnA==
X-Proofpoint-GUID: b_Q5x3SLeqRdqAZdJ-9lNm3gq5dkl9Vr
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb96c2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=3gksVG7zvlp-C0s-nSsA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: b_Q5x3SLeqRdqAZdJ-9lNm3gq5dkl9Vr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX1T8YkiNat3Xg
 jp2+XZR2y90aMAAHq7w2BUSt25Mi9wYOJDmvrrkcErud6kffWghMwBmZLdi1pjRa0l4AT1NHfXb
 OrdCtpR1UNF6CxUJE8JXcpcNtvb/jvs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

A SoundWire BE link with multi_direction_codecs carries codec DAIs of
both directions, and each direction needs its own sdw_stream_runtime.

Split startup, prepare, hw_free and shutdown into per-direction helpers
and run them for both directions on such links.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sdw.c | 236 +++++++++++++++++++++++++++++++++----------
 1 file changed, 183 insertions(+), 53 deletions(-)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..e72424ce5cb0 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -8,6 +8,15 @@
 #include <sound/soc.h>
 #include "sdw.h"
 
+/*
+ * Inline direction check that doesn't require snd_soc_dai_stream_valid
+ * to be exported for module use.
+ */
+static bool sdw_dai_has_dir(struct snd_soc_dai *dai, int dir)
+{
+	return snd_soc_dai_pcm_stream_get_i(dai, dir)->channels_min != 0;
+}
+
 static bool qcom_snd_is_sdw_dai(int id)
 {
 	switch (id) {
@@ -49,43 +58,42 @@ static bool qcom_snd_is_sdw_dai(int id)
 	return false;
 }
 
-/**
- * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
- * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
- *
- * Helper for the SoC audio card (snd_soc_ops->startup()) to allocate and set
- * Soundwire stream runtime to each codec DAI.
- *
- * The shutdown() callback should call sdw_release_stream() on the same
- * sdw_stream_runtime.
- *
- * Return: 0 or errno
+/*
+ * Allocate a stream runtime for one direction and set it on the codec DAIs
+ * of that direction.
  */
-int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
+static int qcom_snd_sdw_setup_dir(struct snd_soc_pcm_runtime *rtd,
+				  int dir, const char *cpu_name)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
 	struct sdw_stream_runtime *sruntime;
 	struct snd_soc_dai *codec_dai;
+	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret, i, j;
+	bool used = false;
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (sdw_dai_has_dir(codec_dai, dir)) {
+			used = true;
+			break;
+		}
+	}
+	if (!used)
 		return 0;
 
-	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
+	sruntime = sdw_alloc_stream(cpu_name, SDW_STREAM_PCM);
 	if (!sruntime)
 		return -ENOMEM;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
-					     substream->stream);
+		if (!sdw_dai_has_dir(codec_dai, dir))
+			continue;
+
+		ret = snd_soc_dai_set_stream(codec_dai, sruntime, dir);
 		if (ret < 0 && ret != -ENOTSUPP) {
 			dev_err(rtd->dev, "Failed to set sdw stream on %s\n", codec_dai->name);
-			goto err_set_stream;
+			goto err;
 		} else if (ret == -ENOTSUPP) {
-			/* Ignore unsupported */
 			continue;
 		}
 
@@ -93,59 +101,125 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 						  &rx_ch_cnt, rx_ch);
 		if (ret != 0 && ret != -ENOTSUPP) {
 			dev_err(rtd->dev, "Failed to get codec chan map %s\n", codec_dai->name);
-			goto err_set_stream;
-		} else if (ret == -ENOTSUPP) {
-			/* Ignore unsupported */
-			continue;
+			goto err;
 		}
 	}
 
-	switch (cpu_dai->id) {
+	switch (snd_soc_rtd_to_cpu(rtd, 0)->id) {
 	case RX_CODEC_DMA_RX_0:
 	case TX_CODEC_DMA_TX_3:
 		if (tx_ch_cnt || rx_ch_cnt) {
 			for_each_rtd_codec_dais(rtd, j, codec_dai) {
+				if (!sdw_dai_has_dir(codec_dai, dir))
+					continue;
 				ret = snd_soc_dai_set_channel_map(codec_dai,
 								  tx_ch_cnt, tx_ch,
 								  rx_ch_cnt, rx_ch);
 				if (ret != 0 && ret != -ENOTSUPP)
-					goto err_set_stream;
+					goto err;
 			}
 		}
 	}
 
 	return 0;
-
-err_set_stream:
+err:
 	sdw_release_stream(sruntime);
-
 	return ret;
 }
-EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
 
-int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
-			 bool *stream_prepared)
+/**
+ * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
+ * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
+ *
+ * Helper for the SoC audio card (snd_soc_ops->startup()) to allocate and set
+ * Soundwire stream runtime to each codec DAI.
+ *
+ * The shutdown() callback should call sdw_release_stream() on the same
+ * sdw_stream_runtime.
+ *
+ * Return: 0 or errno
+ */
+int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime;
 	int ret;
 
-
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
-	sruntime = qcom_snd_sdw_get_stream(substream);
-	if (!sruntime)
-		return 0;
+	ret = qcom_snd_sdw_setup_dir(rtd, substream->stream, cpu_dai->name);
+	if (ret)
+		return ret;
 
-	if (*stream_prepared)
+	/* Also set up the stream of the other direction on such links */
+	if (rtd->dai_link->multi_direction_codecs) {
+		ret = qcom_snd_sdw_setup_dir(rtd, substream->stream ^ 1,
+					     cpu_dai->name);
+		if (ret) {
+			struct sdw_stream_runtime *sr;
+			struct snd_soc_dai *cd;
+			int i;
+
+			for_each_rtd_codec_dais(rtd, i, cd) {
+				if (!sdw_dai_has_dir(cd, substream->stream))
+					continue;
+				sr = snd_soc_dai_get_stream(cd, substream->stream);
+				if (!IS_ERR_OR_NULL(sr)) {
+					sdw_release_stream(sr);
+					break;
+				}
+			}
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
+
+/* Prepare+enable the SDW stream for one direction. */
+static int qcom_snd_sdw_prepare_dir(struct snd_soc_pcm_runtime *rtd, int dir)
+{
+	struct sdw_stream_runtime *sruntime = NULL;
+	struct snd_soc_dai *codec_dai;
+	int ret, i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!sdw_dai_has_dir(codec_dai, dir))
+			continue;
+		sruntime = snd_soc_dai_get_stream(codec_dai, dir);
+		if (!IS_ERR(sruntime) && sruntime)
+			break;
+	}
+	if (!sruntime || IS_ERR(sruntime))
 		return 0;
 
 	ret = sdw_prepare_stream(sruntime);
 	if (ret)
 		return ret;
 
+	ret = sdw_enable_stream(sruntime);
+	if (ret) {
+		sdw_deprepare_stream(sruntime);
+		return ret;
+	}
+	return 0;
+}
+
+int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
+			 bool *stream_prepared)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+		return 0;
+
+	if (*stream_prepared)
+		return 0;
+
 	/**
 	 * NOTE: there is a strict hw requirement about the ordering of port
 	 * enables and actual WSA881x PA enable. PA enable should only happen
@@ -153,15 +227,34 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 	 * accumulated resulting in Click/Pop Noise
 	 * PA enable/mute are handled as part of codec DAPM and digital mute.
 	 */
-
-	ret = sdw_enable_stream(sruntime);
-	if (ret) {
-		sdw_deprepare_stream(sruntime);
+	ret = qcom_snd_sdw_prepare_dir(rtd, substream->stream);
+	if (ret)
 		return ret;
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		ret = qcom_snd_sdw_prepare_dir(rtd, substream->stream ^ 1);
+		if (ret) {
+			struct sdw_stream_runtime *sr = NULL;
+			struct snd_soc_dai *cd;
+			int i;
+
+			for_each_rtd_codec_dais(rtd, i, cd) {
+				if (!sdw_dai_has_dir(cd, substream->stream))
+					continue;
+				sr = snd_soc_dai_get_stream(cd, substream->stream);
+				if (!IS_ERR(sr) && sr)
+					break;
+			}
+			if (sr && !IS_ERR(sr)) {
+				sdw_disable_stream(sr);
+				sdw_deprepare_stream(sr);
+			}
+			return ret;
+		}
 	}
-	*stream_prepared  = true;
 
-	return ret;
+	*stream_prepared = true;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_prepare);
 
@@ -185,11 +278,37 @@ struct sdw_stream_runtime *qcom_snd_sdw_get_stream(struct snd_pcm_substream *sub
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_get_stream);
 
+static struct sdw_stream_runtime *
+sdw_find_dir_stream(struct snd_soc_pcm_runtime *rtd, int dir)
+{
+	struct snd_soc_dai *codec_dai;
+	struct sdw_stream_runtime *sr;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!sdw_dai_has_dir(codec_dai, dir))
+			continue;
+		sr = snd_soc_dai_get_stream(codec_dai, dir);
+		if (!IS_ERR(sr) && sr)
+			return sr;
+	}
+	return NULL;
+}
+
 void qcom_snd_sdw_shutdown(struct snd_pcm_substream *substream)
 {
-	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct sdw_stream_runtime *sr;
 
-	sdw_release_stream(sruntime);
+	sr = sdw_find_dir_stream(rtd, substream->stream);
+	if (sr)
+		sdw_release_stream(sr);
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		sr = sdw_find_dir_stream(rtd, substream->stream ^ 1);
+		if (sr)
+			sdw_release_stream(sr);
+	}
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_shutdown);
 
@@ -197,18 +316,29 @@ int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream, bool *stream_prepa
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime;
+	struct sdw_stream_runtime *sr;
 
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
-	sruntime = qcom_snd_sdw_get_stream(substream);
-	if (sruntime && *stream_prepared) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		*stream_prepared = false;
+	if (!*stream_prepared)
+		return 0;
+
+	sr = sdw_find_dir_stream(rtd, substream->stream);
+	if (sr) {
+		sdw_disable_stream(sr);
+		sdw_deprepare_stream(sr);
+	}
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		sr = sdw_find_dir_stream(rtd, substream->stream ^ 1);
+		if (sr) {
+			sdw_disable_stream(sr);
+			sdw_deprepare_stream(sr);
+		}
 	}
 
+	*stream_prepared = false;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_free);
-- 
2.47.3

