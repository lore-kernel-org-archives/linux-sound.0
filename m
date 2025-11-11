Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D0863CB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 22:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762901262; cv=none; b=iiwXzJ5+YfOLyWSdsr9DKdgLT0RpxGEY0NbXuWGGjibilsfQZ++zbByZyAKOYdjnkertCva/gGzKPo9WzY/vNeA4MQax2X8iJnt5wN0FoAnByJVbbEHR/BhtQcWAm6XMEbOqq1zRfPGVdRTBPvEn2cDlwWYkO+s3HABd7nDcqgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762901262; c=relaxed/simple;
	bh=T1zlvBTizWWLx1b9NGa0sy+D18UfFqWTOzQfia8zTBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r2yq8pOd0tfr55OHSCSGajS9Zt60xG+/ls5VnxZUaHICH4FK3aLJhZTrfJ5GLifCndqHfSXLaMLrF7QcHaUaMtTX+mJ82Rz99YGDkVeAbcbs6cIiYqGZOHnRDGjhAxzjyZwruyRTJhzSqyIaqkcDZGfyh/ZwuHh/QVCdhfFkmHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P2kIxoEu; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="P2kIxoEu"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762901249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yjptLzCE3l7Flv0vKYe34mrtiOciiauwKDvgQUUWCqU=;
	b=P2kIxoEuLTUjpF5TwR+N8EYrXHN7JFtRLzY1fH0fhQ4mCdKdY9AfQicuY7FFDvyHVfK0yr
	bGPfi5azs0qhQEkFLZ9YSfh9c/54QmCtMwIaXdVV6q49eTdZ6SQOtlrOJNhVCS6Q0VKW/7
	oDN2+IpDV/WK1Xv//2C7Ky/eTvBuBIs=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: Intel: atom: Replace deprecated strcpy in sst_slot_enum_info
Date: Tue, 11 Nov 2025 23:47:01 +0100
Message-ID: <20251111224706.87508-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() is deprecated; use the safer strscpy() instead.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/intel/atom/sst-atom-controls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 38116c758717..799d4f0881e3 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -142,7 +142,7 @@ static int sst_slot_enum_info(struct snd_kcontrol *kcontrol,
 
 	if (uinfo->value.enumerated.item > e->max - 1)
 		uinfo->value.enumerated.item = e->max - 1;
-	strcpy(uinfo->value.enumerated.name,
+	strscpy(uinfo->value.enumerated.name,
 		e->texts[uinfo->value.enumerated.item]);
 
 	return 0;
-- 
2.51.1

