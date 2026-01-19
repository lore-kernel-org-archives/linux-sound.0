Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74918354AF9
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768814287; cv=none; b=j4kCbh7EJaW2zgCFRw+ermk2+ueCHEVBcROX9INmBYfLqsq/KRfm9GnZH86+Xl//kUM15dZmefvFdC2TbjzPoYIFZCzoBQO3sYJmqEZ3SpSBRt3rOJEjw86TQXnD4fUEcp5R903U7IoiR676IBEIEFIyMEBpYBe0923IZkolYCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768814287; c=relaxed/simple;
	bh=7nTqpXM+iagsY9NEDQZyCkO31fByG8t/G/qSCDgZ4Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMENDqoSyd82gu3WM7d1+MbUfpLGfYuKmSFS4vnxsIgaV5xwEpqR4riaFxMrRJmkQGbHi+Baemc+z/NkVgpxpT/SLVpg3uof/izw0GslX2EVR6JxSxRsEfygb3QnHwywMwlqvCw+NEw4wGIItioRy/BBYdZ+t/ZDRovufb55Y8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jnCkx+RO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnCkx+RO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768814286; x=1800350286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7nTqpXM+iagsY9NEDQZyCkO31fByG8t/G/qSCDgZ4Eo=;
  b=jnCkx+RO4WFnARLlV+Fn3fgum4nkMfTQFY14ZZacR8sJAgY/aeeV9adu
   DFCeIfMOxDvgrH8e4eUwjLkEF9UMzmHZsfeIT+bbi/py7mRp3grPvg+Bn
   BwREnLHwT/HCPxCt/X4gT46cwV/M6+PBXVoVJwgEHSSeYEQ8hT8qUJkg1
   o1drWq55OEokyOCqVByIf8YZUhJCviuxHaYHWpQvuRtebRviPbBRbR7b2
   GRGdWbmgal0VI4JebWo+NH/f0lJnVr8MLyCfU8NSrYk6odsXn76GshrYs
   q2BxmkRkmQ0nEbBcNGgltA9iL9wjYH4E9I4XaVIL5rNl69+1EVxeHmSgu
   Q==;
X-CSE-ConnectionGUID: h/90gTPYR2Wa5A8jb3scGw==
X-CSE-MsgGUID: 2WgWqo9sQu6K8cf8B4BGiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="72613233"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="72613233"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:18:06 -0800
X-CSE-ConnectionGUID: ClNSR0h3QiO+IwxJ3sq3SA==
X-CSE-MsgGUID: CzEiFdeaTjaorpKDMQgwZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="209958972"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:18:04 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/2] ASoC: soc-acpi-intel-ptl-match: use aggregated endpoint in ptl_rt722_l0_rt1320_l23
Date: Mon, 19 Jan 2026 17:17:49 +0800
Message-ID: <20260119091749.1752088-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119091749.1752088-1-yung-chuan.liao@linux.intel.com>
References: <20260119091749.1752088-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rt722 amp and rt1320 amps are aggregated in this case.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 060955825fe0..9e3c459d22e6 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -383,6 +383,15 @@ static const struct snd_soc_acpi_link_adr ptl_rt721_l3[] = {
 	{},
 };
 
+static const struct snd_soc_acpi_adr_device rt722_0_agg_adr[] = {
+	{
+		.adr = 0x000030025d072201ull,
+		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints),
+		.endpoints = jack_amp_g1_dmic_endpoints,
+		.name_prefix = "rt722"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
 	{
 		.adr = 0x000030025d072201ull,
@@ -536,8 +545,8 @@ static const struct snd_soc_acpi_link_adr ptl_rt722_l3[] = {
 static const struct snd_soc_acpi_link_adr ptl_rt722_l0_rt1320_l23[] = {
 	{
 		.mask = BIT(0),
-		.num_adr = ARRAY_SIZE(rt722_0_single_adr),
-		.adr_d = rt722_0_single_adr,
+		.num_adr = ARRAY_SIZE(rt722_0_agg_adr),
+		.adr_d = rt722_0_agg_adr,
 	},
 	{
 		.mask = BIT(2),
-- 
2.43.0

