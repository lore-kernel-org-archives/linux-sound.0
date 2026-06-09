Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AB13BD22C
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 16:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022191; cv=none; b=hCeWTFrkN8ngLDWyrzj6pRrvgNwHIleVdnQx63HqsuLW3GdH1Rde6IVfVghnaMHBL7ygmaAsjVGiJd7lEk2DYyQ/pLPKdrEwHmTfQUldIjVb16mG5FU4X+M7PFg5Bb1cqk/8yl9wjLo9IqAOOlQmPxrCVltauVt9jNzzJACs2fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022191; c=relaxed/simple;
	bh=FK/Xo1+7OGaOkUMRMndcsjKlE3LLFqQDd4IY6JS3dEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cqTfMDGeeWqObM2j3NwJJBwdhXunOEJ3gYaDheS1S289cvVjB7FmE+5IFcCfE8kib9Lfs36Sby9Li6g3NCZ1yb3/u3TQ8atzKMoD565w9Af5Cah6uRTutGKaEl1cjiWzBhrrm8W6JvvDU7/ueHU/L40AN6N3JoQRCL2RlorteR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxyofvzP; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxyofvzP"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ccf887de87so66310676d6.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 09:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022189; x=1781626989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIljIJwduZvXpP8z610S7tWjj352/Xqlv3KKQxCSOtM=;
        b=XxyofvzP8xqPWtzaX21MQdb+s44e5kZ0xFcX8PRCROtGJ9Y/FIL/FGiGaYlWI8gSdN
         rZaS5N24PHwNM0HwHeG7XOmLmGHtW+UawwSVK2G6rEiMBP26p14PrZJRCNYVqIGaGKdK
         MtomORml/Z7VQQC5yT/SqBZ/LspjitYQxUbPO+CqdGBiQ88wNVbxL9AlNES/TJNGKl4c
         buA3PRsJ6GpIjhSZ0vINaxSHQw5iMNRA55KUGD9JVCYLVIIKfw8y+SRpsgWT375VvqH3
         LhcVuhGEwvQMRB4yldK/mmJnWBEQ0af4atPZS5mAy4Ce6qx+ZKrqx9C24wfteMVQJNME
         +OKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022189; x=1781626989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lIljIJwduZvXpP8z610S7tWjj352/Xqlv3KKQxCSOtM=;
        b=krz14hX49FAKtUuaW1NkxnGib6jUEJgG6PZ6HdJ4qbIm3IO4+JyV8sCn4UpiKM5Rk6
         Wu3UKhC8m2FaSU4amV6l8QQ/WpY3XYUZQY7qUkGtENiYW62Ss3Bhq6Qt6kxM6oAZu84e
         yPfetf33qHRxbqiMEd3J/znsO0nK4U+oOnIWfYdm41HFlyubM7QU1uaSK2u/9XZcBa2k
         250YzglVckLZpAzYyNo9pSmv7YJDqOadGmOSwU+ud51TKws4euUvTWv5WviNLJ2kHhRf
         EMmwgatBvgdOad/mONxjtCwNbWozKBAuWhducxFPTENlWIeszEt8kE7C4KjkzlNlNbDo
         ybuw==
X-Forwarded-Encrypted: i=1; AFNElJ+yEg3rEQF9ePv1incBtRT/nJ7FyGK+fY/ArrqZfLGk/3JMSx7qpNVwBtNMoGkbrioBgo76HT9v04hfjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBO4rM2Po7xahMIopYdmO6Jsfct4OAHCs89XWznifN3SI0ghaj
	+uQAvuS4DaKRUyYKZUK08IOWLIz/5KZR1fCA/QscyONMrswAYA0Qu0cK
X-Gm-Gg: Acq92OEb9oo2vDG5ErYcIutVNDHVl5SX9kU1r0TNhg4ndx9AP6A1Ubqgm6wIXQI+658
	ODbzv+XLpzhxjf9JAUWAOG266rHG3MjV1xO2PCRpELRCdfRIPFyW9reeH80GLZ+5QEsBXRzFEGP
	xhaRv8ZH7wu/fyICiML5KaqJEfg3ThZBIxkAulJSbgQZjWj5mzmx9cS8jIR04Gz7KrzUBLJPeaG
	W90lzDq09uTuEmoaCtrYHHAojuK/qTNUr+RMG5LBnd0zab46RP/9lW6UsvnAsHHIfIEZJAOBg13
	FwNsz9au+8zy54MEzSHLYoBbQ2Jq3TBpDXWAu1FsbzsG42xxmo+TNj9c5zm6HsTv5IiHHZPyWIK
	Kd/w9qeSq/udzy+jCq1XPlWeRH0wGSMpOpt8PJKhLjsZrxDcccPDDvgYSDcxLLOUgKOQ8Rciiht
	mti5IDBheXFY21F8ZdPAgXT6Krqda2eCDRHUGK9w==
X-Received: by 2002:ad4:4524:0:b0:8ce:b018:89f4 with SMTP id 6a1803df08f44-8cee6294424mr242129696d6.37.1781022189101;
        Tue, 09 Jun 2026 09:23:09 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd053032sm213808816d6.24.2026.06.09.09.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:08 -0700 (PDT)
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
Subject: [PATCH v5 07/15] ASoC: qdsp6: q6afe: add internal mi2s support
Date: Tue,  9 Jun 2026 12:22:47 -0400
Message-ID: <20260609162255.31074-8-mailingradian@gmail.com>
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

The bindings for LPI MI2S ports, originally exclusive to q6apm, can be
used for internal MI2S ports on q6afe. Add the port mappings for
internal MI2S, found on the Snapdragon 660 internal sound card.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6afe.c | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 40237267fda0..1d68a80e8e0c 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -132,6 +132,20 @@
 #define AFE_PORT_ID_QUINARY_MI2S_TX	    0x1017
 #define AFE_PORT_ID_SENARY_MI2S_RX          0x1018
 #define AFE_PORT_ID_SENARY_MI2S_TX          0x1019
+#define AFE_PORT_ID_INT0_MI2S_RX	    0x102e
+#define AFE_PORT_ID_INT0_MI2S_TX	    0x102f
+#define AFE_PORT_ID_INT1_MI2S_RX	    0x1030
+#define AFE_PORT_ID_INT1_MI2S_TX	    0x1031
+#define AFE_PORT_ID_INT2_MI2S_RX	    0x1032
+#define AFE_PORT_ID_INT2_MI2S_TX	    0x1033
+#define AFE_PORT_ID_INT3_MI2S_RX	    0x1034
+#define AFE_PORT_ID_INT3_MI2S_TX	    0x1035
+#define AFE_PORT_ID_INT4_MI2S_RX	    0x1036
+#define AFE_PORT_ID_INT4_MI2S_TX	    0x1037
+#define AFE_PORT_ID_INT5_MI2S_RX	    0x1038
+#define AFE_PORT_ID_INT5_MI2S_TX	    0x1039
+#define AFE_PORT_ID_INT6_MI2S_RX	    0x103a
+#define AFE_PORT_ID_INT6_MI2S_TX	    0x103b
 
 /* Start of the range of port IDs for TDM devices. */
 #define AFE_PORT_ID_TDM_PORT_RANGE_START	0x9000
@@ -931,6 +945,34 @@ static struct afe_port_map port_maps[AFE_PORT_MAX] = {
 	[RX_CODEC_DMA_RX_7] = { AFE_PORT_ID_RX_CODEC_DMA_RX_7,
 				RX_CODEC_DMA_RX_7, 1, 1},
 	[USB_RX] = { AFE_PORT_ID_USB_RX, USB_RX, 1, 1},
+	[LPI_MI2S_RX_0] = { AFE_PORT_ID_INT0_MI2S_RX,
+				LPI_MI2S_RX_0, 1, 1},
+	[LPI_MI2S_TX_0] = { AFE_PORT_ID_INT0_MI2S_TX,
+				LPI_MI2S_TX_0, 0, 1},
+	[LPI_MI2S_RX_1] = { AFE_PORT_ID_INT1_MI2S_RX,
+				LPI_MI2S_RX_1, 1, 1},
+	[LPI_MI2S_TX_1] = { AFE_PORT_ID_INT1_MI2S_TX,
+				LPI_MI2S_TX_1, 0, 1},
+	[LPI_MI2S_RX_2] = { AFE_PORT_ID_INT2_MI2S_RX,
+				LPI_MI2S_RX_2, 1, 1},
+	[LPI_MI2S_TX_2] = { AFE_PORT_ID_INT2_MI2S_TX,
+				LPI_MI2S_TX_2, 0, 1},
+	[LPI_MI2S_RX_3] = { AFE_PORT_ID_INT3_MI2S_RX,
+				LPI_MI2S_RX_3, 1, 1},
+	[LPI_MI2S_TX_3] = { AFE_PORT_ID_INT3_MI2S_TX,
+				LPI_MI2S_TX_3, 0, 1},
+	[LPI_MI2S_RX_4] = { AFE_PORT_ID_INT4_MI2S_RX,
+				LPI_MI2S_RX_4, 1, 1},
+	[LPI_MI2S_TX_4] = { AFE_PORT_ID_INT4_MI2S_TX,
+				LPI_MI2S_TX_4, 0, 1},
+	[LPI_MI2S_RX_5] = { AFE_PORT_ID_INT5_MI2S_RX,
+				LPI_MI2S_RX_5, 1, 1},
+	[LPI_MI2S_TX_5] = { AFE_PORT_ID_INT5_MI2S_TX,
+				LPI_MI2S_TX_5, 0, 1},
+	[LPI_MI2S_RX_6] = { AFE_PORT_ID_INT6_MI2S_RX,
+				LPI_MI2S_RX_6, 1, 1},
+	[LPI_MI2S_TX_6] = { AFE_PORT_ID_INT6_MI2S_TX,
+				LPI_MI2S_TX_6, 0, 1},
 };
 
 static void q6afe_port_free(struct kref *ref)
@@ -1785,6 +1827,20 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 	case AFE_PORT_ID_QUINARY_MI2S_TX:
 	case AFE_PORT_ID_SENARY_MI2S_RX:
 	case AFE_PORT_ID_SENARY_MI2S_TX:
+	case AFE_PORT_ID_INT0_MI2S_RX:
+	case AFE_PORT_ID_INT0_MI2S_TX:
+	case AFE_PORT_ID_INT1_MI2S_RX:
+	case AFE_PORT_ID_INT1_MI2S_TX:
+	case AFE_PORT_ID_INT2_MI2S_RX:
+	case AFE_PORT_ID_INT2_MI2S_TX:
+	case AFE_PORT_ID_INT3_MI2S_RX:
+	case AFE_PORT_ID_INT3_MI2S_TX:
+	case AFE_PORT_ID_INT4_MI2S_RX:
+	case AFE_PORT_ID_INT4_MI2S_TX:
+	case AFE_PORT_ID_INT5_MI2S_RX:
+	case AFE_PORT_ID_INT5_MI2S_TX:
+	case AFE_PORT_ID_INT6_MI2S_RX:
+	case AFE_PORT_ID_INT6_MI2S_TX:
 		cfg_type = AFE_PARAM_ID_I2S_CONFIG;
 		break;
 	case AFE_PORT_ID_PRIMARY_TDM_RX ... AFE_PORT_ID_QUINARY_TDM_TX_7:
-- 
2.54.0

