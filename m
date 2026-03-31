Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50BB3F7ABB
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 19:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985968; cv=none; b=lgSm1Yq0TYjixUIZ8XqCtQQZKwTybDbly/I4Zq0wLyZR/R3vLp86sucIf6T8/H96WMvX/pw6tk3BFHBXgBAriGNngsthUz/Fhw5wB0EhxhhT3V301H/rsptdZilZMhARJxNlsItKwqBwYu2Qi8ETYyzzHbjCV2vfGMZr6N68cEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985968; c=relaxed/simple;
	bh=De/kS2DEjSq5+9tU/Ossjf97OcW1SlDXyXv6NjuKy1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1tshNiIm+SAss3XBMbK5h9tNZ75V2qemPmrKgUGcXZA3zYZjMU1gJBh27ytsHqZdg/5lImUFo3L/yXnBGltsi3TTfiJfshDn62SCVgD54VPJqEtZ+QTc+vefxf4x1sD+iSytGJQzGo3fQ3Fo4V6HVsgdQCmIU05nV2OUagtbj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNaN4LtN; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNaN4LtN"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cd8576a512so26904185a.0
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 12:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985966; x=1775590766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74p8eO0LtLyb2WN3zVpgnr5sRJSJgADYEr3ev2PB/ug=;
        b=qNaN4LtNBgmg32BvYnoMHMSkXLuc0el78owjmMY6nZcN9R1E6/2VsEYRTiAkywM8c7
         GDUsqjHyOq0tkNQ1nvWJHqVZl+35U3Jz855LmswHMqLAJyagRVzas2Qbe+l/U5EFczvM
         XCPboQlbXhIQ1kPNCYUez/Z/3w8gUlwRUZgRZhEQ6PY+Gj1ML97b0FN1Vgf0ZYe0bcvM
         otjpdRIpgUC67zPvz05PQFHWbu74mrsYilC73JIwgMeOAaiDhYhwYE0Y5pNEuwUlos63
         Xcxfqaz1fnM/rAxzMFxXSaTykO07FV0YAuZU7I90bQuh9bHPmCgpFqe9xeCD1zESKRJ7
         vH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985966; x=1775590766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=74p8eO0LtLyb2WN3zVpgnr5sRJSJgADYEr3ev2PB/ug=;
        b=BDtj8vri5F+VPRDiYgbH81/YNnxDWmGabukn8TJUyJKb9BHP/wDUgVcnUsUvGlLfdn
         excaRq1GQjqSAR/0I3Zub7+ShnWpsSC3oIyDlcy//kwI96S8opspKpPdTNgZo59NG5It
         6nSavWCHphmbmBcuIVoaAE1tH6cxH/a8ZoXEFkpmHy/V8/mEInMdjp/dYU2SAAgn/Syh
         Py8v3M5HOjOZHt720FuSApyzeZEuRu50SFtihC1y3gvUjJZ+JQdgB2BJvTwJ1PcXwY9M
         ETNbVlJXBE34YZ8LJUcCBdiCF8IyN2BwqnIiu7GXjMtDouUY4K5bIaBro6pggDmeX9mf
         uYyw==
X-Forwarded-Encrypted: i=1; AJvYcCVCJS7s8YH8LIh+89u8Yc17p+dWFCe5rGt8+W21xml+HOHJBHspYAVrCbnbezVnm7HY5Z2gZL1QBYDSjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz/8Jg7RFEAlDX77l6g3AFE1yqni0o8RC4dSOewFLt9I80Yj7F
	8coTQn+gI44hfxY6YdB4YmDal3mToIInJUcMWnGo8xOwQZ+Yev38jh9+
X-Gm-Gg: ATEYQzwyhWtfju/reqW2iYnLlAv+Sz4FvBQlFnsJe/WWIIHeOJ0GtXMKPOjyxmBSAaX
	ez+9wWPfH8QsubMfFZXEzpKyr5+92HW7t7Kf/OXNfMBQ0hne8WAhsgAbWuedabfng27sBRe/7Hp
	+2PHeYfdVPG48V5QXcNvicXc8v51fyEgovB0SJFPE9JYjC7rk1kRBWeJF8y5ZR3lsh+dmWZnlhq
	kC3rigFgDO96UNBliovoy0oeom0BnFgyMSMyxHoepWuY/N5jF/RshifHYGJTV1rD9MwIyVoMRPi
	6B9oRhZXuqiSDx+1j2hWfxili/oN1Nj0ZZYm8e6j0/neZPFMq9IblIHC6aNr0+3guGP7ojHa6tM
	UjTbvs049wZ6n1r/P1yaIe14BFihwUuZxboF+WHryFUyFBMHOIgh4f5oTA5jAFEqHz2RyV27sWf
	6Jr7434PMI6Sygc9VY1yMOcsTB6rsIBnDBbII=
X-Received: by 2002:a0c:f118:0:b0:89c:4ce5:cc8b with SMTP id 6a1803df08f44-8a44466dd8emr7336806d6.26.1774985965611;
        Tue, 31 Mar 2026 12:39:25 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf286fc1sm123019386d6.31.2026.03.31.12.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:25 -0700 (PDT)
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
Subject: [PATCH v3 07/15] ASoC: qdsp6: q6afe: add internal mi2s support
Date: Tue, 31 Mar 2026 15:39:31 -0400
Message-ID: <20260331193939.40636-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the port mappings for internal MI2S, found on the Snapdragon 660
internal sound card.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6afe.c | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 40237267fda0..52d53bb21b7f 100644
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
+	[INT0_MI2S_RX] = { AFE_PORT_ID_INT0_MI2S_RX,
+				INT0_MI2S_RX, 1, 1},
+	[INT0_MI2S_TX] = { AFE_PORT_ID_INT0_MI2S_TX,
+				INT0_MI2S_RX, 0, 1},
+	[INT1_MI2S_RX] = { AFE_PORT_ID_INT1_MI2S_RX,
+				INT1_MI2S_RX, 1, 1},
+	[INT1_MI2S_TX] = { AFE_PORT_ID_INT1_MI2S_TX,
+				INT1_MI2S_RX, 0, 1},
+	[INT2_MI2S_RX] = { AFE_PORT_ID_INT2_MI2S_RX,
+				INT2_MI2S_RX, 1, 1},
+	[INT2_MI2S_TX] = { AFE_PORT_ID_INT2_MI2S_TX,
+				INT2_MI2S_RX, 0, 1},
+	[INT3_MI2S_RX] = { AFE_PORT_ID_INT3_MI2S_RX,
+				INT3_MI2S_RX, 1, 1},
+	[INT3_MI2S_TX] = { AFE_PORT_ID_INT3_MI2S_TX,
+				INT3_MI2S_RX, 0, 1},
+	[INT4_MI2S_RX] = { AFE_PORT_ID_INT4_MI2S_RX,
+				INT4_MI2S_RX, 1, 1},
+	[INT4_MI2S_TX] = { AFE_PORT_ID_INT4_MI2S_TX,
+				INT4_MI2S_RX, 0, 1},
+	[INT5_MI2S_RX] = { AFE_PORT_ID_INT5_MI2S_RX,
+				INT5_MI2S_RX, 1, 1},
+	[INT5_MI2S_TX] = { AFE_PORT_ID_INT5_MI2S_TX,
+				INT5_MI2S_RX, 0, 1},
+	[INT6_MI2S_RX] = { AFE_PORT_ID_INT6_MI2S_RX,
+				INT6_MI2S_RX, 1, 1},
+	[INT6_MI2S_TX] = { AFE_PORT_ID_INT6_MI2S_TX,
+				INT6_MI2S_RX, 0, 1},
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
2.53.0

