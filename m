Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190B93CFF5A
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649559; cv=none; b=fIcsXOVNGHfM0gFZwyPNY98KDamBRrFzthPFbm35amLvozRTwoKtPvqvOsjPOCUKw3hrAqLSqISSsN/2CDcfYVniQ7sSQKPp16LZKWr7Zy3TyTdN2dF7BKvV2M2djTI4RKlxt+/RcfkVMZsIhNxaqoTKvD2V8Sft1lES1mL8iO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649559; c=relaxed/simple;
	bh=3Oj2W0pEECsgpO0iuq6+ChxJG/Mvhptw7wJCXe06oJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U3DTebPs3bHhaxC89CdnLHyg1UT9qQp37ru34ZZT7oof0JWrEftKiTUIQNDlH0IQv8s7fMkiYeoSrpogFejchpibZyvAUxwPs6xcY52wGoF/kwNIsNGS+N5L7at8L8LhgnO4f6X+BaI3/u5Qo93Q6MLcx9KRxAH2BHSo4/ogJrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSgOxb7O; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSgOxb7O"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8ee7ffd738dso301350885a.1
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 08:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649557; x=1778254357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQUvsQIfk5vYZwtv1eo4/scSL1Ijdz6+kHawXrTWGjY=;
        b=qSgOxb7OFBeZpF/zDPUpZQ6Q0x1YVhtFyri/uySXo1opYd4dTqbnIhbIZi7V43xUNK
         Iva3YLeecUyCMVQMw3uyGb9welUsJj5/eUckJF49MPUghiQRmi6ekDoIsmPt8of6J7ak
         qLvkjAHW2v0ivyYuf5fTaquJjbLfM713YuT/cGDF+xc/bE4KA6z4YCWCokZX20OXYw4i
         NnKIkAEytsN9OGGqtaaY5qcN/X5v9/4FiMnogL02IRPwFjb92qISXrB9/y8hkfVbB9I/
         aJO+UAEn0Y7r0ctcHh6D0PDUJhMi2P7LYZ41xlCNFT/34aPLSafJK2HGWW0FrnV3IsKD
         0eJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649557; x=1778254357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQUvsQIfk5vYZwtv1eo4/scSL1Ijdz6+kHawXrTWGjY=;
        b=gJ6MCZ2Q/qz2NNsETgsz/WosP/+8F3e2GvnW7HfnNPdnBZdLRCm+E2AqV0rpMWmPbu
         Dm55lyfAo3lkT3GXRKS/GpxME+BRgv2eaII4FZQfWYbdSIH/TxJRfeCvO3iLT9Wr2X5r
         M2s0Riex94ZJtlkMYes7/+8+o1TFVCc4sfHzYC5SDQzo4w8XrQSlEM+Q83E6S42a0Q7N
         r7BDrWg8BM7QZxc1rBGhrBazxZhvHzJYmkeYMzYb0I6j1p2Sw6xWwHySObZjISvr6Ey6
         c8sMCxn16WygiH0CKjN8LmHeiVWLwlhDH+zG6YzHavPnkh4Pg7gUevwPFpJlqfiHk3+X
         md1w==
X-Forwarded-Encrypted: i=1; AFNElJ86LLW2mIk5WAK+4RZXFn6MxAMWc53iwVtB63614pvojltAOsZmaRfMkSTHzigRBr2MeaY1ni3ctJ99iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSAF4wIdy3HyzSwVcAlI6LT4TJlNKQHJNpy6KTPM3RZLpzxiHn
	uK1Qko/n8srZ1OfpR4jom4Vo69ISQN9oi+0efNMTP/4ppiBbitRflxgx
X-Gm-Gg: AeBDiev9mGEUtWpk41o3cs5wEwMv/VJnahB40T2lzOU4YdhUZqCkSzp0A56lAa07xVT
	7DkfEgPS9DtkgTksbOvXJA3ypMRfWFlLL6dYUB99UlvYHC3hCl/w4ACMHFdPumibqpJVIZFANpX
	wA/40kVS+CNb7vtW35N4JW2/fKDvSUrhEi9atTS4Ti76aPDdHQPQlBuzKXVCxFKRq57mouH+8hZ
	CFDm9B0LN5u2tFWxyXgcniyaVfylYBpefyu+JMI/PwPsV3VeKNSZsb6wgJMHtzsKgHjfSXRWfgr
	yDmN3cXLRZInDbF4/DpzRqwgI+vEXV99g7BvJfcjf9D+Kffs6vS2ZZvWSGhP0OvCFeoJSXbk8VD
	MCQ+9t1Udh4Yn7faUgqccpmaqacgKjiEcAWB7qOzm+g8Y8o03RUK15pT6Tt/guvec5B7ePfo8u9
	q6AIhhy/fUDlaW/Rplq+IqVbU98Ohx2yC4ZeE7
X-Received: by 2002:a05:620a:170c:b0:8d5:e63d:95b5 with SMTP id af79cd13be357-8fab872d2c7mr1002912485a.2.1777649556985;
        Fri, 01 May 2026 08:32:36 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c34a0d4sm186846585a.25.2026.05.01.08.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:36 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 11/15] ASoC: qcom: sm8250: add support for INT0_MI2S_RX and INT3_MI2S_TX
Date: Fri,  1 May 2026 11:31:24 -0400
Message-ID: <20260501153128.8152-12-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The INT0_MI2S_RX and INT3_MI2S_TX ports on SDM660 can be connected to
the digital and analog WCD codecs. They can be supported with the same
logic for other ports, but just need to be explicitly stated. Add
support for these ports.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/sm8250.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f193d0ba63d0..b8f1c91725df 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -112,6 +112,22 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case INT0_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case INT3_MI2S_TX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_INT3_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	default:
 		break;
 	}
-- 
2.54.0

