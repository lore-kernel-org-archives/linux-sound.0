Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D61416875
	for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 18:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786818493; cv=none; b=ki8DcBJFFO8KsygImrUc2DBI3yhYCQOhNG7CeS8aZGdJIzbZMKzPAlB9NXZ1KRCyH4ObXpv3AuVJQz/eEERiDx+HaMImWoW01ga9uF3qWTYjZ2yQCKs3kxoF7WUUWt5yajUQUwnoQYmh3joGiETD86PUS94CBKsvlV631WrjxMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786818493; c=relaxed/simple;
	bh=QEbZHFdbmcMsSGPZn+PNc6OIOMYLKxYlNkHBUSSUYe0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oPVUbJU2mtb8IvYTiN/v+1TBahEJWhAD9TDv4lIMEUUWf5IeknmDEn77A3c85ltw7QUOiT3spABx4UQy1x9Szmfmut1Xfp7DitidvyJ+7RKMuUwy9YGYgleTweUDM8BjCLBtDJisFCAIUPn2yauzXUJ36gQxfjI0/niPkpG5JAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRivU45G; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRivU45G"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-38111ea8a88so1450213a91.1
        for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 11:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786818491; x=1787423291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xtb8ooAkiIBNwTosQcmJhXs0TiKPjM6hHAugaLOcq2Y=;
        b=dRivU45G52UKnFnws06B0GUsYZ8czgJeH8MDxL+tbzFLCQJSP/9M1ZbmaEVSIgopxg
         iOUx9HZBTx0LU1MwhGCnd3Ht5kAjVeRes076yhWaV36COi4jEmL1ukYw+GLliHKT1Z/P
         VvBu8MWFjyHgfxYrTGmE8GS/AoKlEQNFGWNieCfCA99AeYhwYU/EQS7XuVYSaEgFO+Nr
         GbU85Dd33JixUYafNoM1uJzYSDQXk2fbg5mN9I4zF6wPjWidEtSd2SR8nQ6NLgvsxboh
         vxZ6JiM8fpeowkkJJ21514x/e93LjMVlV7XWVPT0ZZ5qs9DhQx5pujmkGE0o++HlNYga
         iCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786818491; x=1787423291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xtb8ooAkiIBNwTosQcmJhXs0TiKPjM6hHAugaLOcq2Y=;
        b=PKB5UBfFO45Tmr0+7GPd9Jb91p504dValL5IxFZEZGr4XjXKEH68F/MqGeXpzMePL6
         F6JV4m2aCeDmHtjQc7yhxiMlqzSzam2tRgoJ60Fs7SVxSknh8EkDlx1fPdpY8U2gW0LX
         fbtnwlc3ERnNcEY74ljIOmcc/GPWdIuOWK84glapiMiGyfJkrah7VDWEkAmt8H9U4ix7
         q9l0p+oiHMd0IRJnw19xbXnNYjmeBFzet0WZ1lT6MovDB5iIlAMTexV56T7e9LLE3tV1
         aEFpmlTYXLcNxXUmnX75h97N43cvyKX+CXu/cn0/1YTln0pKaqw4oRS/5ctLU1ZykZAH
         XYDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmwYoatdYB1zeEfXjewi/JMbbyiz9rE45jIYza1i8CfuZc88rj3MFGWamW+ZrSTBZmGLUh/dBfVKEa/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzV9vIJlaOro6m2HLxwVJ3/eXXI3Q7EY+HxBO4ZHu+I1EMuE6GA
	Uq99yuIenb/qZhoGLlI7ds8ObFd+vQI++h34pwSUoeCzVuy1g1t61bEV
X-Gm-Gg: AR+sD11Z3rc8cUdYwUyTWI68V2bGLcxRRUwKGNR3KT3JBxv3Ek3vbYDJ6pVaoCLzXpA
	K+CneCBh+0FW4vbJHMmAMqdHS8wIB3MNwCLm4T61cxrrma5Yd1e6g5K0YYntPxjtqMqrnZDuN3Q
	2aapxZp5fC+PwyOQ1Gt4b+tWtKe914JOhgZTimr74VO1wEjDBO29UnXgfVFXPVvornk3SojO4Fh
	7pwOjZf6bN1usXZ+sU1lqDNXF3z0LHPDOGKP8/tKZOyLi8siCNHEvqB2hCVu47aVpORVqW81EsM
	+qmYw49HqVqfS1cZ2l1CI09WwV0aZtJfV7o4ywz5sjVFXobVJ9E03uGyzU3Kr/isPhms0gPwFNA
	XV1lPji1S2OY5OEMxaRXG9cnuSeZodjyl8PwmZ2jEHy9FHB25pCd0ccmHKb1QICBlzYYHrRalH5
	tC/enGEMuptV25a0TGE/BQhoASC3blzngVW5OsFrKqCJXnqDnbDhEGf8gDEQEWLI6SnDcw8os3z
	Ot3PibfRKZiigZDGLu+A7B0Abc=
X-Received: by 2002:a17:90b:5807:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-3933b958ad5mr16111082a91.14.1786818491298;
        Sat, 15 Aug 2026 11:28:11 -0700 (PDT)
Received: from sataporn-yoga ([2405:9800:b520:e268:66a3:912:5f57:90bb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-323050db573sm12391341eec.9.2026.08.15.11.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 11:28:10 -0700 (PDT)
From: Sataporn <excursively@gmail.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sataporn <excursively@gmail.com>
Subject: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: add rt721_l3_rt1320_l3
Date: Sun, 16 Aug 2026 01:27:47 +0700
Message-ID: <20260815182747.8913-1-excursively@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Slim 7i 14IPH11 (DMI product 83QM) drives four speakers
from two amplifiers on SoundWire link 3:

  sdw:0:3:025d:0721:01     RT721, CompanionAmp function only
  sdw:0:3:025d:1320:01     RT1320, SmartAmp function

This chassis has no headset jack, and the microphones are the PCH DMIC
array, so no jack or mic function is described for either peripheral.

The Panther Lake match table has no RT721 entry at all: the RT1320 is
described on links 1, 2 and 3, but only ever paired with RT712, RT713
or RT722. This layout therefore matches nothing and the driver falls
back to the default SoundWire machine with function topologies.

That fallback misbehaves here, because the firmware also declares a
peripheral that is not fitted:

  sdw:0:3:025d:0722:01     RT722, never attaches, reported UNATTACHED

Its ACPI device (SWD0, _ADR 0x000330025D072201, in SSDT "LENOVO CB-01")
has no _STA method, so it is enumerated unconditionally on every SKU
sharing this mainboard (LNVNB161216), which also ships in CS42L43 and
RT722 variants. It carries UAJ, SmartMic, HID and SmartAmp functions,
which appear to describe a sibling SKU that has a headset jack. The
default machine driver selects it for the jack, microphone and speaker
functions:

  Components : ... cfg-amp:3 ... spk:rt721 rt1320 rt722 hs:rt722 mic:rt722

and every stream then fails when its ports are programmed:

  rt722-sdca sdw:0:3:025d:0722:01: DPN_PortCtrl register write failed for port 1
  soundwire sdw-master-0-3: Program transport params failed: -61
  soundwire sdw-master-0-3: Program params failed: -61
  SDW3-Playback-SimpleJack: ASoC error (-61): at snd_soc_link_prepare()

Speakers and microphones are silent; only HDMI works.

Add an entry describing the two amplifiers. They share aggregation
group 1, following the existing rt712_vb_l3_rt1320_l3 entry: with
separate groups each device asks for a DAI link named
"SDW3-Playback-SmartAmp" and the second registration fails with
-EEXIST.

The RT721 needs its own speaker endpoint rather than spk_l_endpoint,
because the endpoint number indexes the codec DAI array and the RT721
exposes its amplifier as endpoint 1: endpoint 0 is the jack, so
reusing spk_l_endpoint creates a jack DAI link and no amplifier at
all.

No monolithic topology exists for this combination, so sof_tplg_filename
is set to the "dummy" name that hda_sdw_machine_select() already uses for
the default machine. Without it, load_topology() runs with no_fallback
clear, and sof_sdw_get_tplg_files() abandons the function topologies
entirely on reaching the SSP2-BT link, which has no separate topology
yet:

  sof_sdw sof_sdw: dai_link SSP2-BT id 8
  sof_sdw sof_sdw: dai_link SSP2-BT is not supported by separated tplg yet

falling back to a monolithic file that does not exist. Marking the
absence of a fallback lets that link be skipped instead, and keeps BT
offload enabled.

snd_soc_acpi_sdw_link_slaves_found() only requires the peripherals named
in the table to be present, so the unfitted RT722 does not prevent the
match. An explicit entry stops the machine driver selecting it, without
needing a quirk for the firmware bug itself.

Signed-off-by: Sataporn <excursively@gmail.com>
---
alsa-info with this patch applied:
https://alsa-project.org/db/?f=8b9e4c24389cc520c77b3ece54edcbfbb50d07c6

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index f7694b2..c3ce060 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -92,6 +92,18 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
 };
 
+/*
+ * The RT721 exposes its amplifier as endpoint 1; endpoint 0 is the jack and
+ * endpoint 2 the DMIC array, neither of which is wired up on boards that use
+ * the codec as a speaker amplifier only.
+ */
+static const struct snd_soc_acpi_endpoint rt721_spk_l_endpoint = {
+	.num = 1,
+	.aggregated = 1,
+	.group_position = 0,
+	.group_id = 1,
+};
+
 static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] = {
 	/* Jack Endpoint */
 	{
@@ -211,6 +223,15 @@ static const struct snd_soc_acpi_adr_device rt712_vb_3_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt721_3_group1_adr[] = {
+	{
+		.adr = 0x000330025D072101ull,
+		.num_endpoints = 1,
+		.endpoints = &rt721_spk_l_endpoint,
+		.name_prefix = "rt721"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt713_vb_2_adr[] = {
 	{
 		.adr = 0x000230025d071301ull,
@@ -437,6 +458,20 @@ static const struct snd_soc_acpi_link_adr ptl_sdw_rt712_vb_l3_rt1320_l3[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr ptl_sdw_rt721_l3_rt1320_l3[] = {
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt721_3_group1_adr),
+		.adr_d = rt721_3_group1_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1320_3_group1_adr),
+		.adr_d = rt1320_3_group1_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 /* Order Priority: mockup > most links > most bit link-mask > alphabetical */
@@ -531,6 +566,19 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l3.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(3),
+		.links = ptl_sdw_rt721_l3_rt1320_l3,
+		.drv_name = "sof_sdw",
+		/*
+		 * No monolithic topology exists for this combination; the
+		 * "dummy" name marks that, so the function topologies are
+		 * used and functions without one are skipped rather than
+		 * failing the card.
+		 */
+		.sof_tplg_filename = "sof-ptl-dummy.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_sdw_machines);
-- 
2.43.0

-- 
2.51.0
