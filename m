Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5350135959
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 00:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775088763; cv=none; b=sbzAlI+BgocVPGf3EoJEqHny6divFRPQDUOrkYAXpVeJ3qoWR5bw21Oi8eE5a+QXrGJukX1UiEUh/u5uEHpwTfxt0qyfKLp6E8waSqUYscYKhYe44YpFbx3P6o2UdIl3KRxyXBbi9QBfzRTKbZQ2IqXo6uuHjkJDPYCgsg2WVQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775088763; c=relaxed/simple;
	bh=xLT4/pnrf9/dtxc2xqpALZl5H2vRN1vdKKTnfsSC86Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EI5MSGWJQDJf6sVPjaFv4VRsNfdkwDBPqF/R4QKeXcB1KDbIkzFFhAD5i7p/ovn5KCX/eadybfgkG9xIfuZTRRS71fwLzRR/mLfXkFzUKL6TWJ2lafZLMgYx7EqjUjXA8tbk+P4wQNHkx9J9VSbQ1o4HcwME+OVEYpcJryAetzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fdma.com; spf=pass smtp.mailfrom=fdma.com; dkim=pass (2048-bit key) header.d=fdma-com.20230601.gappssmtp.com header.i=@fdma-com.20230601.gappssmtp.com header.b=ThPICAtd; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fdma.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fdma.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fdma-com.20230601.gappssmtp.com header.i=@fdma-com.20230601.gappssmtp.com header.b="ThPICAtd"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso183664241.2
        for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 17:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fdma-com.20230601.gappssmtp.com; s=20230601; t=1775088761; x=1775693561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1gv4H+u+CWNs8HVMxfyEPdG+WMIoswO8VKm056Nilvk=;
        b=ThPICAtdLUuOE9+WNkaj1oz21IgIsGrvyabH6oR75cTMyPzDC0qwQ4rHbcNB4yLZ+5
         EeT1Idm7bwxqGsPRW1Di1BP0CM0/XU3k75XNjRt4Z2Tp6/K5xkiUzMc+k7noLZLYJ65D
         6knzl0VNEHwNZyvKbGMHRXghwhTpGk+SQIFRxxuVEA+GUveopjEMytp/3KV6ZSJom0wH
         HZtpgKOWypxotSiAxyK/dao/t56/O9xC1+yyWGF7KUzRZefk9W3xAQwpXB5k+FhGSTDC
         +7Pxk1pj2Xn0OUKz0US8Jco3Ty1JqtHK9YRpxlxWIqWTxXtJbGN+1/JtYPCsddyFG8pc
         9tzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775088761; x=1775693561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gv4H+u+CWNs8HVMxfyEPdG+WMIoswO8VKm056Nilvk=;
        b=RFmoMhRpFAg51oTtIzbVrxeWdFPMmwvR7lJ/Tz948Vm/okS5bLq6tKgzsPtPgOzLfa
         l7s+sGX0TpZba5vvHAR1kQhNlpgXeBsLghejNZ5Jd+AMLjd2EkhecPOGynfG8pBdxuQy
         ysn9FCVPhcblyQdKKJ8gRkYmpkuscQ+F6jPBXCFvanwJr73IlbfCnDmrz+WLhYkb94lA
         QaNUwTy867l4aYLp7TGzdXbQmKJKX+rmupGJL8uxXKW6GWXA//pPyOSyiu+h8nLGFpvx
         uGwJ5tkYBW9NhhF8VqH10M9AOFQ5ijyypZzkVZIGKWDeqpYgJ6FH48gpKlQk+Al/NPmb
         E52Q==
X-Gm-Message-State: AOJu0YxKZOS7B/V9zo29WqFuZAvVzgrjBamWP+HI/97M2Nc2oftZNwqI
	M2+HiqThLLirLZMq7HKeHtdHTTVjeJ6+LldOEbA8JpCQ7j1dKHq0QyV/9Ja2mvieXNrM4JCvGxT
	hJhkg+dKyLw==
X-Gm-Gg: ATEYQzzT5Ca22jEjTUjrH9rOhuleYRaUxVkTejKROiMugNGtoI9NyCyykPdMUeBdVhJ
	9hOzbGTl411Gdl0kkncLS+IlLYC3eq2IyWMmccNbVi0q70PrqdCI6Ct2SeeFuo+28ewWTKtf5P1
	Rr5GPA3Ie4z6PwBip1Hy7+oDfCy9HoFdk6Np40+Qlw1g0Hsn/W30TeSLVPsr44fa/z37/63LbU1
	BTWEhPWqUw//6uT1iv9DOIY5WMFKQnDT523eGANr/x8hh3MbtM3lodlN2ffErK4SE79Iyg3HhHK
	1Qsi2dm40enQUqIjVZk+CwvIsuxkLJWLQNY1yHNF1g0FyNJ3uFyfFnCfKvzQ9rd3TTfi5Qz6jnU
	jz6Z7jpzewfHFK3QSCvTDHEC0EMMyjFRpaPaqRuZYX8fblM49+vQdxuWyAAHw+Vfy4ZptgDbAhL
	W7wBzmef2cCNb15i+eyHshpWL9SzEPV67roivt4xUBdiK//NfDIEIkFkq+kR4bsfzPMhH8SVeNc
	2Q5E8042nKVBCHgpS7pnCzIat6u1owvPeTGsjWcfcyemIQpby8=
X-Received: by 2002:a05:6102:6444:b0:602:ba51:5235 with SMTP id ada2fe7eead31-605681b588fmr2698218137.29.1775088761318;
        Wed, 01 Apr 2026 17:12:41 -0700 (PDT)
Received: from cashxps.fdma.com (c-76-137-39-120.hsd1.fl.comcast.net. [76.137.39.120])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb7f1523sm1756460241.1.2026.04.01.17.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 17:12:40 -0700 (PDT)
From: John Meyer <jmeyer@fdma.com>
To: linux-sound@vger.kernel.org
Cc: yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	John Meyer <jmeyer@fdma.com>
Subject: [PATCH 1/2] ASoC: sdw_utils: Add CS42L45 and CS35L57 codec table entries
Date: Wed,  1 Apr 2026 20:12:35 -0400
Message-ID: <20260402001236.17086-1-jmeyer@fdma.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add codec info table entries for two Cirrus Logic SoundWire devices
found on the Dell XPS 14 DA14260 (Panther Lake):

CS35L57 (part ID 0x3557): A speaker amplifier that uses the same
cs35l56 Linux driver as the CS35L56 and CS35L63.  Add a matching
entry identical in structure to the existing 0x3556 and 0x3563
entries so sof_sdw can look it up by part ID.

CS42L45 (part ID 0x4245): An SDCA headset codec closely related to
the CS42L43.  The CS42L45 exposes three SDCA endpoints -- UAJ (jack
playback), SmartMic (DMIC capture), and UAJ (jack capture) -- but
does NOT have an internal speaker amp function; speaker output is
handled by the external CS35L57 amps on separate SoundWire links.
Add a three-DAI entry using the existing cs42l43 codec driver and
DAI names (dp5 for jack out, dp1 for DMIC, dp2 for jack in).

Tested on Dell XPS 14 DA14260 (Panther Lake, kernel 6.18.20).

Signed-off-by: John Meyer <jmeyer@fdma.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 75 ++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -559,6 +559,32 @@
 		.dai_num = 2,
 	},
 	{
+		.part_id = 0x3557,
+		.dais = {
+			{
+				.direction = {true, false},
+				.dai_name = "cs35l56-sdw1",
+				.component_name = "cs35l56",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_cs_amp_init,
+				.rtd_init = asoc_sdw_cs_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "cs35l56-sdw1c",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
+				.rtd_init = asoc_sdw_cs_spk_feedback_rtd_init,
+			},
+		},
+		.dai_num = 2,
+	},
+	{
 		.part_id = 0x3563,
 		.dais = {
 			{
@@ -652,6 +678,43 @@
 		.dai_num = 4,
 	},
 	{
+		.part_id = 0x4245,
+		.codec_name = "cs42l43-codec",
+		.count_sidecar = asoc_sdw_bridge_cs35l56_count_sidecar,
+		.add_sidecar = asoc_sdw_bridge_cs35l56_add_sidecar,
+		.dais = {
+			{
+				.direction = {true, false},
+				.dai_name = "cs42l43-dp5",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.rtd_init = asoc_sdw_cs42l43_hs_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "cs42l43-dp1",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_cs42l43_dmic_rtd_init,
+				.widgets = generic_dmic_widgets,
+				.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
+				.quirk = SOC_SDW_CODEC_MIC,
+				.quirk_exclude = true,
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "cs42l43-dp2",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+			},
+		},
+		.dai_num = 3,
+	},
+	{
 		.part_id = 0xaaaa, /* generic codec mockup */
 		.version_id = 0,
 		.dais = {
--
2.49.0
