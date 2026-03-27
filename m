Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2A62D8795;
	Fri, 27 Mar 2026 23:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774655746; cv=none; b=NGKMA30e6lJgi5zSJ0B4na7/FSQi685y/k7R0+Q/ZIUSBewFcPSMojk6ZEB8gU7wxcH/JDX7dimDoky62Ey+8p9mHtreG3lRIdMZCX7seh6TByypJPv7D9Ad1aRdN/Wv/z95zwhgLOWXMJXKUN4jSDISQjSWLtD8ZlHYQvEGfVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774655746; c=relaxed/simple;
	bh=msSo88lDNHsQ9ZS7LIKBWvmBhbFTVJT7/zYXxVXnI9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X508e8uwDzeXj9awzX/UCJVB5YOvkZGgoerhbTjpBQeu/wMyDqV91TQKxl0KLxYce3Z+F7giz2UqrBpjwn2EN9y75SJOWxtE3yJfsLu969yASl3cAzp8ollzWiExSrBkhzp9QnWzHPSwBbRF085sEs/m8gwr+BWqCG6GCnSGy8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowAAnzWhgF8dpMgFnCw--.7941S2;
	Sat, 28 Mar 2026 07:48:48 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: perex@perex.cz
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH] ALSA: asihpi: use scnprintf() for control name formatting
Date: Sat, 28 Mar 2026 07:48:48 +0800
Message-ID: <20260327234848.64134-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260323070310.55878-1-pengpeng@iscas.ac.cn>
References: <20260323070310.55878-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAnzWhgF8dpMgFnCw--.7941S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyUtFyfAw1DWFWkXw18Krg_yoW8tw4Upr
	W3GrWakrZxA3sIkayrt3s09r93Aa92kr47Gw1rWF1xJF1qvw17A3W8Z34UZFn8ur4kZrn8
	AFs0k345K3W5Zr7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbhvtt
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

asihpi_ctl_init() builds mixer control names in the fixed 44-byte
hpi_ctl->name buffer with sprintf().

This is not only a defensive cleanup. The current in-tree name tables and
format strings can already exceed 44 bytes. For example,

  "Bitstream 0 Internal 0 Monitor Playback Volume"

is 46 characters before the trailing NUL, so the current sprintf() call
writes past the end of hpi_ctl->name.

Switch the formatting to scnprintf() so the driver truncates control
names instead of overflowing the fixed ALSA control name storage.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/pci/asihpi/asihpi.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 3a64d0562803..de2859eb3e9f 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -1384,22 +1384,25 @@ static void asihpi_ctl_init(struct snd_kcontrol_new *snd_control,
 		dir = "Playback "; /* PCM Playback source, or  output node */
 
 	if (hpi_ctl->src_node_type && hpi_ctl->dst_node_type)
-		sprintf(hpi_ctl->name, "%s %d %s %d %s%s",
-			asihpi_src_names[hpi_ctl->src_node_type],
-			hpi_ctl->src_node_index,
-			asihpi_dst_names[hpi_ctl->dst_node_type],
-			hpi_ctl->dst_node_index,
-			dir, name);
+		scnprintf(hpi_ctl->name, sizeof(hpi_ctl->name),
+			  "%s %d %s %d %s%s",
+			  asihpi_src_names[hpi_ctl->src_node_type],
+			  hpi_ctl->src_node_index,
+			  asihpi_dst_names[hpi_ctl->dst_node_type],
+			  hpi_ctl->dst_node_index,
+			  dir, name);
 	else if (hpi_ctl->dst_node_type) {
-		sprintf(hpi_ctl->name, "%s %d %s%s",
-		asihpi_dst_names[hpi_ctl->dst_node_type],
-		hpi_ctl->dst_node_index,
-		dir, name);
+		scnprintf(hpi_ctl->name, sizeof(hpi_ctl->name),
+			  "%s %d %s%s",
+			  asihpi_dst_names[hpi_ctl->dst_node_type],
+			  hpi_ctl->dst_node_index,
+			  dir, name);
 	} else {
-		sprintf(hpi_ctl->name, "%s %d %s%s",
-		asihpi_src_names[hpi_ctl->src_node_type],
-		hpi_ctl->src_node_index,
-		dir, name);
+		scnprintf(hpi_ctl->name, sizeof(hpi_ctl->name),
+			  "%s %d %s%s",
+			  asihpi_src_names[hpi_ctl->src_node_type],
+			  hpi_ctl->src_node_index,
+			  dir, name);
 	}
 }
 
-- 
2.50.1 (Apple Git-155)

