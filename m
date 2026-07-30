Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035DA3C379F
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416127; cv=none; b=YDQ63yJDCctGkrGCiQPxZ3jRUj1eKnA4sf//aCOBwZ9+bhqtOFuU+3Njhsf/WrKFQLbF2HGaC9UrGXlwYNMqBJ6vDybCS2rgDFKCftXqlGClx/NFEzkVwd7FHrCQe/xITfJ9gXwnvLQ06bvyrB1iZV7N3C+qdcQww/IZPxV1hVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416127; c=relaxed/simple;
	bh=a3qUt2WrCGfYf/wfZG1y7SAHoPqF3BIHqYVl4NoCUT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=axsKkFTl1+O7uoYbfE627OhmGaZ0rhj5wf8Y5t3SW+kWGe/nzFxiEkt/qcDmOrtA2krxARGxvbtkXOkxf7lTour0lLdWSrVFxGKUAkEVQvUDeMJBPS86YYX6IsHgDlYEuzpZHNhh7vl9icTs+qJdO76pzHr0G3TZb7APxr/+QVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5yIoe+J; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5yIoe+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785416126; x=1816952126;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a3qUt2WrCGfYf/wfZG1y7SAHoPqF3BIHqYVl4NoCUT8=;
  b=b5yIoe+JLywU5lAFZLSmSOKpvTBNQyr7uvabDrq+Zw9iN/QtVjbo5FDG
   gElWOjc+7QbXLofssFgkwoWolIuNn2oOMRvxMUJ6xYEhrHAnI9jaKCGjE
   I6AG35neQs3RXiNxrKFUiGWFvCDJX0na0XtbsNznDSPVVeJiuUYcLydm3
   ZF+552o/ZX2JiohPD+LWc2tD6GRE+qcrIjAadOAkQaujo05/EcNSKbXyX
   S50Sp+OY0yr615QfRIimWr6KAA2n2y/6DX5lXkd5wAj4nDNoRQGyUYSRO
   KV+7Xcd6ZWL/BF8TfWnwiYbio0BICaQ1mFI8ICjM9oeMoATnz2yoC1WvT
   Q==;
X-CSE-ConnectionGUID: 2kOCtCwSTJScychthtK0tA==
X-CSE-MsgGUID: TepFkZuuTxGwTUcvMS8eMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86049425"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="86049425"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:55:26 -0700
X-CSE-ConnectionGUID: GosvunivQAytYDWvb1nTLw==
X-CSE-MsgGUID: CMXVkh8nQo6csr0UEqUbUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="284872225"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:55:23 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	yung-chuan.liao@linux.intel.com,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH] ASoC: dapm: Add encoder and decoder widget types to kcontrol handling
Date: Thu, 30 Jul 2026 15:56:00 +0300
Message-ID: <20260730125600.6491-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>

This patch fixes the issue where encoder or decoder widget
types are assigned kcontrols in a topology but get ignored.
The controls were parsed successfully but were not registered
as ALSA kcontrols.

In dapm_create_or_share_kcontrol() the snd_soc_dapm_encoder
and the snd_soc_dapm_decoder are added to the switch statement
to be handled similarly as e.g. the snd_soc_dapm_effect for
assigning a proper long control name.

In dapm_widget_show_component() the snd_soc_dapm_encoder and
the snd_soc_dapm_decoder are added to switch statement to let
them to be shown in the debugfs power state output.

In snd_soc_dapm_new_widgets() the  snd_soc_dapm_encoder and the
snd_soc_dapm_decoder are added to same switch case handling as
e.g. snd_soc_dapm_effect to be registered with dapm_new_pga().
The previous operation with default in the switch statement
silently ignored them. Note: Despite the function name, the
dapm_new_pga() is generic utility that calls
dapm_create_or_share_kcontrol() for each kcontrol of the widget.

Signed-off-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/soc-dapm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 4ad126bd4f70..c98e917cc911 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1203,6 +1203,8 @@ static int dapm_create_or_share_kcontrol(struct snd_soc_dapm_widget *w,
 			case snd_soc_dapm_pga:
 			case snd_soc_dapm_effect:
 			case snd_soc_dapm_out_drv:
+			case snd_soc_dapm_encoder:
+			case snd_soc_dapm_decoder:
 				wname_in_long_name = true;
 				kcname_in_long_name = true;
 				break;
@@ -2785,6 +2787,8 @@ static ssize_t dapm_widget_show_component(struct snd_soc_component *component,
 		case snd_soc_dapm_pga:
 		case snd_soc_dapm_effect:
 		case snd_soc_dapm_out_drv:
+		case snd_soc_dapm_encoder:
+		case snd_soc_dapm_decoder:
 		case snd_soc_dapm_mixer:
 		case snd_soc_dapm_mixer_named_ctl:
 		case snd_soc_dapm_supply:
@@ -3367,6 +3371,8 @@ int snd_soc_dapm_new_widgets(struct snd_soc_card *card)
 		case snd_soc_dapm_pga:
 		case snd_soc_dapm_effect:
 		case snd_soc_dapm_out_drv:
+		case snd_soc_dapm_encoder:
+		case snd_soc_dapm_decoder:
 			dapm_new_pga(w);
 			break;
 		case snd_soc_dapm_dai_link:
-- 
2.55.0

