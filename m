Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8F27261C;
	Sat, 28 Mar 2026 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774693702; cv=none; b=nCbICh9tk22oEZ1RdLzcTjDDLmPC1zUpsW9xYtQQXdwt9ePb/6KZNdKi8odP0yWXJg0RiB6QfGGwH4KAtrc4TlTV803bh8fbX/lm9A+aY93G4gAD9nRAI2FvF57HbmH8GsmFbQobuqGyJFC3HML0XYqZXup+19xGuGKKFn0lo6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774693702; c=relaxed/simple;
	bh=XO2lVGOvKUuNdpn3633xk6HNwVV+ybTW1oRD2R/sShU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwRtJlJjAhQg4xrNRylBKjtfTfsER47FL5VATkbQtxd4bFFawKjND6sV5g/i8Bt5ve1AUxu2+fatDPUE25SQLqEdmQMYQqMQNoK40uztbpVGY8zyXZbYcbFmzq33ZlAnmkTHf1Pvh0GcrntpLpTErFcWhQSbBSaUYE3BQgcYECw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-05 (Coremail) with SMTP id zQCowAAHlwo5rcdpHhu_Cw--.35011S2;
	Sat, 28 Mar 2026 18:28:10 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: perex@perex.cz
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH v3] ALSA: asihpi: detect truncated control names
Date: Sat, 28 Mar 2026 18:28:08 +0800
Message-ID: <20260328102808.33969-1-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:zQCowAAHlwo5rcdpHhu_Cw--.35011S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCry7XF1kCrW3JFWfCFyxAFb_yoW5Cw4UpF
	W3KrW2krsxA3s8Kayftryq9r93Aa92kF4UG3WrWF1xJFnIvw17A3W8Zw18ZFy5urWkZrn8
	XF4Yk345K3W5Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuHq7UUUU
	U==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

asihpi_ctl_init() builds mixer control names in the fixed 44-byte
hpi_ctl->name buffer with sprintf().

This is not only a defensive cleanup. The current in-tree name tables and
format strings can already exceed 44 bytes. For example,

  "Bitstream 0 Internal 0 Monitor Playback Volume"

is 46 characters before the trailing NUL, so the current sprintf() call
writes past the end of hpi_ctl->name.

The generated control name is used as the ALSA control element key, so
blindly truncating it is not sufficient. Switch the formatting to
snprintf() and emit an error if truncation happens, showing the
truncated name while still keeping the write bounded to hpi_ctl->name.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
v3:
- use snprintf() instead of scnprintf()
- check the return value and report truncated control names

v2:
- clarify that the current in-tree strings can already overflow the buffer
- use scnprintf() instead of sprintf()
- drop the unrelated trailing whitespace change

 sound/pci/asihpi/asihpi.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 3a64d0562803..b7010d83e89c 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -1362,6 +1362,7 @@ static void asihpi_ctl_init(struct snd_kcontrol_new *snd_control,
 				struct hpi_control *hpi_ctl,
 				char *name)
 {
+	int len;
 	char *dir;
 	memset(snd_control, 0, sizeof(*snd_control));
 	snd_control->name = hpi_ctl->name;
@@ -1384,23 +1385,30 @@ static void asihpi_ctl_init(struct snd_kcontrol_new *snd_control,
 		dir = "Playback "; /* PCM Playback source, or  output node */
 
 	if (hpi_ctl->src_node_type && hpi_ctl->dst_node_type)
-		sprintf(hpi_ctl->name, "%s %d %s %d %s%s",
-			asihpi_src_names[hpi_ctl->src_node_type],
-			hpi_ctl->src_node_index,
-			asihpi_dst_names[hpi_ctl->dst_node_type],
-			hpi_ctl->dst_node_index,
-			dir, name);
+		len = snprintf(hpi_ctl->name, sizeof(hpi_ctl->name),
+			       "%s %d %s %d %s%s",
+			       asihpi_src_names[hpi_ctl->src_node_type],
+			       hpi_ctl->src_node_index,
+			       asihpi_dst_names[hpi_ctl->dst_node_type],
+			       hpi_ctl->dst_node_index,
+			       dir, name);
 	else if (hpi_ctl->dst_node_type) {
-		sprintf(hpi_ctl->name, "%s %d %s%s",
-		asihpi_dst_names[hpi_ctl->dst_node_type],
-		hpi_ctl->dst_node_index,
-		dir, name);
+		len = snprintf(hpi_ctl->name, sizeof(hpi_ctl->name),
+			       "%s %d %s%s",
+			       asihpi_dst_names[hpi_ctl->dst_node_type],
+			       hpi_ctl->dst_node_index,
+			       dir, name);
 	} else {
-		sprintf(hpi_ctl->name, "%s %d %s%s",
-		asihpi_src_names[hpi_ctl->src_node_type],
-		hpi_ctl->src_node_index,
-		dir, name);
+		len = snprintf(hpi_ctl->name, sizeof(hpi_ctl->name),
+			       "%s %d %s%s",
+			       asihpi_src_names[hpi_ctl->src_node_type],
+			       hpi_ctl->src_node_index,
+			       dir, name);
 	}
+
+	if (len >= sizeof(hpi_ctl->name))
+		pr_err("asihpi: truncated control name: %s\n",
+		       hpi_ctl->name);
 }
 
 /*------------------------------------------------------------
-- 
2.50.1 (Apple Git-155)

