Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D822B13C9CA
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483518; cv=none; b=NFkSSsl2QewXiTzO5W+8Vv5JFW5gJB+wDpX3IB4054rO7b0R9cKgBnOeB5kvWwBfxtPZ+esP9M4efF0a0fUI2yqOYhaNMgR7k1IfdUcDEu6bcF/3yG9zqmZqyF0oO8Q9ABDPBlDUCidcfwPh+nWjwWEZa0ihOB3/mExLQ7Bx1U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483518; c=relaxed/simple;
	bh=dv9pKybRB6RToP7aV6WyFJADAdrtGqxesQBR9Rf5FDI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QTxwM9UUywb9aGwULUFpJo5siIvI12bw2xNnOD+HREurwn1LCBTv32lub1d/2u5eORh1vI+a+aukFy2dr5NTqU4C9VLzsRd0zpxI3e6mZBUvpne61LvdwG0YipIB0ANZGSOIJQQRXJ7Ugph2m2WGZn4grwbvDKYQLsl/F3bEeCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCskipD3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCskipD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719483517; x=1751019517;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dv9pKybRB6RToP7aV6WyFJADAdrtGqxesQBR9Rf5FDI=;
  b=NCskipD3dyn0tpiU9YqWVdKjAHicxWfcW2kjje+wiMB05nXg0i3wCchg
   eUH8QM9tMbbAvhvD7AsgdWbEf/bcxXfJ29sAUfnk9RoHzySqar/rJTHSt
   J8qXgacqKT6AZ39Sp8eRIzBwzC6qLEjgFG24Ile3juixrJF74vlGOv2mW
   oh8shYCjUprbvZUhQUQm9+q3+bEFqsfWxjwrwxVwG1BDvE3DU4BmGjPWS
   wbOBTjrAGYyyxYuO4zr51HRyDQX+I3+ZBxCo1ZHcLBgvHcSxo3i0ZVmeb
   THqbDLlocT9EvyNo5o5BVFxoAMe0EiJEhPnB9MvlWwFv31qbvFAKD5H2h
   g==;
X-CSE-ConnectionGUID: h1w4hlIGQYGmliPqTwjekQ==
X-CSE-MsgGUID: jlcKDn6cShy9Ef+cHABXpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19487621"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="19487621"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 03:18:37 -0700
X-CSE-ConnectionGUID: Bd4DWy3eSYOM58OvcuD1BQ==
X-CSE-MsgGUID: kG9bg0VXTc+tah28DqMzBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45080019"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 03:18:35 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 11/13] ASoC: topology: Unify code for creating standalone and widget bytes control
Date: Thu, 27 Jun 2024 12:18:48 +0200
Message-Id: <20240627101850.2191513-12-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627101850.2191513-1-amadeuszx.slawinski@linux.intel.com>
References: <20240627101850.2191513-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Code used to create standalone and widget bytes control is same, with
exception that in standalone case dynamic object needs to be registered
and control created directly.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 51 +++++++---------------------------------
 1 file changed, 9 insertions(+), 42 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 5aab1df7e2606..b10a6be8f75b3 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -875,41 +875,21 @@ static int soc_tplg_control_dbytes_create(struct soc_tplg *tplg, struct snd_kcon
 
 static int soc_tplg_dbytes_create(struct soc_tplg *tplg, size_t size)
 {
-	struct snd_soc_tplg_bytes_control *be;
+	struct snd_kcontrol_new kc = {0};
 	struct soc_bytes_ext *sbe;
-	struct snd_kcontrol_new kc;
-	int ret = 0;
+	int ret;
 
 	if (soc_tplg_check_elem_count(tplg,
 				      sizeof(struct snd_soc_tplg_bytes_control),
 				      1, size, "mixer bytes"))
 		return -EINVAL;
 
-	be = (struct snd_soc_tplg_bytes_control *)tplg->pos;
-
-	/* validate kcontrol */
-	if (strnlen(be->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-		SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
-		return -EINVAL;
-
-	sbe = devm_kzalloc(tplg->dev, sizeof(*sbe), GFP_KERNEL);
-	if (sbe == NULL)
-		return -ENOMEM;
-
-	tplg->pos += (sizeof(struct snd_soc_tplg_bytes_control) +
-		      le32_to_cpu(be->priv.size));
-
-	dev_dbg(tplg->dev,
-		"ASoC: adding bytes kcontrol %s with access 0x%x\n",
-		be->hdr.name, be->hdr.access);
-
-	memset(&kc, 0, sizeof(kc));
-	kc.name = be->hdr.name;
-	kc.private_value = (long)sbe;
-	kc.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	kc.access = le32_to_cpu(be->hdr.access);
+	ret = soc_tplg_control_dbytes_create(tplg, &kc);
+	if (ret)
+		return ret;
 
-	sbe->max = le32_to_cpu(be->max);
+	/* register dynamic object */
+	sbe = (struct soc_bytes_ext *)&kc.private_value;
 
 	INIT_LIST_HEAD(&sbe->dobj.list);
 	sbe->dobj.type = SND_SOC_DOBJ_BYTES;
@@ -917,26 +897,13 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, size_t size)
 	if (tplg->ops)
 		sbe->dobj.unload = tplg->ops->control_unload;
 
-	/* map io handlers */
-	ret = soc_tplg_kcontrol_bind_io(&be->hdr, &kc, tplg);
-	if (ret) {
-		soc_control_err(tplg, &be->hdr, be->hdr.name);
-		goto err;
-	}
-
-	/* pass control to driver for optional further init */
-	ret = soc_tplg_control_load(tplg, &kc, &be->hdr);
-	if (ret < 0)
-		goto err;
-
-	/* register control here */
+	/* create control directly */
 	ret = soc_tplg_add_kcontrol(tplg, &kc, &sbe->dobj.control.kcontrol);
 	if (ret < 0)
-		goto err;
+		return ret;
 
 	list_add(&sbe->dobj.list, &tplg->comp->dobj_list);
 
-err:
 	return ret;
 }
 
-- 
2.34.1

