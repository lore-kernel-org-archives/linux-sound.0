Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C771836B90E
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 04:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411167; cv=none; b=NOo0oPaXx2O5GCSPZsB7UXGEISj6b+mErN5Rn58LvbQPbnnVKxEI9XWjXDa0G3qhlCT6+Q8IqPnvKYcJtzyZfiTso0fsmXoug151bpcU60GeDWCBwBygRZuGXHhkoJM1geSj0ZvRo/nCkSWKkcZdMFmC9Bt1RT71L7pjCdb6lEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411167; c=relaxed/simple;
	bh=vhEaF87AcNPn5EcwQC99wiliM8yH41LnFNW22mPSM4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ETcA78/HPFX3THUkVQSvYzvrDzuh8La6s0Q/2v70DTk6nMcCfBE5AkOS7sg0eo/xZwDAyfzrJxvvZT9TZ3mRopQ/GI5LoVZJFnoobOJzM87kwPwiLC9hxsuP0/mB5nn0lxylLp3Oo9RSqjmiYlV/Z/+zP9vFPvHljZBOS6Rt6bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5ltLkVG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5ltLkVG"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceab75934dso24929675ad.2
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 21:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411165; x=1789015965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ESwlNjvZs7Wa/B2Z+WZbhnploP2cGr2N9OS4nSRjKU8=;
        b=S5ltLkVGU2kf2W9O82BIAGg8u7beRvf29uMBdAtbL3s0ny7Lf8oSW0by/PDDQJe815
         GLY4ax7C7HzDFmqzDCRb5Trt7JHmEayWb0P9Lh1nhbnQAU/rCdpZvIUuRzyP0XavT3Fj
         CUbCbbbzNkuwXHDKxB1u6JEwdqYVRMhzezGHoup+V4HPSVPRytUYxd3UTunnyWYXvKaX
         o/vNS3sajQq6wFaSyRaDNARbGfWAV+nInmstG1ETbroQ3qm8ajp0NVLTz9wofEnfejFY
         meUAER4C/eraCKGhMUgvGedwMiFrfykmwAEgxdLvEQVobd2yJUXVe9ACR58l35tStdDf
         xVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411165; x=1789015965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESwlNjvZs7Wa/B2Z+WZbhnploP2cGr2N9OS4nSRjKU8=;
        b=s3XX74UGLoKpAcQgfuXmnRTgQLkCBoU866cnl/lNLNxfrC7L1Wfr4UA+7bcnAxzqgS
         MtjWcWToBrJiWWUUsZBiWCNhGiMvineewyX08xlBk697otngTKkSvVIe/e7rz8hp6fbB
         YLVIFHjjHGJLNIxZEMzwFxupTTNlZrnuWLLKFm6xk4CcDVighRPRuJO8JNcRVZffog0C
         OOlyqBwO0HngZWSmqG6Fc513M844XpgrXwLM+VFZbpDJNzEpRF64ax41kcoo2WnSRo0n
         uxHwxiOPsevPEFMBvyUdWIRL7wdye1+jhomUynzoLApNvkKyV3/grLYaMyOA+hd1PC23
         LHog==
X-Forwarded-Encrypted: i=1; AKwUvBwM4oQhknaCR+m9+YLGXNxQX3asZ9P8b+TdMbMhgiwap68gPYrT+/61aWINK6WMrnI19Z47yZlYgxIaXQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lbzMiVpNKf1wzVfIFOFTm+vLOSedcro7HG5/bTaAYlpKALCbyS
	nlrGsEZnnCcUKP/9Ez1p7KqlkT8C/ClUpuDBV7BnWXiufQaImywjLbfK
X-Gm-Gg: AYBFou0qD2uNAWV0BeB3/Ab8dp6OokY/aqmR4nodA4Ost/tSYgtOaBj+bVAcp2d0ziv
	8fgfoPspSZSJCnvRrAgUMEkaH/kG7/V0Nagz49oGN7zltrGXTeWKcT1EF57j1z988IMhhK+fnnW
	a25/BnqX9sBmEVaagkU2hNlv84RPZ++2Hx5nGJvyU41l41usAFHQLsWJU2lnUipImEUOptBh5I1
	cxPkY/I4EIy54+SAfwJ4i8rLOm6UpI5xL2bSgqQWlRj3xHBto4UgdScmlNyBOnil6vkTnMCA8aN
	iyv9Wro0bpeKBBrKW2r5a68M4suAZhxEytG+AsKyL23oefs8kxnAuxCBueZW72w923tJ0mvqyKU
	9J8Q7guL4dZtHxJwnMnOrvoTnA4Tl4WgI4ePVG9qvEFIUCWY+A0K2wwNQAUt/bCL9ptwPLYj71T
	CnDyPkQBP2e9P7WY7dmNWW+5joiyDRAROIma7hk2OwcUGDcQtVrqiGgTMva/uOuqev/sbFwmTJh
	BSS0gET/GAVExSrRrCRmZaB/lXnm2/pMRfOKH913eNdoXaaHdBe/bzXP6ODsVLlQuxIRNvCUrmX
	RGbm
X-Received: by 2002:a17:90b:17cd:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39aededf539mr13392201a91.6.1788411165011;
        Wed, 02 Sep 2026 21:52:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:52:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 0/5] ASoC: mediatek: mt8183: Fix clock error handling
Date: Thu,  3 Sep 2026 11:51:58 +0700
Message-ID: <20260903045203.175337-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes and cleans up clock error handling in the MT8183 ASoC 
driver.

Compile tested only.

Link v2:
https://lore.kernel.org/all/20260821122928.41343-1-phucduc.bui@gmail.com/

Link v3:
https://lore.kernel.org/all/20260828050526.590761-1-phucduc.bui@gmail.com/

Changes in v2:
 - Remove the redundant error log for apll1_mux_setting error handling.
 - Add Fixes tags.
 - Add a cover letter.
Changes in v3:
 - Add a patch to fix clock handling in the mux disable path, 
   as suggested by Cezary. 
 - Return directly from apllx_mux_setting() instead of using a goto label, 
   as suggested by Cezary.
 - Add a Reviewed-by tag.
Changes in v4:
 - Add a Reviewed-by tag from Cezary.
 - In the mux disable path, remove the goto labels so that all teardown 
   steps are attempted and any errors are only reported.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent()
    failure
  ASoC: mediatek: mt8183: Fix clock handling in mux disable path
  ASoC: mediatek: mt8183: Fix APLL enable error handling
  ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
  ASoC: mediatek: mt8183: Drop redundant probe error messages

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 31 +++++++++++-----------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c |  8 ++----
 2 files changed, 17 insertions(+), 22 deletions(-)

-- 
2.43.0

