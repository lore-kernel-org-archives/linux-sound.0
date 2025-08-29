Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF182848AE
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 09:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756459790; cv=none; b=iZghpRGa+tW3uLD14ngd4JZGMiOFfWZbOVU7JWmuMtwgBz/FiTpnql3YhAXTocZXc4yAGBzaHiXSczNRSV8zt6uXyEOb1EJu5/jnjqzBzpQRD+vifSWNvyWA0FuqVXM/+UD+gdKYLo985LPze9xY7KuodHx/8kXuQTDDwOqCcAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756459790; c=relaxed/simple;
	bh=IfZ+n5o78qBSgEeQlX9SXfTQryVLvkjltMCVoBor3l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1rRscy2dvAoYtqxf9uvNLsfoN6n4+REAPG028KKl5tsf4vI/Gu44Xo2WSnhEyg8CilT9wdCc0XTXIIzVmEn0p711yvtXHJI2P0CtfMYotzpJzIdgNvcu+Iarl0LDWWKCJYNxODyoX7IgRq/Mb7vw8X8gV9PqeMeimaP2f2mdjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpialiRr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpialiRr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756459788; x=1787995788;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IfZ+n5o78qBSgEeQlX9SXfTQryVLvkjltMCVoBor3l4=;
  b=CpialiRrhmp0PWl3F2ESkR1B/DYEvqTnd4CjtE6RFCkdtNkFrZtY/E7m
   C+XdFyhiXAhDVuGPf8RDmUh349n2eFeXa8scuDyjXA6iTilOTiMWKEl1I
   i733bdhvXKRxmiKP4jsMHusX+o0GHXcZbYS48LMF3rFUZaClrO7HW8vsa
   3GwofWnRcH4NyYBkIAj7AfGeW9Ws3QO/Q7pQyAJmWNFt6rwjSzSXFkXCb
   VmlPG9BUtU2MNIQAE5zARtutU7R+vhfIbi+KyLyP76vdx3OazDS+ebxwu
   aH1nvXy0WGdiQuvygzhDEA296a7+fcQwF18a+gt1QJLIS4vg2S/kPTyjd
   Q==;
X-CSE-ConnectionGUID: fbfY1tMtQFe8+r9jhucHKA==
X-CSE-MsgGUID: JyUknUinSlyFJr1GERD/yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84147886"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="84147886"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 02:29:48 -0700
X-CSE-ConnectionGUID: IXP2ArTCR5y3rYoEDLo42g==
X-CSE-MsgGUID: wPvZiqDlSKaoOB9mzRu3BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170245411"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.56])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 02:29:46 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	jyri.sarha@linux.intel.com
Subject: [PATCH 2/5] ASoC: SOF: IPC4: Add GET macros for module id and module instance id
Date: Fri, 29 Aug 2025 12:30:19 +0300
Message-ID: <20250829093022.32094-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829093022.32094-1-peter.ujfalusi@linux.intel.com>
References: <20250829093022.32094-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jyri Sarha <jyri.sarha@linux.intel.com>

Add SOF_IPC4_MOD_INSTANCE_GET() and SOF_IPC4_MOD_ID_GET() for getting
the ids from ipc4 header presentation.

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/sof/ipc4/header.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index e85c7afd85a4..15fac532688e 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -326,10 +326,14 @@ struct sof_ipc4_base_module_cfg {
 #define SOF_IPC4_MOD_INSTANCE_SHIFT		16
 #define SOF_IPC4_MOD_INSTANCE_MASK		GENMASK(23, 16)
 #define SOF_IPC4_MOD_INSTANCE(x)		((x) << SOF_IPC4_MOD_INSTANCE_SHIFT)
+#define SOF_IPC4_MOD_INSTANCE_GET(x)		(((x) & SOF_IPC4_MOD_INSTANCE_MASK) \
+						 >> SOF_IPC4_MOD_INSTANCE_SHIFT)
 
 #define SOF_IPC4_MOD_ID_SHIFT			0
 #define SOF_IPC4_MOD_ID_MASK			GENMASK(15, 0)
 #define SOF_IPC4_MOD_ID(x)			((x) << SOF_IPC4_MOD_ID_SHIFT)
+#define SOF_IPC4_MOD_ID_GET(x)			(((x) & SOF_IPC4_MOD_ID_MASK) \
+						 >> SOF_IPC4_MOD_ID_SHIFT)
 
 /* init module ipc msg */
 #define SOF_IPC4_MOD_EXT_PARAM_SIZE_SHIFT	0
-- 
2.50.1

