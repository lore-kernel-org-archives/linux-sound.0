Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26342CCC1
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 06:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612401; cv=none; b=DhskUY3hVFuvuVp/URw8Gq6LsGvqVCcNkmvam19VIWBqTkgmJMGvgYgCFGWKBCQM1ygppXFJmDR5GRN7jWuU6MoZWlIuTFpQtSPC3F9NpRhsz5Zw6o7LwhPDnN1iXkHAogCE+lGQRDIGNKacWm+PRgaLvj1zpDnjyMMWDr9xf2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612401; c=relaxed/simple;
	bh=k8gK2FxGQKc19Ma2nGWNxgUlwVND8rrfJ1YCkjSZr4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NZUtvreQEcJoiMzAf56pXwkZEyAu3Zpvh97VV8pA49fVo03F6XaYr75Bvhnog3eBo1+4Mk5r9+jPHVmB+nbAObJQy6Lb3HJ8glk/ws45cM0XfYqwiHMIgJqSKCsPVrnSVbBPioIZQU/myYNYnvX1OwYDGJWfrtsZ1HOflfGUs+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJebgIuA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJebgIuA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744612400; x=1776148400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k8gK2FxGQKc19Ma2nGWNxgUlwVND8rrfJ1YCkjSZr4M=;
  b=lJebgIuASeojSdqOO35WjZvvbQPufIcjb1atzk6vF2TlKEODZ9+Fi6UX
   NRFlCFtknI3mBJQEzh4xQtx/uz5nlmLxHC+uRP9RU1w0PG08Bvsgz/eiV
   klWmzBKysqXjiu1RMOzf9rWbQWEzWQX43XOad0di3IsLx7SHtl+tWdxiQ
   8fiF6UMzgr5NhdEhJ9GLntgLa1RBvbG1MFRBb+qlYEfG/f529Cmrqh7nu
   H2sZnwIJX/JZNQDdrqSt80zRA4Pl7pgXH9romAJTlqZDxlivyQoCAe6wW
   7WL7ITCPkS7wZtxhcG9zWWxhDgfpaa3F4FLu1zifCivhF6h6WiqbFNDCs
   A==;
X-CSE-ConnectionGUID: YH/wi89lQeiyu+V5Rp/bsg==
X-CSE-MsgGUID: ByxGrrIdTpqqONRk8RxNCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49872596"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="49872596"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:18 -0700
X-CSE-ConnectionGUID: I6+GrWseRAuIqSkekJ5ihQ==
X-CSE-MsgGUID: lh7NsZsUQfucnxIaepKx6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130275262"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:17 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 01/11] ASoC: SOF: topology: allocate string for tuples
Date: Mon, 14 Apr 2025 14:32:29 +0800
Message-ID: <20250414063239.85200-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
References: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation to handle tuples from multiple topologies, duplicate the
tuple string value by allocating memory for it.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/topology.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index dc9cb8324067..15e8ca62ab14 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -571,7 +571,11 @@ static int sof_copy_tuples(struct snd_sof_dev *sdev, struct snd_soc_tplg_vendor_
 						continue;
 
 					tuples[*num_copied_tuples].token = tokens[j].token;
-					tuples[*num_copied_tuples].value.s = elem->string;
+					tuples[*num_copied_tuples].value.s =
+						devm_kasprintf(sdev->dev, GFP_KERNEL,
+							       "%s", elem->string);
+					if (!tuples[*num_copied_tuples].value.s)
+						return -ENOMEM;
 				} else {
 					struct snd_soc_tplg_vendor_value_elem *elem;
 
-- 
2.43.0

