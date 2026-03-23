Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33C435BDB8;
	Mon, 23 Mar 2026 07:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774249478; cv=none; b=fMdn+XrDmN8wWaxnuUDyD/PzxrhE1OCADxnB8bsuduKcx8kYfr7KrdwY5noKQMR6rArmDvCuO+t66LIBzmGuKZRqkHTbBpCa0zpLsj2z2RiyTPomgj+tgONIz7JRITmqFjshRhKiG34y1ll4tk1k4a6pz+SBCWB7X5IjbmNSSn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774249478; c=relaxed/simple;
	bh=/PtdrSsaCQLiRQ8hnSlr2lVKwAaAbWGu1JeUFa9H2No=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OdtHyP9aXE5Kc+PmsTl4SkPFXmAk04PIqbB7RbkoixnmG7JJS4EO/7Jggh4PAdpJHhtY95IIgPhBijn0Xjmt6okcSiPh2PxdRJiwebv4D8a2yVyy6RN8Bgot8gaDk/PmU+NZIG3WLPx/NiMV/s8OM0PZilADyrZKDFU7Zmv1bfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowABXZ86u5cBpMQWGCw--.33207S2;
	Mon, 23 Mar 2026 15:03:11 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: perex@perex.cz
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH 1/7] ALSA: asihpi: bound control name formatting
Date: Mon, 23 Mar 2026 15:03:10 +0800
Message-ID: <20260323070310.42827-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABXZ86u5cBpMQWGCw--.33207S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AryrWw17JrykKFW7uw13CFg_yoW8uF18pF
	y7GrW2krsxA3s0kayrtryq9r93Aa92kr47Gw1rWF1xJFn0vw12y3W8Zw1UZFn8ur4v9r15
	uFs0kr15K3W3Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
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
hpi_ctl->name buffer, but it currently does so with sprintf(). Some
source/destination node names are already long enough that combining both
endpoints, their indices, the direction prefix, and the control name can
run past the end of the buffer.

Switch the formatting to snprintf() so the driver never writes past the
ALSA control name storage.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/pci/asihpi/asihpi.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 3a64d0562803..f8bcc05c8742 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -1384,22 +1384,25 @@ static void asihpi_ctl_init(struct snd_kcontrol_new *snd_control,
 		dir = "Playback "; /* PCM Playback source, or  output node */
 
 	if (hpi_ctl->src_node_type && hpi_ctl->dst_node_type)
-		sprintf(hpi_ctl->name, "%s %d %s %d %s%s",
+		snprintf(hpi_ctl->name, sizeof(hpi_ctl->name),
+			 "%s %d %s %d %s%s",
 			asihpi_src_names[hpi_ctl->src_node_type],
 			hpi_ctl->src_node_index,
 			asihpi_dst_names[hpi_ctl->dst_node_type],
 			hpi_ctl->dst_node_index,
 			dir, name);
 	else if (hpi_ctl->dst_node_type) {
-		sprintf(hpi_ctl->name, "%s %d %s%s",
-		asihpi_dst_names[hpi_ctl->dst_node_type],
-		hpi_ctl->dst_node_index,
-		dir, name);
+		snprintf(hpi_ctl->name, sizeof(hpi_ctl->name),
+			 "%s %d %s%s",
+			 asihpi_dst_names[hpi_ctl->dst_node_type],
+			 hpi_ctl->dst_node_index,
+			 dir, name);
 	} else {
-		sprintf(hpi_ctl->name, "%s %d %s%s",
-		asihpi_src_names[hpi_ctl->src_node_type],
-		hpi_ctl->src_node_index,
-		dir, name);
+		snprintf(hpi_ctl->name, sizeof(hpi_ctl->name),
+			 "%s %d %s%s",
+			 asihpi_src_names[hpi_ctl->src_node_type],
+			 hpi_ctl->src_node_index,
+			 dir, name);
 	}
 }
 
@@ -2957,4 +2960,3 @@ static void __exit snd_asihpi_exit(void)
 
 module_init(snd_asihpi_init)
 module_exit(snd_asihpi_exit)
-
-- 
2.50.1 (Apple Git-155)

