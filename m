Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6365D2F0
	for <linux-sound@vger.kernel.org>; Sun, 24 Dec 2023 19:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="AfBLdt2/"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 04163604B9CB; Mon, 25 Dec 2023 05:50:10 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 04163604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703445610; bh=3jihFecVm+IP0dfvnuLqvowgaKIa9XdhyQ6uYruwr/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AfBLdt2/vyLyQx86CPwxWpa8KdQ/Xj9xI2EH4djhU0HGFL1wjTuvLLLqES+XfqOFB
	 lW6D1bdwI26dkOg1ZHy0nFNV5cjJzMC8U2yNqRChStaos4zW9btnDzztLZ0xmL03s5
	 5KwYiE3zfN0JOBMHggGLOJAVzU508W5XEYni24prehLOS5XcDcNWfF03Yn3KcBWyJU
	 Kw1nzMrbmQyB/09PCsRgWaR9Nu2GV+L5qLNWUmlsgekz3k7icrHHdjVT8AsUXvfBXv
	 t6pCnhzhXOsupdi8L6UfPVZ8W4m75GNP5U9ePkdwpObkZLc3elQ+rlUfJIb/g1hmOV
	 Z0oH0ol0zt0wA==
Date: Mon, 25 Dec 2023 05:50:09 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 01/23] ALSA: scarlett2: Simplify enums by removing explicit
 values
Message-ID: <67f0f1bb8b90d7c76dfe7062d22d33bbde19cf93.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>

This commit removes the explicit integer assignments from the enums.
The actual values matter little, and not assigning explicit values
makes it easier to modify the longer lists in the future.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 76 ++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index f1337a379833..6ab8b4c52357 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -223,11 +223,11 @@ static const u16 scarlett2_mixer_values[SCARLETT2_MIXER_VALUE_COUNT] = {
  * devices, dependent on series and model.
  */
 enum {
-	SCARLETT2_CONFIG_SET_GEN_2   = 0,
-	SCARLETT2_CONFIG_SET_GEN_3A  = 1,
-	SCARLETT2_CONFIG_SET_GEN_3B  = 2,
-	SCARLETT2_CONFIG_SET_CLARETT = 3,
-	SCARLETT2_CONFIG_SET_COUNT   = 4
+	SCARLETT2_CONFIG_SET_GEN_2,
+	SCARLETT2_CONFIG_SET_GEN_3A,
+	SCARLETT2_CONFIG_SET_GEN_3B,
+	SCARLETT2_CONFIG_SET_CLARETT,
+	SCARLETT2_CONFIG_SET_COUNT
 };
 
 /* Hardware port types:
@@ -239,35 +239,35 @@ enum {
  * - PCM I/O
  */
 enum {
-	SCARLETT2_PORT_TYPE_NONE     = 0,
-	SCARLETT2_PORT_TYPE_ANALOGUE = 1,
-	SCARLETT2_PORT_TYPE_SPDIF    = 2,
-	SCARLETT2_PORT_TYPE_ADAT     = 3,
-	SCARLETT2_PORT_TYPE_MIX      = 4,
-	SCARLETT2_PORT_TYPE_PCM      = 5,
-	SCARLETT2_PORT_TYPE_COUNT    = 6,
+	SCARLETT2_PORT_TYPE_NONE,
+	SCARLETT2_PORT_TYPE_ANALOGUE,
+	SCARLETT2_PORT_TYPE_SPDIF,
+	SCARLETT2_PORT_TYPE_ADAT,
+	SCARLETT2_PORT_TYPE_MIX,
+	SCARLETT2_PORT_TYPE_PCM,
+	SCARLETT2_PORT_TYPE_COUNT
 };
 
 /* I/O count of each port type kept in struct scarlett2_ports */
 enum {
-	SCARLETT2_PORT_IN    = 0,
-	SCARLETT2_PORT_OUT   = 1,
-	SCARLETT2_PORT_DIRNS = 2,
+	SCARLETT2_PORT_IN,
+	SCARLETT2_PORT_OUT,
+	SCARLETT2_PORT_DIRNS
 };
 
 /* Dim/Mute buttons on the 18i20 */
 enum {
-	SCARLETT2_BUTTON_MUTE    = 0,
-	SCARLETT2_BUTTON_DIM     = 1,
-	SCARLETT2_DIM_MUTE_COUNT = 2,
+	SCARLETT2_BUTTON_MUTE,
+	SCARLETT2_BUTTON_DIM,
+	SCARLETT2_DIM_MUTE_COUNT
 };
 
 /* Flash Write State */
 enum {
-	SCARLETT2_FLASH_WRITE_STATE_IDLE = 0,
-	SCARLETT2_FLASH_WRITE_STATE_SELECTED = 1,
-	SCARLETT2_FLASH_WRITE_STATE_ERASING = 2,
-	SCARLETT2_FLASH_WRITE_STATE_WRITE = 3
+	SCARLETT2_FLASH_WRITE_STATE_IDLE,
+	SCARLETT2_FLASH_WRITE_STATE_SELECTED,
+	SCARLETT2_FLASH_WRITE_STATE_ERASING,
+	SCARLETT2_FLASH_WRITE_STATE_WRITE
 };
 
 static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
@@ -1211,22 +1211,22 @@ struct scarlett2_usb_volume_status {
 
 /* Configuration parameters that can be read and written */
 enum {
-	SCARLETT2_CONFIG_DIM_MUTE = 0,
-	SCARLETT2_CONFIG_LINE_OUT_VOLUME = 1,
-	SCARLETT2_CONFIG_MUTE_SWITCH = 2,
-	SCARLETT2_CONFIG_SW_HW_SWITCH = 3,
-	SCARLETT2_CONFIG_LEVEL_SWITCH = 4,
-	SCARLETT2_CONFIG_PAD_SWITCH = 5,
-	SCARLETT2_CONFIG_MSD_SWITCH = 6,
-	SCARLETT2_CONFIG_AIR_SWITCH = 7,
-	SCARLETT2_CONFIG_STANDALONE_SWITCH = 8,
-	SCARLETT2_CONFIG_PHANTOM_SWITCH = 9,
-	SCARLETT2_CONFIG_PHANTOM_PERSISTENCE = 10,
-	SCARLETT2_CONFIG_DIRECT_MONITOR = 11,
-	SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH = 12,
-	SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE = 13,
-	SCARLETT2_CONFIG_TALKBACK_MAP = 14,
-	SCARLETT2_CONFIG_COUNT = 15
+	SCARLETT2_CONFIG_DIM_MUTE,
+	SCARLETT2_CONFIG_LINE_OUT_VOLUME,
+	SCARLETT2_CONFIG_MUTE_SWITCH,
+	SCARLETT2_CONFIG_SW_HW_SWITCH,
+	SCARLETT2_CONFIG_LEVEL_SWITCH,
+	SCARLETT2_CONFIG_PAD_SWITCH,
+	SCARLETT2_CONFIG_MSD_SWITCH,
+	SCARLETT2_CONFIG_AIR_SWITCH,
+	SCARLETT2_CONFIG_STANDALONE_SWITCH,
+	SCARLETT2_CONFIG_PHANTOM_SWITCH,
+	SCARLETT2_CONFIG_PHANTOM_PERSISTENCE,
+	SCARLETT2_CONFIG_DIRECT_MONITOR,
+	SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH,
+	SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE,
+	SCARLETT2_CONFIG_TALKBACK_MAP,
+	SCARLETT2_CONFIG_COUNT
 };
 
 /* Location, size, and activation command number for the configuration
-- 
2.43.0

