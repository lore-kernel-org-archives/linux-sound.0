Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD314915BC
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945023; cv=none; b=lVWp93wtyVYYveHd5yXCXrp6TcXdpS94BgvUv82krer0ezq0uSzNT9UEhOpwC4+cI1ykTtpEFpk269nSIZ7FExHTV4TR2WWJkjUQ9gjo9SWnPzkLJewav3J34o5ZK6nrEa1m7tz74PoKj/h2QLwpspm1IKD0J/rvNI8GOBDIOMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945023; c=relaxed/simple;
	bh=21OSVs/XAzQ7uwFxTgoCG2fHzzbEB7F5tME5tLZdIMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QlJ9XOyUY4UUd2CNO/hJDU7OMPMoNCX6DlOqe84WkJ/YvMWpuwfg4+iltc6jPlJiRm+eS0PLTT7NTX5Rj7vZapRDxvZ6JPhS1FbI5vwRV4ZDTYf1LKKglufX8QkwKPY1/YA+QOnYfAlHSMlV/jq4VBDUEyv6YwU+8M9YQlOshr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYy1LSsd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYy1LSsd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945022; x=1820481022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=21OSVs/XAzQ7uwFxTgoCG2fHzzbEB7F5tME5tLZdIMQ=;
  b=mYy1LSsdqziQkX/nk393hpQGe3+9YUPvB2NwXK8q6vIqNN9VspKs+HBq
   OSoqF0/qxDNy6hHDF/c9MPjUw4SPUSX/aWPINdxd6ee8BumKCOEu5pnHa
   jYOcxSgExhHCWKpb3gzR7OXyGmJ19sHMJ5A0dTkxxZVagRCB5jaw71EcD
   mefXJl1L3H0ePJhczqvTKTf/i8zxFFm6gq/ebh22MEwGdWxdpltX+FBR5
   Sy0Q86UA+oWkkCsoBwrk+4iPsc2c2e2Xdexho2qfwRVmvYj8twqzl7Shs
   mF1rAzi/5ytVOyFnoQEfJ0fXshaW1esk83d71ec551+lSjx2HkNi4JJpw
   Q==;
X-CSE-ConnectionGUID: gHdLo1VHQsOpF7Qv6YjxmA==
X-CSE-MsgGUID: 3Li+L8qfSt2ybtYsgobbIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200740"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200740"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:22 -0700
X-CSE-ConnectionGUID: NtzmBrZsRQGv9Qdu9cNnhw==
X-CSE-MsgGUID: Q8MzIiy+ReGzrQtClvkerg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266973109"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:18 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v2 14/24] ASoC: SOF: ipc4: Add definition of module data in init_ext object type
Date: Wed,  9 Sep 2026 12:09:39 +0300
Message-ID: <20260909090949.7503-15-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SOF_IPC4_MOD_INIT_DATA_ID_MODULE_DATA type within the module_init_ext
area is module specific init data.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 include/sound/sof/ipc4/header.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index cea3d9453b84..e5161f0a37e8 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -706,7 +706,8 @@ struct sof_ipc4_module_init_ext_object {
 enum sof_ipc4_mod_init_ext_obj_id {
 	SOF_IPC4_MOD_INIT_DATA_ID_INVALID = 0,
 	SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA,
-	SOF_IPC4_MOD_INIT_DATA_ID_MAX = SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA,
+	SOF_IPC4_MOD_INIT_DATA_ID_MODULE_DATA,
+	SOF_IPC4_MOD_INIT_DATA_ID_MAX = SOF_IPC4_MOD_INIT_DATA_ID_MODULE_DATA,
 };
 
 /* DP module memory configuration data object for object array */
-- 
2.55.0

