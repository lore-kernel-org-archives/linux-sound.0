Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6941423BCE3
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 19:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744047; cv=none; b=mNhyjaFBK9IAjkuAXvsK89fmrOwBrKj7IqnqFUX+GlMjBPTou4Kv0vqTDWzHEvFmO1NaP2Bv75KA5MH9PDdtApxJ4FYUydBVgyEIegzDLzt2f1VlobCtpb0G9BSYgJlvBhqHTs2rxyOkI7uDPDULPtn0eVOIRGtBjbaN9E8dKqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744047; c=relaxed/simple;
	bh=VV7gT7CUvv+RZs7n7H1e2uq3ft75BmCRoGoo++NfWuI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FlFd8jgErXIacufHwRAV6xtkFm2VkR3/OKZFV73E6jDucvj9VmH6SzCEHvnYDr7s7vyxjnuPnLrVvhXSmCqsKK62wLQoHxoTuNL/hy0r6bpbB0skpY7FMQOR+r2FXf81k1mkKn+nxXaj1Xl1IxQOmz0K3k+wJMV3Mz+bbTEVhNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from localhost.localdomain (213.87.148.135) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 15 Apr
 2025 22:07:04 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@omp.ru>, <lvc-project@linuxtesting.org>
Subject: [PATCH 0/3] ASoC: make some DAPM functions *void* instead of *int*
Date: Tue, 15 Apr 2025 22:06:42 +0300
Message-ID: <20250415190647.17603-1-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.49.0
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

First, we had 2 complaints from Svace (static analysis tool) about the
*if* statement conditions inside the loops in dapm_update_dai_unlocked()
always being false -- because dapm_update_dai_chan() (called from there)
only ever returned 0. After removing those *if* statements, in its turn,
dapm_update_dai_unlocked() also started to only return 0, so there was
no sense anymore to propagate its result from snd_soc_dapm_update_dai();
after removing now useless local variable from that function, there was
no sense anymore to return an *int* result (and the function's callers
do ignore its result anyway)...

The patches are against the for-next branch of Mark Brown's sound.git repo.

Sergey Shtylyov (3):
  ASoC: dapm: make dapm_update_dai_chan() *void*
  ASoC: dapm: make dapm_update_dai_unlocked() *void*
  ASoC: dapm: make snd_soc_dapm_update_dai() *void*

 include/sound/soc-dapm.h |  4 ++--
 sound/soc/soc-dapm.c     | 46 ++++++++++++++--------------------------
 2 files changed, 18 insertions(+), 32 deletions(-)

-- 
2.49.0
