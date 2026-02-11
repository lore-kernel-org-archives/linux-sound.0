Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43392ECEAE
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775400; cv=none; b=DCWCDsqzDWf3tq9t+mR+UhfgoAEwf9Anw8JiUMwT1Wfo1g6qfxMy+pUPFV4clm/5zo6h6+oDUDqaW3t/OvV3jbQ2sYsgRAoWtkpmRd456rlmDDfg4ikC2bfBxWEVr7XFGpXO1V1wACNWaGRYaJlZeuH4d/W1Ksydj/FBWZaw9rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775400; c=relaxed/simple;
	bh=lcbMP8x8QidDMfzZsQHgVhSc3nXU+qMMMQL5v42JxJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gj2LXoC/xHkm1kiGxNwDw0EvCW8Kh8/nhM2IvYpQ+mBtpG4ekVuNRMsy6vVSvidrDO6kQUDkLp3UfqpkoHFrBsPGT/NGQZeMvAa9mQWyWIojq7Wdqk8gLs8V3j9p5hyWgUF1YQ/F5nZMS1zCbdz/BUxyw/+FNN2FSaLcr6RvtJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WqA+7yXx; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WqA+7yXx"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-89505dd3e24so17228496d6.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 18:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775398; x=1771380198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNovFopWC+y1Xi17NN7gqBwdQHg16MLIF/W6FMXn5HQ=;
        b=WqA+7yXxRBmZb/r+vuHa49NLpVWJacSsUJ0SGOmhOsqYqtjjRGF9ypILmsCqskuH2y
         RdohyCtLvnSpbK2iQtxc7sA7sIKyXuu7EJ4TPVMkbON6l+WbHole2RgVvdecnWskGzSi
         MTb5IoODnlZ/J4dD8GhR6HXVYI7BZ39YL/jPrvYUTu9gfg4s+olFONxHIFKDcFCiCHGd
         Zc/pDan/moRjtS2yVdR+GEZgglhh3HqT1t+ozPPU7/TjNxOScsu1XHD7QhFEzavkU7/C
         9ppI/h7K+FLcBjpxMe1WRNx5bcoVwXGemwsDRNvoqXZZ7tKpT7C8BJow0b7F1en+5vWQ
         t4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775398; x=1771380198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNovFopWC+y1Xi17NN7gqBwdQHg16MLIF/W6FMXn5HQ=;
        b=w42+IZgvM195kNzJ7XapT4uENryUJl8O585aOV1kNWhFZxXVa7qEYMshfB2Zumpxs6
         ODGdohMQV3/NlcXaEdiQ20sG7xZt4ADJbF1rcwc1q+h02dLH/zw/p8yUHcslFmH1iRp2
         NMyebY5wlNYQaay9wATkWcbg/KML9Viq8BbKl6jIvCHI+kmGNHBNddpzhRgklw6hFlBh
         2NONzeAWxKsWyXgcQstysayjw8WLGkN9YnvQCDvSfE8BVBeq2FAaZueTMeI5pYs7m2Fa
         lhSkzWwi+CPWHq6OfsbUjgY/rRTL6xLru2/2HStykp8IZw/RsF46fAY1tKB5Hc99Hws3
         0gWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJEAlxh4l+INuGgc4zjsbladNgDnK/zt1YoOmESj71zFo21YehcxO9WoAF9Uhudhl4ZJq/TnEt8KXPSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD31LZeeG04k+CNCFtAhbLbiNadzEIaVdoietRUKBwdfyRsHu3
	axcqzFiwmH3vvOPrAZ+z2VlKCtcBamre5MOMYkWyC+dpCrhN8cyP820N
X-Gm-Gg: AZuq6aJdJze9uEujjd2fWp2HdGEbRdM250oW61aDSaPbVX3BeBfIu8yB0S2hM+n+UdI
	QmWMfutoOzcavBbtBdl/47L/07H7QzR691jijq4vt6qWfDtPQZ3tM9pb7n5fJqNAI1OrPW5dnnl
	6wbEHDKcmr18M+9SKHQSJIPiVQCJRdD2EOeURnJ4vFpz8CCpd31lduyOGzG2INVLxbkOb1uMHP3
	Up2garXeI95UADBAxY5ei1T+0t7ANyllmTAYc0EffJU/wQuJTV0KUjL0qYS3VvAeV2a/W+wFXLo
	KvDCbodAdeLzgBjz5j/r89xEbTqM/3e2qA4vlQa2j9poc9UxKCAV0KZbO6BMLzjCSRN6LHTQNfx
	Qx6pWQYCcs17VOFhkiO77SyKXrCSncH3wWpGYwaVUeLo/hTFbkhnNRgib9m+3vnmfbK1yit1eb+
	FMpuP+CH+1DVRem4R6/xxcjv/s2w==
X-Received: by 2002:a05:6214:f03:b0:897:bf:709 with SMTP id 6a1803df08f44-89700bf0768mr129323076d6.31.1770775397892;
        Tue, 10 Feb 2026 18:03:17 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50684ba22a6sm1433881cf.28.2026.02.10.18.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:03:17 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 06/10] ASoC: qdsp6: q6afe: add internal mi2s support
Date: Tue, 10 Feb 2026 21:02:58 -0500
Message-ID: <20260211020302.2674-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211020302.2674-1-mailingradian@gmail.com>
References: <20260211020302.2674-1-mailingradian@gmail.com>
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
 sound/soc/qcom/qdsp6/q6afe.h |  2 +-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 0b01fc9e13a7..78d48f6cc926 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -130,6 +130,20 @@
 #define AFE_PORT_ID_QUATERNARY_MI2S_TX      0x1007
 #define AFE_PORT_ID_QUINARY_MI2S_RX	    0x1016
 #define AFE_PORT_ID_QUINARY_MI2S_TX	    0x1017
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
@@ -925,6 +939,34 @@ static struct afe_port_map port_maps[AFE_PORT_MAX] = {
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
@@ -1779,6 +1821,20 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 	case AFE_PORT_ID_QUATERNARY_MI2S_TX:
 	case AFE_PORT_ID_QUINARY_MI2S_RX:
 	case AFE_PORT_ID_QUINARY_MI2S_TX:
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
diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
index a29abe4ce436..d61fda8e8985 100644
--- a/sound/soc/qcom/qdsp6/q6afe.h
+++ b/sound/soc/qcom/qdsp6/q6afe.h
@@ -3,7 +3,7 @@
 #ifndef __Q6AFE_H__
 #define __Q6AFE_H__
 
-#define AFE_PORT_MAX		137
+#define AFE_PORT_MAX		151
 
 #define MSM_AFE_PORT_TYPE_RX 0
 #define MSM_AFE_PORT_TYPE_TX 1
-- 
2.53.0

