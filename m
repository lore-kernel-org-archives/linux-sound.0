Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095D723BCF1
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 19:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744063; cv=none; b=MrMfNtTVAh0V25JAkn0NQ/KV4FLwa3E7NS77eybX9+LV5jhCCZMNWWmNo1PZb1FO0f/HmSC62NoSlWAblaLTGzOkyoshcBYYErRjvgqEsYlh8MsTdh5J2n2VCg6KCglO0yD6n71a0km8X6luio3zrP9YBUfM6f5vcnkF29YSddI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744063; c=relaxed/simple;
	bh=SC4+hdyqf8TcMILGMNJKMrDbMlSMFBz3Q2qCbFha+2Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TVVXaVEmEwIfVWf41ByKr3/GLbJD+AaJOSChJCia8NQYo6pnyOFiNLBE+VX/Dw509ZbwJHWNmFS+Daj1kwNiIRyU2kwrD16KnRwuzZHeA9VFmU8WlRtaaRVaQmS4JFim4RRKsOuK369mhocP1UyqHNmQN1KYHmjlkqKL46DVeRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from localhost.localdomain (213.87.148.135) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 15 Apr
 2025 22:07:34 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@omp.ru>, <lvc-project@linuxtesting.org>
Subject: [PATCH 3/3] ASoC: dapm: make snd_soc_dapm_update_dai() *void*
Date: Tue, 15 Apr 2025 22:06:45 +0300
Message-ID: <20250415190647.17603-4-s.shtylyov@omp.ru>
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
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1
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

snd_soc_dapm_update_dai() always returns 0 and its callers ignore its
result anyway. Make snd_soc_dapm_update_dai() *void* instead of *int*.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 include/sound/soc-dapm.h | 4 ++--
 sound/soc/soc-dapm.c     | 8 +++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index af802ef536e7..db81fd633a7b 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -456,8 +456,8 @@ void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
 int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card);
 void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card);
 
-int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
-			    struct snd_pcm_hw_params *params, struct snd_soc_dai *dai);
+void snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params, struct snd_soc_dai *dai);
 int snd_soc_dapm_widget_name_cmp(struct snd_soc_dapm_widget *widget, const char *s);
 
 /* dapm path setup */
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index fe5d484d3a43..6a7dde6d284b 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2757,17 +2757,15 @@ static void dapm_update_dai_unlocked(struct snd_pcm_substream *substream,
 		dapm_update_dai_chan(p, p->source, channels);
 }
 
-int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
-			    struct snd_pcm_hw_params *params,
-			    struct snd_soc_dai *dai)
+void snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	snd_soc_dapm_mutex_lock(rtd->card);
 	dapm_update_dai_unlocked(substream, params, dai);
 	snd_soc_dapm_mutex_unlock(rtd->card);
-
-	return 0;
 }
 
 int snd_soc_dapm_widget_name_cmp(struct snd_soc_dapm_widget *widget, const char *s)
-- 
2.49.0

