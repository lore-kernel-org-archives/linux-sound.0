Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9699F3BD64B
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 16:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022189; cv=none; b=PR4TRc2y4o8HV7YRwv0TaRIZIU7n0CJcUO8YxQSOrXGjyioSdMmOW2zEowK2zaGjwaFNPPlBLLrfOzmYbHuBqpJVnv6YsEMuoRQQqWuZBQszHcrWiWGwqtujL1VWFmq4obmQZWdj6089UF4aLACo2722mg9AdPoZmflxClel8ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022189; c=relaxed/simple;
	bh=X1blx1IfE/S2XwILbwkaFERfov8+N6iDeA0KBsBTu58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0S0EK08hfT+7lcTWnG24g3aAMNTU8HI1NZyzBda0/DHMJc1xmQTKrVdWcMeZa9cggZhgMWH73Fj0va1GkJATlbpbnKCrde8gfaQVmtb79WUYkg0uaqdyTHgMznlRlHDEj0KbVE46D8sfiSI6yFt4xvjdeJdXovse3HZLTgH5Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfGDmFNQ; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfGDmFNQ"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5177ad0cc67so45882931cf.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022187; x=1781626987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeJyh4JLdoSrIjHhlptP34QNHBNQ4psdrJrN26Yex0k=;
        b=ZfGDmFNQTlPMuQFOxLrT9CSXFf10VS74NMxZHwbTU6KIcL8NrS/Tsim4TEFa+CGmrA
         hEYCTiZPprtTR6mCqZVRgu7RIhLjeU7HAEmD0uW4Kc7uRceyWR6eUC+ienZUiX4ggYj/
         3Ba5C27Cig4WRqq1O7pBqldnKor4zveh4KHrDdvjc740s4foVOiKg3ffsnfazoqnvfKo
         c0Kc/AzZK+2A/x7rHyIwaVWZDyG1iC+qNndog3y/VHmJC66DE5h8QjNnhC3YeHm2jbbP
         VDkMORQ3zIs4VA6fpKqSnDssjP/MMbqVGN0P6jT9P/oWkR0efL2XjYqeq1tuQKxrZnuo
         u91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022187; x=1781626987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zeJyh4JLdoSrIjHhlptP34QNHBNQ4psdrJrN26Yex0k=;
        b=RpMcf5YDLUl7F6LG01fvz7hHPQlEUCga6ndqHTUofcFGdQZG2vlT9asBA1A7xOreZE
         u2pnTQS0N5+rGfYmQ6JPr7UAGGF1/nV9Gh5wEg7X3d7yz5BtH7q8uqKMdk8nxjXTTqiC
         6LREr/zftobyPQhhY5Vw8sO87BzSbWlSVuVTALkT024kJpY1pvi0zdf9fKInqUEsLq/X
         42MC6vYSyFqMm6XvVSDljAqLZjSUdNsr7m0ZV5V0kI9h2aVrv885mbjahbCUu29wud4I
         BAP0/XEDJ2fIDzbNV6W/xj9qrYnk7eS8Oaa1/4UM+6a/0c5Z2wQ5fFIdsgmcuJaWQt+/
         ihng==
X-Forwarded-Encrypted: i=1; AFNElJ8jNqjZ6w0wBLt62ogJWCUK2MR1422uvTKZK2swMCwidbxFAGr49bliWvdDsP4ubrcVMnWS56M516QZPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa3W1aIXA/LNIf0CkHlorjEHtTxS/nFfA8ksF6psswu5jnOAB8
	YiMOPW2xHLNVl5XOg6u7is/TNjjVsnt50qYF83Y3hYrHtLTIwaEhg8sF
X-Gm-Gg: Acq92OGoM0SzCSB8kfjPtUe9sZRxYotMInqXgBNGO2xuwZuY/422JY/U6V03isenOhb
	dpA2CbO9sVUV6x359FI2wkELLsAIys1bZw4aPAfaZsJI5Et5T2aDdDZab0Fcggi+DSS+bity5f5
	8bQX0heDgOYubqkgb1w8fcGylm9qsPTwaqkCAtOT+rMiriEUCUiBS2W/y6W5nzQPGQ8g9MGu/f9
	NRufuWvqJn9f64Dz8Ntyk5fKeomXLwRuMvag+Xw7BQ3Kb9gDUncmuuc5pnvTk13eQTg6e7yqNVY
	6uvy9xEpXz+gNklpnT0sVjMZSX/SuHT3FHUq2h7dYAwQJbGP3Zxm/ira5qORdqf8ncC7tSrVmfq
	2offYoLrGm7FS0OUaB+FQLJOlXy7Vn+KWej02RWRokn3aa35zAAPx/H7CoJUMLmrhNvM7Tc0wh+
	z4atfIcZBjIyXc6qsM96AMmtQTokA408NDkyYNtQ==
X-Received: by 2002:a05:622a:98e:b0:509:23ee:b9a5 with SMTP id d75a77b69052e-51795a090a8mr287909751cf.5.1781022187522;
        Tue, 09 Jun 2026 09:23:07 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c54177sm209351671cf.12.2026.06.09.09.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:07 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 06/15] ASoC: qdsp6: q6dsp-lpass-ports: add support for lpi mi2s ports 5-6
Date: Tue,  9 Jun 2026 12:22:46 -0400
Message-ID: <20260609162255.31074-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the extra LPI MI2S ports used for internal MI2S on SDM660.

Link: https://android.googlesource.com/kernel/msm-extra/+/530cffa4cc977a348753831b163eb9d3302b954a/asoc/msm-dai-q6-v2.c#4597
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/common.h                  | 2 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index ee6662885593..48b114eb46a5 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -7,7 +7,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
 
-#define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
+#define LPASS_MAX_PORT			(LPI_MI2S_TX_6 + 1)
 
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index e5cd82f77b55..c3d8116ad503 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -553,11 +553,15 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	Q6AFE_MI2S_RX_DAI("LPI RX2", LPI_MI2S_RX_2),
 	Q6AFE_MI2S_RX_DAI("LPI RX3", LPI_MI2S_RX_3),
 	Q6AFE_MI2S_RX_DAI("LPI RX4", LPI_MI2S_RX_4),
+	Q6AFE_MI2S_RX_DAI("LPI RX5", LPI_MI2S_RX_5),
+	Q6AFE_MI2S_RX_DAI("LPI RX6", LPI_MI2S_RX_6),
 	Q6AFE_MI2S_TX_DAI("LPI TX0", LPI_MI2S_TX_0),
 	Q6AFE_MI2S_TX_DAI("LPI TX1", LPI_MI2S_TX_1),
 	Q6AFE_MI2S_TX_DAI("LPI TX2", LPI_MI2S_TX_2),
 	Q6AFE_MI2S_TX_DAI("LPI TX3", LPI_MI2S_TX_3),
 	Q6AFE_MI2S_TX_DAI("LPI TX4", LPI_MI2S_TX_4),
+	Q6AFE_MI2S_TX_DAI("LPI TX5", LPI_MI2S_TX_5),
+	Q6AFE_MI2S_TX_DAI("LPI TX6", LPI_MI2S_TX_6),
 	Q6AFE_TDM_PB_DAI("Primary", 0, PRIMARY_TDM_RX_0),
 	Q6AFE_TDM_PB_DAI("Primary", 1, PRIMARY_TDM_RX_1),
 	Q6AFE_TDM_PB_DAI("Primary", 2, PRIMARY_TDM_RX_2),
@@ -712,6 +716,7 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
+		case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6i2s_ops;
 			break;
 		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
-- 
2.54.0

