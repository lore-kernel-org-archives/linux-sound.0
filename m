Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08350319609
	for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 10:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765534442; cv=none; b=lXDWBBDF6CMGW9UJGE3WEGpJz8HwJYT5HlvTpvVZ1S+1/IkSvUgh3bjMMOhvwp80rj1KImzAtdQpFGCEqhdutqf5I/lC9/E0K3sudWrSXD1fU97RZKOzeNW7iwodn7EU62uuLuBU5Jp8/6E0nd1ZPkdjySCARTkFnyIHECkCDiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765534442; c=relaxed/simple;
	bh=SC6cZqjShgYjB5AMb1C2t3iyN2pYwq6+kwqRJ4foUYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cPhonNcpNPcmXXxIQj0xxRbEoTF4fCir9JJ5S5UV4bOy5oyFJbzbjUfNRcXa8TtKImO1o0vEaxCFPGbImE5GCQrgqsNLa8YyIAP81fwxpiAqfMXf1CWk4QMe18tUVF9zT2u174B2FlhfxZosXQgYjm1obZVJMXtZNOEINfAvTac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OunwgnIG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OunwgnIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765534441; x=1797070441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SC6cZqjShgYjB5AMb1C2t3iyN2pYwq6+kwqRJ4foUYg=;
  b=OunwgnIGdj+oh+ssfe3kETrA1Y09SppGyNcu8lZCOFsoaCuc1jpmeaRC
   AxiAQ9nkgGMKt9Dia3TWZF7Y4IhUJgWmDGdpnbVMIqoURttwvYqgOZoIS
   tBmkOj7O8Esk3/cBVgjY0y+YF798L3HIdgFVYqYZKxxU/PLPCf/jliiws
   muMFEngXydGvHbf1K0da3UnExJ9pykkUxEnEZbiyKsV+6cmyXDlna4ZgE
   yy9l1n+zx25fWY/BtKJjI4fIIVit47L1b4HPPWAsGz0W2A6/VmyNdx+si
   Aaw+FU53VbgZGIQFATPPMlrTac362CnD0ET6WzN7R8fvnV/682M7/RWQp
   A==;
X-CSE-ConnectionGUID: 65WK2upgTB+KVOTnnoDnWQ==
X-CSE-MsgGUID: owiRwZ7oSfiP2npVozUdzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78891349"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78891349"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:14:00 -0800
X-CSE-ConnectionGUID: YZ5fRqvCTUeYJr1ggBRytQ==
X-CSE-MsgGUID: EK/CIVdPRlGdyzj2lkUNzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="234444933"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2025 02:13:59 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 5/5] ASoC: Intel: catpt: Drop superfluous space in PCM code
Date: Fri, 12 Dec 2025 11:38:58 +0100
Message-Id: <20251212103858.110701-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251212103858.110701-1-cezary.rojewski@intel.com>
References: <20251212103858.110701-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Those spaces are redundant.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index cbb1c3942409..2c3405686f79 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -687,7 +687,7 @@ static const struct snd_soc_dai_ops catpt_dai_ops = {
 static struct snd_soc_dai_driver dai_drivers[] = {
 /* FE DAIs */
 {
-	.name  = "System Pin",
+	.name = "System Pin",
 	.id = CATPT_STRM_TYPE_SYSTEM,
 	.ops = &catpt_fe_dai_ops,
 	.playback = {
@@ -710,7 +710,7 @@ static struct snd_soc_dai_driver dai_drivers[] = {
 	},
 },
 {
-	.name  = "Offload0 Pin",
+	.name = "Offload0 Pin",
 	.id = CATPT_STRM_TYPE_RENDER,
 	.ops = &catpt_fe_dai_ops,
 	.playback = {
@@ -724,7 +724,7 @@ static struct snd_soc_dai_driver dai_drivers[] = {
 	},
 },
 {
-	.name  = "Offload1 Pin",
+	.name = "Offload1 Pin",
 	.id = CATPT_STRM_TYPE_RENDER,
 	.ops = &catpt_fe_dai_ops,
 	.playback = {
@@ -738,7 +738,7 @@ static struct snd_soc_dai_driver dai_drivers[] = {
 	},
 },
 {
-	.name  = "Loopback Pin",
+	.name = "Loopback Pin",
 	.id = CATPT_STRM_TYPE_LOOPBACK,
 	.ops = &catpt_fe_dai_ops,
 	.capture = {
@@ -752,7 +752,7 @@ static struct snd_soc_dai_driver dai_drivers[] = {
 	},
 },
 {
-	.name  = "Bluetooth Pin",
+	.name = "Bluetooth Pin",
 	.id = CATPT_STRM_TYPE_BLUETOOTH_RENDER,
 	.ops = &catpt_fe_dai_ops,
 	.playback = {
-- 
2.25.1

