Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486365588F
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 03:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738639906; cv=none; b=U+1QHh64tBX5NqjbMSDk9jgF30T3VykSLKsrrb5wo5JvQ9O7T25/yzwBffoCU5VBZcXiKdc9xfK9WKXiC2yFZ6sdXNwBzqWogfDvpUYHOw446HHC4zClPnVyaEWaYeNGQQFexvBfWCGVvbyRqSp14+3S4K1NBlOWfgavouzEUmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738639906; c=relaxed/simple;
	bh=jo+sOGetrVuH4y28B5sYwREIybjRenySn+BPk08QxUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RhezRPlYSOB+8L3vhiQVOazQ77IAaWUq4196rB4yulFqLbTM22EJlRiA//xHlngzNhzBkdel5r+rTc7OCldoxdPGcbzt2SU9Gw2IU317AlLDXje7llxyWcp+t7WtoMyq47KTEFefJqr4VBBK47+vokV37C+bfUHHNIp/XsSTTvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGdxf3lk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGdxf3lk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738639905; x=1770175905;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jo+sOGetrVuH4y28B5sYwREIybjRenySn+BPk08QxUE=;
  b=GGdxf3lk/igI8ZkVpXCqUAzr1nsAN+/MC3JXLgjXNEUggnH62Z3BB+gD
   loh/FcIHB88VVvpyn+xw5CzlTiTRFkFRbNTr4pkmMqUR1ueGyBiCSMknF
   s3UuiX885QDLLnZbrMzdaHeLOlK1YJzXXQFqPNjrFsU9Um3YfbN0i0Wkz
   OIgs2OEv1annXBcKwij1DUmOeuz+MICTjsFv5ZNZ7ETAvgTwjrw+bgOF5
   PfGPwKiLQO1YB1KqPfvl/HiwzhWqLJk2c852EwDd3JhESv49gXYH4anjy
   n0YFeNj+CAPJoodTX4tNZswsshq4klUbAzGebY4+n3W/+zmZjan9OLpJ7
   Q==;
X-CSE-ConnectionGUID: EM7EdT3/Sfa6q0fTe41h3A==
X-CSE-MsgGUID: l7cqBgl6R9iNZfp9t8TXbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39046980"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="39046980"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 19:31:44 -0800
X-CSE-ConnectionGUID: OIzL+vdaRSmdhEx9asNsbA==
X-CSE-MsgGUID: 7+TAJ+BSSaCQf4zDQUnqcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147672038"
Received: from iweiny-desk3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.111])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 19:31:43 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/2] ASoC: Intel: soc-acpi-intel-tgl-match: declare adr as ull
Date: Tue,  4 Feb 2025 11:31:33 +0800
Message-ID: <20250204033134.92332-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204033134.92332-1-yung-chuan.liao@linux.intel.com>
References: <20250204033134.92332-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The adr is u64.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 .../soc/intel/common/soc-acpi-intel-tgl-match.c  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 6f8c06413665..b77aafb0bfb6 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -658,25 +658,25 @@ static const struct snd_soc_acpi_endpoint cs35l56_7_fb_endpoints[] = {
 
 static const struct snd_soc_acpi_adr_device cs35l56_sdw_eight_1_4_fb_adr[] = {
 	{
-		.adr = 0x00003301fa355601,
+		.adr = 0x00003301fa355601ull,
 		.num_endpoints = ARRAY_SIZE(cs35l56_l_fb_endpoints),
 		.endpoints = cs35l56_l_fb_endpoints,
 		.name_prefix = "AMP1"
 	},
 	{
-		.adr = 0x00003201fa355601,
+		.adr = 0x00003201fa355601ull,
 		.num_endpoints = ARRAY_SIZE(cs35l56_2_fb_endpoints),
 		.endpoints = cs35l56_2_fb_endpoints,
 		.name_prefix = "AMP2"
 	},
 	{
-		.adr = 0x00003101fa355601,
+		.adr = 0x00003101fa355601ull,
 		.num_endpoints = ARRAY_SIZE(cs35l56_4_fb_endpoints),
 		.endpoints = cs35l56_4_fb_endpoints,
 		.name_prefix = "AMP3"
 	},
 	{
-		.adr = 0x00003001fa355601,
+		.adr = 0x00003001fa355601ull,
 		.num_endpoints = ARRAY_SIZE(cs35l56_6_fb_endpoints),
 		.endpoints = cs35l56_6_fb_endpoints,
 		.name_prefix = "AMP4"
@@ -685,25 +685,25 @@ static const struct snd_soc_acpi_adr_device cs35l56_sdw_eight_1_4_fb_adr[] = {
 
 static const struct snd_soc_acpi_adr_device cs35l56_sdw_eight_5_8_fb_adr[] = {
 	{
-		.adr = 0x00013701fa355601,
+		.adr = 0x00013701fa355601ull,
 		.num_endpoints = ARRAY_SIZE(cs35l56_r_fb_endpoints),
 		.endpoints = cs35l56_r_fb_endpoints,
 		.name_prefix = "AMP8"
 	},
 	{
-		.adr = 0x00013601fa355601,
+		.adr = 0x00013601fa355601ull,
 		.num_endpoints = ARRAY_SIZE(cs35l56_3_fb_endpoints),
 		.endpoints = cs35l56_3_fb_endpoints,
 		.name_prefix = "AMP7"
 	},
 	{
-		.adr = 0x00013501fa355601,
+		.adr = 0x00013501fa355601ull,
 		.num_endpoints = ARRAY_SIZE(cs35l56_5_fb_endpoints),
 		.endpoints = cs35l56_5_fb_endpoints,
 		.name_prefix = "AMP6"
 	},
 	{
-		.adr = 0x00013401fa355601,
+		.adr = 0x00013401fa355601ull,
 		.num_endpoints = ARRAY_SIZE(cs35l56_7_fb_endpoints),
 		.endpoints = cs35l56_7_fb_endpoints,
 		.name_prefix = "AMP5"
-- 
2.43.0

