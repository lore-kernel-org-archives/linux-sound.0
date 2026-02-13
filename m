Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D0C2853FD
	for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 05:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770962370; cv=none; b=Q+eTUN2bOOGE3oOyjAHuDoHG9SbK4sEZeSKDxNWXjRc6TcuSMzESaEYj305ytPi0uMPg7/kX81CSQQQyB7TeRiH6tD02gI+aMayOaj5PJG8wAqmencLz25IugI0hLEI/c6uE20rjzii34CVA9hSwBdp/AWEYld5Xn8+5wgvCZ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770962370; c=relaxed/simple;
	bh=aduEP/x1OWA13RTfuIDX8az+RtqirA8gSrYC+uM0+10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Upjc0Tw0AogKY+0r9ngYf7qJZuxCXitjwI12x3QMD4q2T9vc21nkmO+SWBBjVfEFO5KA5IK3JZAzD4IRDuXQz0NlDXIYJ77welGfhmVtM/jJRncAOoqwDwCVq9U1gyNtA0Sy+850PUXiTSPtpP8tquRXSpqrN1MAunVL5ABTceE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEZJDo0E; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEZJDo0E"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so213719a12.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 21:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770962368; x=1771567168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=By2evQU0+bpbkI3nY3pZM5pIVC7vfX1l81rQSUaRuzI=;
        b=GEZJDo0EQ5vXf6lSkYWNLW0F1GBhQjJtPQ1OcWqRHsD4p0DyeTF59X+q4ViJ0DsOTi
         sWw0Upcn6ob7geqqcfntmRq6mQzHbAhv8d2+BqJihue4ULlFHUt3s9mUI67KXcgYj3BC
         j9E4j3H2zgS1FVZZP+C7dVIrxJBEBocuOt0SCzAygndgLERdLQnwAGEGC6MkXI6TNoDn
         ms04EXyKaF6bObh0omRlsEiCOTmUyK16xJEXKemfsJah8hVSc3/4AC9elUYxMJU/W/Nv
         tPcabGaxMg6znb0k0fa25otTiwtH35cGTR2q/EAh4Dq3kCWC1+EdCkBhjopdPn8a2SKD
         KIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770962368; x=1771567168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=By2evQU0+bpbkI3nY3pZM5pIVC7vfX1l81rQSUaRuzI=;
        b=aukxekQ/ikenihZC2SJvq8I3qKRTVU0iVKGTCQK9dT20dYd/FsAbVHdc8/mmVSmrYS
         t2loTHxFe53KRjlSinKvdHTBRZ+bHTOniECIW/+saXI7rvv2IbJvbIT5oo9l9BFjXtYo
         SLbwCemadp5dLlIWD9fZfeLMf0p0+zFLle7QYOeOitntie/MYg6Un9oQQysBRxCcTujF
         KpdndFA+5M1NA/UPKeyWrYE32iuUAj86vrD4I4mJ8z8OFrXKDVWWnS41OTguZ68PpGSI
         5gkwsLMsU7O74JVIlTb1Ixfw+AH0nj9RqSOpz6dFT90YREsFiPTPkS09jxYukTU7X9EU
         varA==
X-Forwarded-Encrypted: i=1; AJvYcCW6SOVSKuRjy+q7bUj4ixSOX7Y+2rlMy80smdn/Mw2mFjjjg2LRL0cG+Y1QNeAfC0f4ISeeza0CBdHZ3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRVfcO0K3cLlnJO6OS4h1MPhg2f4HZJUmrMBqEDJkAnkjKDMGS
	O5TD+mvS/ji1SM7MDtKdToLsJO/V3N2amyI6JiCzUAP3rQPOOQ0pvORZ
X-Gm-Gg: AZuq6aJ8+0XYdxd4wKVLaO1RCblMr7ZcnxCPghtm82WV9xdBVQREwZvG+mFjB8kt3Cp
	81s/t+jSG5CX/GPFRgCxpXLtgdQ2/SALKpxsygQTQQVB7c9s4YOPJal817unMep0g0Js6mSX8us
	a4dmjF5JaVaCQxLnTvfqte/V7qvVqKNQVkHQdP8uYvn8JSSQaAvdjE9jlnt1D6hp4QQfOq4mlXW
	zMpd9UoaFUec+F0GNMyLswn913kwkp63hi0RjfFSRjMfakcBorhGeFMr3sXy2pi5Xye5S8HxUF4
	hAB+20g971nnFRQcms0HFcqBkGL8VHHbGjWON0TlZXyodiFujlJPPeJOb4LcjM4MSi79FyPGdP/
	JW5/9UL8/AGyocuboMGwK8Q81gt19NgBZksSIrKIaQ17v8HHKxwJ3+ZtifywH32VOhd4lwkckLg
	==
X-Received: by 2002:a05:6a21:1bc4:b0:38e:53cc:3baf with SMTP id adf61e73a8af0-3946c7f5f8bmr866022637.17.1770962367975;
        Thu, 12 Feb 2026 21:59:27 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e1ac0e004sm6274588a12.6.2026.02.12.21.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 21:59:27 -0800 (PST)
From: Mingyou Chen <qby140326@gmail.com>
To: vijendar.mukunda@amd.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mario.limonciello@amd.com,
	venkataprasad.potturu@amd.com,
	Sunil-kumar.Dommati@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v6 1/3] ASoC: Add DMIC support for the AMD RPL platform
Date: Fri, 13 Feb 2026 13:59:02 +0800
Message-ID: <20260213055904.110256-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260213055904.110256-1-qby140326@gmail.com>
References: <20260213055904.110256-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RPL rev 0x62 check and reserve ACP CONFIG PIN 10 to 14 for RPL
platform

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 sound/soc/amd/yc/pci-acp6x.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
index 1140ed1cbb3d..671443204e04 100644
--- a/sound/soc/amd/yc/pci-acp6x.c
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -163,6 +163,7 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 	switch (pci->revision) {
 	case 0x60:
 	case 0x6f:
+	case 0x62: /* RPL */
 		break;
 	default:
 		dev_dbg(&pci->dev, "acp6x pci device not found\n");
@@ -208,6 +209,17 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 	case ACP_CONFIG_15:
 		dev_info(&pci->dev, "Audio Mode %d\n", val);
 		break;
+	case ACP_CONFIG_10:
+	case ACP_CONFIG_11:
+	case ACP_CONFIG_12:
+	case ACP_CONFIG_13:
+	case ACP_CONFIG_14:
+		/* PIN 10 to 14 is reserve for RPL */
+		if (pci->revision == 0x62) {
+			dev_info(&pci->dev, "RPL Audio Mode %d\n", val);
+			break;
+		}
+		fallthrough;
 	default:
 		adata->res = devm_kzalloc(&pci->dev,
 					  sizeof(struct resource),
-- 
2.51.2

