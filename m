Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DF819B5A3;
	Wed, 25 Mar 2026 02:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774405089; cv=none; b=eHquD8r5n0ml0cYveZ+Ui0bbBb9VaWbzk2U1C7anECiBxmWZJFW5kcK6eGQHnNk/njntdAVR1yej/0SD4ZoOnQwCDUUbuE4DozXWeQMZLvfdVH+2KUZ3XxK7BBASyJNZO6EOGolDORvX89IxZx1CcLfpaXRDym6xhBCOYcPBChM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774405089; c=relaxed/simple;
	bh=JDMv7nRuSKo6G7s0pCQTtxnv2tE7bez4voc+UIizmeo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A5yAwnePX3paKazSLctoBno40uFkDksCV9MCftjagy4AlOBjc2wg0KTlMZOs3KkMyVlnAbYJLVY9+JgDhf6mqvmghPK+ltyVddcC289HzZcIP4GHS6bWI+g37fbFtQXy4stATDS63iiZfxfnQGMOv7moJcLAAYeTzj2NBq9Sdvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d71dd58427f011f1a21c59e7364eecb8-20260325
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:f55efd46-0d4f-4f1d-ba9c-6da27cfe6c3a,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:89c9d04,CLOUDID:b650e4427ab16f1997d233d859787f2d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:1,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d71dd58427f011f1a21c59e7364eecb8-20260325
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1715421505; Wed, 25 Mar 2026 10:17:57 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	broonie@kernel.org,
	cezary.rojewski@intel.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] ASoC: intel: avs: Fix type mismatch in variable assignment
Date: Wed, 25 Mar 2026 10:17:52 +0800
Message-Id: <20260325021752.238203-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260323032745.281611-1-songxiebing@kylinos.cn>
References: <20260323032745.281611-1-songxiebing@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The input parameter requirement for snd_pcm_format_physical_with is
snd_pcm_format_t,but params->codec.format is __u32, resulting in a
mismatch error:

sparse warnings: (new ones prefixed by >>)
>> sound/soc/intel/avs/probes.c:147:58: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got unsigned int [usertype] format @@
   sound/soc/intel/avs/probes.c:147:58: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/soc/intel/avs/probes.c:147:58: sparse:     got unsigned int [usertype] format

So here, the format is cast to snd_pcm_format_t.

Signed-off-by: songxiebing <songxiebing@kylinos.cn>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512190032.hnwn9mCV-lkp@intel.com/
---
v2:
 - Modify title description
---
 sound/soc/intel/avs/probes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 74096236984a..099119ad28b3 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -144,7 +144,7 @@ static int avs_probe_compr_set_params(struct snd_compr_stream *cstream,
 	ret = snd_compr_malloc_pages(cstream, rtd->buffer_size);
 	if (ret < 0)
 		return ret;
-	bps = snd_pcm_format_physical_width(params->codec.format);
+	bps = snd_pcm_format_physical_width((__force snd_pcm_format_t)params->codec.format);
 	if (bps < 0)
 		return bps;
 	format_val = snd_hdac_stream_format(params->codec.ch_out, bps, params->codec.sample_rate);
-- 
2.25.1

