Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF62644607E
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 17:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433473; cv=none; b=kcIYogKoIcv8mFu/4yI7rm/OFhi0KcruwhlRjmLl9tJ4MFeAhUUlpOaSOHGK7XiMN1ygTucWSjAAWsrtkFFPfaCJ6oTIO3WetrD59AZodD5IldtB2VLweib073QBOa7eZgVjNcZB8++RMZ0vcAZxqzQEOtgtJ0m/T1a54KVRM8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433473; c=relaxed/simple;
	bh=73IAudJNTbnO5JjtmoDOA29U8lNo7HL9BzEOqJgGiK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p/frYkFd9ZyiM3pTjVyTEio7ZA2UCmzggc+48GHNohIYOwsYIse10YrjTqPLMBvODSRfb3kB4rb14yL/RhoiOYs4sbD/Bqh1o9FMvTBR6Ji4LijWJqh0Ekyz0wgJWAmZFdJ0X4J89wBg33ywJ++ZAL1rO9znD4n41ERr3BU0q+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YL8FUADW; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YL8FUADW"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8efec2c28f8so1116446d6.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433469; x=1786038269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=316jUt2/Y6I2iJ6QUffHRnxSTcOP4J2RgEpichI2UbE=;
        b=YL8FUADWxN71l0yfBJAWvjMkFZSCConXGSpwBSGy8M+fgZCe5kCLOITfTjix77qYM3
         C8Zj0sc31MN7k5NVhIaFgJ3xmtar6MpkITQ9+lAFS6Thk0aHm3w2qbNNI7D5s6nsMz+w
         rv8PcCgd9iE0VA6JpvuyQDMFk82kwxooYbBbFrzkAYBauTuZ9F4P4ZIQK+zTIjf4MsO7
         KdXR2p6fgtjZgvU2PSV6APG4MxwNXOxHeWVBtNHwDdaYceT/fvb1xQAcbtJzqzhDUK9W
         kvYsKGRMXHhQDlm3M/I7ZRqCogGZNmnCKvTPZ2jNpoVt8rNER4ahJDCy61JcxLGUbtPL
         Q7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433469; x=1786038269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=316jUt2/Y6I2iJ6QUffHRnxSTcOP4J2RgEpichI2UbE=;
        b=Xv59OOWUforn0QKhn6JCIPeGWFUh4NSrracNVtHWC650f+L9p8yKZI20MDVKjkLjx0
         1IZWp47Dhdd0XJNLh1WEZXPJLfvn4RYJVxEBfkD/XMbihP96ELZHM7EByoR/BmPuA1Eu
         B7q69AfkzLHwgfvnMuyfPBxvNJW1cEhSM9v6rAsJM96yj1cCk3rJE9peR85L/2ne02PM
         hGCEvpJwpqeDCnBpXgX2GCONGRdahGnfqSBFHfLkXdVAbvh/suMWkVNvwsbksXfjZSnd
         rhvEO64A9UyjCWDEf5SgCWZ+q5iGVyDgtnOUlZ/NiqFHMV9vHO9L2oKHBW9YFpSDvrAY
         uzJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxM5D3buNAAW6Ze01xw6+fRk+CAKO2TY/e8KUMf4V5I9ks+Rin0R0uT2crEvtk3FzuKn0x/yKDim1omw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2doMGbIq0shVMH4x84Fx9x/BoG8v5+Y1FMseCiUYIDM4dvvsm
	PLQeOMkwMSyxavUmG7FHG+4PVsQE7QF/zve4rUPW78c7DEa7LnSFpAAZ
X-Gm-Gg: AR+sD10f9UKx+uOy7FSPBhsYB5mO34433IXttbNkYAAXssjKcoz6PkXsn3oJ5HkeOoM
	TW5rNJfrt5vSFWp8nGHIgtaMRKHHdlHDRvUVwTFDsGP/LTbhknbsSSR51kf1/a6APZLMoLEdBqh
	2Yg4Z/MqVNRIUUgmTLsKTi7hqvVrmP1SWGRKj29MUyJeifwnIqOvjAsrXWY40RowmePglw4ibER
	4EHyXHNFw0im/bqvr2NKlwZD3eHkIE6uPX+plYD3Us341eUrV3Z/WO3VhxL1Y7eVPBPv8EpKUhB
	TcolcXisdsSCI7jItkSOuHOmsdDu7L88E3sD9b3jYvKKg5BTmHPUgg8egx5mZkwzY3U7ovstyMZ
	jW9g+Z/KwWv61bLDoz2lPmDrujtXowDQ0it3GpEokkufe0jPQ7QnDHK2tlKv0kV0MGSKnUcKIY9
	yIEmyXi279CjbqjD6PBj5ktX2GvahdNqBfv7GM97T7sfTJIBD7Ow/uc5IytIY=
X-Received: by 2002:a05:620a:7081:b0:92e:c116:bef5 with SMTP id af79cd13be357-93487207fb6mr406589485a.82.1785433468848;
        Thu, 30 Jul 2026 10:44:28 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e733e17csm466107785a.36.2026.07.30.10.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:28 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v6 08/15] ASoC: qdsp6: q6afe-dai: add internal mi2s support
Date: Thu, 30 Jul 2026 13:43:46 -0400
Message-ID: <20260730174353.108023-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bindings for LPI MI2S ports, originally exclusive to q6apm, can be
used for internal MI2S ports on q6afe. Add the internal MI2S ports found
on the SDM660 internal sound card using the LPI MI2S bindings.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index a0d21034a626..920345609d2c 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -412,6 +412,8 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
+	case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
 		rc = q6afe_i2s_port_prepare(dai_data->port[dai->id],
 			       &dai_data->port_config[dai->id].i2s_cfg);
 		if (rc < 0) {
@@ -665,6 +667,21 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 
 	/* USB playback AFE port receives data for playback, hence use the RX port */
 	{"USB Playback", NULL, "USB_RX"},
+
+	{"LPI RX0 MI2S Playback", NULL, "LPI_MI2S_RX_0"},
+	{"LPI_MI2S_TX_0", NULL, "LPI TX0 MI2S Capture"},
+	{"LPI RX1 MI2S Playback", NULL, "LPI_MI2S_RX_1"},
+	{"LPI_MI2S_TX_1", NULL, "LPI TX1 MI2S Capture"},
+	{"LPI RX2 MI2S Playback", NULL, "LPI_MI2S_RX_2"},
+	{"LPI_MI2S_TX_2", NULL, "LPI TX2 MI2S Capture"},
+	{"LPI RX3 MI2S Playback", NULL, "LPI_MI2S_RX_3"},
+	{"LPI_MI2S_TX_3", NULL, "LPI TX3 MI2S Capture"},
+	{"LPI RX4 MI2S Playback", NULL, "LPI_MI2S_RX_4"},
+	{"LPI_MI2S_TX_4", NULL, "LPI TX4 MI2S Capture"},
+	{"LPI RX5 MI2S Playback", NULL, "LPI_MI2S_RX_5"},
+	{"LPI_MI2S_TX_5", NULL, "LPI TX5 MI2S Capture"},
+	{"LPI RX6 MI2S Playback", NULL, "LPI_MI2S_RX_6"},
+	{"LPI_MI2S_TX_6", NULL, "LPI TX6 MI2S Capture"},
 };
 
 static int msm_dai_q6_dai_probe(struct snd_soc_dai *dai)
@@ -1011,6 +1028,35 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 		0, SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_AIF_IN("USB_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_0", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_0", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_1", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_1", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_2", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_2", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_3", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_3", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_4", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_4", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_5", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_5", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_6", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_6", NULL,
+		0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_component_driver q6afe_dai_component = {
@@ -1045,6 +1091,8 @@ static void of_q6afe_parse_dai_data(struct device *dev,
 		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
+		case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
 			priv = &data->priv[id];
 			ret = of_property_read_variable_u32_array(node,
 							"qcom,sd-lines",
-- 
2.55.0

