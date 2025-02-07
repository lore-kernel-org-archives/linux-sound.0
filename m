Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA68B1EB19D
	for <linux-sound@vger.kernel.org>; Fri,  7 Feb 2025 15:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942086; cv=none; b=BC65e2cRwq1ewYM/M900L4O2i0+tIzDJRunvil7xu1yWrndnPSQCzDHDbluZ8H7npv6rk4v1Yctm60FcYELaSgKDIacO4YxZn5iqw+e1fP5bvPKFx45PLKi2Lkqs1//7AJHG6x57Gh4I4+4VPsF6T0ND+Ca/zdvV9+8AFjhM1/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942086; c=relaxed/simple;
	bh=Q7U4e/3ZAqomUz5s/MfeWRrjkA+9nTAGxKwFub8kOn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P/mROVUyQTqPt1fIEfC+OpTa6i1Hm3wufq1E/DLqnUzu2mRlMtch3SNqwGWOPA+mfpWpIU32v7fX5b1X5HBkuRw+rEr8g9PyulsPrsdTddRLNRSW29KFeB+YvkN7VelF2nsBpursUZK1t6CTX8RT18Z/F9bUudpBbp5uuHCY9AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UvSJg/SQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UvSJg/SQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so24278905e9.0
        for <linux-sound@vger.kernel.org>; Fri, 07 Feb 2025 07:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738942083; x=1739546883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8R6ZmKIy8powAjSYsUDUo38qzhstaaaTVILoNs+rNp4=;
        b=UvSJg/SQ9oynYYgt+oDHsAmYdepz+d0p528dJWfPSPEgGiqnqClNB3b3+Qr25RbgbM
         i3gZnXAnJLH1tVrXCXWZ26Y1M9oy/7yW7WIWSCt1XU6m/sYqf1KNFjnnYTidCLsYOb5P
         XvgD+t05pRg1C74WRlhhJFw4vAIbzbjHBBMIsNXosR8DKSR2kl+bYw9D6ATUkalpNeiv
         iiDpHMhAN7HFteDuqcVOhLFeyY14j6gVyjdq13WSS+Hgh2iNUCStk2BqHTB+B8hxHMFP
         EAUCkAK69pFx+aZzt2GnThbFnZgnxW3ko7V8UE0mOWIjzQvsbjn6fS4MmjmJwNb0uLbK
         3A9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738942083; x=1739546883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8R6ZmKIy8powAjSYsUDUo38qzhstaaaTVILoNs+rNp4=;
        b=QVuX8i1/BnJzXx20OiRq33iP32VvEvYxUlAZBSW4dBXIzIZXzfJBkfdyq0oEySvWA2
         cKyTJELDZe/4TUe7ZsMyY4CotH4wOI209iWl7Ue5IboXxwUYiFxkoBckQ69TcBcherjG
         /BQiFI5Y3XUWMUB69bMP7QCruLkhAmTPufVGJRwzjTmmipEYXzLlsE0gQEM4G22T4gRJ
         Txc1lTfizATCXGhjVNGIPTDTyFQKiQvvKQy5HkdiwWkviZLAOehF6cLeQvpm2S/IUKHL
         0pGbJ/rK4w70qGHgq9boszoZfiw89mkXMh93YpAtG+rmOsx2lfxHLbqo4hR850TvCU8H
         UgoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnbCUhn7be5GvtNMvpx/xqBkODmP4R1KBUI1iUyvQAAf/mgYr6Bdc6fG6cMbg7JOiWx9Tff8nqEsU9Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHkivZQ4u8zOAZvKusj7JOugasubm4V7D/1Dljja3DfK+bS/GF
	bwt9+FZ+X1ItzUUmNQ6MvtH9B6vyuDLhwbeGvkduH6TKcfj5D3x4pY2VFIa25iY=
X-Gm-Gg: ASbGncteFkkwLQAl1T0LQyPLYrdizJ3K9ZB9MzxYeN/us3kmMu7TN71GpLpcqRKQuRB
	EZcIVjFgZDzsRvVCAZBU3SCi0dbloR1TwusHeMCL0ZxeP8/FHQeaL1k1Ygh/4DJ/3xHnwUl6aUp
	KaBeaD8lxFYM83/EpaOjmUvnKvucgw4Z73A/T8KER777i6pVabRZSBz/NA+7Td93C+mLlNidFa+
	9PPCZ9ygsEeN9+wfMt6kIYx+9un2hY1GzAckBEPXU1kxyTNvj+E2eym4MoAlZ4sO+ZuvCMmk2zM
	KSzO6i2TANDn5zEns4ou8bA2+t2b
X-Google-Smtp-Source: AGHT+IHTq5Gq6yAvA2qXZ1HWUGWrBJcM5rHY/xgBUWYVkXor56+zuLwsDV+i4iKaqHwtQyItHJRynw==
X-Received: by 2002:a05:600c:1c0e:b0:434:f218:e1a8 with SMTP id 5b1f17b1804b1-439249a8455mr30649435e9.19.1738942083021;
        Fri, 07 Feb 2025 07:28:03 -0800 (PST)
Received: from toyger.powerhub ([2a0a:ef40:1d11:ab01:88:c96c:f11d:1729])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dcae841sm56972275e9.21.2025.02.07.07.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:28:02 -0800 (PST)
From: Caleb Connolly <caleb.connolly@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: "Dr. Git" <drgitx@gmail.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: qcom: sdm845: set quaternary MI2S codec DAI to I2S format
Date: Fri,  7 Feb 2025 16:27:45 +0100
Message-ID: <20250207152754.49897-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. Git" <drgitx@gmail.com>

We configure the codec DAI format for primary and secondary but not the
quaternery MI2S path. Add the missing configuration to enable speaker
codecs on the quaternary MI2S like the MAX9827 found on the OnePlus 6.

Signed-off-by: "Dr. Git" <drgitx@gmail.com>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 sound/soc/qcom/sdm845.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index fcc7df75346f..4d8e00907b40 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -368,12 +368,14 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case QUATERNARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
 		snd_soc_dai_set_sysclk(cpu_dai,
 			Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT,
 			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 
 	case QUATERNARY_TDM_RX_0:
 	case QUATERNARY_TDM_TX_0:
-- 
2.48.1

