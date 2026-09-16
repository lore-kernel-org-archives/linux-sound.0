Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5D3242D6B
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560210; cv=none; b=uJzXuj/bw6TO1zk397InJEk+T/xAATGsOxn43pIKrnUQyL4dGx8aWSpNSFGvL8Bt5orSM0Ak+FdoZpILWfQ4PCP6V3JmyROSEAplhjpDJVETUUsCHTIv9HEcDYNMhUrE5JYva8NGTaZUvNhGDJL92mikLmrRW2S4YffyabeFev8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560210; c=relaxed/simple;
	bh=r7g1rATmpuvVxogSDojudDCwwCOkItqRieAkmDIL+Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sSOHR5kA4ql2QYTpcXw37PZnko3rXyvc52j3Ub1VV2kZ88m2VzUU1g4QFf8ECr7aIVPi0CjSydcyfizDohmLM9fW+slvv8Mgx1pFbFb+hdtqcGIgVv2+Sryfadu+6gLS8ehJJJVOs/zAP1cjYwdoU361tH4cg4C/ltHPCfoUWVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8XjfP2A; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8XjfP2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560202; x=1821096202;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r7g1rATmpuvVxogSDojudDCwwCOkItqRieAkmDIL+Kg=;
  b=j8XjfP2A2G4HTP/AQVm77M4r1jDBty4Y4rRBRAAfPHWXvg9mQUYzAY+2
   xzpBjfGrAThMpW+15ivE44qOSeE8eHQi6IOpzLuR9Koq8aXlPwIAP1RYN
   Aptpe/uV0lQtOD0c3A/ci8Uo8IcXdVqkPH1DN3RmX+6uFjxONGaufE8Yk
   DX2FMJ8eqZhPyUAZihdUqgKa5VnYpbEKrRSITUOJkBw5zdVzgp1pvaRaZ
   eqdrZvH/Gd3osD5LgQ4CT8AUFrHeRw2XZyyoI1ic2ae4a/PK6C2tfFOyD
   HPFyE9fi0kkyng2B1u2rexkj6UgUW/ZXpHqp8Gi4zhOm1ctuFL6zyQExN
   A==;
X-CSE-ConnectionGUID: oQ1/YpgAQVW5w0B5etRuHw==
X-CSE-MsgGUID: uwIBc//ORey7kGlM7iRitw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496228"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496228"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:18 -0700
X-CSE-ConnectionGUID: OVtlCErkS7+2MPweQe7YXA==
X-CSE-MsgGUID: pmLVAkh6RvioUxnhLVc7rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293328"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:16 -0700
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
Subject: [PATCH v4 02/26] ALSA: compress: register the open file with the card
Date: Wed, 16 Sep 2026 15:02:56 +0300
Message-ID: <20260916120320.18318-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compress-offload device is the only ALSA character device family
which does not add its open files to the card's file list. Without it
the core cannot replace the file operations on disconnect, so syscalls
issued after the card is gone still reach the driver, and a card freed
with snd_card_free_when_closed() does not wait for the open compress
streams.

Call snd_card_file_add() at open and snd_card_file_remove() at release,
following the ordering used by the PCM, control, rawmidi and hwdep
devices.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/compress_offload.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index ba6cdfe64246..7b720603a9a8 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -101,7 +101,14 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 		return -ENODEV;
 	}
 
+	ret = snd_card_file_add(compr->card, f);
+	if (ret < 0) {
+		snd_card_unref(compr->card);
+		return ret;
+	}
+
 	if (!try_module_get(compr->card->module)) {
+		snd_card_file_remove(compr->card, f);
 		snd_card_unref(compr->card);
 		return -EFAULT;
 	}
@@ -144,6 +151,7 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 		kfree(runtime);
 		kfree(data);
 		module_put(compr->card->module);
+		snd_card_file_remove(compr->card, f);
 	}
 	snd_card_unref(compr->card);
 	return ret;
@@ -174,6 +182,7 @@ static int snd_compr_free(struct inode *inode, struct file *f)
 	module_put(data->stream.device->card->module);
 	kfree(data->stream.runtime);
 	kfree(data);
+	snd_card_file_remove(compr->card, f);
 	return 0;
 }
 
-- 
2.55.0

