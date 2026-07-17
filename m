Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495BD3033D6;
	Fri, 17 Jul 2026 05:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784266448; cv=none; b=HX1vSMTrpzy0s1BiQoo1SgCHci3SHCXwDnyiqRv9JmoEkD9UIigkeUD3R8sN9UlJu0dC2rC6Uq0FQ/EC/X+fVRFkrOojoZltTBu96JQVhnwgihbhEX632J8gztcsdP8JkcopqH0OuoYRTiQidYUpK4IMh3E4tzv4IH94gULb6OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784266448; c=relaxed/simple;
	bh=hlfuFgfXijMlBorYaZX/RiziFnsRa1GSQcAKNDJ0K0U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gY/zu1+EV38daAa1BIJYrYBnsyepPTKhhxbx1vCY1dZrvw8oDBjFaQ7mcQb6ANWTIVBrRF2QV5qQ8RRVT/+L/70f9+YD8K071vn2JXzlGhD07cxlRreqwEPlKzihje9Y12AoYCGzTLk8ea4dRPybbwI3cbWFpbiBj6LNe/UsYLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1a33565081a111f1aa26b74ffac11d73-20260717
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:10e74539-5b21-41ce-8e89-6f6efdff4f85,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:8f8bc80f47d8e5493e5035055386a82b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|850|865|898,TC:nil,Content
	:0|15|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1a33565081a111f1aa26b74ffac11d73-20260717
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1914686430; Fri, 17 Jul 2026 13:33:55 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bob Song <songxiebing@kylinos.cn>
Subject: [PATCH v3] ALSA: hda: Check snd_hda_power_pm construct error before executing verb
Date: Fri, 17 Jul 2026 13:33:36 +0800
Message-Id: <20260717053336.1149910-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260713020427.300628-1-songxiebing@kylinos.cn>
References: <20260713020427.300628-1-songxiebing@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bob Song <songxiebing@kylinos.cn>

When userspace writes 1 to /sys/bus/pci/devices/XX/remove to remove HDA PCI device,
the HDA hardware control path is shut down and devres unmaps the BAR virtual address
bus->remap_addr automatically during driver removal.

If a delayed HDA verb command arrives after the MMIO region is unmapped, the driver
will access invalid virtual addresses and trigger a page fault splat.

So add an error check right after constructing snd_hda_power_pm:

Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
Changes in v3:
- Just use bus->core.chip_init for check
Changes in v2:
- Modify the judgment from pm_runtime_datus_stuspended to bus->core.chip_init
---
 sound/hda/common/codec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index ef533770179b..1af640148e90 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -39,6 +39,12 @@ static int call_exec_verb(struct hda_bus *bus, struct hda_codec *codec,
 	int err;
 
 	CLASS(snd_hda_power_pm, pm)(codec);
+	if (!bus->core.chip_init) {
+		codec_warn(codec,
+			   "Failed to send cmd 0x%x ret=[%d], hda control not init\n",
+			   cmd, pm.err);
+		return pm.err;
+	}
 	guard(mutex)(&bus->core.cmd_mutex);
 	if (flags & HDA_RW_NO_RESPONSE_FALLBACK)
 		bus->no_response_fallback = 1;
-- 
2.25.1

