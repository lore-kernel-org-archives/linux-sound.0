Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1D1155A4D
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145146; cv=none; b=R3A0yLAISj/Im8Y5crnr9kgtVEQcf6JDbCDdCBnM7Soc1Cs3FIIl3soHLG+8ksPcwqgvB4NDy9xf8Uq+UAzO9u8MfT8CkTwjHbrhQy/U+2LPkgn1i5p1AcXsK/2C9qqACzuO9oxoDzXsFz6LlxTnb7RdYU6kJMYQ7j+adOIwzOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145146; c=relaxed/simple;
	bh=F46Iv1zuto1wmnP8krweutl1d2vtjDUnvjUVa+cEXyk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D2vOlJQ+7nDO0KthirTfKnra6ls5+pW7U9zZf3fiz6Tn+KCyRuAZqzmgH6UbkTlqBgEEz9s7U5RDJztlCsD6u3oHHJhzxshBCS3K12J4qAYqziR69QXq/n3ap4/jXE8aDXqeDqWaOD+9pBb7T3WykA9nBccAq8lFNkrJ4vstqc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7VMWiQE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7VMWiQE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145145; x=1745681145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F46Iv1zuto1wmnP8krweutl1d2vtjDUnvjUVa+cEXyk=;
  b=L7VMWiQEzsWkjbEE2fc+sDKB9Tl6B6mfpL7d1j3NLbNXB2u7rT3jVpfY
   hD5o/P1/9ukZk3LFm2Z6RmA4JltIViPdZfl/v8MBfLUU7GelWC7patxZg
   EnHoeg8bUo7JBL+/VEitG98TWvhTNVgMU28zkFt6QJovVLtAziEChAx2X
   Q0gNxoZuMbLgiXl86xrqzILLzvRtD7Wu2fvupjUNv+M50jeOdZEfQRVCr
   IO2C67nWz0QDIwJ3LPFNCNAgpi5Iy73P2eqh91KGknXTS3dYDPndZmjUk
   v+MJoMlLSQMOoQje2I6bmthHX48sM8LHu9RTqb2JSBXZop8qcFKGasiC4
   Q==;
X-CSE-ConnectionGUID: cfA6P41iRpWUMB8BcF1tvg==
X-CSE-MsgGUID: M+KUmtrAQF+i9gAUY03kJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291311"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291311"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:45 -0700
X-CSE-ConnectionGUID: KT5Ik3KkQZ2dSsk+SMsOGA==
X-CSE-MsgGUID: 8R787wyDQZib8uuBli9Xbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259563"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/23] ASoC: Intel: sof_da7219: support MAX98357A on cml boards
Date: Fri, 26 Apr 2024 10:25:15 -0500
Message-Id: <20240426152529.38345-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

For cml boards, MAX98357A speaker amplifier is supported by machine
driver bxt_da7219_max98357a with sound card name cmlda7219max. Use
same name for backward compatibility with existing devices on market.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 610b5a8e0860..ecb1d4b25ea6 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -339,6 +339,14 @@ static int audio_probe(struct platform_device *pdev)
 
 		/* backward-compatible with existing devices */
 		switch (ctx->amp_type) {
+		case CODEC_MAX98357A:
+			card_name = devm_kstrdup(&pdev->dev, "cmlda7219max",
+						 GFP_KERNEL);
+			if (!card_name)
+				return -ENOMEM;
+
+			card_da7219.name = card_name;
+			break;
 		case CODEC_MAX98390:
 			card_name = devm_kstrdup(&pdev->dev,
 						 "cml_max98390_da7219",
-- 
2.40.1

