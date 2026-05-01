Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A5C23D7DC
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 15:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649523; cv=none; b=mijuvcZ7Zt8/KqULbRWu/VBz0RgV70MpZghyAox1zoa3THrPFTSP9TUI0n5ZCZIXp3YTsxUzPrSKyzfqwgJwCOVeQSVar5HWQqUCTGtw1y6Z0vMDDoD33dD/y4nUZogrFI8NKccxpFgE3ymses+GKW3po+d7IbmI+6tq4p3YUzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649523; c=relaxed/simple;
	bh=w5V6I6C2TxUpYFKlRCv1WdN7C5lwAv5ASRg2CxJCsOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wfjd9MXA48/BBWACZetVSU52qybUrx93xm3U87r1nASBO3Jb0jwBtc80klZz8ITeTdfmhVnSsUZg0dfCk6r1kLbAkme2I9rFlXNn5qSEP6n0Y4lVQw7IbIhyH3FlhiQBGAhDUMaax8FxMX3qpSaa7+ycFoblvx/MjDh+CyLMhXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJcgDxT1; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJcgDxT1"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5102582e237so15704681cf.2
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 08:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649520; x=1778254320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stno7o6aZe7BkfT5z0WdjZapvfzMKBN/P5e4Yci2IuM=;
        b=rJcgDxT13b7QQikCsHYPx9mu7arZa2JK8OJtZWwkn6u8awj011IQ2dBIlTcoQ7VhpS
         JjL7QYwt/vLV5O62MQIWoPDt+8XMsNVP71RbSGi3bygnU7J8lJYyNzeRlmxmbS9kMoAJ
         YuGykW5KVV+VdGw9VDcMqgn+XYVFXZfbgxLHKzK8Yk9uNsKKAC7BPII2f4fQatWMGYFb
         1dmNkV7lHBD7GJByWF/45ZlvSsFBms36rvJDQ7dAuRESu9qowLJz5npMW2syeaEjS9wH
         Wj4hcT43S3ZBqyNXU4AFHR7kYXtUgN9FOeEoukgZg/u75vgpDakxUn6qRuFsQFVadTKO
         M2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649520; x=1778254320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=stno7o6aZe7BkfT5z0WdjZapvfzMKBN/P5e4Yci2IuM=;
        b=D4B7EvSmSAjnL87ndjTLIjz0fCFl2k3F+dl13qPZZDjFmVGh6o4q8okJ0a9Gr9/WLv
         cbp6COaOwgq1ZU4EiL84J/0C4HodK6EJBYhyIsZcDf0c6SaTMwBZ+18zWP3gIHBry+57
         jhIuQRXjGAe1qObs0BmFGkCorFUIr0MrdZjxGArBx59vJfr/sU7QxnLNmOH7H1uqoYIb
         e6YZZReGi8TIYBG4xgw8unRyM5cuUVTdyFLj6aqJEzGfI7nB25riuzqwmHKVfBk3MX6Y
         cLyse1IuCYFkBtfqmwZB/9AmK+ncIrjEW/SCFJuE47XaFd/td6ajx/TmSwgEsB+gTV2P
         nvVg==
X-Forwarded-Encrypted: i=1; AFNElJ/05zLmBwZyeinudwXlLCPVoG453rGn76cFTg5gm1elRrZWRDyuiGHrGEOum6e8HREL0KpmDq0tTUM5DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4HEnV7+QvS47RCi2eeb4RaudYDFHIUeMhXk1p76lXpZLdurs8
	5mry+9rtQdlpTPpr0a4yhTb4kk3CHUBFvtg+yxKjbiq6N9j/6O70NJJJ
X-Gm-Gg: AeBDietKWtkSNvdpqY1SPElEs8ruJWbBRHjutPDlpoA76mplhvbQ8xx6CwEsbQ6ZqcG
	nNL2EyHfj2rSnk3IKAsigu8Of30i23UyGmyLBwl76/wa3oqCDa9w9F8ibik68FcpZ2kOghjhRsl
	aySdpxNXmGhBwBHS5/a9ElKQR0K9nTn1c2U27YBgWY9sQyoggrCaK/TmphucyWwVy+9bqlJFRmR
	mZRcnIAFH1ylglq5YHS7drwLKdRITh9u5GXUqIQksugPz5EQKW7YkQQz2uHtngJ/YepXwytUJjZ
	5nxrLL3T+ClPEWLACkLya7YUEZn08SVpawLb4VQ2OQU1dJmioR6kU4+e9a2UK3B6TZuCKbzzhij
	8sDhbEjtWlkCQk3HWbWXse8Ys2j3/F+pXubl6wRTsLWSmxf8RLiMGfZwaSLSWQHivuWOUWOApXH
	Qe39zutUGVDJv/h/W8v5brFtWYOAk1z0HyPMRO
X-Received: by 2002:a05:622a:429a:b0:50f:9c32:509d with SMTP id d75a77b69052e-5102ae4fd79mr114728471cf.60.1777649519768;
        Fri, 01 May 2026 08:31:59 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5104a92e746sm1757201cf.0.2026.05.01.08.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:31:59 -0700 (PDT)
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
Subject: [PATCH v4 07/15] ASoC: qdsp6: q6afe: add internal mi2s support
Date: Fri,  1 May 2026 11:31:20 -0400
Message-ID: <20260501153128.8152-8-mailingradian@gmail.com>
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
2.54.0

