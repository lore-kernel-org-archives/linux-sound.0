Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8531222580;
	Mon, 23 Mar 2026 02:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774234075; cv=none; b=gjJzhGK7SXIDj9TJsETMRK1c1Q9yjRS59GFARoCb9J+tRPaWsG2tp7oUl320FXqndr5iODV6SIZA04gJqfrz/2MaMTF9aCEbMCk3/xP6MVsraiEO7jal3YKFdIDiKptlxv8mg8IpjGERkf1zt4ry/CqUN1DQ9nIr39sxJJ/219Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774234075; c=relaxed/simple;
	bh=joNu9kn6zPt1UrJzWdW2Dabe6OmwAXTSL0VCTsOLPB4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ebBPhoO2UOSuBa1TjtUT9MYZlIs3IIsD6cHkMdwdf8JJ059AWNXykYLUOQopa6Hrzr93hi83rgezJN/9Xjk/4qDg7NRth3uupsW6M1k+qzj3/AOP0uVNM6cELe11tHVpzbgjsCQCkWKcmZx5E8zgkgavnHTneYomH6t0nbjl1Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: acca4072266211f1a21c59e7364eecb8-20260323
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:20d2a71c-1123-4fe2-9971-b4a9388a7bdd,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:89c9d04,CLOUDID:4c13889ef2c47e0d9d0b79126aec9a61,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: acca4072266211f1a21c59e7364eecb8-20260323
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 607820829; Mon, 23 Mar 2026 10:47:47 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ALSA: core/seq: Optimize the return logic in cc_ev_to_ump_midi2
Date: Mon, 23 Mar 2026 10:47:42 +0800
Message-Id: <20260323024742.220707-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are multiple early return branches within the func, and compiler
optimizations(such as -O2/-O3)lead to abnormal stack frame analysis -
objtool cannot comfirm that the stack frames of all branches can be
correctly restored, thus generating false warnings.

Below:
>> sound/core/seq/seq_ump_convert.o: warning: objtool: cc_ev_to_ump_midi2+0x589: return with modified stack frame

So we modify it by uniformly returning at the and of the function.

Signed-off-by: songxiebing <songxiebing@kylinos.cn>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503200535.J3hAvcjw-lkp@intel.com/
---
 sound/core/seq/seq_ump_convert.c | 33 ++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index db2f169cae11..cebc92e7baa0 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -841,7 +841,7 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 	unsigned char index = event->data.control.param & 0x7f;
 	unsigned char val = event->data.control.value & 0x7f;
 	struct ump_cvt_to_ump_bank *cc = &dest_port->midi2_bank[channel];
-	int ret;
+	int ret = 0;
 
 	/* process special CC's (bank/rpn/nrpn) */
 	switch (index) {
@@ -851,47 +851,52 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 		cc->cc_rpn_msb = val;
 		if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
 			reset_rpn(cc);
-		return ret;
+		break;
 	case UMP_CC_RPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
 		cc->rpn_set = 1;
 		cc->cc_rpn_lsb = val;
 		if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
 			reset_rpn(cc);
-		return ret;
+		break;
 	case UMP_CC_NRPN_MSB:
 		ret = fill_rpn(cc, data, channel, true);
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_msb = val;
-		return ret;
+		break;
 	case UMP_CC_NRPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_lsb = val;
-		return ret;
+		break;
 	case UMP_CC_DATA:
 		cc->cc_data_msb_set = 1;
 		cc->cc_data_msb = val;
-		return fill_rpn(cc, data, channel, false);
+		ret = fill_rpn(cc, data, channel, false);
+		break;
 	case UMP_CC_BANK_SELECT:
 		cc->bank_set = 1;
 		cc->cc_bank_msb = val;
-		return 0; // skip
+		ret = 0; // skip
 	case UMP_CC_BANK_SELECT_LSB:
 		cc->bank_set = 1;
 		cc->cc_bank_lsb = val;
-		return 0; // skip
+		ret = 0; // skip
 	case UMP_CC_DATA_LSB:
 		cc->cc_data_lsb_set = 1;
 		cc->cc_data_lsb = val;
-		return fill_rpn(cc, data, channel, false);
+		ret = fill_rpn(cc, data, channel, false);
+		break;
+	default:
+		data->cc.status = status;
+		data->cc.channel = channel;
+		data->cc.index = index;
+		data->cc.data = upscale_7_to_32bit(event->data.control.value & 0x7f);
+		ret = 1;
+		break;
 	}
 
-	data->cc.status = status;
-	data->cc.channel = channel;
-	data->cc.index = index;
-	data->cc.data = upscale_7_to_32bit(event->data.control.value & 0x7f);
-	return 1;
+	return ret;
 }
 
 /* convert one-parameter control event to MIDI 2.0 UMP */
-- 
2.25.1

