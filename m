Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55F1219319
	for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 00:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770943392; cv=none; b=lKahZtqkO35yoUL7arH3ImzmMnfI8EId+PAAX+7Z+0jSmUpy3cqesp2CRcit9sb6E/WRurLCPhd1cUNdbWvtZs1HNZtHIXtBVa65U9s4Dd6FlGS7u4kxCpD2IxNgEDnJettJ2ruOPCNkVj6TptQ8MVR7obvx+P8WjMjxLSQssu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770943392; c=relaxed/simple;
	bh=cblySNT3f4wlLu2dV0H5nyfjOHLxKZOKqjyBQD9iaLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTbo7VoX46xaUxfG4DrStGhlkUjN0fzTwx1NbPLp2Ep4/D+5XTwTCAFfJqA7SnPbBjrkSuAbmrfqmYxvel8Mrt5gHzT1JqJRfIgEcKs6jUCV9W98mtawqpKL5r77tRNy/bL64zmqqg5rRkBLDLS3t12mkqdfi0jkKPfvOtu3wzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbryxLIA; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbryxLIA"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82491fbf02cso233226b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 16:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770943390; x=1771548190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGMQCRCQKTuVegHpSD+D4KfbbIfy2OOUAnU0PzfQBvY=;
        b=YbryxLIArlIs/gfq19Xy3WKoR6LbagLWOYgTO7Kgps47cc7Wnbr1bjWN4W0ce9xyls
         SYPEYt0gYqKhZ9fq922rGfcAEdlZZvlVhpMY/alXA3O03g6bylqa4N/ztuojJM2nKMRG
         9261LbJvOHYSpziEqxPNCfbAC00HQWOeeTPByocyaD1l52MN78gwMnknJ8lqbadCZQ2F
         WSJiYYCsCwRsU+olJCLgOmRtzJzMfu/XYCQcb+xU+5+1BX7pd1yRo35+HnOV10+ZwNv/
         03RzIFrGy2iuc3srI0vJRtxw3WXRa+m6B1YVJB902cF4V3QjYUOiDwMGx4xZHRd4Buz1
         QBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770943390; x=1771548190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LGMQCRCQKTuVegHpSD+D4KfbbIfy2OOUAnU0PzfQBvY=;
        b=uzKKR23vEzUgRGlsva5BdX1w13gDjQf5BAjVPwiRkHexPjWe8KWldj7KFIiZB3tuQI
         GovsAIlusqhPoZdg3fCnyqcZvv+oh8UyWKDHwcB1prh3SfTnVlffD3136Y4qI59VVY8n
         URRgziDdaNGx9x88cbvRYOuLNqXsaN/8Au7ZBV8s/v6COzYo588zFTqcLB82mva5B4Fv
         /4vjotlvirgKG/OEvjxa31weyBAeGAYg957M/EYjRdSgHRZZ0a1RpsqWnEiHCh/bjBPe
         lAs+n4EKnhFJYprT3pJlssDVnkqozWOJGuSJF7KQSUXjr343YaCRQljza7kS6BGwLYlR
         0LQA==
X-Forwarded-Encrypted: i=1; AJvYcCXV1JiiZv7sks+vafHpU7jjq6Gu3ixO2mXfqvcsrQRWAhCVl726QsNupuugInSnHuejC51nakYgy54N5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YychluxBk974RnYSSDPxalwLaflkxoZvF5hRiJGW+aGWAM65KU4
	a7ctc509JKL8qxAv18+s1U6susop1d881t8Z2lv4wTxjKeqIpZ+th1Ax
X-Gm-Gg: AZuq6aJlyiqlXf0gXn5sGsQi+A7KDejQnvY3DMXf0VGgGaktJ9INHeXJTuHz8h4uhCG
	2IYG9Fqct+Jtzh2A9WzKMEv9qfwGJfyf34E27rzDUfsdawq14D038qp4xpPKBplB4oUIm5Awiht
	o2NQElWi44XBq4L2hirsV/W0c5zX7bRP+T7HbjCP0+zsJzlAU3AMs0g/+LSIGGCR8BNq2gyH8Ld
	XSF7hvpB+9sOQy+YFhCJJyRgl3jUCAtaX63/DcCkSNKqOqIADraj23Ww/lK91G3QcfkiiaxsN26
	FEVhV0TGc4MBIISPms4jORJZyX5zdtACQwcjxbJILozDGDoNHsMpCR1L7xEbUrN33O3xcAIqTXh
	RteNE3g6YmiMj3E8X5KZ6V7gostavv5B3K38COIzJmoGaACn67kd5i4FXRURitIjW7OljkRI3pa
	ISmILA9boF
X-Received: by 2002:a05:6a00:10c7:b0:821:807a:e427 with SMTP id d2e1a72fcca58-824c94b9b48mr239389b3a.21.1770943390141;
        Thu, 12 Feb 2026 16:43:10 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69ba2sm515751b3a.38.2026.02.12.16.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 16:43:09 -0800 (PST)
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
Subject: [PATCH v5 1/3] ASoC: Add DMIC support for the AMD RPL platform
Date: Fri, 13 Feb 2026 08:42:44 +0800
Message-ID: <20260213004246.16615-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260213004246.16615-1-qby140326@gmail.com>
References: <20260213004246.16615-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RPL rev 0x62 check and reverse ACP CONFIG PIN 10 to 14 for RPL
platform

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 sound/soc/amd/yc/pci-acp6x.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
index 1140ed1cbb3d..53c1910a8838 100644
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
+	/* PIN 10 to 14 is reversed for RPL */
+	case ACP_CONFIG_10:
+	case ACP_CONFIG_11:
+	case ACP_CONFIG_12:
+	case ACP_CONFIG_13:
+	case ACP_CONFIG_14:
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

