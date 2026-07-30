Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC13445AD3
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 17:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433469; cv=none; b=um28QZrgAUC1JBbDHUS6Mne405wQoUUGeRpkcdB3Jt8gHSD4JEYlSjaspJhE2/rAHx4fSgffSF1Cf0ZONmo60vvIZ0yMP2ObsvIMB2xOSifvxRgQ5ESydt6GzM4f2a8LS/d+hjuSnaFKwJHzgg0i7LoU4ciHxlWrqYz34QPNSOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433469; c=relaxed/simple;
	bh=j9vCI7MYFQbub+zVo37jZ+ycn799Z1jub8PWaH/JRu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eUh5VIcIW5AZsMnYSh2rv3hOMhrkXYbdGRj79BPk/OVLUjhPW4PCEkENVXp+mYKROttn6Bzw1koqDYMlMlOb4WPpS4anB3o6eghRF4Vut81M9ckRT6+vgWcZnfGbuXbeWy/Ik/OyhG3QGhD29Jf+dW9HOyt/1UYWrZHmvcMo8mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8geKsa6; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8geKsa6"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c2cce930cso482161cf.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433461; x=1786038261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EugK49fJVHb0zpjpqA3vUSpevCys/KR4Qdx7ZSAmJmo=;
        b=N8geKsa6rJ/GsSWcszSQ1FSMsxZxGypqQmyXq15yi5wcPgDRjX9HZ3uQX15eyALS3J
         xntRLb/YxwSgaH1+eLLR+PUC1Cx01SKLIKbvABfX3pIzq4GnzbQBsD9SY6nOiw7yPXGo
         jp4xKe9LuXj+mGGK6u5zOMPziKI9E5kt0WbQwMEmeeX2m7D/v0itK5y+YHJyQut+4fVt
         nanMsgEG6tj/1MI8H7KSbgcIfEMBbm0lXDpjl+mqMoBrfaudIaB/e2/FNJR6XewPPJUk
         Eu+80vnbz531+4KtUvvt0jmwTNh/AirmhDT8l+2UqyMGgFJikij5IaGUGvhtz0uAj4qg
         Jh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433461; x=1786038261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EugK49fJVHb0zpjpqA3vUSpevCys/KR4Qdx7ZSAmJmo=;
        b=eJJn+3gm99Bjhc1SbILrewNJeizH6M9OeaMlwvABpJ2dtdnnCgtIdKvL1IpRwwRJzU
         yqrDzbocBFStt8AC4k1Io2neEWuCTFTu/ZnuU7+1zhjOz12S513uzaKF0oRkVHR3t9tE
         Zzwx937K8nR8k3YHtn1b8rBclhp+lKPewOslZ6fhyOI00utCs9eiEfMQNThlrbxeapx0
         GZEVnn7r9hjWhT1m3QDT4EZeugyh0oq08zRZSt7lftF+RblKmQDb6KRanaXNxX1j5ZmQ
         ZCbbdqDo6j/HrJJBl65hbDwwFG6erWOKdCDOAFABD7CpsR1R36OMMg95MkQ5ii1rx0Iu
         0M2A==
X-Forwarded-Encrypted: i=1; AHgh+RoIRUZfMU1H1v+qENMMKdkLQ5Mt3JF+A2WQlrA+1eW7s1wmiLmN/QBqT+tf1gT1qo+9ZgCKzLE+zL9VCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQbrpgdYxTO7Kwt/xdt0XtsNVXYYSaOq6/C0DDspSFvvUC69vG
	tCRjEPkfPi3u5NpeITCT/xjAigLwOv2jYTCQwGBGzYgcPjTQeLUnvGdW
X-Gm-Gg: AR+sD137GTa2opCO1lvWRvObTRu+OIoJ0TuonZzACMT3UJPMWwSZ24OBynucjzFDLeE
	4I2MDwj9HKbsar1frmITdCr0sltir8SR+45uct1Ot9yifKmjdYbGl1Pox8LJ0j+ZyilbXkORbrl
	Yyq786udf4F/arsJqoArJK9yKuAQxN3b7WmVMUVFiLYaQxq4NLIRWZWpuXIDTngNWDt7RTnch+e
	Twaz6SBLmkFVw7+yEJHbxtFzesTVlNAEanITgbePilNqk0Vjr91R4vk6nBQxLSvbVp7kbMhHLBz
	25zpBVIbfEo3R0V69aX6bxVGcTkal5Tx1AzgyVzZrQeB18Q3S3FYl29CQ4NzNwHWi352PXOrrHP
	Pn8JuoY9TsvbUUgmbJGzqCOU9QmHdJy+JrFvndL9dhL8Me5UJtqHFYQ2XYbobMPhIp1Bw4m7V9q
	+R/50AIf3NaUVif9PgtoaRFo+5DqWHm+HZg/jcmsX6hnkufK3WBoQ+vqyk/8w=
X-Received: by 2002:a05:622a:81:b0:517:5bc1:e1f5 with SMTP id d75a77b69052e-52b381e85cfmr37513861cf.0.1785433461345;
        Thu, 30 Jul 2026 10:44:21 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908322fa713sm22425916d6.6.2026.07.30.10.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:20 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v6 06/15] ASoC: qdsp6: q6dsp-lpass-ports: add support for lpi mi2s ports 5-6
Date: Thu, 30 Jul 2026 13:43:44 -0400
Message-ID: <20260730174353.108023-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
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
2.55.0

