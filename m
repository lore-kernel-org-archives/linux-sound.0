Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C3F23BCF9
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 19:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744058; cv=none; b=m+j/0djlxl7CL142Bf3Cc3UnZIjSzhOge24unggLTcFr5qFv434JvfxfYf7aHGBe1P09EpRQvBoVH8lggu7S80N/UK85+0EoNIax2yRBXdkOwf4qtMpdUuhMRjPW0P0pCPYO3SVqmz6AEtdj46Te0miEsw5gmWh1xVz7DbXTX+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744058; c=relaxed/simple;
	bh=xwMK8QyGiYWdlSGndRU9ESOBL6yRiLIwFrZH68IU7eM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SkfaiOL3C9DNXCaKEcu2UIu+KTjQuZknprCPHAji5FC+e0mcuAdpOTAuQ8MITuuVuNi4GFA+8fTNddiMdp06w6f1633K8e//l81rrevk8a/BK3TXW7urkk6cM/apxmMO0OD6mtDocdhM7qeU9lUJamGP5cK7Rr6pDgAnLrFRZ80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from localhost.localdomain (213.87.148.135) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 15 Apr
 2025 22:07:21 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@omp.ru>, <lvc-project@linuxtesting.org>
Subject: [PATCH 1/3] ASoC: dapm: make dapm_update_dai_chan() *void*
Date: Tue, 15 Apr 2025 22:06:43 +0300
Message-ID: <20250415190647.17603-2-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415190647.17603-1-s.shtylyov@omp.ru>
References: <20250415190647.17603-1-s.shtylyov@omp.ru>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 04/15/2025 18:54:56
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 192656 [Apr 15 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 54 0.3.54
 464169e973265e881193cca5ab7aa5055e5b7016
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.148.135 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.148.135 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.148.135
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/15/2025 18:56:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 4/15/2025 4:10:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

dapm_update_dai_chan() always returns 0, so checking/propagating its result
in dapm_update_dai_unlocked() seems rather pointless. Remove the checks and
make dapm_update_dai_chan() *void* instead of *int*.

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 sound/soc/soc-dapm.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b7818388984e..2df199f6af74 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2712,16 +2712,16 @@ int snd_soc_dapm_sync(struct snd_soc_dapm_context *dapm)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_sync);
 
-static int dapm_update_dai_chan(struct snd_soc_dapm_path *p,
-				struct snd_soc_dapm_widget *w,
-				int channels)
+static void dapm_update_dai_chan(struct snd_soc_dapm_path *p,
+				 struct snd_soc_dapm_widget *w,
+				 int channels)
 {
 	switch (w->id) {
 	case snd_soc_dapm_aif_out:
 	case snd_soc_dapm_aif_in:
 		break;
 	default:
-		return 0;
+		return;
 	}
 
 	dev_dbg(w->dapm->dev, "%s DAI route %s -> %s\n",
@@ -2732,8 +2732,6 @@ static int dapm_update_dai_chan(struct snd_soc_dapm_path *p,
 		soc_dapm_connect_path(p, true, "dai update");
 	else
 		soc_dapm_connect_path(p, false, "dai update");
-
-	return 0;
 }
 
 static int dapm_update_dai_unlocked(struct snd_pcm_substream *substream,
@@ -2744,7 +2742,6 @@ static int dapm_update_dai_unlocked(struct snd_pcm_substream *substream,
 	int channels = params_channels(params);
 	struct snd_soc_dapm_path *p;
 	struct snd_soc_dapm_widget *w;
-	int ret;
 
 	w = snd_soc_dai_get_widget(dai, dir);
 
@@ -2753,17 +2750,11 @@ static int dapm_update_dai_unlocked(struct snd_pcm_substream *substream,
 
 	dev_dbg(dai->dev, "Update DAI routes for %s %s\n", dai->name, snd_pcm_direction_name(dir));
 
-	snd_soc_dapm_widget_for_each_sink_path(w, p) {
-		ret = dapm_update_dai_chan(p, p->sink, channels);
-		if (ret < 0)
-			return ret;
-	}
+	snd_soc_dapm_widget_for_each_sink_path(w, p)
+		dapm_update_dai_chan(p, p->sink, channels);
 
-	snd_soc_dapm_widget_for_each_source_path(w, p) {
-		ret = dapm_update_dai_chan(p, p->source, channels);
-		if (ret < 0)
-			return ret;
-	}
+	snd_soc_dapm_widget_for_each_source_path(w, p)
+		dapm_update_dai_chan(p, p->source, channels);
 
 	return 0;
 }
-- 
2.49.0

