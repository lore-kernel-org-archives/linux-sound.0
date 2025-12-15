Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70242DC76D
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765805372; cv=none; b=ssDfno1//3kPG3bWRn492+JA5WNEcwJwxvwuLVyySPsr4E90fAaztWheTiSKuFbOnCA7QVewN89mi5HBunYA3loqyJQtLaa7jAlayHoDFYstOzAtswIedp/lx9bVcR4UKkiNv5R9575CKBgjJ4r5IFRxJaylfQfMnnrdKRhZ3x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765805372; c=relaxed/simple;
	bh=vgyY3W1V1g17Zkai9WiPc/bnDpoXBKnZYXkUQNUdMm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1U3kAfWlns0dwxVYYi/LBYbgNcpkO0do5dimXmSWn8HWaA0tMWAysddUoC6hv4fwCd3DqwBwkq9Cp3NlgZyELcrrTcOi/BMVzDpg3c0e1/dO6mJXl+eNMMl3NRjCOHnDiYzifhi33hCZUs3heXmh0xymJ6D8A0MwYyhqks3H4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVhH2I5B; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVhH2I5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765805371; x=1797341371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vgyY3W1V1g17Zkai9WiPc/bnDpoXBKnZYXkUQNUdMm8=;
  b=kVhH2I5ByMWE/n2cqazGjFhAxkjXgAZo2p1DwArZXn3PcvzxN4/c+QqG
   ICjwhCa6PbH27iRsyxF4zvxdLg6i5OZ9/H0Kj0CbL6iHm+l0J09ODaxjz
   eT+cQ9hqyOo0Zh0JlXRMDp6t99LBn03HvSISDN2cbaCImsl9Xy+6/hdRH
   Bl5U4Q0HWfb/OUqRU5b2YurECr+lGvPOYPlj9wQhelPXdLyoDOVPqXvCi
   2UDE2VIsttIhX9nrhlgaF+wHXugcamKF2D9mPgw0/5kriWG3yUfCrUwQe
   00SQpzAAnJxlbxfYt3bnBJ/4FDZqwEQTQnfEuiAiBKuU7/7RdrddmbNng
   g==;
X-CSE-ConnectionGUID: UvRYEOV+QEOlHvY9HHTn0Q==
X-CSE-MsgGUID: 9EpUw3rHRhS5D0j3PZAguw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="93179468"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="93179468"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:30 -0800
X-CSE-ConnectionGUID: aD6Vn0ieRveNiS8Ex4JJkA==
X-CSE-MsgGUID: 7rvQfpeITImxxc1GSqa5cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228376975"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:28 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 2/8] ASoC: SOF: control: skip rpm calls in ext_volatile_get if not implemented
Date: Mon, 15 Dec 2025 15:29:40 +0200
Message-ID: <20251215132946.2155-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215132946.2155-1-peter.ujfalusi@linux.intel.com>
References: <20251215132946.2155-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Test earlier for the existence of ext_volatile_get callback and if it is
missing, skip the rpm calls to avoid needles DSP power on.

No change in functionality, we just skip the DSP power on in the unlikely
case when the ext_volatile _get is not supported and yet the topology adds
such control.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/control.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index a3fd1d523c09..9582ab5f1113 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -187,14 +187,18 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	int ret, err;
 
+	/* ignore the ext_volatile_get call if the callbacks are not provided */
+	if (!tplg_ops || !tplg_ops->control ||
+	    !tplg_ops->control->bytes_ext_volatile_get)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(scomp->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(scomp->dev, "%s: failed to resume %d\n", __func__, ret);
 		return ret;
 	}
 
-	if (tplg_ops && tplg_ops->control && tplg_ops->control->bytes_ext_volatile_get)
-		ret = tplg_ops->control->bytes_ext_volatile_get(scontrol, binary_data, size);
+	ret = tplg_ops->control->bytes_ext_volatile_get(scontrol, binary_data, size);
 
 	err = pm_runtime_put_autosuspend(scomp->dev);
 	if (err < 0)
-- 
2.52.0

