Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C897322768
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 11:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056620; cv=none; b=O/ZX3Ienyb1LI+2zhxogucdN578fPiNwm2P8jUlkV+qe++FInADb88cOHHFyNgnb6P2F2cAvAgAeARHhcr6LjImQJsIoU4hO/SZoAt9Zfk3FtWnj+gJFrTFLELTNV2ak+R2y0O+5iNWia8xNHn4SPqCGNi322cyOSO2xarm6+Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056620; c=relaxed/simple;
	bh=RlF+xgJCNuvzFdIDPLMyD53b705fRJwJDPrTPtFEut8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=grQkE03pkz7EmUItzycZIbLMtvzCp88GHTJcNahYejrjO4qAENQ0KWGT1d26JaXAPMUtZ/1OBsbGwzl8UlqQXMijy/uhX+ZVo87ghd2OXXXr24fwGqOztTymqBEo1ppw2LyB4zDEGyPt9nIHdrYwEGdAT9H3T+zDTwVR8N2SjQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jXElw1yS; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jXElw1yS"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773056617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E6ni+V15gEXaXXBvNzq+0rhu2ZSMmb0xp9G3k1TvHqc=;
	b=jXElw1ySaZIGt0aOj4NcaVRPGdTR+68a8jfgKGMZjOR/3sUe4ETq+t/RN2Ngm1MrwhJ9BR
	HxSCqmgoVVJNQFCZ2Mz8nJb9TfWmngGIS3/rks5ZAMPn0YVjhQFTLHX4BxSsjpq2Gg4451
	LviTw7z0nNdzIKgAcSr1+eHqB0i7HrU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	stable@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: aoa: Handle empty codec list in i2sbus_pcm_prepare()
Date: Mon,  9 Mar 2026 12:41:59 +0100
Message-ID: <20260309114159.765304-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247; i=thorsten.blum@linux.dev; h=from:subject; bh=RlF+xgJCNuvzFdIDPLMyD53b705fRJwJDPrTPtFEut8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnrNrHvXpf5KdbN7HPRj+gmq51nTr44wue80Tl3Q4/S9 0cSiyd6dpSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBELqUw/Hf9Guiac7dYUzIl kXU+S/nnj5a17zMviF9b6dsWmJPfOofhf7mjQ27dwVCvR1+Zf2kqMO2reP1t/cQzeyOdulc2vCh dzg0A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace two list_for_each_entry() loops with list_first_entry_or_null()
in i2sbus_pcm_prepare().

Handle an empty codec list explicitly by returning -ENODEV, which avoids
using uninitialized 'bi.sysclock_factor' in the 32-bit code path.

Fixes: f3d9478b2ce4 ("[ALSA] snd-aoa: add snd-aoa")
Cc: stable@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/aoa/soundbus/i2sbus/pcm.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/pcm.c b/sound/aoa/soundbus/i2sbus/pcm.c
index aff99003d833..65653601662d 100644
--- a/sound/aoa/soundbus/i2sbus/pcm.c
+++ b/sound/aoa/soundbus/i2sbus/pcm.c
@@ -314,7 +314,7 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 	int i, periodsize, nperiods;
 	dma_addr_t offset;
 	struct bus_info bi;
-	struct codec_info_item *cii;
+	struct codec_info_item *cii = NULL;
 	int sfr = 0;		/* serial format register */
 	int dws = 0;		/* data word sizes reg */
 	int input_16bit;
@@ -390,13 +390,11 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 	case SNDRV_PCM_FORMAT_U16_BE:
 		/* FIXME: if we add different bus factors we need to
 		 * do more here!! */
-		bi.bus_factor = 0;
-		list_for_each_entry(cii, &i2sdev->sound.codec_list, list) {
-			bi.bus_factor = cii->codec->bus_factor;
-			break;
-		}
-		if (!bi.bus_factor)
+		cii = list_first_entry_or_null(&i2sdev->sound.codec_list,
+					       struct codec_info_item, list);
+		if (!cii)
 			return -ENODEV;
+		bi.bus_factor = cii->codec->bus_factor;
 		input_16bit = 1;
 		break;
 	case SNDRV_PCM_FORMAT_S32_BE:
@@ -410,10 +408,12 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 		return -EINVAL;
 	}
 	/* we assume all sysclocks are the same! */
-	list_for_each_entry(cii, &i2sdev->sound.codec_list, list) {
-		bi.sysclock_factor = cii->codec->sysclock_factor;
-		break;
-	}
+	if (!cii)
+		cii = list_first_entry_or_null(&i2sdev->sound.codec_list,
+					       struct codec_info_item, list);
+	if (!cii)
+		return -ENODEV;
+	bi.sysclock_factor = cii->codec->sysclock_factor;
 
 	if (clock_and_divisors(bi.sysclock_factor,
 			       bi.bus_factor,
