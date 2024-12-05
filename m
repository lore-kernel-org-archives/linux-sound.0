Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9989B187876
	for <linux-sound@vger.kernel.org>; Thu,  5 Dec 2024 02:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733366033; cv=none; b=BkrWdp1QUkY6DL9h1FHwpAVUiIqygxQ/fieXcK/i3Op9v7rkyYZ0KnE4fJCc0LxzO1qHcWcO29PtbuDA+G8d0i5u3u9Kv0/suz8FyW2gF9HzDSg5aW0ogos+exiAjieqAjUBbWNvY3iCj5rpyxn8onhjIKoIO3d31rKQAyN5vTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733366033; c=relaxed/simple;
	bh=Isf6HQyXFroCVtEkXPHNWq7TOYXp0bv2O62+fk4lkgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wo9TgQcjgGKAU5iEW+ZSj90Iua+YEIE8HUZ0g7WmY2YIWGt2f93LbwPtOcJrBadz1nNCIhoerjCOWtlofcusE7FAxHtmJ/TtnFDS/CLl/XlZ60qEkLgzX3HOha0nmlStyNqv7JBIRhtMRiSikDFwv+LJ+H9cWO0uHHwtkt6zVj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IT6g/kwR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IT6g/kwR"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso3982855e9.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Dec 2024 18:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733366030; x=1733970830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0WueZqrue3ZzQaNIzfW+kCCT49wLDNKQcnxj9X3ods=;
        b=IT6g/kwRqP8YJTaqgoS/xqV+pFTufJ4suwULhsgu5kmLHpXvx4/pCncg9A1h0Aatgr
         TdBXCIAsNZf1CwWvAz1OXICZAr490IMPwcAYoVQCNrAiB7GGIedRT8AQ+3k0YxpyNADY
         HUbM0S23CtHstNqZtaQ0h10kVFYaxzabhX14ZF2KpDz+r3mZy+nLU937T0jnKbE2xieo
         F6N1tVNJMAoulZTyyxJmaHBIRmxMvt++RBRB9vHpb+1lXJOyc8UNAxDfefssa3buAXvr
         9G7BXK1NV+2EgaPZ2UM33wILfMynJXMrqcoFlA1WYjrtY9KwJSVfjgbFS/esF+VFXQTw
         jjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733366030; x=1733970830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0WueZqrue3ZzQaNIzfW+kCCT49wLDNKQcnxj9X3ods=;
        b=kZN3uCcEL2RNRe6eorbIUKLrlP/GKkEpBrLUbWqTyebAqeMfUd1FKo+8gsRzVPQXIw
         m91+qJhql8V5Ep/P9DkZmTjMh+oH4tqgVA2aaRtRT33AFWv9LxrR7zQvywqMh1QK0YUk
         NeelotQV7q675poZOPFjOFKcx8yaDNryH8L7HBjLokjjBN+j5pGH/+vAbmTqgy7lAXPg
         3nus2/O2gDZiIQNKm+bNnk3Wlwz5XrFvcoNMQizI35ZARrTnRV+8sL3EXuZPhyS7Wwxx
         mSh2yFiWvDfl3GP0kbtS+OlI3ZHaBkL9SQz1sEwM4az5exONGiTEJdGYSqZWkfHuFMQ+
         OMaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqUbFqoMmpSp6sv4G84XMDUGaC1Ea7s0r+t+T8RwHSEhIPrMMh+zrqbka6y/8vsWIPLAke/ot5mThTVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz91ysxyrYN+FWIEGC1juubheYKTBi5w3Lxwi7xPY1yoFnvrhxZ
	srmlE5ize7GIEs77C0SRKxJXlX8cAeazQSoj9lZX9d0SrOTNRLhnD52sYzryKg0=
X-Gm-Gg: ASbGncsfPPNnMSD/ayRRxV9NRGUI7Ro3wJwRE5mRbPcT4+AqLnBUedynBmNH/pjCWi6
	jT7hsrq5uKIGNIAkMl+V6IZao0vF0heyNJVIuhT5ZL/1LfdWX/pRPHcvBTHAIxFUyBB2k2ITMgK
	+xTBep4BfMb6ZPoPZoTVOgZmGyxT3nPAfGYCRuT2Uuq4hwtrHNatUSPAUxXgcm5W9rEwcNnwOBj
	r1PWZCEieMIiK0I/b3UA9F3R1MGNyy+K30x8698Q68ZfMEMv26cfmPw5S8sodmk1Ixv
X-Google-Smtp-Source: AGHT+IFy7VrnCoXus3t9ExkXEj7SDNYfG18p3P3BcNevba3EvsBVM2z1mEoPokrxMXPtnVvCqvzv1w==
X-Received: by 2002:a05:600c:34c4:b0:434:a8ef:442f with SMTP id 5b1f17b1804b1-434d0a23e6emr68510235e9.32.1733366029773;
        Wed, 04 Dec 2024 18:33:49 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5273440sm44444325e9.18.2024.12.04.18.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 18:33:49 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] ASoC: qcom: sdm845: add handling of secondary MI2S clock
Date: Thu,  5 Dec 2024 02:33:43 +0000
Message-ID: <20241205023344.2232529-3-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205023344.2232529-1-alexey.klimov@linaro.org>
References: <20241205023344.2232529-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add handling of clock related to secondary MI2S_RX in startup, shutdown
and hw params routines. The handing of MI2S_TX and SEC_MI2S clock is
already there so this requires only placing SECONDARY_MI2S_RX in the
correct switch-case choices.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sdm845.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index a479d7e5b7fb..fcc7df75346f 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -215,6 +215,7 @@ static int sdm845_snd_hw_params(struct snd_pcm_substream *substream,
 		ret = sdm845_slim_snd_hw_params(substream, params);
 		break;
 	case QUATERNARY_MI2S_RX:
+	case SECONDARY_MI2S_RX:
 		break;
 	default:
 		pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
@@ -356,6 +357,7 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 
+	case SECONDARY_MI2S_RX:
 	case SECONDARY_MI2S_TX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
 		if (++(data->sec_mi2s_clk_count) == 1) {
@@ -371,8 +373,6 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 			Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT,
 			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
-
-
 		break;
 
 	case QUATERNARY_TDM_RX_0:
@@ -441,6 +441,7 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 		}
 		break;
 
+	case SECONDARY_MI2S_RX:
 	case SECONDARY_MI2S_TX:
 		if (--(data->sec_mi2s_clk_count) == 0) {
 			snd_soc_dai_set_sysclk(cpu_dai,
-- 
2.45.2

