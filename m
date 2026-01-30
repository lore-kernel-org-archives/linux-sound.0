Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CA03093C7
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769788832; cv=none; b=YAlA0wRJarjXAKElDPlkC8t3XeFMziqgQsiJRN9FabtPuaAqZ18rrggic18tw6QDXHBiMAp/XniFqEwhluhB5CxsrDee8fgs2bbc6W2trmX1JryW3A7BB+I0JM+rI4i85SCVUvj8wV9+Y6LZbZ1rBpceuJHd7YTfXIp9/qq/9RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769788832; c=relaxed/simple;
	bh=3p9f0oBTbCvN3huKUC5Fqo7rjbFyN+f2mmxc93F5iuk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DFxNUJ/06iJ8yotIeLb1VJdiSasc8PEjGS4JiNP8nrQc2nDLpFPUOxdgx2Kd6fdnRqng/Sv4SEaezJeaNaVHv2lv6Q810ZqJIzxVCkLJ69tnkhDQNxZlIJ13gXxNSJEklwe3ThgW5CKaSoh8MmdTZAl09WnHU+52F5PdYosrEuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHr7u+d3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHr7u+d3"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0d52768ccso15291525ad.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 08:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769788830; x=1770393630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cLFk9ksyoLVi/BCU0LuLGmhoj6NNVPq1PO9IZbiIG8=;
        b=WHr7u+d3xqNa6Wfa7sA2L0LTj0t4dAdEvJoNqaVeUXEbiAXPVLKSJ1YPWm025K0t38
         KWk+1dvnk3t0aP/TTVoktMwoF3sgFMfZGQcyPlx2eE/ZJLhlnXvvm8zEPL8BPHA7/3/E
         BqyY12uLAR3YgXhLsY9r1oOnpTQqn5PBBK6bDo/t0hprd566z6AhjaNdgyPIPC8ZpvkI
         G16N0esTq4LmoTqsgiQI+gaCzsVm6vmGllkdMha18Z2v9a6rSmD/bBUwKjhFLPn4SwL4
         VUHUiWe48qzuA189RFE9Hvd2cGbZWIL1JoUit+5+WOQWuQPKpqj3Cr0sMEPwUeiQ4lZq
         n+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769788830; x=1770393630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7cLFk9ksyoLVi/BCU0LuLGmhoj6NNVPq1PO9IZbiIG8=;
        b=UCRBqhBvfQl0/m5AWBetPVIecSsGDgnp+zUQg6w05c0KPdxKsa8Vmz95RgReROt5Gu
         cKoIA/0OYBzgA5Av94FIq1BHtxT4r4GSmqfM7Mf+epUM9DoZhKPKwsJWzWBIqaPO+yT5
         Ith/im3JnFYIaVO84Bcg+ntEdJKcVT1Ki0DEHTFUkNu+oo2fVJTNQf7/ZCzfzJjg7r3+
         z/Dgoea8cUP+9k6rLLxdYphGvW9NAEP2szuG8uEB4xz4nSiNCY+opschHH9e9qCF+P0c
         3anjahO3xG2lZlTVFs7SnbYZqP5iRgGpKDvlXa5FDcLaF9uETwF7s+V7AynYW5GdfTLA
         LP3A==
X-Forwarded-Encrypted: i=1; AJvYcCXsTUE5Gu7RlplBxERMIpK8TKz+kIKbw/oDb4oNCMa1Oh+F/aicMPWdazehFkozCndXNfVqVkPUJ2SSsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRSE1o35egKl5N2TNPw59PmwANC9jEHgmJxcVR8TPv5cjQWk/g
	ma71sQolXGO9C9BZr7r3Bde5TwGvAbeGDqZT3LJMcF2G0BBWgtuYf59I
X-Gm-Gg: AZuq6aIpRYp89abcQSg1PI5RMszhH1D/1+PTZqQN5wDYHnM0nNCc4qFci545TqnDgJj
	bUyJJubhlSeJ62qw32HBKYPlw35VMdFV1wS5dUH4JvwWrrFxXR44XItep9RtAfQ/IdFEid1f3Uw
	CZBwg0HyyTh6aABmTj9tbP333WcZjzbYPg+1cA2Fb/sXFrRxZwX0ZvuSHGptY1vK6aXeBtgk0+K
	qb1ji77MjIJ85rRVqBMXMQ7CQYlO/qI+tckpPgmwmvQ7Vh5dmuXuY4ph4+yUrpsMT0umz2WfFi2
	H+nGirtRi9iywjtuEuQdXR9aJayHO1GTqfLCiUR17P6aL06sxYh40b0J3pmQU/Ev/WpcIzx01fr
	iC2Ac42zZAk9ItdfyiWjDVeo8gocX4bNYNjnTHH+7OW66jiUy4OUwcCSe6uyYQ/WmHhGutA+Q3j
	enL8dsSszVKk09xl+RvYdINvxbiTffbByXZrZV92rQU3EEAprXRWl/YeMM/HsXHgbEn2cjEgw=
X-Received: by 2002:a17:902:8e8b:b0:2a7:bbe0:f01c with SMTP id d9443c01a7336-2a8d96a2b80mr25018965ad.17.1769788830366;
        Fri, 30 Jan 2026 08:00:30 -0800 (PST)
Received: from LAPTOP-LUFMQ4TC.localdomain (118-161-168-35.dynamic-ip.hinet.net. [118.161.168.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5df0desm82025645ad.82.2026.01.30.08.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 08:00:30 -0800 (PST)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH v2 2/5] ASoC: es8328: Propagate errors in set_bias_level()
Date: Sat, 31 Jan 2026 00:00:14 +0800
Message-Id: <20260130160017.2630-3-hungen3108@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130160017.2630-1-hungen3108@gmail.com>
References: <20260129174733.6660-1-hungen3108@gmail.com>
 <20260130160017.2630-1-hungen3108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register writes and updates in set_bias_level() ignored return values,
potentially masking I/O failures during bias level transitions.

Check and propagate errors from component register writes and updates.

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---
 sound/soc/codecs/es8328.c | 60 ++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 46868b7924a0..98fc798ff565 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -647,6 +647,7 @@ static int es8328_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	int ret;
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -654,43 +655,56 @@ static int es8328_set_bias_level(struct snd_soc_component *component,
 
 	case SND_SOC_BIAS_PREPARE:
 		/* VREF, VMID=2x50k, digital enabled */
-		snd_soc_component_write(component, ES8328_CHIPPOWER, 0);
-		snd_soc_component_update_bits(component, ES8328_CONTROL1,
-				ES8328_CONTROL1_VMIDSEL_MASK |
-				ES8328_CONTROL1_ENREF,
-				ES8328_CONTROL1_VMIDSEL_50k |
-				ES8328_CONTROL1_ENREF);
+		ret = snd_soc_component_write(component, ES8328_CHIPPOWER, 0);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component, ES8328_CONTROL1,
+						    ES8328_CONTROL1_VMIDSEL_MASK |
+						    ES8328_CONTROL1_ENREF,
+						    ES8328_CONTROL1_VMIDSEL_50k |
+						    ES8328_CONTROL1_ENREF);
+		if (ret < 0)
+			return ret;
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
 		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
-			snd_soc_component_update_bits(component, ES8328_CONTROL1,
-					ES8328_CONTROL1_VMIDSEL_MASK |
-					ES8328_CONTROL1_ENREF,
-					ES8328_CONTROL1_VMIDSEL_5k |
-					ES8328_CONTROL1_ENREF);
+			ret = snd_soc_component_update_bits(component, ES8328_CONTROL1,
+							    ES8328_CONTROL1_VMIDSEL_MASK |
+							    ES8328_CONTROL1_ENREF,
+							    ES8328_CONTROL1_VMIDSEL_5k |
+							    ES8328_CONTROL1_ENREF);
+			if (ret < 0)
+				return ret;
 
 			/* Charge caps */
 			msleep(100);
 		}
 
-		snd_soc_component_write(component, ES8328_CONTROL2,
-				ES8328_CONTROL2_OVERCURRENT_ON |
-				ES8328_CONTROL2_THERMAL_SHUTDOWN_ON);
+		ret = snd_soc_component_write(component, ES8328_CONTROL2,
+					      ES8328_CONTROL2_OVERCURRENT_ON |
+					      ES8328_CONTROL2_THERMAL_SHUTDOWN_ON);
+		if (ret < 0)
+			return ret;
 
 		/* VREF, VMID=2*500k, digital stopped */
-		snd_soc_component_update_bits(component, ES8328_CONTROL1,
-				ES8328_CONTROL1_VMIDSEL_MASK |
-				ES8328_CONTROL1_ENREF,
-				ES8328_CONTROL1_VMIDSEL_500k |
-				ES8328_CONTROL1_ENREF);
+		ret = snd_soc_component_update_bits(component, ES8328_CONTROL1,
+						    ES8328_CONTROL1_VMIDSEL_MASK |
+						    ES8328_CONTROL1_ENREF,
+						    ES8328_CONTROL1_VMIDSEL_500k |
+						    ES8328_CONTROL1_ENREF);
+		if (ret < 0)
+			return ret;
 		break;
 
 	case SND_SOC_BIAS_OFF:
-		snd_soc_component_update_bits(component, ES8328_CONTROL1,
-				ES8328_CONTROL1_VMIDSEL_MASK |
-				ES8328_CONTROL1_ENREF,
-				0);
+		ret = snd_soc_component_update_bits(component, ES8328_CONTROL1,
+						    ES8328_CONTROL1_VMIDSEL_MASK |
+						    ES8328_CONTROL1_ENREF,
+						    0);
+		if (ret < 0)
+			return ret;
 		break;
 	}
 	return 0;
-- 
2.34.1

