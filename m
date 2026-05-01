Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B7D23D7DC
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649534; cv=none; b=ZOe4lbVb/2TnC5PZabOtvJpBMqNjHDCPCd0ZmW5X9WCOdxJ8enYSUnrP7UF9I+DOPUn8iVzubc7dTQZjcPRvwiKtfc3OqGFdJMnhAT+Ip/2Xxv7fEFXFpy8OcJ+vv7c5nJQ5hqQm/2MOdB3kK6iY8+cx1mtKc0fDHySYHaq/vO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649534; c=relaxed/simple;
	bh=f0Orc1mithwNbdfxYZQlvF9j2sskbZrc7VO+CPxNk5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pPaR6sIz/ltlmtun/aXseZkeDhfhlOK/nDkiNVi+cSjDAt9kWqDJZOkaPEN7zxO5Or09SGRzGWknCIAJcmWYlT1rsbwRtB0152HjrCRLrk78Ujze9HguH2NDnAPvnFlGu3YoxC15LTm5dxLQdjk3Wifoh0+cKNNwLrmSarzwFIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6App4BS; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6App4BS"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8ed4dd182efso124651185a.3
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 08:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649532; x=1778254332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwXrARjuVS6fRkPJXbe4DRKrN2z+z4Y57tEGlpWIH80=;
        b=d6App4BS9gbFJKjPnczQWHZLTjkJl0NQn9ofITbtgEhFh9XGNItzYiUb5OXr99NrmI
         g/ycnVYz6pSv4viJCQ+znL7O8xNGUd4D60g2sRXSsiEQD8kOSc5HrVBn8anSizDh9oEz
         Lm6ADgW2vdubXr72zAom0iMkmlxDctAFerGJyqUwxcv3we/QfIblGvLilinoKN/o6rWK
         XKc9Es9bsPewUj9OZMER9E2wifOcaZBdyomnSLp6QdM1DDzdm4DU74RwC72e4H5ePrag
         qz7CHxDJy3SsK7UpPyuIgHAXgCIyyLIvq+XUEMCl9VHkqntfBsCZTYGfjVXqjqAxIW/E
         F+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649532; x=1778254332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uwXrARjuVS6fRkPJXbe4DRKrN2z+z4Y57tEGlpWIH80=;
        b=ButzqVdQSNcdGmwxWpk21BUgboAP0Csi/2T6Lk/nGFy7hGrQAQpQFcIcpKYVN3gpiX
         M6IvO3TThrf50/2ee6iiW6czvTvHOc0u1wcH/rRdAT9uEAt/qgylzsQxCe4ySAWdwcRC
         aoAHbOCCm4ZTZPX8DVksb5/C2a0Gq77+hSeRg8jtecuf7u2enSVb84eKqmftJHEE+EAj
         9w+SwrYLV9m2Zjet97KoCzzi6+cDvmpdggdFyQUeOkOoYbwrT7sBhhpq52QvdAQoS9xc
         Rv0cTPyl5JWgmN3ifEFENcdlHFmu5lpomgObWDP2LIXR7hgKGv1d3LzAOAkYmd7KknnX
         mVEg==
X-Forwarded-Encrypted: i=1; AFNElJ8HNuuUURfRSEJy+6akB3mvfz7VASBXHEsxuR3c+T97iXkD50SG36vbmO0CBW8YjdkFwGxdyGtbOdMRww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhCv0GZyKHhiNStiiGkJXIJrGsZWzNqZSuedFr3MEPF6vLCA8q
	tXhQGMHkbPq5F/hCuXfNppbD677XVYsx8rtdGnDZqPUwON8iPpU4dpfA
X-Gm-Gg: AeBDiesWNchOlhDPsN56BH/P4/rMPosgXrS2SGRY7cN2HYkNjrDzXRQEbJyxqySawci
	Uah4qKBBmO2qZirI/D+LOEB+dDgPRJbSuvjS3jCKxJs1NsHBPjlSMTqx3ckH8FTjYeb5t+bTSKS
	IaRwlOpcFhcTxMa51qR3GNP/WoJsSUQw0JrgVZqZVMcBjkqa0R4xnd9r+7+fnGOYEledqAGgDOo
	mC52tGgcjSIejAuK6E1AX6dchbYrCWYuymVDoBChIphniIHAa/PO3PofCGB8ujedNCMj6jTbLd4
	fGjOykVXa+kd1jrKUV2cs1IGZSLtsTduDL+9+Hk77JU/HmrvQMj92TyvcZzL88Ngk74CaVwePF8
	Lqp7l4c47cDQlbhQbR/+ZLjXWpq+0jFD/GyzMOIisM8WloZfJM1JxP5wMB6uIlRQqndxmve1dsl
	QCRSEUQDmiwiroApAMOLxZzPVFqsT1m3DdY8/o
X-Received: by 2002:a05:620a:4084:b0:8f0:a3f8:fb33 with SMTP id af79cd13be357-8fa89bfd648mr1146049085a.55.1777649531701;
        Fri, 01 May 2026 08:32:11 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2938596bsm192983285a.5.2026.05.01.08.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:11 -0700 (PDT)
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
Subject: [PATCH v4 08/15] ASoC: qdsp6: q6afe-dai: add internal mi2s support
Date: Fri,  1 May 2026 11:31:21 -0400
Message-ID: <20260501153128.8152-9-mailingradian@gmail.com>
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

Add the internal MI2S ports found on the SDM660 internal sound card.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 46 ++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index a0d21034a626..34ec3bd3ea8c 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -412,6 +412,7 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case INT0_MI2S_RX ... INT6_MI2S_TX:
 		rc = q6afe_i2s_port_prepare(dai_data->port[dai->id],
 			       &dai_data->port_config[dai->id].i2s_cfg);
 		if (rc < 0) {
@@ -665,6 +666,21 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 
 	/* USB playback AFE port receives data for playback, hence use the RX port */
 	{"USB Playback", NULL, "USB_RX"},
+
+	{"INT0 MI2S Playback", NULL, "INT0_MI2S_RX"},
+	{"INT0_MI2S_TX", NULL, "INT0 MI2S Capture"},
+	{"INT1 MI2S Playback", NULL, "INT1_MI2S_RX"},
+	{"INT1_MI2S_TX", NULL, "INT1 MI2S Capture"},
+	{"INT2 MI2S Playback", NULL, "INT2_MI2S_RX"},
+	{"INT2_MI2S_TX", NULL, "INT2 MI2S Capture"},
+	{"INT3 MI2S Playback", NULL, "INT3_MI2S_RX"},
+	{"INT3_MI2S_TX", NULL, "INT3 MI2S Capture"},
+	{"INT4 MI2S Playback", NULL, "INT4_MI2S_RX"},
+	{"INT4_MI2S_TX", NULL, "INT4 MI2S Capture"},
+	{"INT5 MI2S Playback", NULL, "INT5_MI2S_RX"},
+	{"INT5_MI2S_TX", NULL, "INT5 MI2S Capture"},
+	{"INT6 MI2S Playback", NULL, "INT6_MI2S_RX"},
+	{"INT6_MI2S_TX", NULL, "INT6 MI2S Capture"},
 };
 
 static int msm_dai_q6_dai_probe(struct snd_soc_dai *dai)
@@ -1011,6 +1027,35 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 		0, SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_AIF_IN("USB_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_IN("INT0_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT0_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT1_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT1_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT2_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT2_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT3_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT3_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT4_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT4_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT5_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT5_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT6_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT6_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_component_driver q6afe_dai_component = {
@@ -1045,6 +1090,7 @@ static void of_q6afe_parse_dai_data(struct device *dev,
 		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case INT0_MI2S_RX ... INT6_MI2S_TX:
 			priv = &data->priv[id];
 			ret = of_property_read_variable_u32_array(node,
 							"qcom,sd-lines",
-- 
2.54.0

