Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1461DE8AB
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 07:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733471968; cv=none; b=EqCe4ap+U4mbmRZnxkjtm2Ytdg3iGxWn7bRP+rODdSWhjkxRO317jQe6Ro5mEytmGcKRNJTskWrU8PO9SYeUD48mNSfGf1/CF61BEhSsItSL46bbuVgCLHUkd6MSq0DOSUYtMcp02B5TNXw4fhb6ssDJ+GTt/x593J8CJl6qbnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733471968; c=relaxed/simple;
	bh=IUJBi6AIJlKpw4fH0P1/46hlM3D1HASLTE6dQADWyPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RlVt7LNZQCH6VJsEewPJUG2I1f1JKtR0Mm9d/ghUYpGMYcrD2WQJlW0PyrSjPL4h4Gefccxkw927eEgQJMM9sCySsmXroedlAMryHQco4phZCcrhu2fHTTgNaCD8yhAzxgvy6XTidIRKendlRwSTWA42MsdNUPeV5KS9udUzAjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5gZp3Ko; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5gZp3Ko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733471967; x=1765007967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IUJBi6AIJlKpw4fH0P1/46hlM3D1HASLTE6dQADWyPk=;
  b=b5gZp3KobjPTq6zuNy8IEbi75v/G08hKtPIH0DCt+EwSkMrXdVUgKnMq
   WSNUmh1Ul+IrB80foQw6HB2a2/PEvKlja5J/0tFoi7VLJ9ir4qh2P2/Qw
   6dRk1XJZHXBca7h4JG30v97COeiG2MAq4dGSB9nLhQfTdx3MsC16kIRFZ
   xJWYg0mmni/p2y87GKE0DMvu3YT8ZIEeBvI2IzkdwcMBFmjxnV9iVoq/y
   hGg2f8oALtJhSj9ybJdxhYojbzILWDWlhUMvR98t4n8PjDxBwf6CNBGTW
   Nko+wfxd0k9dUrqdw7kivMsX8OLf/6ZJeyfiWyzSyUjcPJsvE0IYiJwpR
   g==;
X-CSE-ConnectionGUID: cMAscQojSxOLJo0haYsWwQ==
X-CSE-MsgGUID: IAkWFt4EQBWbDcoA+xCKJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45192808"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="45192808"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:26 -0800
X-CSE-ConnectionGUID: IxbDSYNuT++zziWAZqvhZw==
X-CSE-MsgGUID: MuSB/EhjTiOrcBLU9w0t9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94144481"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.179])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:25 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 09/10] ASoC: Intel: soc-acpi: arl: Correct naming of a cs35l56 address struct
Date: Fri,  6 Dec 2024 15:59:02 +0800
Message-ID: <20241206075903.195730-10-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
References: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Simon Trimmer <simont@opensource.cirrus.com>

As there are many combinations these follow a naming scheme to make
the content of link structures clearer:

cs35l56_<controller link>_<l or r><unique instance id>_adr

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-arl-match.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 24d850df77ca..d7dfb23277d0 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -138,7 +138,7 @@ static const struct snd_soc_acpi_adr_device cs35l56_2_r1_adr[] = {
 	},
 };
 
-static const struct snd_soc_acpi_adr_device cs35l56_3_l1_adr[] = {
+static const struct snd_soc_acpi_adr_device cs35l56_3_l3_adr[] = {
 	{
 		.adr = 0x00033301fa355601ull,
 		.num_endpoints = 1,
@@ -306,8 +306,8 @@ static const struct snd_soc_acpi_link_adr arl_cs42l43_l0_cs35l56_2_l23[] = {
 	},
 	{
 		.mask = BIT(3),
-		.num_adr = ARRAY_SIZE(cs35l56_3_l1_adr),
-		.adr_d = cs35l56_3_l1_adr,
+		.num_adr = ARRAY_SIZE(cs35l56_3_l3_adr),
+		.adr_d = cs35l56_3_l3_adr,
 	},
 	{}
 };
-- 
2.43.0

