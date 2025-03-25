Received: from mail-m49248.qiye.163.com (mail-m49248.qiye.163.com [45.254.49.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4315A38385
	for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 06:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742883931; cv=none; b=i2eSTHZmbwP5h+wkHriV7wcyP4m/2VzG0l+1VFQT33j6yEYD9BZ+/KnW7x+H+nOUMzsJsuvKJFeq+Di5hNzBJDLcuLUTe2S4cVgQbqAawMf+CmkXIB9T+AeP5YaKbBnA9Vf9nDfgmFThrwlMoINUagbDJPJwl1+wUMw6HtyoY4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742883931; c=relaxed/simple;
	bh=ELqU0b3b8kBAZ7OcQKwkX0oe4EuAhSbXTCWMPNDiF7U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z8p+MEqN27voNijFts99+tvoBeZKh7HW8IgVPAZAZVaeD0xFKEmRkhgi8r9aOGhY+vZNTQhID3te1RbxPaW07yC11mNdh2rEDhad7+ImjlPXJGn5N2jGmXXGpIqT+4KAhYciN6v6PIMlvRHDfpuwehVBc52pHxhRGyJQsAzkyaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=czbnvtpV; arc=none smtp.client-ip=45.254.49.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="czbnvtpV"
Received: from book-ThinkStation-P328.. (unknown [61.183.143.78])
	by smtp.qiye.163.com (Hmail) with ESMTP id f7585a51;
	Tue, 25 Mar 2025 14:10:02 +0800 (GMT+08:00)
From: bo liu <bo.liu@senarytech.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	bo liu <bo.liu@senarytech.com>
Subject: [PATCH V4] Initialize the gain and boost values of the ADC in the SN6180 chip to achieve a better recording experience.
Date: Tue, 25 Mar 2025 14:09:56 +0800
Message-Id: <20250325060956.1139955-1-bo.liu@senarytech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQkodVkxPHR1JSk4aTR4dHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlNSlVKQ0hVSk9IVUxDWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NNVUpLS1
	VLWQY+
X-HM-Tid: 0a95cbec18a109d9kunmf7585a51
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kxw6LQw4IzJRFysZLh03Qz4w
	KBwKFApVSlVKTE9JQ0NIS0tISUpLVTMWGhIXVRkUVRcSDjsIHhUaCQIPHhgTVRgUFkVZV1kSC1lB
	WU1KVUpDSFVKT0hVTENZV1kIAVlBSU9NTTcG
DKIM-Signature:a=rsa-sha256;
	b=czbnvtpVB5eZtIETDDCMrWKZtKTc4a+z7n7ZoniH+0Rc3pNRT1O8Q5vxXvZrad5zX5igZRV0Q/sJL8NYuxiLmTG/jiI4KqPeBDvJb+P89+zgJL1FR2ROuc2GlLjlUd32wJCLat2d9MG0O0WiLUWMuFLlaH015R5EoVaabtWy8cY=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=giLShIzJpK6+A20pvGZyMwIuolETVA8bpXez2mOSa7w=;
	h=date:mime-version:subject:message-id:from;

Signed-off-by: bo liu <bo.liu@senarytech.com>
---
 sound/pci/hda/patch_conexant.c | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 34874039ad45..7017db4a0fee 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -185,6 +185,40 @@ static void cx_fixup_headset_recog(struct hda_codec *codec)
 		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x20);
 }
 
+static void cxt_setup_capture_default_boost_gain(struct hda_codec *codec)
+{
+	struct conexant_spec *spec = codec->spec;
+	struct hda_gen_spec *gen = &(spec->gen);
+	hda_nid_t adc_id = 0, nid = 0;
+	int nids;
+	size_t i = 0;
+
+	for (i = 0; i < gen->num_all_adcs; i++) {
+		int index;
+
+		adc_id = gen->all_adcs[i];
+
+		index = snd_hda_codec_read(codec, adc_id, 0, AC_VERB_GET_CONNECT_SEL, 0);
+		nids = snd_hda_codec_read(codec, adc_id, 0, AC_VERB_GET_CONNECT_LIST, 0);
+		nid = ((nids & (0xFF << (8*index))) >> (8*index));
+
+		if (nid < codec->core.start_nid || nid > codec->core.end_nid) {
+			codec_err(codec, "Error, invalid nid 0x%02x.\n", nid);
+			continue;
+		}
+
+		snd_hda_codec_write(codec, adc_id, 0, (0x370|(index&0xF)), 0x4A);
+		snd_hda_codec_write(codec, nid, 0, 0x370, 0x2);
+		codec_dbg(codec, "ADC 0x%02x, nid=0x%02x are set. Boost=2, gain=0x4A.\n",
+			adc_id, nid);
+	}
+}
+
+static void cxt_init_capture_boost_gain(struct hda_codec *codec)
+{
+	cxt_setup_capture_default_boost_gain(codec);
+}
+
 static int cx_auto_init(struct hda_codec *codec)
 {
 	struct conexant_spec *spec = codec->spec;
@@ -198,6 +232,9 @@ static int cx_auto_init(struct hda_codec *codec)
 	if (spec->is_cx8070_sn6140)
 		cx_fixup_headset_recog(codec);
 
+	if (codec->core.vendor_id == 0x14f120d1) //SN6180
+		cxt_init_capture_boost_gain(codec);
+
 	return 0;
 }
 
-- 
2.34.1

