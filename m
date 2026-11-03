Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736435;
	b=x9o42BFLPI0R1cLR7i5+VfVyxO6Zf8e4f3iQ6G8fC6qhGvI1ExQVqmQJMfT16FJNKfCw
	 jcaxqlfcW9h9w7tKhsjxCr3hLq6guTHlA68Jzvh5FhGe+4Oln6PrLXSyWeELDeP8/svVV
	 VPBw4rutoikPKc6jpOK8YZimHUFNDHIU/Wlt/zYwY0W3GEd4HLLUcDxRFzVhhlLrdl4y6
	 K+Tx7gHNboNml6TkaQ6wc/T3fqYUTApIOvezcdZAe1oKzN+JVog/4u/lct//m9UBwNvcN
	 fWfJkwHV9xQTbNJNHO85GOcDbWZFlZSMQLfFVOv6OideFuhAgNB39RHvc0XYFFa/wOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736435;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BInk29Bm1/cypDatkmjM06J6zHFKks4ZHicr6kuplkk=;
	b=aETjQ5RazSdtHmuTmHKrkOcwXadm13PQM+NPnWcSnNx6/vowQHuGQKLM7HRJNQHUM/m5
	 E1SqWxyznZkVtcI4cc/1ltKqvhP3aWRyNeJD4U7syZII7MdEhVKNPdLotrNtObvYa3+xU
	 AqhIEtsV/b2I2fpv60DuskUyEex3bxVnJGLpZDpK1/shOXxI4celTZEBDsnQjw+ELnOpZ
	 ULK6dRhXQvAZj6AjCbckRbJOkkK+MZvMN237nmi6/1v8CeiGK5AR6/xiBeWUjal5KzixN
	 R3/kNayOzCcE1XL0+qfcg3xad/OO6CigzbxAOnHpAOS84/dT4PgnmdrO8oY+pWvilnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pFZ73T42;
	arc=none smtp.remote-ip=95.215.58.202
Received: from mta1.migadu.com (out-202.mta1.migadu.com [95.215.58.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D793606A335
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 20:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D793606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pFZ73T42
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n+BgTz1WSrNDtfZp9vDHIcJ1FE9xUZfuX05vlcrRddY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793736431; v=1; x=1794341231;
 b=pFZ73T42M4auu8W6h7xoZrBMWq67GHLfsE7dsgR6MqNKcbAJHqUnEJqFDr2G8IUMH4PVtoyZ
 sSl533VN+iSlGTdxri35Che5e9AroQCT3Nu3Hink1HNxcYZHkmzjhtS6kV/+mu/JhK49aCrXlQx
 d77cKYjTEpq/qSulMqvOcadc=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9a5d9e9a223c21e1;
	Tue, 03 Nov 2026 20:07:11 +0000
X-Mizu-Trace-ID: 9a5d9e9a223c21e1
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: broonie@kernel.org
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] ASoC: amd: acp: add ACP70 SoundWire machine entry for ASUS RC74XA
Date: Tue,  3 Nov 2026 12:05:36 -0800
Message-ID: <20261103200540.3863272-3-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103200540.3863272-1-matthew.schwartz@linux.dev>
References: <20261103200540.3863272-1-matthew.schwartz@linux.dev>
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

The ROG Xbox Ally X20 (RC74XA) has two TAS2783 amps on link 0 with
unique IDs 0x8 and 0xB and an RT721 on link 1. No table entry describes
that layout, so machine selection falls through to acp70_rt721_only and
routes speaker playback to the unused RT721 amp endpoint.

Add a two-link entry ahead of acp70_rt721_only with the RT721 limited
to its jack and DMIC endpoints.

Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 44 ++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index c2f0479301ebd..0c1a7a70ce146 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -739,6 +739,45 @@ static const struct snd_soc_acpi_link_adr acp70_tas2783x2_l0u9c_rt712_vb_l1u0[]
 	{}
 };
 
+static const struct snd_soc_acpi_adr_device tas2783x2_l0u8b_adr[] = {
+	{
+		.adr = 0x0000380102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "tas2783-1",
+	},
+	{
+		.adr = 0x00003B0102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "tas2783-2",
+	},
+};
+
+static const struct snd_soc_acpi_adr_device rt721_l1u0_jack_dmic_adr[] = {
+	{
+		.adr = 0x000130025D072101ull,
+		.num_endpoints = ARRAY_SIZE(jack_dmic_endpoints),
+		.endpoints = jack_dmic_endpoints,
+		.name_prefix = "rt721",
+	}
+};
+
+/* ASUS ROG Xbox Ally X20 (RC74XA) */
+static const struct snd_soc_acpi_link_adr acp70_tas2783x2_l0u8b_rt721_l1u0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(tas2783x2_l0u8b_adr),
+		.adr_d = tas2783x2_l0u8b_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt721_l1u0_jack_dmic_adr),
+		.adr_d = rt721_l1u0_jack_dmic_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_endpoint rt721_endpoints[] = {
 	{ /* Jack Playback/Capture Endpoint (AIF1) */
 		.num = 0,
@@ -906,6 +945,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 		.links = acp70_rt721_l1u0_tas2783x2_l1u8b,
 		.drv_name = "amd_sdw",
 	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp70_tas2783x2_l0u8b_rt721_l1u0,
+		.drv_name = "amd_sdw",
+	},
 	{
 		.link_mask = BIT(1),
 		.links = acp70_rt721_only,
-- 
2.56.0

