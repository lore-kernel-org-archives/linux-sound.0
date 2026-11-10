Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315322;
	b=CzagUBgKBoZDnseLfkWGAmaO/AwbM6HYcYpqF9FkbLkeAx2L/4qz16E5sFwz9KLmYHaU
	 J6O/1crWihqHu7/ajoWex8hHgpS7aOMgdwTbqXPmDfPca50b7SPajmPM6u9HDUaUUZAxR
	 wHuFcfyBPsr/ubPCLvn0zyguA4GOeykSuNC/7wLgemdBVTPGuAYTxupaOtC2rfCso4R7M
	 IUshK4V+Kh6615aNuNSebO29KW1J5rVLbsOHUtOl/XvavpI+7cNM76O/sZficyCHFppkk
	 C9e7JIKjvxhxNnUSKGCmZdlJPI061sUA7d4SDjUb5qtyc6CWXs6zktzwhy//vVdyMig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=TwRZuvAXgLAEcFSDE6vuvRmvdHxyqb0LUu/3ZbgkOwo=;
	b=pQEq3JlyPN2e8TmDKH922wPIrUv6UJTLSlcp1yfiDJeUfubUbfJmr3dZnlMH1PxotZBK
	 coB+U23Nm6fmUsVWY8IytwduFly1EGAP28RvsLrLbAz7T9dBJCgiyDolJ3U2OIazwy+d2
	 NZHmC3cSZfkt8FLDdaSwoIjYc4cipPPzFKRMb6Tgiw/UxFMASMr8tsIRs6ZHnGfCnB7O5
	 M/b/zohf6v0n30V2FG23T61nt/Ij+6BuS6qVuq8awHLbBuPXOK2w8I1d76W/8ueWmNCyU
	 65wUgbXvYd/PZN05DOmwTswzLLGZapyHjcusHieMgi48QM4OByh85L7ClJxWrna6g3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o+dkBeZ9;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B7160A3822
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 12:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B7160A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o+dkBeZ9
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3720addb068so3507571eec.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 04:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794315321; x=1794920121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwRZuvAXgLAEcFSDE6vuvRmvdHxyqb0LUu/3ZbgkOwo=;
        b=o+dkBeZ92Heur0Y/ge5JcPI2o/HVPQgIjxuuRVsitAoburkYeB3B4JeMEvzcgtAY2K
         svAsrgxqnAHZagQKq52bPHWuRQt4CWJKCcOwDj6x4FUeFkTtBhQIG93zMeZsQVxHElhT
         8KXeUSa1xRZpAr3mbYcAH4U5lTsqL+ygKY507GDrBor89KR+hp8KPGPJ8XFNwWMmX6NK
         6G4PV0X+24jjFh+nXo1IUuKDYMXser8FrU0th34YLw8X6yHKPu+4HIrz2j9aT5H5beYu
         uEJyArnh2G2HQQVYWd8KqBqKs3rt4xo7Pfsa8Nh7/SZ/TFKAQyDqbjINev4WOiuwvTJ7
         m+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315321; x=1794920121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TwRZuvAXgLAEcFSDE6vuvRmvdHxyqb0LUu/3ZbgkOwo=;
        b=UPGCXMntS/9b12yEn+vtNA92QczlA2hqMkdcrRZwbHVpBKxJo9zI7RwYsIHa+j1wzt
         JucGG2QuBXHJSZc+7TkXARlwupbWdwQRhOqh9QOPzuqlmYIa/lOH6LN6JV50hjX94MxM
         LeIg4Tb0UZkaSabRkt8ShG1vB1aOyyNIuMs6nNfw66bc44rhslnvJxL0XdZ9bW3iaSOo
         f/yDlGx8CmW5mhB6JFlN12EMX898Jt7T//4IChVp4FWmWIybHnWw48XBx8pldCqdp0xl
         izNVPn9bB+oM/NykC+q9pTds/5rFockMclOcmByMX1s6yINiGVGMGsyy8g9zwPWoEpRV
         BWNw==
X-Gm-Message-State: APuU4Z+HDMmfVBsa2NtK5g157FlR7Sy6WmebsiGECjR9b1p5Uu9Z7tHA
	9ocfiVWAfNjtbb08YGhu9uGtK778QSFqajMTWH2kHa/Q+FV9oWZytZ0EJJ4hEVyEA1g=
X-Gm-Gg: AYBFou3IMyX2Ix8pE7JalP6QfgzZ2Sjijzme1LqCnxXSRbDmiZR14RpeET/XmJu5yoo
	3fbKtySKdYv+Zh/ZBo9Dxzn79R2u3CtgvxV14TC/GTR0CscHeQNqLA6DT5Gl4HuhS7bK+S8fhs+
	eE3SxyKjyR6qwoJa+GhoU5cPrH30VbW4Ukj9eRBetIXEqkvVoRwuhpz7CZicb+u1Y0AK83EGHfZ
	fg7TS+1xkD4Mn37juueMFBERovRa2FbdQAjmGplAIeqB3X8BUi9qC2ZQG2l4/tuqngQWBsSY+LY
	55Lbzo/qXA7Bydj7e/WhgTsQg+fc8vPOwh5uEbkt5W9sfk0kyWIJRofpwiMqxiMbcEmccNjgVoO
	3uu5Te9nlTXy8WDQNAvWwmC7b8UTo6EhFW4y3DJj7MQJA0hFsYmnucUQ7N7FwEvRN4Gr6pamKpU
	+0iLJa/gIWTrsMmY2ik4ZryzO5qiMrasDNwsUlG/Vr/ohYecnzdUdVRc7gFH89tS0ZceBBRGLlo
	k/GyIGkoVpIBMzdCdSGZLAFZQDdF7Lcf1oREcW2X+Dquo2Wztg1nY4V8DGfEKjTtRbNxUbH1W+7
	cLoCH/UutnFrANPYU61NXcx3
X-Received: by 2002:a05:7301:fc0b:b0:36a:18d2:8c79 with SMTP id 5a478bee46e88-37520216c5fmr2704198eec.19.1794315321086;
        Tue, 10 Nov 2026 04:55:21 -0800 (PST)
Received: from myarch ([121.165.40.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae63a6sm6855380eec.1.2026.11.10.04.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:55:19 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: broonie@kernel.org,
	Vijendar.Mukunda@amd.com,
	shumingf@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaehoon Kim <jaehoon1744@dankook.ac.kr>,
	"Claude Fable 5.2" <noreply@anthropic.com>
Subject: [PATCH RFC 2/2] ASoC: amd: acp70: Add rt713 + rt1320 SoundWire machine for LG gram 16Z95U
Date: Tue, 10 Nov 2026 21:54:29 +0900
Message-ID: <20261110125459.3924-3-jaehoon1744@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110125459.3924-1-jaehoon1744@gmail.com>
References: <20261110125459.3924-1-jaehoon1744@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jaehoon Kim <jaehoon1744@dankook.ac.kr>

The LG gram 16 (16Z95U) uses an RT713 jack codec on SoundWire link 0
and a single stereo RT1320 amplifier on link 1. There is no matching
entry in snd_soc_acpi_amd_acp70_sdw_machines[], so no machine device
is registered even once the SoundWire path is selected.

Add two machine entries:

 - rt713 (jack + DMIC endpoints) on link 0 and rt1320 on link 1, used
   when the RT713 exposes a SmartMic SDCA function (rt712-vb check).
   On this machine the internal microphones are routed through the
   RT713 SmartMic function; the ACP PDM controller is not used.
 - a fallback with only the rt713 jack endpoint and rt1320.

Tested on LG gram 16Z95U-GS59K with kernel 7.2.14. The "amd-soundwire"
card is created with these PCMs:

  SDW0-PIN0-PLAYBACK-SimpleJack  rt712-sdca-aif1
  SDW0-PIN3-CAPTURE-SimpleJack   rt712-sdca-aif1
  SDW0-PIN5-CAPTURE-SmartMic     rt712-sdca-aif3
  SDW1-PIN1-PLAYBACK-SmartAmp    rt1320-aif1

Headphone playback and internal microphone capture work with the
stock alsa-ucm-conf (1.2.16.1) HiFi profile; headset microphone
capture was not tested. Speaker playback through the RT1320 is still
silent although the stream starts without errors; that is being
followed up separately.

Signed-off-by: Jaehoon Kim <jaehoon1744@dankook.ac.kr>
Co-Authored-By: Claude Fable 5.2 <noreply@anthropic.com>

---
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 85 ++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index ccd0115..2a6d829 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -553,6 +553,80 @@ static const struct snd_soc_acpi_link_adr acp70_rt722_l0_rt1320_l1[] = {
 	{}
 };
 
+/*
+ * LG gram 16 16Z95U: rt713 (UAJ + SmartMic) on link 0 and a single
+ * rt1320 SmartAmp on link 1.
+ */
+static const struct snd_soc_acpi_endpoint rt713_vb_endpoints[] = {
+	{ /* Jack Playback/Capture Endpoint (AIF1) */
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* DMIC Capture Endpoint (AIF3, SmartMic function) */
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device rt713_vb_0_single_adr[] = {
+	{
+		.adr = 0x000030025D071301ull,
+		.num_endpoints = ARRAY_SIZE(rt713_vb_endpoints),
+		.endpoints = rt713_vb_endpoints,
+		.name_prefix = "rt713"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt713_0_single_adr[] = {
+	{
+		.adr = 0x000030025D071301ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt713"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1320_1_u1_single_adr[] = {
+	{
+		.adr = 0x000131025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1320-1"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_rt713_vb_l0_rt1320_l1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt713_vb_0_single_adr),
+		.adr_d = rt713_vb_0_single_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1320_1_u1_single_adr),
+		.adr_d = rt1320_1_u1_single_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_rt713_l0_rt1320_l1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt713_0_single_adr),
+		.adr_d = rt713_0_single_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1320_1_u1_single_adr),
+		.adr_d = rt1320_1_u1_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_adr_device tas2783_2_adr[] = {
 	{
 		/* left */
@@ -714,6 +788,17 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 		.links = acp70_rt722_l0_rt1320_l1,
 		.drv_name = "amd_sdw",
 	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp70_rt713_vb_l0_rt1320_l1,
+		.machine_check = snd_soc_acpi_amd_sdca_is_device_rt712_vb,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp70_rt713_l0_rt1320_l1,
+		.drv_name = "amd_sdw",
+	},
 	{
 		.link_mask = BIT(0) | BIT(1),
 		.links = acp70_4_in_1_sdca,
-- 
2.43.0

