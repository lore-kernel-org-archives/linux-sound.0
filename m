Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01CB30E0F9
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 07:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426046; cv=none; b=qvexAn4S7jnyl3iRt5JJd3vHVW794JCbNa4SRI5ikM5VL+TpfLWr+oYEexvpUNp4q20794lhu6N9hJ/hI4Uy4/j5L+IEB1B7BH0id5BynfOphxrpf90iPAKPRDc1PYuIEYD9irS9lIH7SLnB0d4UaM465/5I/CVJTxRFtItVJ5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426046; c=relaxed/simple;
	bh=scGHoIpz3OyIF3bX1kfM8X3dxxyM51R2qH2/m8lQjMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RJMmUf454hLuhy+eAzl/u3SVk0gyJfk1TQf4eipZAqLyX4gctsa4JYSS0dV1P+Rel7yuZZMxEjgxzD5TQDLZF4Gy7VvyQjtf+rW+dEEnW4MOPdJaKVo/nSVGB4W+zDabO475dNql19ATmVlLODnaX3Z6sgG46eOPSZyECYAFJyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+YoU7e+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+YoU7e+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426045; x=1791962045;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=scGHoIpz3OyIF3bX1kfM8X3dxxyM51R2qH2/m8lQjMA=;
  b=E+YoU7e+DtUv3f35B8q+bAXxv4oA4GkfM5rZrocI18ooJS3SreT5wfHS
   CHSx47Tm/QNdIn2w13Psm1sVZH1WXQxYqX2elsRUQMe2Lfz97xyrtzPj8
   FQkbt4DKWt0t7QJnqhhiEUJ4E1RI0vCVYo0oXpcEcRHRcyYUyEAB8FHgf
   d8shiKlFEh+hQtw9RzP1kOVlrsreLfBv0bRUaAbcSc5GyexTGQY4irRpZ
   O8oL1vilE48kKi6ZlObf1ruiQfQ1ahZG8kEHB5JCGFy/1/Fq5Rdna1fJB
   yxCIjJ25JrXaYm1wXgUYPT6oeIOWyery2NvhrQOCM7XkuK0oToFvpzGob
   Q==;
X-CSE-ConnectionGUID: idLKJl2MRWyKY5oq5lcIcw==
X-CSE-MsgGUID: N95lAxMpSwmDFnl3cpQLWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66233706"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="66233706"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:14:04 -0700
X-CSE-ConnectionGUID: AvKvfP+TRFaMBh6qxJXX5Q==
X-CSE-MsgGUID: QQrWef2aT8GTOp+Ln4atMg==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:14:02 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	niranjan.hy@ti.com,
	sbinding@opensource.cirrus.com
Subject: [PATCH v2 7/9] ASoC: SOF: don't check the existence of dummy topology
Date: Tue, 14 Oct 2025 15:13:33 +0800
Message-ID: <20251014071335.3844631-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
References: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Monolithic topology is not needed if function topology is used. Instead
of creating a dummy topology in the file system, we can skip the
existence check in the kernel.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/sof/fw-file-profile.c | 4 ++++
 sound/soc/sof/topology.c        | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/sound/soc/sof/fw-file-profile.c b/sound/soc/sof/fw-file-profile.c
index d2b232860091..4a2afc04f338 100644
--- a/sound/soc/sof/fw-file-profile.c
+++ b/sound/soc/sof/fw-file-profile.c
@@ -73,6 +73,10 @@ static int sof_test_topology_file(struct device *dev,
 	if (!profile->tplg_path || !profile->tplg_name)
 		return 0;
 
+	/* Dummy topology does not exist and should not be used */
+	if (strstr(profile->tplg_name, "dummy"))
+		return 0;
+
 	tplg_filename = kasprintf(GFP_KERNEL, "%s/%s", profile->tplg_path,
 				  profile->tplg_name);
 	if (!tplg_filename)
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 3404f1306494..c1083ea4624a 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2523,6 +2523,11 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 	 * callback or the callback returns 0.
 	 */
 	if (!tplg_cnt) {
+		if (strstr(file, "dummy")) {
+			dev_err(scomp->dev,
+				"Function topology is required, please upgrade sof-firmware\n");
+			return -EINVAL;
+		}
 		tplg_files[0] = file;
 		tplg_cnt = 1;
 		dev_info(scomp->dev, "loading topology: %s\n", file);
-- 
2.43.0

