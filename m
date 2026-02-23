Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FF9349B12
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 06:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829467; cv=none; b=UnI5xmJElo4pBM7RnfZU3SdlN+C+HBo5RAmdNjLBA22hTgQ12PRt9tmwqYTu7DvMOmDM72dXANWEYfA+ZP96B2PApL7JbxyTGBnq0sO/lkZtvpTqb/Reu3tVpDG9Y7xxYbWbYfoTGvr3dO17A2/CITbQtUB3H5C2Zzxio8s+KO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829467; c=relaxed/simple;
	bh=xM19W5y6sBZhK63TGYfPq7Dcx+S+y11DhFbKJgJ2kiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lnJvzgMXOFUVr4/nzNHTVzIDLko2LSmoc5AotG0awt9Pl/RMoKL31h0oZeEilfHWEqwP2VDdQCneB9WjUfnLFBNqbWJBaf3P+RFdctcoDUmFXU6DGfFjrKybP5PYhO/Et+f9Y17y3Ne20RTEM8KB7VM+aeMSedk9Qsbm+nHV5Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nfsy6irm; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nfsy6irm"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3870778358aso33646031fa.1
        for <linux-sound@vger.kernel.org>; Sun, 22 Feb 2026 22:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771829463; x=1772434263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1uE9SbozYnquR9REkQsKIr4GVqaAJFPEg6pyN2tdEE=;
        b=Nfsy6irm/G6PU5E6FlxjQLziaEQQ8DAyWyGFPyDuCVBagpPV1VnkQ668fESXaAqCGh
         nIUr/nnjpV/uc7o2NwNfSpds5Vjyu/0Vm1NUJKwr52gTdjgIGc36F8uNPuQqILbjqUW/
         ZruowoNcKs9Z+HtBKXNTYC4rl2vIYRbNr0t+UAe4LsYZvmFNIo1H5rWFuuo/4PtHiiqE
         lgrfE8gRuaVEO6VcMxPSWYF1+eZp7ETycmiyf9DBdP0L2B9FLt/P9FvwiAjNNiKlQwLP
         Tykty6M8+atmkiRlvF8koqhKm8e+zkiJreKVwtMshXQQk5ZkjvLdzwG88HIXBl7MDCYc
         fNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829463; x=1772434263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S1uE9SbozYnquR9REkQsKIr4GVqaAJFPEg6pyN2tdEE=;
        b=sFaQ/5TkvBwzUu5dU8ohhqHlDipx4TSdULcYNoyQFvoi5cLxl/PrMp2naUrZvZhgI6
         NZj54qbkEAP1EPnkWsjBAl81f7255/b+aPnN8D5lFUub5uH9K0GdBSoqv16J4IP9K7Cw
         OpHcvZaPhzQdTbFBAhttrGMcPjPSBLgexQ/Zu60IFXOPHK8Baahz//znQQd2VUydtJer
         tSo0vAZCxAdfViPL6KNcihNWcnGc60VwYpnoiytVUK4kR9MTdLTyIKBmLmSQ9/uywsCT
         aZqbArr+5VJnxZNu8ixw192dp2lduR0HVQWDjfy+thF5g3h6/DDry2AEUfMQ+1EYNC9/
         wiyQ==
X-Gm-Message-State: AOJu0YyMDb3vVvfnP0EcyqNufm1Srnb2FPJzU8A9sVxOVFcxnrqhtirO
	7k8C8qlPJGp1/+5zEybSeJjooMMcvGtfRZXhicdOCnRC0K+rZ3phJDoE
X-Gm-Gg: AZuq6aL0gfjscWg4D1XgeWXubrfJsbIXewrrQve6a/qT/9rMCUjoBJAKM4WEIHBHq5U
	crVcxhAFjCGfCUrk0BE7LRmyLkV/CxnxfFN0gMhuwRqkqLAV2S1HLiBFVF7cuw5bnkB43834I6G
	+MHWVY7IFIXV2pqXuKz3jqe4f/uajxlNTo5vmuw0RqSxX/+zbf/PWxS7fX2RJS+MC+PZQeAwYkg
	cvV5E0iYwOgsZktz692Bzz0fbfJQTaPPwQHvhWxeFffoTXyv/YbyOWzXGOuntBG83uOyWIqycKo
	HZbKwws3lRZNK7Z5V1X4imNW7nlCBhJFDIFW3zy20oV00Fbh5A0P5ISDT8r7XcATR+QwdVno3ml
	K5gKSYHq/78CUTyCTvbBgcAuE5Sz59kW1fT8dPPigy0XfpRXvFwHdkDEEM2AXVdffApbX3beGDE
	B+GbnRNMiphKbJ
X-Received: by 2002:a05:651c:1ca:b0:386:fdcd:b2c4 with SMTP id 38308e7fff4ca-389a5e6d6f7mr20783041fa.35.1771829462597;
        Sun, 22 Feb 2026 22:51:02 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78b4a45sm13916521fa.13.2026.02.22.22.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:51:02 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] ASoC: tegra: Support CPCAP by machine driver
Date: Mon, 23 Feb 2026 08:50:48 +0200
Message-ID: <20260223065051.13070-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223065051.13070-1-clamor95@gmail.com>
References: <20260223065051.13070-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPCAP codec support to the Tegra ASoC machine driver. This codec is
found in Motorola T20 devices like Atrix 4G and Droid X2.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/Kconfig              |  9 +++++
 sound/soc/tegra/tegra_asoc_machine.c | 52 ++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 9dbd589879fb..dd58525b7079 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -294,6 +294,15 @@ config SND_SOC_TEGRA_SGTL5000
 	  boards using the SGTL5000 codec, such as Apalis T30, Apalis TK1 or
 	  Colibri T30.
 
+config SND_SOC_TEGRA_CPCAP
+	tristate "SoC Audio support for Tegra boards using a CPCAP codec"
+	depends on I2C && GPIOLIB && MFD_CPCAP
+	select SND_SOC_TEGRA_MACHINE_DRV
+	select SND_SOC_CPCAP
+	help
+	  Say Y or M here if you want to add support for SoC audio on Tegra
+	  boards using the CPCAP codec, such as Motorola Atrix 4G or Droid X2.
+
 endif
 
 endmenu
diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index d48463ac16fc..10834f9c3422 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -287,6 +287,25 @@ static unsigned int tegra_machine_mclk_rate_6mhz(unsigned int srate)
 	return mclk;
 }
 
+static unsigned int tegra_machine_mclk_rate_cpcap(unsigned int srate)
+{
+	unsigned int mclk;
+
+	switch (srate) {
+	case 11025:
+	case 22050:
+	case 44100:
+	case 88200:
+		mclk = 26000000;
+		break;
+	default:
+		mclk = 256 * srate;
+		break;
+	}
+
+	return mclk;
+}
+
 static int tegra_machine_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
@@ -985,6 +1004,38 @@ static const struct tegra_asoc_data tegra_rt5631_data = {
 	.add_hp_jack = true,
 };
 
+/* CPCAP machine */
+
+SND_SOC_DAILINK_DEFS(cpcap_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "cpcap-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_cpcap_dai = {
+	.name = "CPCAP",
+	.stream_name = "CPCAP PCM",
+	.init = tegra_asoc_machine_init,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBP_CFP,
+	SND_SOC_DAILINK_REG(cpcap_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_cpcap = {
+	.components = "codec:cpcap",
+	.dai_link = &tegra_cpcap_dai,
+	.num_links = 1,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_cpcap_data = {
+	.mclk_rate = tegra_machine_mclk_rate_cpcap,
+	.card = &snd_soc_tegra_cpcap,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+};
+
 static const struct of_device_id tegra_machine_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-trimslice", .data = &tegra_trimslice_data },
 	{ .compatible = "nvidia,tegra-audio-max98090", .data = &tegra_max98090_data },
@@ -997,6 +1048,7 @@ static const struct of_device_id tegra_machine_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-rt5640", .data = &tegra_rt5640_data },
 	{ .compatible = "nvidia,tegra-audio-alc5632", .data = &tegra_rt5632_data },
 	{ .compatible = "nvidia,tegra-audio-rt5631", .data = &tegra_rt5631_data },
+	{ .compatible = "nvidia,tegra-audio-cpcap", .data = &tegra_cpcap_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra_machine_of_match);
-- 
2.51.0

