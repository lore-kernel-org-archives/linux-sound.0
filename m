Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1022F362C
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 07:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761723356; cv=none; b=Fd8QRlrSHSXI0X7Lgjltq6zoqyLIHdJ1FGxsrE3Dj1sdxRJv0jNDXditnzC+EFfy3lU6TD7VAQrKeRSHF94FzqYUbSzsHHCGZzy2VPwn1It/Yh8+TCHC+pVmDaDJprRrVkt+Zt7ECIwVtHzcr3ghjdh17DJ+s+GFIiLsTr2ugaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761723356; c=relaxed/simple;
	bh=NfUGVq9KQmpOEHsws6HZjmr2BX/0A0vXoB0h837jPGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QHAQ0rgD0ZBzRjjl+sEG9zOO1Kz+m/frSIPiXvuy+d2WwpUc1DAsi8HTlOe4mrEERHD0CzWQFdVoa8aUlk5+tb9eBB2xDwtG1rDHr9SUDU/wcUSKO0IuCWTRThP9uhV+q1R8hBttiCHqbxdFRgupcDgf6AVyUodPCOv5JOB1m4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyajQWBS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyajQWBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761723354; x=1793259354;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NfUGVq9KQmpOEHsws6HZjmr2BX/0A0vXoB0h837jPGE=;
  b=fyajQWBSZ9CJkSOhil08x/Jj4S0TS2x8swAc5F4B6sweHC178PhOVVKP
   j7czwOhxQzWctbylmzRJWCGPsTDaRvHZ7XPzwiJEVMghWe9O3gvyXPZW3
   xOWHO9wwwlGbJccm+e9bQDoS02tDi5DYEz5bLmRa0eHmOQeCbJXo7PJyy
   /sBMI0Rbez/Pa5KLCzlHoV308JxyfgtYVSPyhOcBynaBftNqs7aZ9OZSu
   hIwVLecYUa+3r2NvHodPGdrZN4kOIZ2/N0LQZLP5U4efOJh0Ps3a/LYim
   DsfgEgN5JYi2dHxXcCP3ljjtBM68WZ5YBDRNluUpLQvAa6fzHaxcYPTTT
   g==;
X-CSE-ConnectionGUID: oDU/8cWoRXuqs5/7Alt4sg==
X-CSE-MsgGUID: 9p8/nHDzRJqvgVyK8IAn+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62863602"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="62863602"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 00:35:54 -0700
X-CSE-ConnectionGUID: shZ4az5VSWGwk2j4ltxPXA==
X-CSE-MsgGUID: pafiRWymRJmtNe29JY90Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="190711991"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.138])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 00:35:50 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	shengjiu.wang@nxp.com,
	kuninori.morimoto.gx@renesas.com
Subject: [PATCH v2] ASoC: soc-pcm: Preserve hw parameters from components in dpcm_runtime_setup_fe
Date: Wed, 29 Oct 2025 09:36:00 +0200
Message-ID: <20251029073600.13624-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Component drivers can prepare snd_pcm_hardware struct based on the hardware
capabilities which information should not be discarded.

Only touch the rates, channels_max and formats if they were left to 0,
otherwise keep the provided configuration intact for the parameter cross
checking decision.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi,

Changes since v1:
- Move the implementation into soc_pcm_hw_init() with added 'force' flag
  Basically the RFC version with inverted flag.

Changes since RFC:
- move the hw parameter initialization/preserve code inline to
  dpcm_runtime_setup_fe

this patch in essence extends the special casing of formats done by
083a25b18d6a ("ASoC: soc-pcm: fix hw->formats cleared by soc_pcm_hw_init() for dpcm")

Other parameters might have been set in the same way as the formats
and preserving these are equally important.

A case for this is SOF used with HDA codec (analog or more importantly, HDMI)
where the hw-> params are set based on the connected display/device and
should be preserved so we can report correct rate, format and channels
supported by the equipment.

If the hw-> parameters are left uninitialized then we still need to
set the UINT/ULLONG_MAX for the refining code to work.

This applies only for FE setup, in other cases we shall (as before) do
a full re-initialization.

I think this makes sense and I cannot think where this might flop.

Regards,
Peter

 sound/soc/soc-pcm.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 2c21fd528afd..c82b10578ba6 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -570,14 +570,26 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 	soc_pcm_set_msb(substream, cpu_bits);
 }
 
-static void soc_pcm_hw_init(struct snd_pcm_hardware *hw)
-{
-	hw->rates		= UINT_MAX;
-	hw->rate_min		= 0;
-	hw->rate_max		= UINT_MAX;
-	hw->channels_min	= 0;
-	hw->channels_max	= UINT_MAX;
-	hw->formats		= ULLONG_MAX;
+static void soc_pcm_hw_init(struct snd_pcm_hardware *hw, bool force)
+{
+	if (force) {
+		hw->rates = UINT_MAX;
+		hw->rate_min = 0;
+		hw->rate_max = UINT_MAX;
+		hw->channels_min = 0;
+		hw->channels_max = UINT_MAX;
+		hw->formats = ULLONG_MAX;
+	} else {
+		/* Preserve initialized parameters */
+		if (!hw->rates)
+			hw->rates = UINT_MAX;
+		if (!hw->rate_max)
+			hw->rate_max = UINT_MAX;
+		if (!hw->channels_max)
+			hw->channels_max = UINT_MAX;
+		if (!hw->formats)
+			hw->formats = ULLONG_MAX;
+	}
 }
 
 static void soc_pcm_hw_update_rate(struct snd_pcm_hardware *hw,
@@ -626,7 +638,7 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 	unsigned int cpu_chan_min = 0, cpu_chan_max = UINT_MAX;
 	int i;
 
-	soc_pcm_hw_init(hw);
+	soc_pcm_hw_init(hw, true);
 
 	/* first calculate min/max only for CPUs in the DAI link */
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
@@ -1738,13 +1750,9 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_dai *dai;
 	int stream = substream->stream;
-	u64 formats = hw->formats;
 	int i;
 
-	soc_pcm_hw_init(hw);
-
-	if (formats)
-		hw->formats &= formats;
+	soc_pcm_hw_init(hw, false);
 
 	for_each_rtd_cpu_dais(fe, i, dai) {
 		const struct snd_soc_pcm_stream *cpu_stream;
-- 
2.51.2

