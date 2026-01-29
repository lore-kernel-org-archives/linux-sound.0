Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04E3352F9E
	for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 17:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708895; cv=none; b=K9c26iw3TAb109fbDoNyJjFcKwUHbpnx3sOOH570aLFtU1UPp6pkjT+38BIOydwwRJRSiJHKNMcUUcTNLLisHZ3nu9DJub/A/O/AgwYyivhXV6uCEGsNFK2XVsNWu9rl0/3U/QFdgQvad0+KpOXpyMRwFX8qnooOimCy0QYrGZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708895; c=relaxed/simple;
	bh=3p9f0oBTbCvN3huKUC5Fqo7rjbFyN+f2mmxc93F5iuk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h8ewjhxYr7S6YWCl43Ua9nhQDICyfP6bazHa+DGQpBnEiD/ynsweSuke0OidiwGn5Uq8kswHds7nxIPDToa6HogTRPutCYYwzaCl66pUQYsHGlXJpefCQqmxmcZgkO1BLba3dcwtkBxMKaxMC4IIloSnpfo3g55nT75KLXdQyq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a55tHvMd; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a55tHvMd"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a7a23f5915so8120555ad.2
        for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 09:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769708894; x=1770313694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cLFk9ksyoLVi/BCU0LuLGmhoj6NNVPq1PO9IZbiIG8=;
        b=a55tHvMdOe3eFb5zbfIi0EznRxquKlWU1ZcbmYaeJ/HaU7o7jm1vrhlMranmlzXAGg
         PRpnmQjcZxfpwELXeqdSylwnFspafeM5DyTml0j/zRC691gIEIinHeK9MQ6/AmvTpmDT
         q7ECJjlnezAZ+3wD2iUf4lHzrSqHiQ172KcoFv36GjKccWclKBFxlkyeQ1AuUJyYtS9R
         gY2XQaBRFUBEjEixQYPsoBJQqjN5EkuNrzgiWnBbMO+lzIAkgmcg0t5SQFaCG2TpGs3v
         +MDRnAIBm9jZ3B4o+OsmzoTnNtLhPnSwyHB4JY+KU2qUbopU+sP8WZsxDuaJaTjg9ILO
         N1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769708894; x=1770313694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7cLFk9ksyoLVi/BCU0LuLGmhoj6NNVPq1PO9IZbiIG8=;
        b=hTO8BlLAmjDivmF4JCMLgRCmzI/y4WQCP3t5zgLglu5YsMQevqVVMNUDuRyjQEIECP
         ZsfrevwEcYPHFU/fDLvaylnAy+CqFR4C2xi6pFjzCO00ZxR5b9b2bdukL0niliAuf3J5
         kPLKJj2gAMbW8+bh48JDiH1W3WzBUK07rP39607/DfxOKbkdE+fSZ/MQ4jIl7SHxB6HF
         RJO93D2M5NgTrcVi08tQOGLgkFpjBKC54PklU8BfLovf3rxRAU2I1F2AiAJXJ8Y+O/q5
         vXNf+WEKcNnf0n7Cy8QqUerciAMLVfXJ/mXdGRijyg+43RfYcDk7pHRU9wDZ+m38UQvk
         Tqow==
X-Forwarded-Encrypted: i=1; AJvYcCV3YouGYeWn1KGZWpxvm9q74/w/4GOdsjvHvFoO0rAgJ9bwdw7GZ1pAvlYm959N1j/nogxiWFexVnUziw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq1OiT+JJYT4QJuXpi5hhfmbVIEowVUIfnTfhH5utXuWo9SBdK
	RzrjoqJOlGiZjrNRaBeRSDd+6Lwo0Cvt/MBF81A/IOAnLdFIY6NqwVjy
X-Gm-Gg: AZuq6aIdcVVwV8rM/wSqEjSrsuawwPX9UxFUH/mZNUkYOAlPNiEA+apGNfmWDlzadM8
	UUKRo6hQsI8hT62aGJ0AtrTiCTVfTgxyIOw8XNkVnb4g3jNFMsTzNmI5LQqA4Xkc/4PMAqCp4CR
	yZFxVBp0enzCUwjDK4gziy5Tq+Vb64ifNKMQ13UJxCo/JYmTQhugfeBWNAsESKKriqDCgRrB+ZT
	kwaLWr8cSx9GAAmwGCH/ms4lD7wQ8zgIg2sXAlVmLb2BwiB+3uE9tvjRXBxuNtSYFAHH9ZWgk6h
	cn/8+hkJC7+mnqT2WK4hw9MQJ5J5gkqj8ioxVmtOfsKVsbY/izHORp2QnkOg/DRIiUOTxi4g2NL
	fK5w8AkCw0lGdrBi0i/Z5v490xz0xVqk8lUXhyQ0HlRyqHr9NpdVV9HCH6JhVbKYZ7UyMU3y7d8
	YslWzjVDzskqGrq4XpERMLrGjz4Fk8PjfmSfaQv1P7E0gY6o1z/4zvNclLcqXYH6u1s1aU1oRK0
	BWy
X-Received: by 2002:a17:902:f78c:b0:2a7:c2d5:bcdf with SMTP id d9443c01a7336-2a870dc6df9mr94289725ad.37.1769708893708;
        Thu, 29 Jan 2026 09:48:13 -0800 (PST)
Received: from localhost.localdomain (118-170-231-131.dynamic-ip.hinet.net. [118.170.231.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b1esm53978655ad.63.2026.01.29.09.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 09:48:13 -0800 (PST)
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
Subject: [PATCH 2/3] ASoC: es8328: Propagate errors in set_bias_level()
Date: Fri, 30 Jan 2026 01:47:32 +0800
Message-Id: <20260129174733.6660-3-hungen3108@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129174733.6660-1-hungen3108@gmail.com>
References: <20260129174733.6660-1-hungen3108@gmail.com>
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

