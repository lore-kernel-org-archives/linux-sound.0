Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE71A1D27B6
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 10:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761735089; cv=none; b=KKT1IKMvSqHkBJm32A1YxUOz+rb7eVDzUQla3Vk3YeYloqUSTjMR546SJM5YQn3CR57xotDCRmgLrfKmxEqpsxMnakQuNoMxdgRJDKTbM4nhGuKnYEC2F6VnOh121TlN21BnD7oAEYNuHeh4vzcgNNcltaKXAA5TDWwM3P4hRIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761735089; c=relaxed/simple;
	bh=ygmtqX4Jtg2p0q+D64BjwBFbAyhKHMZgt1zgU4h+o2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TzMM63d9dBcF96T67KLwKtWfuHGlzzdXX0GAaCLzWrAbEvCpnF1s37Rfum/Hcs79Nlxg3OUuMIzSXA9oSDkNpiTHLraSWuuqzwt0ksJOAitD9aE23n87r4zTvOGNF2PPCzAR4TY2Fu/ARzsVhaJLYXklblZp6B/NULa91jOfrrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/U8vpEq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/U8vpEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761735088; x=1793271088;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ygmtqX4Jtg2p0q+D64BjwBFbAyhKHMZgt1zgU4h+o2A=;
  b=j/U8vpEqLyoUHdtC4D3SYVBlQbr2on+QzHbhJHJ5qstc5QYOZTh5dxsD
   S5k08UpUfVixJKoV6yPE87MR2v/GaKwkI1VlkArc5gcKv/ZfQhyuJEwDK
   XtTHHJdlA0rkTsbaHF16mldZ0zwO+l7tZxl2PmMful9p3xrSAAcE6ClAz
   o0H6VQdTdAuxtmNgicFoQyA1FbFmJzGV4EhLGYNC83EzQsXyFenF/pkP0
   fOPgjsKi9H7fyzgIkgilFuDoB2G5w4Ixfky6p+AIIn+oRFu/rPr7E6LyZ
   zcKWGve53vu5RVKMlKiU/4u/H0V3+b9ug8dyGjTBUVHfLK0HLXTGb1QxK
   g==;
X-CSE-ConnectionGUID: l4aSb6niTH+4yUEO+I3CEw==
X-CSE-MsgGUID: WRJbgBl9TAe6DYhV5hrvwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="63553567"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="63553567"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 03:51:28 -0700
X-CSE-ConnectionGUID: kavka/oESxuCeOYsK006EA==
X-CSE-MsgGUID: A3LbLD8YQm2TpCz/SIfraQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="184861507"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.138])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 03:51:25 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	arun@arunraghavan.net
Subject: [PATCH] ASoC: SOF: pcm: Set the PCM device name for HDMI
Date: Wed, 29 Oct 2025 12:51:34 +0200
Message-ID: <20251029105134.1342-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

User space (alsa-lib) uses the PCM device name to detect HDMI devices, the
name is expected to be in form of 'HDMI'+<space>+number.
The PCM device name is not configured in ASoC, only the PCM id is set based
on the loaded topology.

Detect the HDMI PCM playback devices and configure the name to help user
space to handle HDMI PCMs correctly.

aplay -l | grep HDMI (Audio capable monitor connected)
Before the change:
card 0: sofhdadsp [sof-hda-dsp], device 3: HDMI1 (*) []
card 0: sofhdadsp [sof-hda-dsp], device 4: HDMI2 (*) []
card 0: sofhdadsp [sof-hda-dsp], device 5: HDMI3 (*) []

after the change:
card 0: sofhdadsp [sof-hda-dsp], device 3: HDMI1 (*) [DELL P1917S]
card 0: sofhdadsp [sof-hda-dsp], device 4: HDMI2 (*) [HDMI 2]
card 0: sofhdadsp [sof-hda-dsp], device 5: HDMI3 (*) [HDMI 3]

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/pcm.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index fe43de1fe96c..cee04574264e 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -613,6 +613,24 @@ static int sof_pcm_new(struct snd_soc_component *component,
 	snd_pcm_set_managed_buffer(pcm->streams[stream].substream,
 				   SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
 				   0, le32_to_cpu(caps->buffer_size_max));
+
+	/* Set the PCM device name for HDMI playback */
+	if (!strncmp(pcm->id, "HDMI", 4)) {
+		int hdmi_idx;
+
+		/*
+		 * Make sure that the name is in"HDMI<SPACE>x" format as this is
+		 * expected by user space.
+		 * See alsa-lib's __snd_pcm_info_eld_fixup_check() which is
+		 * guarding the __snd_pcm_info_eld_fixup() in
+		 * snd_ctl_hw_pcm_info() and snd_pcm_hw_info() library functions
+		 */
+		if (sscanf(pcm->id, "HDMI%d", &hdmi_idx) == 1)
+			snprintf(pcm->name, sizeof(pcm->name), "HDMI %d",
+				 hdmi_idx);
+		else
+			strscpy(pcm->name, pcm->id, sizeof(pcm->name));
+	}
 capture:
 	stream = SNDRV_PCM_STREAM_CAPTURE;
 
-- 
2.51.2

