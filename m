Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DA43D75B6
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 19:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654339; cv=none; b=o/++RiHgoEELwVq8nTIRue9Cr24VtVToYAPkMNK+MRJZmCVMIoyUD8fKKOC/qYnDCK1vqmMeGlDPi89v6+a/zRun+0Yona7JvU9oZJz08K2AWRtEFFwlMNXSpPVzHDVaDh9U5037sgb86C3wrOn4nwwuhvYtTc9ehirnbcJ/VqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654339; c=relaxed/simple;
	bh=n6yhyAmeS3XajiqHKaymn5KEifMbZ3zphx1S/Ru4RYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WoT2s6z2ELY6kLznnwOJ5Bq0ux3f/0D7A8om7he0++yll4NUxW5Ll3cV/UmllYoPdeLH/PH/VgIC4GAwEPAnDfGOszKwarAbbNCGNzGCHiBO2wZjeM2e8rXWmWHWwe7v46xE9hxcBU1SuGH5XAtXU2OaB4BitDg+3nDHsCnIn8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dT9pEEwM; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dT9pEEwM"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-506bcb23a78so65760841cf.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 11:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654337; x=1773259137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOC11T7iPv7jkYCTEvT6B1pPSxAqE6JCdF/Au33dEgs=;
        b=dT9pEEwM1slkRZzGjbjgudDgXpFTOTlYjub5R6Nkno5XLW8IkHo3WKPQiPM8ZQibPT
         qVTdzQSPu6VJHnznMKJOc4yCKKSk7tMOSO+kmhKrRO6wqZnT1+Raz/Fq5x5ljHaCnSEs
         hhlsF9ST9ATUIiQd4anmzGm0+VOY5Sw/1MxKHEFfcSv53QTM8Cwu9Nv6aang8myzH8C4
         Dc1Y1+7Jz+R3r2iT0Z/RL5A2dP2Ev3fBK0ILitlEPTyuCNZy7AVp9H2IXDmgCwfHkBly
         cAnVnOrUy0FSYUgP5US0pAurmcyGca5YEOlL5ellVfbPnVoMBE33XKaTS+3x6DkyyyO/
         HZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654337; x=1773259137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MOC11T7iPv7jkYCTEvT6B1pPSxAqE6JCdF/Au33dEgs=;
        b=BLp0YUL/lam9dGKFt49+gm0vPYemhguog4obu00BfrgCwoudblVQ1DehzFc9Uhr+SR
         usVEPAyI5OokuFzE0UDvjSEDmS2p9Gx1hRTfj8CAnphufPHoOynXJkmnzLsNrT9Z2sRN
         EgWrYxrBjGxhn2VhHvSbK2Ckkw82KJ6El89cbgZdwK2VNx6HRwf4XL0j2IlLOXppc7ow
         qyotLUcUDKcd0frtOzP1snSMvjMAc00hv2hj3t7mQWaAJBNfH6Vg98YkmcnBuBfWkPFN
         T9QrAfkyPUNkDz2aNdP7kf09uYSLhjsEpT5UpU7mx4fOUJMcCwj0dHSgg83Kp492Bz6U
         D7fw==
X-Forwarded-Encrypted: i=1; AJvYcCUpgrrgHiSjhAWRoYycxHPsjrV6LqC3TCikL+5BafMWY6uuB/NjEjXokVeVjc59GI8GglHCAMpSko5AxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhWMA7tMraXA1eRCNvuL0Jq4D+F48d2UWZuwsHt5WXwDKdp0JF
	3b9wbFmb6nWSYbC+s69v+OpkorDnfP3jEWD216Nx3ASo73lLKwaVBe6n
X-Gm-Gg: ATEYQzyUUAE9dyOYuVer2Mw1BNrkd/ESBNXFcO5hdCaK3uvExXfyC7/tbN47h+hqLS1
	oXS0tfuyz3JgaFPZ9x5DrfKENM0lNTujlyLM1kAi7W+kvfLGW6f0/fjoyWpP9vo/jmY2+xg0a6x
	BohyuxZimiEjTMyt5cIkzX7v2NdTa3ARzWS7eerv4tCVpFgIT3kLooQqAR2H5BiA1hmAUtKOtnk
	b3IsQgNzvQjgdKXk7tSBOJUOKHattddXyARk0FUtVd8hcA9aKNomFQ71T4an2ReNaHa6Z5feOFX
	SM7TAcFdR08ZFT9r56J2+PRaD0Tf2Yer4Iom/jfXXNU27dZypj/YnlzP8z5Wiz+lE6tGmgdLST2
	uHSgodAprNcAj0xf1tniPJBEIBQYJ58mdb++1tbCPKpz6jkcZdtaYjqg9vq/PNuUhRmvCa1WQGV
	x2Z6RoG33qXnw18zWwYaerLcm4Gk/Xd69m2rpV
X-Received: by 2002:a05:622a:14d1:b0:506:20bf:44a2 with SMTP id d75a77b69052e-508db28348emr43324501cf.16.1772654336843;
        Wed, 04 Mar 2026 11:58:56 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744963095sm180564781cf.3.2026.03.04.11.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:58:56 -0800 (PST)
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
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 06/11] ASoC: qdsp6: q6afe: add internal mi2s support
Date: Wed,  4 Mar 2026 14:58:10 -0500
Message-ID: <20260304195815.52347-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304195815.52347-1-mailingradian@gmail.com>
References: <20260304195815.52347-1-mailingradian@gmail.com>
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
index 43d877322bae..4112503515a9 100644
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
@@ -1777,6 +1819,20 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
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

