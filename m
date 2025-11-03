Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8613208
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 09:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762161415; cv=none; b=rA5tlQqxX9sUzSH8VcY71TBYTQDAHdgix3DQohJccvfSvrWfUQo7aP1EuMXI/GkU9ChLWA3+C3Cm8foR7LaVfvHCfS4SpRFUZ6/D3aMVB0IlOPVJCXNYaMHzPdFPwP89IVQ/yTL5swsygVZqu+vYKF1IePeGJAnP1QG5ErCZhB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762161415; c=relaxed/simple;
	bh=2IeCc6Q9U4zocuwpSGh8p4S75mrajureXpVY8hFFJdg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PK6NxNVipThwUNpXCjKXkUB5mZ16bKIL1ep3RWPbhWhXT7UIJhOtwLdKDy4UNuil1grdpnzkZ9cte87noyqXydxDbeLD6x0lj2aO2J8yr6vRJU9HZM77qej5iTJHiuGOEiXzfVzaRd1iDWx7u9jP4eYkpmny4oJfoDDFZCM6OXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZskcJEC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZskcJEC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so28650695e9.1
        for <linux-sound@vger.kernel.org>; Mon, 03 Nov 2025 01:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762161412; x=1762766212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5FY4yZd+8+e1VpEvMXaCmM90mMbAd9aE97qyTSIgeIo=;
        b=hZskcJECqklAVTZvebN8LVXI8QK4927UIDn7XrjfA+JctjVv9sWvccg8VW54SDCR6L
         zZiYPf46TBDExLh2+eX2apzlBxraHwHH35PYISJusY5gEZcUC53mD5B4cjd+msSYWwYe
         iW7AcNZugBt9a5N7f0xUgD5NbKwjENG1CmaWntl6uoxB/L/+Gxsmg6GSNLu4WkSmnOsy
         4xpvLXBNIqnP1j09+r4q7Mx4mV7Vp6gJ5+wxoDn0yuBvuJppRosZxvJtPfUZT1jIRf5C
         wytNY6K0vKhw1bBn0c/iVC+TNaLgNKu08Lm7NBB0XSr02FjUhtX+SeV7Ufi2JGIe/q8A
         bM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762161412; x=1762766212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5FY4yZd+8+e1VpEvMXaCmM90mMbAd9aE97qyTSIgeIo=;
        b=DpOfDiSWTHEpn7BNdujDy4jpiHcdykt8MuBEBFugnBHpbKCRGR4eUkjC0qZiO4Fg73
         nqRkyL28gV7JH5GljPbeRevaCIMWSjhswC5evr3Nt9yuxqlYthb+zdZZh6uHphYLvbO+
         UzP5kQRQgABkGx9eFBBr9emad0ST6Arvpp7cQxFib8yKHEQvYtD+3l7rC0FlkNdyeEQ0
         oJUdRTPpOGSeYH3fruRnDYfFKmJ8JrdOGB8H/JSgsWcSx+dsO3bSgpOee4OpcTkDS6e/
         Fy9zZJfecdzwjxn3iAj5+Hej1wh5NCCyZo2LbXIAsugltHJ287f1GRDsyNYOnKhroS7w
         pq5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYHzkeYDoLKHL8jEKGPr5l9SQ1N66wosV9YI6Vwri7Vo78j/wtYBS99D5KXOqBbCE71YPNYIA8l+LDMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz96fHsPNAA8Mpl9/HwAk9cLx79g2a6Z35sEZZSxb/Y4cdR0qXb
	6McyVBSqYd5Sn1SMGRBo+fD/5NQPtnV3WUTqy7dAhtweoqoLDAo3pI0W
X-Gm-Gg: ASbGncsdK06QSF7LF2ce0Q1HPy9Nxaiv00ucHz/b1qLov36b1+RNNVWt5bR6FRbrj1s
	GEks3dwis6X8zWxYOZBE2hvjVkjm69HGiLKxOvekhdwKZH726WMYnK7V1jgum2ahis268SIevJr
	z01wIarqL8GR6CXGVboYHOj5D07uNsPcYCgXyZ8KUhSz5u1yYrmIscIYDns1fhbGs9CgVMzWTaH
	DnSAV8FV6bZ8lrZ1DGQ67TakkVeKwksv1RItvcO+YQGSqBsW20z1wgj76gqg0rTlG4r+Qjb79nj
	0Kg472O7p9W02psdDVxVLK63Ph+z0iSlvc9+muMbUB62gEisnKtZ47qR5bjZkGyk3KIsbtRXfVG
	s9yzgBAjGoaS+zmagP0m2a41YEd9Ue9tCSxbYuOrCROut6hvBq8XGeY1uqN9VFgCwnKeILSkVx6
	wRRPtbKfsERG0H1PLIe60u7RsDnwG/J8mWMqPVfFE4DO9PD33RJLIRlg==
X-Google-Smtp-Source: AGHT+IEvbTPT/ulVktdS7tm2/L2XXCj11U41+OCTJ02/t4xCFPeq8W9WZ1lIUhbFac4pP1Wyw3/RtA==
X-Received: by 2002:a05:600c:470e:b0:45d:dbf0:4831 with SMTP id 5b1f17b1804b1-4772fff3296mr107600915e9.0.1762161411513;
        Mon, 03 Nov 2025 01:16:51 -0800 (PST)
Received: from sharique-Precision-3640-Tower.hw.mobotix.net ([213.183.84.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c4af7c7sm145158015e9.7.2025.11.03.01.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 01:16:51 -0800 (PST)
From: Sharique Mohammad <sharq0406@gmail.com>
To: broonie@kernel.org
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	lgirdwood@gmail.com,
	Sharique Mohammad <sharq0406@gmail.com>
Subject: [PATCH 2/2] ASoC: max98090/91: adding the two virtual Mux widgets in the routes
Date: Mon,  3 Nov 2025 10:16:48 +0100
Message-Id: <20251103091648.771947-1-sharq0406@gmail.com>
X-Mailer: git-send-email 2.30.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The two virtual multiplexers are now part of the alsa routing.
The "DMIC M1 Mux" now sits between the primary digital mics
"DMICL"/"DMICR" and the virtual multiplexer "DMIC Mux". And
"DMIC M2 Mux" sits between the secondary digital mics
"DMIC2L"/"DMIC2R" and the audio out interfaces
"AIFOUT2L"/"AIFOUT2R". This patch makes sure that the M1 and
M2 mics can be switched On/Off independently, by default both
will be enabled.

Signed-off-by: Sharique Mohammad <sharq0406@gmail.com>
---
 sound/soc/codecs/max98090.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 6c3c09236ab4..3561d4b622e0 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1325,10 +1325,12 @@ static const struct snd_soc_dapm_route max98090_dapm_routes[] = {
 	{"ADCL", NULL, "SHDN"},
 	{"ADCR", NULL, "SHDN"},
 
+	{"DMIC M1 Mux", "Enable", "DMICL"},
+	{"DMIC M1 Mux", "Enable", "DMICR"},
+
 	{"DMIC Mux", "ADC", "ADCL"},
 	{"DMIC Mux", "ADC", "ADCR"},
-	{"DMIC Mux", "DMIC", "DMICL"},
-	{"DMIC Mux", "DMIC", "DMICR"},
+	{"DMIC Mux", "DMIC", "DMIC M1 Mux"},
 
 	{"LBENL Mux", "Normal", "DMIC Mux"},
 	{"LBENL Mux", "Loopback", "LTENL Mux"},
@@ -1453,6 +1455,11 @@ static const struct snd_soc_dapm_route max98091_dapm_routes[] = {
 	{"DMIC3", NULL, "DMIC34_HPF"},
 	{"DMIC4", NULL, "DMIC34_HPF"},
 
+	{"DMIC M2 Mux", "Enable", "DMIC3"},
+	{"DMIC M2 Mux", "Enable", "DMIC4"},
+
+	{"AIFOUT2L", NULL, "DMIC M2 Mux"},
+	{"AIFOUT2R", NULL, "DMIC M2 Mux"},
 	{"AIFOUT2L", NULL, "SHDN"},
 	{"AIFOUT2R", NULL, "SHDN"},
 	{"AIFOUT2L", NULL, "SDOEN"},
-- 
2.30.5

