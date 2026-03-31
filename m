Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1357C3A0E84
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 19:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986001; cv=none; b=WdEoXY+m96MaDe5pq73H1onTfDASGY27Jw7myYu00dNuQJJ7eSwlf1eISoaKx4lQvOT8RqvOxl7Oqb8/MGf99eMCuJKeODrI5SlrFK4HuBIYp3gXEQm0eIrgcIhuEOX84VGDch55CSolRdoB3MPPFbsfAYyK8tnigCP+TJ8VgOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986001; c=relaxed/simple;
	bh=r6KrEbvl1GLSeWnMetEjzYhxcsl8sRnrUbGVElKDzsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SY5ZowoVhVXJABdfiETa8OoTTyYNCRjaMM6le8LSSgSNMKVuhFiPEs+kzeF0w6JpoknBJP+aIvglxfTs9kC14p+Y86s+ugmw8buJnvkE/5Op2HZS5SDNGgU2QmbzHGe/Bi51NoLG9rZrb4Bq2sDFyWKevmT/Mwjq8zHOOrcOH6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLmT0YeN; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLmT0YeN"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-89c43c4c383so79505806d6.1
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 12:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985999; x=1775590799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRuuVtxWKIEAiWCruYyr8i2X23ct6vZDIVdvMoTxjmg=;
        b=FLmT0YeN5EQZdt4TRDZ4HKoAC8vNCrJ2HptNJPjK+tyGJtYoU6wnmrN+byW0FZMpg/
         irKnxBViC0DLBiKnJ04kuCwuEh2DoZC9nciO9jc1Lzz9GAJyJ8GuKjWGjw0auvZHo+QG
         6W1IQsCHUxmgOHhMLWqtvpLYt531tWj3Wf7G4J8dxzt5N23cNiZvxjVhXPZ5EcFaI3t6
         XyoomcvCFddz0rWYdNURjQOtg9hH7teYg79HE8a4MvV5wUMWBg48VYporLEIgBcagMRW
         lSh1ulsR1NfJb1aWE5Sf+YVZvaIxABsTv6KgS2vVCGV2+AFclBWSzbSkNUHDXcHcBksC
         ZJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985999; x=1775590799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TRuuVtxWKIEAiWCruYyr8i2X23ct6vZDIVdvMoTxjmg=;
        b=QzxOTQ15aqKcMMBXAPtwz8nmNpRH860UYkszbW2AN9cfjoFgFg7XuKf1mNtjhfbc/v
         q0jSwwSEc6sujqJORx0g1LlL0UVUF9Vw6icy59qzOrZN6AB6dH77gqHdeo9KhYKcJZNn
         nbtdArhKqgrOwjruCap0C5oMNaC5k55AhrQqLB47mCVeoTl/U0rrAZ582GYdTTSOS7t7
         PQlQsSovt3Is3LSNRcnxiQ3M0csdFe6PTebYIBd8QjcIUUBxLl8/hRpfoq4C/LcqTzph
         PLfoT+UOU59Uys9ub0fP+4GnZiciPZ+ORir/eBGCVpnpg7PVnZM6ZV3vHB1LJBs6vTRu
         6T+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEBn4bkKGg/KmC65vavWd3JMbM0Uq/FqR6sKSW+dgyFC0LdBP4a/EdTB5IyH0sGyRO6ngKOjLfmP39Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9xg5jhJCQWyVG0yzS60B7jcvIK/sMzO/32vwgF5/PAL3isbUQ
	RJh3sUEgoXBtYs4g3wYalFjfEChNphSRT4avc8ooIKtVXP9+OAX5qTcL
X-Gm-Gg: ATEYQzzlw3Mbj/lATvehuQFzH1jhO6R+Vz3tvgFVWyiJk0opitRs5cGW0tzcjpZK839
	NqtPbmXrcnsnlbrMVzO/bDJPhNhdaP/ma+z5kscwdYcsCxiuEUasDn2g/vyWroC0TGQ6jBp6cti
	o9elEI18OO+hXY/sthmvCLKC4Rped2QauojWCaGwBZ28E2jx6j0sXKZ5dKZpQmBnPSH7ArL0Tdh
	iwBGqrR5CG9T4gW8V9V8Zx9En8GgmOIGhDRzIcylbN8YqGXZtQOY/oK5f4DvfnaSxn49XVna0ir
	/C53jwmIPAy3GXSznXBiptkp6AMKOtvgWKub7gogFsB4KneJv7NGEnwaxYhRJ3lorE6mOkag/3U
	9cEBYokHP8C9Fns+hKysif/NI8oAX2grkZpmVPM7LOCsfXOuupVew0ImVK/ypDGPZwxWBY9zhFK
	9DCwAxam3wDfinoOcBGpBhvjn7
X-Received: by 2002:a05:6214:21a6:b0:89c:6252:4a4a with SMTP id 6a1803df08f44-8a43a65fc23mr13617406d6.49.1774985998777;
        Tue, 31 Mar 2026 12:39:58 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecb5cf18esm98782366d6.4.2026.03.31.12.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:58 -0700 (PDT)
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
Subject: [PATCH v3 15/15] ASoC: msm8916-wcd-analog: add quirk for cajon 2.0
Date: Tue, 31 Mar 2026 15:39:39 -0400
Message-ID: <20260331193939.40636-16-mailingradian@gmail.com>
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

The codec version CAJON_2_0 on the Snapdragon 670 requires touching the
HPH test registers. Add the quirk so this driver can also support
SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 63 ++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index b9325290c28d..87f8a47cc293 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -217,9 +217,11 @@
 #define CDC_A_RX_HPH_BIAS_LDO_OCP	(0xf195)
 #define CDC_A_RX_HPH_BIAS_CNP		(0xf196)
 #define CDC_A_RX_HPH_CNP_EN		(0xf197)
+#define CDC_A_RX_HPH_L_TEST		(0xf19A)
 #define CDC_A_RX_HPH_L_PA_DAC_CTL	(0xf19B)
 #define RX_HPA_L_PA_DAC_CTL_DATA_RESET_MASK	BIT(1)
 #define RX_HPA_L_PA_DAC_CTL_DATA_RESET_RESET	BIT(1)
+#define CDC_A_RX_HPH_R_TEST		(0xf19C)
 #define CDC_A_RX_HPH_R_PA_DAC_CTL	(0xf19D)
 #define RX_HPH_R_PA_DAC_CTL_DATA_RESET	BIT(1)
 #define RX_HPH_R_PA_DAC_CTL_DATA_RESET_MASK BIT(1)
@@ -705,6 +707,59 @@ static int pm8916_wcd_analog_enable_ear_pa(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int pm8916_wcd_analog_enable_hphl_pa(struct snd_soc_dapm_widget *w,
+					    struct snd_kcontrol *kcontrol,
+					    int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
+
+	/* This quirk is not required for revisions prior to CAJON_2_0 */
+	if (priv->codec_version < 4)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(7000, 7100);
+		snd_soc_component_update_bits(component, CDC_A_RX_HPH_L_TEST,
+				0x04, 0x04);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* wait 20 ms after the digital codec has powered down */
+		msleep(20);
+		snd_soc_component_update_bits(component, CDC_A_RX_HPH_L_TEST,
+				0x04, 0x00);
+		break;
+	}
+	return 0;
+}
+
+static int pm8916_wcd_analog_enable_hphr_pa(struct snd_soc_dapm_widget *w,
+					    struct snd_kcontrol *kcontrol,
+					    int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
+
+	/* This quirk is not required for revisions prior to CAJON_2_0 */
+	if (priv->codec_version < 4)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(7000, 7100);
+		snd_soc_component_update_bits(component, CDC_A_RX_HPH_R_TEST,
+				0x04, 0x04);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		msleep(20);
+		snd_soc_component_update_bits(component, CDC_A_RX_HPH_R_TEST,
+				0x04, 0x00);
+		break;
+	}
+	return 0;
+}
+
 static const struct reg_default wcd_reg_defaults_2_0[] = {
 	{CDC_A_RX_COM_OCP_CTL, 0xD1},
 	{CDC_A_RX_COM_OCP_COUNT, 0xFF},
@@ -954,11 +1009,15 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("EAR_S", SND_SOC_NOPM, 0, 0, &ear_mux),
 	SND_SOC_DAPM_SUPPLY("EAR CP", CDC_A_NCP_EN, 4, 0, NULL, 0),
 
-	SND_SOC_DAPM_PGA("HPHL PA", CDC_A_RX_HPH_CNP_EN, 5, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_E("HPHL PA", CDC_A_RX_HPH_CNP_EN, 5, 0, NULL, 0,
+			   pm8916_wcd_analog_enable_hphl_pa,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX("HPHL", SND_SOC_NOPM, 0, 0, &hphl_mux),
 	SND_SOC_DAPM_MIXER("HPHL DAC", CDC_A_RX_HPH_L_PA_DAC_CTL, 3, 0, NULL,
 			   0),
-	SND_SOC_DAPM_PGA("HPHR PA", CDC_A_RX_HPH_CNP_EN, 4, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_E("HPHR PA", CDC_A_RX_HPH_CNP_EN, 4, 0, NULL, 0,
+			   pm8916_wcd_analog_enable_hphr_pa,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX("HPHR", SND_SOC_NOPM, 0, 0, &hphr_mux),
 	SND_SOC_DAPM_MIXER("HPHR DAC", CDC_A_RX_HPH_R_PA_DAC_CTL, 3, 0, NULL,
 			   0),
-- 
2.53.0

