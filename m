Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15E22F39C1
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 10:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043218; cv=none; b=tyyqiEFqwzD7KGo093CaWhug84p0gCVMKjDNiMDLfFG6iTJ73koS3TZ9eBACIwQkGdIzeESVdGd1GalYLmKnWudT/VRYOfQxu7bufai/sH4kd00P8xK4ueO4fa8HCO5V0MePo4O+vEfAejLmiFKd58CerwotVmsCFUhc2cLA/ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043218; c=relaxed/simple;
	bh=9Yzea+GEBCp3vC14uyqotsmH4Z9Whw1KznKC/UswPf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VY5bO8sqElYZfrXm1ZsPl7y7e7hQeYIvJTn0MUEUYcSUgnJPzFmRDDh5T2F+u3deWH8fi4gEBnxED7ROEyZiFYwpvx5+Amg1pBahUA7SH9jJPkj7PbB3oOh48jzZyRl8JZHFQhvZUkjE4BYtrQjRYkrptBZbbhJ/4Kvi/UntDpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gR1GfUzy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gR1GfUzy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8Lw0j018809
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 10:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9AVB6C9MIvz
	52Jr3ZtdLA9E94f5FNRcURNEPb2LyudU=; b=gR1GfUzyMoN8DNVtiBuVCnEqc3A
	YcvvbgefWdYvJ5OXLubEXxX82R83E8yUrNv6+7KvwsbuIVsoTZMs5n3LbIJcvyk/
	2nU6i++/Dj9AsDj9LjQRAmq6F9/iMe/FQUd0F5fsXjW4v1TszHUiL+4GD027eEUt
	4/y9+ppZDTPybmjObHk53f5+crnUhLG+HEK6jZq3iGrYTJRogo6GuVSu8z4tYoi8
	Q2cP43wKfvSxCMjLhMYAsUvNSP2W0w3mCwlmZDzSyCUuZeYtXEo13AWiDBFpsmV6
	zRAKQgi3fwtMtku4OckBpu2s6OJ/+xg7mhBVoyCcGXPflszchxQsPC8nzdQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469g9us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 10:40:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-89087f3817cso806649285a.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 03:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043210; x=1761648010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AVB6C9MIvz52Jr3ZtdLA9E94f5FNRcURNEPb2LyudU=;
        b=b0CEtfDHor7TY4oiPW+GYv9sRSX3WJs3UuAkm3uQ6F4CSJVunOD+H32L0Hav/UCG8S
         SHEaJz2x3qS0/c8petHqR3NLY31WGgb+9ryUrsA4z/l469TuSJHEYccFbl7GoVaFcRnC
         zs6D07HOfaRjSOdBsTP7x58bB5ampfDG57pNy4OfLzjTZnVDWWGmJ6fLvzNb9DBVaK7m
         bf1BaXOue5+iNHeYXNSwFKOkFq8it/GaHi64Kru0rv1rx+AGkVsgNk2XggDxwBN9GX4N
         Y6/7b3mBW8qBqav1ix4aTIhgWKHmxTXtvLzMEiRIUZ+LF67iweZmbcAlGIyS9GblyBkO
         lCuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrz0UBhUiguDE5oPksLs5MSyqPBxH3fqYkXa7tH+kwopqbXyY7CcvWwEfVt3796AN6+GRYCE27VPLPpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSFZ7V/QGGULKndXfOCGzyv8taVucj5L/JUGA+TKKvotvcEPVM
	S0SML/bWgjom0kL56VQaVuelh73hNEPre7cJvhIzygpWgqfMf5KKUqhGBxH+gscuKOuiHaCQQEe
	4UzrqPHrGs7/BKZ8AtaUj7qqkI51YnCBmJ9Pt6UJW8eci6RmtfQ4lzikJ8RDcMEnnIA==
X-Gm-Gg: ASbGncssoSly7y7wpXolwMgndDWQYIiyKhWc+ApuCq1XXJ1ujAw6aZmxjimfUqjcT6t
	RgowtXEyBY4ZJqesZuND9pvJJOwJiHVJYY0k3hkGIRivc+25nqyuReLM8T9oXqCaSlLleXGt8Lw
	TDBBdVXbYsFHlPWllly9tlDEiZJCcmcJQ9/S3psKeZaYSQhbiZrPlsQ2i0ZO8ZF68CxK30p3v71
	TXzBQOUcc823z4dfb8mklEHgAdUPBEWDSpOdxhQPTgE0vGX33BFvzGkbqkCHaE8Lx01aDfq/Io0
	KGmB+qGkPPxSdg9U93qDTLZ4QMeFTUXbIbskyAHSpCcwLSZO9Z6ay2GDifgsNFcW+FmEd1kauZE
	5Bl2tpoaLQ0WV
X-Received: by 2002:a05:622a:1899:b0:4e8:971d:10 with SMTP id d75a77b69052e-4e89d209944mr206517411cf.12.1761043210296;
        Tue, 21 Oct 2025 03:40:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSGENTASX4ZCUyVauFbu72tSoTDiq9c99JISaWvIGYxlRh8iPGVUjzGg07n0JZACEeGKQgWA==
X-Received: by 2002:a05:622a:1899:b0:4e8:971d:10 with SMTP id d75a77b69052e-4e89d209944mr206517211cf.12.1761043209826;
        Tue, 21 Oct 2025 03:40:09 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a976sm20087938f8f.32.2025.10.21.03.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 03:40:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 3/4] ASoC: qcom: sdm845: make use of common helpers
Date: Tue, 21 Oct 2025 11:40:01 +0100
Message-ID: <20251021104002.249745-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021104002.249745-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251021104002.249745-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uyhVEq3pnqFZSSltXvilUP97tgbfc_BK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX1zV6vIdKQSzk
 i6FJcafkAWHBo4/MGHKC8fOT+C46UzDOviv8iHyaKSD4sPFI0M5sUcMOhj/XJhSR1kRSP8A1/NI
 8lSfHNIfhDU9MaGyXeguRtd6z4SP1EjQ/w9uy9K98smDFDoVG8H1x8jm9JU9egxl8vGsDzLXvTV
 8/RaRKxqZgKPza+DkolPez93AbIrl/DyTgtkcRuPoVzQGq/DxxTuyG5xGWBBAbdp4TvYPX8JeFM
 aeSt/1YGOXXR/LD1IGRjq9CvTH1B9RDC1JzIo9mKL7x/9Yyxzj+F1NobXugKMEGqjnzuSA9mTpL
 7QJq2zpjFDRUbO+KmvPrpeJdqIaj38aFLhqmEi/0b0GBSrGUbQE5syXt3M9KsZg+1EVHFG2WwYO
 87P37WX4xT4abwdMR74cN1TRreuTIA==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f76310 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=5b0IN9Hzzi15MECZVvAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: uyhVEq3pnqFZSSltXvilUP97tgbfc_BK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

sdm845 machine driver can make use of common sdw functions to do most of
the soundwire related operations. Remove such redundant code from sdm845
driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sdm845.c | 53 +++--------------------------------------
 1 file changed, 3 insertions(+), 50 deletions(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index a233b80049ee..e18a8e44f2db 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -40,7 +40,6 @@ struct sdm845_snd_data {
 	uint32_t pri_mi2s_clk_count;
 	uint32_t sec_mi2s_clk_count;
 	uint32_t quat_tdm_clk_count;
-	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 };
 
 static struct snd_soc_jack_pin sdm845_jack_pins[] = {
@@ -62,18 +61,11 @@ static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
-	struct sdm845_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 	u32 rx_ch[SLIM_MAX_RX_PORTS], tx_ch[SLIM_MAX_TX_PORTS];
-	struct sdw_stream_runtime *sruntime;
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret = 0, i;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		sruntime = snd_soc_dai_get_stream(codec_dai,
-						  substream->stream);
-		if (sruntime != ERR_PTR(-ENOTSUPP))
-			pdata->sruntime[cpu_dai->id] = sruntime;
-
 		ret = snd_soc_dai_get_channel_map(codec_dai,
 				&tx_ch_cnt, tx_ch, &rx_ch_cnt, rx_ch);
 
@@ -430,7 +422,6 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_card *card = rtd->card;
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX:
@@ -471,8 +462,7 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 		break;
 	}
 
-	data->sruntime[cpu_dai->id] = NULL;
-	sdw_release_stream(sruntime);
+	qcom_snd_sdw_shutdown(substream);
 }
 
 static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
@@ -480,38 +470,8 @@ static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
-	int ret;
-
-	if (!sruntime)
-		return 0;
-
-	if (data->stream_prepared[cpu_dai->id]) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		data->stream_prepared[cpu_dai->id] = false;
-	}
 
-	ret = sdw_prepare_stream(sruntime);
-	if (ret)
-		return ret;
-
-	/**
-	 * NOTE: there is a strict hw requirement about the ordering of port
-	 * enables and actual WSA881x PA enable. PA enable should only happen
-	 * after soundwire ports are enabled if not DC on the line is
-	 * accumulated resulting in Click/Pop Noise
-	 * PA enable/mute are handled as part of codec DAPM and digital mute.
-	 */
-
-	ret = sdw_enable_stream(sruntime);
-	if (ret) {
-		sdw_deprepare_stream(sruntime);
-		return ret;
-	}
-	data->stream_prepared[cpu_dai->id] = true;
-
-	return ret;
+	return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
 static int sdm845_snd_hw_free(struct snd_pcm_substream *substream)
@@ -519,15 +479,8 @@ static int sdm845_snd_hw_free(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
-
-	if (sruntime && data->stream_prepared[cpu_dai->id]) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		data->stream_prepared[cpu_dai->id] = false;
-	}
 
-	return 0;
+	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
 static const struct snd_soc_ops sdm845_be_ops = {
-- 
2.51.0

