Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB1312B176
	for <linux-sound@vger.kernel.org>; Fri,  6 Sep 2024 06:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725602560; cv=none; b=sqW18SOfKwTXW8R23w99GlQy5XLuMZgIkZL17wfTHtPGMfkeni9IrFR5LoEwzHXh77CW2awntjUmb2IdZQRgET630ASOxSoePcQ08DtvChmee6mxcPG+8Hf/yj7Znsre+k+bZlPNYg+2h3TtwyFTpgipWTaqJa+JEoS0ZYjVpvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725602560; c=relaxed/simple;
	bh=b9sUaI0Q4M72AcGjq0w8geRBzi2Kz0zQf05VHCWy6Oc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZpiEbRcjQ9iT83VR2ai2HGOUAwKNvxbar7iLmyDSY4rHd/zQtFJZRbvGkT3k3WFubteLR1/GCAFExryc4CdfYUZhMqs09h0ATGHiJj5whPKF9PguNCizWBlAu6BI/ElpNymSONJhqNtRe8hqAiYkqA1GwYBKd0BKVFqFMOFk9mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdKxc+mX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdKxc+mX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725602559; x=1757138559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b9sUaI0Q4M72AcGjq0w8geRBzi2Kz0zQf05VHCWy6Oc=;
  b=FdKxc+mXt/qaM3TTAkqwKaaN6qjRG9IvS8WVdYHYZVaM4HoBjxKwaA98
   xEAv1Qj/t60qeJ/So4MECgfs0AacsqCStfKF4WTbPnFsWb9cgkP7lAm7E
   a+6m2IS5FsGfqqeJoAukOkL5fY0TWQZqXe3DINcW7XaxYhaokZPGIdy5Y
   7hSiVr+Ay+hMGU2/F3n8DpVgQk6qkU46GmAdegGmHPydpg7srHDAjkJcO
   SkksRcIDuM89j0VqP/grvUT4t3UwDnUSWwYF+wkf0TfjlhcvwUNWNQ3vr
   7GpP5y6DSqy7SUSjPk9tSN6Jnw4eT5E8WOaxVEJpHWaduUbvIj+a6PXec
   A==;
X-CSE-ConnectionGUID: FU060D0QTnmST7eCxWDC7w==
X-CSE-MsgGUID: u34y0uMwQFG1D9I9x11OVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49764797"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="49764797"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 23:02:36 -0700
X-CSE-ConnectionGUID: ZIBqcT7MRQGjVHCW0hjCmw==
X-CSE-MsgGUID: sYmQwkygSCKxKcD4ZmGn9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="65902220"
Received: from yungchua-ws.ostc.intel.com (HELO yungchua-ws.intel.com) ([10.54.69.90])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 23:02:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 2/2] ASoC: Intel: soc-acpi-intel-mtl-match: add missing empty item
Date: Fri,  6 Sep 2024 06:02:24 +0000
Message-Id: <20240906060224.2241212-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906060224.2241212-1-yung-chuan.liao@linux.intel.com>
References: <20240906060224.2241212-1-yung-chuan.liao@linux.intel.com>
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

Fixes: f77ae7fcdc4763 ("ASoC: Intel: soc-acpi-intel-mtl-match: add cs42l43 only support")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 8e0ae3635a35..d4435a34a3a3 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -674,6 +674,7 @@ static const struct snd_soc_acpi_link_adr mtl_cs42l43_l0[] = {
 		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
 		.adr_d = cs42l43_0_adr,
 	},
+	{}
 };
 
 static const struct snd_soc_acpi_link_adr mtl_cs42l43_cs35l56[] = {
-- 
2.34.1

