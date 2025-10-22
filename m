Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524F434CFA1
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761143648; cv=none; b=I8JZMVv/NA1m7pKlHc0wBBdRzDDEsinz9y6Jp/9iuQb451Yv86s7IzJGUpexwShzpm3n01Rzhb4OWencBj+lpzKjxZG19No3bb5mHgB6Jt6lHPLPCiyyOOXHkeBQ+3DN8TWZN4QTNgyxyl80APiy5ZIA8L7cE3puE1feIxo0oXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761143648; c=relaxed/simple;
	bh=N3ekUkk5r7V11hY0lO88UuCG6vkaZSYvwo4x85M1YwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j4aYitcDn+5yiwPdLLeGgTaoZsSzbzIzbGr+M8f1OuXz4j1tuU7z/o7jqHojEPvYMIcUxrI+Qy6Ni8Q1Dg35sU90UlumAy1k5ZwCV3PbBCOyZAJx24ZWnhywllnbjfJlW7Gi5HklrKIzvjQzlBN18yZcpM6RJtGvvKUn5Fbq00w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKXMumSK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKXMumSK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAUDpL005407
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 14:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LjQNhFIeUpf
	5JssPbJ0qx1B6gPLm2FuVhAcXynJbBBc=; b=kKXMumSKlLkFbJhuPzeLE77hSlU
	gHup/Ffj5oRKkz2thtdUJsOpZRM0mpkusgfA/TasdirrHyrXEV5VYQE7LbWqMnZk
	qEmZNloGrMMNiFUL5dEFp/H7iBuvamFSTsHCjgZaVjPkL+a/oVUFIqP33At0pYYo
	dvNsZZKn1QCT/QGFo3PAQk52nSVfos0BrcQox5lwyo0s/tnWKZYP1sktePS1Wkmt
	pF/ANwuHd5XKLVvDLDRTYfUn1m5gZ/7DQioA2/tF+OPKGvACsHsy1//WL5pQPHIW
	T0H35PCncs5r9yaLQi1zeaZjCCXtco7YZn6G8lB82V6a69jAaVgaeAkrg5w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfmwux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 14:34:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e88e094a5dso52477991cf.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 07:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761143644; x=1761748444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LjQNhFIeUpf5JssPbJ0qx1B6gPLm2FuVhAcXynJbBBc=;
        b=s/0kJcI8mYaUD8I0Aq86UvaXDk9IaamZceD61dNNGH4QxmcSENXs/6PtIG4Pc2y4Fc
         B9D+nPawdtb1fI5yEIaninpXUoc3RA3XSEgy+TXPD/mKz3k9nc/QpH4eO2+y70M70LD2
         OhR9ywPWU+zwfAwQK9XbWTurgHjFeteuE5oz0xp27AZJt6O1N8lIyBkscTPk0bNMDG+/
         B36HZ5NBTrrI6xO0P7Xg3ZywFarR4oePf0kBMw5bS6vEBlLa7q/TLbCHxdZbW5BdYiHR
         gzq4wMWvi4UqFNmrvQ+DlgJePy27ygXSLN1hsqvY02L+A6qqe4uWtD4mBP7HmU6ChLrz
         xsCw==
X-Forwarded-Encrypted: i=1; AJvYcCUpA/8gpZ/IN+dKA/Nz0TDgvGuYuBo1oO9CqYY0gPX/RCY1zi7mqh24W//UGhA/JgWH9zRFkPgtuand5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBYryJ21BopqIy7630zbrTrLZ+ERuvKs9KvZ/mjiq+yPY9wZ4j
	nkoa8ieaoKcx+L10IHcIrEmbEI+h6cIl8TbQq0dvrROx9Dz1hmKuoM3xLSq4sdVKO18Zj6yy342
	QjKH1TPJpY3y8zwzk6+pbCrRS+nY8URveJusut0DbJ2g+Lv8tdqGQnI1pjxwkeI7BKw==
X-Gm-Gg: ASbGnctwWKbXUo6t9in5n6+14zQAADpeLdDcMPA9YmrUXEC5mGYmZ3mmlKo/LEAkiO/
	xRVu7i4XbbqjWGRIm0VzeHcyzRA2Wul5N9BpzfENlfY1yxnk5yzaw1brNZCr/mb7IEQDmZzfpgz
	rxx1lvf6xbEVCmQfIYeIJCtyEBEN3qAojEox1BSJxE6gq2yGFwPxh/8Ub5vb+FzVlvVTPMawsgx
	TS0r9AOVq2ofupb9Z+hgC7407Z8W3NH4F+OM6php8FHDH1TllDh8bYQ0bXAAHIEG4PgvxobvYuU
	BG7HLfxZXEJSxq3kV/CCYu3zghdPc/8ABWur6UOl1XxF/H++194bHxa+6/BLKBeMhF35qAankBR
	rCfTkvE5g0eVW
X-Received: by 2002:a05:622a:18a1:b0:4e8:ae23:588 with SMTP id d75a77b69052e-4e8ae230a33mr206904561cf.71.1761143644023;
        Wed, 22 Oct 2025 07:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUURiqf2ZbYCHQYkeUwniA0/msOMU8UfHS5MceRvgrYZgwzEArKHXJ3RTzXptD3Cba0FFXJg==
X-Received: by 2002:a05:622a:18a1:b0:4e8:ae23:588 with SMTP id d75a77b69052e-4e8ae230a33mr206903991cf.71.1761143643611;
        Wed, 22 Oct 2025 07:34:03 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a993sm25544910f8f.24.2025.10.22.07.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:34:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Steev Klimaszewski <threeway@gmail.com>
Subject: [PATCH v3 3/4] ASoC: qcom: sdm845: make use of common helpers
Date: Wed, 22 Oct 2025 15:33:48 +0100
Message-ID: <20251022143349.1081513-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022143349.1081513-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251022143349.1081513-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jAsA1AFbpUeFloJJOAShG0kXPQlm6Js0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfXyV9IbBtT35DN
 VFwOm3tStaY32wynNtJMJCzpeKDWxJ3Ff2oNI5tOTgsDvv+hxV4TS/JT/9cxrhpaSf7+u/Re7wM
 nP2J4ywjHA4o0bEdkuEUa180AeUYGssd7Gbp9eNUTtxdzZN+l5rzqGLaZWGar2wC/PwtdTjPh5h
 lXvwRLqrf3otgcjftROsNqVyiDqKseeaXkjZzm+8RypIxMY1JLdpj39QHQHkjAjI6S+Ou9/AJjA
 1ZCL6SfD9eXs5hClQeNWkw6JjNE+87P8dhPP/f+h0jyKLSWcVcVToYIGH8EnhmcBkzEwYByky1l
 5yVjj8jpqTs08IpxYW3OxlAO/1MUPzJA9JEq8Qav37mA6olLiHgW9YlcPMvzDi0+MjCsiMCnGPr
 N7iUafp11jflLuZEpR7YkEResjpJZQ==
X-Proofpoint-GUID: jAsA1AFbpUeFloJJOAShG0kXPQlm6Js0
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f8eb5d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=5b0IN9Hzzi15MECZVvAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

sdm845 machine driver can make use of common sdw functions to do most of
the soundwire related operations. Remove such redundant code from sdm845
driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Steev Klimaszewski <threeway@gmail.com> # Thinkpad X13s
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

