Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481961;
	b=bXTdy09Nt6ns+8lMqzlj+479GwdDwlIag30oPaSPtk/ReC7kGhxNpHrmyw4GAmPCM6xE
	 hXFwS3OX/TWqKIZBqzkVpjebjOgF9eemJazH1M52T6f+RupaIEjdjSIImjVOq9E6/rLco
	 7u3tP3ZcFd9QycOjp6bzCnU9QgQfnfUS6hZbhF8aECynfpIUjpFqWoPiBIOLdd1ujpuHw
	 RQANQ9OMsNA93UffVZ2taHR9oS6lcPrPXWVb70XpVIeTydbDc+vCEUhVAhV27yAxl5sbW
	 DGnm9U1wXGK540d+cJAQmdYJ3N+qfBe67HpgZv9su3RhqK5xlGmja2o40t6JeJz1yXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481961;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1aGPUh+pH+A6f+5NezhpjcrkpA6qe52i06POTDfLDA8=;
	b=he++k1ytCl9onpGADE/+J5MB7qdBkeW/Y94u/mXVfqgCejDKnG4ugR6xlgwXUrEIi9Rv
	 mDG4wxV5/AnHXxA4890HoC0cd2gOwej/iXI74U/wbJJtk80Tj3WQVjAE9htuKAFmQo8yH
	 3eBrh1To1aJj644p34GUSDjoVZ6W/SPdu6Nqjtx7ABDCf9L5XxGpf9qcnP6+owGGg3AkC
	 oimlltTtT9xXaz0sm5g7Z4plXKF8dv3XNpSlOFed4LjFB7jAy9uazJZqJYvZZG0hZrY5E
	 ytYkF+84t5PnTzS4UNsVx1aG3Se+xz3toLLCqj8OLj5A2/fZSlvvY8N2X9QPkOwcgsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gKMzz6P7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsHUWMN2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F004660A2626
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F004660A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gKMzz6P7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsHUWMN2
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tBo03807021
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1aGPUh+pH+A
	6f+5NezhpjcrkpA6qe52i06POTDfLDA8=; b=gKMzz6P7IWIG5jqMUbxkvExJGml
	rHJM3N2sdPQVifjUvOa7uGFo3mYydNWiNYMvCFXn5hujoTCH8qcLESQcsf2V5v9H
	6kNKyfGZYik6FW8tZ7AnvI8P4+qEO1lQQ5fV7/CuBvn2oc/lB3mkqpqT7ETsN9Ka
	9SkIvIKD99QZkkIiyOf/u/VfQXkJrk3vmHtbjgzKNfuUPzJyaObAemfPiMookj/3
	hMX+tvCbi0OhCLU51PE0MPRd5g1pxCOaSzO6p3ey+kdvbYQmRszJPiSY1xRvhpvB
	QCW3QRl4q3zzGDhhlXX9sHrU/Bab0KT0OtpiNoJcKN17kMilQ3xYEgwE4Gw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p9e61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so864817185a.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 00:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481959; x=1793086759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1aGPUh+pH+A6f+5NezhpjcrkpA6qe52i06POTDfLDA8=;
        b=HsHUWMN2jCJxq9CJLVeDrWzYn94f5SlC/H6zHqghtGiUGa+cqx85sTicQSJNfYj8Sj
         mTPVqB3W0GaYz7qSiPv1D0MnpOVg78ULGYvTS//9TB9qC4XL0LXMNyNR71ii1t2EvR05
         VWdUQYxwi56oBCQMKI0ixdyZhoBj2Ix3bdKApK0Eo5x/RfALIb5twKTZI7M7zCkZ+4sD
         59iBkaMwMkXEOIfMAzHdgiP5BDsKkM+f8nh4VhZcC42l5yOWDCYCy4M6Tw2NRwe/R9pd
         aVUv+gYyq+MklozfRJJKIYrgyLndSqTvj8PmAnDDacRJAcS3yP/D68bTclXRCDuBU58B
         4d+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481959; x=1793086759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1aGPUh+pH+A6f+5NezhpjcrkpA6qe52i06POTDfLDA8=;
        b=B+jAga6q5Gvm2b7EbjtSVu2Q06zLCeXL4sdaoHjgFsy+I6mJSiMiESsfOnhApmsVbU
         nOIC92kO1wbXKjzA5KUvHkH5GFumhEREIdScwiO5GRRgtTLP2rzxD96qAgk7eHXwc0r2
         8ViKXnub7AldK/yh6bf/9olWPC1BLyw0750nrXyRHSLPhobrOIhIQsn83rxfASdFJ4Up
         A04hV1kPzrkti44LcO0GdvJJ6tkGbskMm0EdoL4f9kkPI35mjR86nLaFCD45+m7Usurj
         5EPOSyfEyHmio/KareSiL13SJXl6Uc3+9LWXl+EDBLMBhJg/vQW26zBSZ/ZP2OyQ4q44
         kyTg==
X-Forwarded-Encrypted: i=1; AKwUvBzg0RPNEB2Quwkl3fCLrIsLxhdzaid+lmjTVfNsf9hu6oAmB4mZp1GGHABfx+zloQXJFzXIqyfdslqaSg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKF8GuOK32wB7Gx5rOCgr6VW1rEpyDR0d5X2U6okE2zNWIQOUHU
	aA7aqIQ4WpUvGxzvKXKXlEUxhljKiNRSANWp8IB86rrhKhu4IYhXuXgB2Rh9pDzccATvyDNWeDY
	vS0tYabciwU0l9v2rdIaLArWU0qwylTDVeggYACtS54Mx+2VH3ci96w+NvUeVnmtp7w==
X-Gm-Gg: AYBFou2Nw1Jp+JfuOYNaeP4jzorgwWq/lEAz2WZsvf7SUdZpnCoc6Gus4QygP7LnMLN
	vKx6sauy4E79qBC2I1F9gc5mrIgHqADqX7LR+p0zy2cL2fU8D/oSJS6tDM+R1nXd3KJ3jjiQHR6
	2tKFPBLEYG1QNwTIVlEViyzb3K4Mt0q0EALGZlEiRUgo98rYei3flYlQTwc24/kKNGrOCBvFO16
	tOzVO+oca25Iqe3O5dxUIXgIa8fCbjw5b5+KuxGwccV0nIT6ZaZei7iUvxGcmAuhV4/pXD6gU21
	j/q+xNTeBILZwg5dnKMBh1wqh/rRi/aa/7Hd9PlYg4EXQJINMlBV/EgjqPHa8kqn3tGZUTI88ie
	NAuoLi6C47DuG
X-Received: by 2002:a05:620a:1b86:b0:93e:bcbf:4ad with SMTP id af79cd13be357-93f29d0a5a2mr1584857085a.33.1792481954464;
        Tue, 20 Oct 2026 00:39:14 -0700 (PDT)
X-Received: by 2002:a05:620a:1b86:b0:93e:bcbf:4ad with SMTP id af79cd13be357-93f29d0a5a2mr1584855485a.33.1792481954007;
        Tue, 20 Oct 2026 00:39:14 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm4566271f8f.36.2026.10.20.00.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:39:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/6] ASoC: SDCA: add sdca_asoc_dai_is_pdm() helper
Date: Tue, 20 Oct 2026 08:38:54 +0100
Message-ID: <20261020073856.1177749-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: 6DHACMzy0e1QemyU0k-ZZlHNmg9XSTf6
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad71aa8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=UfHDTIoufQuGQUpisKIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX7iy/3TuIucef
 FljJDze6M25FD9LJIY1koLHy2WKBjjdp9mSqcuHblVnqslw9U0BL1tFhyGPOx3bZ2QYGu3c+Plv
 x4eDJINkNMf0+/L3OeOVouIMCcrDJg+PMZLuEzzNuquK/OWvs98Wuy2fMvcvIqu/fiRjWJZaU9i
 9lIEEUQVDpPIU0KPQzSwzzhO5iKIhXvSZVxKHITExpOtPG7l87vz2OMEHyqrCWr9+bjyqOZb/VZ
 Iy9Z3/4Y8CtJL2OalT+7ejhUncoJmHp4R8gHGjTL5KrglOFCVzX2tSQEbxvDECkj/ExkN/kdR++
 0ZbL9tkL0JGD0WLKZqsBnD1lIzIsCVnhAX3NJBDH9a5P0ruPddTvTr1VSF9V32Yu2Xs3BHtWUyx
 7E1pD5r9okXju6K/PPwelux8rHyAHAV4r717d3XtkMdKkyKKPOu85uqUFym5UHqu/d/CR/us4yy
 2j2GrCRmeSPSjGlzRXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX/q1QYDugasiv
 OkXVxO0GgvbnVlB0x2bO/DlqypKailIDT+fDO5hIpBsV3EK+l0tYc7F1fFRWIXZoheqChndZP4k
 w2z651et58+5ZWUdnneX29hxxqbvb7U=
X-Proofpoint-ORIG-GUID: 6DHACMzy0e1QemyU0k-ZZlHNmg9XSTf6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

Resolve the SDCA terminal type for a DAI and return true for the
spec-defined PDM terminals (SDCA_TERM_TYPE_RAW_PDM_MIC and
SDCA_TERM_TYPE_PDM_RENDER_STREAM).

Used by sdca_class_function to tag PDM streams; expose it so other
SDCA codec drivers can share the check.

Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_asoc.h  |  2 ++
 sound/soc/sdca/sdca_asoc.c | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 599a72f33515..99c39b5944e3 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -112,4 +112,6 @@ int sdca_asoc_pde_poll_actual_ps(struct regmap *regmap,
 				 int from_ps, int to_ps,
 				 const struct sdca_pde_delay *pde_delays,
 				 int num_delays);
+bool sdca_asoc_dai_is_pdm(struct sdca_function_data *function,
+			  struct snd_soc_dai *dai);
 #endif // __SDCA_ASOC_H__
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index ccc579f878ff..559a0fdfd98e 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1781,3 +1781,26 @@ int sdca_asoc_hw_params(struct device *dev, struct regmap *regmap,
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_asoc_hw_params, "SND_SOC_SDCA");
+
+/**
+ * sdca_asoc_dai_is_pdm - True if the DAI is routed to a PDM data-port terminal
+ * @function: Pointer to the Function information.
+ * @dai: Pointer to the ASoC DAI.
+ *
+ * Return: true for SDCA_TERM_TYPE_RAW_PDM_MIC and
+ * SDCA_TERM_TYPE_PDM_RENDER_STREAM, false otherwise.
+ */
+bool sdca_asoc_dai_is_pdm(struct sdca_function_data *function,
+			  struct snd_soc_dai *dai)
+{
+	struct sdca_entity *entity = &function->entities[dai->id];
+
+	switch (entity->iot.type) {
+	case SDCA_TERM_TYPE_RAW_PDM_MIC:
+	case SDCA_TERM_TYPE_PDM_RENDER_STREAM:
+		return true;
+	default:
+		return false;
+	}
+}
+EXPORT_SYMBOL_NS(sdca_asoc_dai_is_pdm, "SND_SOC_SDCA");
-- 
2.53.0

