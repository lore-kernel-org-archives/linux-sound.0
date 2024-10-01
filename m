Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762631BC062
	for <linux-sound@vger.kernel.org>; Tue,  1 Oct 2024 06:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727763475; cv=none; b=TAWOCf0eb8p9i0yV7TjSv1WvTxyoICAJH0J5IhWd3WGasv2jtfVFjsVysZFhJn2MJIG3tQ3oi0KFgg48Hrt7F/owWcsZKeh+arOOu2cJSv501gspzu6l+4KTH2MpD4iKksfJV7nchLsNiMsRsDWT25LL5pISAt5usmBq3rO5qqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727763475; c=relaxed/simple;
	bh=/vvxG2YZ060PWqdmjDjmFRWeluG8w2wXG/qW43atsMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jCVBeyH43bjsgWAIR+wCfj/dn7ASeRk+URAWZSfEBkrotJAfZ+3/prv3VcUZJ+Qqm8Ur5Fvp3qGynVwTaPTFdaxwiSHXyKhTofs3eVOI09gCHoJoR/HHAVplUZgriK1K2Qm0+E9DxQhPxsCHHX4Dx5iF6qgSgBa1HCkEzTKHuT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2uuJK3T; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2uuJK3T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727763473; x=1759299473;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/vvxG2YZ060PWqdmjDjmFRWeluG8w2wXG/qW43atsMk=;
  b=j2uuJK3TgcWOcNgEOl+niQDURZCYjd9WpW6MQHcuHgLLJvIbjpMRolmX
   FUn+lc3X0VYTRZxz2YPt+oJjhQgTt7w2oQPGApMWYzW6NUZwf9ukJ7WM3
   O7rTNpEbJHqaLD/dKxQSYYiy7jt6jBp/2DoAnioqHk0QLKoFzJFfW+V6M
   tGcAW//rQqdaGZAdlP/6cBwx/dlcT99RnfK7Eme6P/j9md49Ch9BinSM7
   vIK5AabyfswrUO5a7qGeKHesqUmEi1NHge/ool9yGtyAy9Vp1QuwcgSGu
   lYkV6lgyoj3SZSFBuDGoNk0vUby0vWChUSVQKC3UMQbTbOwQF5kHdmCIU
   w==;
X-CSE-ConnectionGUID: 0F0KEhXySP634G/8rhGEpw==
X-CSE-MsgGUID: WwJXWqfoRJCm8XS1fi+L4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30762014"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="30762014"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 23:17:53 -0700
X-CSE-ConnectionGUID: fjHUC8Q9TliBAy31MDCL0g==
X-CSE-MsgGUID: bnSlixAYTmW4SLHIk8Msbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73509312"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.243])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 23:17:51 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/2] ASoC: Intel: soc-acpi-intel-rpl-match: add missing empty item
Date: Tue,  1 Oct 2024 14:17:37 +0800
Message-ID: <20241001061738.34854-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001061738.34854-1-yung-chuan.liao@linux.intel.com>
References: <20241001061738.34854-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is no links_num in struct snd_soc_acpi_mach {}, and we test
!link->num_adr as a condition to end the loop in hda_sdw_machine_select().
So an empty item in struct snd_soc_acpi_link_adr array is required.

Fixes: 65ab45b90656 ("ASoC: Intel: soc-acpi: Add match entries for some cs42l43 laptops")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index bc8817633b81..b83ac2e6337c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -198,6 +198,7 @@ static const struct snd_soc_acpi_link_adr rpl_cs42l43_l0[] = {
 		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
 		.adr_d = cs42l43_0_adr,
 	},
+	{}
 };
 
 static const struct snd_soc_acpi_link_adr rpl_sdca_3_in_1[] = {
-- 
2.43.0

